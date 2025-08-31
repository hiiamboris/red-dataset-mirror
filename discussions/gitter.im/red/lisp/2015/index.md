# Archived messages from: [gitter.im/red/red/lisp](/gitter.im/red/red/lisp/) from year: 2015

## Monday 28th December, 2015

DonaldTsang

[19:16](#msg56818a9f3acb611716000551)To

## Tuesday 29th December, 2015

dockimbel

[07:12](#msg5682326a3acb61171600116b)Let's talk here about macros and other possible Lisp features which could make their way into Red.

[07:14](#msg568232e99606b15a055df840)My #1 concern for macros in Red is IDE support, so any good example of an IDE for a Lisp language, which can properly handle a macro system layer is welcome.

[07:16](#msg568233584f069158055c2a4e)A apparently simple feature like mapping back a runtime error to the source code line number is already very hard (or very expensive) to achieve in Rebol languages, so I am worrying about macros making that even harder, or so impractical that we wouldn't implement it.

[07:33](#msg568237303acb6117160011d2)@JacobGood1 You are posting some very interesting links about Lisp languages, but they get easily lost in the flow of the discussions, so if you could gather them on a new wiki page on github, that would be very useful! (at least for me)

maximvl

[08:52](#msg568249e135e1a316162e8382)afaik SBCL has no line numbers in debugger, but whole backtrace with function calls and arguments

[08:54](#msg56824a2a0199d70069e00cc2)even defun is a macro, so line numbers on expanded code have no meaning

tanstaaf1

[09:25](#msg5682519d9606b15a055dfad0)@DonaldTsang Instigated by your question I just reinstalled Shen and began going through the tutorial. Here goes my ADHD again! :-/ My experience with Rebol/Red is that it CAN be written in functional way (due to its lisp roots) but there is currently little to enforce or even support that. Shen claims strong support for functional programming, with static typing, lazy evaluation, and immutable data. My HYPOTHESIS is that functional programming discipline in grades 6-12 could be a major help in teaching life-long mathematical and logical thinking...which I personally feel humanity desperately needs going forward. In any case, stronger ability to think functionally should give the children a major competitive advantage in life. I don't know the truth of my hypothesis yet, but I am pretty set on figuring it out...beginning in 2016.

[09:41](#msg568255444f069158055c2cd9)@dockimbel I have no experience with Lisp style macros, so perhaps I should keep my question quiet and not embarrass myself...but I won't! :-) Since macros shouldn't be lightly /often used by any but top-tier programmers, mightn't you just turn off the IDE functionality (dropping back to a straight editor) when macros are used? That may seem like a cop out, but less of one than refusing to implement macros at all -- simply because they create a problem with the IDE!

maximvl

[09:43](#msg568255c20199d70069e00de5)well, macros are basically ability to execute code at read-time

[09:44](#msg568256033acb61171600142a)&gt;Since macros shouldn't be lightly /often used by any but top-tier programmers

[09:45](#msg568256239606b15a055dfb33)how "ordinary" programmers should use libraries with macros then?

tanstaaf1

[09:48](#msg568257050199d70069e00e0f)@maximvl I thought @dockimbel 's concern has entirely to do with getting macros to cooperate with his embedded IDE. If someone can propose a way, then great. But if not, it seems silly to let the needs of the IDE outweigh the needs of the programmer. As Goethe said, "The thing which matters most should not be a the mercy of the things which matter less."

[09:51](#msg568257a435e1a316162e84bc)Does that make any sense? As I said I haven't used lisp macros, but I know that in lispland benefits of macros trump IDE every time.

maximvl

[10:16](#msg56825d924f069158055c2dbe)probably LispWorks / DrRacket deal with macros, I haven't used them though

Skrylar

[13:39](#msg56828d1935e1a316162e8b33)I agree that something being difficult for an IDE to parse is a poor reason to avoid their implementation; if that were a sensible case, then quite a lot of features would not exist (prototypical objects for one, which are notoriously difficult for static analysis. cf. Pharo Smalltalk, whom's best completion framework can do little more than offer to complete against \*all possible* messages that could be sent to an object \[2014].)

[13:40](#msg56828d503acb611716001abc)I'm not certain I buy readability as an argument either--all red (sic) flags I've brought up for some syntax or error message being uninformative or accident prone to newbies has been summarily ignored, so that clearly is not a goal of high importance.

[13:43](#msg56828e0d0199d70069e014f6)What Lisp has traditionally offered here, which does not exist for others, is live debugging. You may use `(macroexpand-1 ...)` to determine what exact code a particular macro call will produce without that final piece of code being applied. It is also possible to run `(macroexpand ...)` to have \*all* layers of expansion done and returned at the REPL. This is far more informative than what the next nearest feature (C++ templates) offers, which has "line numbers" back to source files (yet is so undescriptive and awful that this information is almost equally as useless as if it didn't exist in the first place.)

[13:46](#msg56828ec935e1a316162e8b70)As for storing symbolic information here, you'd store that information in the tokens. If you read the output of GCC's preprocessor there are flags in the resulting files which instruct the compiler to treat the current location as somewhere else (cf. #line directives.) These statements are injected automatically (by GCC, and others) to handle the "which line did this fragment originally come from?" problem.

[13:48](#msg56828f463acb611716001afa)The traditional appeal against macros from Scheme has been that they are unhygenic; it is possible for a macro to call anything, such as `(gensym)`, which changes a global counter. Whether you use macroexpand or call the macro directly, that counter is still expanded regardless. For the most part this is harmless (one should not depend on anything about gensym, as it exists for the express purpose of giving macros a way to uniquely identify transient values from one another), while an IDE will need to be aware of this possibility.

WiseGenius

[15:22](#msg5682a5194f069158055c36a9)Paul Graham's opinion from \[Being Popular](http://www.paulgraham.com/popular.html):  
&gt; Classic macros are a real hacker's tool-- simple, powerful, and dangerous. It's so easy to understand what they do: you call a function on the macro's arguments, and whatever it returns gets inserted in place of the macro call. Hygienic macros embody the opposite principle. They try to protect you from understanding what they're doing. I have never heard hygienic macros explained in one sentence. And they are a classic example of the dangers of deciding what programmers are allowed to want. Hygienic macros are intended to protect me from variable capture, among other things, but variable capture is exactly what I want in some macros.

JacobGood1

[15:28](#msg5682a6b23acb611716001ded)@Skrylar how much experience do you have with common lisp? It seems as if you know what you are talking about when it comes to macroology

[15:29](#msg5682a6ec9606b15a055e0573)The reason I ask is because I would like your opinion on what features you would like to take/rip from cl

[15:31](#msg5682a761653b30761d767daf)@WiseGenius agreed,

From Doug Hoyte:

The current popular solution is to use so-called hygienic macros11. These solutions try to limit or eliminate the impact of unwanted variable capture but unfortunately do so at the expense of wanted, desirable variable capture. Almost all approaches taken to reducing the impact of variable capture serve only to reduce what you can do with defmacro. Hygienic macros are, in the best of situations, a beginner's safety guard-rail; in the worst of situations they form an electric fence, trapping their victims in a sanitised, capture-safe prison. Furthermore, recent research has shown that hygienic macro systems like those specified by various Scheme revisions can still be vulnerable to many interesting capture problems

[15:34](#msg5682a8174f069158055c3709)@dockimbel I do not really know what I have posted, I will have to go through the history to retrieve the links... it might be a little while till I get around to doing that. In the mean time, I will post lisp influencing links here.

@PeterWAWood thanks for setting up the channel

Skrylar

[15:37](#msg5682a8c23c6894026925336c)@JacobGood1 Only a month or two, if all the time was added up. I haven't used Common Lisp implementations directly, since they don't support the targets I need without paying licensing fees that I can't :) That being said, I'm already familiar with using generators and filters (in a music, procedural art and programming sense.) I've seen some projects use eruby to in place of the C preprocessor, because it allowed them to generate a lot of boilerplate for template code. It's also possible to do this with Templet and Lua, which is slightly better (the necessary lua framework can be shoved in a project and hooked up to CMake, which means others don't need to install anything to compile your macro-generated code.)

[15:39](#msg5682a929653b30761d767de4)There is an identical mental shift when one is used to transformer pipelines, to using macros in programming. It is inherently the same thing, although the Patcher in FL Studio is significantly more friendly to work with than say, `(defmacro)` in a text file.

[15:40](#msg5682a9620199d70069e018a9)If one was using an interface similar to noodle graphs (or that Code Bubbles prototype), you could probably visualize macros as a kind of filter as well. I suspect we wouldn't, though, since equating code to a flow chart is a very different UX beast than most people are used to.

onetom

[15:59](#msg5682adfa653b30761d767e7c)To give a clue about the magnitude of headaches macro handling causes in an IDE, have a look at:  
https://github.com/cursive-ide/cursive/issues/147

&gt; The problem is exactly the fact that, as you say, macros are arbitrary  
code. That is, when you run a macro  
&gt;  
&gt; 1) it might never terminate (and of course you cannot decide beforehand if it's terminating -- \*that's the Halting problem\*)  
&gt;  
&gt; 2) it could use a large amount of resources (memory, time)  
&gt;  
&gt; 3) it could format your HD  
&gt;  
&gt; You can implement a sandbox, but it's a complex matter. ...

JacobGood1

[16:00](#msg5682ae12653b30761d767e7f)For the record, if common lisp is our main influence, we need to concede to the fact that cl was/is a multi-paradigm language. Meaning it is just as oop, as it is imperative, as it is procedural, as it is functional, as it is symbolic, as it is logical, etc. The reason I say this is because you will notice that all over the internet, lisp(commonly what common lisp is referred to) is known as a functional language, this could not be further from the truth. Although, with a few lib downloads, you could program according to the functional fashion in a very natural way, lisp is not inherently functional. I think red will best be suited as a multi paradigm language, of course, it seems to be in that vein already. Basically, let us not be emotionally attached to any one paradigm but realize that every paradigm can be strong in any given area of computational expression. I think this is the essence of a dialectable language, it can be functional when it needs to be, it can be oop when it needs to be, etc. So anything that can make the language more dialectable; taking away the run time inefficiencies that some abstractions introduce, should be paramount.

I am not limited to just lisp by the way, it is just that so many ideas that have leaked into other languages that have either migrated to lisp, or were originally created in lisp, are often done better in lisp.

My experience so far has been... Dart, Clojure, Haskell, Java, C/C++(barely), red/reds(barely), Python, C#(barely), Shen, Hy, Prolog(just started), Common Lisp.

I lack low lever programming experience as many of you have already noticed but that is being rectified very soon since I will be attending a c course at a nearby college.

Anyway, I am telling yall my coding experience so that yall can have a sense of where my influences have come from. I hope that we can all glean from the past to make red a great language!

I wish I had more experience with the pure oo languages... only so much time in the day...

btw, sorry for the wall of text =O

Skrylar

[18:25](#msg5682cffc3c689402692539ab)@onetom Red should probably have a set of debugging hooks as Lua does. Lua is easy to "sandbox" in this regard, as one can create a lua instance with a custom memory handler (to cap memory usage) and a debugging method set to put a time limit on execution (to cap execution time.)

[18:25](#msg5682d0189606b15a055e0b73)Lua is a good influence for safety concerns; its one of the few languages that makes it trivial to "make safe" for running untrusted code.

[18:26](#msg5682d05a0199d70069e01e90)If I recall, haXe also supports macros of a sort; a special flag has to be provided to allow macros access to I/O though.

[18:27](#msg5682d0793acb611716002438)I wouldn't quote me on haXe though; I haven't used in in a year.

eMBee

[18:55](#msg5682d71e9606b15a055e0c86)JacobGood1: i have the same experience, i didn't feel that common lisp was specifically functional

[18:56](#msg5682d745653b30761d768501)my common lisp code hardly looks different from what i would have written in an OO language

[18:57](#msg5682d78e35e1a316162e95f4)except for shorter functions and taking advantage of the fact that everything is an expression, leading to less temp variables

[18:58](#msg5682d7e13c68940269253aee)i'll need to study Structire and Interpretation of Computer Programming to learn functional coding i guess

JacobGood1

[20:58](#msg5682f3e83c68940269253f1f)@eMBee just use haskell for a while, it will force it on everything you do. If you desire an easier entry try clojure

tanstaaf1

[23:23](#msg568315ef9606b15a055e159d)@JacobGood1 How does Shen fit in to the haskell vs clojure comparison for learning functional? You previously recommended Shen over Clojure, I thought?

JacobGood1

[23:24](#msg5683163b3c68940269254402)@tanstaaf1 I do not remember recommending Shen over Clojure, I might have for a specific purpose(such as macros or type systems)

tanstaaf1

[23:26](#msg5683169d35e1a316162e9e1d)@JacobGood1 Maybe I misunderstood. I recall your saying you didn't like Clojure too much...I think because of debugging difficulty? Anyway, Shen doesn't seem to be picking up much of a committed base. Is it better in theory than in actual application? Any other functional languages you like?

JacobGood1

[23:28](#msg568317203acb611716002dc5)Haskell is the best, imo, for learning functional programming since it forcefully crams the paradigm down your throat. I definitely do like clojure, but, like any language I have tried, I have reservations.

[23:30](#msg5683179e35e1a316162e9e43)@tanstaaf1 Shen has not picked up much steam for a long time, much like Haskell in its beginnings. Shen is easy to get into but it gets ultra deep after a short time, even more so than Haskell. Out of all functional languages I have tried, I like clojure the best.

[23:31](#msg568317db0171d1791d029b16)Remember however that I do not consider Common Lisp to be a functional language, it is my current favorite language for anything.

[23:33](#msg56831857653b30761d768e30)I actually still really like objects even though it seems the whole world hates them... I think that they dislike java oop and have not tried the various other forms that exist

tanstaaf1

[23:35](#msg568318ad9606b15a055e15df)Wow. I completely misunderstood! I have put the most time into Haskell so far. I started trying to wade through https://en.wikibooks.org/wiki/Write\_Yourself\_a\_Scheme\_in\_48\_Hours because I vastly prefer to see meaningful programs up front (even if they don't mean very much to me at the beginning:-&gt; Got stuck after the first few chapters, though...and couldn't find good guidance (and no local users group). I hope to go back at some point, but it is a hard hard climb...imo.

JacobGood1

[23:35](#msg568318cf9606b15a055e15e2)@tanstaaf1 I have never taught a child how to program; I do not think my opinion on the subject to be very valid

[23:38](#msg56831976653b30761d768e59)@tanstaaf1 that is because of the type system, there is a lot to learn up front... hmm... maybe clojure would be better(see, I do not really know good pedagogy for teaching functional programming since I am now giving a different recommendation from Haskell). Maybe, the language should be simple as possible so that you can teach functional ideals quickly without going into type theory right off the bat.

[23:41](#msg56831a183c68940269254483)The problem is that I went to Haskell first for functional programming, that was insanely hard. Because of this, I have no idea how hard it would be to start in other functional languages. I can assume that it would be easier in clojure, but that might be because I already had learned functional programming through Haskell before I even wrote one parenthesis in clojure.

tanstaaf1

[23:56](#msg56831dbb0199d70069e029b5)Simple as possible, to my childlike mind, sounds good. The real project for me is to teach proof writing and logical thinking skills beginning in the K-12 range. I'm toying with all these languages from the belief (and that is all it is at this point) that comfort with functional programming COULD greatly ease into that learning curve. But the languages have such intimidating learning curves. I am of the belief that whether learning a programming language, a spoke language, or near anything else, it is most important to give the student an easy slope which uses real (not trivial) problems right from the beginning.

## Wednesday 30th December, 2015

tanstaaf1

[00:00](#msg56831e9b0171d1791d029bd7)I'd love a book which started off, on page #1, with "Type in this 30 line graphical game" and play with it until you "win".... Now we are going to deconstruct the game so that, by the end of chapter 1 you will have a basic idea how it does what it does and by the end of chapter X you will be competent to modify the program or develop a similar game from scratch!"

[00:03](#msg56831f5b9606b15a055e16bb)So Nick's gui games (and gui based business demonstration programs) really grabbed me. I felt like I was transported back to the way it used to be with peak and poke etc. in BASIC.

JacobGood1

[00:33](#msg568326469606b15a055e17a5)@tanstaaf1 creating games in a functional language is no trivial task see http://prog21.dadgum.com/3.html and the follow up http://prog21.dadgum.com/4.html

[00:33](#msg568326753acb611716002f7e)I myself have programmed a few games in clojure, I am of the opinion that game programming is better suited with a different approach

Travis-OBrien

[00:39](#msg568327dc0171d1791d029ce0)\`(swap! ~atom #(+ % ~n))

[00:54](#msg56832b4f653b30761d769087)anyone else programmed or try to program a game in Clojure? I'm currently wrapping over Libgdx with Clojure and it's quite the experience.

onetom

[01:22](#msg568331cd0171d1791d029db9)@tanstaaf1 I was just showing a little Rebol to my 9yr old son last night and we modified \[Viewtop/REBOL/Games/Rebtris](http://www.rebol.com/view/games/rebtris.r) together. That was quite a relevation to him...

Travis-OBrien

[01:26](#msg568332b10171d1791d029dd4)@tanstaaf1 great job man, brainwash them while they're young!

dockimbel

[10:56](#msg5683b84b4f069158055c543a)@Skrylar \*-all red (sic) flags I've brought up for some syntax or error message being uninformative or accident prone to newbies has been summarily ignored, so that clearly is not a goal of high importance.* Sorry for not giving you a reply on that, I can't unfortunately follow and reply in time to all the messages in the chat channels. Having clear error messages \*is* of high importance, it is just a task we cannot handle right now. I would like to make a global improvement of all error messages during the same time window, ideally, after we finish with the big remaining core tasks, like I/O and GC. The bugtracker is the best place to collect all the feedback for that, so I suggest we open a general ticket for all error messages and just keep adding entries there (or gather all info in a wiki page and link it from a ticket, so we don't forget about it).

[11:05](#msg5683ba904f069158055c546c)@Skrylar \*As for storing symbolic information here, you'd store that information in the tokens.* I would like to see how Lisp implementation deal with that, in Red, the tokens internal storage space (128-bit) is already filled. Expanding those slot size will directly impact memory usage and overall performances.

[11:09](#msg5683bb753acb611716003b9b)@Skrylar (Re: #line) Red/System compiler is using the same approach as GCC, injecting markers (#L and #script directives) to track back line numbers and source file name. This works, but it's rather ugly and memory-expensive, I was hoping to find a better way to solve that.

Skrylar

[13:22](#msg5683da8f3c689402692555b4)@dockimbel Debug symbols are always ugly and expensive.

[13:23](#msg5683dad64f069158055c57cf)I'm not aware of any language or mechanism to store debug information without actually storing it somewhere, whether that's in the tokens themselves or in an external table that can be referenced given a particular token.

[13:44](#msg5683dfd53acb611716003f6a)Lisps don't generally know where their code came from; as far as the lisp machine is concerned, typing at the TTY and importing a file are identical. The debuggers just give you the code as it is stored in the Lisp image. I spot checked Franz' AllegroCL and this appears to be the case there as well; you'd have to either store the source data in the parse tree somewhere, or have a symbol table which is referenced in some way, but I don't see a way to have debug information without actually associating it with the AST or tokens.

[13:45](#msg5683dffd3c68940269255671)Although given the space symbols often take, it's not a surprise there are debug and release build types :\\

nickantonaccio

[14:23](#msg5683e8fb3c689402692557af)I've been intrigued by the lisp discussions, and just wanted to add my own perspective to the conversation. One thing that always struck me about Rebol was more than just the "language design". There's so much more which makes it productive. To me, it's about the pragmatic features - everything, absolutely everything, is designed to work together in ways which are easily composable. GUI, network protocols, drawing, IO, string manipulation, etc. all work with the same series functions. The huge variety of built -in natural data types, absolute bare syntax (complete removal of all unnecessary crud), tiniest possible distributable binary size (which runs immediately, everywhere, with basically no 3rd party infrastructure installation/upgrade requirements), built in help, and of course 'parse, along with the whole focus on super-productive dialects, as well as other "basic" language design features - all those things are built into the fundamental design of Rebol. The fabric of Rebol, from the ground up, is made to handle every purpose and activity which computing devices can be involved in: information management, communication, hardware control, entertainment capabilities, etc. To me, every other development environment in existence has taken the approach that re-inventing the wheel is wrong, and they ALL implement yet another way to plaster over the whole mess of underlying complexity - instead of \*removing* layers of bloat from the beginning. That's what everyone seems to miss. It's not just about language design (which seems to be the only thing which developers seem to care about when looking at Rebol). It's about the ENTIRE ecosystem, tooling, and everything else, from the ground up, which adds complexity at every level. The whole goal of Rebol and Red is to eliminate every layer of traditional development infrastructure and tooling, as well as language implementation and other features (size, dependencies, availability and consistent implementation across every possible OS and platform, etc.), which lead to complexity. It's all those things together, not just the language implementation, which give Red the potential to be uniquely successful.

[14:29](#msg5683ea3c4f069158055c59ad)There's no one language feature which can implement such powerful reduction of complexity. It's the way that basic features of computing capability are built into the fabric of Rebol, and can interact and be composed together, at every level. The original language design and implementation was handled well. The marketing, support, and implementation on new platforms was not.

[14:31](#msg5683ead60171d1791d02aed1)With Red, those problems will be eliminated - I personally don't think much needs to change about the language design - maybe 10%, and Doc seems to have plans for perfecting those things. It's the move to new platforms which really excites me. I think that's all which is really required to make this whole project a success (when \*all* features are implemented on mobile, web, etc.).

pekr

[15:19](#msg5683f5f735e1a316162eb22f)Amen :-)

JacobGood1

[15:44](#msg5683fbdd4f069158055c5bf9)Doc has programmed in rebol for what, 15 years? I would think that he is qualified, at this point, to derive what should be improved. I know that there are quite a few people here who love rebol but I have 0 emotional affinity for it or any other language. Heck, concurrency features will be a huge change that needs to happen, that will take a 10% change to the language alone. I think that some of you need to warm up to an even better rebol(which is what red is in the first place, much more than a 10%). The main thing I do not like about rebol is the cost associated with dialecting... if it could be eliminated with macros where is the decry?

Check out renc for example, improvements can and should be made...

pekr

[17:20](#msg56841270653b30761d76a771)Well, ppl are talking costs/speed concerns for ages, whereas nowadays our cell phones are more performant than mainframes xy years ago. The speed concerns are often pretty much exagerrated. Most of the time, the app is either fast enough, or not, as per the user interaction, and for tonnes of applications, Rebol is fast enough and Red's going to be even faster, well, possibly. I am for any possible improvement, as far as it does not de-rebolize language. I know what Rebol values are, and can't precisely even describe it, it is just about the feeling.

[17:23](#msg568412fc4f069158055c5f8f)I also remember the test 10 years ago, when I parsed some file, and went against similar implementation with sequential reading aproach using CA-Visual Objects, which compiled to native code. I expected Rebol being an order of magnitude slower. In fact, the script was faster and guys in the office tweaked the tests and could not believe it.

[17:23](#msg5684131a0199d70069e04234)That's also why I would not care about some theoretical cost of dialecting, unless someone proves me wrong by some examples.

JacobGood1

[17:35](#msg568415fb0171d1791d02b571)there is nothing theoretical about 1 + 1 being faster than func \[] \[1 + 1]

[17:37](#msg568416483c68940269255ee7)macros would not derebolize rebol they would only make it more rebolized, assuming rebolization is max power dialecting

[17:40](#msg5684172a0199d70069e042ca)Also if we are going to argue everything is faster who cares about speed, we could say the same thing about size; everything is larger(has more memory) who cares about space, since it seems to be a rebol obsession.

pekr

[17:46](#msg5684185d0199d70069e042ef)It's different. What I meant is, that if the app is an user app, and it behaves in a real-time nature, any other speed gain is just not necessary. Of course, for apps as server, number crunching, it might differ. Well, I might be wrong even with the user space apps, as the world progresses and e.g. working with video (or images), is going to be developed further (demand for the 4K video, increasing image sizes, etc.)

JacobGood1

[17:50](#msg56841952653b30761d76a883)@pekr I must admit that I intend on making games with red. Now you know that I am biased towards speed =)

ghost~5585eedf15522ed4b3e236ae

[18:03](#msg56841c7c4f069158055c60ec)High speed must be our last concern because prematured optimization kill good software design. Often good speed is associated with good design.

[18:04](#msg56841cb04f069158055c60f0)@pekr &gt; I also remember the test 10 years ago, when I parsed some file, and went against similar implementation with sequential reading aproach using CA-Visual Objects, which compiled to native code. I expected Rebol being an order of magnitude slower. In fact, the script was faster and guys in the office tweaked the tests and could not believe it.

JacobGood1

[18:10](#msg56841e133acb6117160047ea)@lkppo I have never heard that before(sarcasm)... just like everything else it depends on the language and on the circumstances. We do "premature" optimizations all the time just by picking the right data structures in our code. Some languages allow for the early optimizations to be nice and abstract to the point where they are not inflexible/composable. I really wonder why we do not question memes that are repeated over and over from people who are mostly experienced in lower level languages.

ghost~5585eedf15522ed4b3e236ae

[18:11](#msg56841e390171d1791d02b6d7)Niklaus Wirth has also repeatedly shown that good solutions are often opposed to good theoretical ideas. IT is a craftsman as well as marquetry or goldsmith. It will become good if it is treated as such and not as a hard science like mathematics.

JacobGood1

[18:11](#msg56841e560171d1791d02b6dc)I could say that everyone here is using premature optimizations since they are using a mutable languages...

[18:12](#msg56841e823c68940269256034)Macros are not theoretical and have been battle tested by the lisp community for decades

ghost~5585eedf15522ed4b3e236ae

[18:24](#msg568421420171d1791d02b769)They talk about "premature" because it is true that it is easy to fall into this trap. I do database development for business applications, nothing very efficient. And it remains easy to entrap yourself.

JacobGood1

[18:31](#msg568423103c6894026925611c)What language? Remember the ease of entrapment increases the closer you are to Java(or other languages of similar abstraction capability, I picked Java for the lulz). We can only speak from the experiences we have with other languages; it limits our ability to understand that what might be premature in one language, is not premature in another. I am sure you would agree that it is far easier to make premature optimizations in assembly than it is in python. Basically, the definition of a premature optimization changes by the limit of abstraction a language allows one to obtain. This is one of the many reasons I advocate for increased abstraction powers to come to the land of rebol.

ghost~5585eedf15522ed4b3e236ae

[18:36](#msg5684243b653b30761d76aa71)You believe that macros are Nirvana programmer. You are there to ask us to put them in Red. Ok, I accept your word that this is very good, but I agree with perk it should not subvert the spirit of Rebol / Red because it brings everything it lacks Lisp / Scheme and other functional languages. What I want you to understand: since you are very good programmer, learn Rebol / Red, then you can propose how to best integrate macros.

For now you say it's great add theme, but there are already a lot of work elsewhere.

JacobGood1

[18:43](#msg568425d00199d70069e0451b)I do not believe that macros alone are heaven but macros with red... could be quite close to paradise =). It will take a while for a proposal to manifest, in the mean time, I will try to preach the gospel =P

tanstaaf1

[23:06](#msg568463804f069158055c6bb5)@lkppo @JacobGood1 @dockimbel I would like everyone to think about something: I believe there is an unparalleled opportunity with Red because (1) Rebol was already an incredibly evolved+expressive+innovative language so we have certainty/momentum and yet (2) Rebol got such minimal adoption/exposure that there is basically NO legacy code nor community to be lost in making massive changes...so we have really NO risk in swinging for a home run. (There are, of course, other reasons we have an unparalleled opportunity I am leaving out but one deserves to be acknowledged again: We have Nenad).

JacobGood1

[23:07](#msg568463cf4f069158055c6bc3)sounds good to me

tanstaaf1

[23:08](#msg568463de0199d70069e04e5d)I can't think of ANY comparable opportunity in the history of programming: an excellent and certain foundation PLUS the freedom to change anything without consequence. There is going to be that gap once 1.0 comes out but 2.0 isn't really yet begun. You want an opportunity to change the world? This is it. Don't be timid!!!!!

ghost~5585eedf15522ed4b3e236ae

[23:18](#msg5684665635e1a316162ec265)@JacobGood1 : I have NO choise of my tools at work : SQL Server, HTML, CSS, VBScript 5.8, (100 line of PHP) during 5 years / SQL Server, WinDev since september. I use Debian at home since 10 years and try a lot of languages for my personnal knowledge.

PeterWAWood

[23:34](#msg56846a1f0199d70069e04f21)@tanstaaf1 What evidence do you have to say "there is basically NO legacy code" ?

[23:39](#msg56846b4f4f069158055c6cc3)Or more to the point, before making such a statement what did you do to find out what use is being made of Rebol?

## Thursday 31st December, 2015

tanstaaf1

[00:00](#msg5684702b4f069158055c6d54)@PeterWAWood Everything is relative and if you are one of those few who's got multi-thousands of hours already invested in, say, Red2 code it might sound outrageous and inflammatory for me to say what I said. Please don't take offense. But vs other languages the existent LOC base OVER ALL is effectively zero. That is just a reality which ought to be acknowledged. Nobody is advocating gratuitously changing legacy Rebol. But it really would be short sided to hobble what COULD BE for what already is, in this case. Your existent experience with R2/R3 will be extremely valuable. That value will be magnified - not diminished - by changes which genuinely made Red2 more powerful, more updated to modern needs, and more attractive to the best and brightest minds in the world.

ghost~5585eedf15522ed4b3e236ae

[00:05](#msg568471660199d70069e04fde)@JacobGood1 : I call "premature optimization" the fact of wanting to write an optimal solution before observing the program running in its environment. We are often trapped by our received ideas.

[00:07](#msg568471ba3c68940269256c05)@JacobGood1 : I am already convinced that macros and functional languages are good. I read the website of Paul Graham 8 years ago (roughly) and bought books on Haskell for 7 years. I find Haskell difficult and I do not have all the time I want. For other functional languages, I think they are not going anywhere. That I even tried to learn Lisp, but until I either unemployed last year I did not have a personal development project to motivate me to create a consistent application.

I started "a documentation preparation system" in Perl, and Ruby for my personal use. When I finish, I would rewrite it in Red.

JacobGood1

[00:12](#msg568472d39606b15a055e3cec)@lkppo I am not trying to convince anyone for functional languages, I will let someone else do that. My advocacy is for macros and other useful CL features, be it functional, oop, logic, or whatever.

tanstaaf1

[00:18](#msg568474394f069158055c6dd4)@JacobGood1 @lkppo "Convincing ANYONE for functional languages" isn't worth the effort in the scope of Red1 rollout. But convincing @dockimbel, and giving him some help in figuring out how to enhance Red2's functional chops without putting in an overwhelming amount of time would be very worthwhile...presuming, of course, you see the value in functional being strengthened.

[00:23](#msg56847566653b30761d76b614)I have very little experience with functional but I've been reading a lot and thinking ... and I am convinced of both the importance of the paradigm and the challenge of using it effectively. Do you think it's possible to have Red2 include the choice of functional support...which is, I am guessing, what Ocaml and Scala, etc. are doing? What would be the cost of that? How could it be approached?

ghost~5585eedf15522ed4b3e236ae

[00:28](#msg5684769c4f069158055c6e12)@tanstaaf1 Same question to JacobGood1. I am not an expert of FP as him.

tanstaaf1

[00:53](#msg56847c944f069158055c6eb6)@lkppo Fair enough. Does anyone have Scala or OCaml or other mixed language experience sufficient to give some idea how functional vs non-functional manages to coexist? Right now I'm wishing I'd actually taken that Scala class https://www.coursera.org/course/progfun Functional Programming Principles in Scala by Martin Odersky.

[00:54](#msg56847cd4653b30761d76b6bc)Happy news One can still browse the video lectures at least! Hmmm.

JacobGood1

[01:02](#msg56847ec00171d1791d02c47f)@tanstaaf1  
"Do you think it's possible to have Red2 include the choice of functional support"  
if the base abstractions of the language are strong enough we can include any paradigm through libraries.

[01:10](#msg568480963acb61171600554d)obviously, the more powerful the language the more trust the creator of the language has in its programmers. I do not like restraining programmers for any reason what so ever, let the programmer decide the restraints for themselves.

nickantonaccio

[01:30](#msg5684851d0171d1791d02c517)One thing mentioned earlier was that if certain Lisp features were added, we might attract a huge crowd of serious Lisp pros. If that's really the case, it would be a huge win for Red.

Travis-OBrien

[01:31](#msg568485794f069158055c6f84)do you need to download the gitter app to be notified when someone posts?

nickantonaccio

[01:34](#msg568486229606b15a055e3e9c)Jacob, I second the notion that you might consider learning Rebol or Red and demonstrate how the macro features you want might be integrated into some real examples. This could help win over more of the existing community (most importantly Doc), as well as provide some insight to experienced Lispers about the benefits of Red.

JacobGood1

[01:35](#msg56848660653b30761d76b792)I have already given good examples, in the rebol and red channel on stack overflow... that was quite a while ago

[01:35](#msg5684866a653b30761d76b796)well, they were good to me =)

nickantonaccio

[01:36](#msg5684868d653b30761d76b797)Could you post the links here please?

[01:37](#msg568486d79606b15a055e3ea9)@Blyd I use Chrome, and allowed notifications (they work when this page is open in the browser)

Travis-OBrien

[01:37](#msg568486ee0199d70069e051be)@nickantonaccio yea I got it working, thanks though! :)

JacobGood1

[01:49](#msg568489b2653b30761d76b7c4)ask for clarification

http://chat.stackoverflow.com/transcript/291/2015/7/7

eMBee

[03:42](#msg5684a4230171d1791d02c7df)what defines functional programming? so far i found: everything is an expression. no sideeffects. no temporary variables to keep state

JacobGood1

[03:43](#msg5684a46135e1a316162ec7ff)depends on the group that defines it, much like oop there are many definitions

Travis-OBrien

[03:43](#msg5684a4643acb611716005821)functional programming doesn't necessarily mean immutable state

eMBee

[03:44](#msg5684a4803c68940269257041)it does aparently to some...

[03:44](#msg5684a48f3c68940269257045)closures

Travis-OBrien

[03:44](#msg5684a49f4f069158055c71cf)functions

eMBee

[03:44](#msg5684a4a40199d70069e05451)heh

JacobGood1

[03:44](#msg5684a4ab4f069158055c71d1)immutable?

eMBee

[03:44](#msg5684a4ad4f069158055c71d4)functions as first class objects

[03:44](#msg5684a4b94f069158055c71d7)anonymous functions

JacobGood1

[03:45](#msg5684a4c09606b15a055e40e4)referential transparency

Travis-OBrien

[03:45](#msg5684a4c40171d1791d02c7e8)^

eMBee

[03:45](#msg5684a4d40199d70069e05456)can you explain that term please?

JacobGood1

[03:45](#msg5684a4d50171d1791d02c7e9)guess we are just having fun here...

[03:45](#msg5684a4f69606b15a055e40e8)https://en.wikipedia.org/wiki/Referential\_transparency

[03:46](#msg5684a51c3acb611716005831)in other words a function will return the same result if the same input is given at all times

eMBee

[03:47](#msg5684a55c9606b15a055e40ee)ah, yes

[03:48](#msg5684a5810171d1791d02c7f3)i think that's part of the no sideeffects

JacobGood1

[03:48](#msg5684a59735e1a316162ec80f)yep, but it sounds so much fancier

eMBee

[03:48](#msg5684a59e0199d70069e05467):-)

[03:50](#msg5684a5f80199d70069e05474)the thin is, in all these things we have listed, i see nothing that could not be implemented in an imperative language

[03:50](#msg5684a5fa35e1a316162ec81c)thing

JacobGood1

[03:50](#msg5684a61f3c68940269257072)every functional language I know is implemented in an imperative langauge

Travis-OBrien

[03:50](#msg5684a6223acb611716005849)really comes down to ease of use

eMBee

[03:50](#msg5684a6233acb61171600584a)unless you define "no sideeffects" as, nothing ever in the language has side-effects

[03:51](#msg5684a6563c6894026925707c)i don't mean the implementation but mixing paradigms

[03:54](#msg5684a6d835e1a316162ec834)there are things that help, like immutable data-structures, but again, a language could provide both

[03:55](#msg5684a7313c6894026925708c)"everything is an expression" is significant. any language where that is not true is limiting the function-ality ;-)

[03:59](#msg5684a8379606b15a055e4139)but "everything is an expression" can be found in languages that are not really considered functional, like smalltalk or coffeescript

ghost~5680c5f416b6c7089cc058a5

[04:04](#msg5684a9529606b15a055e415b)Well, i don't know anything about lisp, but here is what Rust provides to debug macros -

[04:04](#msg5684a9593acb61171600588e)https://doc.rust-lang.org/book/macros.html#debugging-macro-code

[04:04](#msg5684a95e9606b15a055e415d)http://stackoverflow.com/questions/30200374/how-do-i-debug-macros

JacobGood1

[04:05](#msg5684a99c4f069158055c7258)Please do not post the inferior versions of macros in this channel, they doth not abide in the light of lisp!

ghost~5680c5f416b6c7089cc058a5

[04:05](#msg5684a9a69606b15a055e416a)lol

Travis-OBrien

[04:06](#msg5684a9b30171d1791d02c876)saaaaaaame

nickantonaccio

[12:16](#msg56851c8f4f069158055c7b3f)@JacobGood1 There was a response to your example on chat.stackoverflow, which it appears you may not have seen. The download link given there is no longer valid, so I uploaded a copy of the file which contains expand-macros.r to http://re-bol.com/power\_mezz.zip . I'd still like to see some more non-trivial examples of what you want to accomplish, in some real application code (or proposed code patterns which you'd like to see implemented, in real (proposed) use).

[14:04](#msg568535fd3acb611716006341)I hope it's clear that my intent here is to support your claim about the benefit macros in Red, if that benefit can be clearly defined and demonstrated. The best way that I can imagine that benefit being displayed is with a practical use case.

[14:05](#msg5685361935e1a316162ed310)I'm already sold on the idea of attracting Lisp developers :)

JacobGood1

[16:18](#msg5685555c35e1a316162ed694)"Real world, clearly defined, demonstrated"...

I hear, "I do not understand the benefit yet, please give more examples".

I, intentionally, have given small examples as to make the inclusion of macros a digestible proposition. Giving more elaborate examples of macro use(what you would call real world) will only further incur cognitive debt; I see no reason to inflict such mental punishment when, as it appears to me, the idea of macros has not been fully understood by the rebol community as a whole. I could post much more elaborate macros that are coded in lisp but if you have not understood the small examples I am certain that the “real world” ones will just further muddy the waters.

I have programmed a few thousand lines of rebol code, not enough to be an expert by any means but enough to know that macros would be nice.

Lastly, I did see that code and it was inferior to what could be achieved.

Conrad Barski suggests that we should rename macros to SPELs(http://www.lisperati.com/no\_macros.html), I agree; it would be nice if people stopped thinking of them as mere code expanders or templates.

As said by Dr. Christian Schafmeister, "C++ templates are to common lisp macros, what IRS tax forms are to poetry."

[16:25](#msg5685570435e1a316162ed6d6)Here is the key idea, dialects without the cost, if you can understand how macros offer this then you can understand why macros would be a great addition to the rebol legacy

nickantonaccio

[18:01](#msg56856d973acb611716006acb)@JacobGood1 I'm here to help your perspective gain some traction. If you don't want to do the work of implementing macros yourself (which would be your most convincing and valuable possible input) perhaps some of us might be willing to help. (but speaking down to an entire community with hundreds of years of collective experience probably won't help your cause)

[18:11](#msg56856fef35e1a316162eda86)You've spent thousands of words here, and posted only a few lines of trivial code examples. Effectively, saying "I'd show you more, but you wouldn't get it" doesn't do much to engage a willing community.

[18:22](#msg5685726235e1a316162edad1)If you don't have any technical input as to how a macro system might be implemented in Red, and you don't feel like it's worth while to present more complex examples, could you at least provide an example of what you imagine potential macro code might look like in Red?

eMBee

[18:37](#msg568576020199d70069e06868)i'd like to see that too

onetom

[18:41](#msg568576c23acb611716006bd7)@JacobGood1 can u recommend some material on what are "true lisp macros" vs "inferior versions of macros", pls?  
Im getting more and more confused, because all I know about macros is the M4 macro language, the C preprocessor and lately a little bit of Clojure macros.

I thought in Rebol COMPOSE/DEEP and PARSE cover the functionality what macros are providing in other languages.

eMBee

[18:50](#msg568578e09606b15a055e5548)i think a simple summary could be that in lisp macros you have the full language of lisp available to write your macro. so you can use lisp to manipulate lisp code.

onetom

[18:51](#msg56857929653b30761d76ce9e)and in rebol u cant do that?

eMBee

[18:51](#msg56857946653b30761d76cea1)compare that to the C prerpocessor where you are much much much more limited in what you can do. both in regards to the language available to you and in regards to the access of the original code. it's limited string manipulation effectively with a bit of argument handling

onetom

[18:52](#msg5685795335e1a316162edb70)that's clear

eMBee

[18:52](#msg568579763acb611716006c22)i don't know what you can do in rebol. i'd actually kike to learn about how parse works before i form my own opinion on how much lisp style macros would improve things

[18:53](#msg5685799b9606b15a055e555f)kike: like

onetom

[18:53](#msg568579ad4f069158055c86b2)u can just press the up arrow to fix ur msg

eMBee

[18:54](#msg568579d535e1a316162edb80)i am using an irc client, so it would not be marked as edit

onetom

[18:55](#msg56857a1f0171d1791d02dc17)how about s/kike/like/ ?

nickantonaccio

[18:56](#msg56857a500199d70069e068d0)@JacobGood1 "the key idea, dialects without the cost" Have you seen this sort of Rebol dialect example yet? http://rebol2.blogspot.com/2012/01/tui-dialect-dialect-to-print-ascii.html Perhaps comparing some dialect implementations in Rebol/Red and Lisp would be helpful.

eMBee

[19:08](#msg56857d189606b15a055e55a4)that's a nice intro to parse. just what i was looking for...'

[19:08](#msg56857d384f069158055c86fa)now based on that, it seems that parse and macros are actually quite close

[19:10](#msg56857d9b9606b15a055e55af)which would make it all the more important to see a real example of how this can be improved further

nickantonaccio

[19:18](#msg56857f763c689402692585ba)Here's another http://web.archive.org/web/20120510120959/http://www.rebolforces.com/zine/rzine-1-02.html#sect7.  
I'd love to be able to find some common ground and compare solutions using Lisptmacros and native Rebol/Red tools. Maybe that would be a way to communicate about this topic more effectively...

tanstaaf1

[19:33](#msg568583210199d70069e0698f)Good article imo to perhaps provide a common ground of understanding and tradeoffs https://en.wikipedia.org/wiki/Functional\_programming.

nickantonaccio

[19:34](#msg568583404f069158055c8788)I'm looking at this at the moment: http://www.defmacro.org/ramblings/lisp.html

tanstaaf1

[19:35](#msg568583754f069158055c878e)"...Type systems

Especially since the development of Hindley–Milner type inference in the 1970s, functional programming languages have tended to use typed lambda calculus, as opposed to the untyped lambda calculus used in Lisp and its variants (such as Scheme). The use of algebraic datatypes and pattern matching makes manipulation of complex data structures convenient and expressive; the presence of strong compile-time type checking makes programs more reliable, while type inference frees the programmer from the need to manually declare types to the compiler.

nickantonaccio

[19:35](#msg568583810171d1791d02dcf1)("concrete example") ;)

tanstaaf1

[19:36](#msg568583be653b30761d76cf81)"...Referential Transparency

Functional programs do not have assignment statements, that is, the value of a variable in a functional program never changes once defined. This eliminates any chances of side effects because any variable can be replaced with its actual value at any point of execution. So, functional programs are referentially transparent. \[43]" etc.

nickantonaccio

[19:37](#msg568583fc9606b15a055e562c)I understand referential transparency - thanks :)

tanstaaf1

[19:38](#msg568584250199d70069e069aa)Hey, @nickantonaccio ! Happy NY! Have you made a resolution to check out Haskell's ability to nail subtle bugs at compile time? :-)

[19:40](#msg5685849d9606b15a055e563f)Sorry I don't know enough yet to provide examples per se. Once 0.6 comes out I will try posting an invite on a Haskell board and see if we can get someone interested and competent enough to give some more solid info on FP and type systems, at least. Many in Haskell have come from the lisp world (often clojure) so they may be able to provide some of the macro specifics you want more of.

nickantonaccio

[19:49](#msg568586e43c68940269258663)@tanstaaf1 I think comparing Rebol/Red and Lisp solutions to a practical set of dialect creation tasks would be helpful in getting us all together on the same page. That way we can communicate and demonstrate the salient points about what we do know :)

[19:57](#msg568588943acb611716006d57)(and please notice from the links that I'm actually taking the time and effort to research more about your point of view)

[20:49](#msg568594e69606b15a055e57c0)I finished reading http://www.defmacro.org/ramblings/lisp.html , and I'm curious what the Lisp guys here think about that article. Is that author missing the point about macros, and in fact the power of Lisp, himself? Because from everything I see there, he's only managed to describe techniques and concepts which are much more easily handled using the most fundamental Rebol concepts - even the TUI example I posted earlier goes far beyond the capabilities he explains. What he's describing is more in line with what I did in http://www.rebol.org/view-script.r?script=gui-crud-app-builder.r&amp;sid=nkl722li or http://www.rebol.org/view-script.r?script=room-poll.r or even the way the GUI layout is created in this little game: http://www.rebol.org/view-script.r?script=match-game.r . And none of those examples even needed to use any of Rebol's 'parse or real dialecting abilities - they just make use of some simple metaprogramming techniques in line with what the author of the article above describes.

[20:54](#msg568596150199d70069e06b39)I'm really trying to understand what I'm missing here. Everything that I've read recently about Lisp macros seems to be contained in Rebol's ability to build, represent, pass around, evaluate (or not evaluate, according to need...), and otherwise manipulate blocks (series ('lists')) of Rebol code. ('parse just adds some serious manipulative power to those basic capabilities).

[20:57](#msg568596d33acb611716006e88)In fact, I think that's one of the things which was inspired by Lisp in Rebol's heritage (btw, I took Lisp courses in college back in 1990, and the list processing capabilities in Rebol were just one thing which I found familiar in Rebol).

Oldes

[20:59](#msg568597454d3dc5f707aecb46)I already asked for some real life lisp like macro example... still waiting like on the NY. Don

[21:01](#msg568597a24d3dc5f707aecb47)@tanstaaf1 when i see sentence like: _

[21:03](#msg568598102a06b81d5bf85f55)\_the value of a variable in a functional program never changes once defined_ I must ask how it could be called \_variable\_? Isn't \_constant_ better name for never changing value?

[21:04](#msg568598494d3dc5f707aecb4b)Sorry for typos.. i'm on mobile and cannot edit posted messages

[21:06](#msg568598d42a06b81d5bf85f59)I would personaly want to first see funcion inlining instead of some artificial code preprocessing.

Skrylar

[21:26](#msg56859d744f069158055c89ad)Caught up with the chat now. http://norvig.com/spell-correct.html might be fun if someone ends up feeling bored and wants to write demo code.

nickantonaccio

[21:41](#msg5685a11f9606b15a055e58a0)@Skrylar There has been some discussion about http://norvig.com/spell-correct.html already. (I posted a reduction of Ladislav's code earlier to get things started...)

tanstaaf1

[21:42](#msg5685a130653b30761d76d1c8)@Oldes I am NO

Skrylar

[21:52](#msg5685a3879606b15a055e58ce)I see a lot of talk about macros. I'd need to know what the primary resistance motives are here to give a better explanation.

I’d say instead of appealing to pure speed, one should appeal to minimizing \*unnecessary* overhead. As Parse allows you to reduce the complexity of code being written by the programmer, macros–as a logical next step from Parse–allow you to reduce complexity of the program using a particular Parse dialect. If we were to produce a dialect which facilitated loading binary data, this could be considered analogous to what flex, bison, protobuf et all do. Only one does not ship those tools along to their users–they are simply unnecessary and irrelevant to the customer’s concerns. Without macros, the Parse dialect which handles binary reading must be carried along with the program for example. Additionally, the specification which makes use of that dialect must also be kept. This is executed exactly once, when the program is preparing the reader, and otherwise would not have been included in the distributable. With a macro system in place, this would be executed when the application was being compiled/encapsulated, which means the surrounding support code would be shed–just as we shed the interim tools used to produce binaries we ship to customers.

Now, as for the API concerns: There are two explored spaces here, the more well-known Lisp method and the less-known way that Terra works. Lisp macros work through running a function in the existing interpreter, which returns a list, which is then effectively passed to \*eval\*. This is kind of the same thing as running `reduce` on the output of `parse.` In Lisp’s case, once that evaluation is done the form is now part of the binary image (so if the same binary parser was produced by macro, the macro and formal specifications would no longer be \*necessary* to the product.)

Terra is a bit different in this regard, but equally interesting. It has two dialects, Lua and Terra, where Terra represents a Lua-like language that has a component which is directly compiled to LLVM IR. You are presented with the option of shipping a program with the “full” Terra suite, which is its own binary of Luajit+Clang rolled in a DLL. Another option, perhaps one more directly Red-like, is the option to create a “module” using Lua. You use Terra keywords and code to create the actual puzzle pieces, and Lua to piece them together (set tuning values, compose different Terra blocks to finished functions, run genetic optimization or auto-tuning, the like.) Then those final parts are “linked” and “exported” as an object file which does not need the original Terra ecosystem attached.

This second approach requires less magic; it is akin to assembling a Red script or Red/System blob in an object, then simply calling the compiler and asking it to JIT compile (or AOT compile, as it may be) that blob you created. Only then you have the option to export that blob to something that may be linked or imported by other code. There is a minimum of magic in this implementation, as you are effectively producing your macro code through a script and invoking the compiler as a service. It would add build steps to a project to pre-compile these blobs, but it does keep the overhead low. A secondary situation (and not disjoint) would be to allow a Red script to be pickled as-is, a situation where what would have been macro calls is simply regular calls to set variables and calls to reduce–basically what we have now, withotu macros–but an option to say “now take all of the contexts and values as they are presently defined, melt that as-is, and simply import those values instead of re-executing everything from source.” That would also have a minimum of magic.

[21:52](#msg5685a3b535e1a316162edee8)I hope adding these two alternatives to the “Lisp way” help the discussion. I think both would be workable alternatives and are likely less difficult to implement. The key concept here is that we can eliminate using external transformers (like flex, bison, protobuf, ...) while retaining their benefits, and also not having to “re-parse” a dialect on how to parse binary data every time the program is instantiated. I’d be happy to expand on this example if needed.

tanstaaf1

[22:10](#msg5685a7e2653b30761d76d254)@Oldes Dang it! gitter ate my response! :-( I had written a few paragraphs but let me just pass you this: http://stackoverflow.com/questions/15653738/whats-immutable-variable-means-in-functional-programming. I think that is just part of the answer. The rest, I think, is that haskell does a huge amount of connecting functions together without needing intermediate variables...and a  
variable defined as a function naturally shouldn't ordinarily change. Haskell really needs to be seen to be believed. And i am NOT a haskell programmers...only a newbie who has already seen enough to be amazed.

[22:16](#msg5685a926653b30761d76d283)Why might we be interested in Haskell? Well...Rebol is probably even more concise in most run of the mill applications, at least. BUT Haskell takes a HUGE bite out of debugging time....it is really, really hard to create a bug in haskell; the compiler is so smart it catches all manner of things Rebol (and Red currently, at least) never would. It is said that once your code compiles in Haskell it will probably do pretty much what you expected it to do. And just think of the amount of time wasted in debugging difficult things, much less maintaining legacy code, and you begin to understand the allure. Haskell IS a Lisp, I have been told...but even harder to compare to normal Lisps than is Rebol.

maximvl

[22:53](#msg5685b1fa0171d1791d02e0cc)type system can only predict type errors at compile time

[22:54](#msg5685b2283c68940269258a08)this covers a lot of errors, of course, but not all, so I personally prefer universal flexible runtime debugger

[22:55](#msg5685b2609606b15a055e5a0e)which I had seen only in CL and Smalltalk so far
