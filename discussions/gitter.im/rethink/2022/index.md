# Archived messages from: [gitter.im/red/rethink](/gitter.im/red/rethink/) from year: 2022

## Wednesday 22nd June, 2022

dsunanda

[18:56](#msg62b365e276cd751a2f507697)\*\*Welcome to Rethink!\**

This is a new channel intended to help us have a little fun, demonstrate clever Red tricks, and generally show what we can do. \*Thanks to Gregg for setting it up.*

We’ll publish the occasional Red puzzle, quiz, code optimization challenge; things like that. Any one can join in and publish their solution. And, between us, we’ll all learn something, and perhaps produce some exemplary code.

I am going to start with a puzzle about a strange block ....

[18:57](#msg62b3660c568c2c30d3de466a)\*\*Self-aware block\*\*: \*How was the `puzzle` block created?*

```
probe puzzle
== [3 + 2 2 * 3 3 - 2 2 - 3]

reduce puzzle
== [First Five then Six and then One and finally Minus One. Ta-da!]

reduce load mold puzzle
== [5 6 1 -1]
```

\*There's many ways to create the block. For an added challenge, can you do it in pure Red (no Red/System); without redefining `load`, `mold`, `probe`, or `reduce`; and no Unicode trickery?*

hiiamboris

[19:09](#msg62b3690776cd751a2f507c49)Clever! :)  
I suppose block is bound to a context with custom operators which evaluate their result, count the position in the block and then spit out words. But then why there are so many items in the reduced block? Wow! Maybe operators have been given a reference to the block then, so they can insert stuff?

[20:15](#msg62b37861fe909e3ec7e2e45b)I also think ops find places where they are located in that block, and insert lit-words after that position, so when reduce picks up it sees more than there was initially in that block.

greggirwin

[22:00](#msg62b390fad3c8894f719a30d3)I think the "self-aware" hint lines up with the context idea.

## Thursday 23th June, 2022

dsunanda

[21:37](#msg62b4dd031227f62be3b47aba)Not many takers for that first challenge .... That challenges us to come up with some better ones. Thanks to Boris for giving it a great deal of thought. And to anyone else who joined in silently.

Here's a hint that more than half solves the puzzle -- so look away now if you don't want to know.

All the entries in the `puzzle` block are simply Red words. "+" and "-" turn into word with `to-word`. To make digits into words we ask `load` nicely.

Here's a version of doing that - which appears to create a block that doubles in value when `reduce`d:

```
lsw: does [last words-of system/words]
hint: copy []
foreach [w n] [1 2 -3 -6 5x25 10x50 3.14159 tau][load rejoin ["/" w] set lsw n append hint lsw] 
probe hint
== [1 -3 5x25 3.14159]  ;; four words
reduce hint
== [2 -6 10x50 tau]     ;; and the values they hold
```

hiiamboris

[22:03](#msg62b4e32a3bbb38488991fc1d)omg I never would have thought lol

```
>> /2
== /2
>> last words-of system/words
== 2
>> type? last words-of system/words
== word!
```

[22:03](#msg62b4e3401227f62be3b4a828)language abuse 90 lvl :D

dsunanda

[22:21](#msg62b4e75eef5ee44882c33a37):) Carl used to say that Rebol was a deep lake.  
http://www.rebol.com/article/0103.html  
There's a lot of useful junk at the bottom.

greggirwin

[23:15](#msg62b4f4160a5226479862bd8d)@dsunanda you started with a \*really* hard puzzle. I have to block out time for things that deep. :^)

## Friday 24th June, 2022

toomasv

[08:53](#msg62b57b93568c2c30d3e68993)Here is closest I could come up without dark magic:

```
>> prepare puzzle: [3 + 2 2 * 3 3 - 2 2 - 3]
== [3 + 2 2 * 3 3 - 2 2 - 3]
>> last reduce puzzle
== [First Five then Six and then One and finally Minus One. Ta-da!]
>> reduce load mold puzzle
== [5 6 1 -1]
>> prepare puzzle: [3 + 4 2 * 3 5 - 2 1 - 3]
== [3 + 4 2 * 3 5 - 2 1 - 3]
>> last reduce puzzle
== [First Seven then Six and then Three and finally Minus Two. Ta-da!]
>> reduce load mold puzzle
== [7 6 3 -2]
...
```

[09:24](#msg62b582baab6b634f73611a33)Or better:

```
>> prepare puzzle: [1 + 3 2 - 5 6 + 2 5 - 1 12 - 3 -3 + 4]
== [1 + 3 2 - 5 6 + 2 5 - 1 12 - 3 -3 + 4]
>> do puzzle
== [First Four then Minus Three and then Eight and then Four and then Nine and finally One. Ta-da!]
>> reduce load mold puzzle
== [4 -3 8 4 9 1]
```

dsunanda

[13:19](#msg62b5b9f1568c2c30d3e841f8)@toomasv Your magic is much stronger than mine!

toomasv

[13:55](#msg62b5c262b408e830dc2e09f2):)

greggirwin

[14:10](#msg62b5c5c0d3c8894f71a42ed6)Here's an easy one for the Great Red Optimizer. Generate a random `binary!` that is 16 bytes long. The use case is generating UUIDs, where you start with 16 fully random bytes and then set a few bits at specific locations. I've tinkered on about 20 variations over time.

Here's the easy and obvious way:

```
fn-p: function [][
			data: copy #{00000000000000000000000000000000}
			repeat i 16 [data/:i: random/secure 256]
			data
	]
```

This isn't terrible, and is very easy to understand. Performance is middling, and the memory pressure is probably as good as you can get (not `copy`ing isn't an option, as it just moves that burden to the user). In my variations, one approach produced results like

```
#{43DFD61C4E82F7E743D13859B5DFF62B}
#{43DE1CA89626A15243DA8CF5BB420739}
#{43C0BF74C7F2BC4843C09E7658C047AC}
#{43BE565180CDFC6143C2B46C8152C7FD}
#{43D87D5DD8E33B8F43DD270591B9F989}
```

Which has some clearly repeated patterns, and I don't think we want that for UUIDs (feel free to comment).

No need to hide your code for this one, as we can all riff on each other's ideas. My best so far is 3x faster than the above version, while not displaying repeated patterns, but does exhibit more memory pressure.

hiiamboris

[16:40](#msg62b5e8e21227f62be3bc0445)My favorite would be:

```
>> to binary! map-each c 16 [-1 + random 256]
== #{CA0FE066E464D5A83642FA894846A720}
```

(no reason to test memory pressure until R/S implementation is permitted)

But if we just wanna hack something on top of current designs:

```
>> recycle/off prof/each/times [fn-p append append make #{} 16 random 255.255.255.255.255.255.255.255 random 255.255.255.255.255.255.255.255] 100000
<100000>84%      .0116 ms          44 B [fn-p]
<100000>16%      .0022 ms         132 B [append append make #{} 16 random 2...]
```

rebolek

[18:24](#msg62b60142ab6b634f7364b049)This is what I use:

```
>> copy/part checksum form now/precise 'sha256 16                                              │
== #{80F3A47BEAECD902395728F63FC16032}
```

[18:32](#msg62b60340fe909e3ec7eec8f3)BTW few new UUID formats were unveiled recently

[18:32](#msg62b6035976cd751a2f5c7b34)https://www.ietf.org/id/draft-peabody-dispatch-new-uuid-format-04.html

greggirwin

[18:33](#msg62b603689f29d42bed9a8463)@hiiamboris the tuple approach is fun. I don't like `-1 +`, but hit that in some of mine and depended on Red's moduloing bytes in binaries to avoid it.

For @rebolek's approach, I've used `now/precise` for random seeding, but can we trust it to not return the same result on all platforms, if run in a tight loop? I like the leverage though. Could also `clear` instead of `copy`, yes?

rebolek

[18:34](#msg62b60398ef5ee44882cb4a5b)`clear` instead of `copy` - yes, that's clearly better.

greggirwin

[18:34](#msg62b603cbef5ee44882cb4b19)Wow! New ones. Thanks @rebolek.

rebolek

[18:35](#msg62b603d8ab6b634f7364c3f4)Tight loop - you can add some randomness, but just two or four bytes should be enough IMO, you don't need full 16 bytes.

[18:36](#msg62b6043a9f29d42bed9a89b6)or reuse the old hash as a salt

greggirwin

[18:36](#msg62b60443d3c8894f71a5f053)First thing to jump out at me in the new specs was time ordering, which I love, as I'm a fan of leveraging ISO8601.

[18:42](#msg62b605789a314a3ec4cbe012)I had consigned myself to v4 for Red, out of simplicity, but now we need to consider these new formats. I think UUID gen will be a great feature to have built in, but don't need v1 or other old oddballs.

zentrog:matrix.org

[18:42](#msg62b605aa9f29d42bed9a925e)@greggirwin: Those patterns make me wonder about whether `random/secure` may not be all that secure... though it looks a lot different when I try it here

greggirwin

[18:44](#msg62b605f2b408e830dc2fd68c)@zentrog:matrix.org part of why I'm reaching out, as using a high seed value consistently sets more high bits, simple due to the range.

[18:45](#msg62b6063e904f20479a22fbd0)I also think having a random is good, but am anxious to read about the new ones and how they might work better for some cases. e.g. my simple `record-manager` idea is basically data in blocks and sorted blocks of indexes.

[18:47](#msg62b606dbfe909e3ec7eee53a)It's also one of those things that makes you tilt your head, at least I do, when the bit fiddling you need to do is in the middle of the data, rather than at the head.

zentrog:matrix.org

[18:48](#msg62b606f78fe56a38b5b81855)I don't know how others feel about it, but I've never needed anything besides random. I understand people wanting to overload it for other purposes though. Actually, I don't \_really_ care about random. I just want it to be unique

greggirwin

[18:51](#msg62b607ad3bbb3848899a258d)That's been my thinking as well, but I also know that just inserting data in blocks will have an upper limit, and a smarter implementation \*might* be worth it for another 100x scaling factor. That's if the simple version gets crushed at low numbers.

[18:53](#msg62b60819568c2c30d3eaa133)

```
Count: 100000
Time         | Time (Per)   | Memory      | Code
0:00:00.148  | 0:00:00      | 13'200'440    | fn-v
0:00:00.356  | 0:00:00      | 8'800'840     | fn-o
0:00:00.36   | 0:00:00      | 13'200'840    | fn-t
0:00:00.423  | 0:00:00      | 13'200'840    | fn-r
0:00:00.44   | 0:00:00      | 13'200'840    | fn-q
0:00:00.581  | 0:00:00      | 25'201'072    | fn-u
0:00:00.714  | 0:00:00      | 35203172    | fn-a
0:00:00.843  | 0:00:00      | 17600872    | fn-d
0:00:00.891  | 0:00:00      | 17601056    | fn-e
0:00:00.948  | 0:00:00      | 4400840     | fn-s
0:00:00.964  | 0:00:00      | 4400640     | fn-p
0:00:01.205  | 0:00:00      | 4400640     | fn-b
0:00:01.42   | 0:00:00      | 1152        | fn-c  ; no copy, so unsafe
0:00:01.536  | 0:00:00      | 8800920     | fn-g
0:00:01.566  | 0:00:00      | 17600920    | fn-f
```

I also agree with Boris that memory pressure isn't critical path for this, but it's a nice to have.

zentrog:matrix.org

[18:53](#msg62b6083f0a522647986a60d7)It looks like \[native APIs](https://docs.microsoft.com/en-us/windows/win32/api/wincrypt/nf-wincrypt-cryptgenrandom) are really close to your `fn-p` function already. Would it make sense to add an `/into` refinement to `random` to request a specific amount of bytes?

greggirwin

[18:54](#msg62b608589f29d42bed9aa5c8)@rebolek's is `fn-u`.

[18:54](#msg62b60882fe909e3ec7eef0f0)I think that's where Boris is going with his thinking as well. Is getting a random buffer valuable for other things?

[18:55](#msg62b60894ef5ee44882cb6923)Aside from obfuscating memory and such.

hiiamboris

[18:55](#msg62b608bd8fe56a38b5b82384)Don't remember wanting it.

[18:56](#msg62b608d376cd751a2f5ca619)Anyway, we should work on GC, not on kludges that allow us to skip GC.

greggirwin

[18:57](#msg62b6090e22c53438bcbfeeb2)Agreed.

[19:01](#msg62b60a0976cd751a2f5cada9)Added `fn-v`, Boris' tuple version to the table above. Funky as it appears, I am not surprised that it rose to the top of the pile. Nice one @hiiamboris.

zentrog:matrix.org

[19:04](#msg62b60ad19a314a3ec4cc0941)Doing crypto stuff probably, but usually it's not encouraged for people to be doing their own crypto implementations. I guess if people need obscure APIs, they can make their own wrappers, rather than cluttering built-in functions.

## Saturday 25th June, 2022

toomasv

[19:16](#msg62b75f1a568c2c30d3f4544e)@dsunanda I expanded a bit on your puzzle:

```
>> prepare puzzle: [5 + 6 3 - 3 2 * 9 211 * 34]
== [5 + 6 3 - 3 2 * 9 211 * 34]
>> do puzzle
== [First Eleven then Zero and then Eighteen and finally Seven Thousand One Hundred Seventy-Four. Ta-da!]
>> reduce load mold puzzle
== [11 0 18 7174]
```

## Sunday 26th June, 2022

greggirwin

[00:14](#msg62b7a4f0568c2c30d3f6613c)I figured out that Boris' version was faster due to not using `/secure` with `random`. The question, then, is how important that is for UUID use.

hiiamboris

[08:05](#msg62b813521227f62be3cb87f4)I just forgot it lol

[08:08](#msg62b81414d3c8894f71b4a3db)Well this means if /secure is taking 60% of time alone, there's no need to leverage R/S.

greggirwin

[18:46](#msg62b8a99aef5ee44882de146a)That's where I wonder (layman's analysis here) if we used secure once as a random seed, then could `random` alone be enough for the UUID case. More of a thought experiment for general use, as what we have how should still be fast enough.

[18:47](#msg62b8a9d2ef5ee44882de1577)Given that UUID generation with higher demands can generate a pool ahead of time to draw from.

[20:19](#msg62b8bf5c9f73251a2c87f3d2)Here's a fun optimization story I've told before. DDJ (Dr. Dobbs Journal) used to have an optimization challenge, usually posed by Michael Abrash (ASM and graphics guru). They always had rules. One of them was to make the fastest Game of Life in X amount of code. I can't find a ref online just now. A guy from Borland won hands down. But he broke the rules. Abrash said he planned to disqualify him, but still compliment his approach. Then he found that \*every single entry* broke the rules.

One of the great things about Red, and the fun these thought ticklers bring out, is breaking with convention. Some of these will leverage knowledge of how things work. e.g. Boris' use of tuples, which are efficient internally, but limited in what they can represent. A spin on bytes in binary values. So obvious in hindsight, and yet I didn't see it in all my permutations. I got stuck on a line of thinking, which I often do, and seeing what other people come up with teaches me so much.

## Monday 27th June, 2022

GiuseppeChillemi

[16:14](#msg62b9d767d3c8894f71c1788c)@greggirwin Have you a link to DDJ happenings?

greggirwin

[17:29](#msg62b9e8fa8fe56a38b5d3c1a9)Nope. Couldn't find one quickly.

## Sunday 7th August, 2022

dsunanda

[13:49](#msg62efc2d972ad51741fec88af)I have a function that collapses duplicate consecutive entries in a series to a single instance, eg:

```
print dedupe "nNNnennnnaaadd" 
== nNnenad
print mold dedupe ["N" "N" "e" "n" "n" "a" "a" "d" "d" "d"]
== ["N" "e" "n" "a" "d"]
```

I have a working version, but it takes over 5 seconds per series on my test machine under a stress test. Looking for something faster! Can you do better!?

My code for laughs - and reference implementation:

```
dedupe: func [s-in [series!]
][
   s-in: copy s-in   ; so we don't modify caller's series directly
   forall s-in [while [s-in/1 = s-in/2] [remove s-in]]
   return s-in
]
```

And the stress tester:

```
dedupe-test: does [
    random/seed 1     ; for repeatable random data
    dedupe-test-data: make string! 1000000
    loop 1000000 [append dedupe-test-data random/only "AEIOU"]
    print dt[dedupe-test-result: dedupe dedupe-test-data]
    print ["Input length:" length? dedupe-test-data "Output length:" length? dedupe-test-result]
   ]
loop 5 [dedupe-test]
```

Thanks - and good luck!

toomasv

[14:42](#msg62efcf3f9994996293735102)@dsunanda My try:

```
dedupe: func [series [series!]][parse/case out: copy series [any [set _ skip any [ahead _ remove skip]]] out]
```

```
>> print dedupe "nNNnennnnaaadd"
nNnenad
>> print mold dedupe ["N" "N" "e" "n" "n" "a" "a" "d" "d" "d"]
["N" "e" "n" "a" "d"]
```

```
>> loop 5 [dedupe-test]
0:00:03.40687
Input length: 1000000 Output length: 800153
0:00:03.4109
Input length: 1000000 Output length: 800153
0:00:03.41485
Input length: 1000000 Output length: 800153
0:00:03.39291
Input length: 1000000 Output length: 800153
0:00:03.45179
Input length: 1000000 Output length: 800153
```

[14:59](#msg62efd36411a6a83d04c3408e)Hmm.., but it is not faster than your code on my machine.

[15:03](#msg62efd45c458f823ce0914a90)Hey, this is faster:

```
dedupe: func [series [series!]][parse/case out: copy series [any [set _ skip remove any _]] out]
loop 5 [dedupe-test]
0:00:02.61498
Input length: 1000000 Output length: 800153
0:00:02.67284
Input length: 1000000 Output length: 800153
0:00:02.65391
Input length: 1000000 Output length: 800153
0:00:02.65889
Input length: 1000000 Output length: 800153
0:00:02.66093
Input length: 1000000 Output length: 800153
```

dsunanda

[15:14](#msg62efd6f1cf6cfd27af9a4334)@toomasv Cool! Your second one is around 15% to 20% faster than mine.

Which reinforces the main finding from the old days of Rebol coding challenges: \*\*If it can be done in PARSE, the PARSE solution will be faster\** :)

toomasv

[15:33](#msg62efdb2e05ad4a3701fdd72d):+1:

hiiamboris

[16:13](#msg62efe4b7999499629373f313)`dedupe: function [s][also t: clear copy s parse s [collect into t any [keep set x skip any x]]]`

[16:29](#msg62efe855458f823ce091db8a)`/local x` needed :)

[16:30](#msg62efe8b0aa091774291bbdd3)`/case` too

toomasv

[16:32](#msg62efe900cf6cfd27af9ac951)Wow!

```
>> loop 5 [dedupe-test]
0:00:00.597404
Input length: 1000000 Output length: 800153
0:00:00.60142
Input length: 1000000 Output length: 800153
0:00:00.664142
Input length: 1000000 Output length: 800153
0:00:00.596381
Input length: 1000000 Output length: 800153
0:00:00.620573
Input length: 1000000 Output length: 800153
```

hiiamboris

[16:32](#msg62efe92fd020d223d348d93f)For fun, not speed:

```
>> dedupe: function [s /local x][replace/all/deep/case copy s [set x skip any x] does [x]]
>> print dedupe "nNNnennnnaaadd"
nNnenad
>> print mold dedupe ["N" "N" "e" "n" "n" "a" "a" "d" "d" "d"]
["N" "e" "n" "a" "d"]
```

[16:34](#msg62efe9a6458f823ce091e1f7)

```
>> dedupe: function [s /local x][mapparse/case [set x skip any x] s [x]]
>> print dedupe "nNNnennnnaaadd"
nNnenad
>> print mold dedupe ["N" "N" "e" "n" "n" "a" "a" "d" "d" "d"]
["N" "e" "n" "a" "d"]
```

dsunanda

[16:37](#msg62efea5111a6a83d04c3db52)@hiiamboris Impressive!

Some timing runs: without the /local x and /case you were \*\*slower\** than Toomas for strings under around 50,000 in length.  
With those changes, you are pretty much the same as him for strings under 50,000.

Once the strings get longer, your speed gain is incredible.... Seven times as fast by the time we get to a million.

hiiamboris

[16:38](#msg62efea897ccf6b6d45e4e7fd)Interesting! ;)

dsunanda

[16:44](#msg62efebd2d020d223d348e8cc)@hiiamboris And your "for fun" one makes my original look fast :)

hiiamboris

[16:51](#msg62efedafb16e8236e3880031)There's a known Parse's `change` bug that makes my "fun" solutions really slow on big series. `mapparse` way is still my favorite though.

[16:53](#msg62efee23aa091774291be065)`dedupe: function [s /local x][mapparse/case [set x skip any x] copy s [x]]` is the proper solution though (`mapparse` doesn't copy right now)

dsunanda

[17:03](#msg62eff066647d633cf62e6cef)Is mapparse something under development? I'm not seeing it in my 2-week old download.

hiiamboris

[17:05](#msg62eff0c26837563d1ce39bbe)One of my HOF-related designs: https://codeberg.org/hiiamboris/red-common/src/branch/master/mapparse.red

dsunanda

[17:41](#msg62eff9437ccf6b6d45e54c40)Interesting stuff, thanks.  
(And just been playing with your leak-check which I found over there.... It discovered several misspelled /local words in code that is years' old :)

hiiamboris

[17:53](#msg62effc2011a6a83d04c469a5)☻

greggirwin

[17:58](#msg62effd28d020d223d3496e69)

```
dedupe: function [s][
	res: make string! length? s
	last-seen: none
	foreach ch s [
		if ch <> last-seen [append res ch]
		last-seen: ch
	]
	res
]
```

Not as fast as @hiiamboris though. :^(

dsunanda

[18:46](#msg62f00875cf6cfd27af9ba72a)@greggirwin it's pretty close to Boris for the one million test....And actually slightly faster with series under 50,000 in length.

Give me a few minutes, and I'll supply a test driver, so we can all see which solution is faster under differing conditons .....

[19:04](#msg62f00cc772ad51741feeb45c)\*\*Test driver for dedupe in next post\*\*. How to use once you have it:  
1\. Add your function to the Contenders block  
2\. Run like this with various settings, eg:

```
driver 50 5000   ; run each contender 50 times with a 5000 long series
 driver 5 1000000 ; five iterations with a 1 million long series
```

Edit these two lines to change the nature of the test data:

```
ser: make string! len
loop len [append ser random/only "AEIOU"]
```

And remember that any contenders that are within a few percent of each other will need a better controlled test to actually rank them. This driver is the crude first sketch.

[19:19](#msg62f0102dcf6cfd27af9bdcec)

```
Red []
contenders: reduce [

"Sunanda"
func [
    s-in [series!]
][
    s-in: copy s-in  ; so we don't modify caller's series directly
    forall s-in [while [s-in/1 = s-in/2] [remove s-in]]
    return s-in
]

"Toomas"
func [series [series!]] [parse/case out: copy series [any [set _ skip [remove any _]]] out]

"Boris"
func [s /local x] [also t: clear copy s parse/case s [collect into t any [keep set x skip any x]]]

"Greg"
function [s][
    res: make string! length? s
    last-seen: none
    foreach ch s [
        if ch <> last-seen [append res ch]
        last-seen: ch
    ]
    res
]

]  ;; contenders

Driver: func [reps [integer!] len [integer!] /local ser res resb nam fun tim tims tot] [

ser: make string! len
loop len [append ser random/only "AEIOU"]

resb: copy []
tims: copy []
foreach [nam fun] contenders [
    recycle
    tot: 0:0:0
    loop reps [
        tim: now/time/precise
        res: do [do [fun ser]]
        tot: tot + now/time/precise - tim
        append resb res
    ]
    append tims reduce [tot nam]
   ]

if 1 <> length? unique resb [print "Not identical results!"]

sort/skip tims 2
print newline
print ["Input length:" len "Output length:" length? resb/1 "Reps:" reps]
foreach [tim nam] tims [print ["    " pad/left/with tim 12 #"0" ": " nam]]

return tims
]
```

## Friday 9th September, 2022

hiiamboris

[15:52](#msg631b615505ad4a3701e26f44)Perhaps it would be an interesting thinking (not coding) challenge for others (I've certainly found it amusing myself).

Goal is having a table of text or arbitrary widgets, set column widths automatically for it, so humans would appreciate the resulting look.

All browsers today implement such an algorithm (it can even be inferred from the gif):  
!\[](https://i.ibb.co/Q89PnHs/GIF-09-Sep-22-18-45-57.gif)

But obviously it has it's flaws. How would you go about it? ;)

## Saturday 10th September, 2022

hiiamboris

[18:54](#msg631cdd553a42316d33e46e45)Hint 1: you can estimate any cell's height for a given width, this is your basic building block

[18:54](#msg631cdd7baa091774290296e6)Hint 2: there is no "right" one-size-fits-all solution, only simplifications

[18:57](#msg631cde17aa091774290297b4)Hint 3: education yourself on google is not against the rules (provided there's anything useful to be found online ;)
