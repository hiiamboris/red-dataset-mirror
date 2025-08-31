# Archived messages from: [gitter.im/red/red/lisp](/gitter.im/red/red/lisp/) from year: 2016

## Friday 1st January, 2016

nickantonaccio

[00:02](#msg5685c2154f069158055c8ca5)@Skrylar "I’d be happy to expand on this example if needed." - Yes, I would love for someone, anyone to post some actual code examples which approach something like what would be used in production code. Even if it's hard to grock and complex, I'd like to look at it. Something like a tutorial about an actual working application with these topics demonstrated, would be fantastic - that must exist somewhere, in a book, on some web site, in some open source project that someone here could point us too?

tanstaaf1

[00:53](#msg5685ce053acb61171600727b)Well..here's a significant Haskell program to chew on: https://en.wikibooks.org/wiki/Write\_Yourself\_a\_Scheme\_in\_48\_Hours Haskell doesn't have macros because, supposedly, haskell's type system + lazy evaluation eliminate the need most all the time . https://www.reddit.com/r/haskell/comments/1929xn/are\_lispstyle\_macros\_a\_code\_smell/ However, I don't think Red is going to get lazy eval and I'm not even suggesting that.

nickantonaccio

[00:53](#msg5685ce113acb61171600727e)I'm looking at this book: https://pragprog.com/book/cjclojure/mastering-clojure-macros , and even perhaps this book (not about Lisp, but Elixir's macros ): https://pragprog.com/book/cmelixir/metaprogramming-elixir

[01:01](#msg5685cfcd3acb611716007298)@tanstaaf1 Thanks, perhaps when Doc gets some time, he'll write "Write yourself a Rebol in 48 hours" :)

[01:04](#msg5685d09a35e1a316162ee273)Not nearly as modern, but here's a Rebol example in the same domain: http://www.fys.ku.dk/~niclasen/rebol/bbcbasic.r

[01:14](#msg5685d30735e1a316162ee290)http://www.fys.ku.dk/~niclasen/rebol/bbcbasic.html

Skrylar

[01:32](#msg5685d7233acb611716007310)@nickantonaccio http://www.gigamonkeys.com/book/loop-for-black-belts.html `(loop)` is probably the most ubiquitous macro, used in "real" applications, if you're just wanting raw code.

[01:33](#msg5685d7564f069158055c8e00)At least as far as usage goes.

tanstaaf1

[01:34](#msg5685d7be653b30761d76d5ef)That's very impressive, Nick..and a great learning resource! I like it when things come together quickly (he wrote the whole thing in 1 month!), are large enough to be robust and small enough to be comprehensible, and have functionality which can be understood.

nickantonaccio

[01:56](#msg5685dcbf0171d1791d02e402)@Skrylar thank you - I will look

[01:57](#msg5685dcee3c68940269258d33)@tanstaaf1 He also created an implementation of the Rebol language, called "World" unfortunately, it's a closed source project.

[02:06](#msg5685df303c68940269258d45)Is this the source? https://github.com/sbcl/sbcl/blob/master/src/code/loop.lisp

Skrylar

[02:26](#msg5685e3bb0171d1791d02e439)@nickantonaccio Seems to be one of the implementations. Might be a bit spooky in there, though.

JacobGood1

[04:03](#msg5685fa843acb611716007477)Maybe you have not been following the other thread well but I have posted numerous links that show the power of macros.. in any case if you want to do a deep dive here you go: http://letoverlambda.com/

[04:04](#msg5685fae53acb611716007484)The thread macro is an excellent example, lets start there.

[04:07](#msg5685fb7435e1a316162ee45c)parse is a parser, I am sure everyone knows this. Parse with macros would be excellent, parse does not replace what a macro does. A macro can transform code and when it is done... there is \*\*no code left that does the parsing, only code that is the result of the parse\**

[04:09](#msg5685fbeb3acb61171600749a)The problem with posting things like the loop macro and let over lambda is that I doubt anyone here is willing to take the time to digest these massive walls of text, that is why I would rather hear your arguements about the thread macro

onetom

[04:09](#msg5685fbee0171d1791d02e546)@JacobGood1 since you can execute anything during PARSE, it's not just a "parser", as I understand it

JacobGood1

[04:09](#msg5685fc073c68940269258ea3)@onetom noted, however, many parsers can do the same thing

[04:10](#msg5685fc3335e1a316162ee471)I am not trying to say parse is crap, not in the slightest, I think parse is awesome. I am trying to say parse does not replace macros.

[04:10](#msg5685fc3e9606b15a055e5e70)Rather parse would be a great complement to macros.

onetom

[04:11](#msg5685fc6d9606b15a055e5e74)with code examples, it would be clearer, because statements like "parse is a parser" suggests u have a different mental model of things.

JacobGood1

[04:12](#msg5685fc9d35e1a316162ee47c)I have already used parse to implemet destructuring in functions and a weaker version fo the thread macro, I understand what parse offers

onetom

[04:12](#msg5685fc9e3acb6117160074a1)what u bolded though makes more sense

JacobGood1

[04:12](#msg5685fcb00199d70069e071d4)what I bolded I have said 10k times already

onetom

[04:14](#msg5685fd364f069158055c8fb7)great, but i was not here during the past year or so

JacobGood1

[04:15](#msg5685fd66653b30761d76d78b)ah... ok sorry about that then

onetom

[04:16](#msg5685fd899606b15a055e5e8a)can u share this destructuring code pls?

JacobGood1

[04:16](#msg5685fdac3c68940269258ebe)maybe, if I can find it, it was when I first started using red...

[04:19](#msg5685fe3e35e1a316162ee495)found it...  
https://gist.github.com/JacobGood1/9f65bf0ca242eb3ffa44

onetom

[04:19](#msg5685fe413c68940269258ecf)Q: Why Rebol didn't have macros?  
A: It was not a compiled language.  
Is this a correct?

[04:24](#msg5685ff603acb6117160074c0)thx for the destructuring!  
im trying to understand it; do u have an example invocation of defn?

i see it handles rest arguments, the rest of the code doesn't lend itself to easy understanding

JacobGood1

[04:24](#msg5685ff973acb6117160074c2)maybe, I think I would have to reload and play with it again... it has been a while lol

[04:25](#msg5685ffbb9606b15a055e5ead)I wrote it as an exercise in learning the langauge so it has no indenting, no comments, and it is probably crappy rebol style

onetom

[04:25](#msg5685ffc74f069158055c8fe3)ok, nvm, im just curious. the destructuring from clojure is something i really like

[04:26](#msg5685ffe23c68940269258eef)sure, i understand that; don't have to be so defensive! :)

JacobGood1

[04:26](#msg5685ffec0171d1791d02e58a)I even named it after clojures function defn

[04:29](#msg568600949606b15a055e5ebc)hmm, it also seems that it was written according to hostile forks ren garden changes

onetom

[04:29](#msg568600b60199d70069e0720b)so assuming my previous understanding is correct:  
Q: What's missing from Red for macro support?  
A: Some "syntax" which triggers \*\*running\** Red code while the \*same Red code* is being \*\*compiled\*\*.

JacobGood1

[04:32](#msg568601700171d1791d02e5a2)here is how it is sposed to work, but you need ren garden running(unless I fix it)...

```
hi: defn [[x]] [x + 1]

hi [1] => 2
```

onetom

[04:34](#msg568601c20199d70069e07214)but wait rest arguments are not possible :/ what does the &amp; do in your code then?

[04:34](#msg568601dc3acb6117160074e0)thats for collecting elements within a block param?

JacobGood1

[04:34](#msg568601e40171d1791d02e5a3)nothing, I wanted to implement a lot more of those things but I left it and moved on... sorry

[04:36](#msg568602620171d1791d02e5aa)at the time I only destructured blocks...

```
hi: defn [[[[a] b]] c] [ a + b + c]
hi [[[1] 1]] 3 => 5
```

onetom

[04:37](#msg568602970171d1791d02e5ab)i guess destructuring is less important in red, since it has direct, concise syntax for navigating datastructures, which is implemented with funky function calls in clojure

[04:38](#msg568602c935e1a316162ee4d7)but thats off topic.  
what would u say about my two Q&amp;As?

JacobGood1

[04:38](#msg568602d535e1a316162ee4d8)and it would not be hard to implement full destructuring with good ol parse

[04:39](#msg568602e50199d70069e07220)I am not sure yet, I have been reading them and trying to think about a response

[04:39](#msg5686030f0171d1791d02e5af)I will have to get back to them though, getting close to midnight here

[04:39](#msg5686031e0171d1791d02e5b2)just dont let me forget =)

onetom

[04:40](#msg5686032c653b30761d76d7d3)No obligations!

[04:40](#msg568603380171d1791d02e5b5)Happy New Year!

[05:15](#msg56860b6a0199d70069e072a3)@JacobGood1 have you used Spectre? It's "even better" than destructuring :)

Intro article: http://nathanmarz.com/blog/functional-navigational-programming-in-clojurescript-with-sp.html

The same walkthru as a video: https://www.youtube.com/watch?v=mXZxkpX5nt8

DonaldTsang

[09:08](#msg5686421f4f069158055c92d2)What is immutable variables? referential transparency?

eMBee

[09:33](#msg568647f9653b30761d76dab1)immutable variables, are variables that don't change their value

[09:34](#msg5686481a653b30761d76dab2)referential transparency means that you can call a function multiple times, and you always get the same result

PeterWAWood

[09:40](#msg568649970199d70069e07544)I think that "immutable variables" are a bit of a misnomer. Isn't it also immutable values?

[09:44](#msg56864a884f069158055c933a)A variable contains the memory address of a value. When people say "immutable variables" don't they mean that the value in the memory address cannot be changed.

[09:58](#msg56864de10199d70069e0756d)The first answer to this \[stack overflow question](http://stackoverflow.com/questions/9753080/is-erlang-single-assignment-different-from-haskell-immutable-values#9753208) may help to make the distinction clearer than I did.

onetom

[10:06](#msg56864fb53c6894026925926b)@DonaldTsang I think when people say immutable \*variables\*, they might just want to draw an analogy with languages based on mutable values.  
So technically it's not correct, not precise.

Immutable \*values* mean once u created some complex data structure (a \*value\*), you can not change it, only create a new, modified version of it, without the original being destroyed.

It's similar to the number 42 always being and meaning 42. That's not something you can change.

Because of this the original value can be remembered and used later by other code - even on other threads - without worrying to see a modified version later.

[10:14](#msg56865171653b30761d76db0f)To make useful programs though, you obviously need to somehow handle change, so how to do that with immutable values?

The trick is that you \*bind* these values to symbols. It's similar to \*assignment\*.

You \*can* re-bind/re-assign values to symbols (like the symbol representing the current value of an interation in a loop changes by every iteration),  
BUT the previous values bound to symbols won't be changed!

They will hang around in memory until no code is holding a reference to them and they get garbage collected.

[10:16](#msg5686520c653b30761d76db1b)To make such an approach feasibly fast and memory efficient, values (arrays/vectors/collections and objects/maps/hash-maps/dictionaries) are represented by https://en.wikipedia.org/wiki/Persistent\_data\_structure

[10:18](#msg5686527f4f069158055c93a9)According to this https://en.wikipedia.org/wiki/Immutable\_object entry, "Immutable variable" is another name of a \*constant* if I understand correctly.

maximvl

[12:47](#msg568675550171d1791d02eae6)I though that a referencial transparency is ability to replace every expression in a code with it's value, and the result should be exactly the same

nickantonaccio

[13:19](#msg56867cfb35e1a316162eea34)@DonaldTsang http://blog.jenkster.com/2015/12/what-is-functional-programming.html

JacobGood1

[16:19](#msg5686a70335e1a316162eed5b)@onetom spectre is definitely cool. I also like https://github.com/clojure/core.match pattern matching.

[16:40](#msg5686ac140199d70069e07b66)@onetom talking about destructuring or anything clojure related is not off topic btw, since clojure is a lisp as well.

onetom

[17:20](#msg5686b57835e1a316162eef0b)By topic I meant the "macros for Red" topic.

JacobGood1

[18:15](#msg5686c2359606b15a055e6ac5)I dont think the channel was meant for macros only, but it might have been

[18:21](#msg5686c3a835e1a316162ef090)@onetom  
Q: Why Rebol didn't have macros?  
A: It was not a compiled language.  
Is this a correct?

no, even an interpreted language could benifit from code transformations that leave behind no trace of thier transformers

tanstaaf1

[18:28](#msg5686c55e3c68940269259b2c)IF WE HAVE MACROS + parse, does anyone see a fundamental reason why A SUBSET or RedLike DSL of Red couldn't be made competitively functional? Rather than debating what "competitively" means, let's just define that as competitive with Clojure in terms of immutable state + vastly easier to debug than currently (and easier than Clojure specifically...where debugging apparently remains a sore spot due to the JVM foundation)? Is is safe to assume "no"?

[18:40](#msg5686c8003acb611716008124)@dockimbel @JacobGood1 @nickantonaccio and anyone else.. I want to be able to use Red for teaching basics of functional principles to K-12 a year or three in the future. And I want to lay this question, at least, to bed in my mind and plans. Thanks. Now back to our regular programming! :-)

JacobGood1

[18:43](#msg5686c8bb0171d1791d02f24a)I think one of the issues is that homoiconic in the rebol tradition is slightly different from the lisp tradition. It is like another one of those oop in java vs oop in newspeak comparisons, though rebol and lisp are not quite as different as those two when it comes to homoiconicism.

In lisp, code is always represented as data while in rebol code is represented as data when placed in a block.

Maybe this should be called optionally homoiconic? This may seem like an arbitrary distinction(in some ways it is) since the lisp code is code until you tick the outside of the list... example:

(execute this code) =&gt; this will execute at full speed  
\`(execute this code) =&gt; this will return a list  
take the tick away again…  
(execute this code) =&gt; this will execute at full speed

in rebol we would write...  
execute this code  
\[execute this code]

this distinction is why lisp code can leave behind the parse after the manipulation is done

how do we take the tick away in all circumstances in rebol(essentially how do we drop the brackets)?  
I am not talking about using compose on the block to drop inner blocks but dropping the block all together and leaving behind the data in order to execute it as if the code had been written by hand.

so if we could parse a block and drop the outer block after a parse…

parse \[this is some code] rule  
\[this is now some other code] =&gt; drop the block next...  
this is now some other code =&gt; that will be executed as if the block never existed.

Assume that this code is in a loop, now parse does not exist in the loop anymore, the only thing that is left is the reinterpretation of the code as if you wrote it by hand.

This can get even more fancy with reader macros, compiler macros, symbol macros, etc. but, for now, lets talk about just the simple macro expansions that most people have heard about offered by defmacro in most lisps.

[18:44](#msg5686c90e3acb611716008139)@tanstaaf1 I already answered you earlier, maybe you did not see it(there is a lot of text in here =P)

If red has strong enough abstractions, and I think it will, then there is no reason at all that it cannot be bent into any paradigm that you desire

Skrylar

[18:51](#msg5686caca0199d70069e07ed6)Since I haven't heard back after we discussed SBCL's loop, I'm going to move coming up with macro examples to a lower priority for now.

JacobGood1

[19:00](#msg5686cccc0171d1791d02f2b4)@Skrylar =)

[19:02](#msg5686cd4e0199d70069e07f0f)the fact that loop is used even when needing optimally fast code is an eye opener... the loop dialect/dsl is a nice abstraction that has no associated cost

[19:17](#msg5686d0d635e1a316162ef1c8)@onetom one more thing, check out instaparse, I think we could rip some ideas from it for parse:  
https://github.com/Engelberg/instaparse

## Saturday 2nd January, 2016

tanstaaf1

[01:38](#msg56872a2a3c6894026925a556)@JacobGood1 Thanks. That was helpful. Well, I think we're getting macros so I will hold faith and do my best to stop repeating questions!

JacobGood1

[01:39](#msg56872a590199d70069e08872)@tanstaaf1 it is ok. A lot of text has been slung around and sometimes we need reassurance.

ghost~5680c5f416b6c7089cc058a5

[05:12](#msg56875c533acb611716008dcd)\[DISCLAIMER: My knowledge and experience about macros, lisp, rebol, red, and programming in general can be equated to zero. I am just trying to get something in my head, so please correct me if I am wrong.]

Languages like C/C++ have text substitution macros, which are done by a preprocessor and the only thing it does is increase the compilation times.  
On the other hand, Lisp and derivatives have syntactic macros which work on the AST level (since they are homoiconic) and enables us to create powerful DSL as well as extend the language itself.  
And "Inferior" programming languages like "Rust" have macros but since they are not homoiconic, they require the use of "Compiler Plugins" to extend the language.

But,

1\. Rebol languages already provides Parse to create DSL's or dialects.  
2\. Rebol languages also already allows redefinition of existing natives and functions unless they are 'protect'ed.  
So extending the language is pretty easy.  
3\. But Rebol languages are homoiconic and thus can have powerful hygienic syntactic macros.

Now, Parse works at Run-time and therefore requires a JIT compiler for performance.  
Macros on the other hand, are evaluated at compile-time and then are AOT compiled, so they are fast. Also since they are kinda inlined, so if used properly will increase the execution speed even further since overheads of calling the function are missing. Also, Macros allows for greater code reuse.

The main problems with macros are that -

1\. They will increase compilation times even further (but since there are many ways to optimize compile times, this shouldn't be a showstopper).  
2\. Excessive use of macros makes code unreadable and may also increase memory usage(since it is kinda excessive inlining).  
3\. No proper way to debug macros (yet!).

So, what we want is "macros" because they can be faster than Parse, the code can be more compact and concise i.e. the code has almost no boilerplate and follows the DRY principle, they are gonna replace the preprocessor in Red, they can enable extending Red to greater levels with much more ease.  
And the main roadblock right now is "How to debug macros? How is an IDE gonna handle it?".

Am I right???

PeterWAWood

[05:27](#msg56875fc635e1a316162efd9f)I cannot comment on much of what you have said but have a couple of things worth mentioning:  
As far as I know the Red complier has no preprocessor.  
In Rebol, using parse was usually faster than using native functions.  
If speed is of such essence, Red is unlikely to provide the suitable performance until the self-hosted compiler is written and optimisation modules have been developed for it.

ghost~5680c5f416b6c7089cc058a5

[05:28](#msg5687601b3c6894026925a8f8)I meant Red/System.

[05:31](#msg568760bc35e1a316162efda7)And performance, well , I have no problems as yet. I would prefer a usable 1.0 to be released first.

eMBee

[06:42](#msg568771463acb611716008f3b)where do you get the idea that preprocessors slow down compilation? from my experience they hardly made a difference in speed.

[06:43](#msg568771930171d1791d0300a8)from what i learned about parse, i wonder if the ability to do parse at compile time would make the difference?

[06:44](#msg568771be35e1a316162efeed)and then also, given that red can be compiled, does that difference even matter?

tanstaaf1

[17:23](#msg56880782653b30761d76ff21)@nickantonaccio @Skrylar @JacobGood1 Maybe this provides a SOLID (real world) use of a macro? http://cl-cookbook.sourceforge.net/macros.html" Let's look at another example, both to illustrate a nice macro, and to provide an auxiliary function for some of the discussion below. One often wants to create new symbols in Lisp, and gensym is not always adequate for building them. Here is a description of an alternative facility called build-symbol:

(build-symbol \[(:package p)] -pieces-) builds a symbol by concatenating the given pieces and interns it as specified by p.  
...lots of code, etc....  
For example, (build-symbol (:&lt; x) "-" (:++ \*x-num\*)), when x = foo and \*x-num* = 8, sets \*x-num* to 9 and evaluates to FOO-9. If evaluated again, the result will be FOO-10, and so forth.

Obviously, build-symbol can't be implemented as a function; it has to be a macro. Here is an implementation: "

onetom

[17:41](#msg56880bd80171d1791d030d98)@JacobGood1 im aware of instaparse, but haven't had a chance to use it yet. i've just started using clojure about a year ago, but learnt rebol ~20years ago

Skrylar

[21:26](#msg568840923c6894026925bc8a)@nc-x I want them because macros would allow Parse to run at compile-time.

[21:26](#msg568840989606b15a055e8c1f)@eMBee That comes from C++.

[21:29](#msg5688414435e1a316162f10e6)@eMBee C++ doesn't have any kind of modular compilation, so the textual preprocessor is used to split files up. If you run the GCC preprocessor on real files (say, something using boost or Ogre3D, which uses boost) you notice that your 5kb C file is actually 60mb. The parser then has to trawl that 60mb mess just to compile your simple code--thus, the preprocessor "made everything slow."

[21:30](#msg5688417d3c6894026925bca2)It's actually the poor infrastructure (compiling 60mb of ambiguous syntax per file, instead of using modules and keeping the overhead low) which is to blame, but I found its almost impossible to get C++ advocates to admit there is anything wrong with their toolchains :/

## Monday 4th January, 2016

dockimbel

[10:21](#msg568a479b4f069158055cf09a)@JacobGood1 \*In lisp, code is always represented as data while in rebol code is represented as data when placed in a block.* You might be confused by the REPL command-line. Red/Rebol code is always data in a block, even if the block is hidden from your eyes in the case of the REPL. Here's a step by step description of what happens in the REPL:  
1\. `1 + 2` ENTER  
2\. `code: load "1 + 2"` (READ stage, returns \[1 + 2] internally)  
3\. `do code` (Evaluation stage, `do` evaluates the block according to Red language semantics).

[10:23](#msg568a48250199d70069e0d0fd)Same happens if you run a Red script, the text representation is LOADed in memory and all the scripts root values are stored in a root block, before evaluation.

[10:24](#msg568a48653acb61171600d097)Though, I understand why you think of it as "optionally" homoiconic. You could consider Red/Rebol approach as \*syntactic sugar\*, as it is always transformed internally to the canonical form.

JacobGood1

[16:04](#msg568a98080199d70069e0ddc2)@dockimbel welcome back and thanks for the clarification

pekr

[16:13](#msg568a9a383acb61171600dda9)Elm, functional language claiming making web apps easy. Just a pointer - http://elm-lang.org/

[16:17](#msg568a9b279606b15a055ecb48)Looking at examples - that's how Red is supposed to bring VID to the browser :-)

rebolek

[16:45](#msg568aa1a20171d1791d0353bb)So it’s like Lest :P

JacobGood1

[17:41](#msg568aaebf3acb61171600e178)looked at elm a long time ago, perf used to be terrible

## Tuesday 5th January, 2016

asampal

[02:29](#msg568b2a7066a282570f905b60)@JacobGood1 , depends on what you're talking about - here it is compared to some popular frameworks \[blazing-fast-html](http://elm-lang.org/blog/blazing-fast-html)

JacobGood1

[02:31](#msg568b2afe4f069158055d16d9)yea, I figured it might be faster now =)

dockimbel

[03:50](#msg568b3d7917eed9cd1bbbf70a)@JacobGood1 Fast performance is brought by the \[virtual dom](https://github.com/Matt-Esch/virtual-dom) JS library, which is actually quite similar to how Red/View works (virtual tree of faces with diffing support and partial/global updates).

## Wednesday 6th January, 2016

fort-ascension

[18:18](#msg568d5a62bda083fc5603d3cf)my point about macros being already part of Rebol is that all you need to do is replace the load function by a version of load which manipulates the data before returning it and you can implement whatever system you want. I have such systems which are completely invisible and which allow advanced modularization of Rebol code. in Rebol, code is ALWAYS data. in R3 you can even manipulate the block which is used as the source block of a function (after function creation) and it will continue to modify the resulting function. you can even do this from \*within* the function (though "here be dragons" ;-) ).

[18:19](#msg568d5a9e8e543980066d9240)

[18:20](#msg568d5afa8e543980066d9241)With red system and compilation, there is another layer to consider, but if R/S tokenizes the input like it does for Red, I can't see why the same mechanism can't be applied to its token list.

[18:24](#msg568d5bd6deef6a835c4366e5)I guess my misunderstanding is where and how you wish to add macros. is it only to specify a standard specification and implementation of recursive symbol manipulation, or is it to add it to lower-levels where such things are probably more complex, or maybe something else.

[18:27](#msg568d5c79bda083fc5603d3d8)what I'd like for macros is to have \*\*\*string!\*\** manipulation of source code (before tokenization, like in C). that would allow much more powerful syntactic manipulation. I've played around with such things in the past too. they allow you to completely change the syntax. I've even done simple, run-time source language converters which allowed rebol to load in other language source files almost natively.

[18:30](#msg568d5d3afa733fa72e1d4522)in practice, these are less useful (in terms of how often you use it) but are very nice to have. in any case, you can still implement them transparently by simply redefining `LOAD` and adding features to it. This was my approach and for some projects, I could read C headers directly (note, these where simple headers). since all the system code use LOAD, you can add these features directly to all the system code.

[18:31](#msg568d5d72deef6a835c4366e6)Specifics may vary for Red, but should still apply in general, for how much of Red I understand so far.

[18:40](#msg568d5fa3fa733fa72e1d452a)I want to make it clear that I'm not bashing macros. I guess the real thing is that all you need to do is implement one and propose it.

[18:45](#msg568d60d1deef6a835c4366ea)I see no need to have one embedded in the native LOAD... unless the actual goal is to improve performance. which brings me back to what it is that you actually want to achieve when you say \*"add macros to Red"\*.

[18:47](#msg568d613dbda083fc5603d3df)I'm doing my best for the text not to sound negative. I'm just really trying to grasp the explict intent. I really am \*\*for\** macros, but since we can already implement them pretty easily. I'm trying to see what's different in your view of what is missing.

dander

[23:12](#msg568d9f69e8598dd060157d96):point\_up: \[December 31, 2015 1:52 PM](https://gitter.im/red/red/lisp?at=5685a3879606b15a055e58ce)  
@fort-ascension , did you see Skrylar 's message here? I thought this seemed like a good summary.

JacobGood1

[23:20](#msg568da156d9a9d7ea39cfc18a)@fort-ascension if you means me then see this :point\_up: \[January 6, 2016 6:12 PM](https://gitter.im/red/red/lisp?at=568d9f69e8598dd060157d96)

[23:22](#msg568da1ac881538d260ad0943)and this:  
:point\_up: \[January 1, 2016 1:51 PM](https://gitter.im/red/red/lisp?at=5686caca0199d70069e07ed6)

## Thursday 7th January, 2016

fort-ascension

[00:21](#msg568daf798e543980066d9337)thanks, I didn't realize the thread rolled back that far when I joined I just had a few posts.

[00:33](#msg568db23ffa733fa72e1d4636)I've read back a bit and I think some you may not have used parse to its full extent to realize that it is more like a lisp interpreter than anything else.

[00:43](#msg568db4aefa733fa72e1d4637)the way I see it, in its design, lisp aims to mesh the evaluation of the data streams (functions) with the (inline) raw transformations of that data by mixing the macro and the top level "interpretation" into one engine. the output is a basically dataflow graph. haskell exploits this and adds the lazy eval, cause its easy to do in a graph. this also explains why it doesn't need a stack, because the state of each transformation is part of the graph itself.

[00:45](#msg568db5448e543980066d9339)Rebol actually aims to do it the other way around (on purpose I think). data and evaluation are separated, but can be integrated at will. there is no abolute graph, functions and values are not copied.

[00:52](#msg568db6d0fa733fa72e1d463c)parse is a bridge between both worlds. you can build your rules to go all the way to lisp or all the way to imperative style stack-based eval. as such the result of your parse can be a parse rule, which you can execute right at the tip of the rule. You can simulate loops with parse, just as you can with lisp. you can build and modify your rules inline (macros) and you can change the input data on the fly (functions) you can execute paren! expressions in line (lambdas) and you can suspend and restart a parser and its data just like a continuation.

[00:55](#msg568db7988e543980066d9342)for me the main difference is that lisp is designed to do these things. parse allows them, but is not as well setup for it. (the parse code to simulate lisp can be messy).

[01:01](#msg568db8fbfa733fa72e1d4649)@rebolek I noted you wanted to add inlining before macros. well we can say that inlining IS one way of many ways to leverage macros.

tanstaaf1

[06:05](#msg568e002ac5bdc5ba338e4cf9)I thought this might amuse and ALSO educate: "The language of the future (for some definition of future) will resemble (in many ways) both Lisp and Smalltalk. But it won't be either." http://c2.com/cgi/wiki?WhyWeHateLisp

Oldes

[07:37](#msg568e15d19a5f8fe839219856)@fort-ascension it was probably me advocating for \_function inlining\_, not @rebolek ... I consider it to be more clean instead of using advanced macro definition, which was not proposed yet anyway. I would like to use something like:

```
ajoin: func [
    {Reduces and joins a block of values into a new string.}
    [inline]
    block [block!]
][
    make string! reduce block
]
```

So it could be inlined by compiler (if wanted) OR evaluated like a function in the interpreter or if inlining is disabled by user during compilation (because you want to debug or prefer smaller app size).

[07:59](#msg568e1af39a19aa640409833a)Actually I would like to see the inlining in Red/System, where some sort of macros already is. I expect to see performance increase if inlining would be used in some critical functions, which are for example in datatypes. For example here: https://github.com/red/red/blob/master/runtime/datatypes/block.reds#L18 . My problem is, that I cannot imagine any real life example, how could the discussed lisp like macros work for people without MIT background.

@dockimbel please note that I still remember your claim that inlining itself does not need to bring the performance boost because of CPU cache:) I think you could say the same about macros.

dockimbel

[09:29](#msg568e2ff7349c38540402642c)@Oldes Macros are just a way to shift some computation at compile-time rather than run-time, that's where you get the performance gains.

Oldes

[09:32](#msg568e30ac27149e5804f1bc1a)I know, and usually it's code inlining. When I don't count for me strange purpose macros like mentioned in the article posted above by @JacobGood1

JacobGood1

[17:37](#msg568ea24a0712a5b63b4c2303)@tanstaaf1 Common Lisp already resembles smalltalk. The langauge has the "everything is an object" feature.

pchg

[18:12](#msg568eaa847668d00a4ab4428e)Here I am.

JacobGood1

[18:14](#msg568eab097669220736027278)@pchg just scroll up, warning there is a lot of text

pchg

[18:14](#msg568eab16b1f439094a06dcba)Ah...

[18:15](#msg568eab2887cb99b53b87ca7b)I wished to have just a short tiny example...

[18:15](#msg568eab5a7668d00a4ab442b9)From when do you reckon I should begin reading? (I hate reading things the wrong way, time-wise...)

JacobGood1

[18:16](#msg568eab7a8fdd3c0c382d55da)yes, but I am sure that other questions would arise, so I was showing you the full gamut so that you can see everyones opinions.

pchg

[18:17](#msg568eaba8b1f439094a06dcd1)Okay. Then I'll start at the top.

JacobGood1

[18:18](#msg568eabe37668d00a4ab442e2)sorry, there is no royal road to macros...jkin =P

[18:24](#msg568ead4fee13050b38a23b85)@pchg I started to scroll through all that in order to review what has been said... I will just rewrite some examples so that this thread can have a reboot of sorts... that is a ton of text to slog through. Give me a bit though, other things are going on.

pekr

[18:30](#msg568eaedaee13050b38a23bca)What Doc has suggested is to create a wiki entry for that, kind of a proposal ....

pchg

[18:39](#msg568eb0cb87cb99b53b87cb83)@JacobGood1 Okay, thanks a lot! I began reading, and got a bit lost... These linear tchats are sometimes a bit tedious to read, especially with people as talkative as I am... =&gt; ][

[18:48](#msg568eb30fd739f50a36024ebb)I may ask a totally stupid question, but aren't macros already implemented in Rebol and Red, by the use of DO or DOES? I have the feeling that I sometimes make up words, especially with DOES, that are behaving more like macros than anything else.

[18:49](#msg568eb33c7668d00a4ab4444b)But maybe lisp macro-ing is a whole different story.

JacobGood1

[18:51](#msg568eb3b47668d00a4ab44463)I guess ill make a rough wiki entry, well argue about it, refine it, and maybe, come out with something everyone approves of(everyone = me...jk)

pekr

[19:12](#msg568eb882b1f439094a06df4f)@pchg DOES is a function constructor, when you don't need to submit any parameter to your function ....

pchg

[19:27](#msg568ebc0f0712a5b63b4c2774)@nickantonaccio I laughed quite a lots while quickly reading through that text! Many things may be applied to Rebollers, s/lisp/rebol/g may lead to a true Rebol initiation experience! ;-D

[19:29](#msg568ebc920712a5b63b4c278e)@pekr Yes. I often use things in a non-academic way, I'm afraid.

JacobGood1

[19:30](#msg568ebce3d739f50a360250aa)this write up is going to take a while, I have to do my best to teach intro shen with the macro proposal

ghost~5585eedf15522ed4b3e236ae

[19:34](#msg568ebdae7668d00a4ab446a8)@JacobGood1 : Yes, a written proposal and as complete as possible would be welcome. It will make a working basis. We must first enable the language to mature because we are only at the beginning, and too lengthy discussions are a major obstacle for small hands team.

pchg

[19:35](#msg568ebdfa0712a5b63b4c27d6)@lkppo +1

## Friday 8th January, 2016

aped

[00:30](#msg568f033ab1f439094a06ecc6)@pchg wait for red/samples and there will be macros in there ;)

dockimbel

[04:53](#msg568f40c3b1f439094a06f2d0)@JacobGood1 Looking forward to read your proposal with great interest. :+1:

JacobGood1

[15:28](#msg568fd5a3b1f439094a070608)I am working on it... I will need everyones help in order to fully flesh it out once I get it to a rough draft, especially experienced rebolers.

nickantonaccio

[15:38](#msg568fd804ee13050b38a2656f)@JacobGood1 I'm interested in seeing your clarification of / response to fort-ascension's perspective about lisp macro vs. Rebol/Red approach

JacobGood1

[16:52](#msg568fe941b1f439094a070ac3)there is no real response to be given, preprocessors are not a replacement for macros. It is like saying anonymous classes with the ability to override methods are a replacement for lambda expressions...

[17:51](#msg568ff714b1f439094a070de8)Also Haskell is not a lisp(list processing), you are neither in the ast nor is there access to macros(not a requirement but practically every lisp has macros). Historically, lisp has been a very dynamic, interactive language that emphasizes multi-paradigm approaches over ivory tower ones; Haskell does not fit the bill.

[19:31](#msg56900e7c766922073602a631)The good thing about trying to write ideas down is that it is a learning process. After spending forever writing about Shen macros and thinking about how to use them in Red, I have come to the conclusion that Shen macros will only work with a lisp syntax. We will have to use common lisp style macros unless there is something I am missing...

[20:20](#msg56901a2a87cb99b53b880300)Ok, here is a ROUGH draft, spelling errors, grammar errors, thought errors, etc. I got irritated towards the end when I realized that Shen style macros would be hard/impossible...  
https://github.com/red/red/wiki/Macros(SPEL:-semantic-programming-enhancement-logic)

## Saturday 9th January, 2016

dockimbel

[09:39](#msg5690d54687cb99b53b881581)@nickantonaccio There's no equivalent feature to macros in Rebol/Red currently, except maybe `#do` directive in Rebol/Encap (but it's very limited compared to macros).

JacobGood1

[14:15](#msg5691161d8fdd3c0c382da902)It would be nice if we could sticky certain things...

pchg

[15:15](#msg5691241787cb99b53b881c46)@JacobGood1 Thanks for the explanation, for writing examples and documentation. I've read that last night, and now I've got a headache. Not your fault, but I should begin to dive just a little a bit into Lisp, to (better) understand the concept...

JacobGood1

[15:22](#msg569125c65fd2ae3c32b497be)Let me know if I can clarify anything, I am sure that some explanations on there were crappy

[16:28](#msg56913545d739f50a36029ee9)There is more to discuss as well such as gensym, modules, etc. I still need more time to think about red macros as well. Should it be...

macro-name \[code-to-expand]

... as explained in the post?

Or should it be something else?

pchg

[17:47](#msg569147c3b1f439094a073424)@JacobGood1 On your code samples, what does (7-) (like in the first code snippet^Wscreenshot) mean? Are these just numbered prompts from the interpreter?

JacobGood1

[17:49](#msg569148228fdd3c0c382daf32)@pchg yes, each time I do anything that number increments

[17:50](#msg569148785fd2ae3c32b49bb2)@pchg would you like for me to link the setup with instructions... it is always easier to learn interactively

[17:51](#msg569148bfb1f439094a073446)I need to make the red code prettier

pchg

[17:52](#msg569148c287cb99b53b882072)@JacobGood1 "link the setup with instructions" =&gt; what do you mean, exactly (sorry, English is not my mother-tongue...)

JacobGood1

[17:53](#msg569148fc8fdd3c0c382daf53)make it to where you can program with the same enviroment

pchg

[17:53](#msg5691490eb1f439094a073454)I would also suggest to replace the bitmaps of Shen console by actual copy-pasted stuff. Just to ease one's experimentation.

[17:53](#msg56914921ee13050b38a29307)@JacobGood1 ok. Yes, sure.

JacobGood1

[17:54](#msg56914946b1f439094a07345f)good suggestion, you can also replace it =P

pchg

[17:54](#msg569149678fdd3c0c382daf60)Yes, well... I wouldn't dare doing it, at the moment!

[17:55](#msg569149918fdd3c0c382daf62)Since I just don't understand what the various line actually mean... I just tried to find a Shen package for my machine, no success so far.

[17:55](#msg569149a2766922073602c64a)Do you know if it's packaged for Debian?

[17:57](#msg56914a2487cb99b53b88209a)Apparently not, as far as I can see.

JacobGood1

[18:00](#msg56914ac55fd2ae3c32b49c02)no but there is a linux dl

[18:00](#msg56914ac6ee13050b38a29326)http://www.shenlanguage.org/download\_form.html

pchg

[18:03](#msg56914b67ee13050b38a29333)@JacobGood1 Hope it won't mess up my beloved Debian too much! I give her a try.

JacobGood1

[18:08](#msg56914c96b1f439094a0734c0)alright windows instructions are now at the top of the doc

pchg

[18:08](#msg56914c9c8fdd3c0c382dafcc)On the other hand, there is a huge amount of debian packages for lisp.

JacobGood1

[18:08](#msg56914c9e8fdd3c0c382dafcd)changing those pics will take longer

pchg

[18:09](#msg56914cce766922073602c695)I was trying to retype them (without making too many mistakes... which is not so easy, since I don't have a proper environment, so far).

[18:10](#msg56914d040712a5b63b4c7a5d)Trying to install Shen, in the README, I read that:  
&gt; Shen is a next generation Functional Language that runs under many platforms; including Common Lisp, Scheme, Javascript, Clojure and Python.

[18:10](#msg56914d100712a5b63b4c7a5f)=&gt; so I could use Shen with my python??

JacobGood1

[18:10](#msg56914d1687cb99b53b8820ee)yes

pchg

[18:10](#msg56914d328fdd3c0c382dafe0)(that would imply way less headaches than with lisp, despite all its qualities...)

[18:11](#msg56914d37b1f439094a0734db)ok, then.

JacobGood1

[18:11](#msg56914d520712a5b63b4c7a6b)well the lisp one is easiest to setup, you just fire it up and it opens a repl in the terminal

[18:11](#msg56914d67b1f439094a0734df)that lisp port is the one by the creator of the language himself, Dr. Tarver

[18:12](#msg56914d76766922073602c6a1)thus it has the greatest support

pchg

[18:12](#msg56914d868fdd3c0c382dafeb)So, if I understand correctly, it is rather a matter of Shen macros^W SPELs than lisp ones, right?

JacobGood1

[18:12](#msg56914d9e5fd2ae3c32b49c4e)well, Shen is a lisp =P

[18:13](#msg56914dae5fd2ae3c32b49c50)I just think it is easier to explain macrology in Shen

[18:13](#msg56914dd187cb99b53b88210d)I would explain it in red(the vernacular of this group) but, alas, I cannot

pchg

[18:13](#msg56914dd2d739f50a3602a18d)@JacobGood1 A lisp based on Common Lisp, Scheme, Javascript, Clojure and Python? Now I got confused...

JacobGood1

[18:14](#msg56914debb1f439094a0734f1)no, it is a portable lisp that runs atop those things

pchg

[18:14](#msg56914df3b1f439094a0734f2)ok, got it

JacobGood1

[18:14](#msg56914df7ee13050b38a2937d)none of that really matters though

pchg

[18:14](#msg56914e12b1f439094a0734f6)Well, one should know lisp syntax, in order to get the point, right?

JacobGood1

[18:15](#msg56914e2c87cb99b53b882119)we just want to rip features from it and other lisp implementations(and any other language really), that would be a good fit for red

pchg

[18:15](#msg56914e2dd739f50a3602a199)I was beginning to hope that I could understand this whole thing with the python syntax... Not.

JacobGood1

[18:15](#msg56914e475fd2ae3c32b49c66)hehe, that would be nice =)

[18:16](#msg56914e72d739f50a3602a1a6)@pchg lisp syntax varies between the numerous dialects

[18:17](#msg56914eb2d739f50a3602a1b4)I believe Shen to be one of the more clear ones, however, my opinion is highly subjective... I was hoping Shen would be better for redites to read because of the block style syntax; it is similar to red/rebol

[18:18](#msg56914f038fdd3c0c382db00c)of course it does have pattern matching... that can be odd to anyone who has never really done any functional programming

[18:19](#msg56914f250712a5b63b4c7aaa)so it is give and take, I could do some macro examples in another dialect if this group would like that

[18:21](#msg56914fbdb1f439094a073525)clojure examples might be nice since they have a hygienic macro system, however, I prefer unhygienic macros(sorry if my language is getting too lispy)

[18:23](#msg56915014ee13050b38a293b6)I need to start typing spels =)

[18:23](#msg5691502ed739f50a3602a1e6)Maybe @dockimbel would like for macros to be called spels?

nickantonaccio

[19:15](#msg56915c4a5fd2ae3c32b49e00)@JacobGood1 Why not demonstrate a fictitious example, in the syntax that you imagine best for Red. That would give Doc something to reverse engineer. Maybe start with one feature of the Loop macro...

JacobGood1

[20:45](#msg569171690712a5b63b4c7f02)@nickantonaccio I did that at the bottom of the wiki... did you read it?

[20:56](#msg569173e687cb99b53b88259e)I am still iterating over the idea though, might come up with something else.

KirillTemnov

[21:50](#msg569180acd739f50a3602a786)A few thoughts about macros:

\- In `Red` function arity is a constant. You can predefine optional parameters, but you can't define `&rest` arguments, as far as I know.  
\- In terms of `Red` macro should return a new function.  
\- Somehow macros must differ regular parameters and blocks. In `Commonlisp` for this purpose we use backquote "\`". This is the harder case, because we don't know before how many blocks and params can be passed when defining a new macro. Maybe, it make sence to use new syntax construction here (or reserved word).

JacobGood1

[21:52](#msg5691810c0712a5b63b4c80ac)I slightly agree, more thoughts to come...

[22:04](#msg5691840aee13050b38a299c6)hostile fork suggested using a vertical bar to denote multiple arguements...

```
example: spel [n [integers!] | s [string!]] [
    print s
    while [not last? n] [
        ++ n
        insert n '+
        ++ n
    ]
    head n
]
```

spel-expand :example 1 2 3 | "hi there" =&gt;  
hi there  
\[1 + 2 + 3]

[22:05](#msg5691842eee13050b38a299c8)I really like this one, let me know what yall think

tanstaaf1

[22:20](#msg569187bed739f50a3602a856)@JacobGood1 @dockimbel Do you think it a good - or a bad - idea for someone (maybe me) to drop by a lisp forum (maybe shen) and ask for some help? Even if red doesn't meet their purity test, the reality is red is at least a close cousin and, in truth, I think souls are aligned. The wiser heads in the lisp communities should be interested in the problem of fitting macros into red.

JacobGood1

[22:33](#msg56918acc0712a5b63b4c81bc)@tanstaaf1 I really do not know what kind of response you would get, the choice is up to you

PeterWAWood

[23:23](#msg5691967b766922073602ceeb)@JacobGood1 What language is your example written in?

[23:23](#msg569196870712a5b63b4c82f5):-)

[23:25](#msg569196e98fdd3c0c382db863)I would suggest something like this is more realistic:

```
example: make spel! [n [block!] s [string!]] [
	print s
	until [
		n: next insert n: next n '+
		tail? n
	]
	head n
]
```

## Sunday 10th January, 2016

KirillTemnov

[10:05](#msg56922cda87cb99b53b883392)@JacobGood1 Vertical bar applyed in `Erlang` and `Prolog` like this (Erland):

```
spel([A, B, C | TAIL]) ->
  ...

spel([1, 2, 3, "hi there"])
```

`Prolog` is similar, \*\*so, we pass a list (a series in terms of `Red`) to a function\*\*. We can't pass separated arguments.

In your example, we can ommit type of blocks

```
example: spel [n | s ] [
   ...
]
```

After that, your example will looks very confusing.  
When did we split args? In terms of `Erlang` / `Prolog` we should take first parameter as `integer!` and all rest as block of `string!`.

Using `|` inside of calling macro (`spel-expand :example 1 2 3 | "hi there" =>`) looks even more confusing.

[10:20](#msg56923051d739f50a3602b3b7)Here's another use case for macro.  
It's not full, but it must be sufficient to convey the basic idea:

```
with-db: macro [
    table [string!] "Table name"
    code-block [block!] "Execute this code"
][
   conn: open-connection ; external function for opening db connection
   do code-block
   close-connection conn; close db connection
]

update-user: func [
    user-hash
][
    with-db [
        "users" 
        [ 
            ; this block called inside macro - update table record by id
            update-db-object table user-hash/id user-hash    
        ]
    ]
]

get-user-by-id: func [
    user-id
    /local user
][
    with-db [
        "users"
        [
            user: select-db-object table user-id
        ]
    ]
    user
]
```

pekr

[10:20](#msg569230590712a5b63b4c8d12)@PeterWAWood - how does your example differ from it being just a function?

KirillTemnov

[10:24](#msg5692314f87cb99b53b8833e4)In my example "magick" happens when we  
1\. bind `table` to "users" inside code-block  
2\. propogate block result to `user` local variable

[10:44](#msg56923608d739f50a3602b42b)Always pass arguments in square braces to a `macro` seems to be a good idea...

PeterWAWood

[10:56](#msg569238f90712a5b63b4c8dd2)@pekr As I understand, the difference between a "macro" as proposed and a function is purely that the "macro" will be run at compile time and generate code that will be copied into the program source everytime the macro is "called". (Though perhaps I have misunderstood the concept). In my example, I have simply recoded what @JacobGood1 wrote but in a more Reddish style.

pekr

[11:03](#msg56923a8c8fdd3c0c382dc374)well, compile macros, kind of preprocessor? I think what guys have in mind is also REPL level macros?

PeterWAWood

[11:03](#msg56923a99766922073602d970)I didn't see the point of using print in the example. It doesn't make sense to print the string at compile time. Perhaps @JacobGood1 wants the macro to output two lines of code:  
hi there  
\[1 + 2 + 3]

pekr

[11:04](#msg56923aa9766922073602d976)anyway - I like your syntax, is much more rebollish ....

PeterWAWood

[11:12](#msg56923cb887cb99b53b883503)@KirillTemnov Thanks for your example. I'm not sure that I quite understand how it works. My understanding is that a "lisp-style" macro would be executed at "compile time" and the resulting code inlined into the program (for presumably a second pass of the compiler or to be interpreted). (I could well have misunderstood).

I can't see how update-db-object could be executed at compile time.

[11:15](#msg56923d598fdd3c0c382dc3b5)@pekr I think that Lisp macros are executed at compile time unlike typical C style macros (#define in Red/System) which simply copy code into the source.

KirillTemnov

[13:05](#msg56925719ee13050b38a2a9c8)@PeterWAWood macros (in `lisp`) executed, when they called (it may be in compile time and in runtime). `Lisp` macros has nothing to do with C-like preprocessors.

That mean, that we can change program behavior \*\*in runtime\** with defining a new macro or applying existing to define new function.

For example, we can make some proxy REPL with simple DSL, read user input and automatically generate new functions, based on user input without relaunch program.

In fact, macro it's a block (block of block! in common case) that accept variables and paste them in code with this block.

In my exaple code

```
update-user: func [
    user-hash
][
    with-db [
        "users" 
        [ 
            ; this block called inside macro - update table record by id
            update-db-object table user-hash/id user-hash    
        ]
    ]
]
```

Will be expanded to this

```
update-user: func [
    user-hash
][
 conn: open-connection 
 update-db-object "users" user-hash/id user-hash
 close-connection conn
]
```

if we'd called some kind of `macroexpand` in `lisp`.

Is it clear now?

Oldes

[16:56](#msg56928d56a24f18cc0eae10ed)@KirillTemnov opening and closing connection for each db call is not efficient approach. But i understand that you are just looking for some real life example. Still dont understand why i should not use function inlining in such a case.

KirillTemnov

[17:00](#msg56928e11d739f50a3602bdec)@Oldes when we use inline function, it can use only local and global scope.  
Macro can use scope of code in which it can be inserted.

PeterWAWood

[22:48](#msg5692dfb7b1f439094a075d82)@KirillTemnov do you mean something like this?

```
ed>> o: make object! [
[    a: 1
[    f: func[code][do bind code 'a]
[    ]
== make object! [
    a: 1
    f: func [code][do bind code 'a]
]
red>> a: 2
== 2
red>> o/f [print a]
1
```

[22:51](#msg5692e05d5fd2ae3c32b4c4f1)@KirillTemnov Thanks for the further explanation. It would appear that you example could be duplicated in Rebol by using \[Prebol](http://www.rebol.com/docs/sdk/prebol.html) or Ladislav's include (I can't find a link to the docs at the moment).

Oldes

[23:26](#msg5692e898b1f439094a075e91)@KirillTemnov I'm not sure if inlined function could use only local and global scope... actually I would expect that it should be aware of the context as if it would be just called and not inlined.

## Monday 11st January, 2016

dockimbel

[08:10](#msg569363670712a5b63b4cad6d)@KirillTemnov \*\[...]That mean, that we can change program behavior in runtime with defining a new macro or applying existing to define new function.* Maybe you missed it, but Rebol/Red can do that natively at runtime without the help of any macros. The only stage where macros would be useful for Red is compile-time.

[08:11](#msg569363af87cb99b53b885582)@JacobGood1 Thanks for the proposal. You should be aware that only Lispers can understand it though, most of people here (including most of the rebolers) don't have such background.

KirillTemnov

[10:41](#msg569386c2ee13050b38a2cf02)@Oldes the difference between inline and not inline functions, that inline functions \*\*can be\** "pasted in" inside code. Take `swap` func from \[https://en.wikipedia.org/wiki/Inline\_function](wikipedia) and paste it to a program:

```
#include <iostream>

inline void swap(int & m, int & n)
{
  int temp = m;
  m = n;
  n = temp;
}

void inline_sample()
{
  int a = 10;
  int b = 42;
  swap(a, b);
  std::cout << "a = " << a << " b = " << b << std::endl;
}

int main()
{
  inline_sample();
  return 0;
}
```

`swap` translates `m` and `n` to `a` and `b` when it's called.  
But some c++ compilers may not follow `inline` instruction and define `inline` functions as regular (see standart description).

Regular functions are always translated to a separate blocks of code.

But macro can operate variables in scope, that it's pasted. Inline functions can't do it.

If we thy to use other variable (`c` in example below), we get an error message from complirer, because it defined in other scope (not local for `swap` and not global):

```
#include <iostream>

inline void swap(int & m, int & n)
{
  int temp = m;
  m = n;
  n = temp;
  c = -1;
}

void inline_sample()
{
  int a = 10;
  int b = 42;
  int c = 25;
  swap(a, b);
  std::cout << "a = " << a << " b = " << b << " c = " << c << std::endl;
}

int main()
{
  inline_sample();
  return 0;
}
```

We got error:

```
g++ main.cpp 
main.cpp:8:3: error: use of undeclared identifier 'c'
  c = -1;
  ^
1 error generated.
```

[10:43](#msg5693876bb1f439094a076ef2)I think that we need macro, that can have sumilar functionality as inline functions but can also use any variables in place, where it was pasted in.

Oldes

[10:45](#msg569387b70712a5b63b4cb314)Right, and it's also a reason why I consider function inlining to be more clean and safe.

KirillTemnov

[10:47](#msg5693883f8fdd3c0c382deab7)@dockimbel Yes, I know that. This feature is confusing me. I can not come up with a real-life example for macro, taking into account this functional of `Red`.

Oldes

[10:47](#msg56938849ee13050b38a2cf47)Actually I consider implementing compiler macros which just modifies code before compilation to be more simple to implement than function inlining, which should take care of contexts.

KirillTemnov

[10:50](#msg569388e9766922073602fea6)@Oldes if we can take any real `Red` code without macro and rewrite it with not existing `macro` command, that may be a very good starting point. My example with db is blunt :)

Oldes

[10:50](#msg569388f287cb99b53b885b41)@KirillTemnov as you \_cannot come up with a real-life example for macro\_, there is tons of places where could be used function inlining immediately.

KirillTemnov

[10:50](#msg5693890a8fdd3c0c382deacc)I agree

Oldes

[10:54](#msg569389eb5fd2ae3c32b4d716)As was mentioned... it is quite easy to add

```
#do
```

preprocessor into Red, as is used in

```
prebol.r
```

script, which would be able to do something like your

```
with-db
```

example. Even I could do it with some time, which I unfortunately cannot say about inlining even with weeks of time for it:/

KirillTemnov

[11:14](#msg56938ea45fd2ae3c32b4d7da)@Oldes I hadn't enough (yet) practice to understand how it works prebol `prebol.r`.

[11:16](#msg56938f0e766922073602ff69)@PeterWAWood yes.

JacobGood1

[17:30](#msg5693e6a95fd2ae3c32b4e896)@dockimbel that is why I tried to explain it like a tutorial, giving the necessary background so that rebolers could see the potential benefit. I was showing that, especially in Shen's case, macros are a powerful tool that are a natural fit to the language of dialects

[17:31](#msg5693e6e2b1f439094a0781e0)@Oldes some macro systems try to take care of contexts, they are called hygienic

[17:49](#msg5693eb2387cb99b53b886e2b)At the start of this thread, doc asked what type of debugging systems are currently present that facilitate the debugging of macros. The only debugging method that I know of from the land of lisp is macroexpand. Does anyone else know debugging tools that help with lisp macros?

## Tuesday 12nd January, 2016

PeterWAWood

[01:45](#msg56945aacee13050b38a2f6ff)@JacobGood1 In your Shen tutorial you explain that the syntax for quoted lists is different in Shen from that in other lisps. Could you explain the purpose of quoted lists to me as a non-lister?

[01:45](#msg56945ac3ee13050b38a2f704)Non-lisper

[02:29](#msg569464f5ee13050b38a2f843)From what I read it seems the purpose is to stop the list being evaluated similar to the purpose of a lit-word in Red. Is that correct?

JacobGood1

[16:37](#msg56952bbbd739f50a36031ed7)@PeterWAWood think of it just like a rebol block

pekr

[16:49](#msg56952eabb1f439094a07b86e)I will have to read it in two weeks, as I get more time, finishing our financial planning. But - how does macros differ from composing the code, having it in a block in literal form, then loading it, or creating a function dynamically? So far, I can't see any difference. I still think, like Doc, that is mostly makes a sense for the compiler. But what it would get us in the interpreter?

[16:50](#msg56952ecc0712a5b63b4cf993)I have to be extremely stupid, that with so many words written, I still don't get it. So far, it does not bring anything new onto the table, at all, well, at least imo.

[16:50](#msg56952eeaee13050b38a31830)In R2, we've been able to even modify the body of the already running function ...

JacobGood1

[16:54](#msg56952fbbd739f50a36032036)@pekr After you read my wiki let me know if you feel the same... in the mean time:  
:point\_up: \[January 9, 2016 4:39 AM](https://gitter.im/red/red/lisp?at=5690d54687cb99b53b881581)

pekr

[16:54](#msg56952fe187cb99b53b88a27c)Doc's answer is for the #do, which is kind of compile time preprocessor?

[16:55](#msg56953013d739f50a3603204e)I am more thinking in lines of your `max`example. It is kind of simple one, I like it. But I still think, how I would it today (note: I am a lame programmer)

[16:59](#msg569530fa0712a5b63b4cfa58)Hmm, not sure I can do it. I can construct new `max`function, composing dynamically the code like `(max 1 (max 2 (max 3 4)))`, returning it to the interpreter and/or `do`-ing it. But that's not most probably a useful thing .... at least not in the REPL

JacobGood1

[17:56](#msg56953e5b5fd2ae3c32b522f2)@pekr you are not extremely stupid nor are you a terrible programmer. Your words reveal to me that you are better than most programmers; humility means that you can learn something; it is an admirable character trait.

The max example is just a pedagogical tool, I think if you spend some time(read: a lot of time) with the Shen code it will click.  
Hang in there =)

pekr

[18:01](#msg56953f8e8fdd3c0c382e395d)I can imagine this kind of "preprocessing" for the compiler, but not for the REPL (interpreter). We would have to change the evaluator, so that the interpreter does not recognise, the result is being a result of the replacement?

JacobGood1

[18:23](#msg569544ad7669220736034993)Historically, in lisps, the repl was the program. There are stories that people would leave the repl open for months only programming in it.

## Wednesday 13th January, 2016

fort-ascension

[16:44](#msg56967eef04e908d302c3cb62)in Rebol, I've replaced the func function with another version which reports stats on it, on demand. the trick is that I did it by replacing the global word 'FUNC so all the current code now uses the "updated" version. I think this is a way of adding some debugging to your stuff to. its completely invisible.

[16:45](#msg56967f3d3ea4206d08bf5138)also, note that Rebol does not have Scope. binding is static and words actually have no global meaning. `reduce [ x x x ]` can actually return `[ 1 2 3 ]` which is something that 99% of the people miss about the language.

[16:46](#msg56967f6105627b590966f6b5)even 90% of rebolers ignore this.

[16:56](#msg569681aa04e908d302c3cb6f)

[17:03](#msg5696837804e908d302c3cb75)At the Rebol level, a word, is not a variable. something people often overlook. Words refer to a context explicitely and this is part of their value. AFAICT something ASTs cannot map 1:1 . each individual (literal) word in a block is a value in and of itself, and may refer to a different context and value. it is more than a "variable" placeholder.

[17:06](#msg5696841404e908d302c3cb77)again... I'm not bashing macros... I'm only giving, expert level knowledge on how Rebol insides work ... something I hope is also shared by Red. maybe you could leverage this aspect of Rebol in Red Macros, somehow.

JacobGood1

[17:09](#msg569684d559e3d04215bb89c7)watch the magic...

(defmacro magic  
\[x x x] -&gt; \[1 2 3])

(macroexpand \[x x x]) =&gt; \[1 2 3]

fort-ascension

[17:10](#msg5696850405627b590966f6bc)you do know that this and the above are totally unrelated?

[17:11](#msg5696853404e908d302c3cb7c):-)

JacobGood1

[17:11](#msg569685352bc35f6c1c19e1c1)do you know it? I think that saying 90% of rebolers do not understand their language is a little rude so I thought I would be a little flippent

fort-ascension

[17:12](#msg569685933ea4206d08bf5145)This is very low-level stuff which only a few of us completely grasp. it was not an evaluation about competence. the vast majority of Rebolers do not ever need to understand (nor even be aware of ) these things.

[17:13](#msg569685c3e1d8136135b87fc1)the Rebolers which are left, today, are mostly the 10% which have stuck with the language... because they 'get it :-)

JacobGood1

[17:13](#msg569685c92bc35f6c1c19e1de)how can you make such a sweeping statement though? Do you know that for a fact?

fort-ascension

[17:14](#msg569685f4e1d8136135b87fc2)yes, pretty much. I've been reboling for 20 years, and discovered a new binding trick just 3 months ago. this stuff gets very weird very fast.

[17:15](#msg5696863504e908d302c3cb80)Java implemented something similar (static binding instead of scope) just a few years ago... no one really knows or cares, cause its under the hood.

[17:17](#msg569686b63ea4206d08bf5148)again, I'm not belittling Rebolers. Most of us use and where attracted to Rebol because we don't \*have* to know about a lot of the low-level stuff. in fact many of us don't \*want* ;-) to deal with most of this stuff... which is why we build ourselves a dialect ... curse a bit... and forget about it again.

JacobGood1

[17:18](#msg569686d12bc35f6c1c19e21b)alright, sorry for being flippant then

fort-ascension

[17:19](#msg56968706e1d8136135b87fc5)you'd be surprised how few Rebolers actually fully understand PARSE (in both string and block mode).

JacobGood1

[17:19](#msg5696870ea03e28ad1ade7f48)I read that as you were saying 90% of rebolers are too dumb to grasp their language

[17:19](#msg569687165de13b3f15e2db69)but I see your point now

fort-ascension

[17:19](#msg56968725e1d8136135b87fc7)in fact, in the original docs, I think binding wasn't even covered!

[17:21](#msg5696878a3ea4206d08bf514b)unfortunately there is much too little formal references and documentation about the language. mostly its the platform and its function list which are documented... but the deep workings and concepts are little documented. :-(

[17:22](#msg569687c804e908d302c3cb83)Ladislav did a few (successful) attempts to flush them out... even doing magic with the struct! datatype (like implementing memcpy and stuff like that using them :-) )

[17:23](#msg5696881f04e908d302c3cb84)Carl originally marketed Rebol as the language for non programmers. it was in fact designed to be non technical and informal... so that label stuck for a long time... I think it still does.

[17:25](#msg569688743ea4206d08bf514e)but in commercial work, Rebol is robust and extremely effective. I have NLP stuff which analyses 20000 words a second, using massive 300 MB parse rules and commodity hardware.

[17:26](#msg569688da3ea4206d08bf5150)workers run for months, only requiring a restart when memory consumption corrupts them (a document too large to fit in memory is sent for analysis).

[17:27](#msg569688f404e908d302c3cb86)anyhow... back to macros :-)

[17:28](#msg5696892ee1d8136135b87fca)I think that in the process of compilation and macros, the binding will not be a big part of the equation, unless the macros can find a way to leverage them.

[17:29](#msg569689753ea4206d08bf5152)in your example above with binding... this could be possible:

(macroexpand \[x x x]) =&gt; \[1 2 3]  
(macroexpand \[x x x]) =&gt; \[x y z]

[17:30](#msg5696899e3ea4206d08bf5154)based on if the

(defmacro magic  
\[x x x] -&gt; \[1 2 3])

used x from one context or another.

[17:30](#msg569689ca04e908d302c3cb87)this is how Rebol dialect authors see things. (how I see it in any case ;-) )

dander

[18:03](#msg5696918d59e3d04215bb8cc8)@fort-ascension, it's interesting that you say that most people don't realize that Rebol has no scope, because for me coming from other scoped languages, understanding how scope works is extremely important. So when I saw people discussing this characteristic about Rebol, that makes me think that I need to have a firm understand of how binding works in Rebol/Red. I'm interested to know what allows users of the language to overlook this. Is it just that the default behavior works well enough that people tend to "fall into the pit of success"?

JacobGood1

[18:08](#msg569692955de13b3f15e2de1b)http://stackoverflow.com/questions/21964110/is-there-a-overall-explanation-about-definitional-scoping-in-rebol-and-red

[18:08](#msg569692b22bc35f6c1c19e491)@dander ^

dander

[18:17](#msg569694d559e3d04215bb8d9f)Thanks for the link @JacobGood1 ! I've attempted to read through that a couple times, but either have been too tired to focus or got interrupted. It helps to have a vote of confidence for the reference :)

JacobGood1

[18:30](#msg569697c03165a6af1a3b9336)@dander I would love to see more explanations of what I consider a very important topic but there is not that many. Hopefully with Red we will get books, tutorials, documents galore.

fort-ascension

[19:12](#msg5696a1afe1d8136135b88060)@dander a very simple way to look at it is like if every variable in C was a pointer of pointer of something. The "local" variable is pretty meaningless, the actual value is far away and boths its local reference and distant reference can change

[19:23](#msg5696a44405627b590966f737)I know @dockimbel once said he wasn't sure if he could completely replicate the way Rebol binding works, but it seems to me like he has. This is complicated (in some cases impossible) to compile though, so its very possible that not all code can be completely "unboxed", in the case this is fully implemented.

[19:24](#msg5696a466e1d8136135b88064)by unboxing, I mean to convert boxed Red values into pure machine native equivalents.

[19:53](#msg5696ab49e1d8136135b88079)@dander for a good reference about binding, the "infamous" bindology document, by Ladislav Mecir: http://web.archive.org/web/20150218034208/http://www.rebol.net/wiki/Bindology (probably the only real in-depth reference AFAICT) (I give a ref on the way back machine cause rebol.net has had outings lately).

dander

[20:00](#msg5696acdca03e28ad1ade886f)@fort-ascension thanks for looking that up! I'll try to spend some time with it when I get a chance.

fort-ascension

[20:45](#msg5696b77be1d8136135b880b6)btw, a funny fact not many Rebolers are aware of... It has been said that the original first ever Rebol (core v1 or v0.9 ?) had a "pure" lisp implementation (with different syntax, I guess). It was implemented by a famous Lisper I forget the name of.. someone famous like Paul Graham. Carl completely Re-implemented it after release because it had many performance issues, used too much RAM and it was complicated to understand by non experts.

[20:48](#msg5696b80504e908d302c3cc57)I remember the early versions of Rebol still had some remnants of this in "active" blocks which would auto-reduce when evaluated... it was scary. it was like quantum theory where the mere observing of the block changed it.

[20:48](#msg5696b83604e908d302c3cc58):-)

pekr

[20:55](#msg5696b9dc3165a6af1a3b9b0e)It was Joe Marshall. Carl later wrote to me personally, that he started project with internal name Contra, a rewrite of R1, which became R2, was much smaller including networking etc. , plus much faster .... but missed on things like tail recursion, etc.

[20:55](#msg5696b9dd59e3d04215bb957c)http://ll1.ai.mit.edu/marshall.html

JacobGood1

[22:50](#msg5696d4d159e3d04215bb9ab1)it is neat that we have rebolers that were here since the beginning

fort-ascension

[23:01](#msg5696d73e3ea4206d08bf5278)the first time I used rebol, 20 years ago, It was like I just re-opened my trs-80 (coco1) all over again. in minutes I was building guis and drawing stuff. I was amazed. Hooked for life.

[23:01](#msg5696d74e05627b590966f7aa)funny that I was designing my own language at the time, it was called plasma and Rebol's codename was Magma.. my design shared about 80% of the ideas of Rebol, so I decided to use Rebol instead. In Fact, Red is even closer to my original design, with its RS layer.

JacobGood1

[23:02](#msg5696d76b59e3d04215bb9b3b)I guess you are quite excited now then =)

fort-ascension

[23:06](#msg5696d8753ea4206d08bf527b)yep and since its open source, I can tailor the extra parts I need without starting from scratch :-)

[23:06](#msg5696d882e1d8136135b8810e)(and give back the parts which fit in)

pekr

[23:07](#msg5696d8bf59e3d04215bb9b65)@fort-ascension - are you our Max? :-)

[23:08](#msg5696d8d93165a6af1a3ba14f)Are you now interested in Red? IIRC, you were planning on the custom R3 build?

JacobGood1

[23:09](#msg5696d9373165a6af1a3ba15e)@fort-ascension Oh, back to the macro earlier, it expands based on syntactic patterns or based on what you decide(or both)...

(x x x) =&gt; (1 2 3) =&gt; would be an error since 1 is not a function unless, of course, you wrote a macro to dispatch when a number is at the front of a list.

For (x x x) to become (x y z) one would have to include some logic that determined when this would happen such as if it is invoked in a certain package(module, namespace), invoked in a certain function... etc.

Basically you can emulate contextual stuff but it is more automatic in rebol

[23:13](#msg5696da17c391361d48eaf3c5)I wrote macros a while back that allow me to do this in shen...

(1 + 1 * 3 / 4 + 4/5)

and it would actually rearrange that ^ to a proper lisp notation with the correct precedence according to standard mathematics

[23:21](#msg5696dbf4c391361d48eaf413)If we could, in red, write...

```
and it rearranged to this...
```

\[(pow 2 4) + (1 / 3 * 9) - (6 / 7)]

```
and finally became this...
```

(pow 2 4) + (1 / 3 * 9) - (6 / 7)\`  
it would give us a rough equivalent to Shen macros

[23:25](#msg5696dcd92bc35f6c1c19f274)very rough...

## Thursday 14th January, 2016

fort-ascension

[00:04](#msg5696e600e1d8136135b88122)@JacobGood1 have you used Rebol/Red a bit/a lot ? (just to know if I expand some stuff if I need to explain it more or less )

[00:05](#msg5696e63f04e908d302c3ccb8)@pekr yes I'm \*the* Max ;-) I did my "comming out" in the red/red list last week :-)

JacobGood1

[00:13](#msg5696e828c391361d48eaf5ea)@fort-ascension I have not used it that much. I did some things with red/rebol and programmed in reds for a little bit. I am not an expert by any means

fort-ascension

[00:15](#msg5696e8863ea4206d08bf5292)ok. are you aware of the `'IN` word?

JacobGood1

[00:15](#msg5696e889a03e28ad1ade9428)what I wrote up there will happen automatically every time someone placed a number in the first position of a block...  
\[1 2] bam! fires off  
\[+ 3] nothing happens normal block

[00:15](#msg5696e8b6a03e28ad1ade9432)not that I think that is a good idea I am just trying to get a point across

[00:16](#msg5696e8d859e3d04215bb9e06)@fort-ascension I do not think so...

[00:16](#msg5696e8ea59e3d04215bb9e09)it has been a while I might have forgotten a few words already

[00:17](#msg5696e8fcda358920486e8fb9)goodness... I wish 0.6 would come out!

fort-ascension

[00:20](#msg5696e9e1e1d8136135b88139)ok, `'IN` is a way you could leverage the context in macros. It returns a word from \*IN\*side a context, and assigns it to another word, unevaluated. its like assigning a pointer to another pointer var. amongst other things it allows you to check, or "steal" a word from another context in order to do funky things. using something like this you could actually differentiate the patterns not only on the token labels, but their bindings.

[00:21](#msg5696ea1a3ea4206d08bf5295)note that this is irrelevent from the value it holds at run-time. it would be the binding of the word at compile time.

[00:22](#msg5696ea3de1d8136135b8813a)this is a perfect place to track which words from which datasets and macros end up where up/downstream the transformation.

[00:23](#msg5696ea6605627b590966f7d6)this can be used in dialecting, to differentiate if a word was meant as a keyword or a value... even if the word in the block is the same word.

[00:23](#msg5696ea7404e908d302c3ccc6)(but bound to a different context).

asampal

[03:02](#msg56970fcf04e908d302c3cd00)@JacobGood1 , this is what @fort-ascension is talking about:

```
>> a: [x x x]
== [x x x]

>> b: object [x: 2]
== make object! [
    x: 2
]

>> c: object [x: 3]
== make object! [
    x: 3
]

>> d: object [x: 4]
== make object! [
    x: 4
]

>> a/1: in b 'x
== x

>> a/2: in c 'x
== x

>> a/3: in d 'x
== x

>> a
== [x x x]

>> reduce a
== [2 3 4]
```

[03:03](#msg56970ffd05627b590966f801)kind of cool when you first see it

JacobGood1

[03:04](#msg5697103c28b4586d1c8c8a07)Yea, I had read up on binding already and got an understanding of it. I had not heard of in though... thanks for the example

[03:04](#msg5697104c59e3d04215bba24a)we still need macros =)

[03:07](#msg569710dc2bc35f6c1c19f860)@asampal you are a clojure programmer right?

asampal

[03:07](#msg569710fd3ea4206d08bf52c9)I like to play around with it, but I wouldn't call myself a "practitioner"

[03:07](#msg5697110a3ea4206d08bf52ca)but I do love it

JacobGood1

[03:08](#msg5697113b28b4586d1c8c8a20)did you, by any chance, check out Shen macros?

asampal

[03:09](#msg56971169e1d8136135b88181)no, haven't looked at them closely yet - much different than CL ones?

JacobGood1

[03:11](#msg569711e7da358920486e9420)yes, they made me think differently about programming yet again

asampal

[03:12](#msg569712343ea4206d08bf52cc)this, you mean? http://www.shenlanguage.org/learn-shen/macros.html

JacobGood1

[03:12](#msg5697123959e3d04215bba27d)yes

asampal

[03:13](#msg56971263e1d8136135b88183)that seems to mention reader macros not "regular" macros - would they not be equivalent (or close) to CL's reader macros?

JacobGood1

[03:13](#msg56971272c391361d48eafab6)They are more like reader macros

asampal

[03:15](#msg569712cce1d8136135b88186)well, I would like both read and regular macro support in Red, if possible - they are two different things

[03:15](#msg569712e604e908d302c3cd08)not sure what @dockimbel has in mind

JacobGood1

[03:15](#msg569712eada358920486e9441)@asampal I basically give a tutorial of them in here in this unfinished rough proposal: https://github.com/red/red/wiki/Macros(SPEL:-semantic-programming-enhancement-logic)

asampal

[03:21](#msg5697143ee1d8136135b88188)I'll look over what you've got when I have a few minutes. Don't know if you've seen that Clojure, for example, doesn't allow user defined reader macros though it does come with some "in the box". I think Rich considers them a bit dangerous, though there seems to be community demand.

JacobGood1

[03:22](#msg5697147bc391361d48eafafe)yea I have programmed quite a bit in clojure as well, I do not like it when power is reduced for fear of danger...

dockimbel

[07:40](#msg569750f4a03e28ad1ade9deb)@JacobGood1 I think that the math expression macro example is a good one, as it could be really used in practice. @pekr Such macro would expand at compile time, so costs nothing at runtime. Comparatively, in Rebol, you would have to convert it at run-time, suffering memory and performance overhead. So basically, macros wouldn't give you anything new you can't already achieve with regular Rebol/Red code, but they enable you to shift the computation out of run-time, which is the real advantage.

pekr

[08:24](#msg56975b295de13b3f15e2fa25)@dockimbel I am not sure @JacobGood1 would agree about the runtime, but of course, my understanding might be completly wrong. I am not sure, how Rebol/Red evaluator works, but what imo guys envision is the macros being a first class type for the DO evaluator. I mean - I am not sure how DO evaluator works in particular, but when it reaches a function, it knows some parameters will follow. There would be other type, called macro/spel, which would unwind and change the code and then reevaluate, so basically, in upper layers, you would not even know, that macro was applied.

[08:25](#msg56975b6dda358920486e9ae9)But maybe my imagination of Rebol/Red internals is twisted and even if my above description would be possible, I am not sure anyone would like to complicate rather simple DO evaluator and aslo not sure about security and debugging such stuff ...

Oldes

[08:56](#msg569762d42bc35f6c1c1a003f)@JacobGood1 just a detail, but

```
[2^4 + 1/3 * 9 - 6 / 7]
```

should become

```
18.1428571428571
```

and not

```
(pow 2 4) + (1 / 3 * 9) - (6 / 7)
```

.

[08:57](#msg569762e32bc35f6c1c1a0041)Also I cannot agree with your claim: \_what I wrote up there will happen automatically every time someone placed a number in the first position of a block..._

[08:57](#msg5697630759e3d04215bbaa20)you probably have no idea how often I write blocks with numbers inside, which I don't want to evaluate in any way.

[08:59](#msg5697636328b4586d1c8c9217)Also it is easy to write macro like:

```
#do [parse-expression {2^4 + 1/3 * 9 - 6 / 7}]
```

If you would need it so much.

[09:00](#msg569763b859e3d04215bbaa37)Note that I used string because

```
1/3
```

is not valid syntax and so would not be loaded if used in block as you do.

[09:08](#msg56976595a03e28ad1adea082)

```
>> do http://www.rebol.org/download-a-script.r?script-name=parse-expression.r
connecting to: www.rebol.org
Script: "Mathematical Expression Dialect Parser" (21-Mar-2011)
>> expr: parse-expression "2**4 + 1/3 * 9 - 6 / 7"
== [subtract add power 2.0 4.0 multiply divide 1.0 3.0 9.0 divide 6.0 7.0]
>> do expr
== 18.1428571428571
```

[09:20](#msg5697684828b4586d1c8c92d9)

```
>> expr: parse-expression "2**4+1/x*9-6/7"
== [subtract add power 2.0 4.0 multiply divide 1.0 x 9.0 divide 6.0 7.0]
```

[09:29](#msg56976a95a03e28ad1adea128)The problem is, that it would not make things faster as even if result of parsed expression would be inlined into code for compiler using to

```
#do
```

directive, it will now probably just use calls to native functions

```
subtract, add, power...
```

if they even exists in Red, which would be slow as these would not be inlined in any way, which is what I'm advocating to be done before some other sorts of macros.

JacobGood1

[15:21](#msg5697bcebda358920486eabb4)@Oldes it was just an example, I am not advocating that anyone actually make a macro like that. The idea is that, we could do things like that, not that we should. It is the potential power that we should be interested in, not singular examples of that power. I am sure plenty of people would never write a macro that automatically evaluates blocks of numbers...

[15:24](#msg5697bd9c5de13b3f15e30b63)The macro I made works very well in lisp, but that is because of assumptions that are made when writing list style syntax. Those assumptions being, that a function presides at the first element of the list. Since a function is not present; a number is instead, we can use that assumption to our advantage and treat numbers as if they were functions themselves.

fort-ascension

[15:25](#msg5697bdf3e1d8136135b88300)if the macros system is built into the compiler, then the function calls can be replaced by the compiler more easily. when they get reduced to simply functions, an optimising compiler will decide if and when it should inline. you should NOT always inline, it has to fit into an execution Cache line. otherwise parts of the optimisation are already lost IIRC.

Oldes

[15:39](#msg5697c12f28b4586d1c8ca38a)I repeat it again.. it's the function inlining, which is the most clear and simple to have function, which may be inlined, but does not have to... without any magic spells around... yes.. I can imagine spells which modify source code as being processed, but so far I've got no much useful scenario. It will not happen before Red 2.0 anyway.

pekr

[15:50](#msg5697c3b72bc35f6c1c1a125f)@JacobGood1 - please make it clear. Do you envision macros/spels only for the compiler stage, or also for an interpreter? Because as far as interpreter is concerned, I can't see how it could work without the modification of the evaluator (DO), which would recognise the spel (as it does with func), and unpack/expand it and run from the same place again ....

JacobGood1

[16:19](#msg5697ca92da358920486eaf22)@pekr to a lisp programmer they are all the same. From Paul Graham's essay on what made lisp different...

```
9. The whole language always available. There is no real distinction between read-time, compile-time, and runtime. You can compile or run code while reading, read or run code while compiling, and read or compile code at runtime
```

http://www.paulgraham.com/diff.html

[16:20](#msg5697cab5c391361d48eb1607)hmm

[16:20](#msg5697caba5de13b3f15e30ee6)I cant make that a 9

[16:20](#msg5697cad02bc35f6c1c1a140e)lol, ill make it look like code =)

pekr

[16:20](#msg5697cad63165a6af1a3bc389)well, but Red is not like that it seems ...

JacobGood1

[16:21](#msg5697cafec391361d48eb1615)not at the moment, no

[16:25](#msg5697cbf7da358920486eaf7d)I posted this earlier but this is what red should strive to achieve; interactivity as good as lisp.

https://baltazaar.wordpress.com/2009/07/20/a-story-about-lisp-remote-debugging/

[16:25](#msg5697cc153165a6af1a3bc3d0)Once we are settled about macros we should move on and talk about more features we could rip from lisp

[16:28](#msg5697cc9c5de13b3f15e30f6c)Also, for inspiration, this is a famous lisp article: http://www.paulgraham.com/avg.html

[16:28](#msg5697ccafa03e28ad1adeb3df)famous in the sense of lisp programmers, lol

## Saturday 16th January, 2016

JacobGood1

[15:38](#msg569a63fb5de13b3f15e36d59)Does anyone know about CLOS(common lisp object system?)

[15:40](#msg569a6461da358920486f0f00)I was wondering if we could rip some ideas from it as well... I will explain later though, I have to go afk

[15:40](#msg569a64842bc35f6c1c1a721e)in the mean time... http://www.gigamonkeys.com/book/object-reorientation-generic-functions.html

ghost~5680c5f416b6c7089cc058a5

[15:44](#msg569a6541a03e28ad1adf12af)https://en.m.wikipedia.org/wiki/Common\_Lisp\_Object\_System provides a general minimal introduction for those who don't have time to go through

[15:44](#msg569a6548da358920486f0f1a)Jacob's link

KirillTemnov

[20:47](#msg569aac66da358920486f195d)@JacobGood1 I've wrote some code with CLOS.  
\*In short\*:  
We defune structure (`defclass`), interfaces (`defgeneric`) and methods on it (`defmethod`).  
Class types passed into methods, so methods can be defined in any plase of code.  
As far as I remember, after defining a new method all class instances (including existing) will be applyed with this \*new* method.

In `Rebol` we got almost same result with `context` except:  
\- methods must be defined inside `context`. Maybe we can achieve similar behavior with `bind`, but I don't know it good enough.  
\- if we redefine class with `context`, existing objects will not have new functionality:

```
test-o: context [
     a: 5
     show: does [print a]
]
x1: make test-o []

test-o: context [
     a: 5
     show: does [print a]
]
x2: make test-o []

x1/show
; 5
x2/show
; a = 10
```

fort-ascension

[20:55](#msg569aae46e1d8136135b88af4)where do you get `a = 10` from?

[20:55](#msg569aae4f04e908d302c3d684)not sure I get your example

KirillTemnov

[21:01](#msg569aaf9259e3d04215bc2754)typo in second definition

fort-ascension

[21:01](#msg569aafba3ea4206d08bf5ca4)ok :-)

KirillTemnov

[21:02](#msg569aafd4da358920486f19d0)

```
rebol
test-o: context [
     a: 5
     show: does [print a]
]
x1: make test-o []

test-o: context [
     a: 10
     show: does [print ["a = " a]]
]
x2: make test-o []

x1/show
; 5
x2/show
; a = 10
```

[21:02](#msg569aafe95de13b3f15e377b2)now seems fine

fort-ascension

[21:03](#msg569ab015e1d8136135b88b03)and I guess you meant to show/explain that x1/show doesn't adopt the new method of test-o?

[21:03](#msg569ab03d05627b5909670129)after redefinition of test-o

KirillTemnov

[21:45](#msg569aba033165a6af1a3c2d7a)@fort-ascension yes, I meant it

JacobGood1

[23:59](#msg569ad9685de13b3f15e37cb8)@KirillTemnov I know what clos is, I was just trying to get a discussion going for more lisp features

## Sunday 17th January, 2016

JacobGood1

[00:01](#msg569ad9c92bc35f6c1c1a810c)I am going to be real busy for a few days, I will have to talk about it later

[00:01](#msg569ad9d259e3d04215bc2c2e)talk again in about 5 days

## Thursday 21st January, 2016

JacobGood1

[20:46](#msg56a143bf59e3d04215bd2868)back... whoa nothing happened while I was gone

## Friday 22nd January, 2016

dockimbel

[04:53](#msg56a1b5c4a03e28ad1ae02f51)Pretty quite on all channels in the last days.

## Monday 1st February, 2016

maximvl

[04:22](#msg56aedd77aaae7a3a759443e7)so guys, what've you decided about reader macros?

dockimbel

[05:24](#msg56aeec058fbaf4220afa7f98)No decision yet, as macros are not the current focus. Though, for the reader macros, I am not sure it is really required to have a "macros system" for them as they can be trivially added to the Red reader (called `load` in the Rebol world).

[05:24](#msg56aeec24eaf741c118d60e7c)Here's an example of how to modify `load` at runtime to inject a preprocessing step:

[05:25](#msg56aeec46c54bc2bf180d346d)

```
lisp
pre-load: func [src part][
    parse src [any [remove comma insert #" " | skip]]
]
load: func spec-of :load body: body-of :load
insert find body 'either bind [pre-load source part] :load
```

[05:26](#msg56aeec7deaf741c118d60e88)You can copy-paste that in a Red console and you'll get all the commas in the input replaced by space character (an old wish from many rebolers ;-)).

[05:26](#msg56aeeca0c54bc2bf180d3477)

```
lisp
red>> [1,2,3,abd,"hello"]
== [1 2 3 abd "hello"]
```

maximvl

[05:35](#msg56aeee9cdc33b33c75490ace)@dockimbel the way you can change the body of function is awesome

[05:41](#msg56aef002dc33b33c75490ae7)&gt;temporary required until dyn-stack implemented

[05:41](#msg56aef01080ad69394a7b9dcb)@dockimbel what is the dyn-stack? will we have dynamic bindings?

dockimbel

[05:48](#msg56aef192dc33b33c75490b04)@maximvl We \*already* have the dynamic bindings support. ;-)

PeterWAWood

[05:49](#msg56aef202586242210ae0b678)@maximvl Did you see the post by @asampal at 11:02 on 14th Jan?

dockimbel

[05:50](#msg56aef22deaf741c118d60f0b)`dyn-stack` branch is for improving the compiled code ability to call functions in non-trivial cases, to match what the interpreter can do. This would require to defer those cases to a \*smarter* Red internal execution stack, which would solve them at run-time. Though, still a lot of work is required there to achieve it, so, far from ready to use.

[05:53](#msg56aef2bdaaae7a3a759445b0)@maximvl In my above example, the `load:` redefinition is required because the function is compiled in the runtime. For non-compiled functions, you would skip that step.

[05:55](#msg56aef36baaae7a3a759445c1)The above code could be easily extended with a few more lines to give you full reader macros support.

xaduha

[13:14](#msg56af5a258fbaf4220afa8f3d)Speaking of macros... It's not about Red, but it's still a great piece of creative writing on the subject

https://github.com/masak/007/blob/master/README.md

http://masak.github.io/007/

maximvl

[14:47](#msg56af70038fbaf4220afa9770)@dockimbel wow, that sounds great! =)

## Tuesday 2nd February, 2016

dockimbel

[03:34](#msg56b023d8dc33b33c7549449e)@xaduha Very cool. :)

## Saturday 13th February, 2016

JacobGood1

[13:54](#msg56bf35a938f56aa31f39b71a)Here is a post that advocates for multimethods in a much more familiar manner(it uses non lispy languages mostly to explain their advantages) http://journal.stuffwithstuff.com/2011/04/21/multimethods-multiple-inheritance-multiawesome/

## Monday 15th February, 2016

pericranium

[03:57](#msg56c14cbbfa79226456fa65c9)@JacobGood1 Thanks Sir! :)

JacobGood1

[18:39](#msg56c21b57bc5dee6c04257326)Another paper which discusses how to implement them in a manner that delivers good performance(theoretically it has not been tried to my knowledge, though it will be)

this paper uses CL, but I feel that it is more digestible since a lot of the concepts are explained abstractly:  
http://metamodular.com/generic-dispatch.pdf

[18:40](#msg56c21bb3bc5dee6c04257344)The key is defining methods outside of objects as discussed in the previous post, this removes many problems from oop dealing with multiple inheritance

[18:43](#msg56c21c4638f56aa31f3a1f73)it would be nice, however, if we define a method that it is still accessible using the path syntax...

```
hi: defmethod [a [some-object!]] [print "hi!"]
there: make some-object! []

there/hi => hi!
```

[19:03](#msg56c221104dfe1fa71ffcf2e7)btw, ^ this implies that we have objects of different types that are create-able by the user...

We already have things like this in red where one function operates differently based on the object/type that is given to it(polymorphism, yay), this is a way to give that power to the user

multimethods can dispatch based on a variety of rules, not just the type of a reciever, check the above post ^^^

## Monday 22nd February, 2016

ghost~5680c5f416b6c7089cc058a5

[07:55](#msg56cabed9d12993d96556f921)http://xen.garden/wp/?p=25

[07:55](#msg56cabf0d631af87d5c44e1a1)^^^ regarding lisp macros (haven't read it yet, it had the word macro in it so I posted it :wink: )

dander

[08:42](#msg56caca04631af87d5c44e2ee)@JacobGood1 That article on multimethods is very interesting, and helped my understanding of them quite a lot. Defining methods outside of objects like that is exactly what C# does with extension methods (which the author of that article mentioned). C# flags a method as being an extension method by qualifying the first argument with 'this'. I don't know if there are other reasons for preventing all static methods from being potential extension methods beyond just avoiding adding too much stuff to the object namespace.

```
public string hi(this SomeObject thing) { ... }
there.hi()
```

It's not clear to me if something similar would work in red. Do the \[red/system function attributes](http://static.red-lang.org/red-system-specs-light.html#section-6.3) apply to red as well?

[08:46](#msg56cacaf3ddb99257675417ca)one other thing this reminds me of is the infix methods. I recall something about red allowing definition of infix methods for things other than mathematical operators, but that it's generally not recommended. I don't think I'm familiar enough with red to understand all the rational behind that

[08:53](#msg56cacca05c3b0559674dc8b4)being very familiar with C#, I would say that being able to extend base classes with extensions has made a huge gain in expressiveness for that language (for example, \[linq](https://www.simple-talk.com/dotnet/.net-framework/linq-secrets-revealed-chaining-and-debugging/#third) wouldn't exist)

pekr

[10:51](#msg56cae83f1aea4f306752d62e)In Rebol/Red, there is a 'set for objects, which allows to have them available from the global space. I know it is a different aproach, but just a note to those, who eventually don't know about the feature ...

JacobGood1

[15:27](#msg56cb28e8631af87d5c44f4f8)@dander yes, extension methods are nice(I was introduced to them from xtend), but multiple-dispatch/multi-methods is what we really want.

[15:28](#msg56cb2932d12993d965570d03)with a little syntax sugar that makes them appear as if they were wrote from within the object/class(like extension methods)

dander

[22:03](#msg56cb85c4d12993d96557257b)@JacobGood1 I can see that the multiple-dispatch/multi-methods are another level above extension methods in power (are multi-dispatch/multi-methods distinct concepts, or just different names for the same concept?). I guess what I was wondering was whether it would be desirable to allow invoking any method that has a first argument of the correct type on an instance of that type as per your example, or whether there should be some explicit flag that allows that (like extension methods)... or is this just an implication of supporting multi methods in the language?

JacobGood1

[22:12](#msg56cb87e9568360a24892e478)@dander yes, they are basically synonyms...whether there is some flag or not is up to doc. I prefer allowing the path syntax to be an over all alternative method of invocation vs calling the function first; I think it greatly simplifies code completion for a language(I really like the . syntax/methodology even though I like lisp)

dander

[22:24](#msg56cb8aa3d12993d9655726a2)That makes sense to me. I think the advantage of using the .syntax is that it changes how you mentally model a chain of operations. Rather than a stack of operations, where the last thing that happens comes first, you can write it out as a queue, which at least for me, is easier to read  
actually, that's something that interests me about infix methods, but I think there may be some pitfalls there that I am not seeing

## Tuesday 23th February, 2016

rebolek

[06:28](#msg56cbfc15bd660af56c725e60)@dander While Red does not have dot syntax, you can easily simulate in with `bind` and it’s also more readable IMO:

```
>> x: context [val: 23 add: func [x] [val: val + x] sub: func [x] [val: val - x]]
== make object! [
    val: 23
    add: make function! [[x][val: val + x]]
    sub: make function! [[x][val: val - x]]
]
>> do bind [add 3 sub 5 add 7 sub 12] x
== 16

>> x
== make object! [
    val: 16
    add: make function! [[x][val: val + x]]
    sub: make function! [[x][val: val - x]]
]
```

dander

[07:02](#msg56cc040fd12993d9655735bc)@rebolek very interesting. Thank you for the example!

## Sunday 15th May, 2016

ghost~5680c5f416b6c7089cc058a5

[08:48](#msg573837f80cb634927f7efe91)HostileFork wrote a blog post on the topic of macros -

[08:48](#msg573837fbe2996a5a42c87f6c)http://blog.hostilefork.com/rebol-vs-lisp-macros/

JacobGood1

[12:48](#msg5738703b0cb634927f7f05bb)Although, he only touched on a single type of macro found in common lisp he did come to a correct conclusion about that portion of macrology...

"It comes down to this: though it's easy for Rebol functions to remix code fragments originating from a calling context, there's a \*\*speedbump\** on making new code that acts like it originated from a calling context"

dockimbel

[14:07](#msg573882a08b845b284193fd16)@JacobGood1 `bind` could be extended to support binding to a list of contexts in a given order, reproducing the definitional scoping effect, and making that speedbump disappear.

## Monday 27th June, 2016

maximvl

[13:35](#msg57712b97265214c130780adb)btw what are you thoughts regarding condition/restart system?

## Sunday 3th July, 2016

JacobGood1

[17:59](#msg5779526626ff03984abe708a)@maximvl Who are you asking? It is the best error handling system that I have ever played with but, I am sure that I have not played with every error handling system out there.

## Monday 4th July, 2016

dockimbel

[04:25](#msg5779e52326ff03984ac493d6)@maximvl I've never used it, though it looks very interesting. I'll give you some feedbacks once I find some spare time to see if it could work fine with Red semantics and fit our goals.

maximvl

[15:04](#msg577a7aeaf06cda5d097f0535)@JacobGood1 same for me, the thing is this is not just error handling system, this is a whole thing to jump around the stack in both directions

[15:04](#msg577a7afd64638562096feb30)so it's very powerful, errors handling is just a layer on top of it

[15:05](#msg577a7b29584c2e775bd590c9)@dockimbel it would be cool, thanks!)

[15:16](#msg577a7dc24bee5c57091ebcd9)one of nice examples - code which makes a continuous action and sends signal with a progress data

[15:16](#msg577a7de74bee5c57091ebfe8)so in GUI app you can set handler for that signal type and show progress filling the bar

[15:17](#msg577a7e0869ed53d81425a460)in terminal app you can write a handler to make some ascii art progress, or just show number and percent

[15:17](#msg577a7e0b4bee5c57091ec056)etc

gour

[15:30](#msg577a81156463856209705422)how would you compare Red with Racket for writing multi-platform (desktop) GUI app? performance i not unimportant although for some computations we would bind 3rd party C lib for critical parts?

maximvl

[15:37](#msg577a82bb4fd3816109914112)I can say that Racket is great right now, though Red will become better at some point of time

pekr

[15:54](#msg577a86ce4bee5c57091f4bce)Those are rather different syntaxes. Although many claim, that Rebol-line languages are kind of Lisp descendants, me, as a beginner, have difficulcy to follow Racket code. But - that's probably the same for any language you start with ...

gour

[15:57](#msg577a876169ed53d814264170)@maximvl do you find they're somehow comparable? i admit that i do not have any experience with the Lisp-family of languages, but admit e.g. Racket's simplicity of (regular) syntax, its ecosystem etc. Otoh, Rebol/Red are also a bit 'strange' for non-experienced, so wonder which style could make me more productive and/or provide more fun for working on hobby (open-source) project(s)

[15:58](#msg577a878f4fd381610991910a)@pekr what are some languages you are familiar with?

pekr

[15:59](#msg577a87cf4bee5c57091f5a61)nowadays, only Rebol/Red, some JS. In the past Visual Basic, CA Visual Objects.

maximvl

[15:59](#msg577a87e04bee5c57091f5b09)I would write apps in Racket and learn Rebol/Red for the future

[15:59](#msg577a87f1f06cda5d097fdcdc)(and this is almost what I do)

[16:00](#msg577a88064bee5c57091f5f82)but, of course, I know Racket now

gour

[16:01](#msg577a886169ed53d814265601)@maximvl have you done something with Racket's GUI? i wonder how complete it is for desktop apps and comparing with Red's GUI capabilities?

maximvl

[16:01](#msg577a88714fd381610991a360)without experience with lisp languages it will not be easy

[16:02](#msg577a88924fd381610991a3af)because I just looked though docs for analogues of CL functions I would use

pekr

[16:02](#msg577a8892584c2e775bd66b59)I am sure Doc will look (and also already did so) into many available languages and ecosystems in general. I was quite negatively shocked by the reactions with the Reddid post - so much of hatred. I suggest ppl to use what they like. It is difficult to win someone, apart from having good examples, docs, good and friendly community

maximvl

[16:02](#msg577a88b34bee5c57091f6350)@pekr which reddit post?

gour

[16:03](#msg577a88b94fd381610991a438)@pekr which Reddit post?

pekr

[16:04](#msg577a88f4584c2e775bd66e8c)https://www.reddit.com/r/programming/comments/4r0li7/red\_programming\_language/?ref=share&amp;ref\_source=link

maximvl

[16:04](#msg577a89273ac2a2dc1435ccaf)@gour I did life game GUI in Racket, but it is not only about GUI, Racket has asynchronous things, IO, and other stuff ready to use right out of the box

pekr

[16:04](#msg577a8929646385620970dfd7)MrDevil was kind of bold too. That's probably how not to promote a language - to claim how much better it is, than others ...

maximvl

[16:06](#msg577a898c3ac2a2dc1435d13f)&gt;but I'm curious how one best structures a Red program?  
&gt;There is no one best way.

[16:06](#msg577a898ff06cda5d097ff8cb)this is a good one

[16:07](#msg577a89d63ac2a2dc1435d262)people used to have a guidelines and best practices for everything, Rebol/Red gives you a lot of freedom, which can lead to confusion or power, depending on your vision and skills

gour

[16:08](#msg577a8a053ac2a2dc1435d2f0)@maximvl i did read about Racket, have Realm book, looked at Pollen, Slideshow, Typed Racket, but having GUI built-in is something which I really like and was the reason I abandoned several other statically-compiled langauges due to poor/limited GUI support...it's kind of strange that if one wants decent GUI support, one has to use Python :-)

[16:08](#msg577a8a0ef06cda5d097ffa42)@gour is reading reddit comments

maximvl

[16:11](#msg577a8aa6646385620970fa0f)@pekr I don't actually see a lot of hatred, one guy complained about syntax and thats it

gour

[16:11](#msg577a8acd3ac2a2dc1435de04)i also wonder about the mentioned 'hatred' in the comments :confused:

dockimbel

[16:12](#msg577a8aef69ed53d814268190)@maximvl @gour I can only hear good things about Racket, I will definitely look more into it to see what good features we could adapt for Red.

pekr

[16:12](#msg577a8b044fd381610991ddc9)I used my right to report one message, as calling someone a littel arogant c.nt is not what I want to see in such discussions ;-)

dockimbel

[16:14](#msg577a8b4eef3990705ba5ebbb)I find the comments on that Reddit entry rather good, it can be way worse than that when it's about programming languages. ;-)

pekr

[16:14](#msg577a8b55ef3990705ba5ebcd)I think, that most of those reactions are in fact natural. When new stfuff appears, which could be potentially better than what we already know, we feel kind of unsafe - should I learn this new stuff and start from the scratch again?

[16:15](#msg577a8b8f584c2e775bd69eda)Well, we should win ppl via nice demos, as those which appeared with 0.6.1 (or the one you are still cooking ;-) ), and not via claims that Carl invented the programming wheel :-)

maximvl

[16:19](#msg577a8c82584c2e775bd6abda)@dockimbel I can name you some more or less unique things: pattern matching, contracts, all (or almost all) known things for parallel/async computations, sandboxes, security guards, custodians

gour

[16:19](#msg577a8cadef3990705ba60370)@dockimbel am i right that Red's compiler should/could produce better performance code although I hear that Racket's JIT is very good considering Red has real compiler?

dockimbel

[16:20](#msg577a8cb13ac2a2dc14360467)Contracts as in DbC?

maximvl

[16:20](#msg577a8ce14fd381610991fcaf)continuations too, but this is rather debatable feature: http://www.nhplace.com/kent/PFAQ/unwind-protect-vs-continuations-original.html

[16:21](#msg577a8cfc584c2e775bd6b51b)@dockimbel I don't know that's DbC

dockimbel

[16:21](#msg577a8d0a3ac2a2dc14360999)Sorry, Design by Contract.

[16:24](#msg577a8dcc6463856209712896)Code generated by Red's compiler is very far from its potential, we will gain a x2-4 using an optimizing backend, then a x5-50 boost from statically typed code (especially on expressions involving only scalar values, like numbers). Then last thing will be the JIT compiler (probably a tracing JIT), though that's for Red 2.0, it will help speed up some code parts that can't be processed by an AOT compiler.

maximvl

[16:25](#msg577a8e0c584c2e775bd6d1d3)well contracts in Racket are like tests for the ins/outs of the function

dockimbel

[16:26](#msg577a8e3164638562097129d7)Ah, so it's \[DbC](https://en.wikipedia.org/wiki/Design\_by\_contract). ;-)

greggirwin

[16:26](#msg577a8e416463856209712c5a)That's DbC

dockimbel

[16:27](#msg577a8e583ac2a2dc143612eb)DbC is on my todo list. ;-)

gour

[16:27](#msg577a8e594bee5c57091fd82f)@maximvl do you consider Racket's performance "good-enough" ?

maximvl

[16:27](#msg577a8e6e3ac2a2dc1436178c)for what I did - yes, but there were mostly pet projects

greggirwin

[16:27](#msg577a8e7f6463856209712f98)I've thought just a bit about pattern matching, which is something we can do easily in Red.

dockimbel

[16:27](#msg577a8e876463856209712fab)If John Carmack uses it, I guess it can only be good enough for mere mortals. ;-)

maximvl

[16:28](#msg577a8e976463856209712fd4)besides they are working hard to optimize things, I believe it became much better in past years

gour

[16:28](#msg577a8e9cf06cda5d09803659)that's a good point ;)

[16:28](#msg577a8eb169ed53d81426c9ad)John uses it for some server stuff, right?

dockimbel

[16:28](#msg577a8eb564638562097130dd)Yep, and he said that he liked it. He uses it for teaching programming to his son.

greggirwin

[16:29](#msg577a8ece69ed53d81426ccd4)I have an old `like?` function and `awk` dialect, and a thin tuplespace style matcher I've done in the past.

maximvl

[16:30](#msg577a8f14584c2e775bd6e7ef)Racket is like a Smalltalk, you use it when you want a full featured environment where you are like in a chair next to a fireplace, lighting up a cigar, you don't worry, you know everything is here in its place :)

dockimbel

[16:30](#msg577a8f1aef3990705ba62d8c)Pattern matching is pretty trivial to implement in Red, but we might want to put the bar higher if possible there.

greggirwin

[16:30](#msg577a8f2d584c2e775bd6e832)None of mine do binding from the match though, which is the trickier part to make easy I think.

maximvl

[16:31](#msg577a8f563ac2a2dc14362d19)it would be nice

gour

[16:31](#msg577a8f5769ed53d81426d2c5)@maximvl i was interested for some time in Pharo, but got feeling that it's a bit slow...besides that deploying, version-control etc. still looks a bit strange

maximvl

[16:32](#msg577a8f824fd3816109921961)yea, and you can't deploy it to AWS or Heroku, I know

[16:33](#msg577a8fc1f06cda5d09806094)but still, this is the price, even Racket doesn't have comparable debugging facilities

gour

[16:33](#msg577a8fe669ed53d81426d7a6)@maximvl comparable to what?

maximvl

[16:35](#msg577a9057ef3990705ba644bd)to Pharo

gour

[16:36](#msg577a908369ed53d81426e1b8)ahh, ok. Smalltalk is really heaven for devs

maximvl

[16:36](#msg577a909b64638562097152c7)until you need a real-world app, yes

gour

[16:36](#msg577a90a3584c2e775bd6f66a):-)

maximvl

[16:37](#msg577a90cbef3990705ba651ce)what's why I'm learning Red

gour

[16:39](#msg577a915c4bee5c5709200e41)to deliver real-world apps?

[16:40](#msg577a91704fd3816109923ce2)isn't Racket also able to package the whole executable?

[16:40](#msg577a919af06cda5d09807d5d)btw, how is Rebol/Red's support in vim?

pekr

[16:41](#msg577a91bd69ed53d81426ef0f)I like this doc - the combination of examples, explanation, images .... https://docs.racket-lang.org/quick/

gour

[16:43](#msg577a9249584c2e775bd7218d)@pekr Racket's doc is really high-quality :thumbsup:

greggirwin

[16:46](#msg577a9302584c2e775bd73300)I think the maturity and quality you see in Racket is what comes from years and years...and years of work on a commercial product that is also meant to be used as a teaching tool.

[16:49](#msg577a93b74fd3816109925d65)And while we can do some things quickly and simply, the hard part of importing features is maintaining conceptual integrity in the language, so those things fit.

gour

[16:50](#msg577a93cd3ac2a2dc143676a9)@greggirwin isn't Racket (PLT Scheme) conceived as mostly a teaching tool/language?

greggirwin

[16:51](#msg577a93fdef3990705ba68460)I don't know the exact history. Whether is started as a teaching tool and was commercialized, or if it was the other way around.

gour

[16:52](#msg577a94324fd38161099262da)i am not aware of its commercial aspect...

greggirwin

[16:52](#msg577a945a6463856209719292)Am I thinking of Franz maybe?

gour

[16:53](#msg577a948c584c2e775bd74797)well ,Franz Lisp is commercial indeed ;)

[16:53](#msg577a949eef3990705ba69284)however, the point apply that Racket is mature product with years of work behind it

greggirwin

[16:53](#msg577a94a74fd3816109926a30)My brain being mixed up then.

dockimbel

[16:56](#msg577a9535584c2e775bd7521d)Racket is doing a lot of things right, but the level of simplicity we're chasing with Red, is not there. I just had a look at the downloading size of Racket: 75M as an installer (so I guess it expands to at least the double size on disk?).

greggirwin

[16:57](#msg577a955e4bee5c5709205229)As Doc says, we can do pattern matching pretty easily, but need to design it. I can take a whack at some things for discussion, if Doc says it should be on the list.

[16:57](#msg577a956f646385620971a68a)I DL'd it Doc. Expands to ~500M on disk.

dockimbel

[16:58](#msg577a95a069ed53d814272dcf)Wow...How big is a hello world in Racket, once turned into an executable?

greggirwin

[16:58](#msg577a95c069ed53d814272e33)A lot of it is docs.

dockimbel

[16:59](#msg577a95d7f06cda5d0980c894)If you can remove the docs and tests, how much is left?

gour

[17:00](#msg577a96164bee5c5709206306)considering it's not real executable since raco has to pack a lot stuff, probably not very small

greggirwin

[17:01](#msg577a965c646385620971bc7b)I don't think tests are included. They are in the source on github though.

[17:02](#msg577a968d3ac2a2dc14369f88)Docs are 170M

dockimbel

[17:03](#msg577a96e54bee5c5709207a05)Well, so there's still a lot that Red can improve over Racket, the quest is not finished yet. ;-)

greggirwin

[17:04](#msg577a97084bee5c5709207a53)Ya' think? ;^)

gour

[17:06](#msg577a9786f06cda5d0980e3a1)\[this](http://rosettacode.org/wiki/Hello\_world/Graphical#Racket) "Hello world" produces 12M executable (x86\_64)

greggirwin

[17:06](#msg577a9790584c2e775bd77a2a)The pkgs dir is 250M, with ~200 sub dirs.

dockimbel

[17:07](#msg577a97b9646385620971d175)@gour Are they any "compilation" options to reduce further the size of the final output?

greggirwin

[17:07](#msg577a97c1646385620971d1a5)@Gour, oh my.

gour

[17:07](#msg577a97e13ac2a2dc1436af17)@dockimbel i'm not quite familiar with it - just used \[this](http://docs.racket-lang.org/raco/exe.html)

[17:08](#msg577a97fa69ed53d814274c68)ther are plenty of options, afaict

dockimbel

[17:08](#msg577a980e584c2e775bd77f95)Though, 12M for the runtime is not that bad compared the others.

gour

[17:08](#msg577a98174bee5c5709208274)@gour nods

[17:29](#msg577a9cf0f06cda5d098123f4)is there some rough estimate for Red-1.0 release?

dockimbel

[17:48](#msg577aa16d4bee5c57092109ab)@gour Very hard to say, my wish is Q1 2017, though, that would require a very intensive and continuous work until there, to cover all that remains to be done, and probably would require moving the concurrency support to 1.1.

[17:49](#msg577aa1ae584c2e775bd8270e)Though, after 0.7.0, we'll have a clearer view of the time schedule for 1.0.

maximvl

[17:51](#msg577aa21e6463856209726231)12M is actually nice, ~7 years ago, when I was actively using it Hello World was ~50M

gour

[17:53](#msg577aa2953ac2a2dc1437607c)@dockimbel thanks. 0.70 should have, iirc GUI for Linux ready

dockimbel

[17:55](#msg577aa2f6ef3990705ba78fea)Hopefully it should yes, I just need to lock @qtxie in a room for a couple weeks with some good rice wine, and it will be done. ;-)

pekr

[17:56](#msg577aa34769ed53d81427e537)Or kidnap Cyphre, from wherever he is nowadays :-) ... and lock him with Qtxie :-)

gour

[17:56](#msg577aa3494bee5c5709212ae1)lol

greggirwin

[18:34](#msg577aac3764638562097325d4)I'll buy the lock.

gour

[18:55](#msg577ab1334bee5c570922208b)@gour can contribute for the lock as well

greggirwin

[18:56](#msg577ab14e4bee5c57092220ed)Someone has to buy the wine.

pekr

[19:33](#msg577ab9f3646385620973e1c5)Carl delivers the wine, the Rebol one! He is going to be using Red soon anyway ...

## Tuesday 5th July, 2016

maximvl

[08:34](#msg577b7109f06cda5d098b865f)@pekr is it true? btw, what does Carl think about Red?

pekr

[11:09](#msg577b9577584c2e775be47504)It was a joke :-) Carl works for Roku ...

maximvl

[11:14](#msg577b96aff06cda5d098d7725)Roku?

[11:15](#msg577b96c53ac2a2dc1442fd90)https://www.roku.com/ ?

[11:15](#msg577b96e4ef3990705bb3a2f6)Is he still interested in programming languages?

greggirwin

[16:40](#msg577be31564f940856a114e54)I believe he is Max, and his work on tiny devices (not sure if he's the OS architect or what) will probably be useful in the future.

## Tuesday 19th July, 2016

JacobGood1

[21:46](#msg578e9f9e3d74e5a01668be6a)Racket is too clean for me, lol. I know that sounds odd, and it is, but I prefer maximum power over elegance.

## Thursday 21st July, 2016

dockimbel

[11:05](#msg5790ac6316487c5e51704493)@JacobGood1 With high power, comes high responsability. A "max power" language would be for a very few users, which means, very high risks of staying very small (community and libs). You need to protect most users from shooting themselves in the foot, so I don't believe that a "max power" language could ever be successful.

## Saturday 23th July, 2016

JacobGood1

[18:17](#msg5793b4ce9d9e974a7f7045e3)@dockimbel yes, I understand. By the way, in case you have forgotten or lost this paper... I would like to post it again as a refresher: http://www.cs.cmu.edu/~aldrich/papers/ecoop05pmd.pdf

I do not think that pattern matching works very well with languages like Lisp and Red but I do think that multiple dispatch does. I am really interested in the idea of multiple dispatching prototype objects. However, it would be up to more experienced Redites to determine whether or not such an idea works well with the Red way.

greggirwin

[20:15](#msg5793d069959ee82b3e47b881)I only skimmed it Jacob, but I'm not seeing the big win. It moves things around, but their example isn't clicking in my head as how it's better.

JacobGood1

[20:22](#msg5793d1f41b9de56c0ed6422d)@greggirwin Hello Gregg. Better than what, specifically?

greggirwin

[20:28](#msg5793d3841b9de56c0ed64dac)Better than what we have now.

[20:30](#msg5793d3df1d2852c8437e9452)Or, generally, better than the alternatives they're trying to improve upon.

JacobGood1

[20:38](#msg5793d5d8b92e27447fa6d30b)One more clarification, you mean the prototype system that Red currently uses? They are trying to improve prototype object systems in that paper, thus they would be trying to improve a feature of Red.

Ill have to talk about it later because I have to go somewhere. Hopefully I will have some fun stuff to read from others in this channel when I get back =)

greggirwin

[20:43](#msg5793d6eb959ee82b3e47ec7a)I understand that they're \*trying* to improve it, I just don't see how they \*are\*.

[20:56](#msg5793d9f067c448730ef06a58)Using their example, how is their final PMD model better than this?

```
clone: func [o][make object! o]

handle-encounter: func [a b][
    case [
        dying-shark? a                  [a/swim-away b]
        all [fish? a healthy-shark? b]  [a/swim-away b]
        all [healthy-shark? a shark? b] [a/fight b]
        'else                           [a/say "meh"]
    ]
]

fish?: func [a] [has-words? a [swim-away]]

healthy-shark?: func [a][
    all [has-words? a [healthy? swallow] a/healthy?
]

animal: object [
    swim-away: func [other] []
    encounter: func [a b]   [handle-encounter a b]
]

fish: clone animal

shark: make animal [
    state:    'healthy
    healthy?: does [state = 'healthy]
    swallow:  does [state: 'healthy]  ; if they would just try to eat
    fight:    does [state: 'dying]
]
```

## Sunday 24th July, 2016

JacobGood1

[00:16](#msg579408c29d9e974a7f72df87)@greggirwin I am going to ignore what you wrote for now in order to simplify this discussion(I read it, but there is too much to talk about within it).

Let's talk about only multiple dispatch for now. There is a useful function within Red known simply as `+`. If I create new objects with the desire to use the `+` on them, without any sort of code manipulation facilities, how do I do that? How do I define multiple `+` that will dispatch differently based on what object/objects are passed to them? I do not wish to alter the original source code of `+`, I simply would like it to take on new parameters...

`my-object + my-object`

Now, what if we could do that with every function in Red, every mezzanine as well as library written function?

greggirwin

[01:06](#msg57941499959ee82b3e4985d5)Do you know how actions work, and how infix ops are defined?

JacobGood1

[14:00](#msg5794c9ed32bd01d843b6eb78)Let me say also that any time I say Lisp I mean Common Lisp.

Yes?

The idea in the paper and in many Lisp lovers, is for every procedure in the language to be defined as an extensible, open, multi-method.

Take a look at this paper: http://metamodular.com/generic-dispatch.pdf. Having multiple dispatch pervasively applied to a language(an idea that many Lispers like) is advocated in the CONCLUSIONS AND FUTURE WORK section at the end of the paper.

[14:05](#msg5794cb40b92e27447fae3029)Here is a C++ idea for it as well, http://www.stroustrup.com/multimethods.pdf

greggirwin

[19:57](#msg57951d9332bd01d843b9d60f)I'll ask again. Do you know how actions work, and how infix ops are defined? That gives us a starting point.  
It helps me to discuss things in concrete terms (hence I post a lot of examples). Rather than links to papers, if you want to champion this idea, explain why it would be desirable or even necessary for some things, with examples, how it would be used, etc. Imagine you're writing a REP for it, or even do that. Make the case.  
For a feature like this, it sounds like it's an object-specific form of operator overloading you want. In the metamodular, they talk about having a stamp as the class ID, how they become obsolete, and how the search is done for a matching class. We don't have classes or an object hierarchy. This bring us back to the original Aldrich paper, I think. Given their description, could you build an example implementation in Red, so show how it would work?  
&gt; The key insight that makes PMD work is that multi-methods must be internalized  
into objects  
&gt; Each object keeps track of which roles it plays for which multi-methods  
&gt; Dispatch occurs by searching the delegation hierarchy for inherited methods  
with the right name and appropriate roles for each of the arguments

## Monday 25th July, 2016

JacobGood1

[18:21](#msg5796589ead8f331f4e474899)&gt; I'll ask again. Do you know how actions work, and how infix ops are defined? That gives us a starting point.

I answered earlier, I guess you did not see it... yes.

&gt;It helps me to discuss things in concrete terms (hence I post a lot of examples). Rather than links to papers

I link the papers simply because they have fully outlined the ideas. What use is there in repeating the idea in a less technical way?

&gt;, if you want to champion this idea, explain why it would be desirable or even necessary for some things, with examples, how it would be used, etc. Imagine you're writing a REP for it, or even do that. Make the case.

I do not necessarily feel strongly enough to champion it. I just want to make sure that the ideas are known to the land of Red. If there is something that Doc thinks is useful, in terms of Red, in these papers, I have done a small good deed.

&gt;For a feature like this, it sounds like it's an object-specific form of operator overloading you want.

If by operator you mean every procedure in the language then yes. I would rather there be no operators, only functions/methods.

&gt;In the metamodular, they talk about having a stamp as the class ID, how they become obsolete, and how the search is done for a matching class. We don't have classes or an object hierarchy. This bring us back to the original Aldrich paper, I think. Given their description, could you build an example implementation in Red, so show how it would work?

That is why I linked that paper in the first place. I know Red uses a prototype system, thus I linked a paper dealing with just that. The other papers deal more specifically with the idea of multimethods, in various language flavors, so that one can glean a full perspective from programmers of diverse backgrounds.  
I am not going to take the time to build examples. I merely wanted to posit the idea/ideas for the Red team so that they could mull it over it they desired to. I did give a small example, hopefully, one can extrapolate from that the useful properties of multiple dispatch.

greggirwin

[18:53](#msg5796603e37c95e2446b4f8a3)Thanks for explaining. The advantage of less technical, introductory explanations, is that the concept may apply, but the implementation doesn't. And deep technical papers take a long time to read and digest.

I went with operator overloading because `+` was your example. :^)

My gut feeling is that Red doesn't need it built in at the lower levels. I don't see a big win.

JacobGood1

[23:13](#msg57969d068fb4820a4663c298)I gave `+` as an example because it is one of the simplest to understand a need for using the same symbol to dispatch differently based on the type of arguements it receives. It would be nice to be able to define ones own argument types for any function, no matter what library one uses.

Here is another example:

Say we have a function called `length` that works on series...

length \[1 2]  
length "12"

I create some object that I think could use length as well...

length &lt;my-object&gt;...

This will not work because this length is conflicting with the other length. Red already uses this idea with it's large amount of data types that have identically named functions that work according to the type given to them.

The idea of multimethods, from a Lisp perspective, is to allow one to use any symbol for their own types, even if it has already been used. This is much like object oriented programming where the method belongs to the object except here, in Lisp, the method does not belong to any object and can receive an infinite amount of datatypes/objects as long as one keeps giving a new definition for each type.

This type of programming may be odd in the Red world, I do not know since I do not really see from a Red perspective(I do not think many here do except long time rebolers(maybe)).

## Tuesday 26th July, 2016

greggirwin

[03:29](#msg5796d8fdd155b0294e0a19e7)Thanks for the further explanation. I understand the concept, but don't see the big win, given the large architectural shift it would take under the hood. It would still be interesting to see it done \*in* Red, which seems entirely feasible.

dockimbel

[05:09](#msg5796f086ad8f331f4e487058)@JacobGood1 @greggirwin Such feature will be available though a future "user type" (called `utype!` in Rebol3), though it will be limited to actions (which are really the "methods" of the internal object model for datatypes).

[05:11](#msg5796f0eb7c9324e20efe73f8)@JacobGood1 If such `length` function is defined as: `length: [s [series!]][...]`, how could it allow a non-series argument? The only way is to reconstruct it entirely, which you can already achieve in Rebol/Red (to a less extent in compiled Red).

JacobGood1

[20:42](#msg5797cb2c8fb4820a466669fe)@dockimbel in ideal land(my ideal land that is) every function definition would be a multimethod. Adding a definition for length to dispatch on would not require any reconstruction if every func was a multi. However, that may be too drastic, or too incongruent with the Red vision, I do not really know. Suggesting multimethods everywhere is nothing new, people have been suggesting these ideas for a long time now. In fact, the Julia language does just that, I think, with good results(even though I do not really like the language).

[21:44](#msg5797d9b693148c6b21e0bc1e)Someone implemented multiple dispatch with prototypes in common lisp: https://github.com/zkat/sheeple

Here is a video about it: https://vimeo.com/7242003

[21:45](#msg5797d9de37c95e2446b8418d)Hopefully, yall can stomach some of the syntax(some, not all =))

## Wednesday 27th July, 2016

greggirwin

[02:27](#msg57981c1ad155b0294e0ce4e3)@JacobGood1, I watched part of the video, and scanned the Sheeple PDF. It looks like Sheeple hasn't been touched in 7 years. Do you know of any production systems or languages that have implemented this? And do you have an example system you built where this would have made a big improvement? I still just see it pushing complexity around, not eliminating it. Sometimes it takes me a while to get new concepts though. I think I used Rebol for a year before the whole "it's just data that sometimes gets evaluated" idea clicked for me.  
From what I've seen, you should absolutely be able to build something like this \*in* Red, as a proof of concept. Now is a great time to do all these kinds of experiments, because we want to learn all we can before the Red 2.0 toolchain, and its underlying dialects, are deeply designed.

JacobGood1

[14:47](#msg5798c98537c95e2446ba40dd)@greggirwin some of the languages in the video that were mentioned used this system, I do not know how often they were used though. I have not seen many languages attempt prototypes with multiple dispatch. I do not know of any production systems using these ideas... that does not really matter to me. I do know of many production systems that use multiple dispatch. These ideas are just an attempt to apply multiple dispatch, a proven technique, to a non class based system so that they may reap the benefits as well.

## Thursday 28th July, 2016

JacobGood1

[23:01](#msg579a8ede4536c1f33fd52e1a)I decided to do some dabbling(can't help it) and it seems that the reactive features of Red make for some neat "hierarchical" type relationships that are similar to what is in the video.

```
hi: make reactor! [hello: func [] [print "hello there!"]]
howdy: make reactor! [hello: is [:hi/hello]]  

hi/hello: func [] [print "hello their!?!?"]
howdy 

== make object! [
    hello: func [][print "hello their!?!?"]
]
```

One could have a base prototype that that they keep altering... all alterations filter through the "descendants". Of course multiple inheritance could also be simulated as well, simply by reacting to some other reactor. I like the reactive stuff @dockimbel =)

[23:06](#msg579a8fdca8a477b51581e919)I have a general question to ask... is there a channel about suggestions that are not necessarily related to lisp?

greggirwin

[23:07](#msg579a901dac80b5ea3f14db70)No specific group for that . Use red/red for now, or add a wish issue.

[23:08](#msg579a905cac80b5ea3f14dbf9)Very clever `get-path!` usage. :^)

JacobGood1

[23:09](#msg579a90ac95550f1a4ef4a110)Is that a Pinocchio nose? Jkin... thanks =)

greggirwin

[23:09](#msg579a90c04536c1f33fd53384)I've got a big one, but I'm not lyin'.

JacobGood1

[23:10](#msg579a90e84536c1f33fd533c1)I was talking about the smiley specifically, just so we are clear, lol.

greggirwin

[23:11](#msg579a910f3eb00fbd1521064a)Yes, I got it. :^) I do that because I don't like modern emoticons. :^\\

JacobGood1

[23:15](#msg579a92288df57475625f9a48)I like the above idea because one could incrementally build their objects while the system is running. It would be a lot like class style inheritance except that it is interactive and dynamic. I am a huge fan of incrementally building programs while they are running. Prototypes really are better for flexible languages. It is a shame that Common Lisp went with a more classical approach even though it's approach diverges significantly, it is still a technique from a largely static heritage, imo.

[23:18](#msg579a92cb8df57475625f9b7d)I guess I will just ask my more general question here since the main channel is spammed a lot harder... Did Doc ever discuss adding/using coroutines in Red? Even C++ is getting them soon and I find them highly useful.

greggirwin

[23:23](#msg579a940d3eb00fbd15210c70)They have concurrency on Trello for 0.9.0, but no specific discussion of coroutines that I've seen.

[23:24](#msg579a94234536c1f33fd5396d)Aside from the term `tasks` in a few places.

JacobGood1

[23:25](#msg579a9463a8a477b51581f30a)I like this video talking about them for C++: https://www.youtube.com/watch?v=\_fu0gx-xseY

[23:26](#msg579a94bf1d6bf8244e2aa21b)Is that video linked at the start?

greggirwin

[23:28](#msg579a950195550f1a4ef4aa0c)I'm sure Doc will consider their popularity, and how Go touts them as a big feature, but maybe try to come up with a design that keeps us out of trouble most of the time WRT manual sync/mutex.

[23:28](#msg579a95184536c1f33fd53afc)I'll check the link in a bit. Have to finish some code.

## Friday 29th July, 2016

greggirwin

[00:15](#msg579aa018ac80b5ea3f14fa84)Yes, the link seems to go to 0:00.

JacobGood1

[00:28](#msg579aa321ac80b5ea3f150014)good, thanks

greggirwin

[00:47](#msg579aa78eac80b5ea3f1507ff)Didn't watch the whole thing, but there's some good stuff in there.

dockimbel

[06:32](#msg579af8923eb00fbd1521b74b)@JacobGood1 Interesting application of reactivity, I never thought about using it like that. ;-) Though, the function passed like that are still bound to their original object, which can be a leverage or a showstopper depending on how you want to use them.

[06:34](#msg579af90a3eb00fbd1521b827)Coroutines: I would like to support them in some form or another. Though, for many years, I wanted to use a preemptive scheduler rather than a cooperative one. Both have pros/cons. I haven't made my mind about that yet.

JacobGood1

[21:06](#msg579bc56d79f7597137523376)@dockimbel yea, that is no problem since these reactors are acting like classes, once I clone them with make they work as intended. Thanks for the input.

## Saturday 30th July, 2016

maximvl

[11:26](#msg579c8ef607d2d2396e2d82eb)@JacobGood1 is there any sense in multiple dispatch in prototype based oop?

[11:27](#msg579c8f3e79f7597137537a38)I mean, the whole idea of multiple dispatch is to allow specialization/lookup for methods basing on multiple arguments types

[11:28](#msg579c8f5ce56d2538041ae998)not on a single this/self

[11:36](#msg579c9149e56d2538041aec25)ok, that's irrelevant to prototypes, yes )

JacobGood1

[13:58](#msg579cb294cdc68c4904afbf71)@maximvl If you look at some of the material I posted they make cases for dispatch on prototypes. It is an interesting idea that not many language implementers have explored that much. However, as of now, Red's prototypes carry no real type information; you are correct in saying that multiple dispatch would not really work for type-less prototypes.

greggirwin

[14:57](#msg579cc043e56d2538041b37b5)I still think building this \*in* Red is worth exploring. Just because the language doesn't do it all the way down doesn't mean there's no value in a system built that does. If there is real value in it, when building systems and apps, it's worth trying.

JacobGood1

[15:20](#msg579cc5b99684847b373e53a4)@greggirwin Oh, I agree. I agree so much that I started doing just that... no promises though =)

greggirwin

[15:34](#msg579cc902e56d2538041b468a)Woohoo!

## Tuesday 2nd August, 2016

JacobGood1

[21:45](#msg57a11493c915a0e426b71e6f)Hey guys, here is a good blog post that resonates with me. I think it fits with the channel since Lisp historically emphasized interactive development as an important goal of programming. Also, I like a lot of the stuff this guy writes... anyway, here it is: http://prog21.dadgum.com/221.html

greggirwin

[22:13](#msg57a11af700663f5b1b45aca3)Good stuff. I'm going to spend some time reading his blog, I can tell.

[22:23](#msg57a11d60836d2d02115ec30b)Hey, he knows about Rebol! http://prog21.dadgum.com/214.html

JacobGood1

[22:32](#msg57a11f6d836d2d02115ec807)Hopefully, I am not ruining your productivity, it is good that you use Red... =)

greggirwin

[22:44](#msg57a1224e00663f5b1b45bd03)And again: http://prog21.dadgum.com/159.html

Yes. It's killing me right now. :^)

[22:47](#msg57a122fd00663f5b1b45be61)And while it's not in the realm of real interactivity, I'm playing with ideas like this: https://gist.github.com/greggirwin/7a5ce2fe7a95e6f7f8ef4ee1d2989d3e

## Monday 8th August, 2016

justinthesmith

[04:39](#msg57a80cee2f03cf8749cff6ab)Love your new math-lab, @greggirwin. FYI your gradient-lab seems broken on the latest Windows build (red-08aug16-037d0b0.exe). Only the first gradient color works properly, and there's a lovely "Script Error: pick does not allow none! for its index argument"

geekyi

[10:06](#msg57a8599dd097eb6b2cced4f9)Interesting discussion here. I should have subscribed to all the red rooms!

[10:11](#msg57a85ab8fb162b752ca7b1f9)@JacobGood1 Incidentally, I had a sneaky suspicion the site was familiar, and after searching a bit, http://prog21.dadgum.com/48.html is very likely the actual article that inspired me to try out J!

[10:12](#msg57a85b01fb162b752ca7b2a0)Unfortunately, J's graphical IDE is no longer written in J. I still use it for quick computations tho.. nothing beats it at that!

greggirwin

[16:06](#msg57a8adebf7f11a7936ac6cb4)Thanks @jthsmith! I'll take a look at gradient lab.

[16:12](#msg57a8af7f46610f173948f065)Looks like the canvas reactor now gets triggered on creation, before the drop-list is created, or the reactor is bound to the drop-list and the creation of the drop-list causes the reactor to fire before its facets are fully initialized.

[16:13](#msg57a8afb2d7087a017fa2d432)And the Raidial and Diamond patterns are broken. The colors in the draw block aren't applied correctly.

[16:18](#msg57a8b0dbae838f6f568dfe1b)Looks like there's a new `offset` param for each gradient color. The docs say it's optional.

@qtxie, should this still work, or are offsets for gradient colors required now?

```
view [
    base 500x500 draw [
        fill-pen radial 0x0 0 500 0 1.0 1.0 red green blue
        box 0x0 500x500
    ]
]
```

[16:47](#msg57a8b795ff82b9fc7e6c242f)Shoot. That should be in a different group. :^\\

qtxie

[22:08](#msg57a902cbff82b9fc7e6cf19b)@greggirwin Looks like a regression.

## Thursday 18th August, 2016

JacobGood1

[22:30](#msg57b63707b64a3a016f49d5f3)@dockimbel hey Doc. Remember this useful snippet of code?

```
pre-load: func [src part][
    parse src [any [remove comma insert #" " | skip]]
]
load: func spec-of :load body: body-of :load
insert find body 'either bind [pre-load source part] :load
```

it no longer works... =(

Would you be willing to give me an updated version?

## Friday 19th August, 2016

maximvl

[08:50](#msg57b6c84ccd00bdff6e60bb03)@JacobGood1 a wild guess that `load` was changed

[08:50](#msg57b6c857bb6fad403ce9cad0)@JacobGood1 but what magic are you doing here?

[08:52](#msg57b6c8ca6981f5f269fe1bf0)@JacobGood1

```
red>> find body-of :load 'either
== none
```

dockimbel

[09:01](#msg57b6cb02b64a3a016f4b99f4)@JacobGood1 Try it with:

```
insert find body 'case bind [pre-load source part] :load
```

maximvl

[09:55](#msg57b6d77eb64a3a016f4bc2f5)@dockimbel this code adds call to `pre_load` right after source is readed, right?

dockimbel

[09:56](#msg57b6d7c4bb6fad403ce9fbc0)@maximvl Yes, it injects a pre-processing step on the input string, just before the lexer is effectively called.

maximvl

[10:04](#msg57b6d9aa5ffbca3e3cf54866)@dockimbel why does he need to redefine `load` before changing it source?

dockimbel

[10:57](#msg57b6e62ccd00bdff6e611e51)@maximvl Because `load` function is compiled, so in order for your change in the body block to be taken into account by the interpreter, you need to force a redefinition of the function. We could have defined a simple routine to set the proper flag directly in the function value to switch from compiled to interpreted code, but this options is fine as it until we get the JIT compiler which should take care of that transparently.

maximvl

[11:16](#msg57b6ea826981f5f269fe8e65)@dockimbel cool, thanks, I was thinking about something like that

DideC

[12:21](#msg57b6f9df5ffbca3e3cf5b676)Hu! `load` is compiled but its source is still there ?!?!

[12:22](#msg57b6f9fecd00bdff6e616766)@dockimbel can you explain this (what did I miss there) ?

dockimbel

[12:44](#msg57b6ff42b64a3a016f4c4abb)@DideC Yes, source code is available in addition to compiled code in order to allow some reflective function to work, like `source` and `body-of`. There's a compilation option to drop body source code for compiled functions is desired.

DideC

[14:50](#msg57b71c9ded79c5ee4f1cf486)ok. Thanks.

JacobGood1

[15:33](#msg57b726e187f779f0690e7e45)@dockimbel thanks!

greggirwin

[15:53](#msg57b72b7287f779f0690e9158)Does the fix work for you Jacob? Pasting it into a console here does not for me.

JacobGood1

[16:35](#msg57b7354887f779f0690ebac4)I haven't even tried yet.

[16:41](#msg57b736b66981f5f269ffc3cd)@greggirwin it "works" as in it does not return an error. However, it does do what it is supposed to do, which is removing commas from blocks.

greggirwin

[17:39](#msg57b744655ffbca3e3cf6e7c3)After pasting it into the console (build from latest source) I get

```
red>> [1,2,3,abd,"hello"]
*** Syntax Error: invalid float! at "1,2,3,abd,"
*** Where: do
```

JacobGood1

[17:40](#msg57b744a487f779f0690efe62)that is because it does this...  
red&gt;&gt; \[1,3]  
\== \[1.3]

greggirwin

[17:41](#msg57b744dbb64a3a016f4d675a)@dockimbel, after patching, should reflection see the updated source, or is that still reflecting the compiled source?

[17:42](#msg57b744eaed79c5ee4f1d9b17)@JacobGood1, right, which tells me it's not working as expected.

[17:43](#msg57b7452ebb6fad403cebaa0a)But you said it \*does* do what it's supposed to.

JacobGood1

[17:43](#msg57b745506981f5f2690003c1)that was supposed to be does not

[17:44](#msg57b74563187885ef4f5f510c)thus the "works"

greggirwin

[17:44](#msg57b7457ebb6fad403cebab63)Ah. :^)

[17:45](#msg57b745bdcd00bdff6e62a46a)I don't see the change when reflecting `load`, so it may be some deeper issue.

JacobGood1

[17:45](#msg57b745c4cd00bdff6e62a494)I hate typos, all I need to do is be perfect... yea, that should fix everything

## Saturday 20th August, 2016

JacobGood1

[14:31](#msg57b869c56981f5f2690340d8)I think, some time ago, I read that using parenthesis in Red code caused a performance deficit, is that true?

greggirwin

[15:54](#msg57b87d51cd00bdff6e660de5)My guess is that they won't in the compiler, but the interpreter has to evaluate them.

JacobGood1

[16:02](#msg57b87f0cb64a3a016f50f5e4)Same guess here, just wanted to know =)

## Saturday 27th August, 2016

dockimbel

[04:44](#msg57c11aaef6fe00361e043ff2)Your guess is correct.

## Tuesday 4th October, 2016

greggirwin

[14:21](#msg57f3baf90ec6f9457d9f1399)I hadn't heard of NewLisp. Thanks Barry!

[14:32](#msg57f3bd920ec6f9457d9f20c8)Bayes funcs are cool, and would be a nice dialect or add-on module. I'd like to do a fuzzy logic engine and dialect as well.

maximvl

[14:35](#msg57f3be2891d6af11522ad8a1)yep, many features built-in other languages we can have as a dialects

greggirwin

[18:39](#msg57f3f772d45d7f0f52618e84)NewLisp has a really nice FAQ page. Lots of nice links in there.

## Thursday 6th October, 2016

ghost~5680c5f416b6c7089cc058a5

[16:34](#msg57f67d1470fcb5db0c3500e9)@dockimbel In red/red you mentioned the red preprocessor and macros. Has any design for macros been finalized yet?

dockimbel

[17:58](#msg57f690d970fcb5db0c35643e)@nc-x Not finalized, but we should experiment with some preliminary design in the next days. If it's good enough, we'll keep it for 0.6.2 release.

maximvl

[19:13](#msg57f6a252a7c618cd26ecd8c4)@dockimbel one more thing to include to 0.6.2?

## Saturday 15th October, 2016

DonaldTsang

[10:37](#msg580206f2457ae29b71dff758)@room Does anyone here know kdb+ from Kx Systems? They have two compressed functional array programming languages called K and Q (based on J and APL), that I think Red/Dialect could get a few ideas from. (Sorry for posting in the wrong room). @dockimbel could you help me delete the comments in the other room?

dockimbel

[10:45](#msg580208d71cc4cda45651eea5)@DonaldTsang Gitter does not provide admins with ability to delete other's posts.

geekyi

[12:53](#msg580226b2c5e30d6764378d60)@DonaldTsang I know J, have seen K

[13:05](#msg580229acfa6b78846e25ec5f)&gt; I think Red/Dialect could get a few ideas from.

What are you thinking of? :)

[13:05](#msg580229b594b459a576dcd3b7)Do you know of http://nsl.com/ ? There are some interesting articles, http://nsl.com/papers/interview\_note.htm and http://nsl.com/k/f/g.k for example

greggirwin

[14:34](#msg58023e5d78bd0d0363c6ae3c)@DonaldTsang, I wrote an R2 interface to kdb many years ago, but never use their langs. Same question as @geekyi for me. What, specifically, are you thinking?

[14:35](#msg58023ea4614116a2568728fb)Nice link @geekyi !

DonaldTsang

[16:20](#msg580257378eaaaea3669b11e0)@greggirwin should Red have a dialect that is like J, K and Q where code can be short and powerful (e.g. golfing)?

[16:22](#msg580257aa78bd0d0363c701c7)@geekyi If only we can expand the number of function to encompass all major shortcuts in functional code golf...

geekyi

[18:09](#msg580270bc671ea7ae6c466236)@DonaldTsang I don't see why we can't :wink: I've been thinking about how to approach this.. redbol is powerful enough for it to be implemented pretty easily I think

[18:42](#msg5802787b94b459a576dcda0e)There are 3 things I want to do  
1\. collect all higher order functions (e.g. `map` `fold`)  
2\. implement some of the j adverbs and conjuctions \[vocab](http://www.jsoftware.com/help/dictionary/vocabul.htm), \[alt vocab](http://code.jsoftware.com/wiki/NuVoc), \[wrord classes](http://www.jsoftware.com/help/dictionary/partsofspeech.htm)  
3\. Concatenative combinators http://tunes.org/~iepos/joy.html

greggirwin

[22:44](#msg5802b14e1cc4cda4565427fd)@DonaldTsang, let me ask a different way. Is there a \*domain* you're thinking of (e.g. matrices) or a more general language that is just and different, idiomatically, from Red? It's a balancing act in my mind, because we want all the standard pieces to fit together as a whole, striving for conceptual integrity in what's built-in. A DSL for code golfing could be a lot of fun, but not valuable as a standard feature. To me, it's more of a parlor trick. Important for attracting attention and generating interest.

[22:46](#msg5802b1c8457ae29b71e239d6)More reading @geekyi ! :^)

geekyi

[22:50](#msg5802b29a671ea7ae6c4665e6)@greggirwin wonders why @geekyi is not responding :^)

greggirwin

[22:54](#msg5802b3a3457ae29b71e24016)Hey! That wasn't me! Was it?

## Sunday 16th October, 2016

DonaldTsang

[04:32](#msg580302ebb68c1ca566bcf16b)@greggirwin I expect two languages: Red/Perl (for serious K/Q like usage, to be as short as Perl), and Red/Golf (for celebrating milestones and attracting attention).

[04:33](#msg58030335614116a256898456)@geekyi I will dump a file containing all the documents of major golfing language as a reference for high order functions, just to get an idea for what we need to do.

[04:47](#msg5803065d457ae29b71e3053e)http://meta.codegolf.stackexchange.com/questions/8798/golfing-class-of-a-language

greggirwin

[06:15](#msg58031af278bd0d0363c93ed1)I'll have to read up on K/Q. My goal is rarely to be as short as possible, but to be as clear as possible. If we say the DSL is to be a Practical Extraction and Reporting Language, that will likely constrain it more than general Perl is today. If we say the DSL is Perl-in-a-block, it's not really a DSL. That said, I've written an AWK in R2, and would love to see something like that in Red. I may just need to study K/Q a bit to see where you're coming from.

DonaldTsang

[06:34](#msg58031f59b68c1ca566bd33bf)@geekyi http://piratepad.net/golfing Could you help me add the resources to this pad?

[07:55](#msg5803328e1cc4cda456556770)@greggirwin My direction is that for Red/Perl (the "Perl" is a placeholder name) is to be as compact as possible while being usable like K/Q. They have shorthand where some keywords are as short as a character.

dander

[08:16](#msg58033772891a53016313d9f3)I ran across this Rebol/Red code golf dialect some time ago: https://github.com/hostilefork/rebmu/

DonaldTsang

[08:25](#msg580339691cc4cda456557760)@dander but the character space is not fully used up... I think it needs some improvement, or a possible Red rewrite

geekyi

[15:54](#msg5803a2c0671ea7ae6c466daf):point\_up: \[October 16, 2016 11:34 AM](https://gitter.im/red/red/lisp?at=58031f59b68c1ca566bd33bf) @DonaldTsang what is your intention there? Do you want me to add github links?

[15:55](#msg5803a2d6671ea7ae6c466db4)I'm wondering about the end goal of that

[15:55](#msg5803a2eac5e30d676437a0e5)Rebmu looks like a good starting point

DonaldTsang

[16:26](#msg5803aa2d8eaaaea3669f02ca)@geekyi I see the steps of building a Red/golf language by (1) Collect information from other golfing languages (2) Sort nearly all of the available functions from said languages (3) Either apply it to Rebmu, or writing a new Red dialect entirely to make it more efficient. To do (1) one must gather the GitHub links for the appropriate language.

[16:26](#msg5803aa37b68c1ca566bed569)Anyway, thanks for the help.

geekyi

[16:47](#msg5803af12c5e30d676437a192)@DonaldTsang that's a long list.. I think you can automate the process with rebol/red/your fav language? :wink: something like "https://www.google.com/search?q=AutoIt+site%3Agithub.com" or "https://duckduckgo.com/?q=AutoIt+site%3Agithub.com"

[16:47](#msg5803af2d671ea7ae6c466e69)Or even github's api I guess..

DonaldTsang

[16:49](#msg5803af9ab68c1ca566bee5f0)@geekyi it hard to automate, since some languages might not have their official page on GitHub (see Brain\*\*k)

geekyi

[16:51](#msg5803b000c5e30d676437a1c8)@DonaldTsang Oh, I thought only github, in that case, usually the top result counts?

DonaldTsang

[16:52](#msg5803b03c1cc4cda45656dc62)@geekyi Their page-ranking algorithm is a bit off, so it might not always be the first one

geekyi

[16:52](#msg5803b04d671ea7ae6c466e78)I'm still not exactly sure why you are collecting all these links.. I think you can also get others from stackoverflow golfing to help (I'm not really a golfer)

[16:52](#msg5803b05ec5e30d676437a1d0)@DonaldTsang in that case, `ask` ? :wink:

[16:53](#msg5803b087c5e30d676437a1d3)Top 5 results, loop, `ask`

DonaldTsang

[16:54](#msg5803b0c48eaaaea3669f16a4)@geekyi Basically Collect Languages ==&gt; Collect Functions ==&gt; Sort and Implement in Rebmu or Red/Golf

geekyi

[16:55](#msg5803b0effa6b78846e25fd8a)@DonaldTsang The top 1 group is already pretty good enuf

[16:55](#msg5803b10f671ea7ae6c466e88):point\_up: \[October 15, 2016 11:42 PM](https://gitter.im/red/red/lisp?at=5802787b94b459a576dcda0e) this alone too

[16:56](#msg5803b12c94b459a576dce644)Ok, I'll see what I can do when I get free time

[16:57](#msg5803b172c5e30d676437a1e9)My priority right now is collecting functions of red and rebol itself :smile:

[17:00](#msg5803b23c671ea7ae6c466e8f)partial idea for automating: (in rebol)

```
view layout [text "http://www.google.com" btn "yes" btn "next" [print "next"]]
```

DonaldTsang

[17:03](#msg5803b2c5614116a2568b80af)@geekyi I meant collecting functions from other golf-specific languages to apply to Red (since they contain a lot of shorthands). Also, Group 2 and 3 have some languages that we could analyse.

greggirwin

[18:49](#msg5803cbb3457ae29b71e55554)Since I'm not a golfer, I won't be much help there @DonaldTsang. If you have links to specific puzzles, I can look at those, but I have a lot of other Red work I'm doing, so should leave this one to real golfers.

## Monday 17th October, 2016

DonaldTsang

[05:23](#msg5804603e614116a2568da6bc)@greggirwin Is it possible for Red to have a dialect that is short but powerful like K/Q? (I am not talking about Red/Golf here) that is the question

maximvl

[08:50](#msg580490c378bd0d0363cdbd55)@DonaldTsang of course

greggirwin

[16:43](#msg5804ffb1b827179842cd5101)@DonaldTsang short, powerful dialects are the best. At a glance, the things that would make K harder to do are right-to-left evaluation and overloading based on context. If you don't care about being K compatible, then the big decision is whether to make it a Red dialect, or a string based DSL so you can eliminate whitespace and make things more compact.

I did glance at a number of things on the NoStinkingLoops site @geekyi linked to, and my brain melted. Yowza!

DonaldTsang

[16:45](#msg58050010759f6d2436be68b0)@greggirwin We don't need to be K compatible, only the tool

[16:46](#msg58050077b827179842cd5630)@greggirwin We don't need to be K/Q compatible, only the generalized/modified/simple tool box that it contains is important

greggirwin

[16:51](#msg580501758d2babbd087eb388)Probably not too hard then. If you draft up a small spec, someone here might help get you started.

JacobGood1

[22:09](#msg58054c2e2189c68f42f636b7)@maximvl

quote from Paul Graham:

http://www.paulgraham.com/diff.html

9\. The whole language always available. There is no real distinction between read-time, compile-time, and runtime. You can compile or run code while reading, read or run code while compiling, and read or compile code at runtime.

Running code at read-time lets users reprogram Lisp's syntax; running code at compile-time is the basis of macros; compiling at runtime is the basis of Lisp's use as an extension language in programs like Emacs; and reading at runtime enables programs to communicate using s-expressions, an idea recently reinvented as XML.

maximvl

[22:11](#msg58054c75b17b667961cdf69c)yes, lisp blurs distinction, but lispers have to understand it very well to use macros, reader macros, eval-when and a lot of other things

[22:12](#msg58054cbe36d64226367e59be)for example for me lisp was the first language I really started doing things during compilation and read phases

JacobGood1

[22:12](#msg58054ce84829257761318a12)That is great; what I said was not nonsense then.

maximvl

[22:13](#msg58054cfbb827179842cebe61)but you said lispers don't make distinction ;)

JacobGood1

[22:18](#msg58054e268d2babbd088007cb)I could have said we do not make distinction between code and data... yet we do; in the same sense, my statement, in the context of rebolek's wording, could have been interpreted correctly.

## Wednesday 19th October, 2016

DonaldTsang

[08:47](#msg5807331336d642263685d5e0)@greggirwin okay, guess I will have to gather info from the "Q tips" book

## Thursday 20th October, 2016

DonaldTsang

[03:14](#msg5808367a759f6d2436cc05bf)When will Red have auto-completion for Nano, (Neo)Vim and (Spac)Emacs?

maximvl

[09:24](#msg58088d6bb17b667961db1821)@DonaldTsang good question, I think this is something plugin's authors for each editor can tell you

[09:25](#msg58088d9eb17b667961db1911)I would like Red to have it's own IDE/Editor with the best practices from Smalltalk, EVE and LightTable

DonaldTsang

[17:26](#msg5808fe5e482925776140cc71)@maximvl the thing is that Red should not go for a direction that is limited to its own IDE (where Python has IDLE and Java have eclipse) but also multi-purpose text editors like \*Vim, \*Emacs, Nano, Gedit and/or Kate.

[17:32](#msg5808ffc7482925776140d3fd)Other non-basic editors include SublimeText, Atom, Brackets, Eclipse, Geany... But these are not Linux system default or terminal text editors so we should not treat them as top priority

[17:40](#msg5809018e759f6d2436cf51ea)\*But since

rebolek

[17:51](#msg58090418714642af22cc6f3f)@DonaldTsang syntax files is something that contributors can do ;)

DonaldTsang

[17:55](#msg5809052bb17b667961dd5240)@rebolek is there a contributor wish list?

[17:56](#msg5809054036d64226368ddd73)I might want to add some for christmas

geekyi

[22:07](#msg5809402f36d64226368eefcb)@DonaldTsang there are already some at different stages by different contributors

[22:09](#msg5809407d80020cc608fc89a4)I use sublime version by oldes, it's there as a package for red and rebol, also there's one by chris I think

[22:10](#msg580940e380020cc608fc8ad9)Check https://trello.com/c/HIp5wG5e and other cards there

[22:37](#msg580947252189c68f4206fb38)@DonaldTsang :point\_left: \[August 2, 2016 11:43 AM](https://gitter.im/red/red?at=57a040f69e85d3e8267f4b58) maybe you can collab with @xificurC

[22:40](#msg580947c248292577614214ea)https://github.com/xificurC/red.el

## Friday 21st October, 2016

maximvl

[09:07](#msg5809dadd80020cc608fe613d)@DonaldTsang  
&gt;should not go for a direction that is limited to its own IDE

why?

[09:08](#msg5809db25482925776143e0b9)what I mean is it is better for Red team to focus on language and it's own IDE, and let enthusiasts create plugins/modes for other editors

[09:10](#msg5809db79b827179842e148c7)&gt;But these are not Linux system default or terminal text editors

I really hope we can finally overcome terminal text editors with something much more productive in all cases

greggirwin

[16:11](#msg580a3e2fa27d2220790e2292)For me, a built-with-Red IDE is important for more than one reason. Yes, it will be a nice tool, and we can say it's built with Red. More importantly, we can customize and extend it with Red (because it will surely be extensible) and it will serve as a teaching tool. An IDE, even a simple one, will show how to implement important features in your own application. Editing text, multiple panes, key handling, file access, menus, launching external processes, how to structure an app, etc.

dsgeyser

[18:20](#msg580a5c62a3bbf12d56254bcc)Recently had a look at the IDE integrated into Livecode. For me a similar one will make coding in Red much easier and productive.

JacobGood1

[20:06](#msg580a7563fb138dce65e8e0d3)Ive always wanted an ide for a language(that I actually like) that was written in that language

## Saturday 22nd October, 2016

DonaldTsang

[09:47](#msg580b35c056121b9c7eac03e7)@maximvl I am saying for Red community, team and users together, should not rely on RedDE (Red IDE) alone, since variety allows people to optimize their work flow. One thing, terminal text editors like \*Vim and \*Emacs have GUI add-ons that make it accessible for people that are not skilled at using keyboard, while keeping typist programmers fast

[09:50](#msg580b3667278cc54c6f5ade05)@greggirwin @dsgeyser well an IDE written in that language is cool and thematic and all, but when it comes to efficiency and ease of use, other text editors already got it nailed down.

[09:53](#msg580b3703a3bbf12d5627942b)@JacobGood1 ^

greggirwin

[15:29](#msg580b85c3fb138dce65ebb0f5)@DonaldTsang , of course editors work great. I use one every day. It's a matter of priorities, though, and what is most helpful to users (and to Red's adoption).

## Sunday 23th October, 2016

DonaldTsang

[03:52](#msg580c33e2b6fc192f56302232)@greggirwin a Red IDE is a public stunt or at the very least a demonstration, it does help red's adoption but not necessarily be useful to users, since users might have a habit of using other text editors or IDEs. So Red should target the most common text editors and IDEs as a way to attract more people than using RedIDE alone.

[03:52](#msg580c3412fb138dce65edb91e)Name some common IDEs like Geany that Red should target as well (I am all ears about this)

maximvl

[08:50](#msg580c79f0015db84e6fbada30)@DonaldTsang  
&gt;One thing, terminal text editors like Vim and Emacs have GUI add-ons

GVim is a separate program, on a vim add-on, GUI in Emacs is not an add-on either

[08:51](#msg580c7a1bfb138dce65ee5999)&gt;well an IDE written in that language is cool and thematic and all, but when it comes to efficiency and ease of use, other text editors already got it nailed down.

Other text editors stuck with 30+ y.o. technologies

[08:52](#msg580c7a3a278cc54c6f5ea799)search emacs mailing lists for complains and rewrite attempts in Haskell, Common Lisp, Scheme, etc

[08:53](#msg580c7a7d56121b9c7eafe952)these editors should be considered deprecated, it's time for new things to come to this area, I really hope Red's IDE will be one of them

[08:53](#msg580c7a92305a10335db20f0b)(I'm saying it as Emacs fun, I'm using Emacs for 7 years already, it is one of the best editors ever created, but there are a lot of things that could be done much better)

[08:55](#msg580c7b00278cc54c6f5ea99f)&gt;Name some common IDEs like Geany

[08:56](#msg580c7b3dfb138dce65ee5f27)when did Geany become common?

[08:57](#msg580c7b7d278cc54c6f5eaaa2)sorry, but this is as stupid as saying "Red team should support Nano, Vi, Acme, Ed, etc"

[09:00](#msg580c7c31fb138dce65ee6170)The only thing Red team really should do is provide us a good language, as a community of (professional) programmers I hope we can write everything we need

DonaldTsang

[10:22](#msg580c8f7956121b9c7eb019a3)@maximvl I am not saying it should be done by Red team alone, but that Red team can provide hints to the community what needs to be implemented in each of these text editors. About Geany, when you google "top text editor" sometimes it pop up, along side sublime, atom and others...

[11:05](#msg580c9968fb138dce65eea967)What I hope to see: Red users suggest features to implement in text editors ==&gt; Red Team pins the ideas down on a board for the community to see publicly ==&gt; Red Community implement feature in text editor ==&gt; Red users report the result of text editors

dockimbel

[12:57](#msg580cb3c4278cc54c6f5f5434)@DonaldTsang That is not how open source projects work, there is no such thing as "Red Community implement feature". Basically, it's:  
1\. A user has a need. He also has the skills and knowledge sufficent to implement it.  
2\. The user implements the feature he needs.  
3\. The user shares is with the community(-ies).

DonaldTsang

[14:07](#msg580cc4275af5969e7ef1e47b)@dockimbel Is it possible to add a step -1 (User have an idea or need, and he express such need to the public) and step 0 (the community pass around the idea or need)? That would make step 1 slightly different (Other users who have the skill implements it)...

[14:13](#msg580cc59dfb138dce65ef32d6)I am not suggesting that the community must obey and implement the features that the Red team has "pinned down", merely the Red team providing a trello-like board can provide a platform for new ideas to "pin down" by the community.

[14:24](#msg580cc8155af5969e7ef1f54c)@maximvl Back to the subject, should there be an exhaustive text editor feature list? So that someday the community might pick it up and have a go with their own text editor?

rebolek

[14:34](#msg580cca8bb813566a4c6e9ed4)@DonaldTsang why not? you can start writing one

DonaldTsang

[14:35](#msg580ccab45af5969e7ef1fcbf)@rebolek I am on my way

[14:36](#msg580ccadf5af5969e7ef1fd18)I will do it tomorrow, I have rest for a little bit

maximvl

[20:29](#msg580d1dbe5af5969e7ef32cf1)@DonaldTsang  
&gt;User have an idea or need, and he express such need to the public  
&gt;Other users who have the skill implements it

:D

## Monday 24th October, 2016

DonaldTsang

[04:49](#msg580d92ec278cc54c6f622279)piratepad.net/RedLang

geekyi

[05:13](#msg580d9864b813566a4c6ea973):point\_up: \[October 23, 2016 7:07 PM](https://gitter.im/red/red/lisp?at=580cc4275af5969e7ef1e47b) @DonaldTsang collect project ideas? I've thought about the best way to do it. Either add to red/code wiki, or Have a different red repo for design: \[REPs project-ideas \[opt: guru-meditation ]]

[05:17](#msg580d9953e897cd3a71e068db)@DonaldTsang Are you thinking of an editor specialized for Red (and maybe Rebol) or a generic text editor for programming languages? I have some ideas that go beyond those, but that's probable out of scope for now..

DonaldTsang

[05:22](#msg580d9aaf5af5969e7ef4b170)@geekyi I am basically providing a list of things to implement for Vim, Emacs and other general purpose teit editors.

geekyi

[05:24](#msg580d9b0b714642af22ccb3ae)@DonaldTsang to clarify, list of things a red tool should provide for editing to work on those, or..?

DonaldTsang

[05:26](#msg580d9b72278cc54c6f623a8a)@geekyi list of tools/plugins for ease of coding in Red using Vim, Emacs, Nano etc...

geekyi

[10:41](#msg580de54b422eeaf8623fffab)@DonaldTsang :point\_up: \[October 23, 2016 7:13 PM](https://gitter.im/red/red/lisp?at=580cc59dfb138dce65ef32d6)  
&gt;trello-like board

https://trello.com/b/tCypaglW/ideas-for-red-contributors

DonaldTsang

[14:06](#msg580e157a278cc54c6f646c03)@geekyi How do I become a member of this board?

geekyi

[14:09](#msg580e162f422eeaf8624006b0)@DonaldTsang sorry, I'm not sure.. I've yet to really test out trello myself :smile: maybe

DonaldTsang

[14:16](#msg580e17c0b6fc192f56367ed5)@geekyi My account: https://trello.com/donaldtsang96

## Tuesday 25th October, 2016

DonaldTsang

[15:39](#msg580f7ccf8ed1c0ff5c2afe22)@geekyi Also, the board you showed be has been inactive for a year!

## Thursday 27th October, 2016

dockimbel

[06:56](#msg5811a52e8ed1c0ff5c32d24a)I understand that \[Shen macros](http://shenlanguage.org/Documentation/shendoc.htm#Reader Macros) are reader macros only, it that right?

JacobGood1

[13:01](#msg5811faa9806316005dc6dc1c)@dockimbel essentially, yes...

```
(defmacro infix-to-prefix [X + Y] -> [+ X Y])

(macroexpand [1 + 2])
[+ 1 2]

(+ 1 2)
3
```

In Shen, the brackets are a quoted list

[13:03](#msg5811fb1a7b15d16e55b48327)macros themselves are not invoked directly, they match patterns of syntax... so infix to prefix can have more patterns:

```
(defmacro infix-to-prefix 
    [X + Y] -> [+ X Y]
    [X - Y]  -> [- X Y])
```

[13:07](#msg5811fc0b0e25dbfa11691cdf)you will notice that infix-to-prefix was never directly called, it matches any code that has the form of (&lt;n1&gt; + &lt;n2&gt;), (&lt;n1&gt; - &lt;n2&gt;) and transforms it as was written previously.

[13:13](#msg5811fd6483a2008d22dba53f)maybe in Red it would be something like this:

```
interpret ['+ copy x number! copy y number!] [x + y (print "I added something!")]
```

Where the first arg to interpret is a pattern to match and the second arg is what to do with that pattern, just like in parse the second arg will evaluate anything in parens!

[13:16](#msg5811fe1e0e25dbfa1169288f)Of course, I am just spit balling but maybe that helps in some way.

In Shen, you can call the macro definition recursively to have it applied to the syntactic transformations over and over again until a desired transformation is achieved(I wrote about this previously some time ago)

[13:17](#msg5811fe6483a2008d22dba9f1)Whoops!

In the example above

(+ 1 2) should have been (1 + 2)... sorry about that

[13:18](#msg5811febd806316005dc6f227)

```
(defmacro infix-to-prefix [X + Y] -> [+ X Y])

(macroexpand [1 + 2])
[+ 1 2]

(1 + 2) => is transformed to (+ 1 2)
3
```

dockimbel

[13:18](#msg5811febe482c168b22bfa57e)@JacobGood1 Current Red macros do support pattern matching using Parse rules already. ;-) Recursive application is also supported.

JacobGood1

[13:20](#msg5811ff088ed1c0ff5c345bbd)Awesome, I was just trying to make sure that it was fully explained, some times when I write things I feel that I am not conveying the message very clearly

[13:20](#msg5811ff1d806316005dc6f497)@dockimbel that sounds very nice!

dockimbel

[13:21](#msg5811ff728ed1c0ff5c345d19)@JacobGood1 Do you have a link to a deeper description of Shen's macros, I've found almost nothing in the official documentation.

JacobGood1

[13:22](#msg5811ffb27b15d16e55b49f68)Sadly, the only deeper description I know of is in the book of shen... I have a copy and I could take images of it but I do not know the legality of such an action

dockimbel

[13:23](#msg5811ffe3806316005dc6f898)I just wanted to see the extent of pattern matching abilities in Shen's macros. I will look for online examples.

JacobGood1

[13:24](#msg5811fffd0e25dbfa116930be)Since Mark Tarver has not had much success with open source ventures he has taken a stance against os

dockimbel

[13:24](#msg5812002483a2008d22dbb273)Oh...interesting. Do you mean Shen is not open source anymore?

JacobGood1

[13:25](#msg5812002e806316005dc6f979)He has written about his disgust of os many times... right

[13:25](#msg581200497b15d16e55b4a274)There is an old version of it that is os, but the most current version is closed

dockimbel

[13:25](#msg5812004c806316005dc6fa08)I would be curious to read about what went wrong for him...

JacobGood1

[13:26](#msg5812007e7b15d16e55b4a3f6)here you are: http://marktarver.com/problems.html

dockimbel

[13:27](#msg581200b28ed1c0ff5c3462fd)@JacobGood1 Thanks for digging it out.

JacobGood1

[13:28](#msg581200f25a1cfa016e515477)Sure, it is the least I can do, your efforts have helped me a good bit and yet I do very little in return

dockimbel

[13:29](#msg581201358ed1c0ff5c34654b)@JacobGood1 Sharing your knowledge and experience in the Red community is already helping a lot. ;-)

[13:33](#msg5812021c83a2008d22dbbc4c)@JacobGood1 In `[X + Y]`, `X` and `Y` are matching integers only, or any token? Do I understand correctly that capital letters are used as placeholders in such template while other tokens are matched literally?

JacobGood1

[13:36](#msg581202f28ed1c0ff5c346fd2)Capital letters are arguments, lowercase will match the actual symbol. X and Y will match anything at all; \[X + Y] tells the reader there is a match if it sees anything at all at the front of a list, followed by a plus symbol, followed by anything at all. This will only work on lists that have three values.  
If you have ever programmed/played in prolog the capital letter for args syntax will be familiar

[13:38](#msg581203408ed1c0ff5c347150)we can tell the macro to only match numbers like this:

```
(defmacro hi [X + Y] -> [+ X Y] where (and (number? X) (number? Y)))
```

[13:39](#msg581203767b15d16e55b4b2b3)where is a "keyword" for a guard... like in Haskell

dockimbel

[13:39](#msg5812038d806316005dc7091c)Got it, thanks for the detailed explanation.

JacobGood1

[13:39](#msg581203ad0e25dbfa11694340)I am just glad I remember, been a long time since I played with Shen...

[13:40](#msg581203de7b15d16e55b4b497)you are welcome =)

[13:57](#msg581207d25a1cfa016e5178b1)here are some more macro examples, in case you wanted to see them...  
https://gist.github.com/anonymous/36dc0c2e4975800c1688adaf9ff1113c

## Thursday 3th November, 2016

JacobGood1

[13:11](#msg581b379baa8f8c4b328e74f4)@dockimbel I might have asked this before but it is hard to keep track of what I have asked and what I have not asked... Is it a planned feature, in the pipeline, etc. to be able to write red/system code with red whether interactively through the repl or in source? For example,

```
make-red-code: func [body-to-manipulate] [
    modified-code: parse body-to-manipulate rule
    bind-to-routine compile modified-code...     
]

invoke-new-routine-made-from-make-red-code
```

^something akin to the above

Thanks for answering these "what's cooking" questions

[13:15](#msg581b38714aeee0634dc0f7d1)I have a little trick in common lisp where I can unload and reload dll's while the repl is hooked up, it allows me to modify some simple c code, recompile it into a dll, and reload it into lisp without ever stopping the program

[13:16](#msg581b38a2b4046d90642b6f5f)well, technically the program does get suspended using lisps error system, but it is not noticable

dockimbel

[15:33](#msg581b58ccc2f2cf7275c64497)@JacobGood1 Compiling Red/System code on the fly requires a JIT version of our compilation toolchain, which is not planned before a v1.5. The DLL trick you're describing still requires to be able to compile in memory from the REPL, which is not possible until the compiler gets self-hosted (as it is currently written in Rebol, so can't run in Red).

JacobGood1

[15:35](#msg581b59464aeee0634dc106e7)@dockimbel So, when we acquire a jit, you plan to make this possible?

dockimbel

[15:59](#msg581b5ed1e462097a3003bc06)Sure, that's one of the goals of the JIT compilation support.

JacobGood1

[16:03](#msg581b5fe8b4046d90642b83ff)@dockimbel sorry if my questions seem ignorant sometimes, because, most often, they are ignorant, =)

dockimbel

[16:10](#msg581b617ee097df757566e580)Well, not a problem. Afterall, open source projects are the place to share and learn from each other. ;-)

## Saturday 5th November, 2016

JacobGood1

[20:37](#msg581e42ed4aeee0634dc1aba2)is it too early to report errors with macros?

I decided to run the integer swapping macro with a lit-word! that does not match anything in the interpreter...

```
expand-directives [
    #macro 'hi func [s e][s/1: s/1 + 1 next s]
    print 1 + 2
]
```

it crashes the repl

## Sunday 6th November, 2016

dockimbel

[04:41](#msg581eb45fe462097a301395f4)@JacobGood1 I am writting unit tests for the preprocessor right now, so, it is the right time. Though, you can just report them here for now.

JacobGood1

[04:48](#msg581eb61b0d42ea911cbe7561)I also have some questions about them...

if we were expanding max but it was written this way:

```
max 1 2 return-a-number func-with-3-args-that-returns-num 34 6 7
```

when max encounters a function that was not written within a #do, that word will be unbound. Since we cannot query each word for it's arity, how would we parse such a pattern? I figured that we would have to reflect on the function to find out how many args it takes, that would tell us(hopefully) when to stop, at least, in this case it would

[05:00](#msg581eb8daaa8f8c4b328f307c)I could just restrict the free form nature of red, I am completely comfortable with that(I love lisp after all), although, I do not know how well other redites would feel. If I make it more like lisp, by liberally applying blocks, this problem goes away, since the ambiguity of arity is eroded by block delimiters.

dockimbel

[05:06](#msg581eba69eed0c3125f408e9c)@JacobGood1 I pushed a fix for the issue.

JacobGood1

[05:09](#msg581ebb070d42ea911cbe7601)ty =)

dockimbel

[07:00](#msg581ed50545c9e3eb43032581)@JacobGood1 At compile-time, we would need to expose some compiler API in order to the macro to be able to extract the arity of a word. It would not be difficult to do, but such API is for Red 2.0, the current compiler is not a good fit for that, mostly because it is disposable and will be replaced by the self-hosted version in Red. At run-time, it would be possible to extract the arity (I wrote a function for doing that in the preprocessor: `preprocessor/fetch-next`).

[07:02](#msg581ed59c6cb72076304028bb)Overloading Red code with parens expressions would probably not be very appealing for common Redbol users. ;-)

JacobGood1

[14:27](#msg581f3db7aa8f8c4b328f4001)Sounds good, other lisps, like clojure, allow one to interleave macros with normal code without worrying where a symbol was defined. Of course, what I mean by not worrying , is that, the symbol has some sort of definition, it won't be undefined. One still has to worry about simple collisions amongst symbols; lisp has gensym for that. I assume that symbol collisions will be much less of a problem in red because of contextual binding. Anyway, red becomes a more exciting language every day =)

[14:31](#msg581f3ece0d42ea911cbe897d)&gt; Overloading Red code with parens expressions would probably not be very appealing for common Redbol users. ;-)

Well, they would be blocks... ;-)

dockimbel

[15:13](#msg581f488beed0c3125f42bbbd)@JacobGood1 Macros hygiene should be much less of a problem indeed in Red compared to Lisps. Though, in your tests, if you find cases where the runtime code gets messed up, please share them.

greggirwin

[16:54](#msg581f605be462097a30162b91)@JacobGood1, just for arity by reflection reference: https://gist.github.com/greggirwin/53ce7d1228422076e142fa5a061e7649

[16:57](#msg581f610031c5cbef43c24aa5)In the future, as we create example language implementations in Red, a Lisp should be high on the list (pun intended).

JacobGood1

[16:59](#msg581f618f0d42ea911cbe9138)high on the block, right?

[17:00](#msg581f61bd0d42ea911cbe9149)lol, anyway, lisp would be very easy to create in red, it's so close already

[18:05](#msg581f70f1b4046d90642c50b6)@dockimbel This locks up the console:

```
expand-directives [
    #macro [into ['max]] func [s e] [
        probe s
        remove s
        probe s
        e
    ]

    (max 1 2 3)
]
```

This does not:

```
expand-directives [
    #macro [into ['max]] func [s e] [
        probe s
        e
    ]

    (max 1 2 3)
]
```

[18:06](#msg581f712c0d42ea911cbe9562)This works as well:

```
expand-directives [
    #macro ['max block!] func [s e] [
        remove s
    ]

    max [
        1 2 3
        5 6 
    ]
]
```

[18:12](#msg581f7286aa8f8c4b328f49ae)So it appears it does not like into with remove? This also does not work:

```
expand-directives [
    #macro [into ['max block!]] func [s e] [
        remove s
        e
    ]

    [
        max [
            1 2 3
            5 6 
        ]
    ]
]
```

[20:28](#msg581f92510d42ea911cbe9bf2)Here is something else: https://gist.github.com/JacobGood1/ddb573bdf7cd13db81c38307a4221bb6

## Monday 7th November, 2016

JacobGood1

[15:30](#msg58209e08aa8f8c4b328f8c8d)This function specification does not work:

```
expand-directives [
    #macro ~>: func ['data code] [
        probe code
    ]
    ~> hi []
    1 + 1
]
```

it returns the following error:

```
*** Macro Error: invalid specification
*** Where: [~>: func ['data code]]
(halted)
```

obviously, this is a valid specification in good ol’ Red

dockimbel

[15:43](#msg5820a12aeed0c3125f497337)@JacobGood1 Lit-words are unnecessary in macros as arguments are never evaluated.

JacobGood1

[15:46](#msg5820a1c34aeee0634dc22089)I assumed that was the case initially, but I get this error when I do not quote:

```
red>> expand-directives [
[        #macro ~>: func [data code] [
[            probe code
[        ]
[        ~> hi []
[        
[    ]
*** Script Error: hi has no value
*** Where: ~>
```

[15:47](#msg5820a1f44aeee0634dc2208f)I thought that should expand to simply an empty block

dockimbel

[15:48](#msg5820a24d45c9e3eb430b2deb)@JacobGood1 Hmm, looks like there's an extra evaluation in the preprocessor which should not happen.

JacobGood1

[15:50](#msg5820a2c44aeee0634dc220bf)@dockimbel how about my previous posts, did you find something in there that revealed some bugs?

dockimbel

[15:52](#msg5820a34931c5cbef43c84b84)@JacobGood1 Odd cases. `into ['max]` should not match, as they are other value in the paren! in addition to `max`. Maybe a bug with the matched state in Parse.

JacobGood1

[15:54](#msg5820a3a00d42ea911cbede84)I thought the same thing but take a look:

```
red>> parse [[max 1 2 3]] [into ['max]]
== true
```

dockimbel

[15:54](#msg5820a3b9eed0c3125f498445)That's clearly a bug, please open a ticket for it.

JacobGood1

[15:58](#msg5820a4b30d42ea911cbedefb)done =)

dockimbel

[15:58](#msg5820a4ba6cb72076304892bf)Thanks.

JacobGood1

[15:59](#msg5820a4ff4aeee0634dc22259)Soon as it gets fixed ill test those macros again, though, I think there is probably still some sort of underlying issue not related to the parse error.

dockimbel

[16:00](#msg5820a5196cb720763048965f)Thanks for digging up those bugs, that's very helpful.

JacobGood1

[16:01](#msg5820a550aa8f8c4b328f90b3)it's no problem at all, for some reason I have a macro fetish... I feel ashamed...

dockimbel

[16:02](#msg5820a57c31c5cbef43c85a6b):)

JacobGood1

[16:03](#msg5820a5b40d42ea911cbee005)All kidding aside, if you remember to, send me a message when it's fixed because I don't usually check to see what issues have been fixed. I will retest things ASAP.

dockimbel

[16:07](#msg5820a6c9e462097a301c7192)I'm running the unit tests on the fixes, just wait a few minutes and they should be online. ;-)

[16:11](#msg5820a7ccdf5ae9664527ef13)Ok, both issues should be fixed now.

JacobGood1

[16:12](#msg5820a7fd4aeee0634dc22573)Well, that was fast. Guess I have to live up to what I typed.

[16:13](#msg5820a8434aeee0634dc22582)@dockimbel

I have some thoughts on reader macro replication in red.

I know that you said it was trivial to alter load for reader macro support, however, I still think some higher level facility should be in place that assists the programmer with altering how symbols are loaded. If it is extremely easy to alter load, so much so that handicap is not required, maybe that “higher level facility” could simply be some documentation on how to do it. In any case, how to alter the reader/loader/whatever-the-heck-it-is called-in-the-land-of-red should be easy and well known.

dockimbel

[16:15](#msg5820a8acc2f2cf7275df5edf)@JacobGood1 I'm not against a "higher level facility" if it has a significant advantage over just writing the equivalent Parse rules (e.g. avoiding long or complex rules would qualify).

JacobGood1

[16:49](#msg5820b0b54aeee0634dc22a37)Those errors are fixed good job.  
This code crashes the interpreter:

```
expand-directives [
    #macro [into ['max block!]] func [s e] [
        print "probe"
        ;probe remove first s
        probe remove s
        e
    ]

    [
        max [
            1 2 3
            5 6 
        ]
    ]
]
```

when

```
probe remove first s
```

is uncommented and

```
probe remove s
```

is commented it will run fine.

```
probe remove s
```

should just return an empty block.

maximvl

[16:54](#msg5820b1b831c5cbef43c8aef2)are there any docs about macro system available?

rebolek

[16:55](#msg5820b20b0d42ea911cbee57d)@maximvl I guess you are looking for https://doc.red-lang.org/preprocessor.html#macros

maximvl

[16:56](#msg5820b22ee462097a301cbb68)@rebolek yep, thanks!

JacobGood1

[17:07](#msg5820b4ceb4046d90642cacb4)the macro system is looking good, when pattern matching on syntax being able to use parse is wonderful

pekr

[17:36](#msg5820bba545c9e3eb430bd0a8)Ok, so we've got macros, now let's see, what are those used for in real Red life :-)

greggirwin

[18:38](#msg5820ca3331c5cbef43c9558f)@pekr, the average application programmer won't use them, but tool builders and people who do data transformation will. One place a regular user will benefit is Doc's example of a reader macro: https://github.com/red/red/wiki/Guru-Meditations#modifying-data-before-loading-it-lisp-reader-macros

[18:39](#msg5820ca7e6cb7207630498e01)As we know, this can all be done today. The importance is that it's another tool people can use to adapt Red to their needs and their way of thinking.

[18:40](#msg5820ca9be462097a301d614f)And thanks for breaking it already @JacobGood1! ;^)

[18:41](#msg5820cae9df5ae9664528d428)Rest easy, knowing that you're not likely to be blackmailed over this particular fetish.

JacobGood1

[18:44](#msg5820cb88aa8f8c4b328f9dbc)macros are an excellent abstraction for red modification; could you write your own expander/pre-processor... sure, but it is far better to have a standard that will get ironed out by many users

[18:45](#msg5820cbb8b4046d90642cb600)@greggirwin that's good =P, what do you think about the macros?

[18:47](#msg5820cc35aa8f8c4b328f9df5)@greggirwin thanks for that link, I am going to read it later on; it's just what I'm looking for... ruminations of the masters.

greggirwin

[19:26](#msg5820d558c2f2cf7275e0896f)I've spent many years without macros, so don't have a strong opinion yet. Once I have a need, or see an amazing example to borrow from, I'll know more.

JacobGood1

[19:27](#msg5820d5944aeee0634dc236cd)but I love strong uninformed opinions, they are the best!

pekr

[19:30](#msg5820d65545c9e3eb430c7874)Me, an uniformed Red follower likes that we can please Lisp fans :-)

JacobGood1

[19:40](#msg5820d8a4aa8f8c4b328fa15c)We can have a proper thread macro now =) (what you fellows were calling dot a few days ago)

dsgeyser

[20:03](#msg5820de1ec2f2cf7275e0bab5)Explanation of any use wrt Red?

http://www.greghendershott.com/2013/05/the-threading-macro.html

[20:09](#msg5820df5c6cb72076304a10c4)??? from article:  
First, the threading macros have nothing to do with concurrency.  
Instead, the macros “thread” values through a chain of function calls.

It expands into exactly the same code as above, but is easier to read as a series of transformations. The ~&gt; macro takes the result of each function, and “threads” it in as the first argument to the next function.

Correct assumption?

JacobGood1

[20:10](#msg5820dfa8aa8f8c4b328fa448)No need to assume when you are reading the definition of the macro. That is correct.

[20:13](#msg5820e087aa8f8c4b328fa491)lisp

```
(eeks (nested (something (do 100))))
(-> 100 do something nested eeks)
```

red

```
eeks nested something do 100
-> 100 [do something nested eeks]
```

dsgeyser

[20:15](#msg5820e0c46cb72076304a16c2)@JacobGood1 Thanks. Limited background. This makes sense to me. Trying to see the bigger picture.

JacobGood1

[20:18](#msg5820e1834aeee0634dc23c9b)@dsgeyser If you are new to Red, Lisp, homoiconic languages in general, I suggest just programming small fun things for now. It’s easier to see the bigger picture, in this puzzle, when you slowly place all the smaller pieces together =)

## Tuesday 8th November, 2016

maximvl

[10:33](#msg5821aa096cb72076304dee85)@JacobGood1 I don't see why we need a macro here

[10:33](#msg5821aa146cb72076304deeab)`->` can easily be a function

JacobGood1

[14:19](#msg5821dee0c48663546178cec0)We don't need a macro here... unless we have a desire to eliminate the run time cost of parsing. Things like this may seem benign until every little ounce in your code counts.

[14:21](#msg5821df70c48663546178cef0)Doc has mentioned before that he would like to be able to compile away parse in certain situations. A macro, essentially, gives you control to do just that.

[15:06](#msg5821e9dbc2c2b0744e3336bf)I don't know if this is a present concern, but placing a comma in an `expand-directives`(or a block! for that matter) gives an odd error message.

```
expand-directives [
    hi, there 
]
*** Syntax Error: missing #"]" at "es [    hi, there ]"
*** Where: do

expand-directives [
    hi there
    how, are you 
]
*** Syntax Error: missing #"]" at "es [    hi there    how, are you ]"
*** Where: do

hi,there
*** Syntax Error: invalid value at ",there"
*** Where: do

[hi, there]
*** Syntax Error: missing #"]" at "[hi, there]"
*** Where: do
```

[15:07](#msg5821ea4dd695f5db0f4d352e)looks like the es of directives is concatenated onto the error message

dockimbel

[15:08](#msg5821ea64e462097a30232d6c)It's not related to the preprocessor, but the runtime lexer, this will fail too: `[hi, there]`.

JacobGood1

[15:09](#msg5821ea8c35e6cf054772fc6f)Yea, I said that... I think you replied too fast =P(not a bad thing, lol)

[15:10](#msg5821eae1c2c2b0744e33387e)Since I have your attention, it looks like macros are working very well now. I am having no more errors and no more problems. I need to write more macros to find more strange edge cases but for now I am having no errors. Awesome job!

dockimbel

[15:11](#msg5821eb3e45c9e3eb431208e8)Right, sorry, overlooked your message.

[15:12](#msg5821eb69df5ae966452eecfe)Thanks! There are still some bugs to fix there, like the error generated by `expand-directives [200x0]`.

JacobGood1

[15:12](#msg5821eb7bc48663546178d663)Like I said it was not a bad thing, better to have someone consider your message quickly than to wait forever

[15:15](#msg5821ec09c2c2b0744e3338f7)I am sure that error messages being improved is somewhere on the back burner... When you're implementing ways of dealing with errors that will be another thing that we can look at common lisp for. Hopefully, we'll be able to mine some more ideas from lisp.

dockimbel

[15:22](#msg5821edb645c9e3eb431217b6)There's a lot of space for improvement in errors handling in Redbol. Though, you can already catch, inspect, modify and fire again errors in Red.

maximvl

[15:24](#msg5821ee2631c5cbef43cf1951)@dockimbel it seems that `#local` macro hangs the interpreter:

```
> cat macro.red
Red []

print system/build/date

#local [
   #macro integer! func [s e] [s/1: s/1 + 1 next s]
   probe [1 + 2]
]
probe [1 + 2]
> red macro.red
^C%
```

[15:25](#msg5821ee6378ec59ab054a6c0e)and without `#local` it works fine

[15:26](#msg5821eea778ec59ab054a6dac)btw, these pattern-matching macros are so sick, I think even lisps don't have anything similar

[15:26](#msg5821eeb345c9e3eb43121dc4)sick in a good way :)

[15:38](#msg5821f1916cb72076304f7fce)btw, are these macros also available at runtime, or only named ones?

dockimbel

[15:39](#msg5821f1c1e462097a30235b3e)Both types of macros are available at compile and runtime.

JacobGood1

[15:40](#msg5821f1d8c48663546178da0c)The pattern matching macros, I think, were directly influenced by Shen... A lisp with pattern matching macros.

dockimbel

[15:40](#msg5821f1ef31c5cbef43cf2f06)Pattern-matching macros are just a very thin layer over Parse dialect.

maximvl

[15:40](#msg5821f200e462097a30235cf0)but how do I use runtime version?

```
red>> #macro integer! func [s e] [ if s/1 > 5 [s/1: 5] next s]
== func [s e][if s/1 > 5 [s/1: 5] next s]
red>> probe [1 2 3 4 5 6 7 8 9 10]
[1 2 3 4 5 6 7 8 9 10]
== [1 2 3 4 5 6 7 8 9 10]
```

dockimbel

[15:41](#msg5821f21d31c5cbef43cf2fd1)@maximvl Use `expand-directives` function. See https://doc.red-lang.org/preprocessor.html

maximvl

[15:42](#msg5821f28245c9e3eb431236fb)it works, nice

JacobGood1

[15:43](#msg5821f2a1c48663546178da5e)Anyway, when we were discussing macros a long time ago I pointed to Shen for influence... They seem to be really good fit for such a free-form language.

[15:44](#msg5821f2e235e6cf054772ffb3)Shen even uses block syntax just like rebol

maximvl

[15:52](#msg5821f4c945c9e3eb43124430)@dockimbel some interesting behaviour:

```
red>> probe load %test.red
[x: 1 
    y: 5 
    z: 10 
    x + y + z
]
== [x: 1 
    y: 5 
    z: 10 
    x + y + z
]
red>> no-big-nums: [ #macro integer! func [s e] [ if s/1 > 5 [s/1: 5] next s ] ]
== [#macro integer! func [s e] [if s/1 > 5 [s/1: 5] next s]]
red>> expand-directives reduce [ no-big-nums load %test.red ]
== [[] [x: 1 
    y: 5 
    z: 5 
    x + y + z
]]
red>> expand-directives reduce [ no-big-nums load %test.red ]
== [[] [x: 1 
    y: 5 
    z: 10 
    x + y + z
]]
red>> do last expand-directives reduce [ no-big-nums load %test.red ]
== 16
```

[15:53](#msg5821f50ae097df757586e151)I would expect result to be `11`, but as you see even the second `expand-directives` doesn't return same as the first one

JacobGood1

[16:01](#msg5821f6bec48663546178ded9)I wrote a threading macro that uses underscores to denote where the data should be processed. The macro uses new lines to figure out where a function begins and ends. So if we have source code that looks like this:

```
"this is now just code 100 + 100"
    ~> hi [
        there _
        this _ works fine
        macros are 1 2 3 _ great!
    ]
    "no block left just clean code"
```

it transforms into this:

```
"this is now just code 100 + 100" 
macros are 1 2 3 this there hi works fine great! 
"no block left just clean code"
```

the advantages of this versus a function have already been discussed. The disadvantages of the macro is composition ability.

Map filter and reduce are commonly known in functional languages. They are just functions that help transform data structures. Functions are higher order so they can be passed to other functions. In the case of the macro, because it will be expanded before source is fully read, or because it is burned straight into the image, it cannot be passed as a function.

Let me detail map right quick, map simply applies a function to each element in a data structure and returns a new data structure with the transformed elements.

````
if we were to pass the threading macro to ```map``` like this:
````

map ~&gt; [  
hi [  
do _  
stuff _  
to-hi _  
]  
]  
newline-of-code  
\`  
The threading macro will try to grab the block and the very next thing that appears after the block, which, in this case, is newline-of-code. We really have no idea what the heck will happen with that combination. I can almost assure you that it will do something that you did not desire. The composition issue can be circumvented by encoding more patterns using the pattern matching macro ability that red now provides. There are some lisps(not all) that do not even provide such a facility, 1up for red. However, pattern matching macros do not entirely wipe away composition issues because, now, one has to write a pattern for every single place where composition is desired. These are the negatives that one must live with when the language, that they are using, affords so much power.  
 

maximvl

[16:05](#msg5821f7df78ec59ab054aa5bb)I would say macro system is good enough for now, let's bring some IO to the Red land :)

JacobGood1

[16:07](#msg5821f82ed695f5db0f4d3c91)I do not think it can get much better... sure there is some low hanging fruit but the foundation is very strong

dockimbel

[16:58](#msg5822043b31c5cbef43cfa52f)@maximvl `expand-directives` will reset all macros on each call. It is missing a refinement to enable keeping them across calls.

## Wednesday 9th November, 2016

DonaldTsang

[08:40](#msg5822e0e06cb7207630543729)@maximvl you mean RPi, BBB or Arduino inputs?

maximvl

[11:08](#msg582303ad78ec59ab054ffc27)@DonaldTsang more like read/write files, sockets, etc

dockimbel

[12:06](#msg58231135e097df75758c95a9)@maximvl You're aware you can read/write files already?

DideC

[12:08](#msg582311a5df5ae9664534f610)Sure he is.

[12:11](#msg58231278df5ae9664534f9ec)@DonaldTsang Actually Red use a simplified I/O stack to allow basic files and HTTP reads/writes.  
But the full I/O stack is to be constructed whith what we call `Port!` at the low level. `Port!` model will be used for all I/O (files, network, physical ports, maybe sound too...).

maximvl

[12:35](#msg5823180ee462097a30293b15)hm, if I want to write SQLite lib for Red, where should I start? Do we have some kind of `FFI`? Should I use RS for this or is it possible to do in Red?

pekr

[16:13](#msg58234b3545c9e3eb43194a1e)Create a R/S wrapper ...

[16:14](#msg58234b4b45c9e3eb43194a8b)There's some Kaj's work already in that regard IIRC ...

[16:15](#msg58234b9a31c5cbef43d61d83)http://red.esperconsultancy.nl/Red-SQLite/info/4d2dbf32eb54cc8c - not sure how Kaj aproached it, though. You could also look at some R2 drivers at rebol.org, and be inspired for the R/S port ...

[16:15](#msg58234baee462097a302a709d).... minus the port! type stuff, which we don't have yet

maximvl

[16:15](#msg58234bba78ec59ab0551c282)@pekr is there any example of how does R/S wrappers look like?

pekr

[16:21](#msg58234cfb31c5cbef43d62625)not sure, apart from understanding official R/S docs. You can try RedOpenCV3 binding, but it's quite complex - https://github.com/ldci/OpenCV3-red

JacobGood1

[16:23](#msg58234d8635e6cf0547735980)@maximvl Just play around with red system, people from the red community will help you out. I spent about a month of free time on red system, it was the first time I ever did system level programming. I was able to get somewhere with it because of all the help I received

maximvl

[16:28](#msg58234eca31c5cbef43d62e30)@JacobGood1 @pekr ok, thanks, I'll try it out

dockimbel

[16:34](#msg5823502f78ec59ab0551df62)@maximvl I've fixed the freezing issue with `#local`, thanks for reporting it.

[16:37](#msg582350d8e462097a302a8e97)@maximvl We don't have FFI support at Red-level yet (though it should arrive soon), but we have a strong one at R/S level. There is already a \[SQLite binding](http://red.esperconsultancy.nl/Red-SQLite/dir?ci=tip) available by the way.

## Wednesday 23th November, 2016

JacobGood1

[18:07](#msg5835dac59fd0a9bb4709f689)I was wondering about how difficult it might be to optimize functions, the fundamental building block of red... this lead me down an interesting path of historical lisp adventures. I discovered many things from a small debate that HostileFork started on hacker news: https://news.ycombinator.com/item?id=11587952

One guy had claimed that lisp had performed a "rebol ectomy" long ago, deeming its form of programming inferior. Lispers call the rebol context form of programming... fexpr: https://en.wikipedia.org/wiki/Fexpr

The reason that lispers think that fexprs are bad is because of optimization issues. These issues were outlined mainly from this paper: http://www.nhplace.com/kent/Papers/Special-Forms.html Fexprs were removed from most lisp dialects and the rest is history.

However, someone named John N. Shutt decided that this type of programming was worth exploring some more. He concluded that fexpr programming was superior to the lambda expression style found in most lisp dialects today. His research can be found here: http://web.cs.wpi.edu/~jshutt/kernel.html

To conclude, it appears that the lisp community looks down upon the rebol way of programming, because of the difficulty in making fexpr fast. However, it seems that there is a niche of lispers that believe it is superior. I agree with the niche, especially after slogging through all of this. I thought I would post this so that others might be able to find some use out of this information. Maybe Doc can find some useful information in here for optimization techniques.

[18:16](#msg5835dce79fd0a9bb4709f6d7)I forgot to link this post is well: http://axisofeval.blogspot.co.id/2011/07/meaning-of-forms.html  
This is another lisper who advocates for fexpr programming.

greggirwin

[19:32](#msg5835eebe2db952670471e9a7)Lots of reading to do there, which is good. Until I have time to dig deep, a scan of things leads to a couple thoughts:

1\. Red isn't Lisp, but I can see how "pure Lisp" looks nicer from that side.

2\. To say macros are better only means they're better in a Lisp context, and is there anything more than anecdotal argument of what "better" means?

3\. Rebol 1 was written in Scheme, IIRC, but changed to C for performance reasons. So when we look at what needs to be optimized we also need to ask \*why* something needs to be optimized, and what the cost is of doing so. e.g., what might we give up?

JacobGood1

[19:33](#msg5835ef1723157bcb1cc1eaf9)You might have scanned too lightly =P

greggirwin

[19:34](#msg5835ef3ecc0ea2cf77897d13)I approve of Lispers saying "Yeah, we don't need that, it's just not Lisp-ish.". Language integrity is important.

[19:35](#msg5835ef84bc17b2e7560960cf)And Lisp doesn't have `parse`.

JacobGood1

[19:37](#msg5835f002c0a2732923009f40)Here let me help out...

tldr, the historical view of fexpr is wrongly predicated on previous research, newer research shows it is feasible and superior

[19:43](#msg5835f16f52af72f05433bf12)parse does exist in many lisp dialects under different names, and different techniques... in common lisp it is a library download away. I am just showing that there has been lisp research into fexprs that is very positive. I am not comparing features of two highly flexible languages, which, to me, seems like an exercise in futility. Lisp and Red programmers can easily add features to their languages in a given weekend.

greggirwin

[19:44](#msg5835f1a1c790e0ec56232383)OK, thanks. Great that Shutt has shown that. So \*old* Lisp and fexpr didn't mix, but change a couple things in the Lisp and they can get along.

JacobGood1

[19:47](#msg5835f23a23157bcb1cc1eba1)Absolutely, that and add a bunch of datatype syntactic sugar, drop the parens, and... well here we are =P

rebolek

[20:55](#msg5836024f52af72f05433c276)@JacobGood1 I don’t understand it. \*fexpr is a function whose operands are passed to it without being evaluated* - but they are evaluated in Red?

## Thursday 24th November, 2016

dockimbel

[02:30](#msg583650bcc790e0ec562524a3)@JacobGood1 Thanks for the links, I went through some of them. I'm aware of `fexpr` and its controversy in Lisp.

[02:31](#msg583650e5b07a1fd34834ef7d)@rebolek `fexpr` are equivalent to Red functions with quoted arguments in the spec block.

rebolek

[06:29](#msg583688c2c0a273292300c3c6)@dockimbel Thanks, I thought so, it was just not very clear to me.

geekyi

[13:30](#msg5836eb92444b3778764f593c)@JacobGood1 interesting find!

[13:35](#msg5836ecb689d179bf4dbcc59f)It's also interesting that Rebol 1 was written in scheme, and had tail recursion (and was immutable?). That is one of the more interesting historical tidbits

[13:36](#msg5836ece5381827c24d76bbcc)@geekyi used to think until recently that scheme was a totally different thing from lisp

[13:37](#msg5836ed148d65e3830e95284e)@geekyi is now of the understanding that common lisp and scheme are both lisps

maximvl

[13:42](#msg5836ee3c16207f7b0e9d6ac6)and clojure also

geekyi

[13:52](#msg5836f0aa16207f7b0e9d78ff):+1:

dockimbel

[13:56](#msg5836f18216207f7b0e9d8021)@geekyi Rebol 1.0 had continuations also (all control flow functions where written using continuations) and was written in C if I'm not mistaken (I started with Rebol 2.0). Also, I don't remember series to be immutable in Rebol 1.0 when I played with it. Maybe @gregg knows more about it.

maximvl

[13:57](#msg5836f1d88255fe6b76c3077f)continuations, wow, most languages nowadays don't support them

rebolek

[18:25](#msg583730a9b9016e421494539e)@dockimbel no, Rebol 1.0 was written in Scheme. I remember playing with it on my Amiga 1200/030-50 (like that numbers mean anything to anybody). It was slow. Rebol 2.0 was fast. Noticeable faster. Buggy, but much faster. Like there was no lag in terminal. That was a real game-changer for me. Even with the bugs.

JacobGood1

[18:27](#msg58373101c5bc35217da2d256)I am surprised that it was never written in common lisp, I suppose that Carl was not a fan.

[18:27](#msg58373129c5bc35217da2d25a)Common Lisp is very practical but it is very ugly to most programmers

rebolek

[18:28](#msg583731418d65e3830e96b491)@JacobGood1 Carl didn’t wrote Rebol 1.0.

JacobGood1

[18:28](#msg58373164c5bc35217da2d269)Really, wow... This whole time I thought that he created the language.

rebolek

[18:29](#msg5837318b1dec193f14e66fa0)@JacobGood1 You’re right, he designed the language,but didn’t wrote first implementation.

JacobGood1

[18:30](#msg583731c4c5bc35217da2d288)I see

rebolek

[18:31](#msg58373208b9016e4214945add)Someone else did it (Jeff Kreis IIRC), but Carl wasn’t happy with the implementation, so he rewrote Rebol2 in C.

[18:32](#msg583732411dec193f14e6748a)That were the early days of Rebol Technologies, when it has employers.

JacobGood1

[18:32](#msg5837325738afd97d3b82e090)I would imagine so, scheme has historically been a slow but pretty lisp

rebolek

[18:34](#msg583732c089d179bf4dbe6561)@JacobGood1 IIRC, if you look hard enough, the source for Rebol1 is available online.

[18:45](#msg58373539b9016e421494710e)(hard enough = it is not illegal to download it,it is just hard to find)

greggirwin

[20:51](#msg583752ec444b37787651a073)I think Joe Marshall wrote Rebol 1.

[20:53](#msg5837535f89d179bf4dbf0d61)http://ll1.ai.mit.edu/marshall.html

[20:57](#msg5837543489d179bf4dbf1169)https://github.com/akavel/sherman

## Friday 25th November, 2016

rebolek

[05:04](#msg5837c676444b3778765375ba)@greggirwin thanks for correcting me

dockimbel

[05:35](#msg5837cda689d179bf4dc10b25)@rebolek  
&gt; no, Rebol 1.0 was written in Scheme.

I'm curious how you found out about it, as I couldn't find any online info about it. Was it mentioned on the ML back in 1.0 days?

[05:38](#msg5837ce438255fe6b76c71d93)@rebolek You need to send some a link to 1.0 sources then, I could never find that.

pekr

[13:11](#msg5838386c8d65e3830e9b8fd8)I remember Scheme mention too. Later on, Joe Marshall, its author, had soe neative comments on some R2 decisions, not sure, if the article is still available.

[13:13](#msg583838e7381827c24d7d153f)However, R1 was order of magnitude slower, much bigger, no parse, no networking. Although it had tail recursion, Carl did some practical decisions, making much faster, smaller and more compete package ..

rebolek

[16:05](#msg5838614f381827c24d7e0189)@dockimbel see @greggirwin links.

dockimbel

[16:50](#msg58386bbf444b37787656d7d6)@rebolek I know those resources, they talk about a toy Rebol 1.0 compiler (Sherman) and a toy interpreter, both written in Scheme, but that's not the Rebol interpreter. Actually, they seem rather to hint at C when looking at the "Implementation in C" part. Joe is using Scheme for modeling and researching, but aims at a final implementation in C.

## Saturday 26th November, 2016

rebolek

[16:54](#msg5839be49381827c24d8391b3)@dockimbel this is interesting, I always that R1 slowness was caused by it's Scheme implementation. I certainly do not have anything to supported my claim, it is just one of those trivias.

[16:54](#msg5839be63381827c24d83921b)Thanks for correcting me, if I was wrong.

dockimbel

[18:02](#msg5839ce4316207f7b0eaabb59)Well, I was not there during 1.0 times, so can't say if my guessing is right or not. From what I remember from BrianH posts, R1 had lexical scoping, and word lookups were killing performances. R2 changed that radically.

maximvl

[19:00](#msg5839dbd7444b3778765c884d)is this intended behaviour?

```
red>> compose [a ([])]
== [a]
```

greggirwin

[19:07](#msg5839dd8516207f7b0eab099f)Yes.

```
red>> compose/only [a ([])]
== [a []]
```

maximvl

[19:08](#msg5839dda173abd79c559cf8cd)@greggirwin ok, thanks)

JacobGood1

[19:37](#msg5839e4798e29aeee601a679a)@rebolek scheme was always one of the slower dialects... still is

[19:38](#msg5839e4c938afd97d3b83528c)@dockimbel how is it done now are they struct references underneath or something like that?

## Sunday 27th November, 2016

justinthesmith

[05:20](#msg583a6d231dec193f14f4d302)Thanks for the trip back in time. I just recently bumped into my physical copy of the Rebol Core 1.0 manual (with 1.0.1 addendum inserted) from 1998. Original floppy and everything. Was taking a Scheme class at the time but had no idea Rebol was written in Scheme too! Those numbers mean a lot to me @rebolek, given my A4000/040-25 with Picasso IV at the time!

## Wednesday 30th November, 2016

dockimbel

[12:21](#msg583ec43016207f7b0ec449c4)@JacobGood1 You'll be glad to know that we devised some plans today at the office, with regard to syntactic macros support in Red. ;-) Though, probably not for the upcoming release, as it is already heavy enough.

[12:22](#msg583ec4818d65e3830ebbc40b)I'm also finishing a (probably too long) article about macros in Red. I hope it can be published in a few hours on the blog.

rcqls

[12:26](#msg583ec586381827c24d9d0a67)@dockimbel Nice!

maximvl

[13:15](#msg583ed0ec444b377876755274)@dockimbel great, can't wait for article, also don't forget to submit it to HN/Reddit/etc ;)

## Thursday 1st December, 2016

JacobGood1

[04:02](#msg583fa0f073abd79c55baf17c)@dockimbel thanks for the news, can't wait to read the article and to see what else you have devised =)

geekyi

[14:11](#msg58402fad73abd79c55bde184)@maximvl somebody always does I think. That was in fact how I discovered Red lang

## Friday 2nd December, 2016

dockimbel

[06:29](#msg584114c889d179bf4df062f4)For HN, it needs to be submitted by someone having a high karma in order to have a better chance to land on the front page. My karma is very low (58), so I should better avoid posting links myself.

rebolek

[06:43](#msg58411806b4d7ca3b7a189907)Hm, with 32 I can’t help here very much :baby\_chick:

JacobGood1

[13:54](#msg58417d1fc5bc35217da48a13)does hacker news get that much traffic anyway?

geekyi

[14:25](#msg584184598255fe6b76f7a4bf)@JacobGood1 Yes! If it hits front page

dockimbel

[15:16](#msg5841906489d179bf4df324d4)@JacobGood1 We usually get between 15k and 30k views from HN if the article makes it on front page.

JacobGood1

[15:33](#msg5841944e7e2af9d12299bc5c)Oh ok, thanks for the data

[16:26](#msg5841a09b9ce5147013cbed9b)found some more interesting fexpr conversation: https://news.ycombinator.com/item?id=11300693

## Saturday 3th December, 2016

dockimbel

[04:42](#msg58424d5144f3e83528cf51f3)@JacobGood1 Funny that "Joe Marshall" (Rebol 1.0 implementator) is cited in the comments. ;-)

[04:43](#msg58424d8e44f3e83528cf524a)For FEXPR, they could be trivially added to the interpreter, though, I don't see how we could support them in the compiler (at least not with the current way it works). The only way I can think of, would be to store all the code blocks where a FEXPR is called in the executable, and pass them to the interpreter instead of compiling them. The FEXPR function body could still be normally compiled though.

JacobGood1

[14:56](#msg5842dd259ce5147013cc0e14)I agree with Doug Hoyte who says that lisp is not a functional language, it is said over and over that it is but that could not be further from the truth: http://letoverlambda.com/index.cl/guest/chap5.html

## Saturday 10th December, 2016

JacobGood1

[03:19](#msg584b74439ce5147013cd23fe)Bunch o stuff about vms: https://www.youtube.com/playlist?list=PLJq3XDLIJkib2h2fObomdFRZrQeJg4UIW  
posted here because there is less activity so it is less likely to be lost.

geekyi

[21:01](#msg584c6d43c29531ac5d48521d)If I write videos about virtual machines, would it be easier to search in the future ;)

## Tuesday 13th December, 2016

DonaldTsang

[04:51](#msg584f7e3abe9d43bc6352ded0)@maximvl @dockimbel should I write a list of websites that we should tackle? Voat, Reddit, HN and lainchan.org/lam seems to be good candidates.

geekyi

[16:37](#msg585023bcb4ffd59e38231c03)@geekyi sees @maximvl has taken instructions from http://stackoverflow.com/questions/12607716/setting-the-slime-in-emacs

maximvl

[16:38](#msg585023fabb7d528222f30539)@DonaldTsang no, I took them from the quicklisp page

geekyi

[16:38](#msg58502418be9d43bc6356a02e)@DonaldTsang what are those websites? (I'm missing the context)

maximvl

[16:39](#msg585024300da034021ba52933)https://www.quicklisp.org/beta/

DonaldTsang

[17:19](#msg58502da8bb7d528222f34d4f)@maximvl https://reddit.com/ and https://voat.co/ are aggregate websites, HN is the shorthand for hacker news a.k.a. https://news.ycombiner.com/ , and 8ch.net/tech/ endchan.xyz/tech/ lainchan.org/lam/ are all programming imageboards that likes anything functional programming related.

greggirwin

[18:02](#msg585037a8f666c5a1380a7623)@JacobGood1 thanks for the VM playlist link. I finally started playing some in the background and the Cliff Click talk is \*great\*. Talk about drinking from a fire hose. High level advice, low level details. That, right there, is the voice of experience. Very relevant for Red, too, I think.

## Saturday 17th December, 2016

JacobGood1

[17:49](#msg58557a9bd99b1dd03d2cfa18)&gt; @JacobGood1 Very relevant for Red, too, I think.

I thought so as well =)

## Thursday 22nd December, 2016

greggirwin

[18:51](#msg585c2098af6b364a29e5ffe8)Watched some more of the VM talk about http://microvm.github.io/. Good stuff. I like his point about analyzing compiler optimizations and learning that only inlining and register allocation are worthwhile. Had it playing off to the side while I worked, so only caught some stuff peripherally.

[18:52](#msg585c20fa0730ce6937fb0896)@JacobGood1 , do you think it could be a viable back end target for Red? Maybe not far enough along, but very interesting.

JacobGood1

[21:32](#msg585c4678db9cafe9183a484c)@greggirwin doc would be the one to ask, I know basically nothing about how red is implemented

[21:34](#msg585c46de61e516c1578ec470)I imagine that red's requirements are very unique since most languages can be optimized based on their structure... how do you optimize a language where the structure of the program can change at any moment? You could say that this question has already been asked in dynamic languages, but dynamic, in terms of red, means something else altogether.

[21:39](#msg585c481bdb9cafe9183a4877)My guesses are not very educated either. My speculations about red are just shots in the dark; I have no experience with implementing languages(at the low level, macros do allow one to do high level language creation), creating vms, etc.

greggirwin

[21:49](#msg585c4a617a3f79ef5d8deaa8)I think JIT plays a large role there, but the Mu model seems very different than LLVM, from the talk, much more like a microkernel than a monolithic system.
