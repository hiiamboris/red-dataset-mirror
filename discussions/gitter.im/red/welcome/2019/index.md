# Archived messages from: [gitter.im/red/red/welcome](/gitter.im/red/red/welcome/) from year: 2019

## Tuesday 1st January, 2019

AiguyGary\_twitter

[20:25](#msg5c2bccb2babbc178b2111fe7)Is there an example of Red script that can call a web service like this?

ne1uno

[20:52](#msg5c2bd2fababbc178b211417a)you would still need to play the wav. this would be more direct, but obviously will have some delay. jocko's Text to Speech experiment. https://pastebin.com/p9CQSkXZ

AiguyGary\_twitter

[20:53](#msg5c2bd33637975e7ca95b29f3)I was curious as to whether it is possible to overload the "+" plus sign operator in Red to concatenate two stings like this  
&gt;&gt; A: "This is the first part"  
\== "This is the first part"  
&gt;&gt; B: "This is the second part"  
\== "This is the second part"  
&gt;&gt; print A + B  
\*\** Script Error: + does not allow string! for its value1 argument  
\*\** Where: +  
I know that the rejoin word allows you to do this but the plus sign "+" feels more natural coming from other languages and requires less keystrokes in most cases. It other languages this is known as operator overloading and is useful for operating on user defined data types. I searched the doc file for overloading but did not get any hits so I just wondered if it was possible.

[21:42](#msg5c2bdede37975e7ca95b767d)@ne1uno I found this voice utility https://elifulkerson.com/projects/commandline-text-to-speech.php

ne1uno

[21:51](#msg5c2be0f137975e7ca95b8484)probably less delay than powershell too, nice find.

AiguyGary\_twitter

[21:52](#msg5c2be1262863d8612bc31e45)It should allow me to write what I want spoken out loud to a file and then kick off a command to powershell .\\voice.exe -k say.txt to execute it. Sounded pretty good when I ran the command in the powershell console manually. Not sure if there will be a lag though. I'll just have to try it and see.

greggirwin

[22:16](#msg5c2be6d98dafa715c72947bf)&gt; I was curious as to whether it is possible to overload the "+" plus sign operator in Red to concatenate two stings

@AiguyGary\_twitter, we won't encourage that. You can make new infix ops (see https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#define-infix-operators), but you should first understand how actions work for datatypes, as compared to operator overloading in other languages.

\*Technically* you could do it, but please don't (except to see how it could be done). Any short term gains you think might come of it have to be balanced against the overall language design. Consider all the problems other langs suffer from this type of overloading, and the bugs they can lead to.

endo64

[22:32](#msg5c2bea7492cf4d22422c5742)&gt; @ne1uno I found this voice utility https://elifulkerson.com/projects/commandline-text-to-speech.php

Espeak is also a nice: http://espeak.sourceforge.net/

## Thursday 3th January, 2019

virtualAlan

[00:39](#msg5c2d59ba33e089363b36a1fd)@AiguyGary\_twitter yeah - there's plenty SAPI stuff on my site: http://www.mycode4fun.co.uk/red-apps - you'll need to scroll down to find it: 'the glamour model quiz ' and 'talking alarm clock' - also some more here: http://www.mycode4fun.co.uk/About-Red-Programming

GaryMiller

[14:20](#msg5c2e1a290b7fc97caae17d10)@virtualAlan Thanks Alan! I got mine working with no lag. But I still require the extra executable to call to do the actual speech. Maybe someday Red will have that build in and I can eliminate the extra execuatle though. That's why I love Red, the tool chain can't get much simpler.

## Tuesday 8th January, 2019

travishinkelman\_twitter

[23:13](#msg5c352e8daac7082e6ff5b956)I've started playing around with Red using the Red extension (0.2.2) to Visual Studio Code (1.30.2) on a Mac (macOS Mojave 10.14.2). For some reason, this apparently opens two sessions/instances (sorry, I don't know the right jargon) of the Red console. One of them is terminated when I close Visual Studio Code, but I have to force quit the other one. It's only a minor annoyance but I'm wondering if it is diagnostic of a mistake that I made when setting everything up.

[23:13](#msg5c352e965ec8fe5a85226b06)\[!\[Screen Shot 2019-01-08 at 2.56.29 PM.png](https://files.gitter.im/red/red/welcome/1Yoo/thumb/Screen-Shot-2019-01-08-at-2.56.29-PM.png)](https://files.gitter.im/red/red/welcome/1Yoo/Screen-Shot-2019-01-08-at-2.56.29-PM.png)

gltewalt

[23:35](#msg5c3533d6aac7082e6ff5de59)@qtxie

qtxie

[23:43](#msg5c3535851948ad07e80d3048)@bitbegin is working on the vscode plugin right now. He knows more about it. So I let him to handle this issue.

gltewalt

[23:43](#msg5c3535ab82a6c30b90a7a6e5)Ok

qtxie

[23:52](#msg5c3537bb1d1c2c3f9ce2c446)@travishinkelman\_twitter What the steps to reproduce the issue?

travishinkelman\_twitter

[23:59](#msg5c353966bd592b2e6e7389a7)Hmmm...good question. My steps are to open vscode and open a small example Red script (e.g., simple calculator app). Opening a Red script in vscode launches the two Red consoles. Sorry, I know that is not much to go on and I realize that this just might be a quirk related to my system.

## Wednesday 9th January, 2019

bitbegin

[01:46](#msg5c355271357dd7655d3ba605)i can reproduce this issue

## Thursday 10th January, 2019

gour

[09:14](#msg5c370cf4783a5553d80eeb11)morning. just read reddit post about Red vs Racket and then tried to check few links about the current status of Red...am I right that 64bit support (for e.g. Linux) will arrive in the form of Red/Pro first, while for 'community' it won't happen before 'next year' ?

rebolek

[09:16](#msg5c370d63b35a0877665bd496)@gour that's what was stated in latest blog article, so you can assume it's probably correct

gour

[09:20](#msg5c370e705aa04d46c589100a)@rebolek thanks...is GTK branch usable on Linux? writing gui apps and 64bit support are things i'm mostly interested in, but, it seems that, unfortunately, top priorities are elsewhere :-(

rebolek

[10:18](#msg5c371c0cb35a0877665c375a)@gour see https://gitter.im/red/GTK room for more info about GTK status

## Friday 11st January, 2019

chrhlnd

[06:46](#msg5c383bab317e2407cd136d60)had a question, I want to link to a dll on windows.. using Red\\System but then I want to call it from Red view code is there a way to do this? Or have both types in the same file?

greggirwin

[06:51](#msg5c383cd65aa04d46c590d362)Yes, the `routine` keyword is for that very purpose. So you can write the R/S code, then write a `routine` that is callable from Red, and all the marshaling is handled for you. https://github.com/red/code/blob/master/Scripts/mandelbrot-fast.red is one example of using routines.

Because of the R/S element, the code has to be compiled, and can't be run interpreted. In the future, there will be an FFI interface in Red as well.

chrhlnd

[06:51](#msg5c383d05dfe1332820312c61)ok thanks

## Sunday 13th January, 2019

ghost~5c3ac466d73408ce4fb47a82

[04:55](#msg5c3ac4c0cb47ec3000357634)Hi there, sorry to bother you all but I have to do a general presentation on Red for a scripting language class, and need to demo some code. What is a piece of code that's pretty cool and I could demo for the class that shows off Red's strengths?

[04:55](#msg5c3ac4d495e17b45254265a6)Also, is there some reading material about what Red is built for/excells at?

gltewalt

[05:00](#msg5c3ac6041cb70a372acdaa9d)https://github.com/red/code

[05:02](#msg5c3ac658dab15872ce870d2b)https://www.red-lang.org/p/about.html

ghost~5c3ac466d73408ce4fb47a82

[05:06](#msg5c3ac75eba5936605bafbc30)Thank you very much @gltewalt! Also, nice derp cat profile pic

gltewalt

[05:07](#msg5c3ac79828513d605a1a0597):+1:

CodingFiend\_twitter

[06:11](#msg5c3ad68d0999400604e1eb38)Okay gang, perhaps a red expert can help list some specific advanced features that Red has, and fill in the gaps in this table

[06:11](#msg5c3ad69c9fa58135b5592e00)| Next Gen Language competitive landscape Q1 2019 | | | | |  
|----------------------------------------------------|-------|---------|------|-----|  
| (all features given a score from 0 to 10) | | | | |  
| General Features | Beads | Swift 4 | Luna | Red |  
| Precise specification (EBNF grammar, user manuals) | 5 | 10 | 1 | 3 |  
| Community | 0 | 10 | 2 | 4 |  
| Compiler quality | 5 | 10 | ? | 8 |  
| Interpreter quality | 0 | 10 | ? | 8 |  
| Debugger | 2 | 8 | ? | ? |  
| Language simplicity (0=bad 10=good) | 8 | 2 | ? | 5 |  
| | | | | |  
| Specific Features | Beads | Swift 4 | Luna | Red |  
| No objects | 10 | 0 | ? | ? |  
| Data structuring power | 10 | 4 | ? | ? |  
| Separate compilation of modules | 10 | 0 | ? | 0 |  
| Physical units of measurement | 10 | 0 | 0 | 0 |  
| Pointer protection | 10 | 0 | ? | ? |  
| Code layout consistency mandated | 10 | 0 | ? | ? |  
| Core API Simplicity and regularity | 10 | 3 | ? | ? |  
| Automatic refresh of dependent blocks | 8 | 0 | 0 | 0 |  
| Integrated database | 8 | 0 | 0 | 0 |  
| Coding in small chunks | 8 | 2 | ? | 8 |  
| Operating system independence | 8 | 2 | ? | 8 |  
| Fault-tolerant protected arithmetic | 8 | 0 | ? | ? |  
| Regular expression processing | 9 | 2 | ? | ? |  
| String comprehensions | 8 | 8 | ? | ? |  
| Conditional compilation, pre-processor | 8 | ? | ? | ? |

[06:13](#msg5c3ad6ec1cb70a372ace0a79)does red have objects? can you compile modules separately (it would need Modula-2 like .MSYM files which define the symbols, without having access to the other module's source code).

[06:13](#msg5c3ad7040999400604e1ee86)does red use objects (i.e. is there a NEW xxx operation like in Java?

[06:15](#msg5c3ad77328513d605a1a555b)This is my own attempt to keep a scorecard on the new languages so that in the spirit of friendly competition we can see where things stand. Of course some would argue having objects is a good thing, but a true next gen language will very likely ditch the OOP paradigm, else why bother leaving Java behind?

greggirwin

[06:39](#msg5c3add26dab15872ce8782ae)&gt; What is a piece of code that's pretty cool and I could demo for the class that shows off Red's strengths?

@bmighall as Red is quite flexible, and wide-ranging, if there's a specific type of functionality you want to focus on (dynamic code, GUIs, etc.), we can point to, or draft up, more help.

[06:42](#msg5c3adddc39596c372bd31a9f)@CodingFiend\_twitter

&gt; Does red have objects?

Yes. Prototype based. Like Self, not like Java.

&gt; Can you compile modules separately?

Not yet. Modules are due in 0.8.0, and one of the important design aspects is modular compilation. Strictly interpreted modules would be easier.

[06:43](#msg5c3ade1c35350772cf228fdf)Is Beads available now?

[06:54](#msg5c3ae0b6ba355012a42e985d)&gt; Data structuring power

I'd give Red a 10 here, because of the wide range of datatypes, and blocks that contain them, along with objects, maps, and vectors, for specific needs and meaning.

&gt; Code layout consistency mandated

Red is probably a 2 or 3 here, as we only require whitespace for lexical purposes. Beyond that, you can format your Red in any way that best expresses the intent in the given domain.

&gt; Core API Simplicity and regularity

Languages don't have an API, IMO. They \*are* an API.

&gt; Fault-tolerant protected arithmetic

Not sure what this means. No errors ever? NaNs?

&gt; Regular expression processing

We have `parse`, which we think is much better, but @toomasv also wrote a regex engine in `parse`, for people who want to use them.

&gt; Conditional compilation, pre-processor

https://doc.red-lang.org/en/preprocessor.html

&gt; String comprehensions

Don't understand. String interpolation, list comprehensions, or something else?

endo64

[08:24](#msg5c3af5d38318994524e036e3)@bmighall Also look at https://github.com/red/community for some demos &amp; games.

CodingFiend\_twitter

[09:44](#msg5c3b088cc45b986d11528848)by string comprehensions i mean what Swift has which allows expressions in a string to be evaluated. In Swift you say "Total = ${total}" and it will do the substitution of the automatically converted to string type of the variable total, and pasting it inside. Python has a slightly more cumbersome notation where you "xxxx" % (term1, term2, ...)

[09:45](#msg5c3b08c7c45b986d11528914)There is a big gulf between languages with both drawing and database functions inside the language vs. languages like Java and Python which must call function libraries to achieve this functionality. The more self-contained the language, the more durable it is.

[09:46](#msg5c3b090f32a8370605c3cb76)Fault Tolerant arithmetic is a very advanced feature where you go beyond the restrictions of the poorly designed IEEE floating point, and extend the arithmetic to force it to be closed. Also eliminates silent truncations, overflows.

[09:49](#msg5c3b09a21cb70a372acf2413)If you have objects with a NEW operator, then you cannot have a pointer to an object before it is created. This is the fatal flaw of Java that few understand. All those null pointer exceptions are the result of the inability to reference an object before its initialization.

[09:50](#msg5c3b09e6cb47ec300037007e)By data types i mean things like Neo4J relationships, and generalized graph structures vs. simplistic arrays and lists. So i wouldn't give Red a 10 at all. It does not posess a graph database architecture.

[09:55](#msg5c3b0b039fa58135b55a55f3)i am building a set of reference applications, with all the supplied resources and a super tight specification of a nice progression of graphical interactive applications, starting with an analog clock, to a wristwatch, to snake, tictactoe, and chess to allow people to compare apples to apples between languages. The simplest programs all look almost identical in most languages, but by the time you get past 150 word programs to 1500 word programs like Chess the code looks very different. Shows how much difference a syntax makes. People drastically underestimate how important the selection of language is. I freely admit that Red for crypto contracts will be absolutely the top language, as it leverages all of Red's key strengths; self-containment, compactness, and symbolic combining power. But i know your ambitions for Red far surpass a small sliver of the programming space.

[09:58](#msg5c3b0bc635350772cf2392ee)And languages do have an API; they have a standard library which is OS independent, and depending on how far their standard library goes you might not interact with the OS at all. In the area of multimedia graphical applications, a good standard library reduces the amount you have to learn by 5x at least, so it is a very important thing. The original C standard library basically set the boundary for portable C code, and because the standard C library could only do file stream operations, and had no graphical primitives at all, it meant that C code was forever tied closely to the OS, and thus non-portable.

[10:00](#msg5c3b0c3535350772cf2394ad)In some advanced languages, pointers are treated very differently than in Java. In fact, OOP has so permeated the consciousness of people that they can't imagine another way exists. But yes, Virginia, there is life beyond NEW and null pointer exceptions,.

9214

[11:23](#msg5c3b1fbbdab15872ce8906c9)&gt; Precise specification (EBNF grammar, user manuals)

\[Draft of Red spec](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc), \[Red/System spec](https://static.red-lang.org/red-system-specs.html). Documentation and manuals are pending, but we'll get there.

&gt; Community

What that metric means? How am I suppose to measure it? Number of members? Friendliness? Number of regular contributors? Number of active community hubs?

&gt; Compiler / interpreter quality

And how did you measure \*that\*?

&gt; Debugger

Don't have one yet.

&gt; Language simplicity

This is purely subjective and biased. J is simple to me, but I bet it won't to you. Again, how it was measured? Have you ever programmed in any of these languages (long enough) to make such assesments and go as far as to make comparisons between them?

&gt; No objects

We have objects and prototype-based OOP, but they are usually treated as environments (i.e. namespaces) and reactive sources. No `new`, inheritance, null pointers and whatnot.

&gt; Data structuring power

~50 literal datatypes. This + \[reactive framework](https://doc.red-lang.org/en/reactivity.html) can be used to model a fairly expressive GDB.

&gt; Separate compilation of modules

Not yet.

&gt; Physical units of measurement

You mean SI units? Nope. We can roll out a dialect for that though.

&gt; Pointer protection

We don't have pointers.

&gt; Code layout consistency mandated

No idea how you want to mandate code layout in a free-form, homoiconic language creatied with DSLs in mind. We have an \[official style guide](https://doc.red-lang.org/en/style-guide.html) to which contributors are expected to abide. No linter, I doubt we'll ever have it.

&gt; Core API Simplicity and regularity

Uhm. OS-specific backends and low-level parts are far from simple (as far as C goes), but underlying core model is rather regular. See \[this HN comment](https://news.ycombinator.com/item?id=18866864) for details. A lot of batteries are included into standard library, and toolchain is small (~1MB) and self-contained.

Again and again, how did you measure that? Where are metrics? How evaluation process was carried out?

&gt; Automatic refresh of dependent blocks

No idea what that means.

&gt; Integrated database

Nope.

&gt; Coding in small chunks

This and emphasis on embedded DSLs should give us 9 at the very least.

&gt; Operating system independence

Hard to imagine any practical language absolutely independed from hosting OS, unless we're talking about virtual machines. Red has OS-specific backends and targets many platforms though.

&gt; Fault-tolerant protected arithmetic

Nope.

&gt; Regular expression processing

We have PEG-based meta-DSL called Parse, which is strictly more powerful than regular expressions (Context-free vs. regular languages). So you should give us 11 :wink:

&gt; String comprehensions

Hardly ever needed, given that language is homoiconic. You can roll out your own pretty easily though (@greggirwin has a couple of examples).

&gt; Conditional compilation, pre-processor

Yes, we have preprocessor and macros, both in Red and in Red/System.

&gt; People drastically underestimate how important the selection of language is.

People drastically overestimate the usefulness of such check-lists, and have no idea how much harm they may cause, esp. without detailed descriptions of evaluation process and rationale behind every score assigned. Micro-benchmarking comes to mind.

&gt; i am building a set of reference applications

To make a fair comparison, your "application set" should be written by language experts, with multiple versions, each elaborating different approach and leveraging one or more key features of a given language. I wouldn't bother to check tic-tac-toe written by Swift newbie, or draw any conclusions about language from it. Doing my own research sounds way better.

&gt; spirit of friendly competition

\[This](https://www.reddit.com/r/redlang/comments/aebxct/contrast\_red\_with\_racket/edoerll/) can qualify as a "friendly competition". Numbers you've put in table cells, without supplied line of reasoning, are IMO too far from that.

[11:30](#msg5c3b213b95e17b4525446512)Ah, I see from \[where](http://www.e-dejong.com/the-beads-project/) "objective" evaluation comes and why Beads scored so highly (even without publicly available release)...

meijeru

[17:55](#msg5c3b7b8139596c372bd6b726)@CodingFiend\_twitter Beads sounds fascinating. Can we have a link please? And I don't mean to the examples, I found those myself, but to what is \_behind_ those examples, namely some (any, even partial) implementation sources.

CodingFiend\_twitter

[20:17](#msg5c3b9cbfc45b986d1156298f)I will add some more lines to the list, so that the super powerful Parse subsystem of Red is properly credited. I consider that the most useful and powerful feature of Red, because so few other languages have this type of thing built in. Rolling your own is an extremely difficult task, as that kind of program requires an exactitude and precision that is indeed very difficult.

[20:17](#msg5c3b9cf332a8370605c7645f)Nothing objective at all about my scoring, it is merely my opinion. But then it is based on 80,000 hours of programming and dozens of products built, so it is at least an informed opinion.

[20:22](#msg5c3b9dea28513d605a1f009c)Automatic refresh of dependent blocks on the screen is a very important feature in graphical interface programming. When you have a giant screen up , with a 1000 different widgets, and you change some part of the model, how do you know what part of the screen model to redraw? if you have to redraw the whole model your system will crawl, as generating all those cute graphics is quite intensive. There are some languages which track which thing depends on what (Excel being the most commonly used), and in Excel if you change one value in the model, all dependent cells are automatically recalculated. If you step back, this is one of the killer features of Excel. Clearly Red has not yet considered this, but I am sure you will tackle it eventually, as a lot of bugs in graphics programming related to overdrawing and underdrawing.

[20:26](#msg5c3b9eee8318994524e43d7f)What i mean by integrated database is like Neo4J's Cypher language, which allows you to manipulate records in the database which is live running without resorting to external API's. in PHP you can access MySQL so conveniently that it doesn't feel so foreign. A lot of people use PHP for that reason. But in the case of Neo4J for example, if you use some other language to control it like Python, the concepts in the graph database don't exist in Python, so you can't work smoothly. You can think of this like an impedance mismatch in an electrical system, any external database might not match the internal datatypes and arithmetic system of your core language. Red is crying out for a database in my opinion, because it has all these primitive types few of which exist in any existing database, so how to you store and manipulate individual items; flat files with serialization is so 70's.

[20:28](#msg5c3b9f7939596c372bd79c6d)String comprehensions have a reason for existence in Swift. In Swift you are very commonly internationalizing your code, and a literal with "the total is ${sum}" can be put into a string table for translation purposes. Without string comprehensions (and some string extraction/translation table) support you are in big trouble making localized products. I will add this to the checklist; for iphone and android app developers this is a must-have as localization of mobile apps is extremely common.

dsunanda

[20:30](#msg5c3b9fcacb47ec30003ab1ac)Red will automatically update an on-screen field if its data changes. You can link togeter fields so if one value changes, the related ones do to -- See Red Reactors:  
https://www.red-lang.org/2016/03/060-red-gui-system.html

9214

[20:34](#msg5c3ba0e939596c372bd7a50c)@CodingFiend\_twitter as was mentioned many times before, Red has a reactive framework. Quite basic (not an FRP style), but sufficient at least for usage in View engine and generic code. As for integrated DB - I think at some point it was discussed, but I can't really recall the details. @greggirwin ? The same about localization, it's all preliminary at this point, but it is certainly considered.

CodingFiend\_twitter

[20:44](#msg5c3ba31995e17b452547a352)One thing that is quite varying in the new language space is the amount of effort placed on drawing the screen. Some languages expect to emit HTML (like Elm), and others draw to the screen using standard library calls (like draw\_rect, draw\_oval, etc.), and others just assume some external OS-dependent API set. In beads are offering a platform neutral 2D drawing system in the first cut. I believe that Nenad is working on Red's drawing system, and of course once you add drawing to Red, then you have the issue of who is controlling what is redrawn per frame. In a GPU-based drawing system the GPU is refreshing the display list every frame, but then you again have the issue of who is figuring out what part of the GPU's data structures need to be rebuilt. Game people spend tons of time optimizing redrawing, it is a major preoccupation of games to keep their frame rates steady and high. With the early focus of blockchain contracts which have no UI needs, i don't expect Red to develop in this area as quickly, but since Red is so powerful and general, sooner or later this will take shape. I think one of the areas that Red could work on is describing the standard libraries as part of the language spec so that you know they are fixed and guaranteed to be available; the C language really wouldn't have gotten anywhere without their standard libraries.

[20:50](#msg5c3ba486c45b986d1156574f)Thanks for the link to the red VID. No question that this design is far ahead of what is in Elm for example, which does not do automatic refresh. The ill-fated Eve project never addressed this, and consequently the more objects you had on the screen the slower it would run, because with high resolution screens today you can spend a lot of time drawing. Leaving the chore of calculating which part of the screen is dirty puts a very heavy load on a graphics programmer, and leads to many underdraw/overdraw bugs, which either sap performance or leave you with glitches. I do however foresee some great difficulties in adapting the VID system to JS/HTML, as the HTML/JS/CSS mess is a nightmare to program on, and the two-way binding that Red offers isn't going to be easy to implement because HTML is an abominable one-way system, a kind of brain-damaged Display Postscript.

[20:52](#msg5c3ba525ba355012a4335a31)Swift has the best localization tools and system extant, but you can imagine that Apple which publishes in over 20 languages would have a good one. MS is no slouch on this either, however, it did localization 25 years ago, and still relies on string tables. Swift's localization methodology is very complete, well worth imitating.

9214

[20:55](#msg5c3ba5c195e17b452547b176)Thanks @CodingFiend\_twitter, lots of good info to digest.

CodingFiend\_twitter

[21:25](#msg5c3bace11cb70a372ad3112f)I don't quite understand how Red can survive without pointers. If you have an array of an array of records, and you want to point to a specific record for some sub-function to work on, you want to pass a single thing, a pointer, to that subfunction which tells it where to work. If you don't have pointers, and you are in a complex tree, passing multiple subscripts and subfields would be difficult. Surely red must have an analog of a pointer, perhaps i just don't understand the language enough to map the concept. Even in C you had this, where you could take the address of a vector\[3].customer. info.creditcard\[2] for some subfunction to work with. Among the many purposes of pointers is the extremely important feature of providing data isolation.

pekr

[21:26](#msg5c3bacf5ba355012a4338e8f)There is some example of different aproach - a graph based system, called Liquid, which was done for R2 by Maxim, old time reboller. Max worked in the film industry before coding, or something like that, and often mentions Apple's Shake system. So apparently, it can be done.

9214

[21:31](#msg5c3bae19c45b986d11569658)@CodingFiend\_twitter Red is homoiconic, and it's internal data format uses pointers. However, each value in a language is passed as a single boxed structure, which may or may not contain pointers to external buffers, which may or may not be used (depends on how value is treated). I rather meant that in Red we don't have pointer arithmetic and (de)referencing, but indirection (what "dereferencing" actually means) plays an important role, only at symbolic level. Red/System has pointers of course.

CodingFiend\_twitter

[21:47](#msg5c3bb1f3cb47ec30003b18cd)It is a very important part of the next gen initiative to usher in the era of interchangeable parts. DSL's are a kind of interchangeable part, so they have a role to play, but without pointers, how can one send a work area to a sub-function so that the subfunction can only access that storage area, perhaps to update a field. This was the may Modula-2 was able to succeed at solving many reliability problems, by declaring that a function took for example a pointer to a record type, and the called function could only reference and change the fields in the records given. Typed pointers are a way of enforcing a precisely limited scope to a subfunction. How does Red achieve this function then?

9214

[21:55](#msg5c3bb3bb28513d605a1f8a48)@CodingFiend\_twitter as I said, pointers are implicit, and each value is represented internally as a structure tagged with type ID. We use blocks (relative expressions) as a medium of exchange, and words (symbolic values I've mentioned) to imply the "scope" to a function - so embedded DSLs come at a cheap price. I'm not an expert on FFI and interchangeable parts in the context of libraries and modules, so can't comment on that.

greggirwin

[22:21](#msg5c3bba04ba355012a433d8e5)&gt; by string comprehensions i mean what Swift has which allows expressions in a string to be evaluated. In Swift you say "Total = ${total}" and it will do the substitution of the automatically converted to string type of the variable total

https://gist.github.com/greggirwin/d40a0e3b4c8de31a7d3b82695b9b4b03 `Composite` could become a standard function.

&gt; Fault Tolerant arithmetic is a very advanced feature where you go beyond the restrictions of the poorly designed IEEE floating point, and extend the arithmetic to force it to be closed. Also eliminates silent truncations, overflows

References? The above is still broad and vague to me.

&gt; If you have objects with a NEW operator, then you cannot have a pointer to an object before it is created

You lost me here. You can't refer to something that doesn't exist, disregarding lazy systems.

&gt; By data types i mean things like Neo4J relationships, and generalized graph structures vs. simplistic arrays and lists. So i wouldn't give Red a 10 at all. It does not posess a graph database architecture.

Your table said "data structuring", which is very different from a database. If you mean Graph Database, just say that.

&gt; one of the killer features of Excel. Clearly Red has not yet considered this

This is the reactive system @9214 mentioned. It works at the non-graphical level as well. Scene graphs are a different matter.

&gt; Without string comprehensions (and some string extraction/translation table) support you are in big trouble making localized products.

That's not true. Other systems exist, and have for decades, without using string interpolation. In your example, it also has to account for the inserted sum being formatted according to a locale, which plays into the I18N/L10N design of a system.

Before making too many statements about what Red's drawing system doesn't do, you should look at it in more detail. It's quite advanced already.

&gt; I don't quite understand how Red can survive without pointers.

You're conflating pointers and references. Red, like most HLLs, doesn't have pointers (pointers are a memory/address based artifact). Red/System, the C level dialect, \*does* have pointers, because you do need them for low level memory management. You can, of course, pass values to functions, but we don't call them pointers.

Apologies for redundant answers. Gitter makes it hard to track and respond at length.

## Monday 14th January, 2019

CodingFiend\_twitter

[04:59](#msg5c3c174d39596c372bda5c2b)IEEE floating point has numerous flaws which have been commented upon at great length. Crockford has a nice lecture on the DEC64 arithmetic model which is far superior, and there are other languages that permit extensions to the number space so as to allow some nice tricks. One of the troubling issues with many language arithmetic systems is you either have silent problems which cascade or you trigger exceptions. some languages require cumbersome try blocks to protect against division by zero, which in some arithmetics is completely valid. In C for example, with the runtime checks off, you can get into all sorts of horrible problems where you map an int32 into an int16 and get crazy results. In some ways the JS arithmetic with only double precision floating point is a more convenient, regular system, but it too can be improved. Improving arithmetic will never make the headlines, but it is always important to re-examine the inherited practices to see if you really want to continue the mistakes of the past.

[05:01](#msg5c3c17bb0721b912a577e07d)Anyway if red doesn't have pointers, how on earth can you send a record to a function and have that function change the record (and only that record). That is a major function of a pointer, to provide a single value which when supplied to a function will permit the function to make a limited scope of changes and you can be assured that nothing else can be modified. If i have a record of 10 people, and let's say the person record has name, age and sex fields, how do i send person\[3] to a function if there aren't pointers?

greggirwin

[06:46](#msg5c3c304af780a1521f08e074)@CodingFiend\_twitter you still haven't provided specifics on Bead's math behavior, so we can't compare it to anything. On pointers, here's an example, but I suggest you look at Red a bit, because this is really basic stuff. What you call a pointer is not the standard usage of the term. `Pointer` will mean "memory pointer" to most programmers, so you need to define what it means to you.

```
people: [
	[name: Alice age: 11  sex: F]
	[name: Bob   age: 22  sex: M]
	[name: Carol age: 33  sex: F]
	[name: David age: 44  sex: M]
]
; This function can only modify the record passed to it
happy-birthday: func [rec [block!]][
	rec/age: rec/age + 1
]

happy-birthday people/3
print mold people/3
```

## Wednesday 16th January, 2019

luvattula

[19:22](#msg5c3f848bba5936605bce4547)Could someone explain this example code. Especially React. This is a piece from spreadsheet in 17 LOC. https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html if rel: f/extra/old \[react/unlink rel 'all]  
if #"=" = first f/extra/formula: copy text: copy f/text [parse remove text  
\[any \[p: L N not \["/" skip not N] insert p " " insert "/data "  
| L skip | p: some D opt \[dot some D] insert p " " insert " " | skip]]  
f/text: rejoin \[f/extra/name "/data: any \[math/safe \[" text {] "#UND"]}]  
if f/data \[any \[react f/extra/old: f/data do f/data]]]]

greggirwin

[20:31](#msg5c3f94acba355012a44d0696)@luvattula, the condensed version is hard to work on, but the expanded version is \[here](https://github.com/red/code/blob/master/Showcase/picosheet.red), and I ported it to VID \[here](https://gist.github.com/greggirwin/8d0b1c02ccdbd5520d9c77d49ea91ada).

The reactive system is explained in detail here: https://doc.red-lang.org/en/reactivity.html

Take a look at those, and see if they help clear things up (it is still advanced code, and quite dense even when expanded). If not, come back and maybe @9214 or another resident explainer-extraordinaire will chime in.

## Thursday 17th January, 2019

luvattula

[07:14](#msg5c402b4920b78635b6381649)Fine, yes I had seen the expanded code too. Syntax for react is &lt;target&gt; react &lt;source&gt; but I do not get it with the two formulas: \[any \[react f/extra/old: f/data do f/data]]]] and \[react/unlink rel 'all] I am confused with the order ...

endo64

[09:45](#msg5c404ed40721b912a5936fb4)I think your are confusing the `react` function and `react` word in VID DSL,  
If you are in a VID block than it is like `react`,  
If you are using `react` function inside the script, then it is just a function like any other, you can see the details by typing `? react` on console.

mkeys30707\_twitter

[15:41](#msg5c40a21895e17b452567e019)Hi, I'm not a programmer at all, more of a sysadmin/ops kinda guy. I'm just wondering how difficult it would be, and any pointers you may have to documentation or instructions, to port source in C like baresip ( https://github.com/alfredh/baresip ) to Red?

[15:41](#msg5c40a23fba355012a4539ccf)or if that's possible at all

[15:42](#msg5c40a26a35350772cf477644)If not C, perhaps something like js like jssip ( https://github.com/versatica/JsSIP )

rebolek

[16:03](#msg5c40a7588ce4bb25b8c850ec)Hi @mkeys30707\_twitter It \*would* be possible, however there are some things missing in Red that are needed to do (IO mainly). So you would either need to wait for those features to get implemented, or implement them yourself. Anyway, this doesn't look like a trivial thing to implement, minimized JS version is ~250kB, non-minimized is just below 28'000 lines. That's pretty big project IMO.

mkeys30707\_twitter

[16:27](#msg5c40acdb20b78635b63b8eca)When you're referring to IO, something like https://github.com/qtxie/red/tree/ev/tests/IO ?

[16:27](#msg5c40ad0ef780a1521f264a08)@rebolek and thanks for the reply

[16:28](#msg5c40ad360721b912a595d85e)I also found https://www.softinnov.org/rebol/uniserv.shtml

rebolek

[17:04](#msg5c40b5ad7a0f4d5b19c499bb)@mkeys30707\_twitter right, that's development branch.

mkeys30707\_twitter

[17:09](#msg5c40b6bbdab15872ceace4af)@rebolek great! I suppose next question is, has anyone played with https://shop.sirinlabs.com/ and the Red wallet? ;)

meijeru

[17:15](#msg5c40b84435350772cf481856)@mkeys30707\_twitter The Uniserve link you gave misses an "e" before the ".shtml". Important for other readers who might be interested...

mkeys30707\_twitter

[17:26](#msg5c40bacb9bfa375aab1806a1)@meijeru my apologies and thanks for the correction

[17:42](#msg5c40be7edab15872cead1edf)I work for a company called eZuce and a blockchain tech enthusiast. I ran across Red and was really impressed at the code samples, size and power of it, etc. I was shocked that I had never heard of it before now and this wasn't a bigger thing. Anyways it looks really cool and I guess you can guess where I would like to use it. I'm not much of a programmer outside of shell scripts and wouldn't know how to go about porting source code to red. If anyone is interested in helping I'd love to hear from you.

[17:46](#msg5c40bf7e746d4a677acacff5)we were able to use emercoin dns in our project, but emercoin wallet is basically a bitcoin wallet. pretty huge.

rebolek

[17:50](#msg5c40c0708ce4bb25b8c8ff53)@mkeys30707\_twitter I've never heard of Sirin, what CPU and OS does it use?

mkeys30707\_twitter

[17:53](#msg5c40c11b20b78635b63c2565)@rebolek I'm not sure on the specs. I saw it maybe a month or so back in the news feed, read the article, that kinda thing. I know it has a hardware wallet and it looks like they may have their own token (https://coinmarketcap.com/currencies/sirin-labs-token/)

[17:55](#msg5c40c17420b78635b63c2943)https://www.digitaltrends.com/mobile/what-is-a-blockchain-phone-we-asked-an-expert/

rebolek

[17:57](#msg5c40c223831899452405f540)@mkeys30707\_twitter Red supports x86 and ARM as CPUs and Win, macOS, Linux (, Android) as OS. So if Sirin fits that combination, it could be supported.

mkeys30707\_twitter

[17:58](#msg5c40c2321cb70a372af4592e)This is how we used emercoin: https://medium.com/@emer.tech/emercoin-and-ezuce-speed-up-adoption-of-blockchain-phone-and-video-services-126ecfd2cbeb

[18:01](#msg5c40c2f8dab15872cead3d93)https://emercoin.com/en/documentation/blockchain-services/enumer

[18:03](#msg5c40c36e95e17b452568ca1d)so really, all you need is a wallet address

rebolek

[18:07](#msg5c40c45e27611d4204bcaf00)@BeardPower is expert in this area, let's summon him

mkeys30707\_twitter

[18:15](#msg5c40c6499bfa375aab184e06)dns looks pretty trivial in red / rebol? does it support SRV or ENUM / E.164 lookups?

codenoid

[18:34](#msg5c40cad3c45b986d11780627)how are you

rebolek

[19:09](#msg5c40d2cdc45b986d11783e86)@mkeys30707\_twitter Rebol implementation is &gt;10 years old and Red's one is not ready yet. However, Knot DNS (resolver) is developed by my colleagues, so once Red gain DNS support, I'm certainly going to test it with them.

BeardPower

[19:17](#msg5c40d4ad35350772cf48d957)@mkeys30707\_twitter Not much details are known about the SIRIN labs phone. They forked Android and the developments are not Open Source, so it's a proprietary OS. They don't store the keys on a "secure enclave" but similar to a external hardware key like Ledger and Trezor is using. The OS will communicate with the external hardware (integrated as a slider). As long as they do not publish their API, the Red wallet is not able to support it. Security processors are cheap these days (5-10 bucks) and the price of the phone compared to what it offers is really high.

[19:18](#msg5c40d4f0ba355012a45503cf)Their intrusion prevention system is some "AI" stuff. A trained network which has various inputs as parameters (sensor data, network, malware etc.).

mkeys30707\_twitter

[19:28](#msg5c40d75a0721b912a596f55a)I had thought about that also in the voip / sip area, using blockchain for the storage of the attacker data. sip probes happen often, similar to ssh probes, so for ips/ids to work in the voip world you have to do something like a denyhosts / fail2ban. If the world shared that data, it would go a long way in preventing spam calls.

[19:37](#msg5c40d9600721b912a597040a)@rebolek @BeardPower thanks so much for your time and attention. i've got to get back to work for a while

## Friday 18th January, 2019

greggirwin

[02:27](#msg5c41399e7a0f4d5b19c7ec1d)@mkeys30707\_twitter welcome! In addition to the low level stuff, for admins and ops, Red will (soon) be great for that kind of work. We have lots of experiments, to be a portable, programmable shell environment, and it's great for data processing, with `parse` and new codecs planned for the next release.

LucianU

[17:05](#msg5c42074bfd6a0f31366da785)hello. what's the most update page with the red syntax?

[17:21](#msg5c420b1bcb47ec300064448a)I found this page. how much of it applies to red? http://www.rebol.com/r3/docs/concepts.html

rebolek

[17:50](#msg5c42120083189945240e6968)@LucianU there are differences, but lot of it applies to Red.

meijeru

[19:01](#msg5c42229b0721b912a59f5f1b)@LucianU Please have a look at \[this](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc). It contains quite a lot of "syntax".

greggirwin

[23:24](#msg5c426010746d4a677ad5515c)And also https://doc.red-lang.org, which is a work in progress, but contains a lot of useful information.

## Friday 25th January, 2019

codenoid

[14:54](#msg5c4b23261cb70a372a36a147)long time no c

rebolek

[14:54](#msg5c4b233a95e17b4525aaf8dc)@codenoid hello

Senenmut

[18:09](#msg5c4b50c18ce4bb25b80c3e35)Hello , one question. Is it possible to program a application in Red and distribute it as a commercial application ?

rebolek

[18:21](#msg5c4b53bf0a491251e3549d15)@Mennohexo of course

Senenmut

[18:22](#msg5c4b53f920b78635b6803f6e)That's good. I saw that Red has a MIT license. The friend of the developers.

rebolek

[18:23](#msg5c4b5429dab15872cef0346b)@Mennohexo no, it has BSD and BSL, which is similarly friendly.

Senenmut

[18:25](#msg5c4b5483831899452449906d)Oh , i misunderstood. Does that mean the programmer can hide his source code ?

rebolek

[18:26](#msg5c4b54f28ce4bb25b80c5cad)@Mennohexo yes, you can compile your code and distribute the executable file.

Senenmut

[18:28](#msg5c4b553035350772cf8bc2b2)A god damn good thing.

[18:29](#msg5c4b557835350772cf8bc433)I dont like GPL and think about to open a online shop to selling T-shirts with the slogan "I hate GNU-GPL" ha

rebolek

[18:29](#msg5c4b558b8ce4bb25b80c5f91):smile:

[18:29](#msg5c4b55a37a0f4d5b1908ab52)Actually, you can sell GPL software too. You just need to distribute the source with it.

Senenmut

[18:32](#msg5c4b562735350772cf8bca3b)I never do that. Why ? If a programmer is sitting many weeks and month on a the handcraftsman table to assemble a application , why should he gave out his work for nothing ? RED has the right PATH !

[18:35](#msg5c4b5705dab15872cef04dfc)Thanks. Over and Out. Commander X

rebolek

[18:59](#msg5c4b5c94cb47ec30009fe737):smile:

Senenmut

[19:03](#msg5c4b5d99cb47ec30009fee34)Wanna buy a shirt ?

[22:30](#msg5c4b8e121b62f126504c81ea)Hey BB , one more. Is the cross compilation to LINUX working in Red. Want to compile my "Easy Password Base" program that i have already developed 2 Years ago to LINUX. It's Freeware for that little tool.

[22:40](#msg5c4b9073f04ef0064487e08f)My first program in Red. Learning tool you can say.

[22:58](#msg5c4b94b2c2dba5382e8aaef4)Commander to Gregg . Can you read ?

## Saturday 26th January, 2019

greggirwin

[01:10](#msg5c4bb37793fe7d5ac0ef1874)Cross compiling to Linux works fine. Only the GUI aspect is lagging behind on Linux, but there's some recent (great) progress on the GTK branch for that.

Loud and clear.

Senenmut

[16:03](#msg5c4c84e278e1ed4103926ba3)hello again. im back from 24 hours sleep session.

[16:05](#msg5c4c856313a2814df6cee644)Yeah. I'll try it. It's a plus if Linux user can download my little password tool. The smallest program , but a program.

AiguyGary\_twitter

[16:50](#msg5c4c8fd4f04ef006448df60e)I have process that writes to a file and then causes another process to read from it. Sometimes the file that it is wring to gets an error because it is still being read from by the last time the other process was called. I tried a time delay but that does not prevent the error in all cases. There should be a way I can trap for the error wait a bit and then try again in a loop until the say.txt file that I am trying to write to is freed up. Has anyone implemented anything like this.

if (MyString &lt;&gt; "") and (MyString &lt;&gt; none) [wait .5  
write %./say.txt MyString  
call %"./.\\voice -k say.txt"]

The error I see is  
\*\** Access Error: cannot open: %./say.txt  
\*\** Where: write

Senenmut

[18:08](#msg5c4ca2301b62f126505325a3)Sorry i cannot help for your issue instead i want to post another issue , IF i try to cross compile my application to linux THEN i could fix this error in the same work. The Error is only a hardprint matter. I have the following code  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
button "Save" front size 10 bold [  
save $mytext\_A.txt a/text b/text: "saved" ]  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
the first paket is a system call to dll for PRINTING function like this  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
Red \[needs: 'view]

#system [  
#import [  
"shell32.dll" stdcall [  
ShellExecute: "ShellExecuteW" [  
hwnd \[integer!]  
lpOperation \[c-string!]  
lpFile \[c-string!]  
lpParameters \[integer!]  
lpDirectory \[integer!]  
nShowCmd \[integer!]  
return: \[integer!]  
]  
]  
]  
]

send-printer: routine \[file \[file!]][  
ShellExecute 0 #u16 "print" unicode/to-utf16 as red-string! file 0 0 1  
]  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
The problem is that the PRINTED DOCUMENT has  
MANY /^M^/^M^/^M^/  
IN THE DOCUMENT EVERYWHERE AFTER EVERY SINGLE ENTRY OF STRING.  
HOW TO FIX THIS ??? FOR NORMAL PRINT OUT!

WBR CommanderX c/o barbarian programmer

9214

[18:39](#msg5c4ca95ec2dba5382e91418a)@AiguyGary\_twitter, @Mennohexo, before asking questions, make an effort to clearly \[formulate](https://www.mikeash.com/getting\_answers.html) and \[format](https://gitter.im/red/red/welcome/~chat#markdown) them. That way interaction remains pleasant for both sides (you get answers more quickly and in a friendly manner, we don't waste our time and energy trying to read your message and figure out what it's all about) and community benefits from maintaining high quality of discussions. Help us to help you - an effort from our side requires an equal effort from your side.

Senenmut

[18:41](#msg5c4ca9f09221b9382dc738af)sorry , the right printing code is :  
button "Print" font-size 10 bold \[send-printer %mytext\_A.txt]

[18:43](#msg5c4caa6978e1ed4103935e4f)please forgive me for my "barbarian manners".

[19:35](#msg5c4cb6837b68f9410222287c)It is clear formulated. You see the code for normal text saving and the code for text hardprinting of a textfile A.txt. The system call code in the beginning of the application is to call the hardprint system function of windows. Bur in the hardprint , after every saved string , the signs /^M^/^M^/ are printed together with the data. I think that theese are formatting sign. Have nothing to do on the hard printed paper. Regards

[19:43](#msg5c4cb87e8aa5ca5abf3784df)I think its not a problem to hande II Issues at the same time. Also Garys issue. Multitasking OS

gltewalt

[20:11](#msg5c4cbef1f04ef006448f2d58)I think by formatting, he means to put your code in a markdown code block. Like this:

```
print “Hello”
```

[20:12](#msg5c4cbf2c975714406b47bcfd)

```
button "Print" font-size 10 bold [send-printer %mytext_A.txt]
```

[20:13](#msg5c4cbf75ca428b0645082683)You can also create a Gist from your github account and paste the link to your code example (Gist) to red/help

Senenmut

[20:17](#msg5c4cc06113a2814df6d068ce)thank you Greg T. the tool is already in use for 2 years and works. only the hardprint "additional signs" are looking a little bit strange. This issue is the easiest one. You want to make a hardprint of a textfile. But HOW - without theese additional print out. I think MANY Red programmers have applications that print out a hardcopy of a textfile.

AiguyGary\_twitter

[20:21](#msg5c4cc162975714406b47c923)Let me try again. I want to be able to capture an error writing to a file but sometimes it is locked by a different process so I want to do a wait for a few seconds and try again. Is there a Red word that will contain an error code if the write fails? I have looked at the write examples and I see no error checking in the online docs and in the book "Red - Fundamentals in Red" but see no examples of error code checking and recovery in the File I/O operations examples I have found. In many other languages most all API calls have a negative return value to indicate that the call failed so that you can handle the error. I am trying to figure out what the Red equivalent is.

Senenmut

[20:22](#msg5c4cc18bf04ef006448f3c74)ok. i make a break here for gary.

9214

[20:25](#msg5c4cc22878e1ed410393ffcc)@AiguyGary\_twitter a simple `? "error"` typed in console gives:

```
...
     attempt         function!     Tries to evaluate a block and returns result or NONE on error.
     ...
     try             native!       Tries to DO a block and returns its value or an error.
```

gltewalt

[21:04](#msg5c4ccb7178e1ed4103944089)@Mennohexo Are you taling about printing a text file, or sending to a printer?

[21:05](#msg5c4ccbb754f21a71a1aede9b)To print a text file, assuming it is in your current directory:  
`print read %mytext_A.txt`

[21:11](#msg5c4cccfb8aa5ca5abf3806f7)@AiguyGary\_twitter If I set a file to read only, and try `write/append`

```
*** Access Error: cannot open: %test.txt
*** Where: write
*** Stack:
```

Senenmut

[21:17](#msg5c4cce521b62f1265054512d)Hello GT , does the print command not print only to command line ? I want to print out to the printer a hardcopy. send-print command.

[21:17](#msg5c4cce6378e1ed4103945108)send-printer

gltewalt

[21:22](#msg5c4ccf82f46373406a061b7e)@Mennohexo I don't think that is possible yet, unless someone like @Oldes has written something for it

[21:23](#msg5c4ccfc57b68f9410222c9b2)@AiguyGary\_twitter You can do `try/all [your code] catch [other code]` Or something like that. I haven't used try really

Senenmut

[21:25](#msg5c4cd02c8aa5ca5abf3819ee)@GreT  
of course it is possible. since 2 years in my application.

gltewalt

[21:25](#msg5c4cd03854f21a71a1aef882)In a Red application?

Senenmut

[21:26](#msg5c4cd07df46373406a062132)yes. 2 years ago

9214

[21:26](#msg5c4cd0a38aa5ca5abf381ebf)If it is possible, why then do you use your `send-print` routine?

Senenmut

[21:27](#msg5c4cd0d0c2dba5382e9237be)It IS the "send-printer" command itself.

gltewalt

[21:28](#msg5c4cd0fcceb5a2264f46bce1)There is no such function in the default context

Senenmut

[21:30](#msg5c4cd1709221b9382dc83825)The session 2 Years ago was at the time together with Mr. iArnold. However , have i understood ? You say that printing to a printer in WindowsOS isn't possible yet in red ?

9214

[21:31](#msg5c4cd19cf46373406a0626ec)Anyway, is there a reason why you convert string to UTF-16 encoding? And when have you noticed a malformed output?

[21:32](#msg5c4cd1d993fe7d5ac0f5e1dd)&gt; You say that printing to a printer in WindowsOS isn't possible yet in red ?

How can it be impossible if you did it yourself for the last 2 years? It will be more trivial with `port!`s implementation though.

Senenmut

[21:35](#msg5c4cd29ff04ef006448fa73a)Stay cool.  
I leave the Red application untouched. As it is.

9214

[21:35](#msg5c4cd2a8f46373406a062e1e)FYI, there's a `print` command in CMD. You can try it instead.

gltewalt

[21:36](#msg5c4cd2cc1b62f1265054684d)Something like `call/shell {print /d:lpt2 report.txt}`

[21:36](#msg5c4cd2e2975714406b483900)`/d:`

9214

[21:36](#msg5c4cd2e254f21a71a1af0ea1)@gltewalt yup, exactly.

gltewalt

[21:37](#msg5c4cd32a454aad4df7a93a7e)https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/print

Senenmut

[21:38](#msg5c4cd33ac2dba5382e924635)The Windows API call code i have posted here first. yes it is an API call and it works.

[21:40](#msg5c4cd3cec2dba5382e924b41)ok. thank you. i leave here for Garys issue to be solved. thank you for help. WBR Commander X

9214

[22:11](#msg5c4cdb0254f21a71a1af3e69)@Mennohexo I see that UTF-16 is used for internal data representation on Windows. Both `#u16` and `to-utf16` null-terminate their arguments, so that's OK. `to-utf16` also does an implicit conversion of CR to CRLF, which is what you get at the end of every string:

```
>> CRLF
== "^M^/"
```

You also pass the rest of `lp*` parameters as null pointers, which seemingly conforms to \[`ShellExecuteW` spec](https://docs.microsoft.com/en-us/windows/desktop/api/shellapi/nf-shellapi-shellexecutew). The natural question, then, is: what's the content of your `%mytext_A.txt` file? Was it like this before or did you encounter such behavior for the first time?

[22:18](#msg5c4cdca241775971a08bcc19)And what do you mean by "many `^M^/` everywhere after every single entry of string"? Single carriage return and line feed characters at the end of every line are expected. Or do you mean that they are somehow doubled or even tripled?

Senenmut

[22:25](#msg5c4cde66975714406b487e91)The contents are Names and telephone numbers and passwords. Yes that are the carriage return ! How to throw them away in hardcopy ? They are printed out single - double-trippled and more.

[22:27](#msg5c4cded8975714406b4880bc)It was from the beginning of time. ha ha

9214

[22:30](#msg5c4cdf71454aad4df7a98318)So what you ask is rather "how to remove newline characters from a string"..?

Senenmut

[22:32](#msg5c4ce0121b62f1265054b94a)Perhaps its a matter of saving the text file of a formatted printing in a form that every new line is printed in a new line. Then the CR sign are on the end of the string.

[22:34](#msg5c4ce07393fe7d5ac0f63bd0)Its ok if they are only printed out at the END of line. In the Middle is irritating the user.

[22:36](#msg5c4ce1008aa5ca5abf388619)I will send a testprint in the next 5 minutes wait.

[22:45](#msg5c4ce30ff46373406a0695ad)mytext\_A  
{Example data :^M^/^M^/^M^/American Express Gold Card Number :1234567 PIN:  
4567 oldPIN1: 3591 oldPIN2: 8912^M^/^M^/Alien Shop Online Account Number :  
123456 UserName: User Password: 34,.i78cc44 ^M^/  
oldPassword1: 486,cde45^M^/  
oldPassword2: 898,,..q1^M^/  
new security question : What is your mothers maiden  
name?^M^/^M^/^M^/Next data !^M^/^M^/^M^/^M^/^M^/^M^/^M^/Hello  
,^M^/^M^/this all is an example code.^M^/^M^/You can mark that code here and delete  
it.^M^/^M^/Then save the emty Page.^M^/^M^/Now the page is ready to go with your  
data.^M^/^M^/always save it.^M^/^M^/Have fun and enjoy.^M^/^M^/^M^/XY Soft  
Germany^M^/^M^/^M^/}

[22:59](#msg5c4ce65278e1ed410394db3f)That are lines from a text file. Exact description : The first entry is the word "Example data :" Then there are TWO emty lines , then the next line with the words "American Express ..... until the word oldPIN2: 8912 , carriage return ^M^/^M^/ ^M^/^M^/^M^ 3 ones. ONE empty line is printed out with

[23:02](#msg5c4ce6ec41775971a08c0b8b)The carriage return are MORE if there are more empty lines following the textline. In the print out hard copy the Carriage Returns are anywhere because the printout is not FORMATTED to print only ONE line per line.

endo64

[23:02](#msg5c4ce7221b62f1265054e175)@AiguyGary\_twitter You can do something like this:

```
if (MyString <> "") and (MyString <> none) [
	success?: loop 100 [
		unless error? try [write %./say.txt MyString wait .5] [break/return yes]
	]
	either success? [
		call %"./.\voice -k say.txt"
	] [
		print "I've waited too long :("
	]
]
```

Senenmut

[23:04](#msg5c4ce797975714406b48b0b6)its a matter of formated printout. it must be possible to make a LINE BY LINE printout. a forced one.

[23:09](#msg5c4ce8b8f46373406a06bb61)The textfile stored the CR signs right and is printing 1:1 as it is stored in the file. The system doesn't care about formatted printout. The programmer has to make the right code for that printout.

gltewalt

[23:10](#msg5c4ce8ebceb5a2264f475141)take a look at `read` and `write` with `help read` `help write`

Senenmut

[23:11](#msg5c4ce9089221b9382dc8cae7)i will do.

[23:17](#msg5c4cea8bf46373406a06c4a6)search a "print Line by Line" command

[23:22](#msg5c4ceba913a2814df6d164a6)Its late here. See you later. On Red Planet.

[23:57](#msg5c4cf3d98aa5ca5abf38f6a1)One thing is also important. Why not SAVE the textfile in a format LINE BY LINE ? That also fix the problem.  
IF RED allows that. Them the printout is LINE by LINE too.  
sended from my redplanet transponder on mars

gltewalt

[23:59](#msg5c4cf474c2dba5382e930ff8)try `write/lines`

## Sunday 27th January, 2019

ne1uno

[00:07](#msg5c4cf63f9221b9382dc91c39)would `write/binary` help? ideally you could pick unix/mac/dos line endings

Senenmut

[00:24](#msg5c4cfa48ceb5a2264f47b8a7)i will try tomorrow. here its really late. thanks. in this application the data is entered in a texteditor that is always display the whole data for letter A. So the Carriage Return are always there. It's if you write on a plane sheet of paper. The data is always seen in the same arrangement. Thats the STYLE of the tool.

[00:25](#msg5c4cfa6a9221b9382dc93224)I'm out. sleep

[16:06](#msg5c4dd71f975714406b4e393d)Hi , i am back again.

[16:09](#msg5c4dd7a578e1ed41039a607e)formatted print function in a language is more important than networking and others. print a document formatted on that printer , that is USB connected to the OS and the default printer. I guess every programmer aggrees too.

[17:57](#msg5c4df1081b62f126505af1b0)I make a break. Normal compiling doesnt work anymore.

endo64

[18:11](#msg5c4df461454aad4df7aff419)&gt; ... more important than networking and others. print a document formatted... I guess every programmer aggrees too.

Nope, I don't agree. It would be useful one day, but networking and ports generally is much more important for me.

Senenmut

[19:25](#msg5c4e05a941775971a0928f8c)Sorry. It depends on waht kind of applications you want to make. shure. ----- the compiling matter i am working on here. first compile red new on a different notebook to test it.

[19:33](#msg5c4e076eceb5a2264f4e119e)Its strange.  
I have normally compiled red but it is not working.  
1\. Download the exe and place in C:/red/ folder  
2\. Windows XP  
3\. Run the exe and compile RED. ready  
4\. Start CMD and go to folder red.  
5\. type red -c button.red  
6\. the message is :  
the command "red" is false typed or cannot be searched.  
Any idea ?

9214

[19:34](#msg5c4e07e193fe7d5ac0fd52e0)@Mennohexo you haven't added Red binary to PATH. In such case you should launch executable directly.

Senenmut

[19:36](#msg5c4e08491b62f126505b8d4f)ok. How do i compile the scipt from the RED CMD on ?

9214

[19:41](#msg5c4e095213a2814df6d82334)I already answered that, and you already know how to use compilation flags.

Senenmut

[19:45](#msg5c4e0a74c2dba5382e9996e9)wait. i got it.

[19:52](#msg5c4e0bf49221b9382dcfc2bd)i have typed "red-064.exe -c button.red

dander

[19:53](#msg5c4e0c4f975714406b4f9d45)this is one of the reasons I like to let Scoop handle this for me (and make updating a snap). It produces a powershell shim in your path for you like this:

```
PS C:\Users\dave> gcm red | cat
if (!(Test-Path Variable:PSScriptRoot)) { $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
$path = join-path "$psscriptroot" "..\apps\red-latest\current\red-latest.exe"
if($myinvocation.expectingInput) { $input | & $path  @args } else { & $path  @args }
```

Senenmut

[20:03](#msg5c4e0e7b93fe7d5ac0fd837d)hey , its not so easy as you think.  
my application code i have posted here had made the trouble. the API call. we spoke about that.  
The HARDPRINT THING.  
Things get hectic when such thing occurs.  
Note : I have compiled the code of my application already 2 years ago together with the system call.  
NOW : on the other machine here i get this error code  
when compiling the SAME code. Any idea :  
Compiling to native code....  
\*\*\*Compilation Error : undefined symbol: red/unicode/to-utf16  
\*\*\*in file: %/C/red/Password-Base\_FERTIG.red  
\*\*\*in function: exec/send-printer  
\*\*\*at line : 332  
\*\** near: \[unicode/to-utf16 as red-string! file 0 0 1]  
C:\\red&gt;  
What do you think.  
If a hardprint function not exist actual in red should i leave my application untouched and not change?

[20:05](#msg5c4e0f0df04ef00644971e6a)Thank you Dave for the code. Seems like interesting for Linux users too.

9214

[20:10](#msg5c4e103ef46373406a0dc49f)@Mennohexo compile in release mode.

Senenmut

[20:15](#msg5c4e117354f21a71a1b673bc)thank you. may i ask how to do that ?

[20:19](#msg5c4e123d54f21a71a1b678f7)-r

[20:20](#msg5c4e12ab78e1ed41039bde41)It is running with the -r flag.

[20:27](#msg5c4e14401b62f126505bd4f0)compiling ready. exe is not working. huuups

[20:40](#msg5c4e173b975714406b4fdf88)I think i leave it untouched and make my energy to new red application things. (first - without system call) For that little application it doesn't matter. It works in its state.

[21:23](#msg5c4e2165ceb5a2264f4ebe89)Thank you for the discussion here. I am proud to be a member of the RED PLANET assemblers. See you with the next serious issue. WBR Commander X

## Tuesday 29th January, 2019

greggirwin

[08:48](#msg5c50135a1b62f1265068e154)@Mennohexo it might help to put your full code in a gist and reference important lines or sections. It's hard to tell what's going on from chat here. Also, Red is alpha, and a moving target. We try not to break things, but 2 year old code will likely need some tweaks.

Senenmut

[15:16](#msg5c506e6554f21a71a1c5c242)shure thing. sorry for the late reply. i have completely reinstalled my other linux computer.

[15:20](#msg5c506f468aa5ca5abf4f0fb8)Is there a hardprint command for printer in red implemented at the time ?

greggirwin

[20:35](#msg5c50b8fd54f21a71a1c7d60c)No, there is no direct printer support in Red at this time.

Senenmut

[20:39](#msg5c50ba03975714406b615e57)Done.  
search the gist "hs-soft.red".  
The lines are marked with a comment first two ;;  
comment 1/Line 20: THIS CALL CANNOT BE COMPILED !  
commet 2/Line 82: THIS WINDOW IS CREATED TO ERASE THE CLIPBOARD  
Questions :  
\-how to make a hardprint that can be compiled.  
\-how to emty the clipboard more "elegant"  
A little TOOL.  
But convenient for the purpose.  
If i can make the freeware tool better then i do it.  
Note : Only the 2 issues.  
The rest works fine for many time.  
WBR  
Commander MH

greggirwin

[20:44](#msg5c50bb4a454aad4df7c1fa80)@Mennohexo please post a link to the gist, rather than making us search.

Senenmut

[20:48](#msg5c50bc168aa5ca5abf513584)ok. my first gist at all. /^M^/^M^/^M^/

greggirwin

[20:48](#msg5c50bc3313a2814df6e9d781)We all had a first gist at some point. :^)

Senenmut

[20:51](#msg5c50bccb975714406b616ec1)https://gist.github.com/Mennohexo/ccb8177bb817fc295c60016be6ad90c6

greggirwin

[21:09](#msg5c50c101f04ef00644a93af7)@Mennohexo it compiles fine here if I use `-r` for Release mode.

Senenmut

[21:10](#msg5c50c15f975714406b619042)Yes, but the .exe is not starting

greggirwin

[21:11](#msg5c50c1928aa5ca5abf5159fa)That's a different problem. :^)

[21:12](#msg5c50c1afc2dba5382eab57b9)To clear the clipboard, you should just be able to write an empty string to it, using `write-clipboard`.

Senenmut

[21:12](#msg5c50c1d4ceb5a2264f60923c)thanks

[21:15](#msg5c50c285975714406b619a4d)if i can make another solution to print out on windows then i can compile it again. if not. it stays dry.

greggirwin

[21:16](#msg5c50c2c8975714406b619ba3)To debug the startup issue, take out the R/S bits, and run interpreted. It uses a lot of other files we won't have, so can't help much there.

Senenmut

[21:21](#msg5c50c3d68aa5ca5abf516b77)yeah. thats a way. first without the R/S. and with the new clipboard code. i can make a "standby version" so long until i can add a printing solution and the 1.0 version stays for download further more.

[21:28](#msg5c50c56f7b68f941023c7910)the pictures are all .png the motivation was to MAKE a software READY. NOW no speaking - make ready. SUCCESS. modification is waiting. ha ha

[21:35](#msg5c50c72178e1ed4103ae02b4)With RED it is possible.

gltewalt

[22:16](#msg5c50d0a8c2dba5382eabc130)If the .exe doesn’t “start” it might be that your antivirus has quarantined

Senenmut

[22:17](#msg5c50d0de454aad4df7c28f16)Hi friend. Thank you for that. I have no Antivirus software installed.

gltewalt

[22:17](#msg5c50d1171b62f126506e36a2)Are you using Windows?

Senenmut

[22:19](#msg5c50d1751b62f126506e38be)You know the use of Antivisrus and realtime and other. I came to a solution that is named : Sterjo NetStalker which is controlling and listing all the ports realtime. TCP UDP . If you use this tool you are very surprized how many application want to access the internet you never know before.

[22:20](#msg5c50d195454aad4df7c29406)You are right Greg T. Antivirus-Programs are "to hard"

gltewalt

[22:20](#msg5c50d19b9221b9382de2347f)Windows 10 comes with Windows Defender. Which can quarantine files.

Senenmut

[22:21](#msg5c50d1d89221b9382de23587)I prefer a solution such like : Sterjo Netstalker. The SILENT STALKER is the danger.

[22:26](#msg5c50d301f04ef00644a9af68)i have WIN XP and more computers WIN XP and LINUX updated Debian Jessie on the other partition

gltewalt

[22:27](#msg5c50d352c2dba5382eabcf70)Well make sure that windows defender isn’t installed and quarantining files

Senenmut

[22:27](#msg5c50d369ca428b064522639a)Antivirus Software can also be a silent stalker to scan the whole system no matter if old or new. ;;comment

[22:35](#msg5c50d52cf04ef00644a9bd5b)hi Greg T i have old computer. i only want to program. with RED it is also possible if new or a little older ones. Absolutely no Antivirus software. No Firewall ! Except the windows one. Only a programmer.

[22:37](#msg5c50d599ceb5a2264f610fdb)Sterjo is blocking ALL in realtime.

[23:02](#msg5c50db7af46373406a1ff239)You are Right GregT. The newest computer isn't shurely the best for programming.

## Wednesday 30th January, 2019

gour

[14:10](#msg5c51b053ceb5a2264f66ae77)morning. i'm aware that there is no GUI for Red (Linux), 64bit support is not ready, but wonder whether Red can be used for writing CLI apps although one would probably want to have support for modules which are coming in 0.8.0...any rough estimate for that?

rebolek

[14:11](#msg5c51b08054f21a71a1ce2b3d)@gour yes, you can use Red for CLI apps easily

[14:11](#msg5c51b0a97b68f941024288d2)also the GUI on Linux is not fully done yet, but usable anyway

gour

[14:23](#msg5c51b3557b68f94102429e25)@rebolek how much of Gtk (approx.) is bound?

rebolek

[14:25](#msg5c51b3d293fe7d5ac015c030)@gour see https://gitter.im/red/GTK for details, IIRC rich-text is not implemented, but standard widgets like buttons, fields, ... plus Draw work.

gour

[14:28](#msg5c51b48a13a2814df6f02bcb)@rebolek thanks

Senenmut

[19:41](#msg5c51fde2ca428b06452a1b9b)Hi again. I have one more question.  
..............................................................  
In Windows , the PATH for the normal texteditor that  
is opening any textfile on the system .txt automaticly  
is : %SystemRoot%\\system32\\notepad.exe.  
in the system 32 folder under WINDOWS folder  
the name is : notepad.exe  
its is a .exe  
Question :  
Is it possible to send a .txt file from a RED program to that normal texteditor that it opens the file ?  
\- for example hardprint etc.  
call external program notepad.exe and send a file to it.  
..................................................................  
That would be a good choice for programming.

WBR  
MH

dander

[20:09](#msg5c520485ca428b06452a49cc)@Mennohexo if you do

```
>> call "start c:\temp\test.txt"
== 1234
```

it will open the text file with the default handler for that file based on the extension. The returned value is a pid for `start`

Senenmut

[20:14](#msg5c5205b341775971a0ad5aff)he he he

[20:22](#msg5c52076af04ef00644b1ddb6)now i try to rewrite my little application and make a new gist if it is working propertly. version 1.1

[20:48](#msg5c520da1975714406b6a43ca)new ideas for applications i have already since weeks , my interest is application programming. if it networks necessary ok. if not also ok.

[20:56](#msg5c520f86975714406b6a4d45)i mean realtime communication indeed , a FTP-Backup for example i not name "networking"

dander

[22:56](#msg5c522b9b9221b9382deb5fc6)@Mennohexo I'm interested in application programming too. I'm excited to see what will be possible with the upcoming support for ports

Senenmut

[23:09](#msg5c522ec11b62f1265077782a)in rebol i have made a udp sender and i have seen it in realtime in the sterjonetstalker listing. this i make with red too if its implemented. Greetings to you.

[23:13](#msg5c522f847b68f941024618cf)one more very interesting thing is that i have seen also a portscanner (hackertool) in realtime in sterjo. ha ha -----there was a connection attempt on many different portnumbers in a very short time. I was thinking "why this is switching so often to different ports "? Then i went OFFLINE. a break

greggirwin

[23:29](#msg5c52334113a2814df6f3b6b2)UDP may come with ports in 0.7.0. TCP is the priority, but UDP is also important, we know.

## Thursday 31st January, 2019

rebolek

[06:42](#msg5c5298e2975714406b6db9bf)With HTTP/3 moving to UDP it's getting very important.

pekr

[06:55](#msg5c529bfe93fe7d5ac01bcc63)HTTP moving to UDP? Why so?

rebolek

[06:58](#msg5c529c98454aad4df7ce7f24)To improve speed.

[07:01](#msg5c529d6778e1ed4103b9f3a1)If you are interested in details, you can read for example https://thenewstack.io/http-3-replaces-tcp-with-udp-to-boost-network-speed-reliability/ or blogs on Cloudflare - https://blog.cloudflare.com/

pekr

[07:19](#msg5c52a18aca428b06452e48bb)Will have to read some docs on that. Protocol without ACKs? Such wild idea surely comes from Google :-)

rebolek

[07:19](#msg5c52a19a9221b9382dee3ad2)Bingo ;)

[07:21](#msg5c52a1ea454aad4df7cea634)It basically moves ACK to the application layer. It's not such bad idea.

Senenmut

[18:37](#msg5c53404f54f21a71a1d8a8dd)he he he  
i have a extra pilot case. only for programming.

greggirwin

[21:31](#msg5c53692a454aad4df7d42648)Because we should change to UDP rather than reduce bloat. :^\\

BeardPower

[21:34](#msg5c5369d013a2814df6fbcc0c)-&gt; http://irati.eu/

[21:35](#msg5c536a3013a2814df6fbd012)https://en.wikipedia.org/wiki/Recursive\_Internetwork\_Architecture

rebolek

[21:36](#msg5c536a5d41775971a0b6e9c3)@greggirwin it makes sense. Replacing TCP with something else would need update of whole infrastructure, UDP is already supported.

BeardPower

[21:37](#msg5c536a9a13a2814df6fbd2b4)@rebolek That's a goal the EU and others are after.

greggirwin

[21:40](#msg5c536b571b62f12650800972)It will be interesting to see how effective it is, if things get pushed up to the app layer. I'd rather have experts deal with congestion control and guarantees.

BeardPower

[21:40](#msg5c536b5d9221b9382df3e8a0)Isn't it interesting that a lot of the tech is sharing the same goal? Separating mechanism from policy. exoKernels, RINA...  
"By separating mechanism from policy, RINA dramatically reduces the number of protocols required in the architecture, while still allowing each layer to be customized to provide different levels of quality of service. Applying Watson’s theory of separating port allocation from synchronisation enables simpler, more robust and more reliable data transfer protocols. "

rebolek

[21:44](#msg5c536c36c2dba5382ebd7163)@greggirwin here are two jokes, one about TCP...

&gt; Hello, would you like to hear a TCP joke?  
&gt; Yes, I'd like to hear a TCP joke.  
&gt; OK, I'll tell you a TCP joke.  
&gt; OK, I'll hear a TCP joke.  
&gt; Are you ready to hear a TCP joke?  
&gt; Yes, I am ready to hear a TCP joke.  
&gt; OK, I'm about to send the TCP joke. It will last 10 seconds, it has two characters, it does not have a setting, it ends with a punchline.  
&gt; OK, I'm ready to hear the TCP joke that will last 10 seconds, has two characters, does not have a setting and will end with a punchline.  
&gt; I'm sorry, your connection has timed out... ...Hello, would you like to hear a TCP joke?

and one about UDP...

&gt; I'd tell you a UDP joke but I don't think you'd get it.

Of course, the network is much more reliable these days ;)

BeardPower

[21:45](#msg5c536c769221b9382df3ee6b)lol

greggirwin

[21:45](#msg5c536c91c2dba5382ebd733e)Bahahaha!

BeardPower

[21:46](#msg5c536c9af46373406a30edb7)What about https://en.wikipedia.org/wiki/Reliable\_User\_Datagram\_Protocol ?

## Friday 1st February, 2019

gltewalt

[00:42](#msg5c5395e5975714406b748304)Moving it to an untold amount of different implementations in the application level, instead of using the same tested software on all devices across the internet?

[00:43](#msg5c53963b8aa5ca5abf649253)Or the same handful of implementations

rebolek

[06:22](#msg5c53e5b17b68f941025162a7)It's not \*untold amount of different implementations\*, it's implemented in HTTP/3.

pekr

[06:35](#msg5c53e8a241775971a0b9f371)using UDP for such kind of stuff is imo wrong. Can you imagine protocol without ACKs on weak wi-fi connection for e.g.? Well, we will get tonnes of sub-protocols implemented over the UDP. Can't wait for a day, where my browser does not support one.

[06:36](#msg5c53e8d28aa5ca5abf666f83)On the other hand, we could revive Carl's Rebol/Services block based dialected protocol ....

gltewalt

[06:49](#msg5c53ebe7c2dba5382ec08283)“There are fifteen or so different QUIC implementations listed in the QUIC working groups' wiki pages, but far from all of them can interoperate on the latest spec draft revisions.

Implementing QUIC is not easy and the protocol has kept moving and changing even up to this date.”

[06:49](#msg5c53ec04ca428b0645370ec7)https://http3-explained.haxx.se/en/proc-status.html

[06:59](#msg5c53ee4cf46373406a33fd5a)And

“One obvious effect of implementing a new transport protocol in user-space is that we can expect to see many independent implementations.

Different applications are likely to include (or layer atop) different HTTP/3 and QUIC implementations for the foreseeable future.”

greggirwin

[22:25](#msg5c54c760f46373406a39e9d4)This is obviously a hard problem, as it goes beyond the technical. Since there was no internet before this one, compatibility was not an issue (the net is not Banyan Vines compatible :^). And for this, first internet, there was a different economic model. For Red, we need to look at how we a) keep up, and b) ease transition pain for devs and users.

## Sunday 3th February, 2019

Senenmut

[16:25](#msg5c5715ee9221b9382d0b2d2b)choice case : UDP UPD DPU DUP PDU PUD

[23:01](#msg5c5772bef46373406a4a8b7b)Hi Mister Gregg , i make efforts.  
The exact command for sending a txt file to the windows editor is :  
call "%systemroot%\\system32\\notepad.exe m.txt"]

This works !!!  
For new programmers in Red they should know that the BACKSLASH in Red is Unix like.  
Here the windows call has WIN Backslashes.

endo64

[23:05](#msg5c5773c9c2dba5382ed74496)@Mennohexo Don't forget `/show` if you want the window shown, otherwise it stays in the background: `call/show "notepad.exe test.red"`  
As system32 is already in your path, it should also work without the full path for notepad.exe.

Senenmut

[23:06](#msg5c5773f2454aad4df7ede2da)Yeah , the problem with formatted output is also solved !!! I can post here if there is interest. However i make a new gist tomorrow for details.

[23:06](#msg5c57740954f21a71a1f35433)Hi SM , ok i will check it out. Thank you.

amreus

[23:06](#msg5c57740e454aad4df7ede383)@Mennohexo You can also use the `/p` switch to `notepad.exe` to auto-print a file.

Senenmut

[23:08](#msg5c57745c7b68f941026827d8)I use this that i have here already. thanks. It has opportunities for the user to choice of printer in menue.

[23:12](#msg5c577546ceb5a2264f8c4ea0)without full path = no results i checked out

[23:15](#msg5c5776028aa5ca5abf7d0182)but call/show works too

[23:22](#msg5c57779f7b68f94102683f15)Sorry. /p switch i hace not found in documentation

[23:24](#msg5c57782a8aa5ca5abf7d0ddd)i am back tomorrow.

## Monday 4th February, 2019

greggirwin

[06:25](#msg5c57dabc41775971a0d32355)@Mennohexo :+1: Post the gist when it's ready, so others can learn from it. Thanks!

Senenmut

[09:46](#msg5c5809e3975714406b90dfe2)of course. i replaced the "save/load" routine to "write/read" for the file handling. i was mistaken that the save/load routine is more for complex data reading instead for normal file reading.

rebolek

[09:47](#msg5c580a30ceb5a2264f8fdddd)remember also, that `read`/`write` is for text files. For binary data you need to use `/binary` refinement.

Senenmut

[10:03](#msg5c580dff13a2814df6195efa)it is the easiest tool in the world.  
even this must be stable and trustworthy.  
used only for high secure passwords. offline

[10:58](#msg5c581ac8f46373406a4e9e85)code ready.  
application check in interpreter ok.  
compiling to native code from CMD Windows  
&gt;red-064.exe -c Programname.red  
exe is ready  
\========================================  
starting exe  
error message :  
The application could not be started because  
LIBREDRT.DLL is not found. A new installation of the application could solve the problem.  
\========================================  
uups. have i made a mistake in compiling ??

[11:05](#msg5c581c64f04ef00644d91dd4)do i have to place MORE than the 064.exe into the compilation folder ???

rebolek

[11:09](#msg5c581d5f9221b9382d118d06)certainly not, try `-r`

Senenmut

[11:12](#msg5c581e2a9221b9382d119132)wait

[11:19](#msg5c581fbbca428b064551cca7)ready. when klicking this .exe a black cmd window appeared for one second. nothing starts. but also no error message.

[11:20](#msg5c581ffe975714406b9177e0)the code is absolutely clean now.

[11:22](#msg5c58205fc2dba5382edb5f01)wait for a second

[11:25](#msg5c582139c2dba5382edb63c4)my mistake. it works in the compilation folder only.  
its clear , together with runtime red exe.  
sorry  
i had copied it out. my nonsense  
the exe is around 900kb great.  
if i had compiled with -c it was only 80kb great.

[11:30](#msg5c58226eca428b064551df09)i do the following now : compiling for test a very simple documentation example with GUI if it works normal.

[11:34](#msg5c582328f46373406a4eded5)same error

[11:34](#msg5c58235eca428b064551e43e)try another cmd

[11:39](#msg5c58247d13a2814df619f38f)cmd is ok. same error : LIBREDRT.DLL missing

amreus

[11:40](#msg5c5824a4975714406b919830)@Mennohexo `libRedRT.dll` must be in the same directory as the `.exe`

[11:40](#msg5c5824b5454aad4df7f22c64)When compiling with `-c`

Senenmut

[11:41](#msg5c5825068aa5ca5abf813039)yeah. it compiles without runtime even with -c flag and only starts in compilation folder , not when copied out to another folder. MAY I ASK WHERE TO GET THE LIBRARY LIBREDRT.DLL ???

amreus

[11:43](#msg5c582547454aad4df7f23182)`libRedRT.dll` is made the first time you use the `-c` option.

Senenmut

[11:48](#msg5c58269093fe7d5ac03f5660)i am working on it.

[12:00](#msg5c582979ceb5a2264f90b8ee)the DLL is still in the folder. i make a break and new session.

[12:41](#msg5c5832e9f46373406a4f50f0)Its always the same : missing DLL even if its there  
look here : exe has no runtime and is small in size  
\=========================================  
F:\\red\\red-master\\development\\\_1\\dev\_programme&gt;red-064.exe -c basicWidget.red

-=== Red Compiler 0.6.4 ===-

Compiling F:\\red\\red-master\\development\\\_1\\dev\_programme\\basicWidget.red ...  
Compiling libRedRT...  
...compilation time : 7359 ms

Compiling to native code...  
...compilation time : 238594 ms  
...linking time : 2578 ms  
...output file size : 1029632 bytes  
...output file : F:\\red\\red-master\\development\\\_1\\dev\_programme\\libRedRT.dll

...compilation time : 188 ms

Target: MSDOS

Compiling to native code...  
...compilation time : 6640 ms  
...linking time : 375 ms  
...output file size : 70144 bytes  
...output file : F:\\red\\red-master\\development\\\_1\\dev\_programme\\basicWidget.exe

F:\\red\\red-master\\development\\\_1\\dev\_programme&gt;

[12:47](#msg5c5834758aa5ca5abf819b04)But my program code is clear and "abandonly ready"

rebolek

[12:49](#msg5c5834db13a2814df61a666b)@Mennohexo enclose your code in \`

Senenmut

[12:56](#msg5c58369154f21a71a1f822b1)next step i compile the same script on my other Windows pc and then on linux. and use your '''

rebolek

[12:57](#msg5c5836c8975714406b921471)it's a backtick - \*\*\`\*\*, see the help under M :arrow\_down: in the right down corner

Senenmut

[13:05](#msg5c5838a841775971a0d58d6f)its murphys law : the code is absolutely ready , and because it is ready , there are compiling problems.

amreus

[13:23](#msg5c583cd79221b9382d126df5)@Mennohexo It's hard to say at this point since it looks like Red compiled the library and the executable. My guess is there is something atypical about your computer setup such as lacking permissions. Did you try the .exe from the command line? From Explorer? Post exact error messages.

Senenmut

[17:39](#msg5c5878e854f21a71a1f9ff9a)relax mister amreus.  
i will check it out on different computers.  
however with this post i have another issue.  
how to display a image for 2 seconds in red.  
here is the sample code :  
"  
Red \[needs: 'view]

view \[ image %test.png do\[wait 2] unview]  
"  
with this code the timer in FIRST 2 seconds THEN  
the image is displayed and stays on.  
how to set the timer SECOND ,that it unview the picture ?

[17:40](#msg5c5879201b62f12650a0719f)sorry it is " do \[wait 2 unview]

[17:45](#msg5c587a367b68f941026ecb6a)"view \[image %test.png do\[wait2 unview] ] ###and the timer in first 2seconds

[17:51](#msg5c587bb3ceb5a2264f9303b7)the script waits 2 seonds and then the image is constantly diplayed. the opposite direction. how to display the image FIRST and THEN the 2 seconds ?

[18:06](#msg5c587f198aa5ca5abf83ab78)i have the exactly WORKING code in REBOL here  
how to do this in RED ?  
"  
view/new center-face layout \[image load %test.png]  
wait delay: 2  
unview

[18:18](#msg5c588202ca428b0645547cbc)i want to add a special feature in the program. anyway i compile the existing application code on another computer for results and be back soon.

endo64

[18:43](#msg5c5887eac2dba5382ede4b9c)

```
view [image %file.png rate 0:0:2 on-time [unview]]
```

[18:44](#msg5c588829f46373406a51ba3d)For code formatting on gitter, please use triple backticks, see the markdown help on bottom right corner (the M icon).

Senenmut

[19:16](#msg5c588f7af46373406a51ee96)'''Code''' checked.

rebolek

[19:24](#msg5c589188975714406b949aea)It's \\`code\`, not 'code'

Senenmut

[19:27](#msg5c58923213a2814df61cfb42)hi again. i have results. I have compiled my code and a very simple code on another computer with winxp.  
in both cases the runtime is not compiled into the exe. thank you SM for the optional code - i will implement when normal compiling works.  
in both cases the exe is only running in the compilation folder from window or CMD.  
the exe. is very small around 80 kb.  
when copying into another folder it is not working and the error message is shown - missing libRedRT.dll  
here is the code from the very simple GUI :

```
Red [ needs: 'view 

      title: "Basic Red GUI Widgets" 
      author: "Dr.No" 
      rights: "007" 

] 

view [
below
t: text "Some text"
text 400x30 bold italic blue font-size 16 "Text with properties"
button "Click Me" [t/text: "Changed!"]
field 400 "Type something into this text entry field"
area 400x200
image %test.png ; be sure to have image there, or GUI will crash
]
```

[19:32](#msg5c58935993fe7d5ac0425070)i am starting the compiler with the command from Win-CMD :

```
>red-064.exe   -c   program.red
```

[19:56](#msg5c5898e8ca428b0645552176)its totally amazing. i have implemented the image timer code from Semseddin too. it works and looks very great and professional for that little tool.  
the only thing that lacks is

```
COMPILATION TO EXE
```

[20:17](#msg5c589dce7b68f941026fc5c0)i will send the detailed compilation text from my other computer. don't know what to do more in that matter.

[20:23](#msg5c589f2ef04ef00644dccb31)/media/hans/HAMA/compiler.jpg

greggirwin

[20:26](#msg5c58a00eca428b06455553ad)@Mennohexo if you use `-c`, the runtime is compiled to an external DLL (which saves recompiling time, and can also be very useful if you have a suite of apps that can share it). Use `-r` on the command line for "release mode" which compiles to a standalone EXE, with the runtime included.

[20:27](#msg5c58a046f04ef00644dcd115)That means it has to compile the runtime each time, which is slower. So `-c` is good while you're working on an app, as it's fast. Then use `-r` when you're ready to send it out to others.

Senenmut

[20:39](#msg5c58a2f3f04ef00644dce5af)only -r ???

[20:42](#msg5c58a3b454f21a71a1fb36c7)Both computers are compiling now only with -r flag.

[20:50](#msg5c58a59b454aad4df7f5c74a)on the first computer with -r flag compiling the exe is around 980kb great. Opening only in compilation folder with a black cmd. But is not opening in another folder.  
It's not standalone compiled.  
Lets see the other computer.

[20:52](#msg5c58a6077b68f941026ffb4e)The same thing. Not opening in open terrain. Only a black cmd appeared for 1 second. compilation fails.

[20:54](#msg5c58a6979221b9382d1565d7)I send here the complete compilation code from winxp cmd with the -c flag. It compiles but the exe is not working.

```
C:\red>dir
 Datenträger in Laufwerk C: ist hanser
 Volumeseriennummer: 4851-ACDB

 Verzeichnis von C:\red

04.02.2019  21:26    <DIR>          .
04.02.2019  21:26    <DIR>          ..
04.02.2019  20:19            70.144 basicWidget.exe
27.04.2016  12:41               414 basicWidget.red
27.01.2019  20:50            69.632 button.exe
27.01.2019  19:56                69 button.red
23.04.2016  11:39           137.261 datapicture.png
04.02.2019  10:11             3.797 hs_software.png
23.04.2016  19:45            21.310 hs_software_logo.png
27.01.2019  20:47           264.118 libRedRT-defs.r
27.01.2019  20:50               901 libRedRT-extras.r
27.01.2019  20:47            58.861 libRedRT-include.red
27.01.2019  20:50         1.029.632 libRedRT.dll
04.02.2019  19:53            47.128 Password-Base_CLONE.red
05.02.2018  12:23            46.478 Password-Base_FERTIG.red
27.01.2019  18:35         1.234.939 red-064.exe
23.04.2016  11:52           166.212 test.png
04.02.2019  10:11             3.018 user-exit-512.png
              16 Datei(en)      3.153.914 Bytes
               2 Verzeichnis(se), 53.692.432.384 Bytes frei

C:\red>red-064.exe -c  Password-Base_CLONE.red

-=== Red Compiler 0.6.4 ===-

Compiling C:\red\Password-Base_CLONE.red ...
...using libRedRT built on 27-Jan-2019/19:47:18
...compilation time : 1578 ms

Target: MSDOS

Compiling to native code...
...compilation time : 9922 ms
...linking time     : 453 ms
...output file size : 82432 bytes
...output file      : C:\red\Password-Base_CLONE.exe


C:\red>
```

.

[20:59](#msg5c58a7b793fe7d5ac042dc9d)next is send the compilation code with the -r flag.

[21:10](#msg5c58aa3fca428b064555933d)Sorry - but the exe is not working outside folder. even if the compilation process is alright.

[21:13](#msg5c58aaec454aad4df7f5f0ba)

```
Verzeichnis von F:\red\red-master\development\_1\dev_programme

04.02.2019  20:57    <DIR>          .
04.02.2019  20:57    <DIR>          ..
16.03.2016  23:40            29.726 222.jpeg
18.02.2016  11:54               145 append-1.red
18.02.2016  11:59               148 append-metaprogramming.red
19.04.2016  18:21               765 arnold_1.red
17.02.2016  17:36                43 ask.red
04.02.2019  13:33            70.144 basicWidget.exe
27.04.2016  12:41               414 basicWidget.red
03.02.2016  16:50               371 basicWidget_2.red
04.02.2019  19:03               132 bild.red
27.01.2019  19:56                69 button.red
05.03.2016  22:48               578 calculate.red
18.04.2016  21:39               346 calculator.red
05.03.2016  22:51                46 center_face_layout.red
05.03.2016  23:55               303 compliant_generator.red
18.02.2016  08:39               395 conditional_evaluations.red
19.02.2016  08:53               235 console-interface.red
23.04.2016  11:39           137.261 datapicture.png
05.03.2016  22:50                88 drop_down.red
23.04.2016  15:17               552 ERSATZCODE.red
19.04.2016  19:19               153 Farbencheck.red
17.02.2016  09:29               199 fun1.red
19.02.2016  11:18               172 func.red
22.02.2016  10:35               174 GUI_1.red
27.04.2016  18:28               312 GUI_2.red
19.02.2016  09:13               113 GUI_3.red
19.02.2016  15:46               525 GUI_4.red
22.02.2016  10:35               250 GUI_5.red
19.02.2016  09:48                68 GUI_5_check.red
19.02.2016  09:56               156 GUI_6.red
19.02.2016  10:00               148 GUI_7.red
19.07.2016  07:23               385 GUI_Example-1.red
28.03.2016  00:43               127 GUI_Example-2.red
19.02.2016  12:22               127 GUI_Example-3.red
19.02.2016  12:25               193 GUI_Example-4.red
19.02.2016  15:46               409 GUI_Example-5.red
23.04.2016  11:51               338 GUI_mit-Bild.red
31.01.2016  15:55                80 hello.red
14.06.2017  21:18                31 helloworld2.red
03.02.2016  19:24               363 histogram.red
04.02.2019  10:11             3.797 hs_software.png
23.04.2016  19:45            21.310 hs_software_logo.png
25.06.2016  16:55               190 input.red
14.06.2017  21:19               593 LABEL_GUI.red
22.04.2016  22:34                71 LABEL_simpel.red
09.03.2016  12:39               251 layout.red
02.02.2016  16:06               246 layout_download.red
04.02.2019  13:30           264.118 libRedRT-defs.r
04.02.2019  13:33               901 libRedRT-extras.r
04.02.2019  13:30            58.861 libRedRT-include.red
04.02.2019  13:33         1.029.632 libRedRT.dll
18.02.2016  13:12               138 lists-file.red
18.02.2016  13:06               258 lists.red
22.02.2016  10:35                93 list_loops-1.red
19.02.2016  18:18               114 list_loops-2.red
19.02.2016  18:51               145 list_loops-3.red
19.02.2016  18:54               169 list_loops-4.red
19.02.2016  19:07               163 list_loops-5.red
19.02.2016  19:19               191 list_loops-6.red
19.02.2016  19:27               178 list_loops-7.red
19.02.2016  20:04               192 list_loops-8.red
28.04.2016  17:11               553 logout_procedure.red
18.02.2016  17:32                98 loop-1.red
18.02.2016  17:36               126 loop-2.red
18.02.2016  18:01               267 loop-3.red
18.02.2016  18:59               273 loop-4.red
18.02.2016  19:58               288 loop-5.red
19.02.2016  08:29               152 loop-6.red
17.02.2016  10:08                93 loop.red
18.02.2016  13:12                33 mynames
04.02.2019  21:44               615 mytext_A.txt
04.02.2019  21:12                 8 mytext_B.txt
04.02.2019  20:53                14 mytext_C.txt
04.02.2019  19:34                 4 mytext_D.txt
04.02.2019  19:54                 5 mytext_M.txt
05.03.2016  22:51               322 panel_box_radio.red
18.04.2016  19:01               455 Password-Base.red
04.02.2019  21:43           991.232 Password-Base_CLONE.exe
04.02.2019  20:57
```

[21:14](#msg5c58ab2113a2814df61dab1f)

```
04.02.2019  20:57            47.141 Password-Base_CLONE.red
05.02.2018  12:23            46.478 Password-Base_FERTIG.red
23.04.2016  11:16             1.148 Password-Base_nur-Zahlen.red
18.04.2016  18:06               394 Password-Base_Version-2.red
17.02.2016  19:04               177 password.red
22.04.2016  17:14               273 Password_2.red
21.04.2016  21:46               287 Password_Datasheet.red
22.04.2016  13:45                83 Password_Data_Probeblatt.red
22.04.2016  22:13               726 Password_LABEL.red
22.04.2016  14:30               128 Password_TAB.red
19.04.2016  18:10               159 Password_Test_1.red
23.04.2016  13:18               587 PRINTER_Code.red
22.02.2016  12:53               303 Probe.red
03.02.2016  16:42               325 quiz.red
27.01.2019  18:35         1.234.939 red-064.exe
04.02.2019  19:16            11.221 saved.jpeg
04.02.2019  20:38            57.354 saved.png
18.04.2016  16:49                51 simplest_window.red
14.04.2016  15:57                62 simplest_window_2.red
22.04.2016  23:27               949 simple_text-editor.red
14.06.2017  21:23                11 somedatafile.txt
05.03.2016  22:50                92 TAB.red
03.02.2016  14:20               286 tabpanel.red
23.04.2016  11:52           166.212 test.png
27.04.2016  13:42               378 TEST_Ressources.red
17.02.2016  13:55               424 texteditor.red
23.04.2016  20:26               406 Text_list_MANY-rows.red
18.02.2016  08:52               100 text_string.red
18.02.2016  08:52                82 trim.red
04.02.2019  10:11             3.018 user-exit-512.png
22.02.2016  10:35               289 widgetlist.red
17.02.2016  13:55               310 window-3.red
31.01.2016  16:05                54 window.red
             110 Datei(en)      4.196.680 Bytes
               2 Verzeichnis(se),  4.267.225.088 Bytes frei

F:\red\red-master\development\_1\dev_programme>red-064.exe  -r  Password-Base_CLONE.red

-=== Red Compiler 0.6.4 ===-

Compiling F:\red\red-master\development\_1\dev_programme\Password-Base_CLONE.red ...
...compilation time : 8406 ms

Target: MSDOS

Compiling to native code...
...compilation time : 239328 ms
...linking time     : 1906 ms
...output file size : 991232 bytes
...output file      : F:\red\red-master\development\_1\dev_programme\Password-Base_CLONE.exe


F:\red\red-master\development\_1\dev_programme>
```

[21:14](#msg5c58ab4313a2814df61dac77)I am not able to compile a stand alone exe.

Oldes

[21:33](#msg5c58afb3454aad4df7f612eb)@Mennohexo what does it means that \_the exe is not working\_?

[21:35](#msg5c58b020ceb5a2264f947c07)Does your script works when you run it from Red's console? (interpreted)

greggirwin

[21:38](#msg5c58b0ceceb5a2264f948236)Assuming you're compiling for Windows (`-t Windows`) and have `needs: view` in the header, can you compile a very simple view app that works?

rebolek

[21:38](#msg5c58b0f178e1ed4103e10556)I see `Target: MSDOS` in the log.

greggirwin

[21:39](#msg5c58b11241775971a0d8d6bd)Hence my question.

rebolek

[21:40](#msg5c58b134f46373406a52d77a)Ah, OK.

Senenmut

[21:40](#msg5c58b14e41775971a0d8d802)YES ! COMPILING WORKS ! BUT EXE IS NOT WORKING OUTSIDE THE COMPILATION FOLDER ! I try to use the "MASTER BUILD RED EXE" for RED  
YES ! I am on Windows XP Computer. Both ones. I have downloaded the Masterbuild exe and are compiling RED new. Then check it out with this.

[21:41](#msg5c58b19bc2dba5382edf6162)No Gregg , a simple app , code i have posted here , is not working OUTSIDE too. Regards MH

[21:43](#msg5c58b20b13a2814df61ddd93)The interpreter works FINE ! Application is ready. Looks good and professional.

rebolek

[21:44](#msg5c58b23513a2814df61ddee0)@Mennohexo Are you using any images in your app?

Senenmut

[21:45](#msg5c58b25cf04ef00644dd4bfd)Yes , many .png

rebolek

[21:45](#msg5c58b27b454aad4df7f624df)That's probably the reason, if you move the exe out, it can't load the images.

Senenmut

[21:48](#msg5c58b32a93fe7d5ac0432eb9)that comes from the hectic here. my mistake. i make it again and be back soon.

rebolek

[21:49](#msg5c58b353975714406b957e8d)You either have to copy the images together with the exe or include the images in the source.

Senenmut

[21:49](#msg5c58b3827b68f9410270567b)how could that mistake happen to me ?

rebolek

[21:50](#msg5c58b3a241775971a0d8e894)You probably thought it get included automatically, everyone makes mistakes :)

greggirwin

[21:51](#msg5c58b3e978e1ed4103e118a8)As with the external runtime option, Red let's you decide if you want resources included in the EXE, or kept separate. If separate, you have to ship them with the app of course.

Senenmut

[21:54](#msg5c58b49bca428b064555d89b)That comes from the hectic. Funny that i have version 1.0 already for 2 Years download also with the external picture files. But now , in this session i forgot it. Oh no.

greggirwin

[21:55](#msg5c58b4b4f46373406a52f0a8):^) Happens to all of us.

Senenmut

[21:57](#msg5c58b531f46373406a52f3f3)Ok. i only past a new issue here with complete ready new gist and the rewritten application. I block the picture parts so the code can be started direct.

[22:01](#msg5c58b64d41775971a0d8fba4)coffee

[22:05](#msg5c58b717f04ef00644dd6d8c)if i can drag and drop files to gist , then i drop the pictures.

[22:10](#msg5c58b8417b68f94102707a0d)Hello Gregg , it works. ALL CLEAR !

[22:12](#msg5c58b8c9975714406b95a9f0)One last question before i deliver the FINAL VERSION.  
Is it possible to hide the black cmd window in Red application that is starting together with the application in background or is it definetly part of application ?

greggirwin

[22:57](#msg5c58c358ceb5a2264f94f4b5)If you use `-t windows` when compiling, the black command window should not appear.

Senenmut

[23:38](#msg5c58cce51b62f12650a2b6cc)Here is the link to gist. Complete application in red. A link to my server is indicated to download the complete files as zip and IMMEDIATELY RUN in RED PROGRAMMING.  
https://gist.github.com/Mennohexo/4f6af7332cf60c29ee9f32f9fe8dde03  
Only my LOGO as programmer i have replaced with a KUNG FU Picture of me. ha I HAVE DELIVERED ! IT WORKS ! NOONE CAN SAY OTHERS !

## Tuesday 5th February, 2019

Senenmut

[08:36](#msg5c594b10ceb5a2264f9845ff)https://github.com/Mennohexo/EasyPasswordBase.red

good morning , here is the git repository with a complete red application for download and test red in your programmers editor.  
Remember : everything is working in RED  
And : programming is FUN

rebolek

[08:58](#msg5c595043f46373406a56a8a2)@Mennohexo Great!

But why instead of repeating almost same code for each letter, you don't write just one function that takes letter as argument and generates the View block?

Senenmut

[09:06](#msg5c5952071b62f12650a5ee49)everthing can be improved. here the simplest approach with the simplest data processing is used. i know that it can be made better. one thing is shure : it works.

[09:14](#msg5c5954007b68f94102743328)without the code sniplets from Semseddin it could not been made so fast here. thanks

[09:23](#msg5c5955ff454aad4df7f9fc6a)you can question : why are you making one file for every letter and not only ONE file to store the data with a style like for example - array.  
In this easiest application IF one .txt datafile is destroyed or corrupted for any reason - the rest remains. even if a backup is already made  
you can destroy one file but not many at the same time

rebolek

[09:24](#msg5c59563b1b62f12650a60541)I understand that, I was talking about the view block, it can be easily done with `compose` for example.

[09:24](#msg5c59566a41775971a0dcdf49)Something like for example:

```
win: func [letter] [ 
    compose/deep [   
        title (rejoin ["Datasheet for letter " letter])  
        a: area  750x500     font-size 10 bold 
        below   
        field 40x50 (letter)  red font-size 30 bold 
        below 
        image %datapicture.png   
        text  "     Hans Schueren Software Germany"       
        do (to word! rejoin ["start_" letter]) 
        button "Save" font-size 10 bold [ 
            write (rejoin [%mytext_ letter %.txt]) a/text 
            unview                                                 
            view [ title "SAVING" image %saved.png  rate 0:0:1 on-time [unview]]  
        ]  
        button "Print" font-size 10 bold [call/show (rejoin ["notepad.exe  mytext_" letter ".txt"])] 
        button "Exit" font-size 10 bold [unview]   
    ] 
]
```

[09:25](#msg5c59568754f21a71a1ff91de)and of course `start_` could be turned into a function too.

Senenmut

[09:28](#msg5c59573a41775971a0dce4d2)i know. if you have the knowledge stage of the programming language , then it is normal. The beginner in Red can understand my simple code.

[09:59](#msg5c595e9d975714406b99a896)most programming languages have not the problem to improve code , instead the GUI is not working because the external library bindings are not working as expected. not to mention if networking is then implemented. that are the problems of others.

[10:45](#msg5c59694654f21a71a1000a2e)red-064.exe -r -t program.red  
i use THIS console in windows os :  
https://sourceforge.net/projects/console/

[10:50](#msg5c596a6093fe7d5ac0479b06)again abandonly clear :  
red-064.exe -r -t Windows program.red  
standalone executable

[11:39](#msg5c5975f11b62f12650a6c6a7)Last Issue for that Application :  
Hello ,  
i have a last issue for exe deployment.  
by so many postings from me here i hope you are motivated for my question here.  
Furthermore ,  
the absolutely last issue for deployment is also interesting and important to new red programmers.  
it is the issue of the RESOURCES OF THE EXE.  
Last time i have used a RECOURCE HACKER TOOL to  
change the ICON of the exe and to entry the VERSION/DESCRIPTION/COPYRIGHT  
So my question :  
May i ask if someone know a documentation for that issue or a example how to do this.

WBR  
MH

[12:03](#msg5c597b96454aad4df7faef3c)i got it partly

rebolek

[12:04](#msg5c597bbe454aad4df7faefbc)AFAIK you can change icon (in compiled exe), not sure about the rest.

Senenmut

[12:06](#msg5c597c4bf46373406a57ccc3)thank you rebolek for your "long breath" in programming matters.

rebolek

[12:06](#msg5c597c61f46373406a57cd09)you're welocme

Senenmut

[12:15](#msg5c597e5d13a2814df622d2fb)All except the icon works here with :

```
Red  [needs:  'view
            Title:  "your program name"
            Author : " your name"
            Version: 1.1.0.0
            Company :  "barbarian soft"
             Rights:  "author your name"
             License:  {  MIT + http link is possible }
             ]
```

type this in you header of script and the exe has all descriptions in the context menue.  
Only the ICON has then to be changed.  
With a external tool.

Now , the absolutely last step is taken for th programmer to make and deploy a little application.

IF a simple application works , THEN every complex application work in RED too.  
.......  
Thank you for your attention.  
I am out and take a break to new issues here.  
SUCCESS == RED

rebolek

[12:16](#msg5c597ea9ca428b06455ab62a)Icon needs adding something like `Icon: %file.ico` to header. I'll try to find some documentation.

[12:18](#msg5c597f0aceb5a2264f999e90)Yes, that'đ it. Not sure if it'đ documented somewhere, but see this line in GUI console, where it's used: https://github.com/red/red/blob/dafc8286e472926dc57d1788c3e069d2950f16b8/environment/console/GUI/gui-console.red#L6

Senenmut

[12:38](#msg5c5983de41775971a0de091a)Icon: %app.ico  
compiled  
YES it works.  
i am out : coffee

[13:20](#msg5c598d8f7b68f9410275a38b)i make place here for : a week

## Friday 8th February, 2019

Senenmut

[22:12](#msg5c5dfecd126af75deb739a6b)Sorry to disturb so soon. Its weekend and everybody wants to lie on the beach with tequila and snacks but i have found a mirror in my code.  
clipboard erasing - previous :

```
write-clipboard ""
```

clipboard erasing- now : \`write-clipboard " "  
a empt spacetab minimum.

[22:12](#msg5c5dfeebef98455ea40235a1)

```
write-clipboard " "
```

[22:55](#msg5c5e08d428c89123cb98491e)I checked out the clipboard erasing code on another computer. It is not secure working. On one computer the clipboards erased , not yet on the another.

```
write-clipboard " "
```

one empty space inside.  
there must be a different command to overwrite or erase the clipboard of the windows os.

[23:00](#msg5c5e0a208328315decc0bda8)i taste

```
write-clipboard "ABC"
```

[23:11](#msg5c5e0c9badf6cb0b2c87ce48)no , it is not working in compiled exe. ONLY in red interpreter mode from programmers editor. this is an issue to solve.

[23:39](#msg5c5e131b5095f6660cc03821)from interpreter mode it writes "ABC" to clipboard. from .exe it writes nothing.  
However , i don't want to disturb in this rude manner.  
Hey , if you see Daniel Craig on the beach then tell him greetings from MH.

## Saturday 9th February, 2019

Senenmut

[16:21](#msg5c5efdfc7502282258d179bc)hi there , any help in this issue ???

greggirwin

[20:31](#msg5c5f38aaef98455ea40a4171)@Mennohexo, confirmed. It seems that `write-clipboard` doesn't work when compiled. Please file a ticket for it. Good catch.

Senenmut

[20:32](#msg5c5f38e3604f233ab6e0ea89)it is a pleasure.

[21:08](#msg5c5f413a126af75deb7bcf93)i have posted under red/red new issue

[21:30](#msg5c5f466eadf6cb0b2c8fab0d)now i make room here for other programmers. So much postings here. break for a few days on a Azimut-Trideck-Yacht in the sun.

## Wednesday 13th February, 2019

Senenmut

[13:03](#msg5c6415a5604f233ab601cb77)@greggirwin  
hi gregg.  
i think the problem lies in WinXP.  
a little bit outdated. here it definetly not works.  
like in the ticket conversation described it is working on W7.  
so i have to change my computer to updated OS.  
however , not yet.  
anyway i have a up to date Unix running here.

rebolek

[15:51](#msg5c643d124003460b2d44c843)XP is not supported by Red anymore.

9214

[16:03](#msg5c643fe0ef98455ea42c7dc4)@rebolek to be precise, View support for XP was dropped, because its GUI system lacks many features (e.g. hardware-accelerated rich-text support and Direct2D). Core parts should work more or less the same.

Senenmut

[18:09](#msg5c645d5fdc3f0523ccacf706)well , i was a little bit sloppy about the win computer.  
its because i use UNIX for a couple of time.  
not for cost reasons but for programming reasons.  
unix has many build in features that can be called normal in programming code.  
also i suppose to clone the whole winOs with boot cd could not work properly in new version.  
however , its time to change winOS. i know.  
7 is also out of date this year.  
ok. i will make it. I swear by the RED Planet.

[18:33](#msg5c6462f228c89123cbc2bb84)it takes a huge amount of time to change the OS ---huuuuuuuuuuuuuuuuuuuuh

rebolek

[18:55](#msg5c64683c126af75deb9ed1f3)I understand, I'm only Linux mostly (and macOS, when I've got time), I just have Windows in VirtualBox for Red GUI testing.

Senenmut

[19:12](#msg5c646c25126af75deb9ef210)my goal is to handle both - accurat  
\- strict divorce of the systems

[19:16](#msg5c646d1fdc3f0523ccad7b57)i change it. and take the time for that.

9214

[19:32](#msg5c6470ebd1e3093ab515f77c)@Mennohexo keep this room on-topic please.

Senenmut

[19:35](#msg5c64716fdc3f0523ccad9872)yeah , i make a break , my app is ready.

## Friday 15th February, 2019

Senenmut

[11:39](#msg5c66a50328c89123cbd26f4a)@rebolek  
Question : What kind of special tool should a linux programmer have always , and accountable in his cupboard ? Guess.

innitheblindsw

[14:40](#msg5c66cf51604f233ab6155664)I don't know

rebolek

[14:49](#msg5c66d17c126af75debaf7aaa)@Mennohexo special tool? special for what? I think it depends what you want to do

Senenmut

[16:45](#msg5c66ec9e28c89123cbd4880d)a cleaned , loaded MAGNUM - Gun  
Model --- chmod 0777

mk6032

[20:33](#msg5c6722154bafd97ca3fb1362)Hi, just a request to attempt to list your token on other exchanges, particularly the distributed exchanges like radarrelay, etc. I noticed RED on tokenjar.io now. I placed a order several days ago that still hasn't been completed. :(

[20:41](#msg5c6723f516e4682259ac662c)Alternatively -- https://blog.0xproject.com/introducing-0x-instant-7314c786d743?gi=520fdce8f3b6

[20:42](#msg5c672419adf6cb0b2cc5e645)thanks for your time and consideration

9214

[20:44](#msg5c67249880df6804a1af8209)@mk6032 we don't plan for any new exchanges. And please move all token-related discussions to a \[dedicated channel](https://t.me/redofficial).

## Monday 18th February, 2019

strpipe

[14:20](#msg5c6abf37dc3f0523ccd70109)Hello, I am a C# developer and would like to know how the whole thing about testing and dependency injection is solved when programming in red.

rebolek

[14:27](#msg5c6ac0bb750228225806ce9c)Hi @strpipe , that's very broad question, do you have something specific in mind?

strpipe

[14:28](#msg5c6ac10eecef85660bc76527)No, I do not. Does this mean you do it in the same manner?

rebolek

[14:29](#msg5c6ac12c604f233ab62e5256)In the same manner like what?

strpipe

[14:29](#msg5c6ac13f5095f6660c14ddb5)Dependency Injection, so thet you can mock them out during testing

[14:30](#msg5c6ac19becef85660bc7698c)I actually have to go now :-( Please drrop me an answer, I will see it in two to three hours.

9214

[14:58](#msg5c6ac82a16e4682259c2e72b)@strpipe DI is a pattern that you may or may not follow, so your question makes no sense to me. Be specific.

Red isn't an object-oriented language like C#, and mainstream OOP practices don't apply naturally here, so you shouldn't think in terms of setters / interfaces / constructors / whatnot, if that's what you're asking.

As for unit testing and mocking - Red's "unit" is code itself (`block!`), or maybe even a value slot, but not an object, and "dependency" can be any data. Perhaps you should learn language a bit to get the main idea and see if it answers your question.

strpipe

[16:00](#msg5c6ad6894003460b2d700596)yes, I might give it a try. I did not want to offend anyone, or use up someones time. Thank you for your answer.

9214

[16:15](#msg5c6ada378328315dec160065)@strpipe you can't offend anyone by asking questions in a room specifically created for answering them :wink:

greggirwin

[19:57](#msg5c6b0e2f750228225808f2bc)@strpipe, +1 for getting familiar with Red first. Coming from C#, it will be a big mindset shift. That is, trying to use Red as you would C# will make you fight the language more than leverage it. Red/System is more like C (not C#), if you work at that level.

Regarding Dependency Injection, while Red has objects it is not primary an OOP language. That said, you can very easily use the primary DI approaches when making objects, or setting values in them once they already exist, and I'll disagree with @9214 here a bit, as that will work just fine. Piece of cake even. What you'll miss is strong typing of interfaces. Red has a \*lot* of datatypes, and deep reflective capabilities, so rolling a system to check interfaces can be done (some of us even have experiments), but it's not there by default. There are many ways you could tackle it, and there is no "best" way.

[19:58](#msg5c6b0e6d28c89123cbee87c1)To start, learn how `make` and `construct` are used to create objects from specs and prototypes.

9214

[20:26](#msg5c6b1509ecef85660bc991d7)... except that you don't need objects to use the main DI idea in a data-rich, homoiconic language, and suggesting to "use the primary DI approaches" in Red to a C# programmer is like asking to put the (static, class-based) cart before the (dynamic, prototype-based) horse. Language should be learned first, methodologies then can be applied on top of it in an idiomatic way. Otherwise we'll stuck in the world of "variables" with "scopes" and "classes", where everyone writes Red as if its a glorified Python or C.

gltewalt

[22:23](#msg5c6b305fc4da4a11f579dbe2)I think what some are looking for are analogies in order to speed up understanding.

greggirwin

[22:35](#msg5c6b332c9155d45d90388725)What @gltewalt said.

9214

[22:35](#msg5c6b334a7667931e2fc3461c)@gltewalt if anything, you shouldn't look for them in other programming languages.

greggirwin

[22:36](#msg5c6b3380b6c74f1e2e73b570)We have to give people guideposts and stepping stones. If we demand that everyone throw away everything they know in order to try Red, we'll deter a lot of people. Yes, there is a big win when you \*really* learn Red, and how to use it, but people have to start somewhere.

## Tuesday 19th February, 2019

strpipe

[08:40](#msg5c6bc109c776985d8f1977c8)@greggirwin and the others: Thank you very much. I have some time each week and will use it to look into red.

[08:42](#msg5c6bc15bab952d30855686b2)you have helped me understand that red really does things differently and I want to learn about it.

rebolek

[08:42](#msg5c6bc167c4da4a11f57d3d87):+1:

## Friday 22nd February, 2019

virtualAlan

[00:17](#msg5c6f3f8ac776985d8f30c269)I added a Red slideshow app here .... might be useful .... http://www.mycode4fun.co.uk/red-apps .... Could also be some other stuff of interest .... Please check it out ....

pimgeek

[03:15](#msg5c6f695d00aa630d9af017ff)@virtualAlan I must say thank you for your beginner reference, it's really helpful, with very good example codes, some of which I cannot find on Red by Example site. 😊

toomasv

[05:16](#msg5c6f8592a378ef11f61d79e2)@virtualAlan Nice! :+1:

## Sunday 24th February, 2019

virtualAlan

[23:41](#msg5c732b987667931e2ff619ee)Thanks @pimgeek and @toomasv - I have also added more to my beginners reference: http://www.mycode4fun.co.uk/red-beginners-reference-guide hope it's helpful ....

## Monday 25th February, 2019

pimgeek

[01:38](#msg5c734716c82c68509e2f123f)@virtualAlan it's very helpful, and also consider add DISQUS or utteranc.es to your blog posts, new learners may need it to give other feedbacks. :-)

greggirwin

[22:37](#msg5c746e30d98a4d50760a3d15)Thanks for the update @virtualAlan.

## Friday 1st March, 2019

Senenmut

[09:02](#msg5c78f519b1503b3d705fe3c9)Why is red the best programming language in comparation to other high style languages ?

[09:22](#msg5c78f9ee212d0c1e1ab4a208)Because there is no object , no function or other strict predefined methotology only if the programmes self is deciding to MAKE such a thing. you can program step by step from ground up. and of course you have the ability to make it very complex but you must'nt. that is real programming.

[09:32](#msg5c78fc280966d9120404710e)What is the absolut opposite to this programming approach ? a supermarket like - smalltalk lang

Respectech

[22:49](#msg5c79b70e53efa9120399d182)Probably something like Haskell, which is very strict in the way to program.

## Saturday 2nd March, 2019

Senenmut

[21:28](#msg5c7af57b35c0130753654c6f)hi , yes i mean today , in theese evolved programming times , frames for programming are used more often , such like web programming frames , overloaded IDEs that have to much functions , visual gui designers that are producing code in a predefined way and manner. fact : you only USE a software for programming. not a build up concept on a plain white sheet. fact 2 : it becomes more complex as you know anyway to make a good application ready even by a step by step approach. In theese modern times the danger is to become a user of software instead of a Thinker and real Coder. that is my standpoint. @Respectech

[21:34](#msg5c7af703d2d62067b732dfa7)Someone who makes that job is not a programmer nor a network coder but a worker named software architect.

## Monday 4th March, 2019

Senenmut

[12:21](#msg5c7d184f212d0c1e1ace9e93)hey - freakman - need a professional installer for your red application ? here you are : http://www.ssesetup.com  
power to the hacker

## Tuesday 5th March, 2019

Senenmut

[09:34](#msg5c7e42bee8ea143737b58c63)cool or cool ?

rebolek

[09:41](#msg5c7e44618a7def075217ee96)I don't know, my rep apps are so small they don't need installer. And I'm not on Windows anyway, so hard to say.

Senenmut

[09:57](#msg5c7e4823d2d62067b7480807)yeah , only for windows programmer.

[10:06](#msg5c7e4a20d2d62067b74816b3)@rebolek  
"writing from unix os" ;;;

rebolek

[10:53](#msg5c7e552e65ffa019ea8e4571)Well, I would love to writer from AmigaOS, or even better, RedOS :smile:

Oldes

[10:57](#msg5c7e5630c1cab53d6f7b23b5)@rebolek you can run AmigaOS in \[WinUAE](http://www.winuae.net) from \_not so real OS as you use\_.

rebolek

[11:00](#msg5c7e56cc4a65f754736966cb)@Oldes "not so real OS" - I just wrote that I'm not on Windows, that's all. Anyway, there are Amiga emulators for macOS and Linux too, but 1) it's not the real thing :) and mainly 2) AmigaOS is 80s/90s technology and is really lacking today.

GaryMiller

[20:13](#msg5c7ed870cbebcf784a45f20f)The professional installer would be good if it could set up the REBOL build environment and rebuild everything from the latest updates. As it is I'm guessing that many like me are just waiting for the next stable release that's easily downloadable. You could have check boxes for installing the most popular RED Utilities and up to date documentation. It sames the beginner from going lots of places and trying to guess which pieces are up to date.

greggirwin

[21:27](#msg5c7ee9ad2ca5ec547481d409)@GaryMiller the point of having a single binary to download is to make things easier on the user. We don't want to put effort into Rebol dev setups, since that is the past, and self hosting is the future. Up to date documentation will probably always be online, though local doc tools will pull and cache that.

## Wednesday 6th March, 2019

Senenmut

[09:16](#msg5c7f8fec1c597e5db690859b)hi , yeah , why strictly compile all pictures and additional files in the red exe. It is normal for the programmer to have many additional files except the red .exe Every portable application has many files even complete folder structures when starting from USB Stick. The installer is for user who dont want to have involved with nothing.  
Newest OS and hardware -- Download a file -- klicking the damned file -- installer starts -- installing ready -- new start -- COFFEE. enjoy the RED application.

Oldes

[09:53](#msg5c7f988e1c597e5db690c736)The installer usually does what Red does too... it packs assets into an exe and extract them into specified locations. If you don't want to install system with several GBs, no need for it. Also the epoch when people had to learn what is ZIP file is also over. I believe.

[09:54](#msg5c7f98e1bf7990126e5a4d77)But nobody stops you use whatever installer you want with your projects.

[09:56](#msg5c7f9959b4b6ef7bc8648f3b)Please note, that your \_installer_ is 6MB download... which will be also compressed, so you really advice we should use it to install Red, which has around 1MB?

[09:58](#msg5c7f99e08f294b134af8554e)Not mentioning that is is closed source, and although they claim they are \_Certified free of Malware &amp; Spyware\_, for me it is a no-go.

[10:04](#msg5c7f9b267851db134978376c)And if you really need an installer, than I recommend using \[NSIS](https://nsis.sourceforge.io/Main\_Page) - as a comparison, its setup is \_only_ 1.5MB.

Senenmut

[10:06](#msg5c7f9b9cc8e5bc5162f62a31)relax , it is only a option to choose. i posted the link because a programmer has made real hard work and is offering it as free for programmers choice of distribution software. if someone like it.

rebolek

[10:08](#msg5c7f9c063162ec7bc7289860)@Oldes your link doesn't seem to work.

Oldes

[10:09](#msg5c7f9c6fd3b35423cb72cc2a)it's working fine for me.

rebolek

[10:10](#msg5c7f9c950a6b915163e3b78b)"Sorry! This site is experiencing technical difficulties."

Oldes

[10:12](#msg5c7f9d05b4b6ef7bc864a9b8)That is not my problem... I'm not selling it... I just wanted to send an open-source alternative.

greggirwin

[19:58](#msg5c802674f895944c08503689)@Oldes, I've always wanted to create a portable Redbol version of NSIS.

Senenmut

[20:41](#msg5c80306c86e34a126f9a8634)hi again , what do you recommend for (SAM) Software asset management tool for licensing your application ?

[20:54](#msg5c803380d3b35423cb7701a3)i mean if you want to make commercial red application and a license controlling. comes sooner as you can imagine. wait , i think i have read that a commercial version of red is planned too. so this question is resonable for a programmer.

[21:06](#msg5c803660d1e7281f09e7cc89)For example : http://www.softwarekey.com  
ok we speak about IF. not yet.  
has someone experience with such a tool ?

## Friday 8th March, 2019

endo64

[09:58](#msg5c823cc90a6b915163f5740b)For installers, inno setup is a very good open source alternative which has a good supporting community and scripting support. I have used it over 10 years for very complex setup projects that installs .net framework, sql server express, php etc.

Senenmut

[21:04](#msg5c82d8f6e527821f0a27d1e6)yeah , a cool thing. really

## Tuesday 12nd March, 2019

topcheese

[17:57](#msg5c87f30b2f2fb54c37dc430d)Hi, I just started with Red so I haven't given it much thought, but I was planning on using something like Zero Install keeping it simple like Red. https://0install.de/

greggirwin

[20:08](#msg5c8811b3ac408e11924c02a7)Funny how installers never die, as a category. It's something we'll need to address, as people will need to deploy things for real, soon. I did an installer many years ago, and can check on what code I could release (Roxy, with Maarten Koopmans, if he's listening). We can collect info on NSIS, 0Install, and others, then need a champion to lead the charge. Not yet though. Gather information first, as we'll want modules in place too.

[20:10](#msg5c881241b4b6ef7bc89bccbe)@topcheese, feel free to start a wiki page for notes, if you'd like.

topcheese

[20:30](#msg5c8816fb25e4e24c075bb1c5)I'll be more than happy to, what should I call it "Deployment Tools/resources"?

greggirwin

[20:33](#msg5c881786b4b6ef7bc89bf579)Deployment Tools sounds good. Thanks!

topcheese

[22:36](#msg5c8834711c18c82b3cff6104)It's done. I didn't know what to really put so far, but I'll try to stay tuned in.

[22:40](#msg5c88355a0a6b9151631c9b8f)I actually found Red and 0install searching for cross-platform installers.

[22:49](#msg5c883760c8e5bc51622f8e7b)I forgot there was one more that's cross-platform. http://izpack.org/

## Wednesday 13th March, 2019

greggirwin

[00:50](#msg5c8853d32f2fb54c37deba08):+1:

## Thursday 14th March, 2019

virtualAlan

[01:04](#msg5c89a8b83162ec7bc76b1554)nsis is my favorite - I use it all the time - it does everything I need.

[01:45](#msg5c89b255b4b6ef7bc8a6981d)Also iexpress can also be useful - a bit limited, but easy to use - comes free with windows.

Senenmut

[11:32](#msg5c8a3bb4bf7990126e9fc063)lincense key ?

topcheese

[13:51](#msg5c8a5c6385ec5665f3f5cc15)Generator?

Senenmut

[18:25](#msg5c8a9ca725e4e24c076c9bc8)@topcheese  
hi , you have placed a lot of good repositories.

topcheese

[22:19](#msg5c8ad3871c18c82b3c10f7a6)@Senenmut Hello, thanks! I had/have a habit collecting interesting little known projects. I remember starting out with one such project called Zope which is still strong today. That was about the time Guido van Rossum had joined the project and was working on it. I just got involved and wasn't a developer on the project, but I did develop business apps with Zope. I just wanted to say I'm really excited to be able to get involved in a project like this at its early stages. Red is tight!

## Friday 15th March, 2019

greggirwin

[06:30](#msg5c8b46a11243db346b972c5d)Glad to have you join us @topcheese. Be warned, though, Red will ruin other langs for you. ;^)

topcheese

[11:36](#msg5c8b8e2af8066c18ce508f72)@greggirwin It's truly an honor to be here with such great minds that are true pioneers in your own right. I am not worthy to be in such great company, but thank you for being so accepting! I'm just happy to be here to do whatever little things that I can do to help Red become a great success. Red is currently the only language I'm interested in besides maybe Csound. :-)

[11:48](#msg5c8b90fe1314c277618c922e)Red seems more like GunDB in that it's the easiest language ever. https://gun.eco

Senenmut

[16:40](#msg5c8bd578f6999130a00dfcf4)yes , it makes programming fun again on a high level.  
and it is a real compiled language.

greggirwin

[18:35](#msg5c8bf0844844137f833520f5)We all had to start somewhere. Sharing Red, and seeing new people excited about it is its own reward.

## Wednesday 20th March, 2019

btsts

[00:04](#msg5c918383d0133e21e5e18cb3)Hi everyone

greggirwin

[00:55](#msg5c918f85f3dbbd230c84a113)Hello @btsts

aolko

[10:59](#msg5c921d13f3dbbd230c8835f0)re:  
here's a banger  
is there going to be a webkit component or some package similar to electron?

topcheese

[11:43](#msg5c92275a2f6ded0abb1340a5)@btsts Greetings!

Respectech

[16:57](#msg5c9270e6fcaf7b5f73e73aef)@aolko If you are asking if Red will be able to compile to client-side web code, I believe the answer is yes.

greggirwin

[16:57](#msg5c9270f3a21ce51a20918939)@aolko, not planned at this time. No need for something like Electron, because Red apps are already desktop apps, with no need for any external support.

[16:58](#msg5c92713e52c7a91455c84a39)Your Red apps will be ~1MB, compared to...I don't even know how big most Electron apps are today.

Respectech

[17:00](#msg5c9271986a3d2e230df7ac65)So I obviously misunderstood the question... ;-p

greggirwin

[17:00](#msg5c9271be2fb6800d8050b54c)Or I did. :^)

ne1uno

[17:08](#msg5c927396dfc69a1454c7922c)200+meg but worse need 700meg ram

[17:09](#msg5c9273c1a21ce51a20919d3c)vscode the exception, happy with half a gig ram

greggirwin

[17:14](#msg5c9274e8a21ce51a2091a996)@BeardPower did a comparison on crytpo wallets some time back, and they were all up in that range.

Oldes

[19:06](#msg5c928f4bdfc69a1454c85f86)I don't know how it is with Webkit, but it's quite doable to add \[IWebBrowser2 ](https://goo.gl/RV3tsG) widget on Windows. I did some experiments with it years ago, but never finished it (as it requires some communication system, which one would have to figure out first).

BeardPower

[23:55](#msg5c92d2dd6a3d2e230dfa4fbd)The comparison can be found here https://github.com/BeardPower/red/wiki/Introduction-to-token-sales,-wallets-and-cryptocurrencies#resource-comparison-of-the-wallets

## Friday 22nd March, 2019

btsts

[07:35](#msg5c94904e52c7a91455d6e85a)hi bro

[07:35](#msg5c94905252c7a91455d6e865)&gt;&gt; write %1. txt "hello world"  
\*\** Script Error: txt has no value  
\*\** Where: write  
\*\** Stack:

rebolek

[07:36](#msg5c9490686a3d2e230d060dc4)you have space there

[07:36](#msg5c94907af3dbbd230c990434)`%1. txt`should be `%1.txt`

btsts

[07:37](#msg5c94909cfcaf7b5f73f56b11)Why did it go wrong the first time, I was a novice

[07:37](#msg5c9490b13dd81711493064e9)thanks. bro

[07:39](#msg5c94914adfc69a1454d5d559)&gt;&gt; &gt;&gt; write %1.txt "hello world"  
\*\** Script Error: &gt;&gt; operator is missing an argument  
\*\** Where: catch  
\*\** Stack:

rebolek

[07:40](#msg5c94915c6a3d2e230d06153c):)

[07:40](#msg5c94916b52c7a91455d6f14e)now you've copied it even with the `>>` prompt

btsts

[07:40](#msg5c949179fcaf7b5f73f572e2)oh yes

rebolek

[07:40](#msg5c94917b5547f774484669b9)your code should start with `write`

btsts

[07:41](#msg5c9491996a3d2e230d0617ce)i see

[07:41](#msg5c9491a28aa66959b64f9863)thanks

[07:43](#msg5c94921a5547f77448466f28)i got it

[07:43](#msg5c949227dfc69a1454d5daec)thanks bro

rebolek

[07:43](#msg5c94922849fdaa0d81f6ee8f)great!

btsts

[07:44](#msg5c94925f8126720abc234e3f)i see hellow world in the txt

[07:44](#msg5c94926449fdaa0d81f6f136)lol

[07:45](#msg5c94927f6a3d2e230d061d9d)perfect

[07:45](#msg5c9492a4a21ce51a209fd9d7)my english not good

[07:45](#msg5c9492b6dfc69a1454d5dd5d)i am Chinese

[07:46](#msg5c9492c1a21ce51a209fda5c)thanks a again

rebolek

[07:46](#msg5c9492c752c7a91455d6f8c8)no problem, there's also Chinese room

[07:47](#msg5c9492fdfcaf7b5f73f57f12)Ah, you're there already :)

btsts

[07:47](#msg5c949315f3dbbd230c9917ae)i am already ask some question in Chinese room

[07:47](#msg5c94932649fdaa0d81f6f5bf)thanks again

rebolek

[07:48](#msg5c94934f6a3d2e230d0623bc)you're welcome

btsts

[07:50](#msg5c9493ba8aa66959b64fa337)I went on to learn, I was learning machine language for the first time, because I knew red as a red token

rebolek

[07:51](#msg5c9494030d71905057469c53)I hope you will have fun with Red language!

btsts

[07:57](#msg5c94957e8aa66959b64fabea)yes bro

[07:58](#msg5c94958cdfc69a1454d5f640)I am excited

[12:03](#msg5c94cefc5547f77448481a90)By the way, how can I upload the programmed red code to github?

rebolek

[12:04](#msg5c94cf4081b15c5e4b6a0d10)see their intro article, it explains it nicely https://guides.github.com/activities/hello-world/

Respectech

[17:54](#msg5c9521595547f774484a87ff)@btsts If you want to avoid having the problem with `>>` messing up when you copy and paste into the console, you can do this line first:

[17:54](#msg5c95215b9d9cc8114a042a12)

```
>> >>: :none
== none
>> >> write %1.txt "Hello World"
>> read %1.txt
== "Hello World"
```

[17:55](#msg5c952187a21ce51a20a3cf50)That redefines `>>` as `none` so the interpreter ignores it. Red is very flexible. :-)

greggirwin

[18:40](#msg5c952c0ad0133e21e5fa7791)Now \*that* is clever @Respectech.

Respectech

[18:45](#msg5c952d618126720abc279735)@greggirwin :D

## Saturday 23th March, 2019

btsts

[10:43](#msg5c960dce6a3d2e230d0fdff4)thanks. bro

[10:43](#msg5c960dde5547f77448505755)thanks very much

## Wednesday 27th March, 2019

sivakon

[07:10](#msg5c9b21dc8126720abc4e545d)Are there any benchmarks for red-lang regarding speed?

9214

[09:24](#msg5c9b415752c7a9145502c022)@sivakon no, as it doesn't make much sense to benchmark bootstrap compiler and interpreter which don't have any optimization layers. Gross estimate - Red/System is 4-6 slower than C, Red (interpreted) is 100 times slower, on par with other scripting languages in the same category. You should take all this estimations with a grain of salt though, and distinguish between the current state and what we aim for.

With Red/Pro, Red/System will be on par with optimized C, while Red should perform 4-6 times faster, probably on par with latest Python.

abdllhygt

[18:45](#msg5c9bc4bd0d71905057760f5b)Hi! I write a program about automatic "text to subtitled story" converting in Red for making subtitled stories platform.

[18:46](#msg5c9bc4ef6a3d2e230d357f67)an example:  
!\[alt](https://i.ibb.co/LP82tLM/nyyy.png)

[18:50](#msg5c9bc6008aa66959b67f33e0)The script parse text and take translated words from database, and convert to html. It's just 125 line now.

## Friday 29th March, 2019

codenoid

[09:25](#msg5c9de4846a9761361b1f3dbf)hi please help our friend with your \*\*star\**

https://github.com/996icu/996.ICU  
https://996.icu/#/en\_US

Developers' lives matter. !

greggirwin

[17:26](#msg5c9e554c1f98a87112bfc7df)@codenoid, the chit-chat room is a more appropriate place to post things like this. Thanks.

GaryMiller

[17:54](#msg5c9e5bed0b3b8749f4e3a288)Is there a link I can go to, to see what bug fixes/enhancements are committed/targeted for the next stable downloadable release?

[17:56](#msg5c9e5c470b3b8749f4e3a51f)Is there a target for the number of stable downloadable releases per year?

endo64

[19:20](#msg5c9e6fe2a100047111deb032)There is no target for the number of stable downloadable releases per year, closest list you can find is the Trello roadmap board: https://trello.com/b/FlQ6pzdB/red-tasks-overview

greggirwin

[19:23](#msg5c9e70a0a100047111deb66d)@GaryMiller you can also look at https://progress.red-lang.org/ to see what's happening lately.

GaryMiller

[21:10](#msg5c9e89b00b3b8749f4e4e6b2)@greggirwin Thanks Gregg Great resources to keep up with the progress being made!

## Sunday 31st March, 2019

kirkkaf13\_twitter

[23:06](#msg5ca147fc1f6e900d5eb896c7)Hello - I have just discovered red, what sort of application development is it mainly used for?

virtualAlan

[23:24](#msg5ca14c327ecbdc29cadb193a)I've updated some things here: http://www.mycode4fun.co.uk/red-beginners-reference-guide there's some more new stuff on the other pages of my site - please take a look.

kirkkaf13\_twitter

[23:25](#msg5ca14c7e8148e555b2293453)@virtualAlan I will take a look, thanks.

greggirwin

[23:49](#msg5ca1520ea0790b29c93dfa70)Welcome @kirkkaf13\_twitter. Red is still Alpha, so there is no "mainly" yet, but even if you look back at Rebol's history, there is no leading category. That's good and bad. You can do anything, which is hard to market. :^) Of course, people write DSLs and lots of in house tools, but the sky is really the limit. With Red/System you can write at the C level, down to device drivers and hardware interfaces, and we go all the way up to a cross platform GUI system. You can see both used in the Red Wallet, which has its own hardware key libraries and a GUI in one.

`Parse` makes Red great for data processing, so there's a lot of that, but the REPL and other things make it a good sysadmin tool as well.

The only thing it doesn't do is run in the browser.

## Monday 1st April, 2019

kirkkaf13\_twitter

[00:13](#msg5ca157c4f851ee043d3e3193)@greggirwin Thank's for the warm welcome and providing that information. Red sounds very impressive and I am surprised I have not heard of it until now. I watched a talk on Youtube about red and it mentioned possible compliation to JS, I guess that hasn't come yet due to the Alpha status. Anyway the project sounds interesting so I am going to invest a bit of time and discover more.

greggirwin

[01:09](#msg5ca164e1016a930a45405692)The JS back end is a low priority feature for us right now. Wasm is a more appealing target, when we head that direction.

kirkkaf13\_twitter

[08:23](#msg5ca1ca9625686a7dc3b743f8)So when compiling to the windows platform the only files I need to run the application will be the .exe and the libRedRT.dll?

[08:36](#msg5ca1cd9cb34ccd69e7466a93)Looks like Windows Defender doesn't like anything compiled with -r and will quarantine the executable.

[09:59](#msg5ca1e0fb25686a7dc3b7dce3)I am honestly blown away by red so far. The syntax is clean, easy to read, and very expressive.

9214

[10:10](#msg5ca1e38a31aec969e8333a85)@kirkkaf13\_twitter you don't need libRed for a production app. Just compile in release mode (`-r` flag) to get a stand-alone binary and report any false positives to your AV vendor.

Claudio08

[16:25](#msg5ca23b7a1f6e900d5ebf2485)hi everybody,  
I am very interested to learn RED lang, and i am studing the RED documentation,  
examples, and all that i find in this rooms. I have some experience with VB.Net and C#.  
I am writing a little project only to learn RED, i need some help at the moment with GUI/VID. Sorry for my basic english.

gltewalt

[21:57](#msg5ca28931bd70a40d5fdcfb30)What help do you need?

kirkkaf13\_twitter

[21:57](#msg5ca2895b3ebbdc55b3462b2c)Anyone know if tuple reverse works?

gltewalt

[21:58](#msg5ca28976016a930a4548825a)Yes

kirkkaf13\_twitter

[21:58](#msg5ca2898993fb4a7dc2ba79c1)How is it used, syntacially?

9214

[21:58](#msg5ca2899ba84e0c501abe09b9)

```
text
>> reverse 1.2.3
== 3.2.1
```

kirkkaf13\_twitter

[21:59](#msg5ca289d60aad635019114213)Ok, what is the difference between functions and actions?

9214

[22:01](#msg5ca28a20a0790b29c94662e6)`action!`s are "methods" of datatypes, roughly speaking. `function!`s are functions written in Red.

kirkkaf13\_twitter

[22:02](#msg5ca28a59016a930a45488696)Cheers, btw that example will crash my REPL

[22:02](#msg5ca28a6b016a930a454887e0)which is why I asked if I written it correctly.

9214

[22:02](#msg5ca28a7b7ecbdc29cae3cf64)What example and what Red version?

kirkkaf13\_twitter

[22:03](#msg5ca28aa4a0790b29c946673f)`reverse 1.2.3`

[22:03](#msg5ca28aad8148e555b231f0f6)this will crash

9214

[22:03](#msg5ca28ab3016a930a454889ad)Make sure that you use the \[latest](https://static.red-lang.org/dl/auto/win/red-latest.exe) build.

kirkkaf13\_twitter

[22:04](#msg5ca28addbd70a40d5fdd066b)`>> print system/version 0.6.4 >>`

[22:04](#msg5ca28ae0016a930a45488b20)whoops

[22:04](#msg5ca28ae9016a930a45488b22)version 0.6.4

9214

[22:04](#msg5ca28b038148e555b231f361)Use `about` or `about/debug` when you report bugs and crashes.

kirkkaf13\_twitter

[22:06](#msg5ca28b60759abc043c4de918)-----------RED &amp; PLATFORM VERSION-----------  
RED: \[ branch: "HEAD" tag: #v0.6.4 ahead: 0 date: 22-Nov-2018/0:40:38 commit: #755eb943ccea9e78c2cab0f20b313a52404355cb ]  
PLATFORM: \[ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17763 ]  
\--------------------------------------------

9214

[22:07](#msg5ca28bb33ebbdc55b3463ba8)Like I said, use the latest build. Yours is 4 months old.

kirkkaf13\_twitter

[22:08](#msg5ca28bec016a930a4548914e)I assumed I was as I used chocolatey package manager.

9214

[22:12](#msg5ca28cbf31aec969e83808df)@dander :point\_up: can you somehow add an option to pull latest build (or, ideally, make it default)?

dander

[22:28](#msg5ca290920aad63501911725b)@9214 I looked into it a while back. If I still remember correctly, Chocolatey requires checksums for binaries that you install, so the tricky part is that the build process would need to automatically generate and push a new package for each build. I think I have a powershell script somewhere that could be used to automate the process (or as a template for doing it), but I don't know what is needed to integrate those steps on the official build. I think choco.exe was also a dependency, unless we were to use their API directly, but I haven't looked into that

[22:31](#msg5ca29143016a930a4548b5e9)I agree it would be preferable. I've mostly switched over to using Scoop (`red-latest` package) over Chocolatey. It's nicer for things which can be installed in a portable manner, such as Red, since it doesn't need to elevate

[22:38](#msg5ca292e0bd70a40d5fdd396b)I should take a look again to see if there might be another way around

## Tuesday 2nd April, 2019

rebolek

[04:52](#msg5ca2ea8d016a930a454aeb6e)@dander if you let me know what exactly is needed, I may add it to my automated builds.

dander

[05:23](#msg5ca2f1bb3ebbdc55b348cef1)@rebolek I just realized I did get that script pushed into GitHub: https://github.com/dander/chocolatey-packages/blob/master/automatic/red/build-package.ps1  
I think the key parts are that the install script `tools\chocolateyInstall.ps1` is generated with updated path to the red toolchain and checksum to reflect the latest automated build on the official site. An alternate method would be to bundle the exe inside the Chocolatey package itself, but Nenad preferred the download from the site for tracking downloads. I don't know how strong that preference is. According to some of my comments in the script (it was a while ago), it also appears to need a versioning scheme that Chocolately interprets as incrementing so that upgrade works. The other part needed is to get an API token for pushing. I could get you added as a maintainer for that package, assuming I have permission to do so.

rebolek

[05:26](#msg5ca2f274bd70a40d5fdfa83a)@dander my build server is Linux machine. For Red it's not a problem, cross-compilation works just fine. But would it be possible to push to Chocolatey from Linux?

dander

[05:28](#msg5ca2f3030aad63501913d79c)I haven't looked into that before. I think Chocolatey used to be built on Powershell, but isn't anymore. NuGet packages are basically just zip files, so it might not be hard to construct one, but I don't know if there are any weird gotchas. In terms of pushing, it could probably be done with the API to their web server, but I don't know what is involved there either

[05:30](#msg5ca2f358759abc043c506b79)this might be a good approach  
https://stackoverflow.com/questions/39386471/can-i-build-chocolatey-packages-on-linux

[05:30](#msg5ca2f36a8148e555b2346a61)ugh, the StackOverflow site is really stressing me out today

rebolek

[05:30](#msg5ca2f3733ebbdc55b348da16):D

[05:33](#msg5ca2f415759abc043c506fcf)@dander ok, I'll take a look at it and try to add it, if possible.

dander

[05:34](#msg5ca2f470a84e0c501ac09f79)huh, looks like someone made a docker package for it https://www.onitato.com/post/running-chocolatey-on-linux/  
Ok, let me know if I can help with any of it :smile:

rebolek

[05:36](#msg5ca2f4eba84e0c501ac0a392)I have exactly zero experience with it, so it make take some time to get into it :) I thought it would mean just to add few lines to my build script to upload a file somewhere :smile:

dander

[05:37](#msg5ca2f5231f6e900d5ec3f39f)Yeah, unfortunately, it's engineered like you might expect a Windows app to be :grimacing:

rebolek

[05:39](#msg5ca2f58725686a7dc3bf5cdc):smile:

## Wednesday 3th April, 2019

kirkkaf13\_twitter

[20:56](#msg5ca51e02bd70a40d5feef89c)Is something like odbc available for red? Can I query a mysql db? Thanks.

[22:40](#msg5ca53672a84e0c501ad03017)Also is there any documentation on how red applications are structured?

## Thursday 4th April, 2019

greggirwin

[01:45](#msg5ca561a9a84e0c501ad12b19)@kirkkaf13\_twitter no ODBC yet. Once we have full I/O in 0.7.0, someone could do it. Mysql will probably get special treatment.

I don't know what you mean by how apps are structured.

kirkkaf13\_twitter

[06:24](#msg5ca5a328a84e0c501ad2d62f)Hi @greggirwin, generally how are these additions added to Red? Is there an interface to C via red/system or am I looking at having to learn Rebol to contribute? Does Rebol have these features?

[06:30](#msg5ca5a46db34ccd69e760ebbc)What I mean by structured is, how are multiple files used. Do you use read on another .red file and if so how can I access functions within that file?

rebolek

[06:32](#msg5ca5a50225686a7dc3d1cc0e)@kirkkaf13\_twitter you can read another files with `do` or `#include`. Yes, there is C interface, but that currently doesn't work in interpreter, only for compiled programs. See \[Red/System documentation](https://static.red-lang.org/red-system-specs.html) for details, especially chapter 15.

endo64

[07:36](#msg5ca5b419c55bd14d35876c1c)And also check the https://www.red-lang.org/p/contributions.html page even though they are old and might not work anymore, there are many bindings that you can get as an example.  
OpenCV is one of the greatest :) https://github.com/ldci/OpenCV3-red

But if you are new to Red and Rebol, better to get familiar with the language, https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources is a good place to start.

kirkkaf13\_twitter

[08:51](#msg5ca5c58a25686a7dc3d2b080)Thank you guys, I'll be sure to check out these resources later today.

ldci

[12:28](#msg5ca5f85325686a7dc3d40036)@endo64 : Thanks for the comments on OpenCV binding :)

## Saturday 6th April, 2019

Senenmut

[12:24](#msg5ca89a70016a930a45724e7f)hi there , i wonder that most times new computers are only availiable with the OS Windows 10 / 64 bit.  
32 bit application are working on 64 bit architecture that's true.

[12:25](#msg5ca89a9c7ecbdc29ca0c86a8)How about red programming in 64 bit architecture. are there problems. or peace of cake ?

endo64

[12:30](#msg5ca89bd2a84e0c501ae669e9)Most of us using Red on 64 bit OSes without any problems.

Senenmut

[12:34](#msg5ca89cca3ebbdc55b36f9514)yeah , then i order a 64 bit preinstalled machine.

[12:51](#msg5ca8a0c7016a930a45727846)with build in microwave for burgers. he

kirkkaf13\_twitter

[12:52](#msg5ca8a10a93fb4a7dc2e33b96)Didn't know they still did 32bit machines? :)

[12:53](#msg5ca8a154c55bd14d359b5cfb)wasn't 32-bit windows limited to 4gb ram?

Senenmut

[13:06](#msg5ca8a445759abc043c774b6c)@kirkkaf13\_twitter  
i dont know.  
the only thing i know is that a sector by sector copy from boot cd to a external drive makes an image of OS however what is is on the main hard drive. it doesnt matter what there is. it is grabbed. he he

[13:19](#msg5ca8a74aa84e0c501ae6b45d)grabbed !

greggirwin

[18:06](#msg5ca8eaa3bd70a40d5f07b912)Red will eventually be 64-bit, but it's a lot of work and not our highest priority.

Senenmut

[20:43](#msg5ca90f590aad6350193d09f9)hello gregg.  
64bit is really not important for the language. only the compability to win64. the dealer sell mosttimes 64bit i have seen in most onlineshops.  
the quality of the language is even more important instead of advertising "we are 64bit".  
such like someone is pushing you sideways and says " i have orange bananas in my garden".  
answer " i don't care if the fruits have a mess of more quality and taste"  
he he he

[21:06](#msg5ca914e3759abc043c7a2c68)i don't care ONLY if ......

[21:07](#msg5ca914f93ebbdc55b372b77d)and that is not the case.

## Sunday 7th April, 2019

Senenmut

[17:06](#msg5caa2e2b759abc043c80fec1)wait...the red exe is ready compiled. "pling" oh yes , the cheeseburger is ready too. good to have a microwave assembled with bolts and nuts to the computer tower. "hmmmm. taste good" he he

greggirwin

[19:40](#msg5caa5221759abc043c81efb5)MacOS is going to be strict about 64-bit, which is important for Red, so it will come.

ldci

[19:45](#msg5caa535a7ecbdc29ca17abc2)Mac OS Mojave is the version to support 32-bit apps

[19:46](#msg5caa53843ebbdc55b37acc5a)The last version

## Monday 8th April, 2019

GaryMiller

[13:39](#msg5cab4f0d3ebbdc55b3815def)Maximum code/data size for 32 bit Red Application could provide a serious limitation to people thinking about developing large Red applications. Not sure if Modules enhancements intends to allow us to link multiple 32 bit Red Apps together but that could potentially create a way to partially overcome the limitation.

greggirwin

[17:19](#msg5cab8284c55bd14d35ae9a6d)@GaryMiller hard examples are welcome. Yes, we want to leverage modern hardware capabilities, but data is often best processed in chunks (the world runs on map-reduce now, needed or not. and huge systems built of tiny programs are a classic example in Erlang). On the app side, systems are best developed from loosely coupled components. If someone is building an application that's too large for Red to handle, even with 32-bit limitations, the tool may not end up being the breaking point. Complexity is the issue. And there, while we have a lot of ideas for PitL support, the old ways are often still the best.

rebolek

[17:35](#msg5cab866f016a930a4585af04)For example media files can get easily bigger than 4GB.

greggirwin

[18:42](#msg5cab95fb759abc043c8a9f03)Sure. Does that mean Red can't process them (given full I/O, or maybe even what we have today would let you do many things)?

[18:43](#msg5cab96380aad6350194dc783)Media files are trickier beasts than simple data of course.

rebolek

[19:21](#msg5cab9f1ebd70a40d5f196ca9)Of course you can do many things today, but you're still limited by the 32bit limit. You can come up with some clever workarounds, but they're just that - workarounds.

[19:23](#msg5cab9fa2f851ee043d83dfd6)I'm not saying it's the most pressing issue today, but with move to 64bit OSes and very high probability that next version of macOS or version after that won't allow 32bit apps at all, the priority will only get higher.

## Tuesday 9th April, 2019

OneITI37

[04:19](#msg5cac1d41a0790b29c9865ee2)Hello.

[04:19](#msg5cac1d61759abc043c8e2a52)I am creating a software that loads local images to display on it.

[04:20](#msg5cac1d7a31aec969e875ccee)Nevertheless, I am constantly getting this error, when I try to open it by clicking the app icon.

[04:20](#msg5cac1d8825686a7dc3fcc7e4)\*\** Access Error: cannot open: %InitializationScreen.png  
\*\** Where: decode  
\*\** Stack: layout load

[04:21](#msg5cac1dd3bd70a40d5f1c9f4e)The weird thing about this error is that I do not get the error message, if I run it via Terminal.

greggirwin

[04:26](#msg5cac1f02c55bd14d35b2cd5a)@OneITI37, there are a couple known issues with image handling on MacOS. If you can post your code, or at least a snippet, and an image that shows the problem, we can try to dupe it.

OneITI37

[04:27](#msg5cac1f22759abc043c8e357c)This is my source code.

greggirwin

[04:29](#msg5cac1f96b34ccd69e789a7ee)(moved to /help room)

## Saturday 13th April, 2019

Senenmut

[18:30](#msg5cb22ac293fb4a7dc2235411)heeeeeeeeeeellllpppp. i forget my password. oh sorry , it is revealed suddenly on desk here. problem solved.

## Wednesday 17th April, 2019

phillvancejr

[16:23](#msg5cb752f1b489bb6ed77cb386)Hello all, I was wondering how difficult it is to interact with existing C code in Red.

9214

[16:31](#msg5cb754c9a4ef097471b48160)@phillvancejr with C code or with libraries that use C ABI? It's rather trivial to write library bindings in Red/System, but slightly less trivial (depends on the case) to use them from Red.

[16:34](#msg5cb755ab1cd0b8307d2a431c)You can also go the other way around and embed Red in C application using libRed.

phillvancejr

[16:41](#msg5cb75752e416b8451995c5d2)@9214 I was thinking along the lines of a library

[16:42](#msg5cb757713b6cb0686a0b0e15)Thank you for your answer, I'll read up more about this in the docs. I just wanted a general idea to know how difficult it was. Thank you very much

9214

[16:51](#msg5cb759866a84d76ed8ac9939)@phillvancejr you're welcome. Here's some reading material to get you started:  
\* \[Red/System spec](https://static.red-lang.org/red-system-specs.html)  
\* \[Examples of library bindings](https://github.com/red/code/tree/master/Library)  
\* \[Comparison of C and Red/System](https://github.com/red/red/wiki/%5BNOTE%5D-Porting-C-code-to-Red-System) and \[various Red/System notes](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes)

We also have a dedicated \[chat room](https://gitter.im/red/red/system) where you can ask any R/S questions you might have. Although, I suggest to get familiar with Red first (\[here](https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources) is a list of learning resources).

phillvancejr

[17:01](#msg5cb75c023b6cb0686a0b2b03)thanks @9214 !! I've just come across Red this week, so these are some awesome resources. Thank you very much for taking the time to put this together

9214

[17:03](#msg5cb75c6ae416b8451995ed32)@phillvancejr np, have fun :wink:

endo64

[20:49](#msg5cb791628446a6023e3183e7)@phillvancejr One additional doc: https://github.com/red/red/wiki/%5BDOC%5D-Red-System-tutorial-for-newcomers-English-version

phillvancejr

[20:50](#msg5cb7917be416b84519976d24)thank you @endo64 !

## Wednesday 8th May, 2019

Intey

[12:42](#msg5cd2ceca252dbb75151faf3c)hello. I have a question about destructuring. In Javascript, Python we can destruct tuple for example and pass destructured values to functions as many arguments.

```
def function(a, b): print(a, b)
t = (1, 2)
function(*t) # same as function(1, 2)
```

Does we can do similar in red?

endo64

[15:10](#msg5cd2f1518fcdb05d479e283a)Your function can get a `block!` parameter, `f: func [b [block!]] [ print b]` and `f [1 2] ;== 1 2`

Intey

[19:39](#msg5cd3305ce7f42160fa563793)thanks!

## Friday 10th May, 2019

pepdiz\_twitter

[09:26](#msg5cd543b30824230a770dfed5)hello

[09:26](#msg5cd543c10824230a770dfeeb)nice job this Red , coming from rebol 2

[09:27](#msg5cd543e8f251e60ffa58a886)I have a concern about handling functions in Red, it seems they are not fully first class objects

[09:27](#msg5cd544000824230a770e0184)even when you have a function! datatype and thus you can pass functions as arguments to functions

[09:28](#msg5cd54432f52a237516093e2e)I cannot found a way to call an anonymous function and also Red seem to loose rebol's apply function

[09:28](#msg5cd5443dda34620ff9186901)ie, in rebol 2 you can write:

[09:28](#msg5cd5444f8fcdb05d47af0754)do func \[x] \[x + 1] 2

[09:28](#msg5cd5445556271260f938cb26)and you get == 3

[09:29](#msg5cd5446156271260f938cb62)but in Red if you write the same you get == 2

[09:29](#msg5cd544876fd7c11cd892880d)it seems Red evaluates the func word (which consulmes two blocks) and the value 2 in sequence and just returns the last one

[09:29](#msg5cd5448f0824230a770e041d)is it this way?

PierreChTux\_twitter

[09:44](#msg5cd547fdbdc3b64fcf203c53)@pepdiz\_twitter Hm. I'm also a daily Rebol2 user, and differences between Red and Rebol are often quite subtle, as your example seems to show...

pepdiz\_twitter

[09:56](#msg5cd54abcf52a2375160971be)ok but I'm not able to find a way in Red to execute an anonymous function as in rebol 2

[09:56](#msg5cd54acd79d700509947f287)I've tried all this withouth success

xqlab

[09:56](#msg5cd54ad379d700509947f2c1) do reduce \[func \[x] \[x + 1] 2]

pepdiz\_twitter

[09:58](#msg5cd54b41bdc3b64fcf205437)ok, thanks, that's subttle ;-)

PierreChTux\_twitter

[09:59](#msg5cd54b98e7f42160fa64e61b)A while ago, I was coming back to Red from time to time, git pulling and then trying a stupid basic script, which systematically ended up crashing...

dsunanda

[10:00](#msg5cd54bc5f251e60ffa58e729)You can also have anonymous functions in blocks:

```
b: copy []
append b func [x][x + 1]
do b/1 2
== 3
```

PierreChTux\_twitter

[10:00](#msg5cd54bc65d48a24fd0a2d03b)Until the day I realised that it had a `for` loop, and that word was simply not included in Red, and wouldn't be...

[10:01](#msg5cd54be7b149ca50986845a6)So I just wrote my own `for` so that I could re-use some of my Rebol code in Red...

pepdiz\_twitter

[10:01](#msg5cd54c145a887e1cd9c2b4b7)dsunanda, yes I've already noticed that, I was using it that way but seems too convoluted

[10:05](#msg5cd54cd0f251e60ffa58ece6)I think Red have certain incoherences (same as rebol), maybe is a believe due to lack of knowledge but...

[10:06](#msg5cd54d188fcdb05d47af4cf1)&gt;&gt; c: \[] append c func \[x] \[x + 1]  
\== \[func \[x]\[x + 1]]  
&gt;&gt; length? c  
\== 1  
&gt;&gt; first c  
\== func \[x]\[x + 1]  
&gt;&gt; type? first c  
\== function!  
&gt;&gt; c/1  
\*\** Script Error: c/1 is missing its x argument  
\*\** Where: catch  
\*\** Stack:

[10:06](#msg5cd54d335d48a24fd0a2db92)&gt;&gt; type? :c/1  
\== function!

[10:07](#msg5cd54d59252dbb7515315164)if using path selector Red tries to execute the funcion and thus you need a get-word to access the function value

[10:07](#msg5cd54d6db149ca509868537d)but if using first as selector, you get the function value directly

[10:08](#msg5cd54dabbdc3b64fcf206866)in terms of coherence you should get the same value using different selectors to select the same item (alias selectors if you want)

[10:11](#msg5cd54e5b5d48a24fd0a2e683)so once you have a function value, the only way to excute it is wrapping inside a block and do-reduce it? again too convoluted

[10:12](#msg5cd54e70252dbb75153158c0)&gt;&gt; c/1 2  
\== 3

[10:12](#msg5cd54e77bdc3b64fcf206d42)but

[10:12](#msg5cd54e79b149ca5098685c6a)&gt;&gt; do reduce \[:c/1 3]  
\== 4

[10:12](#msg5cd54ea3f52a237516098e06)am I loosing something?

toomasv

[11:25](#msg5cd55f9c252dbb751531d5dd)@pepdiz\_twitter It is by design. Very convenient difference between active and passive access. Access by path/index is active. Some passive accessing:

```
>> first append c: [] func [x] [x + 1]
== func [x][x + 1]
>> take append c: [] func [x] [x + 1]
== func [x][x + 1]
>> pick append c: [] func [x] [x + 1] 1
== func [x][x + 1]
>> d: [] move c d
>> d
== [func [x][x + 1]]
>> c
== []
```

pepdiz\_twitter

[12:13](#msg5cd56ae15a887e1cd9c39db6)ok, and what's the point to difference passive and active access? are there also a bunch of active selectors or only path selector?

[12:14](#msg5cd56b415d48a24fd0a3d700)I think once you get a function value using a passive selector, it should be an easy direct way to use the value rather than wrap it under a block to do-reduce, is it a direct way to do so?

toomasv

[12:33](#msg5cd56f8ada34620ff919b8eb)Path selector only, AFAIK. Hopefully some more design-savvy than me will chime in, but I don't see, why you would need to get it passively (and anonymously) and then use, when you can use it asap with path. Passive selection only if you need to store it in other place, or manipulate it, or check it...

[12:47](#msg5cd572c70824230a770f5bea)And of course inside-block usage also:

```
>> d: [e: 2]
== [e: 2]
>> change/part f: back insert next d func [x][x + 1] do f tail f ()
>> d
== [e: 3]
```

greggirwin

[21:46](#msg5cd5f121e7f42160fa6996d7)For anyone coming from Rebol: https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol

[21:52](#msg5cd5f2ae5a887e1cd9c77127)@pepdiz\_twitter as you'll see from the wiki and link to chat, the goal was to eliminate variable arity, which was an exceptional case in Rebol. Functions are fully first class values, but how they are evaluated by `do` is different. My question is what your real life code does that makes this pattern more convenient for you?

[21:53](#msg5cd5f2d4252dbb7515361903)Red won't change in this regard, but maybe there's a more idiomatic way we can find, which fits your needs.

## Sunday 12nd May, 2019

PierreChTux\_twitter

[17:51](#msg5cd85d18f52a2375161e2bee)Very useful doc, thanks for pointing it, @greggirwin .

[17:51](#msg5cd85d26e7f42160fa797db3)"to-logic 0 returns true in Red and R3, but false in R2."

[17:54](#msg5cd85ddb79d70050995d1afd)=&gt; I'm wondering how logic! this is... Among all the differences Rebol-Red that I've seen in the doc, this one is the only one that puzzles me... Instinctly, I'd expect a 0 you express something false.

greggirwin

[18:39](#msg5cd8686f6fd7c11cd8a7a902)Your instinct is based on how many other languages do it, and their instinct was to follow how C did it. But C has no concept of real logic values. So what we need to ask is what makes the most sense in Red (Red/System is a different story, because it's a C level language).

Red chose to be consistent in how logic values are coerced, with only `false` and `none` mapping to `false`. Zero is a number, and no special case is made for it. Even `unset!` coerces to `true`.

That said, you have an option. `Make` creates a logic value of `false` if the spec is a numeric zero, including floats and percents.

Feel free to update the wiki with extra info if you'd like. That may help others in the future.

## Tuesday 4th June, 2019

raster-bar

[11:59](#msg5cf65d144dfb42400479ad44)Hi everyone! Is there a way to access tag! attributes directly (as opposed to parsing the test text to extract the attributes)?

9214

[12:48](#msg5cf668a0cea8295279eeedfc)@raster-bar no, `tag!` is just a string with different delimiters.

raster-bar

[13:50](#msg5cf67712ff3f016baaa311e4)thank you! will it ever change? there seems to be no ticket about it so it looks like everyone is happy with the current state of the tag!

endo64

[13:57](#msg5cf678d2faac6439343b5e43)I don't think it will change, but probably we will have something like `altxml` that can convert xml/html into blocks or maps.

raster-bar

[13:58](#msg5cf679083dcdab4003eb4166)thank you!

endo64

[14:10](#msg5cf67be665392c3b60baaf6a)Ah he already wrote it for Red: http://ross-gill.com/page/XML\_and\_Rebol

raster-bar

[14:25](#msg5cf67f44ff3f016baaa35653)thank you so much! very interesting site btw

greggirwin

[19:12](#msg5cf6c291cea8295279f194d0)We'll have a standard XML codec in the future. There won't be any change to `tag!`.

raster-bar

[20:05](#msg5cf6cf09e41fe15e75115d57)Thank you, this is great! Will it accept non-valid xml ( will it be useful for parsing html?)

greggirwin

[20:50](#msg5cf6d992e41fe15e7511a713)The codec will likely be a general markup loader.

[20:51](#msg5cf6d9c5e41fe15e7511a7a1)But may need to be split. Yet to determine.

raster-bar

[22:34](#msg5cf6f208bf4cbd167c2faf07)thanks!

## Saturday 8th June, 2019

dumblob

[20:15](#msg5cfc174cb76eac527ac672cf)I hope the following questions fits this discussion channel better than any other (including GitHub issues).

Who of you already heard of the language Spry (https://github.com/gokr/spry , http://goran.krampe.se/category/spry/ )? What do you think about it's ideas, concepts, etc.?

I found out just recently and due to its similarity with Red I'm curious what do you think about it.

greggirwin

[20:57](#msg5cfc2132ff3f016baac9e2b3)@dumblob, the team knows about Spry, though I don't remember much from when I looked at it some time back. @9214 or @BeardPower probably do. We certainly wish him well with it, but it's not really similar to Red, but there may be some commonalities because it was inspired by Rebol.

9214

[21:16](#msg5cfc25ba6fc5846bab85e165)Last time I checked it was a quirky and not actively maintained mix of Smalltalk and Rebol, with closures instead of functions, scopes (\*gasps and crosses himself\*), very few datatypes (compared to Rebol) and somewhat noisy word syntax. Similarity with Red is only due to terms and concepts borrowed from Rebol, although I've got an impression that author has a shallow understanding of it and is more of a Smalltalk user.

## Sunday 9th June, 2019

BeardPower

[14:06](#msg5cfd124aff3f016baacfe4a6)I came across it when digging into Nim but that's all.

http://goran.krampe.se/2016/07/19/spry-is-a-smalltalk/

[14:07](#msg5cfd12946fc5846bab8ba199)TL;DR:  
&gt;Spry is very different from Smalltalk and I wouldn’t call it “a Smalltalk”, but rather “Smalltalk-ish”. I hope Spry can open up new exciting programming patterns and abilities we haven’t seen yet in Smalltalk country.

endo64

[17:32](#msg5cfd42c584c08f54140432d9)And he says: (https://github.com/gokr/spry/blob/master/README.md)

&gt; this is just for fun and I am not a good Nim hacker nor a language implementor

## Wednesday 12nd June, 2019

mikeparr

[15:20](#msg5d0118305656e6268b8907d6)I'm think that Spry is not progressing, I enquired a while back, no replies

## Friday 14th June, 2019

Senenmut

[19:50](#msg5d03fa8f4e8f972d371d22ae)Hello Mike , yeah spry is bullshit. IF you want to program in the smalltalk style THEN you have chosen a different approach. A solution with a great image to carry with you and heavy to get the application out of that to work stand alone. I have an overview of the smalltalkstyles and can say. Not for me. RED approach if even better than NIM and Smalltalk because the approach and goal is to program in a allinone style with included functions such like GUI and others which normally are presented in a external library only by the most languages. And a real compiler for an executable file.

## Saturday 15th June, 2019

greggirwin

[01:23](#msg5d0448aed100e447fc17b6dc)@Senenmut there's no need to denigrate other projects.

[01:24](#msg5d0448e6fbcc305cc4719150)We do appreciate that you like Red, but people have different tastes and goals, and anyone trying to build things deserves respect for making the effort.

Senenmut

[12:23](#msg5d04e348325b465cc3324842)hi gregg , my intention is to denigrate noone , just say my standpoint to the projects there. for those who want to program and not wasting time.

[13:52](#msg5d04f8282313502d38494407)programmers joke :  
A: "What language are you programming in ?"  
B: "Why do you want to know ?"  
A: "Shut up , what language ?"  
B: "NIM."  
A:"I'll hit you on the muzzle."

Jokes are allowed.

9214

[15:05](#msg5d05094c6f0ec85ade11c296)@Senenmut your snide remarks and dull jokes about other projects and languages are hardly appreciated. Keep your criticism constructive and refrain from insulting other's hard work.

greggirwin

[16:07](#msg5d0517b64e8f972d3724bcf3)@Senenmut, I don't think that counts as a joke. Or, if it is, it's a really bad one. :^)

Let me clarify though. My original comment was specifically about you saying "yeah spry is bullshit".

Senenmut

[18:24](#msg5d0537d9e527d95adddcb14d)ok , ok , i step back here. this time i made a bad joke. WBR SM

## Sunday 16th June, 2019

hastur34

[18:23](#msg5d06892dbc56c731f8cd7162)hello Eve rit Bodies ;-)

[18:25](#msg5d06898c26477710bbc0086a)sorry private joke ... i'm french guy and beginning with Red on Linux and from times on win10 for graphic tests

rebolek

[18:25](#msg5d0689b7fbcc305cc480c560) :+1:

[18:27](#msg5d0689ffe527d95adde597eb)I've just finished watching Good Omens, so when I see Hastur, I see this guy https://images.immediate.co.uk/production/volatile/sites/3/2019/03/irish-Duke-a225027.jpg?quality=90&amp;lb=940,626&amp;background=white

hastur34

[18:27](#msg5d068a1126477710bbc00d5e)well if i have good understanding,on Red/Linux no graphics for now ..?

rebolek

[18:27](#msg5d068a2dbc56c731f8cd7ab4)@hastur34 see https://gitter.im/red/GTK room

hastur34

[18:28](#msg5d068a57bb789747fb16bd82)ok thank i'm goin to look about

## Monday 17th June, 2019

raster-bar

[11:50](#msg5d077e6fbb789747fb1d3499)Hi! Is it reasonable to expect "go to definition" support from Red VScode extension for the Red source code itself (excluding the parts written in Rebol)?

9214

[14:37](#msg5d07a5b6950f1062a987b919)@raster-bar Red runtime is compiled to native code and Rebol parts are encapped in toolchain binary. So, unless you want to read hex dumps, that's unreasonable to expect.OTOH, you can grab sources from Github and use standard filesearch tools. There is also a couple of community projects for definition search, IIRC from @meijeru and @hiiamboris.

raster-bar

[14:46](#msg5d07a7c9faf70031f92db0b7)thank you!

9214

[14:59](#msg5d07aae24e8f972d3736b994)You're welcome.

greggirwin

[16:56](#msg5d07c6332313502d385c781c)@raster-bar it's not integrated in VSCode, but @rebolek did \[this](https://gist.github.com/rebolek/dc1bb8c17f0c97e4dbf918126fcab6f1).

raster-bar

[17:12](#msg5d07ca13950f1062a988d9a7)very cool, thank you!

## Monday 24th June, 2019

Senenmut

[08:56](#msg5d10904dae76db56e03766da)Hi, what language are you programming in ?

endo64

[09:39](#msg5d109a6e80f91e2d3e802f17)Red :)  
Mostly PHP, Rebol and C#.

rebolek

[09:40](#msg5d109a9ff5b00456dfd02bd5)Red, C, Lua.

Senenmut

[09:55](#msg5d109e2895efec2d3df9ff89)hmmm. Good to know. For myself i am a mechanical metal assembly technician. Programming becomes important if a microprocessor is doing automatisation tasks. The data should be transformed into physical work to assemble something.

[10:01](#msg5d109f5df5b00456dfd054d0)Even the development of software for controlling the assembly process is a interesting field.

[19:57](#msg5d112b22492f010bcab2a039)i am not programming a industrial robot at the time , but when it comes to such a case and the robot is not moving to the point as i have programmed it i will "hit him one onn the muzzle" he he he , surprize if the robot will fight back even if that is not programmmed in. "mean artifical intelligence".

[20:02](#msg5d112c47ae76db56e03d503d)think this is a better programming joke counts as one.

## Saturday 29th June, 2019

Senenmut

[14:38](#msg5d1777ed3d12712ce4ad2534)robot : " I'll be back with others " - terminator

## Monday 1st July, 2019

dumblob

[22:02](#msg5d1a830a9cbde24b2f591a33)After reading https://www.red-lang.org/2019/06/june-2019-update.html one question raised in my head - namely how do you want to support things like multipath TCP (http://multipath-tcp.org/ ) which are soon-to-get-standardized in the native Red ports (async I/O)?

## Tuesday 2nd July, 2019

greggirwin

[01:37](#msg5d1ab558e0cad9675089f2cd)@dumblob, correct me if I'm wrong, but multipath-tcp isn't widely adopted, and can still be considered experimental. If that's the case, support in Red will need a champion to take the lead on it, as @rcqls did with GTK.

dander

[04:10](#msg5d1ad950f0f22f6645f91ed9)@greggirwin @dumblob I hadn't heard about it before, but I read through a bunch of slides on the site (interesting, by the way). It looks to me like it is all handled at the OS level, so the application doesn't need to know it is even occurring. Though possibly there is some way the application can request certain things...

greggirwin

[04:27](#msg5d1add3707bf5635af0ce15b)Thanks @dander.

rcqls

[09:22](#msg5d1b22585ce02535b0082e6a)@greggirwin You’re nice but « champion » is of course really really exaggerated… « Motivated » is more realistic :smile:

endo64

[09:27](#msg5d1b2395dd5b167204da01f4)@rcqls That makes you a motivated champion :)

rcqls

[09:30](#msg5d1b24436658420b1cdb2b55)@endo64 My english is not perfect so I can misunderstand this word (eventhough it has exactly the same spelding in French) :laughing:

greggirwin

[14:28](#msg5d1b69ffb8926b674fca8ab7)Weeee are the champions, my frie-end... :^)

rcqls

[16:08](#msg5d1b8184b1b66b7203c02686)@greggirwin You mean at female soccer? :smile:

## Wednesday 3th July, 2019

dumblob

[10:40](#msg5d1c8639f0f22f6645085246)@greggirwin well, multipath TCP doesn't make much marketing, but it's used on all Google servers over the world already for several years and I guess it's the same for other significant market players (Amazon, etc.) and e.g. Apple uses it on all their smartphones and tablets (which means also on many/most of their Apple servers...).

The point is, that MPTCP breaks the assumption that there is one source IP address and one destination IP address - that's the primary reason why I suggested to take it into account when designing the API for Red ports (async I/O).

Does it make slightly more sense now?

greggirwin

[18:32](#msg5d1cf4a7f0f22f66450c852d)@dumblob I understood it before, but thanks for the extra info. They have an IETF working group, so the first step would be for someone to sum up the key points and design factors for MPTCP, noting what working docs and standards are important, so the core team can evaluate it and weigh the costs and benefits. e.g. a benefit would be the failover handling that Red authors could build into apps, to make the more robust. Basic ports, including IPv6 support, are the top priority.

dumblob

[19:54](#msg5d1d07dbcd7934667dd22e4a)@greggirwin sure - it was just my first idea while reading the post - the goal is simply to avoid any hard-to-change decisions in the ports API disallowing e.g. smooth MPTCP in the future :)

## Tuesday 9th July, 2019

OneITI37

[01:14](#msg5d23ea87eab1bd15a8284142)Looking forward to 0.6.5 and 0.7.0.

[01:15](#msg5d23eaa717cc7b05ca96e9a6)Especially for JSON and native ports.

greggirwin

[01:20](#msg5d23ebef72d4092b1aac5428)JSON is in place today. CSV and general markup codecs will come soon.

OneITI37

[01:21](#msg5d23ec1cacab0914d8d4041b)Oh, really? Pleased to hear that news.

AiguyGary\_twitter

[02:43](#msg5d23ff65f5dd145742501d16)Is there a word to serialize/deserialize an object to a JSON file? I can see how that would be very useful for saving state similar to an object database. A lot of games use that to save state when the user wants to save their progress.

greggirwin

[03:00](#msg5d240351d0e06b66757039b3)`Save/as` and `load/as`. But if you don't need it in JSON format, just use `save` and `load`. There is a temporary catch though. Until we implement the `/all` refinement, you need to `do load %obj-file`, or just `do` the file, if you also save the name of the object with it.

[03:02](#msg5d2403c3cdb70805c961ec0d)And if you go the JSON route, your object will be converted to a `map!`, so you need extra steps to make it back into an object.

## Tuesday 16th July, 2019

virtualAlan

[01:37](#msg5d2d2a577dbfff3242b5f8db)Alan B  
02:06 (25 minutes ago)  
Have added some new examples - example 48 and example 49 are quite interesting .... http://www.mycode4fun.co.uk/About-Red-Programming -  
you will need to scroll down the page to get to them ....  
I also added some more to my Red beginners guide here ... http://www.mycode4fun.co.uk/red-beginners-reference-guide  
Regards ....  
Alan.

## Friday 19th July, 2019

Senenmut

[09:08](#msg5d318877d1cceb1a8d837879)Alan Lancaster - Status Quo

[21:01](#msg5d322f9ed1cceb1a8d889c31)It's Rock'n Roll

## Wednesday 7th August, 2019

HighTechForms

[22:13](#msg5d4b4cfabb5364334cef7820)I've been reading a lot that Red comes from Rebol, and starting with Rebol isn't a bad idea. Should I try R2 or R3 though?

[22:14](#msg5d4b4d3795071824779b0277)Are all the items on https://www.red-lang.org/p/roadmap.html going to be done before 1.0 is released?

[23:41](#msg5d4b61c71dadc42a112ecf0d)@greggirwin I noticed you did some work on R3 stuff. Have you abandoned that project to focus on Red?

Respectech

[23:52](#msg5d4b644ebfd2887f53abc728)R2 was more complete, but either one would be fine.

HighTechForms

[23:55](#msg5d4b64ea90bba62a1237a6bd)I'm looking at Saphirion's R3, and it seems complete enough for production apps. Is that the best option at the moment for robust apps?

## Thursday 8th August, 2019

Respectech

[00:38](#msg5d4b6f171db76d0ffe926d00)Depends on what you are trying to do.

greggirwin

[01:18](#msg5d4b786995071824779c1687)@HighTechForms I suggest R2, as it's closer to Red. As @Respectech says, it depends on your needs. There is no standard R3 GUI, but both Atronix and Saphirion have working GUI systems. I haven't kept up, but I think Atronix has working schemes for tcp/udp/http/https. Red does not plan to be directly compatible with the R2 or R3 port model though. One area we do think it makes sense to break with the past.

I am fully committed to Red.

[01:20](#msg5d4b78c295071824779c18b3)But that doesn't mean I don't with other projects success. A big reason for starting the Ren project (the Ren data format, not Ren/C) was to see if we could maintain a common base syntax across Redbol languages, even if they each have extensions to that.

HighTechForms

[03:27](#msg5d4b96a51dadc42a11301e9d)thank you for the feedback! i just kept seeing significant issues reported about R2, so I wanted to be sure.

greggirwin

[18:11](#msg5d4c65bec87a0963e736bb4c)R2 definitely has limits, but they are known and you can work around most of them. I wouldn't start a new production project in R2, if I didn't already have a big infrastructure for it (which I do). But R2 is, by far, more complete and thought out than R3. There are certainly some good changes in R3, and choosing R3 from Redbol choices is like choosing Redbol from all other lang choices. :^) If it makes you more effective, and you like it more, great, but its community is smaller.

HighTechForms

[19:17](#msg5d4c753fc87a0963e73724ac)Thank you, @greggirwin and @Respectech for the help! Much appreciated!

nulldatamap

[19:35](#msg5d4c79792612bb718c328b81)What's the best way of dynamically changing the layout in Red/View? Is it `layout/parent` and such?

dsunanda

[20:58](#msg5d4c8d102612bb718c331f65)Basically, yes. You get very adept at navigating up /PARENTs and traversing along /PANEs - while taking a lot of care to ensure you are modifying the FACE you actual want. Use MAKE-FACE to dynamically create faces.

greggirwin

[21:26](#msg5d4c938d2612bb718c334c5e)@nulldatamap what @dsunanda says is correct, but "best way" depends a lot on the specific use case. e.g.

```
>> top: layout [size 400x300 b: button "Hello" [layout/parent [text "A" text "B" text "AA" text "BB"] b 2]]
== make object! [
    type: 'window
    offset: none
    size: 400x300
    text: none
    image: none
    color: none
    m...
>> view top
```

or appending new individual faces directly to a pane may work great. But it can be better to build up `layout` specs and manipulate them, only doing the actual layout once done. Handy for dynamic popups and customizable forms. The important thing is to know the distinction between a layout spec, in VID, and the tree of face objects it creates, so you can operate at the most appropriate level.

dsunanda

[21:59](#msg5d4c9b2fd03a7c63e6f331f0)Thanks for the correction, Gregg. Yes, usage cases trump theory every time; and swapping LAYOUTs en masse is a good way to do sweeping changes - and to utilize LAYOUT's capabilities in correctly calculating OFFSETs and PANE SIZEs.

## Friday 9th August, 2019

nulldatamap

[07:39](#msg5d4d231fbb5364334cfcedef)Thanks!

GaryMiller

[12:32](#msg5d4d67cf53490e334dbff9b3)Didn't somebody create a nifty GUI Tool that generated the View screen code and object descriptions. I know it wasn't as full featured as the old Visual Basic screen designer where you could set all of the properties for all of the objects from the GUI but something like that would be a major feature for a low-code solution for corporate customers. And being able to select the events that you want to add the code in drop downs would save a new comer a lot of trips back to the docs and examples to figure out how to structure the code and what options they need to use with the Words to achieve their desired effect. Not trying to turn RED into VB but a lot of people loved that part of the environment because it knew the right place to put the code in most cases.

toomasv

[14:27](#msg5d4d82e353490e334dc0c421)May be you meant \[this](https://github.com/toomasv/layout-editor/blob/master/lay-tree.red)? I didn't play with it for some time so it is possible recent changes have broken something, but first tries here worked.

## Saturday 10th August, 2019

greggirwin

[01:26](#msg5d4e1d46beba830fff6651a4)@GaryMiller there are a few IDE experiments listed \[here](https://github.com/red/red/wiki/%5BLINKS%5D-GUI-Programming).

[01:27](#msg5d4e1d795178a724765e2e2c)You should add yours there Toomas.

[01:33](#msg5d4e1edca4efe3718dd6458e)I had forgotten about that one, and it does so much! Tab panels needs some fixing up, but there's a lot to build on there.

toomasv

[03:39](#msg5d4e3c827d56bc6080286b7a)Thanks for reminding! Added.

## Tuesday 13th August, 2019

nulldatamap

[08:48](#msg5d5279562612bb718c5c2365)Is the use-case difference between `map!` and `hash!` that you use `hash!` if you want a `block!`-like interface, and otherwise you use `map!`?

rebolek

[10:51](#msg5d529640bfd2887f53de7347)Basically yes

toomasv

[12:17](#msg5d52aa4b53490e334de45035)@nulldatamap IIRC:  
block: add quick, access slow  
hash: add slow, access quick  
map: add quick, access quick

But there are other differences too, of cause.

AiguyGary\_twitter

[12:22](#msg5d52ab9ca4efe3718df54d14)Is map always the best choice then or does it require more memory or anything that would make it unsuitable in some cases?

9214

[12:25](#msg5d52ac2e9507182477ce8553)@toomasv how can map be quicker than hash if both require key hashing?

toomasv

[12:31](#msg5d52ad99beba830fff85b02b)@9214 Dunno, may be IRC = false

[12:35](#msg5d52ae87bb5364334c23739d)@AiguyGary\_twitter There are other considerations, too. `map` is strictly key/value pairs, while block and hash are free-form. Adding/access differences will be important in massive cases only.

[12:40](#msg5d52afbf5178a724767d89db)@9214 In theory map is not ordered, may be the map/hash adding differences (as I remember these) are due to this (and only theoretically?). In practice `map` was ordered at least some time ago, I don't know current situation.

9214

[16:50](#msg5d52ea3ebb5364334c255437)@toomasv key ordering has no influence on hashtable performance. `map!` itself is just a convenient key/value interface over `hash!`.

toomasv

[17:53](#msg5d52f92c029a51607f89fc75)@9214 Here are stats:

```
;adding funcs
bf: does [b: make block! 20000 repeat i 20000 [append b "a"]]
hf: does [h: make hash! 20000 repeat i 20000 [append h "a"]]
mf: does [m: make map! 20000 repeat i 20000 [m/:i: "a"]]

;accessing funcs
bg: does [repeat i 20000 [select b i]]
hg: does [repeat i 20000 [select h i]]
mg: does [repeat i 20000 [select m i]]
```

Profiling:

```
;adding
>> recycle profile/show [[bf][hf][mf]]
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.005  | 0:00:00.005  |     1099860 | [mf]
0:00:00.008  | 0:00:00.008  |      320608 | [bf]
0:00:06.092  | 0:00:06.092  |      539864 | [hf]

;accessing
>> recycle profile/show [[bg][hg][mg]]
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.008  | 0:00:00.008  |         432 | [hg]
0:00:00.008  | 0:00:00.008  |         432 | [mg]
0:00:07.866  | 0:00:07.866  |         584 | [bg]
```

9214

[18:31](#msg5d530217bfd2887f53e1860a)Some references:  
\* https://gitter.im/red/red?at=5abdb84d458cbde5578f433c  
\* https://gitter.im/red/red?at=59eb3358e44c43700a5e19a6

The former seems to indicate that performance difference is unexpected. @dockimbel ?

dockimbel

[19:01](#msg5d53090c1db76d0ffec7b723)@toomasv The `bg` and `hg` access functions are weird, they don't accomplish the same task as `mg`. `i` keys do exist in the map, but they don't exist in the block and hash series. So, the first two accessing funcs are looking up keys that don't exist, while the third one is looking up only existing keys.

[19:04](#msg5d5309a69507182477d13c82)For the map weird performance result, I let @qtxie have a look at it.

toomasv

[19:04](#msg5d5309a79507182477d13c85)Here are different funcs, which are uniform:

```
bg: does [repeat i 20000 [b/:i]]
hg: does [repeat i 20000 [h/:i]]
mg: does [repeat i 20000 [m/:i]]

>> recycle profile/show [[bg][hg][mg]]
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.003  | 0:00:00.003  |         432 | [hg]
0:00:00.003  | 0:00:00.003  |         432 | [mg]
0:00:00.003  | 0:00:00.003  |         584 | [bg]
```

and same performance. Do adding funcs need ajustment?

[19:05](#msg5d5309fc7d56bc608049a20e)And still, previuos bg and hg were comparable between themselves, although not with mg.

dockimbel

[19:08](#msg5d530aab1dadc42a11650f8d)In that new example, `bg` and `hg` are still not equivalent to `mg`, because you are using integers, so they are interpreted as indexed lookups (== `pick`), while `mg` is doing a search (using the internal hashtable).

[19:09](#msg5d530ace1dadc42a116510ca)@toomasv  
&gt; Do adding funcs need ajustment?

What do you mean by "adding funcs"?

toomasv

[19:09](#msg5d530b031dadc42a11651236)bf, hf and mf.

dockimbel

[19:10](#msg5d530b351dadc42a116512e7)I tried to run `bf`, `hf` and `mf` here, and they all complete at about the same speed (less than a second). Did you disable the GC in your tests to avoid unwanted side-effects? Oh, I see you called `recycle`, but that would not prevent an eventual GC pass in the middle of the tests.

[19:30](#msg5d530fc75178a72476805f1c)Here are your tests modified slightly to test for the same lookups in all cases (we want to `select` for an existing key in the datastructure):

```
n: 20000

bf: does [b: make block! n repeat i n [append b i]]
hf: does [h: make hash! n repeat i n [append h i]]
mf: does [m: make map! n repeat i n [m/:i: i]]

bg: does [repeat i n [select b i]]
hg: does [repeat i n [select h i]]
mg: does [repeat i n [select m i]]

dt: func [code /local t0][t0: now/time/precise do code print now/time/precise - t0]

recycle       ;-- clean-up the memory
recycle/off   ;-- disable the GC during the tests

dt [bf]
dt [hf]
dt [mf]

dt [bg]
dt [hg]
dt [mg]
```

[19:31](#msg5d53100d9507182477d1659e)And I get:

```
dt [bf]
0:00:00.0070004
dt [hf]
0:00:00.0070004
dt [mf]
0:00:00.0060004

dt [bg]
0:00:03.425196
dt [hg]
0:00:00.0080005
dt [mg]
0:00:00.0070004
```

which matches the expectations (the little better result for map is a bit odd, but could be just a precision issue with Windows timer resolution). More accurate tests would require running them several times, then averaging the results and ensuring that the standard deviation is not significant.

toomasv

[20:37](#msg5d531f7dc87a0963e76621b3)But aren't problems you pointed out earlier still there?

As you said "bg and hg access functions \[...] don't accomplish the same task as mg". Indeed, currently selecting from `b` and `h` will return `none` as there are no integers in block and hash. So bg and hg are searching in vain.

I tried to make them more comparable with the cost of making block and hash size twice longer and not relaying on integers:

```
bf: does [b: make block! 20000 repeat i 10000 [put b form i i]]
hf: does [h: make hash! 20000 repeat i 10000 [put h form i i]]
mf: does [m: make map! 10000 repeat i 10000 [put m form i i]]

recycle
recycle/off

>> profile/show [[bf][hf][mf]]
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.013  | 0:00:00.013  |     1350228 | [mf]
0:00:00.037  | 0:00:00.037  |      939864 | [hf]
0:00:04.289  | 0:00:04.289  |      720608 | [bf]
```

I repeated it several times with very similar results.

And accessing:

```
bg: does [repeat i 10000 [select b form i]]
hg: does [repeat i 10000 [select h form i]]
mg: does [repeat i 10000 [select m form i]]

>> profile/show [[bg][hg][mg]]
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.01   | 0:00:00.01   |      400432 | [mg]
0:00:00.018  | 0:00:00.018  |      400432 | [hg]
0:00:04.493  | 0:00:04.493  |      400584 | [bg]
```

Again, similar results in multiple runs. And that was what I expected.

For me it was surprising that hf beats bf in putting new elements, while with appending bf beats hf:

```
bf2: does [b2: make block! 40000 repeat i 20000 [append b2 form i append b2 i]]
hf2: does [h2: make hash! 40000 repeat i 20000 [append h2 form i append h2 i]]

>> profile/show [[bf2][hf2]]
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.024  | 0:00:00.024  |     1440608 | [bf2]
0:00:00.083  | 0:00:00.083  |     1879128 | [hf2]
```

dockimbel

[20:44](#msg5d5321242612bb718c60e1b6)&gt; For me it was surprising that hf beats bf in putting new elements, while with appending bf beats hf:

That's expected, as you now use `put`, which does search for the key first, and only appends if the key is not found. So lookups being constant time in `hf`, while linear time in `bf`, this results in a big time difference. `append` was a more fair way to populate the series.

[20:45](#msg5d53214e1dadc42a1165abed)I just realized that you reversed the order of the functions in the resulting tables... So everything is fine and as expected then.

## Wednesday 14th August, 2019

greggirwin

[00:16](#msg5d5352e2a4efe3718dfa1dda)Results are ordered by time, by `profile`.

toomasv

[03:12](#msg5d537c2b53490e334dea4f2a)@dockimbel Thanks for explanation! I realized the difference was due to search in case of `put`while falling asleep.

[03:16](#msg5d537d12beba830fff8b70e5)So, in general :point\_up: \[August 13, 2019 3:17 PM](https://gitter.im/red/red/welcome?at=5d52aa4b53490e334de45035) seems to hold, although differences between block and hash in appending-time are far less than in accessing-time.

greggirwin

[18:52](#msg5d5458579507182477da6ab0)Good info for a wiki page.

## Thursday 15th August, 2019

dumblob

[13:08](#msg5d55595b5178a7247690ed3a)Just quickly for those interested in GUIs etc. - currently Red has the VID dialect which encompasses needs in 2D, but it seems the next step would be to extend it (or introduce an additional, but very similar and with VID highly compatible dialect) working in 3D - see the new approach of Qt Quick 3D: https://blog.qt.io/blog/2019/08/14/introducing-qt-quick-3d-high-level-3d-api-qt-quick/ . Shall we make an entry in the GitHub wiki about this? Or maybe even in the http://doc.red-lang.org/ VID documentation?

greggirwin

[16:47](#msg5d558c99d03a7c63e6322b93)@dumblob that link errors for me right now, so will have to wait to comment. It's the first time it's come up, and there is a long list of work ahead, so it would have to be very compelling to be worth considering at this time.

[17:07](#msg5d55914e5178a7247692ba91)Gave it a quick scan. 3D, for games and similar UIs, is a \*big* task, and not a high priority. We have talked about it a lot, but our strengths lie in other areas, given our resources and target use cases (think business applications instead of games). We also need a subject matter expert to champion things and help lay groundwork. That can happen any time, but time may be better spent elsewhere.

AiguyGary\_twitter

[22:07](#msg5d55d7aa9507182477e5b920)3D commercial game developers require a whole different set of language features. Blistering speed, large amounts of multimedia content with associated codecs. Compatibility with leading graphics tools. Interfaces to game controllers and huge memory models to handle 4K resolutions.

greggirwin

[22:26](#msg5d55dc0f2612bb718c74bc0d)Yup.

## Saturday 17th August, 2019

eranws

[20:21](#msg5d5861ca1db76d0ffef0470a)RED on raspberrypi! :strawberry:

[20:22](#msg5d586209a4efe3718d13dee0)I was thinking, what is the most minimal system that can run red? (Arduino, Attiny, etc.)

## Monday 19th August, 2019

nulldatamap

[07:46](#msg5d5a53c54e17537f525da843)Hey, what's the best way to collect values "locally" in parse expressions (for nested rules for example)? Is it to manually maintain a stack?

9214

[08:30](#msg5d5a5e219507182477091c92)@nulldatamap can you elaborate?

nulldatamap

[08:43](#msg5d5a611ed03a7c63e65812bb)I'm building a recursive data while parsing, so an example is this pseudo parse-expr: `rec: [collect set id [integer integer] collect set content [rec | integer] keep (make-thing id content)]`

[08:44](#msg5d5a6158d03a7c63e6581374)Here `id` might get overwritten by the recursive application of `rec` (while `content` is fine)

9214

[09:11](#msg5d5a67c953490e334d1fc8cf)@nulldatamap depending on the actual problem at hand, stack might be a solution. The other way is to refactor your grammar rules, or to reconsider usage of Parse altogether.

nulldatamap

[11:00](#msg5d5a8136beba830fffc19a15)Yeah I can see that `load-json.red` uses a stack

greggirwin

[17:34](#msg5d5addaf95071824770daf87)We plan to add higher level parse support elements for this kind of thing. Ladislav Mecir did some nice experiments (`use-rules` I think it was called) for rule-local variables. Tools like ANTLR have also given us ideas of what might be helpful, to make `parse` even higher level.

## Wednesday 21st August, 2019

nulldatamap

[11:45](#msg5d5d2ec8c8a85a44c23bb3b7)I've noticed that `decompress/zlib` requires an extra length argument (unlike `decompress`). In most of my use cases, I don't know the deflated size though. I've found that even when passing oversized arguments, sometimes - depending on the specific size - makes decompression fails. Any advice?

9214

[11:54](#msg5d5d30df7e160727e0825a2c)@nulldatamap you surely mean `decompress/zlib`? There's no `compress` in Red right now.

nulldatamap

[11:54](#msg5d5d310467969726f93b71fe)Yes, edited the original message

9214

[12:42](#msg5d5d3c34d45f7c26fa0b35d0)@nulldatamap I've read a bit on zlib, and my advice would be to write a small multi-shot helper that tries decompression, and if it fails, adjusts the size (e.g. doubles) and tries again, as there's no clear way to infer or estimate data size. Or use gzip (with plain `decompress`), which appends uncomressed size (4 bytes) to data.

nulldatamap

[12:52](#msg5d5d3e8686c1a96ad50d452b)@9214 Okay thanks. I'm parsing PDFs which use zlib/deflate usually without size fields, so I guess I'll have to do it mutli-shot. It just seems a bit costly having to redo the decompression every time, while if the destination buffer was just expanded as needed during decompression it wouldn't be as expensive. Also do you have any idea why decompression fails for some bigger-than-necessary sizes?

9214

[12:55](#msg5d5d3f37142faa4fbd447abf)@nulldatamap can you give us some examples to reproduce?

nulldatamap

[12:58](#msg5d5d401186c1a96ad50d51dd)@9214 Actually if I use a newer (than 0.6.4, tried `red-09aug19-8a9920e6`) build it works as intended

9214

[13:01](#msg5d5d40a6c508da44c3580795)@nulldatamap oh, ok, good to know. Anyway, I don't know the details about zlib or `decompress` internals, so take my suggestion above with a grain of salt.

nulldatamap

[13:02](#msg5d5d40cc6ddc404fbce8563a)@9214, okay, and thanks for the help!

[13:02](#msg5d5d40fdfa99e74f6a67e6e2)Oh, just found that on the newer version of red, it succeeds with a too small buffer... The result has the right length, but there's garbage in it, I'll take it to red/bugs

9214

[13:05](#msg5d5d41a67e160727e082db0f)@nulldatamap :+1:

## Friday 23th August, 2019

nakuldubey0601

[18:51](#msg5d6035ce49ac0519239bf60d)hello, may I know the command steps to run red on Mac.

9214

[19:10](#msg5d603a2ebe3a8a311ad59247)@nakuldubey0601 hi, have you tried `chmod +x ./red && ./red` ?

nakuldubey0601

[19:19](#msg5d603c3f048bfd2d41971374)no let me try that

[19:22](#msg5d603cdf9b381b084fe1761e)For Linux/OSX users, you need to open a terminal app to be able to run Red. Once you have opened the terminal app, change to the directory in which you saved Red. Now do a: chmod u+x &lt;red-binary&gt; which will make sure that Red can be run on your computer. After that simply run Red using ./&lt;red-binary&gt;. This will build the Red console. Next time you run Red, the console will automatically open.

[19:22](#msg5d603cf4a080d70ab56c32b3)I followed these steps but this is not working.

9214

[19:23](#msg5d603d304b1189084e519f8c)@nakuldubey0601 okay, is there any error message?

nakuldubey0601

[19:25](#msg5d603dae49ac0519239c327b)Last login: Sat Aug 24 00:53:57 on ttys000  
$cd Desktop  
$cd red-things  
$ls  
red-064.dms  
$chmod +x ./red &amp;&amp; ./red  
chmod: ./red: No such file or directory  
$

9214

[19:28](#msg5d603e4c68406739f96f3e62)@nakuldubey0601 well, of course it doesn't work, because your binary is `red-064.dms`, not `red`. Even more, it's a DMG image, so you can just double click on it from your file explorer (I guess).

nakuldubey0601

[19:30](#msg5d603ecfbe3a8a311ad5b1d8)no, it's not working.

[19:30](#msg5d603ee249ac0519239c39bc)error: no such application to open this file

9214

[19:34](#msg5d603fca048bfd2d41972c0f)@nakuldubey0601 try to download \[this](https://static.red-lang.org/dl/auto/mac/red-latest) binary and do `chmod +x ./red-21aug19-84f55a25 && ./red-21aug19-84f55a25`.

nakuldubey0601

[19:41](#msg5d60416e38f9c27238bfcc2f)$chmod +x ./red-21aug19-84f55a25 &amp;&amp; ./red-21aug19-84f55a25  
chmod: ./red-21aug19-84f55a25: No such file or directory

[19:41](#msg5d604177e403470ab6c5052e)no its not working.

9214

[19:43](#msg5d6041cbe403470ab6c50801)@nakuldubey0601 are you sure you do that after `cd`ing into directory with saved file?

nakuldubey0601

[19:44](#msg5d60422538f9c27238bfd0db)yes

9214

[19:48](#msg5d60430607d1ff39f87022e8)@nakuldubey0601 can you run a `ls` command on that directory as you did previously?

nakuldubey0601

[19:49](#msg5d60434635f914538d7416d1)I think Mac is not giving permission as the file is not from the verified developer.

[19:50](#msg5d60439535f914538d741998)I used sudo -s too , then to the file is not working

[19:54](#msg5d60446807d1ff39f8702d3a)@9214 thanks for your help, yet I will crack this tomorrow.

9214

[19:54](#msg5d604478048bfd2d41974c37)@nakuldubey0601 can't tell, could be because Red is 32-bit right now, and macOS is \[slowly ditching](https://support.apple.com/en-us/HT208436) it in favor of 64-bit. But either way you should be able to launch it from terminal.

You're welcome.

## Friday 30th August, 2019

melcepstrum

[13:46](#msg5d6928d38066a340731d2fc5)Hi, I'm new to Red. I'm trying to use it for some dsp programming.

[13:47](#msg5d6928e4418f705d876243a2)Is it possible to compile a red/system function as shared library and then load this dll from red?

9214

[13:48](#msg5d69292f2efeca1df51fe90c)@melcepstrum hi, welcome! Yes, you can compile shared libraries from Red/System, but why do that if you can use Red/System directly from Red via routines?

melcepstrum

[13:51](#msg5d6929fc8b7327421dc1c63c)can i use my routines in console?

[13:53](#msg5d692a72fda04e4c9d42a7a2)or do i need to compile the whole Red program that uses routine?

9214

[13:54](#msg5d692aa50d4b1f5d88862713)@melcepstrum if you mean from interpreter - no, unless you compile them alongside REPL console. Loading shared libraries directly from Red is a feature planned for 0.6.5 - 0.7.0 releases.

melcepstrum

[13:56](#msg5d692af7b596011df4d1c624)@9214 thanks

9214

[14:03](#msg5d692cba5c4d6813a52f1db7)@melcepstrum by the way, we have a dedicated \[`/audio`](https://gitter.im/red/audio) room and \[Github wiki page](https://github.com/red/red/wiki/%5BDOC%5D-Audio-R&amp;D), if you're interested in that.

## Saturday 31st August, 2019

melcepstrum

[20:38](#msg5d6adab8b4d8294074ab53a9)i'm implementing fft in Red and I wanted to draw a line of 1024 points or even more, but it seems that only 1000 points are drawn. any help? my code looks like this:

```
p: append/dup make block! 1100 0x0 1100
repeat i length? p [p/(i): as-pair (i) (150.0 * (1.0 + sin(0.1 * i)))]
view compose/deep [ 
	base white 1100x300
		draw [ line (p)]
]
```

9214

[20:53](#msg5d6ade3e8b7327421dcdac46)@melcepstrum are you sure? There are 1100 `pair!` values in Draw block, hence your line contains 1100 points.

dsunanda

[21:00](#msg5d6adfd92efeca1df52bb75f)Under Wndows, I am seeing your line cut off at around the 1000th point. A low-quality work-around is to change the DRAW line to:draw \[ line (copy/part p 1000) line (skip p 999)]

greggirwin

[21:01](#msg5d6ae00f2efeca1df52bb980)I see it as well on Win10. @qtxie, is there a known limit there?

9214

[21:14](#msg5d6ae3280d4b1f5d8891b47a)Indeed it does.

```
set [width height limit][1'024 200 1'000]

view [ 
    base white with [size: as-pair width height] draw collect [
        keep 'line
        repeat i width [
            keep as-pair i multiply height / 2 1 + sin 0.1 * i
        ]
        keep reduce [
            'pen 'red 'line-width 2 
            'line as-pair limit 0 as-pair limit height
        ]
    ]
]
```

greggirwin

[21:15](#msg5d6ae35f375cc34fdef18692)Nice example.

## Sunday 1st September, 2019

melcepstrum

[23:34](#msg5d6c5589d3fda15e744c72ca)is this a windows only bug?

## Monday 2nd September, 2019

qtxie

[06:12](#msg5d6cb2b538499c13a68684af)@melcepstrum @greggirwin It's a limitation on Draw. We can remove it.

greggirwin

[06:32](#msg5d6cb7910d4b1f5d889e4820)If large `line` commands have a performance impact, versus multiple smaller ones, we should note that somewhere.

## Sunday 8th September, 2019

avitkauskas

[12:11](#msg5d74efef460a6f5a16e8a737)I tried to make a simple function creating 2D array:

```
make-array: function [rows cols init] [
	append/only/dup [] append/dup [] init cols rows
]

v: make-array 2 3 0
v/1/1: 1
probe v
```

```
[[1 0 0] [1 0 0]]
```

It modifies the first element of both lines, not just the first. Obviously, a pointer to the same block is used in my function instead of a copy. How should I do it correctly? Tried `copy` in variuos places without success.

[12:47](#msg5d74f85750508949d3fac074)It works ok with:

```
make-array: function [rows cols init] [
	result: []
	row: append/dup [] init cols
	loop rows [
		append/only result copy row
	]
	result
]
```

But is there a better way to do that?

toomasv

[15:10](#msg5d751a00b3e2fc5793761434)@avitkauskas A bit shorter, and avoids array growing on repeated calling:

```
make-array: function [rows cols init] [
    row: append/dup clear [] init cols 
    collect [loop rows [keep/only copy row]]
]
```

avitkauskas

[15:53](#msg5d7523f26e889c4bbdbef231)Cool! Thanks @toomasv . But meanwhile I decided to use a single dimentional vector! with a function to get/set the element provided row and col number. As this makes me easier to apply arithmetic operations on my "array". Is there any "idiomatic red" way to deal with the multi-dimentional arrays?

toomasv

[16:00](#msg5d7525b1ae44a84124a1a3e3)@avitkauskas You are welcome! AFAIK there is no standard way to deal with multidimentional arrays, as they are not separate type in Red. In case of vectors I believe path notation is ok to set and get values. But with blocks in general you have to consider different methods of getting/setting values depending on specific case (path (`word!` and `integer!` index); `pick`/`poke`; `select`/`put`; `first`, `second`...)

avitkauskas

[16:05](#msg5d7526cea08e2b4bd2ad7f84)And another question. Is there any way in Red to `print` formated float (like "%.6f" in C)?

[16:06](#msg5d7526ffd5c7bd579458a78c)I know you can use `form/part` to restrict the length, but if the value is shorter zeros are not added.

toomasv

[16:24](#msg5d752b2b54e7c649d4ad2f82) @greggirwin has worked on formatting, I believe you'll find something \[here](https://github.com/greggirwin/red-formatting).

[18:34](#msg5d7549a4b3e2fc57937767e9)@avitkauskas Just playing:

```
print-float: function [float [float!] precision [integer!]][
    parts: split form float dot 
    rejoin [parts/1 dot copy/part pad/with parts/2 precision #"0" precision]
]
>> print-float 24.123456789 6 ; just truncating
== "24.123456"
>> print-float 24.123 6
== "24.123000"
```

greggirwin

[18:38](#msg5d754a9d6e889c4bbdbffcc1)@avitkauskas here's a port of R2's `array` func. Undecided if this will be standard in Red.

```
;?? Think about how to pass indices to generating funcs. Needs accumulator.
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
			; throw error, integer expected
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
;array 3
;array [2 3]
;array [2 3 4]
;array/initial 3 0
;array/initial 3 does ['x]
```

AiguyGary\_twitter

[18:51](#msg5d754dbcc38d634123bc7a98)In the way that the array is allocated in memory will the elements be in adjacent in memory to take advantage of minimized memory access cache waits when accessing the array elements sequentially?

avitkauskas

[20:26](#msg5d7563efd5c7bd57945a442c)@greggirwin Thanks, I saw that code in this conversation above. Decided to try with simple vector! for my play project now.

[20:26](#msg5d7564042f93ab5a152b8c73)@toomasv Quite an elegant solution :)

[20:27](#msg5d7564333b1e5e5df1775c33)One more thing. Looks like `find` does not work with vectors of float!

```
>> a: make vector! [0.0 0.25]
== make vector! [0.0 0.25]
>> find a 0.25
== none
>> 0.25 = 0.25
== true
```

[20:29](#msg5d7564b8a08e2b4bd2af3c34)Even this does not work:

```
b: a/2
== 0.25
>> find a b
== none
```

Oldes

[20:50](#msg5d7569b13b1e5e5df177827f)@avitkauskas it looks that only `integer!` is implemented \[so far](https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L1876-L1880).

[20:57](#msg5d756b25a08e2b4bd2af67e9)To be more precise, `vector!` \[inherits most its actions from `string!`](https://github.com/red/red/blob/master/runtime/datatypes/vector.reds#L1122) code and does not have own implementation for non integer types.

[21:11](#msg5d756e696e889c4bbdc0e915)@avitkauskas btw... what is your use case? Is not `map!` datatype better for searching as it is using hashing?

avitkauskas

[21:23](#msg5d757136b3e2fc5793787c80)I am looking for the first index of the maximum value in the vector (there can be several equally big values in the vector). I found a workaround by saving the index when calculating the max value.

## Monday 9th September, 2019

greggirwin

[02:22](#msg5d75b75a54e7c649d4b0c849)@AiguyGary\_twitter any "array" model built on blocks will be more flexible than performant. Vectors are intended for homogeneous values and performance, but even that doesn't guarantee an implementation at the Red level. If you want or need that kind of control, drop down to Red/System.

meijeru

[07:31](#msg5d75ffd2ae44a84124a74a78)@avitkauskas The bug you signalled has been reported some time ago https://github.com/red/red/issues/2625

## Sunday 15th September, 2019

Nomarian

[03:32](#msg5d7db0c0d3283306ba4334d9)out of curiousity can you ask rebol questions here?

greggirwin

[03:44](#msg5d7db3a753bbf77ee0660d1d)Ask away. There is a lot of historical Rebol knowledge in the community here, and we're happy to help.

The focus of these Gitter rooms should be Red, so we just ask that people not habitually focus on non-Red content.

Nomarian

[11:59](#msg5d7e27afc82c2e0d7edbe71b)alright, so I rewrote in red and another simple problem happens

[11:59](#msg5d7e27b33cc2b87edf090122)&gt;&gt; rename ffrom fto  
\*\** Script Error: rename does not allow file! for its from argument

[12:00](#msg5d7e27c6577fc14c7fcb51a6)rebol/red is confusing

[12:01](#msg5d7e27fd577fc14c7fcb52cf)rebol also didn't let me rename, even though I ran it with -s, and I also used secure \[file allow], but no renaming allowed (unless you used rebol-view, but then it asked if you wanted to lower permissions)

9214

[12:04](#msg5d7e28ce577fc14c7fcb58b4)@khwerz current `rename` is a preliminary implementation (for 0.7.0 release), which is not fully functional yet.

Nomarian

[12:04](#msg5d7e28e953bbf77ee0692348):S

[12:05](#msg5d7e28f6577fc14c7fcb5aab)? rename should indicate so

[12:05](#msg5d7e2920d5c523462f87f6f3)So... should I write fto read ffrom delete ffrom ?

9214

[12:09](#msg5d7e29ea5d40aa0d7d3dfc66)&gt; ? rename should indicate so

No, it shouldn't. It makes no sense to update docstrings with each transitionary change.

&gt; So... should I write fto read ffrom delete ffrom ?

Apparently, yes.

Nomarian

[12:09](#msg5d7e2a14b84cb24c7ed24770)I mean, there are other functions which indicate a TBD inside

[12:10](#msg5d7e2a1c5d40aa0d7d3dfe48)why not rename?

[12:10](#msg5d7e2a3ac82c2e0d7edbfd10)find does for example

9214

[12:14](#msg5d7e2b3fd5c523462f880402)Stub actions (`rename`) and unimplemented refinements (`find/any`) are not the same.

Nomarian

[12:21](#msg5d7e2ccabda393169486edd6)Look, I'm just starting out with red/rebol, and as a rookie, it seems incredibly dishonest to pretend to have something when you don't, you wouldn't get away with that on other mainstream languages (well... maybe)

9214

[12:38](#msg5d7e30a8577fc14c7fcb8a77)Being alpha software (with missing key parts and rough edges that require polishing) isn't "incredibly dishonest", nor is it pretentious to introduce iterative changes in the nightly build (which is the main point of the said build, FYI).

I'm sorry that you have hard time with Red, but you should understand that it, as of now, it is itself a TBD, and that doesn't guarantee pleasant 1.0-like user experience. Consider to skim thru our \[starters' guides](https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources) and ask questions here as you go - that's the best way to have fun and enjoy your stay with Redbol :wink:

Nomarian

[12:39](#msg5d7e31075d40aa0d7d3e2a28)alright, I am staying though :) hopefully I won't ask too many annoying questions

lucindamichele

[19:34](#msg5d7e923e05fd3716952ee91c)This is the place to ask questions! :)

[19:46](#msg5d7e950f72fe125111ae7b1f)So we have some interesting progress reports to share, and we could use your feedback--and I'd like to direct people to discuss it on https://gitter.im/red/red, because that's where I'd most like to collect feedback--about our snazzy CSV codec (Red can be used to build a data matrix in a lot of ways, so you can help us choose formats). We've also got an intriguing AI suggestion for Red that would allow hi-fi tinkering for more precise pattern recognition: https://www.red-lang.org/2019/09/the-latest-red-could-help-ai-be-more.html

## Monday 16th September, 2019

greggirwin

[01:17](#msg5d7ee2c0577fc14c7fd04a8a)@khwerz +1 to what @9214 said, to which I can add some commentary.

Since you're new, you don't know how things work, the project or the community. So take it slow, and be as nice to us as you want us to be to you. We're happy to help and answer questions, and before long you'll find your way around. You may see that some things are undocumented, to avoid wasted effort, and sometimes because things just fall through cracks. As @9214 said, our goal is not to doc all limitations in detail, because things can change fast, and then you have to remember to go back and update all those temporary notes.

In this case, an implementation note may help. When you use `help` in the console, you see that `rename` is an action. Actions are common functions which all datatypes share, but are \*not* equally supported for all types. e.g. `find` only works on series values. What this means is that we knew `rename` was going to be an action, and therefore has a slot allocated for it. We also knew we wanted it to be R2 compatible, supporting files and urls when the time came. So it's a placeholder for now.

This is likely not the only TBD feature you'll hit, and don't be afraid to call out when you hit them. Even better, if you're willing, add a "TBD Notes" wiki page and put things there when they come up. Those are easy to edit OOB, can't affect code when you do, don't need PR management, etc. Low effort, and then we have a list to remind us about gaps that need filling. And your help will be greatly appreciated.

aseidlitz

[08:58](#msg5d7f4e9bbda39316948eb7ef)I am trying out Red Wallet v.0.4 on macOS and dies on start. Attempting to launch it from command line give the following error:

[08:58](#msg5d7f4ec9a6f489644913e8c7)`> open RED\ Wallet.app/ LSOpenURLsWithRole() failed with error -10810 for the file /Users/apopov/Proj/Red/RED Wallet.app.`

[08:59](#msg5d7f4ee7ba12e064487cde79)The validates using online binary validator... Any ideas?

greggirwin

[08:59](#msg5d7f4f0c5d40aa0d7d45ce8e)I'm not on MacOS, but the "role" part makes me think it has limited permissions on your system.

aseidlitz

[09:06](#msg5d7f50a2c82c2e0d7ee3a5f0)hmm... not sure what it means. I tried running it with 'sudo' as well—same result.

greggirwin

[09:10](#msg5d7f518f3cc2b87edf110cd5)What version of MacOS are you on?

aseidlitz

[09:11](#msg5d7f51b553bbf77ee0710364)running wallet directly suggests that there's missing dependency: `> RED\ Wallet.app/Contents/MacOS/wallet 02:07:27 dyld: Library not loaded: @loader_path/libc.dylib Referenced from: /Users/apopov/Proj/Red/RED Wallet.app/Contents/MacOS/wallet Reason: image not found fish: 'RED\ Wallet.app/Contents/MacOS/…' terminated by signal SIGABRT (Abort)`

[09:11](#msg5d7f51ccba12e064487cf434)Mojave v.10.14.6

greggirwin

[09:12](#msg5d7f51f6d3283306ba4e35d4)Thanks. Let's see what @bitbegin and @qtxie say.

aseidlitz

[09:20](#msg5d7f53e036461106bb28c751)Thanks!

[09:22](#msg5d7f545d05fd371695341a2a)unrelated: I am on red v.0.6.4 and trying to run CSV-codec following https://github.com/red/red/wiki/CSV-codec but I getting load-csv has no value... It's also not listed in `what`. What am I doing wrong?

9214

[12:03](#msg5d7f7a09bda39316948febe5)@aseidlitz you should use latest build rather than stable one.

aseidlitz

[15:06](#msg5d7fa4e6a6f4896449165edf)Thanks, I’ll try.

## Tuesday 17th September, 2019

aseidlitz

[06:21](#msg5d807b7d36461106bb312a4b)@9214 that was it—thanks for the tip!

## Thursday 19th September, 2019

rebred

[00:07](#msg5d82c6a5a7a5cc4733167aa6)will there be ever a list of red's developers/companies available for hire ?

greggirwin

[00:09](#msg5d82c7222438b53a64d78938)Yes.

rebred

[00:11](#msg5d82c7bc04053c5b3d8024d2)@greggirwin when ?

greggirwin

[00:19](#msg5d82c989901bb84d90317189)That's a much more specific question. :^)

Fullstack (Redlake in the U.S.) is the commercial arm of the Red Language project. It will offer products and services, as well as consulting. Red needs to mature to the point that we feel it's production ready for others before offering consulting services.

## Friday 20th September, 2019

aseidlitz

[06:40](#msg5d8474735ab93616942438b8)I installed red-auto extention in Visual Studio Code. But when I try to run a script I see extention trying to launch the shell several times and then it dies with the following message: "The Red Language Server server crashed 5 times in the last 3 minutes. The server will not be restarted." Does red.redPath config variable supposed to point at red executable or to a directory where red.r, libRedRT and other components are located?

[06:41](#msg5d84748bab4244767bd0a1ac)What is Red Language Server?

9214

[10:34](#msg5d84ab301998d516956de299)@aseidlitz

&gt; Does red.redPath config variable supposed to point at red executable

Yes, full path to toolchain binary.

&gt; What is Red Language Server?

\[LSP implementation](https://microsoft.github.io/language-server-protocol/).

meijeru

[12:26](#msg5d84c58704053c5b3d8eb67e)@greggirwin "Fullstack (Redlake in the U.S.) is the commercial arm of the Red Language project" I cannot find this Redlake on Google -- instead I find many others of that name which have nothing to do with Fullstack and/or Red. It seems very difficult nowadays to find a unique name for oneself...

pekr

[12:51](#msg5d84cb6ec77f285fb1b035f7)Redlake sounds too cool, so it is a high possibility that someone already has used that name :-)

aseidlitz

[17:45](#msg5d8510341998d516957133ec)@9214  
&gt; Yes, full path to toolchain binary.  
Sorry, could you clarify what `toolchain` means in this context. Is it the `red` binary?

greggirwin

[17:55](#msg5d851292b9f8210ed5be980d)@aseidlitz, yes, like so:  
`"red.redPath": "C:\\dev\\red\\build\\bin\\red.exe"`

aseidlitz

[18:17](#msg5d8517bea7a5cc4733279ee2):+1:

[18:18](#msg5d851809be709e39d1624b4c)That’s what I have but Red Language Server is still failing to start. I see that that problem happens before and there are Github issues open for it.

greggirwin

[18:21](#msg5d8518bb2438b53a64e8cde2)Let's see if @bitbegin or @qtxie have a suggestion.

9214

[19:23](#msg5d85271b901bb84d90433c14)@aseidlitz in the meantime you can list your OS and VSCode with Red versions here, to help us identify the problem.

aseidlitz

[21:39](#msg5d854712a7a5cc473328ebe5)@9214 macOS 10.14.6  
red 0.6.4 (build Sep 16)  
VSCode 1.38.1  
red-auto 0.3.5

9214

[22:17](#msg5d854feaa38dae3a638bc8cd)@aseidlitz thanks!

aseidlitz

[23:55](#msg5d8566d828c1df0ed669408b)Just built red-auto extention from the latest source and it works. It's the one that is available through marketplace which is having problems...

## Saturday 21st September, 2019

bitbegin

[01:50](#msg5d8581f62438b53a64eba818)you can clean ~/.red folder, then run `./red`

aseidlitz

[01:59](#msg5d8583f6c77f285fb1b5b085)Now I am getting Launching server using command /Users/apopov/.red failed.

Nomarian

[02:37](#msg5d858cef2438b53a64ebf80b)https://github.com/red/red/wiki/%5BNOTES%5D-To-Be-Done Done I guess?

9214

[04:04](#msg5d85a13e28c1df0ed66abbb5)@khwerz nice, thanks. FYI, you can find all functions with TBD refinements by typing `? "TBD"` in the console.

Nomarian

[22:03](#msg5d869e17e45b6d47323366d5)Ok, I'll keep adding more

[22:06](#msg5d869ee8ab4244767be06400)how do you use redirections in red? (Just tried a red-latest --cli tbd.red | awk '{print $1 "\\t" $2}' ) and it failed

[22:07](#msg5d869f2142a6b945202efb42)oh that's interesting, red only works on bash/sh

[22:08](#msg5d869f4fe45b6d4732336e7b)it outputs:  
\** Script Error: Invalid compressed data - problem: -3  
\** Near: script: decapsulate  
if none? script

9214

[23:42](#msg5d86b576be709e39d16d5a6c)&gt; oh that's interesting, red only works on bash/sh

Yes, that's an underlying Rebol SDK issue, which is mentioned in readme file (and it also lists relevant tickets that contain various workarounds).

## Sunday 22nd September, 2019

codenoid

[04:45](#msg5d86fc86b9f8210ed5cbbe9d)cool

## Thursday 26th September, 2019

avitkauskas

[18:16](#msg5d8d008a6d4b2512c11ca555)Hi! Who could tell me, please. If I need to have a collection of 3D points integer coordinates (like (1,1,1) (1,2,3) (4,3,6) etc.), what is the best type to keep it in? If I would use a vector! (like `make vector! [1 1 1 1 2 3 4 3 6]`, would it be an easy way to access the coordinates of the second or third point as a new vector of block of 3 elements?

toomasv

[18:45](#msg5d8d07510e829f60472f39d8)@avitkauskas IMO it depends on the scale of your project. In small projects it seems ok to keep coordinates in nested blocks `[[1 1 1][1 2 3][4 3 6]]` for easy access. But in big projects surely some optimizing is needed

avitkauskas

[19:26](#msg5d8d10da47de0a719d16041d)I'm just playing arround to get a feel of Red, so it's just a throw away project, but what should I use then if I work on something more serious in Red?

greggirwin

[19:41](#msg5d8d1460deb6da63d7b247e2)"More serious" is hard to quantify. :^) How many points are you talking about? We have chat going on right now about point/coordinate values, but starting with nested blocks should be fine. Easy to change to a block of vectors then. And if you use wrapper funcs to hide details, you can add `/x/y/z` keyed access or other things without being affected when the underlying storage mechanism changes.

[19:42](#msg5d8d14b024509b604661e4d3)If you use a flat block, you can still wrap it, or use `foreach [x y z] my-block ...` to iterate. Then your wrappers can let you pick/poke points using mod 3 skip sizing.

9214

[20:11](#msg5d8d1b5dfb131014e7f0dfdd)@avitkauskas what problem are you trying to solve? Give us some context. "Best" and "serious" are all relative terms.

avitkauskas

[20:21](#msg5d8d1dd466c8b451222101b9)Efficiency is purely theoretical in my current problem, so nested blocks are ok for me now. I am just trying to draw some stacked cubes on canvas. Result is fine, but as I want my canvas origin to be in the left-bottom corner I found I should do a bit too much juggling with the coordinates of my draw points. This is what I got. Sorry for quite long code fragment, but I would be happy to get some advice about the "Red way" to do it:

```
Red [
    needs 'view
]

window-size: 500
canvas-padding: 20
cube-size: 50
canvas-size: as-pair window-size window-size
origin: as-pair canvas-padding window-size - canvas-padding

cubes: [[2 1 2] [2 2 2] [1 1 1] [2 1 1]]

draw-cubes: func [] [
    draw-block: copy []
    foreach cube cubes [
        points-box: reduce [
            b1: as-pair 
                origin/1 + (cube/1 * cube-size) + (cube/3 - 1 * (cube-size / 2))
                origin/2 - (cube/2 * cube-size) - (cube/3 - 1 * (cube-size / 2))
            b2: as-pair b1/1 - cube-size b1/2 + cube-size
        ]
        points-top: reduce [
            t1: b1
            t2: as-pair t1/1 + (cube-size / 2) t1/2 - (cube-size / 2)
            t3: as-pair t2/1 - cube-size t2/2
            t4: as-pair t3/1 - (cube-size / 2) t3/2 + (cube-size / 2)
        ]
        points-side: reduce [
            s1: t2
            s2: as-pair s1/1 s1/2 + cube-size
            s3: as-pair s2/1 - (cube-size / 2) s2/2 + (cube-size / 2)
        ]
        append draw-block compose [
            box (points-box/1) (points-box/2)
        ]
        append draw-block compose [
            line (points-top/1) (points-top/2) (points-top/3) (points-top/4)
        ]
        append draw-block compose [
            line (points-side/1) (points-side/2) (points-side/3)
        ]
    ]
    canvas/draw: draw-block
]

view [
    title "Draw Cube"
    canvas: base canvas-size white
    do [draw-cubes]
]
```

[20:26](#msg5d8d1ee7fcb47b627fcd40f5)Cube positions in the list is like \[first second first] position respectively on \[x y z] axis. From that I calculate the coordinates of the points on canvas for box and lines.

greggirwin

[21:16](#msg5d8d2ac3fcb47b627fcda2fc)I \*love* concrete examples @avitkauskas, so that's very helpful. As they get longer, a gist is good for sharing, but this one isn't too big.

When you optimized Red, a key factor is reducing needless block allocations. It's not often you have to worry about this, but allocating and reusing block slots save a lot of GC hits over time. It also makes things faster. Until you get to thousands of cubes, or animate them, you may not notice a difference. The upside to using blocks as you do, even for intermediate values, is that it can make your intent and structure very clear. Sometimes we can mix and match things. e.g., where you do `points-box: reduce [...`, allocating a new block each time, we can reuse the same block on each call (the block value being "persistent" between calls, as in a closure). We can either clear it and reuse the previously allocated space each time, or we can write directly into the slots if the structure never changes shape.

Quick mod to your example:

```
Red [
    needs 'view
]

window-size: 500
canvas-padding: 20
cube-size: 50
canvas-size: as-pair window-size window-size
origin: as-pair canvas-padding window-size - canvas-padding

cubes: [[2 1 2] [2 2 2] [1 1 1] [2 1 1]]

draw-cubes: function [][    ; use function to capture local set-words
    
    draw-block: clear []
    ; We can make a structure that maps to the draw block
    points: [
        box  [0 0]
        top  [0 0 0 0]
        side [0 0 0]
    ]    
    cube.5: cube-size / 2   ; used a lot
    
    foreach cube cubes [
        ; clear and reuse allocated blocks
        repend clear points/box [
            b1: as-pair 
                origin/1 + (cube/1 * cube-size) + (cube/3 - 1 * cube.5)
                origin/2 - (cube/2 * cube-size) - (cube/3 - 1 * cube.5)
            b2: as-pair b1/1 - cube-size  b1/2 + cube-size
        ]
        repend clear points/top [
            t1: b1
            t2: as-pair t1/1 + cube.5     t1/2 - cube.5
            t3: as-pair t2/1 - cube-size  t2/2
            t4: as-pair t3/1 - cube.5     t3/2 + cube.5
        ]
        ; write over slots
        ps: points/side ; don't have to do this inside the loop
        ps/1: t2
        ps/2: as-pair ps/1/1           ps/1/2 + cube-size
        ps/3: as-pair ps/2/1 - cube.5  ps/2/2 + cube.5

        append draw-block compose [
            box  (points/box)
            line (points/top)
            line (points/side)
        ]
    ]
    canvas/draw: draw-block
]

view [
    title "Draw Cube"
    canvas: base canvas-size white
    do [draw-cubes]
]
```

avitkauskas

[21:37](#msg5d8d2f84462ada5123023a39)Thanks a lot @greggirwin! Write over slots would be very good "strategy" for me here . And from `cube.5` I just learned that `.` is a legal symbol ir Red words :)

[21:39](#msg5d8d301766c8b45122218c3b)What about the coordinates? `Draw` origin being top-left makes my head swirl a bit - as a math guy I usually imagine things from bottom-left :) Perhaps there is some "smart" technique to deal with that? Like drawing from top-left origin and then rotating canvas 90 degrees? :)

Respectech

[22:00](#msg5d8d34eafb131014e7f1bf2b)Rotating wouldn't help. You'd want to flip on the y-axis. I believe that's possible in Red.

greggirwin

[22:07](#msg5d8d369bdeb6da63d7b36573)@avitkauskas see https://doc.red-lang.org/en/draw.html#\_transform

On `cube.5` you will find that I have Easter eggs in many things I post. ;^)

[22:23](#msg5d8d3a446d4b2512c11e7b29)@avitkauskas another thing to think about is using `/x /y` rather than `/1 /2` on `pair!` values. I've found that makes a big difference in readability when I have blocks of values, because then your index is always an integer, and isn't easily confused with the axis.

## Friday 27th September, 2019

toomasv

[07:19](#msg5d8db7ef47de0a719d1adb8c)@avitkauskas You can change your coordinate-system like this:

```
view [box 100x100 draw [transform 0 1 -1 0x100 line 0x0 50x20]]
```

It is ok as long as you deal with geometry only. But if you want to add text or image you'll get it reversed, e.g.:

```
view [box 100x100 draw [transform 0 1 -1 0x100 line 0x0 50x20 text 40x20 "end-point"]]
```

To compensate, you'll have to reverse it again:

```
view [box 100x100 draw [transform 0 1 -1 0x100 line 0x0 50x20 transform 0 1 -1 40x40 text 0x0 "end-point"]]
```

avitkauskas

[09:32](#msg5d8dd74bc45b6e14e6d55f29)Thanks @toomasv ! That's what I wanted. But.. I do not see the line and the text after transformation - just blank window. Without the transformation it works fine. I'm on Mac OS. Any ideas?

[10:18](#msg5d8de1e847de0a719d1c2740)Strange. It does not work on my test file:

```
Red [needs 'view]
view [box 100x100 draw [transform 0 1 -1 0x100 line 0x0 50x20]]
```

But it works in my program that was pasted above.

[10:40](#msg5d8de711bf625112c0ece736)Well, I'm confused. It does work with `[transform 0 1 1 0x-100]` - it does shift up everything by 100 pixels, but if I try `[transform 0 1 -1 0x500]` (my canvas size is 500x500) then I see just a white canvas. Though... I am sure it worked for me once with the negative `scale-y`, but I cannot reproduce this again.

toomasv

[10:59](#msg5d8deb7cbf625112c0ed0bd7)@avitkauskas Sorry, I can't comment on Mac OS. On Win it works ok. Tried also your above longer script.

rebolek

[11:00](#msg5d8debd5fcb47b627fd31a18)Maybe it's not implemented on macOS?

toomasv

[11:05](#msg5d8ded03d97d8e3549bf37e0)@avitkauskas you can also try translation and scaling separately, e.g.

```
translate 0x500 scale 1 -1 ...
```

and also `matrix`:

```
matrix [1 0 0 -1 0 500] ...
```

[11:08](#msg5d8dedbefcb47b627fd3278c)@rebolek Yeah, maybe @rcqls or @qtxie can comment.

[11:14](#msg5d8def05086a72719e705855)@avitkauskas If it worked for you once with negative scale y -- does it work again in a new clean window? Maybe some missing `copy` problem?

avitkauskas

[11:19](#msg5d8df035290b8c354ae4af9e)Ye! It works with the separate `translate 0x500 scale 1 -1`!

toomasv

[11:19](#msg5d8df046bf625112c0ed31fa):+1:

avitkauskas

[11:20](#msg5d8df07cd97d8e3549bf57be)So probably `transform` implementation has to be checked on Mac OS

toomasv

[11:21](#msg5d8df0a9290b8c354ae4b254)Post in bugs-room?

avitkauskas

[11:28](#msg5d8df24a290b8c354ae4bfbf)Done :)

toomasv

[11:47](#msg5d8df6bdbf625112c0ed6153)Thanks!

## Thursday 3th October, 2019

ushakovs\_gitlab

[17:37](#msg5d9631e537073b36a064af7c)\[!\[image.png](https://files.gitter.im/red/red/welcome/BsVk/thumb/image.png)](https://files.gitter.im/red/red/welcome/BsVk/image.png)

[17:38](#msg5d96320037073b36a064b0a2)\[!\[image.png](https://files.gitter.im/red/red/welcome/3pOw/thumb/image.png)](https://files.gitter.im/red/red/welcome/3pOw/image.png)

[17:40](#msg5d96329192920c36a106a264)First pict - Fox toolkit C++, second - Red.  
Why is memory consumption such bigger? Is it proper?  
It seems slightly bloat.

greggirwin

[17:49](#msg5d9634aa49c7720aaf5c7d98)At a glance, Fox uses graphic primitives, not native controls. That's one difference. The other difference is that Fox is \*only* doing a GUI, correct? With Red (a very high level language), you have the entire runtime, 50 datatypes, and all features needed for full application development.

9214

[17:49](#msg5d9634b037073b36a064c765)@ushakovs\_gitlab apples and oranges, as usual. Each Red executable contains whole language runtime inside, and, given how much is packed into it (including native GUI engine), I'd say that "slightly bloat" is a gross misunderstanding of what you're working with.

[17:50](#msg5d9634ef464b432fc1b3625a)For apples-to-apples comparison you should use Red/System with Fox bindings.

greggirwin

[17:52](#msg5d963575940b4c2fc06bea86)I started to write the same thing @9214, but then thought it probably isn't worth writing a binding to Fox just to test that. Better to spend time on our own, once Red's graphics primitive approach is available.

ushakovs\_gitlab

[18:42](#msg5d96410ae8de6f3ca03357a2)You're right.  
But I have another two question.  
c++ hello occupied 0.5 Mb on disk in exe-file and then fit in 1Mb in memory  
red's hello gets 1 Mb on disk and then inflate up to 7Mb in memory.  
Why is increasing so considerable?  
Is it some kind of executable compression?

And second. Red will be growing.  
Have you planned to develop something like "smart linker"?

greggirwin

[18:53](#msg5d9643c7940b4c2fc06c56ef)If you do C++, you're well aware that disk and memory footprints don't correlate directly. You can UPX the exe and shrink it, but that won't affect the memory layout at all. Again, Red has an entire language runtime built in.

We will have modular compilation in the future, yes. But if you need to run in memory constrained environments, you want to use Red/System. You also need to test with real world applications.

ushakovs\_gitlab

[18:58](#msg5d9644cbe8de6f3ca0337026)Thank you.  
Is red's interpreter placed into any compiled exe?

greggirwin

[18:59](#msg5d9644fc49c7720aaf5cf623)Yes.

pekr

[19:01](#msg5d96457d0e67130aae0b6905)The executable size, its compression, have imo very little relation to the observed situation. You have to keep in mind that with Red, as stated previously, every your app will containt Red language runtime, the whole one, unless we get more modular design in future. But my experience is (since the Rebol 2 times + its encapper), that your apps actually don't add-up much. Even more complex one don't produce much bigger executable than just a hello world example ...

## Friday 4th October, 2019

ushakovs\_gitlab

[17:22](#msg5d977fb87aa5602ffc6b99c1)Not executable size disturb me. It's very compact.  
But exe image take 1Mb only in memory.

greggirwin

[17:26](#msg5d9780c3eac5612d22b47756)To add to @pekr's point @ushakovs\_gitlab, a smart linker won't omit parts of the Red runtime or interpreter. Someone could do that if they wanted, statically analyzing a program's "code" and eliding, for example, unused datatypes. But that will come at a huge cost. As soon as you do that, your app can no longer make use of types it didn't know about when it was built. Beyond that, you couldn't use any runtime features that relied on any of those types.

A way to look at this might be, if you find that you're not using many of Red's datatypes in your app, and they can be omitted, your app is either very small and very constrained in what it does, or you're not using Red right. And if it's small, and not using high level types to good effect, or with any potentially dynamic elements, \*and* if efficiency is important, use Red/System.

[17:26](#msg5d9780d93220922ffb2ae844)(forgot to hit Send in this group yesterday when I wrote that)

[17:27](#msg5d9780ee3220922ffb2ae8c7)@ushakovs\_gitlab what is your use case for wanting to minimize the memory footprint even more, but not use R/S?

ushakovs\_gitlab

[17:37](#msg5d9783490e67130aae143602)I just recently know about Red, and I don't know its constraints or field of application. I want to know more, and my questions is slightly foolish maybe.  
Perhaps I just looking for the silver bullet. It is my questions come from.

greggirwin

[17:40](#msg5d9784079735874673f6ef3b):^) Premature optimization is the root of all evil.

The key with Red is to understand that it gives you options, and that there is no silver bullet.

ushakovs\_gitlab

[17:50](#msg5d97866d92920c36a110253d)Hmmm...  
Maybe set of orthogonal well designed, then well released options, which then will be well used is silver bullet?

pekr

[17:55](#msg5d97879d940b4c2fc0757676)Just take the Red pill :-)

greggirwin

[17:57](#msg5d978806940b4c2fc07577fa)&gt; Maybe set of orthogonal well designed, then well released options

That's very abstract. Can you be more specific?

[17:59](#msg5d97886f7aa5602ffc6bdc74)As @pekr said, "take the Red pill." By that, we mean that when you're new to Red, you can only view it in light of what you already know, and it can take time to understand Red's deeper philosophy and let go of old mental habits.

ushakovs\_gitlab

[17:59](#msg5d9788919735874673f70f2f)It was just a joke.  
Red gives me options, options is silver bullet itself.

greggirwin

[17:59](#msg5d9788957aa5602ffc6bddb7)In Zen-ish terms: First, understand what Red is. (need an emoji for `finger pointing to Red`)

[18:00](#msg5d9788bf3220922ffb2b25f7):^) We have 2 main options today, but envision that many more will come, in specific domains, because Red makes it so easy to experiment with language features and ideas.

[18:00](#msg5d9788cf0e67130aae1460d2)We'll learn your sense of humor, too. :^)

ushakovs\_gitlab

[18:11](#msg5d978b61b385bf2cc67311f5)My English mess me write my thoughts down properly. Sorry.

greggirwin

[18:18](#msg5d978ce37aa5602ffc6bfedf)Not to worry. Your English is great compare to my...any other language. It's hard to tell when people are joking in chat, until you get to know them.

## Monday 7th October, 2019

lucindamichele

[01:25](#msg5d9a93f204592546720800de)@ushakovs\_gitlab Your English is great! Welcome to Red.

## Tuesday 8th October, 2019

ushakovs\_gitlab

[17:16](#msg5d9cc45a874aeb2d230f22ad)@greggirwin, @lucindamichele  
Thanks for your kind words!

## Friday 11st October, 2019

avitkauskas

[13:05](#msg5da07e08894dee56e5248e0c)Hello, Catalina! See you later Red... :(

pekr

[13:08](#msg5da07ec489acff6ff5d8e4e7)Is Catalina the latest OS-X release? Not sure how goog the release is, but being a tester/user of multiple systems and apps, I can see problems in many places, not just with Red. Seems like Apple screwed big time here ...

avitkauskas

[13:14](#msg5da08044894dee56e524a109)Yes, that's about mac OS. Just switched today. One small surprise is `zsh` being the default shell. But perhaps it's good :)  
I new I am killing Red on my computer by going to Catalina. I liked playing with Red. But I would not stay with the older Mac OS because of Red. I just hope Red will catch up with 64-bit soon.

Respectech

[16:55](#msg5da0b3f065dd8569a0bc7ff2)On 64-bit Linux, it is possible to run 32-bit programs. Is that not possible on Catalina?

ushakovs\_gitlab

[17:17](#msg5da0b91039d0c7075790951d)No, as I know. New Apple's restriction.

[17:17](#msg5da0b928870fa33a4dd50688)Welcome to the future.

rebolek

[19:57](#msg5da0de90f1c89c0758d0b58b)zsh replacing bash is probably the only good thing about Catalina from what I’ve read yet

## Monday 14th October, 2019

greggirwin

[03:14](#msg5da3e83357c2517c6a04416b)MacOS is an interesting problem. Linux is, ironically, to a lesser extent. Windows still owns the desktop world. Linux is entrenched on servers of course. But why do we even bother with Mac? (asked bluntly to get your attention. ;^) If you're short of resources, the first thing you should do is focus on the ~90% market share audience, which is Windows. But here lies the rub. Devs moved from Windows to Mac, because (my opinion here) they still wanted the user experience of a robust GUI desktop OS, but the cache' of being on Linux. Then there was the rise of iOS. But we're focused on Android for mobile. iOS is not on our roadmap. But MacOS is still a tiny minority.

Given that, dear community, is MacOS worth it? Will the small share of Mac (specifically Catalina) devs make any difference in helping foster Red's adoption (no offense intended @avitkauskas) in FOSS worlds or businesses? Or are our resources better spent on ports, concurrency, modules, and other features?

Of course, it's almost 2020 and we should all be 64-bit all the time. But facts are facts, and history is history. This is where we are now.

CodingFiend\_twitter

[04:47](#msg5da3fde0158cfd673528deaa)I developed over 100 iPhone titles, and made cross-platform Mac + Win software for over 20 years, with one million-selling app (Discus CD labeler). Now that Apple has released Catalina, they have killed my product, because although i can compile my code in 64 bit, i used the Apple CarbonLib library, which is closed source and they aren't going to update it. Given the declining sales of OSX products I am giving up. Meanwhile, my 256-color Flying Colors painting program that was built for Windows 98 still runs in 256 color mode even in Windows 10, because Win10 still supports going into VGA era 8-bit graphics modes, and changes the resolution automatically if i ask it to. Amazing backwards compatibility. Frankly with Catalina, OSX is transitioning towards iPad apps.

Apple cannot stop breaking products with their OSX upgrades. I have seen my huge investment in Adobe Creative Suite whittled away, as each successive release breaks more products. Apple has the dregs of their staff on OSX, and couldn't be more self-destructive and sloppy. My labeling program prints, and in 10.13 and in 10.14 it took 3 releases to restore printing functions. So i fully understand the logic behind Red ignoring the OSX world. OSX as a target market is not an active market. There are certain customer bases that Apple dominates in, such as Graphic Arts, pre-press, and they are very strong in audio and video production as well. There are a lot of web developers because of the way it was taught, which started from a graphics arts point of view which is 99% mac.

Apple has basically just been breaking things in their recent OSX versions, and the features added are completely trivial and unimportant. Time Machine which was from many years back is the only feature i can think of that is good, otherwise it just gets worse. They aren't on a good trajectory, and their hardware offerings are nutty. They didn't update their Mac Pro which last came out in 2013 until next month, and the new machine is around $10k in common configurations. A huge heavy monster that was clearly designed about 5 years ago, and just never got out the door.

The reason Apple is failing is that their move to the spaceship building has completely caused the organization to malfunction. Everyone is now interfering with each other, and they are so fearful of making a mistake they cancel almost every project. Jobs was their inventive source, and their current leader was their Logistics guy. He has improved their profitability, but outside of the careful steady refinement of the iPhone and Watch they are producing 1/10th the number of products with 10x the staff expenditures. It was inevitable that Apple would subside, and their market share will continue to drop in desktop.

That being said, IOS is a worthwhile target. In terms of paying customers, the IOS world is about half the market (money wise) for Apps. Android customers have a much more spyware infested store, and only recently has google taken any steps to clean up the mess they have. Apple patrols their store very stringently; people trust it, and their user base has a lot more money. So in the mobile space i strongly suggest you not give up 1/2 the market by only doing Android. Yes it is a pain in the ass to do these two slowly diverging platforms. I only made a few hundred K selling iphone Apps, and Apple also was a pain in the rear, because they would kick out perfectly operating apps from the store, because i wouldn't update the for their stupid notch they put into the screen. They cracked down on older apps because it made their hardware look bad. So with Apple you will always be on a treadmill, and as a company they never cared about backwards compatibility. their user base exists for them to exploit, and they have a shockingly bad attitude about investment in software. I have thousands of dollars in OSX software, and i am refusing to upgrade to Catalina for that reason.

rebolek

[05:37](#msg5da40994c87a1d28aca79af9)Desktop market share is one thing, but what devs use is other and programming language should be where the devs are. Also there are some niches where mac is more used than Win (like audio and video). Maybe it’s a good fit for Red? We don’t know yet and if we abandon mac, we’ll never know.

rcqls

[06:00](#msg5da40ef9f88b526fb935de28)What a weird idea to abandon macOS for a langage with one of its main features is to offer cross-compilation with so much ease! I also agree with @rebolek on the devs point of view. 64bits is also on the roadmap of red. As a mac user and dev, I would not go to Catalina. Other temporary possibility is, as I already mentioned, to use docker on macOS Catalina to launch red. It is exactly what I do when working on red/GTK.

9214

[06:13](#msg5da4120df88b526fb935f0b6)`/welcome` is not the place to discuss that IMO.

rebolek

[06:58](#msg5da41c96f1c89c0758e67dae)@9214 it's a place where the question was asked

9214

[08:36](#msg5da43390f1c89c0758e723e9)... and it's not the right place to ask such questions either. To be clear, there's no talk of Red dropping macOS, we're just interested in community feedback on the state of affairs that Catalina brought us in, trying to understand how urgent 64-bit transition really is.

Whoever wants to continue this thread - let's move to `/red` with back-reference to messages above.

greggirwin

[22:01](#msg5da4f0318e2e9a7c6bfb0ab8)Moving to main Red room is fine. I'll defend my choice of posting here though. If people are new to Red, this is an important question we need answered.

Let me ask my question a different way. If putting resources into Mac-specific needs makes it 50% more likely that Red will become unsustainable as a project, should we still support it? Bluntly, will it help Mac people if Red fails entirely, or are they better served if we focus on making Red sustainable, and \*then* catch back up on Mac as a platform? It's a Tragedy of the Commons question.

If there were no cost to each new platform, it would be easy. But that's not the case. The ease of cross platform features we have today has come at a \*great* cost already. We don't want that to be a sunk cost of course, but we also can't afford to waste effort.

To be sure, we need more hard numbers. Those are welcome from any contributor. A key metric is how many Linux/server/cloud people use Mac as their desktop platform. And do they really "use Mac" or are they in VSCode and terminals all day? Do we need a highly polished Mac presence, or just Core OS support? What tools do those devs want and need on Mac, and are they different from other platforms?

You know what's coming next. Make a wiki page. It could use a champion. Any volunteers? You don't need to know Red, or even be a deep programmer. We need to gather and understand the current state of affairs, but more importantly trends. Where will things be in 3-5 years? Are devs flocking to or from Apple platforms for their work? I agree with @CodingFiend\_twitter that iOS is where a lot of money is, but also a saturated market and we can't go there right now.

AiguyGary\_twitter

[22:34](#msg5da4f7e439d0c70757ade501)@greggirwin Couldn't a Mac user spin up a 32 bit old Mac VM inside of 64 bit Catalina and run in there if they had to for a while? And I see there is a Docker for Mac also they could run or distribute that way to save their users from having to set up a VM. I guess the VM software for Mac Parallels or VM Fusion cost s a little money but Docker would be free. This article describes the Catalina workarounds for running 32 bit software. https://www.pcmag.com/article/371267/how-to-run-32-bit-apps-in-macos-catalina

CodingFiend\_twitter

[22:43](#msg5da4fa0dc87a1d28acae8e67)@greggirwin you are correct that platform spread is costly and with finite resources one must make a decision. My assertion as someone who made their living 60% mac, 40% windows for 20 years, is that OSX is fading fast as a target platform. People like the Mac OS, and are programming JS and TypeScript, etc. on it, is the dominant usage pattern. They aren't targeting OSX, just using it as a convenient, virus free development environment. OSX used to be a viable target, but Apple has bungled the App store for the Mac, and destroyed all the older apps with their incompetence in terms of maintaining backwards compatibility. The hundreds of millions of IOS devices have created a marketplace that dwarfs the OSX space. Keep in mind that the Apple users have tons of money, and you can ask for, and get, any reasonable subscription fee to pay for the Mac development of Red. Unlike Linux users who have an almost pathological abhorrence of anyone asking for money in a straightforward manner, the Apple customer base has been well trained by their masters, and expect to pay for things. $400 for a small SSD, no problem. They view free products with suspicion in some cases, because there is no free lunch. You are talking about the richest 10% of users in any country. When you see a Chinese mac user , you know they are in the top 1%. So it's a great market, and no need to make it freeware. So many companies cower at charging for any software tool, but JetBrains is charging, and getting, yearly fees for their IDE and to be able to pay for staffers to keep Red on the mac in tip top shape i think you need to charge, else you will be tempted to cut it, because of its small marketshare. It is a luxury brand and needs to be treated as such.

greggirwin

[23:54](#msg5da50ab88e2e9a7c6bfbb40a)@AiguyGary\_twitter yes, it's a bit inconvenient, but entirely doable.

@CodingFiend\_twitter agreed on the market fit.

## Tuesday 15th October, 2019

pekr

[05:54](#msg5da55f1e158cfd673532ca92)@greggirwin - asking constantly for hard numbers might be understandable, but also gets a bit artificial. Sometimes, there might not be hard numbers, if you need to envision future (5+ years) scenarios to come. I have seen some strategies, which were not valid in 2+ years timeframe anymore. So a tough call.

I will shortly describe our company situation. We've got an ERP, which still has its front-end being done done in obsolete Silverlight. 2-3 years ago, vendor plus us, started to add some mobile small apps to some agendas. Vendor does so in Xamarin, other 2 companies just switched to Flutter framework. I have thought our internal IT could do few quick bits using Red.

As we can interanlly decide, which technology we use, we can just start with Android. But here comes the CEO (management are mostly an Apple users) asking, if we could install him all mobile apps on his device, which means iOS. So, in my book - I don't care about OS-X much, but I do care about the iOS much more.

To get things in perspective, in the past, I have privately sponsored some stuff, which was developed as an open-source. I could imagine the same - paying for stuff by commercial entity, getting a cheaper offer in exchange for stuff being publicly available. I can smell an oportunity here. And if there would be more oportunities like that, what's there not to like? Red being practically used in a commercial sphere, ppl being paid, functionality being paid for and developed?

9214

[10:47](#msg5da5a3c6f1c89c0758f17ca1)@greggirwin a common-sense way to get "hard numbers" across the whole community is to make a public survey, not to ask for anecdotal evidence on Gitter chat.

&gt; You know what's coming next. Make a wiki page

I'm sorry, but random person cannot run business analytics for the project, and you cannot really delegate decision-making. If you need data - tech media is soaring with Catalina-related sentiments, just open any of the threads and start digging, not to mention all the links accrued in internal development chat. I'd personally suggest to let it brew for a while, to avoid emotional biases - it's obvious that Apple gets all the bad rap right now, without any grain of reason to base decisions on.

pekr

[14:55](#msg5da5ddca57c2517c6a127f72)+1 to what Vladimir said ... ppl/users in their nature, will come up with their needs, that's just that simple. It is upon the Red Team to analyse, make a roadmap to follow and make a decisions for eventual changes in direction, keeping in mind all possible aspects of running a sustainable project ...

greggirwin

[18:00](#msg5da6093bdbf676673465d4bd)Thanks for the input @pekr. I will argue, however, that if there aren't hard numbers, or we don't look for them, we greatly increase our chances of failure.

@pekr @9214, let me clarify. When I said we need hard numbers, and that anyone can contribute, this is a research task. Find stats, numbers, surveys (we should not run our own for this, and it can't be just our community we get data on), and put those in a wiki page. Then, yes, Team Red and others analyze it and we make decisions. As numbers change, we keep it up to date. This is business analysis, and while we are a FOSS project, that doesn't mean everyone contributing is a coder.

GaryMiller

[19:25](#msg5da61d1d4afd703a4ee6a457)

greggirwin

[21:10](#msg5da635bc894dee56e54c71b4)https://github.com/red/red/wiki/%5BNotes%5D-OS-R&amp;D

## Wednesday 16th October, 2019

rebolek

[12:11](#msg5da708f41e314c04671ba4a3)@9214 instead of responding to @greggirwin, shouldn't you be sending him to another room? :smirk: Anyway, here are some hard numbers. I use Linux and macOS, in that order. If no other hard numbers are presented, Red should refocus from win to lin :smile:

toomasv

[13:08](#msg5da7165b809de9699f49ffc6) :joy:

greggirwin

[18:32](#msg5da7624339e2ef28adf3b037)@rebolek wins again.

toomasv

[18:49](#msg5da7664c39e2ef28adf3cc04)~~wins~~ lins!

greggirwin

[18:52](#msg5da766dc4afd703a4ef01ef0)Grrrrr. ;^)

## Thursday 17th October, 2019

rebolek

[06:00](#msg5da803938e2e9a7c6b1128dc):smile:

planetsizecpu

[10:59](#msg5da849a739d0c70757c58413)I think FullStack Tech has demonstrated (by far) that is a market focused company, I mean that perhaps it is guided more in putting the focus on markets that are more profitable to sustain the business, while it is developing the Red language -what it's OK and very necessary- not in the hard numbers.

Take for example that the company had an interest in entering the banking market, because it has a interested customer, this could be encouraged by simply adding code-emiter for AIX or Z systems (without view), perhaps not such a difficult task after all, I don't know, it's just an example of what What I mean, that hard numbers are not a sucess indicator some times.

## Friday 18th October, 2019

Senenmut

[11:24](#msg5da9a0f6ea0d6159fd86bdf1)hi there , may i ask , in thougth of the state of development of RED ; are there currently any networking functions on the windows platform working to check out ? Kindly Regards Sennenmut SM

greggirwin

[15:51](#msg5da9df6d0ac62f4acd962e0d)Networking support is in progress, and will come in 0.7.0 with full I/O.

Senenmut

[16:57](#msg5da9ef130fdc4b65070f17d9)hello gregg. Mr. Bit-Fighter. Do you mean the thought is to serve the dinner when a couple of tools are ready instead of offering a little appetizer first ?

greggirwin

[17:00](#msg5da9efa6dd688b6b67f0f57e)I don't know how to interpret that. You have basic I/O today, so can read and write HTTP urls. Networking ports are part of the full I/O design, so can't come before that.

Senenmut

[17:02](#msg5da9f03bdd688b6b67f0fa0e)perhaps : FTP checkup for example , not complete ready , let us say a motivation "bonus" only to see that it works in a script.

greggirwin

[17:04](#msg5da9f0a1c864f365060f9692)FTP will likely be a community project, once TCP ports are available.

Senenmut

[17:07](#msg5da9f1350fdc4b65070f25a7)I understand. The guest is waiting for the complete dinner , but its worth it in a 5 stars restaurant. Drink a httpread beer first.

[17:11](#msg5da9f25fa28cd16529bd0227)Mmmmmmhhh the beer taste good. So i am glad to see the dinner when it is ready. Thank you gregg. I'll be back. SM

[17:37](#msg5da9f87724af474d28d327c1)"The hunter get the bit"

## Wednesday 23th October, 2019

tkslattery050558

[22:24](#msg5db0d306f26ea4729de33d3d)I hope cross posting to two rooms isn't too frowned upon. I decided this might be a better place for the question...So, I just downloaded red for windows, and clicked to compile... Norton is telling me there is a threat "Heur.AdvML.B". Is this something real, or a part of RED that just scares Norton??

## Thursday 24th October, 2019

endo64

[06:14](#msg5db141602f8a034357c92dc6)@tkslattery050558 it is a false positive and a known issue.

greggirwin

[17:02](#msg5db1d923a3f0b17849803bcc)@tkslattery050558 there are a few AVs that give us problems. Avira and Defender sometimes still do it, but things are better lately. Try the nightly build instead of stable, and let us know if you get a different result. You can also check virustotal for an overview of which work and which flag us.

tkslattery050558

[17:46](#msg5db1e358fb4dab784afb59ff)thanks Gregg - I'll give the nightly a try...

GaryMiller

[20:05](#msg5db204109825bd6bacc0dc5e)I have not been getting Virus alerts from Windows Defender since I switched from 6.4 to the daily download which I don't get every day but every once in a while to pick up any bug fixes and pray that new fast load is release by the inner circle.

tkslattery050558

[20:17](#msg5db206dd10bd4128a15640c1)I tried the latest binary and Norton let it compile, but erased all components as soon as I tried to start the console. Filename: red-21oct19-d7fd2829.exe  
Threat name: SONAR.Heuristic.170Full Path: Not Available

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

On computers as of   
10/24/2019 at 1:09:15 PM

Last Used   
10/24/2019 at 1:09:15 PM

Startup Item   
No

Launched   
Yes

SONAR Protection monitors for suspicious program activity on your computer.

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

red-21oct19-d7fd2829.exe Threat name: SONAR.Heuristic.170  
Locate

Very Few Users  
Fewer than 5 users in the Norton Community have used this file.

Very New  
This file was released less than 1 week  ago.

High  
This file risk is high.

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

Source: External Media

Source File:  
explorer.exe

File Created:  
red-21oct19-d7fd2829.exe

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

File Actions

File: e:\\Red\\ red-21oct19-d7fd2829.exe Threat Removed  
File: c:\\programdata\\Red\\ crush-2019-10-21-83358.dll Threat Removed  
File: c:\\programdata\\Red\\ auto-complete.red Threat Removed  
File: c:\\programdata\\Red\\ engine.red Threat Removed  
File: c:\\programdata\\Red\\ help.red Threat Removed  
File: c:\\programdata\\Red\\GUI\\ app.ico Threat Removed  
File: c:\\programdata\\Red\\GUI\\ core.red Threat Removed  
File: c:\\programdata\\Red\\GUI\\ highlight.red Threat Removed  
File: c:\\programdata\\Red\\GUI\\ settings.red Threat Removed  
File: c:\\programdata\\Red\\GUI\\ tips.red Threat Removed  
File: c:\\programdata\\Red\\GUI\\ gui-console.red Threat Removed  
Directory: c:\\programdata\\red\\ gui Threat Removed  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

System Settings Actions

Event: Process start (Performed by e:\\red\\red-21oct19-d7fd2829.exe, PID:11452) No action taken  
Event: Process start: c:\\Windows\\SysWOW64\\ cmd.exe, PID:1260 (Performed by e:\\red\\red-21oct19-d7fd2829.exe, PID:11452) No action taken  
Event: PE file creation: c:\\programdata\\red\\ crush-2019-10-21-83358.dll (Performed by e:\\red\\red-21oct19-d7fd2829.exe, PID:11452) No action taken  
Event: PE file creation: c:\\programdata\\red\\ gui-console-2019-10-21-83358.exe (Performed by e:\\red\\red-21oct19-d7fd2829.exe, PID:11452) No action taken  
Event: Process start: e:\\red\\ red-21oct19-d7fd2829.exe, PID:11452 (Performed by e:\\red\\red-21oct19-d7fd2829.exe, PID:11452) No action taken  
Event: Process start (Performed by e:\\red\\red-21oct19-d7fd2829.exe, PID:16328) No action taken  
Event: Process start: e:\\red\\ red-21oct19-d7fd2829.exe, PID:16328 (Performed by e:\\red\\red-21oct19-d7fd2829.exe, PID:16328) No action taken  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

File Thumbprint - SHA:  
Not available  
File Thumbprint - MD5:  
Not available

[20:18](#msg5db207003d669b28a0ce79af)Sorry, I was trying to edit that down, not hit return...

Respectech

[20:50](#msg5db20e89fb4dab784afca74a)I have despised Norton for a long long time. I'm really quite surprised people still use it.

greggirwin

[21:11](#msg5db213952a6494729c336fba)Thanks for the report. Norton is still an issue then.

## Friday 25th October, 2019

pekr

[04:26](#msg5db279753d669b28a0d1b37d)Norton - the biggest AV scam I have ever being faced with :-)

pierrechtux

[09:32](#msg5db2c1463d669b28a0d3d5fc)Norton commander - the very best file management tool I have ever used (before midnight commander and krusader) ;-)

[09:33](#msg5db2c14f7477946badc92d00)Hi there!

[09:34](#msg5db2c19ce1c5e91508d0b086)It's been a long time, and I don't see the French red discussion here in gitter: is it my configuration that got broken? Or has the group been removed?

pekr

[11:21](#msg5db2daada03ae1584f08706e)I do remember Volcom Commander and till today, I am using a Total Commander. Can't live without that :-)

pierrechtux

[11:22](#msg5db2daf7a03ae1584f08723e);-D I found a declination for my Android phone, can't remember its name.

[11:23](#msg5db2db33a03ae1584f08752c)Norton Utilities were awesome, also, back in those days. They almost had a sort of unix taste, with their two-letters names. #Nostalgia

AiguyGary\_twitter

[12:49](#msg5db2ef40e469ef4358620f3d)I think Norton got bought by Experian the same company that let all of our credit data get stolen and sold on the dark web and now they are trying to sell you a protection plan against its misuse and bought Norton to give along with it to further that false sense of protection.

pierrechtux

[12:49](#msg5db2ef6be469ef43586210db);-D

endo64

[12:55](#msg5db2f0dba3f0b17849889159)If you are on Windows and missed Total/Midnight-Commander, you can try https://www.farmanager.com/  
As a terminal ConEmu is a good one and works very well together with Far: https://conemu.github.io/

pierrechtux

[15:28](#msg5db314ac10bd4128a15deae2)Windows? Does this still exist? I gave up about fourteen years ago, sorry...

rebolek

[15:52](#msg5db31a5a14d55a3785751b16)Unfortunately, it not only exists but there are still lost souls who have to use it as some kind of evil torture.

endo64

[16:34](#msg5db3240da3f0b178498a1a28)Yes it is still exists and In April 2019, Windows had a desktop market share of 79.24%.

rebolek

[16:42](#msg5db3260ee1c5e91508d3a51e):-)

[16:45](#msg5db32694a03ae1584f0abd24)Yesterday I started updating my W10 VM (something I haven’t done for a year at least). It’s still not finished. Updating 4 years old macOS on hackintosh took 3 hours at most. And I’m not talking about Linux. It has market share because people are forced to used it mostly beacuse of Office. But I can’t think of any other advantages.

pekr

[17:15](#msg5db32d9510bd4128a15ea4b0)I can't think of any other disadvantage. W10 stability problems are imo a myth. Doing gfx and video related stuff. And don't get me started on the Catalina :-)

pierrechtux

[17:37](#msg5db332c5ef84ab3786982cbd)Hey, happy OS trolling here! ;-D

greggirwin

[18:50](#msg5db343f8e469ef43586490b7)https://gitter.im/red/red/France

I used TotalCommander for many years. Now I use DirectoryOpus.

rebolek

[18:51](#msg5db3442b7477946badccf5e9)Wasn't DirOpus on Amiga?

greggirwin

[18:51](#msg5db3443bf26ea4729df5b193)Perhaps. It's been around for a very long time.

rebolek

[18:52](#msg5db3448614d55a37857649df)I believe it was originally Amiga-only, like Vim. I need to take a look.

[18:54](#msg5db344f2a3f0b178498b148a)Yup! "Directory Opus is a popular file manager program, originally written for the Amiga computer system in the early to mid-1990s." https://en.wikipedia.org/wiki/Directory\_Opus

GaryMiller

[20:20](#msg5db35929fb4dab784a064da5)File Manager? I spend 99% of my time in an IDE now. I can't remember the last time I had to use a file manager! 2TB SSD allows me to forget about how much disk space I'm using. Maybe I'll check next year and see if it's time to upgrade again. Free Microsoft IDEs like Visual Studio Code allow you to do everything you need without leaving the IDE. And it's cross platform for you Linux guys! Main reason I never jumped to a Dual Boot/Linux Windowss 10 is I like to use the latest hardware/software and don't want to wait for and search for drivers. If the big system sellers like DELL, HP, CyberPowerPC, Origin PC started supporting Dual Boot systems I'd probably buy one but the ones who do sell a few Linux models seem to limit them to just a few models with older hardward and charge more than for the equivalent Windows box. Also its just so easy now to spin up a Docker container for Linux and they use a lot less resources. https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/linux-containers

endo64

[21:03](#msg5db3633afb4dab784a069ae9)DirectoryOpus was (is?) the best file manager, none of the others are even close to it.  
But if anyone seeks a Windows Explorer replacement, there are, way simpler than DOPUS, Explorer++ and Q-Dir (yes, Windows again :) )

## Monday 28th October, 2019

nagylzs

[13:38](#msg5db6ef549c398215099cc483)Hello, I just found out about the Red language 30 minutes ago. I would like to know if this is the good place to ask some basic things.

endo64

[13:41](#msg5db6f0193d669b28a0f02670)@nagylzs Yes! This is the best place. Any past experience about Rebol?

nagylzs

[13:42](#msg5db6f0489c398215099ccd12)Nothing.

[13:42](#msg5db6f0553d669b28a0f027ec)Should I read about rebol first?

[13:45](#msg5db6f0e17477946bade59c2b)I'm a senior developer, I was working with Java, Pascal, Node js, Python, SQL and many others in the past 20 years.

[13:46](#msg5db6f1432f8a034357f0bb11)I need to create a small native GUI program for Windows, that can POST a big file (multipart/form-data) to a server on HTTPS.

[13:47](#msg5db6f18314d55a37858f05e3)It seems that Red can create small native executable and can also create native GUI for Windows. But I could not find anything about HTTP POST-ing data (especially streaming large files into a request).

[13:47](#msg5db6f18d3d669b28a0f02d46)Is there a library that I could use for that?

toomasv

[13:55](#msg5db6f33ee1c5e91508ed1f23)@nagylzs \[REBOL docs](http://www.rebol.com/docs.html) help a lot in the beginning. Red is highly compatible with REBOL but there are \[some differences](https://github.com/red/red/wiki/%5BLINKS%5D-Coming-from-REBOL).  
Red \[official docs](https://doc.red-lang.org/en/), \[wiki](https://github.com/red/red/wiki), \[more material](https://www.red-lang.org/p/documentation.html).  
You'll probably need @rebolek's \[HTTP-tools](https://github.com/rebolek/red-tools/blob/master/http-tools.red) and of course \[GUI docs](https://doc.red-lang.org/en/gui.html)

nagylzs

[13:56](#msg5db6f3a4ef84ab3786b1cadd)Thank you I'll read these first.

toomasv

[13:57](#msg5db6f3cea3f0b17849a3b7d7):+1:

endo64

[14:36](#msg5db6fcd12f8a034357f10ec0)@nagylzs Also check https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#how-to-make-http-requests

## Wednesday 30th October, 2019

fZAXwS

[12:02](#msg5db97bc62a6494729c66ffb2)Hello, everybody. I'm a latinamerican REBOl, ORCA, BORON fan, I was user of Syllable, I love AMIGA

[12:02](#msg5db97beb14d55a3785a1590f)I'm not a coder, I'm specialized in organizational development and agile methodologies

[12:03](#msg5db97bf53d669b28a0023f0a)I see a lot of potential here in Red Language

[12:03](#msg5db97c037477946badf7da35)And of course, I respect a lot the legacy of Carl Sassenrath

pekr

[12:54](#msg5db987efe469ef43588f7b21)Welcome here, completly forgot about the Orca spin-off :-) Also World Rebol clone is worth to mention :-)

fZAXwS

[13:11](#msg5db98c14ef84ab3786c463e9)Thanks :)

[13:12](#msg5db98c2d3d669b28a002b5a0)Yes, I forgot Orca and I didn't knew about World Rebol

[13:12](#msg5db98c3da03ae1584f36fedd)But the fullstack nature of Red sounds great

endo64

[14:26](#msg5db99d7c9c39821509aff630)@fZAXwS Welcome! Check also other rooms (https://gitter.im/orgs/red/rooms) and wiki pages (https://github.com/red/red/wiki), additional to the official site/docs (https://doc.red-lang.org/) for more info about Red.

## Wednesday 6th November, 2019

dnmurphy

[01:23](#msg5dc2208d2f8a03435742bb1b)Rebol's big selling point to me was cross-platform capabilities. Many developers use Macs even if they also target Linux of even windows. red/rebol also ahs other selling points but for me without the cross platform capabilty its a dead end. Howver although red/rebol is / are fascinating I would not use it as a serious development platform in the current state, its a long way from prime time. IOS support is pretty essential too, and its market is large. Lots of competition sure, but that's the same with all platforms where there is money to be made. I will keep checking in on Red out of interest but to me it's taking to get anywhere useful and looks increasingly like a dead end.

## Friday 8th November, 2019

Senenmut

[19:04](#msg5dc5bc3efd6fe41fc04c122c)hi at all , nevertheless of cross platform may i ask for a standard feature ? How about a database feature inside red. ( i mean not SQL) Is it in , or makes it even sense ?

[19:16](#msg5dc5bf23add5717a88d1f0fb)i mean a little "on board tool" for small data amount.

greggirwin

[19:18](#msg5dc5bf9752b73c7cb2e1fcdc)DBs will be modules. The easiest built-in DB is `save/load`. :^)

Senenmut

[19:21](#msg5dc5c03268ad1c4a0f8fb503)yeah , you mean "modules" such like "packets in go" ??

greggirwin

[19:22](#msg5dc5c06d5eb2e813dbec9750)General modules and packages, yes. Things you can include optionally.

Senenmut

[19:26](#msg5dc5c16450010612b2833ade)yeah , huge amount of work. thank you for the answer.

GaryMiller

[20:07](#msg5dc5cafd5a979223c39a26b0)I was hoping for an ORM then you could interact with any database so long as you had a software driver for it. Similar tot ODBC but more Red-centric. If your tables/views/cursors got generated as arrays of objects with CRUD (Create, Retrieve, Update, Delete) functions then your code should work with any database that has a driver.

greggirwin

[20:32](#msg5dc5d0e9eeb63e1a837bd469)ORM only applies to one type of DB though, and it no longer reigns supreme. ODBC is a library interface like any other. The "should work" part is also important. I don't know the state of ODBC these days, but it hasn't always been smooth sailing. Ashley Truter (@dobeash) may know the most in this area, along with `munge` and his other work.

What we have to do is determine use cases and their importance. Should we spend time on ODBC or modern APIs ? Enterprise or indie users? RDBMS or NoSQL bias? Compatibility and integrations or a native solution that just works, and fits Red idiomatically?

GaryMiller

[21:19](#msg5dc5dbc75a979223c39aa2fc)That depend on who you determine your market to be. If you are going after a business market for Low Code Development Solution with Red Pro then you either have to have a way to read/write/import/export to the most popular data formats or make the user go through intermediate steps like CSv, JSON or XML which adds a lot of extra overhead and effort for the developer but allows you to get a product out the door much quicker.

[21:24](#msg5dc5dd1350010612b283f29c)ORMs started as mappng relational database to the object oriented model. But if the ORM has a JSON datatype it can work with NOSQL databases as well. And graph databases can also be supported with a graph datatype with arrays of nodes connected by arrays of links with various supporting atattribute. https://zappysys.com/products/odbc-powerpack/

## Saturday 16th November, 2019

0xJes

[06:41](#msg5dcf9a2d4adf071a843b0594)Hello

[06:42](#msg5dcf9a44c26e8923c4338002)I'm going to ask something...

[06:42](#msg5dcf9a5dadd5717a8818ba3c)I'm running Void Linux with Musl libc

[06:43](#msg5dcf9a74fd6fe41fc092ca64)https://wiki.musl-libc.org/

[06:47](#msg5dcf9b975eb2e813db32f964)The red toolchain simply wouldn't run under my linux distro

[06:53](#msg5dcf9cee92a84f79fe7724bb)And Void does not offer the multilib repo with their musl option, so, no 32 bits libcurl

[06:55](#msg5dcf9d5450010612b2c944a1)Someone knows some easy way i can run red? xd

rcqls

[06:57](#msg5dcf9df4e75b2d5a19e00d1e)@JesMJM Docker? I use this on my macOS… but it is tailor-made for Linux.

[07:06](#msg5dcfa0136ba2347d2da1d350)Are you sure that voidlinux could not install red ?

```
In case you want to compile i686 packages on your x86_64 machine you can use one of the bootstrap commands with a different masterdir and the target architecture as second argument.
```

0xJes

[07:19](#msg5dcfa2e535889012b1194918)You say that i can build libcurl 32-bits? but i think i would need something else for running red under musl

[07:19](#msg5dcfa309ca778c1fbf10d7d8)i've found this https://github.com/red/red/wiki/%5BDOC%5D-How-to-run-Red-on-Turris-Omnia

[07:22](#msg5dcfa3a3c26e8923c433cb56)If i compile and install the needed 32 bits libraries, and do that symlink thing, red would run?

rcqls

[07:24](#msg5dcfa416ea7d147cb38af031)No just quickly reading the doc, I wonder if it is possible to compile i686 packages on x86\_64 architecture…. but there is no gtk+3 libcurl packages on i686-musl architecture….

[07:25](#msg5dcfa474091dd14a0ecbefc9)So it seems that there is only docker solution to run Red.

rebolek

[07:27](#msg5dcfa4e54adf071a843b46c5)Hi @JesMJM you can link Musl as libc and Red will run, but file operations won’t work anyway. It would be great to have Red working with Musl and I hope that we can get there, once we got ports (as it requires changing currently used simpleIO, so it’s best time to fix it).

0xJes

[07:30](#msg5dcfa58450010612b2c97c5b)I have tried using docker before, it works... but it's somehow a hassle the entire setup of docker for only running red

rebolek

[07:32](#msg5dcfa5f035889012b1195ef2)I wrote the TurrisOS article and am interested in running Red on musl too, so in some spare time I want to try to identify where the problems are and make necessary fixes.

[07:32](#msg5dcfa60350010612b2c97f98)Of course, if anyone is willing to help, I will really appreciate it :)

rcqls

[07:32](#msg5dcfa61ee75b2d5a19e046c2)I am using `https://github.com/rcqls/docker-red-gtk` to run red-gtk on macOS … and it should obviously work on Linux.

0xJes

[07:36](#msg5dcfa6ff6ba2347d2da20679)Yeah xd, time ago, i installed docker, but i downloaded a Debian image and installed red there

[07:37](#msg5dcfa73e92a84f79fe776c3e)But i haven't used docker before that...

[07:58](#msg5dcfac1d35889012b1198abf)i tried symlinking `/lib/ld-musl-x86_64.so.1` as `/lib/ld-linux-x86_64.so.3`but red still doesn't run, its because i need the libcurl32 dependency?

rebolek

[10:23](#msg5dcfce236ba2347d2da31444)@JesMJM you must use also 32bit muls/libc

## Monday 18th November, 2019

0xJes

[02:19](#msg5dd1ffbc091dd14a0edc362a);-;

## Wednesday 20th November, 2019

bubnenkoff

[14:28](#msg5dd54d79167c4f62b7889add)I know that `:` is used for declaration words. But what the next code mean:

```
cases: [
    c [print "center"]
    r [print "right"]
]
```

how to read it? I mean content of brackets

hiiamboris

[14:34](#msg5dd54eefedec8e6c1ab09eba)http://www.rebol.com/docs/core23/rebolcore-3.html#section-4

GiuseppeChillemi

[22:29](#msg5dd5be43b5e589513e25d772)@bubnenkoff The content of the brackets is a list of Red elements. Try `do cases`, what happen ?

## Thursday 21st November, 2019

xqlab

[07:20](#msg5dd63ac10bb46a64a5f77eef)@bubnenkoff this should probably used in a switch statement:

```
>> switch 'c cases
center
>> switch 'r cases
right
>>
```

[07:22](#msg5dd63b277a4c62147b28b2e8)see help switch

[08:16](#msg5dd647fb4941f9513fc99416)

```
>> sw: 'c
== c
>> switch sw cases
center
```

GiuseppeChillemi

[08:26](#msg5dd64a21bc163f62b639cf26)Yes, let him try `do` too. I have a path for him ;-)

bubnenkoff

[11:57](#msg5dd67bbcb010e6227643d48e)

```
>> probe x
["ddd" enddd' "ggg" "aa" "bb" "cc"]
== ["ddd" enddd' "ggg" "aa" "bb" "cc"]
>> 
>> remove second x
>> probe x
["ddd" enddd' "ggg" "aa" "bb" "cc"]
== ["ddd" enddd' "ggg" "aa" "bb" "cc"]
>> 
>> remove second x
```

how to remove second element?

rebolek

[11:59](#msg5dd67c26b010e6227643d788)`second` returns just second value, so what you need is to skip to second value:

```
>> block: [1 2 3 4 5 6]
== [1 2 3 4 5 6]
>> probe head remove next block
[1 3 4 5 6]
== [1 3 4 5 6]
```

or

```
>> block: [1 2 3 4 5 6]
== [1 2 3 4 5 6]
>> probe head remove at block 2
[1 3 4 5 6]
== [1 3 4 5 6]
```

GiuseppeChillemi

[12:56](#msg5dd6899289fce12f259e979e)@bubnenkoff a block is a series of Red elements. It has an index and values. There are instructions that return the element you select and others that return the series at that index.

`second x` returns the second element of your series, which is of type `WORD!`.  
`at x 2` returns the series with the index positioned on its second element, `AT` returns a `BLOCK!`

`REMOVE` works on series. In `REMOVE at x 2`, the instruction `at x 2` returns the series at index 2 then `REMOVE` removes the element just under the index.

rebolek

[13:09](#msg5dd68c6d5b3db9548ac645d3)@GiuseppeChillemi thanks for detailed reply!

GiuseppeChillemi

[13:09](#msg5dd68c7d55bbed7ade1bdc67)`AT`, `NEXT`, `BACK` , `FIND`, `HEAD`, `TAIL` all return the series at the index you have requested.

While

`FIRST`, `SECOND`, `PICK`, `SELECT` return the element under the index.

[13:13](#msg5dd68d6399dfe74c958064bd)@rebolek He is having the same questions I had before your help and before some distinctions have been created in my mind.

[13:18](#msg5dd68eb4afacdc4de44c3d3b)(you are welcome!)

rebolek

[13:19](#msg5dd68ee3ac81632e65da0ff1):smile:

greggirwin

[20:48](#msg5dd6f80999dfe74c95838c57)@bubnenkoff you should have seen an error with your code:

```
>> x: ["ddd" enddd' "ggg" "aa" "bb" "cc"]
== ["ddd" enddd' "ggg" "aa" "bb" "cc"]
>> remove second x
*** Script Error: remove does not allow word! for its series argument
*** Where: remove
*** Stack:
```

Was that not the case?

[20:49](#msg5dd6f8461bf5192e667e4a60)If the second element was supposed to be a string (just a gitter typo I guess), you should see this:

```
>> x: ["ddd" "enddd" "ggg" "aa" "bb" "cc"]
== ["ddd" "enddd" "ggg" "aa" "bb" "cc"]
>> second x
== "enddd"
>> head remove second x
== "nddd"
>> x
== ["ddd" "nddd" "ggg" "aa" "bb" "cc"]
```

## Friday 22nd November, 2019

bubnenkoff

[10:02](#msg5dd7b21bc52bc74c966e311b)Does Red have instance of objects?

```
obj: make object! [
    v1: none
    v2: none
]
```

Is object are like class in traditional OOP?

pekr

[10:20](#msg5dd7b68ab010e622764c84d6)Unfortunately, it is not. You can use some object as a prototype, to create a new one. Due to a dynamic nature of Red/Rebol languages, I remember some attempts to create a class based system using mezzanie (Red level) code ...

rebolek

[10:52](#msg5dd7bdec55bbed7ade24767e)Unfortunately? :-)

bubnenkoff

[11:43](#msg5dd7c9f3c4fca14de3cc970a)What difference between token and terminal?

rebolek

[11:44](#msg5dd7ca0c5b3db9548acf1bbf)I'm not sure I understand the question.

bubnenkoff

[11:44](#msg5dd7ca2a9d72cd02b3248b85)`if(a>b) { }`  
Where is token where is terminal? Or red have own interpritation ?

rebolek

[11:49](#msg5dd7cb4e4517d002b2d1cdcb)Yes, Red has own interpretaion, In Red `if a > b []` is series of 5 values.

```
>> block: [if a > b []]
== [if a > b []]
>> length? block
== 5
```

Each value has its own type:

```
>> print collect [foreach value block [keep type? value]]
word word word word block
```

When you `do` this block, each value is evaluated. `if`'s value is usually \*\*if\** function, `>` value is usually \*\*greater-than\** operator.

I'm writing "usually", because word's meaning depends on context.

## Saturday 23th November, 2019

GiuseppeChillemi

[14:03](#msg5dd93c3f9d72cd02b32ee056)@bubnenkoff start thinking that in Red we have no variables, a word is just a symbol, like `<`. Symbols alone are empty, have no meaning, no value, no goal: they are like being in the Nirvana ! We are bad boys and coding we take those symbols from there to reincarnate in a Red Block as Red elements. But Red world is a multiverse, and instead of leaving just one life, everything has multiples lives. A word In one dimension exists as function, in another dimension it could be a value, and in another one it could be a string. In each dimension, a word/symbol could be something different. So your `>`, that you normally decode as "greater then", could be interpreted as "inject to" if you instruct Red to do so. In Red jargon a dimension to live in and be something different is called a "context", while giving to symbols and words a different working in a structured way is "building a domain specific dialect" (DSL) and it is done with `PARSE`. Parse is used to build new mini interpreters for Red sequence of elements (blocks) to be used in place of standard one.

## Sunday 24th November, 2019

ne1uno

[01:20](#msg5dd9dac0d2c92c2275e56415)bzzst

## Sunday 8th December, 2019

0xJes

[03:34](#msg5dec6f3e8e906a1c8d8c4404)hi

[03:34](#msg5dec6f4332df1245cb020efb)quick question

[03:35](#msg5dec6f9fc3d6795b9f41fc19)how do i move a file from /path-a/ to /path-b/?

Respectech

[06:57](#msg5dec9ecd32df1245cb033dce)I haven't tried in Red, but in Rebol you would just use 'rename

[06:58](#msg5dec9f338e906a1c8d8d82ad)Or you could use "write %path/to/newfile read %path/to/currentfile delete %path/to/currentfile"

endo64

[15:54](#msg5ded1cac5ac7f22fb582fc7e)You can also use `call`, `call either system/platform = 'Windows ["move ..."] ["mv ..."]`

greggirwin

[19:50](#msg5ded5419f65fec1c8ee6899a)`Rename` isn't implemented in Red yet, so you either need to use a system call as @endo64 shows, or write a small func to do it. e.g.

```
move-file: func [file source "path" dest "path"] [
    either error? try [
        write/binary dest/:file read/binary source/:file
        delete source/:file
    ] [false] [true]
]
```

[19:52](#msg5ded547cd64a052fb6dc1146)Yes, someone will say to use `not error? try ...`, but this is more explicit because it's the welcome room.

## Tuesday 10th December, 2019

Palaing

[14:04](#msg5defa5ea6a85195b9e30c847)Hi all  
I've contributed a small implementation of the "2048" game here: http://rosettacode.org/wiki/2048#Red  
Next step is adding tile animation - anyone is welcome to take over ;)

Respectech

[16:46](#msg5defcc021659720ca833b631)How does one move the tiles on your game?

[16:52](#msg5defcd3546397c721cc03a24)Nevermind. I figured it out. Arrow keys on the keyboard. :-)

greggirwin

[20:29](#msg5df0001fb065c6433c7418b3)Very nice @Palaing. :+1: Can you include an image, like the Java version, to show that it's a true GUI solution? Looks like it clobbers everything else size wise.

Oldes

[21:27](#msg5df00db71659720ca835a151)@Palaing very nice, but it would be nicer if you would used \_tab_ size 4 (or probably just 4 spaces instead of tab)

[21:31](#msg5df00ebcb065c6433c748429)Anyway... it's crazy that someone is able to write something like the Racket version.

rcqls

[22:23](#msg5df01af48e906a1c8da70c6f)@Palaing It seems that there exists another version of this game on github \[red-2048](https://github.com/hyzwhu/red-2048.git). I used to test it when developping `red/GTK`.

## Wednesday 11st December, 2019

Palaing

[08:48](#msg5df0ad41072446515d8849bf)@Oldes I used tab size 4 but did not pay attention that it changed when pasting the code. Now changed it to 4 spaces.  
@rcqls you spoiled my day :) That will teach me to search more. Or I'll comfort myself that my version is shorter.  
@greggirwin good idea, will do that.

rcqls

[10:09](#msg5df0c042e47fb31eb791ee1b)@Palaing :thumbsup:

## Tuesday 17th December, 2019

lucindamichele

[04:49](#msg5df85e4655d93923002477b4)@Palaing Love it!

Palaing

[20:17](#msg5df937f0dbf24d0bec08f019)@lucindamichele Thanks!

dander

[21:13](#msg5df944ebdbf24d0bec0949cf)@Palaing It does look really nice. I think you have a typo in the victory condition though :)

## Wednesday 18th December, 2019

Palaing

[15:55](#msg5dfa4c0e0cb24d1d44dff25e)@dander you're right. ~~it's the early bird discount~~ it's been corrected, thanks!

## Wednesday 25th December, 2019

rebred

[19:42](#msg5e03bb888dfce538b50a77c9)are there any plans for sound ?

endo64

[19:44](#msg5e03bc30b1701e50ca85eeec)It's not a priority, but eventually it will be added, so no ETA.

rebred

[19:45](#msg5e03bc60e0131f50c9a5a583)Merry Christmas everyone!!!!
