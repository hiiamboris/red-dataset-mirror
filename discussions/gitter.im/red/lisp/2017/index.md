# Archived messages from: [gitter.im/red/red/lisp](/gitter.im/red/red/lisp/) from year: 2017

## Wednesday 4th January, 2017

DonaldTsang

[09:55](#msg586cc6a8af6b364a292c0deb)Happy New Year!

## Saturday 4th February, 2017

JacobGood1

[23:54](#msg589669c273e8cb0a09192907)Does any one know if macros are expanded inside of blocks? I assume that they are but I wanted a confirmation.

[23:57](#msg58966a543bcc9b3b25ddab42)oh nm it was an easy check to make

[23:57](#msg58966a813f5ec4d00757a55e)anyway, with a macro it is easy to do this:

```
parse [1 2 3 4 10 123] [to-num 123 integer!]
```

which returns true

[23:58](#msg58966aae1319d8183ef24c41)let me know what I could do to simplify or clean this up:

```
#macro to-num: func [n /local special-context temp] [
		special-context: to word! append append "special-context" class-of object [] random 999999
		set :special-context object copy/deep [
			temp-rule: [
				set num integer! 
				mark: 
				(mark: back mark) 
				:mark 
				none 
				| 
				skip 
				temp-rule
			]
		]
		temp: get special-context
		compose/only copy/deep [
			(head insert at temp/temp-rule 4 append/only [if] to-paren append "num = " n)
		]
	]
```

Skrylar

[23:59](#msg58966ad9a5805a273e153445)that looks crazy

JacobGood1

[23:59](#msg58966ae75bc3025608c9ae5f)I am not certain about formatting of red code, seems to be a little difficult

## Sunday 5th February, 2017

JacobGood1

[00:00](#msg58966b215bc3025608c9aee8)@Skrylar well it works =), and it gives us to-num and thru-num(didnt paste thru-num, pretty much the same)

PeterWAWood

[00:10](#msg58966d6a73e8cb0a0919366a)@JacobGood1 Seems a lot of work to do:

```
red>> parse [1 2 3 4 10 123] [to quote 123 integer!]
== true
```

JacobGood1

[00:48](#msg5896764ea5805a273e156252)Oh I did not see that example

[00:48](#msg58967661a5805a273e1562dc)Thanks @PeterWAWood

[00:50](#msg589676d33bcc9b3b25dde086)That would have immensely simplified the macro... this is why I need to program more in red

greggirwin

[02:16](#msg58968afb1319d8183ef2c743)Also, formatting `parse` rules is always tricky. We tend to want concise formats, but that breaks down a bit when you have complex words and actions to go with them.

## Saturday 1st April, 2017

maximvl

[13:11](#msg58dfa71f7ea420cc42293fd4)@dockimbel @JacobGood1 @greggirwin (poor man's) CL dynamic variables:  
https://gist.github.com/maximvl/2095276ba6000c644d11049227176e68

[13:12](#msg58dfa73f8bb56c2d116552eb)turns out it wasn't hard to implement :D

greggirwin

[17:31](#msg58dfe3eabc370d964edaea6a)Cool Max. Did you see when Doc and I posted our `let` funcs some time back? Here's Doc's refactoring of mine:

```
let: function [spec body][
    words:  extract spec 2
    values: extract/index spec 2 2
    forall words [words/1: to-word words/1]

    orig-vals: reduce words
    set words values
    also try body set words orig-vals
]
a: 1
aa: does [a]
let [a: 2][print [a aa]]
let [a: 3][let [a: 2][print a] print a]
```

Rebol had a `use` func which created a `closure!` in R3, but could only take words to capture, not initial values to assign to them. I have some old funcs that were along these lines as well.

```
;!! There is a risk here. If the object does NOT contain words set in
;   the body, they will escape and bind to an outer context.
with: func [
	object [object! none!]
	body   [block!]
][
	if object [do bind/copy body object]
]
o: context [a: 1 b: 2]
oo: context [a: 3 b: 4]
with o [a + b]
with oo [a + b]
```

```
using: func [
	"Like USE, but combines the local words and their initial values in a spec block."
	spec [block!] "Spec-block format of words and values"
	body [block!] "Block to evaluate"
][
	with context spec body
]
using [a: 3 b: 5] [a + b]
```

[17:33](#msg58dfe485f22385553dfbe165)There are a few idiomatic things in your code that might be nice. e.g., rather than `dynamic-words/(word)`, use `get-word!` syntax: `dynamic-words/:word` And if you use `foreach [word value]` rather than `forskip`, you can do `dynamic-words/:word` instead of `dynamic-words/(words-values/1)`.

[17:39](#msg58dfe5bfbc370d964edaf15f)`with-dynamic` helped me see how it works better. I found a couple more CL notes as well.

What we need now is to look at the various scoping mechanisms, come up with a minimal combination of them that have good names and cover the behavior space. Then just test the heck out of it, including with `function` capture, and write one heck of an article that explains it all, including why each exists and how to use them effectively.

maximvl

[19:08](#msg58dffaa68e4b63533d87bab8)@greggirwin nice, thanks for examples and comments!

[19:09](#msg58dffad1bc370d964edb4592)@greggirwin in your `let` example you use `set`, doesn't it mean it will only work for global words?

## Sunday 2nd April, 2017

maximvl

[07:13](#msg58e0a4877ea420cc422c8263)@greggirwin there are problems with `let` function you posted:

```
>> x: func [a] [probe a let [a: 2] [probe a] probe a]
== func [a][probe a let [a: 2] [probe a] probe a]
>> x 10
10
2
10
== 10
>> a
*** Script Error: a has no value
*** Where: catch
```

[07:13](#msg58e0a4a64cb8d091734e1037)I didn't get it, how does it work? I though `set` sets global words, but looks like it's not the case

[07:17](#msg58e0a58dbc370d964edd4854)looks like `set` finds word's context and changes value there

[07:18](#msg58e0a5e08fcce56b20c0204f)

```
>> c: context [y: 10]
>> y: 5
== 5
>> c/y
== 10
>> b: [y]
== [y]
>> do b
== 5
>> bind b c
== [y]
>> do b
== 10
>> set b/1 15
== 15
>> y
== 5
>> c/y
== 15
```

[07:19](#msg58e0a5e54cb8d091734e1401)okey :)

greggirwin

[18:26](#msg58e14257bc370d964edf7f9a):^) Sorry I didn't answer quicker.

## Monday 3th April, 2017

r\_mohan\_twitter

[13:26](#msg58e24d86ad849bcf424867bb)Have simple lisp question.

[13:27](#msg58e24daef22385553d0439ff)for exploratory-move? = (&lt; (random 1.0) epsilon)  
do  
(when (terminal-state-p new-state)  
(unless quiet (show-state new-state))  
(update state new-state quiet)  
(return (value new-state)))

[13:27](#msg58e24dca68bee3091f0664f1)Is this loop executed only if exploratory-move? is true ?

greggirwin

[17:38](#msg58e28887b52518ed4dd68346)@r\_mohan\_twitter, while this room has Lisp in the title, it's a sub-room for the Red language. Red inherits from Lisp, but you may have better luck getting an answer in an official Lisp support area.

JacobGood1

[22:00](#msg58e2c5e18fcce56b20c865a1)also make sure you are asking in a channel that pertains to the particular dialect of lisp you are using

## Tuesday 4th April, 2017

geekyi

[14:57](#msg58e3b441f22385553d0a4d59)@r\_mohan\_twitter also don't forget to check out \[red](http://www.red-lang.org/p/about.html) , it is at least just as powerful (IMHO) and interesting.. also then you \*might* be able to post lisp code here ;P

JacobGood1

[15:05](#msg58e3b6234cb8d091735a28e1)@geekyi it is objectively more powerful than most lisp dialects at this point at the language level(lisp repls are still way ahead but well give red time for that)

geekyi

[15:29](#msg58e3bbd468bee3091f0c929c)@JacobGood1 is it possible to make a list of reasons why red is "objectively more powerful than most lisp dialects"?

[15:29](#msg58e3bbed7ea420cc4238eaba)I don't know lisp enough right now..

JacobGood1

[15:32](#msg58e3bc89f22385553d0a7cd2)I talked about it the other day, it is a simple concept but it is hard to explain(like math).  
See the red channel: :point\_up: \[April 2, 2017 9:52 AM](https://gitter.im/red/red?at=58e1022f7ea420cc422dc25c)

[15:39](#msg58e3be268e4b63533d9631e3)@geekyi here is a paper that talks about a lisp that has, roughly, semantic equivalence with red: https://web.wpi.edu/Pubs/ETD/Available/etd-090110-124904/unrestricted/jshutt.pdf  
Here is the website: http://klisp.org/

In the lisp tradition, red style programming where the code is composed of data structures that can be changed at any time were referred to as fexpr.  
Any lisp that is not implemented with fexpr loses some abstraction power, making it less powerful than a lisp that does, thus making most lisp implementations slightly less powerful than red.

geekyi

[15:44](#msg58e3bf44ad849bcf424e9ef1)Oh, I remember you posting about `fexpr`, at the time I didn't understand the significance

[15:44](#msg58e3bf77408f90be6689c9e8)I try to read everything posted in the red channels :laughing: but I sometimes forget what I've read

JacobGood1

[15:45](#msg58e3bf96ad849bcf424ea093)subjectively, red is more readable than that klisp kludge as well =)

## Tuesday 11st April, 2017

dockimbel

[07:31](#msg58ec8639f22385553d2cb001)@JacobGood1  
&gt; @geekyi it is objectively more powerful than most lisp dialects at this point at the language level(lisp repls are still way ahead but well give red time for that)

Could you please list the features you think Red's repl should have to catch up? I'm curious to see how we could improve our repl further.

[07:34](#msg58ec86fbbdf4acc1124a3548)@maximvl  
&gt; I didn't get it, how does it work? I though `set` sets global words, but looks like it's not the case  
&gt; looks like `set` finds word's context and changes value there

You figured it out yourself. ;-) `set` is unrelated to global context or any context, it just sets the argument word(s) value in the context where they are defined. The fact that `set` is often use as a way to set a word in global context is only due to the fact that the argument is a `word!` or `lit-word!` and not a `set-word!`, so that it is not rebound by various context constructors (`function`, `object`, ...).

JacobGood1

[15:24](#msg58ecf51cf22385553d2eb2bc)@dockimbel the lisp repl feature list is huge, I will only list a tiny fraction of features for now.

Repl History:  
\-when one presses up the repl should return the last expression entered not the last line entered.  
\-the cursors last position should be remembered, when pressing up the cursor should go back to where you were working before  
\-history should be searchable and should be remembered between sessions.

Repl Startup:  
\-We should be able to load any library or file upon startup automatically.

Repl User Friendliness:  
\-programming in the repl should be as fluid as programming in an ide, highlighting, errors, hotkeys for text manipulation, etc.  
\-the repl needs to be able to be interupted

That is a decent list for now, I will ask for other features when red gets a vm.

Here are a few other lists and some information on slime, the repl we should rip ideas from:  
http://www.cliki.net/SLIME%20Features  
https://common-lisp.net/project/slime/#features

I actually recommend downloading common lisp and playing with it some so that you can get an idea of how the repl feels. If you do so here is the easiest way to get a test of the repl, https://shinmera.github.io/portacle/.  
Then, go to this tutorial: http://www.gigamonkeys.com/book/lather-rinse-repeat-a-tour-of-the-repl.html

[15:27](#msg58ecf5e308c00c092a6e1bb7)Also note that one of the reasons the lisp repl feels so good is because of the debugging system common lisp has, it is really good.

maximvl

[15:36](#msg58ecf7ecf22385553d2ec2bd)yes, this is what you get out of the box in SBCL:  
https://gist.github.com/maximvl/70660918a3639e4aa9986ccd62ab9196#file-gistfile1-txt

[15:39](#msg58ecf8a18fcce56b20f0903c)another nice thing is Inspector, useful for objects and nested data structures

[15:42](#msg58ecf95bb52518ed4dffe396)graphical inspector will be super cool, the only similar thing I saw exists in Smalltalk

[15:44](#msg58ecf9e568bee3091f30eb7c)DrRacket has couple of nice GUI-related features, like pointing to the usages:  
https://kaushikghose.files.wordpress.com/2015/10/screen-shot-2015-11-05-at-8-54-56-am.png

[15:48](#msg58ecfab1bdf4acc1124c56d2)another nice thing could be allowing `draw` (is it possible with `view` as well?) output directly to the console:  
https://upload.wikimedia.org/wikipedia/commons/b/b5/Drracket.png

## Wednesday 14th June, 2017

dsgeyser

[07:39](#msg5940e81acf9c13503c843c15)This was posted a while back:

fort-ascension @fort-ascension Jan 07 2016 02:33  
I've read back a bit and I think some you may not have used parse to its full extent to realize that it is more like a lisp interpreter than anything else.

fort-ascension @fort-ascension Jan 07 2016 02:43  
the way I see it, in its design, lisp aims to mesh the evaluation of the data streams (functions) with the (inline) raw transformations of that data by mixing the macro and the top level "interpretation" into one engine. the output is a basically dataflow graph. haskell exploits this and adds the lazy eval, cause its easy to do in a graph. this also explains why it doesn't need a stack, because the state of each transformation is part of the graph itself.  
Rebol actually aims to do it the other way around (on purpose I think). data and evaluation are separated, but can be integrated at will. there is no abolute graph, functions and values are not copied.

fort-ascension @fort-ascension Jan 07 2016 02:52  
parse is a bridge between both worlds. you can build your rules to go all the way to lisp or all the way to imperative style stack-based eval. as such the result of your parse can be a parse rule, which you can execute right at the tip of the rule. You can simulate loops with parse, just as you can with lisp. you can build and modify your rules inline (macros) and you can change the input data on the fly (functions) you can execute paren! expressions in line (lambdas) and you can suspend and restart a parser and its data just like a continuation.  
for me the main difference is that lisp is designed to do these things. parse allows them, but is not as well setup for it. (the parse code to simulate lisp can be messy).

[07:44](#msg5940e96d142826e972b31cbe)The past few days I was reading up on Smalltalk and the fact that it allows the dev of stateful apps. This simplifies a lot of dev work. I am interested in the continuation aspect of Smalltalk. From the above pasted post: Rebol parse enables one to simulate continuation. But Rebol is stack based. How is it possible?

[07:51](#msg5940eafaca6d4ae80c10cb8c)The lisp environment is image based?

geekyi

[21:02](#msg5941a47b31f589c64fa9a747) :point\_up: \[Jan 07 2016 02:33](https://gitter.im/red/red/lisp?at=568db23ffa733fa72e1d4636) the post(s) @dsgeyser mentions

## Friday 22nd September, 2017

9214

[20:53](#msg59c57851bc46472974661d79)Lisp-like reader macro :alien: :car:  
https://gist.github.com/9214/c325d349195ba9054e18555ed51c9ed5

## Saturday 23th September, 2017

maximvl

[10:31](#msg59c6381fb59d55b8232bc2eb)@9214 I think the code is quite bad and I left you a comment on the gist

[10:32](#msg59c6385032fc8b7e4030ce7d)but I like the idea and it's good you are learning and experimenting with things :)

9214

[12:06](#msg59c64e40210ac26920638cda)@maximvl noted!

## Friday 29th September, 2017

numberjay

[14:34](#msg59ce59f2b20c642429a11b79)hello, i'm new here and very glad to have found you (thanks @greggirwin)  
i played with the 'let' code posted above, it's something that would be very handy to have  
i mistakenly thought it had the same semantics as in any Lisp, but the following doesn't work:

&gt;&gt; let \[counter: 0] \[count: does \[counter: counter + 1]]  
\*\** Script Error: counter has no value  
\*\** Where: reduce  
\*\** Stack: let

i guess what i want is a proper closure which maybe is not currently available in Red?

[14:56](#msg59ce5f2df7299e8f5389b7f4)maybe i answered my question, the following code works:

&gt;&gt; using \[counter: 0] \[count: does \[counter: counter + 1]]  
\== func \[]\[counter: counter + 1]  
&gt;&gt; count  
\== 1  
&gt;&gt; count  
\== 2  
&gt;&gt; count  
\== 3

greggirwin

[15:13](#msg59ce6327b59d55b82351e275)@numberjay, welcome! There is no standard `closure` in Red yet. It will probably come when we do the HOF additions. There is a plan for them, just not a high priority at this time. In the meantime, here is a `closure` func you can use:

```
closure: func [vars spec body][
	; Don't have to reuse 'spec name; just saves a word.
    bind (body-of spec: func spec body) (context vars)
    :spec
]
```

## Saturday 30th September, 2017

numberjay

[13:51](#msg59cfa16c210ac269208e9946)thank you @greggirwin, very handy!

```
>> count: closure [counter: 0] [/reset] [either reset [counter: 0] [counter: counter + 1]]
== func [/reset][either reset [counter: 0] [counter: counter + 1]]
>> count
== 1
>> count
== 2
>> count
== 3
>> count/reset
== 0
>> count
== 1
```

also, it's grest knowing that HOF support is on the roadmap

9214

[13:52](#msg59cfa1a4b20c642429a70fe1)@greggirwin `/local spec` ?

numberjay

[14:21](#msg59cfa87732fc8b7e405bb199)@9214 maybe just using `function` instead of `func`?

9214

[15:43](#msg59cfbb97210ac269208f12e7)there's actually no need for `/local`, as existing word is re-used

greggirwin

[17:24](#msg59cfd363b59d55b8235860a0)Reusing words isn't always a good idea, but I think Doc whipped up this example and did it there. In this case, I would probably not use `spec` as it doesn't say what you're really returning (a func). But I pulled this one, over the original we've had around for a while, by @JacobGood1, because of the new binding approach. We should write up a short note on the difference.
