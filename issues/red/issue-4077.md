
#4077: Red slower than Python?
================================================================================
Issue is closed, was reported by benstigsen and has 20 comment(s).
<https://github.com/red/red/issues/4077>

I've for a long time wanted to see benchmarks from the Red language, so I tried running my own little test with the scripts below. Now, I am aware that certain parts of Red are probably faster than some other languages, but I'd really like to get some documentation on what those parts are including benchmarks for the Red language. Here's a Fibonacci test I ran:
**Red:**
```red
Red [Title: "Fibonacci"]

n: 45
a: 0
b: 1

while [n > 0] [
	c: a + b
	a: b
	b: c
	n: n - 1
]

print b
```

**Python:**
```python
n = 45
a = 0
b = 1

while n > 0:
	c = a + b 
	a = b
	b = c
	n = n - 1

print(b)
```

These are the results:
```
Python - Fibonacci (45th number) (10 runs)
---------------------------
TotalMilliseconds : 32.3109
TotalMilliseconds : 13.3222
TotalMilliseconds : 18.9703
TotalMilliseconds : 17.3383
TotalMilliseconds : 16.7138
TotalMilliseconds : 20.8423
TotalMilliseconds : 28.2351
TotalMilliseconds : 26.9352
TotalMilliseconds : 22.6726
TotalMilliseconds : 16.5086
---------------------------

Red - Fibonacci (45th number) (10 runs)
---------------------------
TotalMilliseconds : 45.3082
TotalMilliseconds : 43.555
TotalMilliseconds : 43.1206
TotalMilliseconds : 43.4682
TotalMilliseconds : 43.1666
TotalMilliseconds : 43.4765
TotalMilliseconds : 43.646
TotalMilliseconds : 43.6708
TotalMilliseconds : 43.2711
TotalMilliseconds : 43.8175
---------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2019-10-14T02:50:35Z, greggirwin, commented:
<https://github.com/red/red/issues/4077#issuecomment-541488058>

    @BenTearzz thanks for the tests. I'll comment briefly, but will also close this ticket. Tickets aren't the place to ask questions. Your best source of interactive information is our Gitter channel (red/red is the main room there). Posting your test code will also help others in creating useful comparisons. 
    
    In answer to your question:
    
    1) Red compiles to Red/System, which compiles to machine code. There is no optimizer. Python is written in C, which requires a C compiler, and we all know C compilers have optimizations for everything.
    
    2) Microbenchmarking high level languages for numeric performance doesn't make much sense. Don't choose any high level language because it's faster at integer math. That's a bad metric. Choose them based on value they provide for problems you're trying to solve.
    
    3) If you need speed, use Red/System. It's a C level dialect of Red, built right in.
    
    4) It also makes a difference if you're running interpreted versus compiled. 
    
    Here's a Red/System version of Fibonacci. It must be compiled to run, as R/S is never interpreted.
    
    ```
    Red [
    	title: "Fibonacci"
    ]
    
    fibonacci: routine [
    	n [integer!]
    	return: [integer!]
    	/local
    		a [integer!]
    		b [integer!]
    		c [integer!]
    ][
    	a: 0
    	b: 1
    
    	while [n > 0] [
    		c: a + b
    		a: b
    		b: c
    		n: n - 1
    	]
    
    	return b
    ]
    print fibonacci 45
    ```
    
    Please test and let us know your results on Gitter. You can link to this ticket as a reference.

--------------------------------------------------------------------------------

On 2019-10-14T10:10:31Z, 9214, commented:
<https://github.com/red/red/issues/4077#issuecomment-541593184>

    Hey @BenTearzz, thanks for taking interest in Red. Let me address your questions one-by-one. 
    
    > Red slower than Python?
    
    At the time of writing, Red is relatively young (~8 years) language in alpha stage of development (0.6.4) and has no optimization layers, while Python sits on top of fine-tuned bytecode VM, with version 3.7.4 and  >20 years poured into it.
    
    So, yes, in general, unoptimized, yet-in-development software is slower than any other post-1.0, grease-oiled software in the same category - that's a truism. In other words, Red vs. Python comparison won't tell you anything you don't come to expect, and, to put it bluntly, is simply not fair.
    
    > but I'd really like to get some documentation on what those parts are including benchmarks for the Red language
    
    If memory serves me well, none of project's representatives ever claimed that "certain parts of Red are probably faster than some other languages" (you're welcome to prove me wrong by citing official resources); as I already said, we're pretty much in alpha.
    
    Given that, why do you think Red developers should roll out benchmarks and intentionally misrepresent and downplay the language, and why do you ask us to (dis)prove your claim with comparisons of any kind? We are not in the shape for horseracing, and optimization layers will likely be implemented closer to 1.0 release (and addressed as a dedicated solution by Red/Pro).
    
    Any benchmarks that we might do today will be outdated the next morning - for example, right now there's a `fast-lexer` branch, which drastically improves lexing speed, but it's not yet merged into master. There are dozens of commits every day that may or may not impact Red's performance.
    
    Taking C as the baseline, interpreted Red is 100 times slower, and Red/System (low-level embedded DSL for system programming) is 4-6 times slower. Bear in mind that these are rough estimations, and that you should take them  with a grain of salt, distinguishing between the current state and what we aim for.
    
    > Here's a Fibonacci test I ran
    
    Now that strikes me as odd. For a person who puts so much emphasis on benchmarking of high-level languages, you surely don't seem to know how to run one.
    
    First and foremost - what's your rig? Which implementations and versions of languages were used - have you compared latest Red release with vanilla Python, or one of the old stable releases with, say, PyPy? What timing script have you used? Have you compiled or interpreted your Red script?
    
    Without any of this information, how can you expect us to reproduce your results and to answer your main question with a fair judgement?
    
    Speaking of fair judgement - I don't find your microbenchmark objective or conclusive, although I do agree that Red, in general, will be a bit slower than scripting languages with 1-3 major releases - but that's my intuition, not hard numbers.
    
    I understand that you care about your users and want your software to run fast and meet their expectations, but you should also understand that such microbenchmarks, in general, do more harm than good, and are an extremely bad fit for first-time encounter with programming language community. 
    
    _Any_ software comparison and valuation should be backed by best-practices (in case of programming languages, you should write idiomatic, performant code) with generally-agreed methodology (which at the very least includes open data and reproducible results). Otherwise we just end up spending our time on damage control.
    
    Last but not least - remember that with Red there's always a way to do things differently. You can compile your script to native code, go down to Red/System level and rewrite bottlenecks, or stay at Red level and roll out high-order `memoize` function (which I can show you if you'll drop by our [community chat](https://gitter.im/red/red/welcome)). We do like to stay flexible and open-minded :wink: 
    
    Cheers.

--------------------------------------------------------------------------------

On 2019-10-14T12:23:10Z, benstigsen, commented:
<https://github.com/red/red/issues/4077#issuecomment-541646069>

    @9214 you're right. My lack of experience with testing certainly shows in the issue I opened. It was also my first time doing any kind of "benchmark" testing, and why I didn't include things such as specs and other details I don't know. 
    
    I've been following the Red project for a year now I think, and it seems simple, whether it's the syntax or how to create a GUI window, it's really really simple in Red. The only thing that makes me unsure whether to use it or not for tasks and perhaps future applications, is that I have no idea what Red performance is like. So perhaps in the future once Red is more mature, it would be nice to get performance comparisons.
    
    And also:
    
    > > but I'd really like to get some documentation on what those parts are including benchmarks for the Red language
    
    > If memory serves me well, none of project's representatives ever claimed that "certain parts of Red are probably faster than some other languages" (you're welcome to prove me wrong by citing official resources); as I already said, we're pretty much in alpha.
    
    That's not exactly what I meant. I just meant that I know that a Fibonacci test isn't conclusive and that Red **probably** is faster in some things than other. What those things are however, I'm not sure.

--------------------------------------------------------------------------------

On 2019-10-14T13:06:50Z, 9214, commented:
<https://github.com/red/red/issues/4077#issuecomment-541666547>

    @BenTearzz 
    
    > The only thing that makes me unsure whether to use it or not for tasks and perhaps future applications, is that I have no idea what Red performance is like.
    
    The key question here is _what_ tasks and _what_ applications? In my book, performance matters only if it directly affects user experience or violates strict requirements. Our motto is to keep people happy, not to squeeze out CPU cycles, and you'll hear @greggirwin talking about how premature optimization is the root of all evil a lot.
    
    We want the public to make informative decisions when they evaluate Red, but, as I already told, benchmarking simply doesn't make sense at this point; the best you can do is to pick a moderately simple project that you might have in mind and implement it (we can help you with that in our chat), then see if it fits the bill - and if not, see if it can be improved.
    
    That said, you shouldn't expect miracles or bug-free ride, but Red isn't at the tail of snail league either. And if push comes to shove, then I'd say your task is not suitable for high-level languages _at all_ - but that's where Red/System offers a passing lane with reasonable trade-offs.

--------------------------------------------------------------------------------

On 2019-10-14T21:22:28Z, greggirwin, commented:
<https://github.com/red/red/issues/4077#issuecomment-541929560>

    I'm still really interested in how the R/S `fibonacci` compares. 

--------------------------------------------------------------------------------

On 2019-10-14T21:29:42Z, benstigsen, commented:
<https://github.com/red/red/issues/4077#issuecomment-541933003>

    It did not make a difference. The times were still in the 42 ms range. 

--------------------------------------------------------------------------------

On 2019-10-14T22:10:24Z, greggirwin, commented:
<https://github.com/red/red/issues/4077#issuecomment-541951870>

    Can you please post your test methodology then, because the R/S version should run rings around the high level Red version.

--------------------------------------------------------------------------------

On 2019-10-14T22:18:34Z, greggirwin, commented:
<https://github.com/red/red/issues/4077#issuecomment-541955477>

    Here are my results:
    ```
    ; 100 iterations
    D:\Red\demo\system>fibonacci.exe
    Red 0:00:00.0030086
    R/S 0:00:00
    
    ; 1'000 iterations
    D:\Red\demo\system>fibonacci.exe
    Red 0:00:00.0200067
    R/S 0:00:00
    
    ; 10'000 iterations
    D:\Red\demo\system>fibonacci.exe
    Red 0:00:00.1935035
    R/S 0:00:00.003
    ```
    And the entire code. I compiled and ran the exe from a terminal/shell.
    ```
    Red [
    	title: "Fibonacci"
    ]
    
    delta-time: function [
    	"Return the time it takes to evaluate a block"
    	code [block! word! function!] "Code to evaluate"
    	/count ct "Eval the code this many times, rather than once"
    ][
    	ct: any [ct 1]
    	t: now/time/precise
    	if word? :code [code: get code]
    	loop ct [do code]
    	now/time/precise - t
    ]
    
    fibonacci: function [
    	n [integer!]
    ][
    	a: 0
    	b: 1
    
    	while [n > 0] [
    		c: a + b
    		a: b
    		b: c
    		n: n - 1
    	]
    
    	return b
    ]
    
    fibonacci-rs: routine [
    	n [integer!]
    	return: [integer!]
    	/local
    		a [integer!]
    		b [integer!]
    		c [integer!]
    ][
    	a: 0
    	b: 1
    
    	while [n > 0] [
    		c: a + b
    		a: b
    		b: c
    		n: n - 1
    	]
    
    	return b
    ]
    print [
    	"Red" delta-time/count [fibonacci 45] 10000 newline
    	"R/S" delta-time/count [fibonacci-rs 45] 10000
    ]
    ```

--------------------------------------------------------------------------------

On 2019-10-19T18:22:56Z, DVL333, commented:
<https://github.com/red/red/issues/4077#issuecomment-544184010>

    I've compared evaluation time of this code in Red and Rebol (interpretation only), and now Rebol is faster in more than 2 times. Of course, Red needs optimisation, hope it will be when it become self-hosted.

--------------------------------------------------------------------------------

On 2019-10-20T18:12:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4077#issuecomment-544276958>

    I don't know that Red _needs_ optimization, but it won't hurt. The question is what priority to give it. As I hoped the above example would show, R/S can look almost exactly like Red for simple numerics, and will give you a huge speed boost. _That_ is an optimizer right there, even if not fully automatic. 

