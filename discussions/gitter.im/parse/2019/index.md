# Archived messages from: [gitter.im/red/parse](/gitter.im/red/parse/) from year: 2019

## Wednesday 9th January, 2019

GiuseppeChillemi

[19:31](#msg5c364c2c12db9607e760eba6)I wish to parse strings like:

```
the-path: "#theserver:theDB/thetable/thefield"
the-path: "theDB/thetable/thefield"
```

```
caratteri-path: charset [#"A" - #"Z" #"a" - #"z" #"0" - #"9"]
	parse the-path [
		copy first-char
		0 1
		[ "!" | "#" ]
		copy first-word some caratteri-path (print ["First Word" first-word])
		any [1 [ "/" | ":" ]]
		copy bword some [some caratteri-path  (print ["bword" bword]) | 1 "/"]
	]
```

I don't understand why the last copy is not working

```
First Word theserver
*** Script Error: bword has no value
*** Where: print
*** Stack: decode-path-parse
```

Just note, the parse is not complete and I am experimenting and struck at this point.

[19:35](#msg5c364cf882a6c30b90aeb1c1)note: ":" is possible only after the first word , then only "/" are allowed

[19:37](#msg5c364d631491b27876e81bd0)note: first char could be #, ! but also a char, still not understood how to obtain this

9214

[20:09](#msg5c3654fd82a6c30b90aee64e)

```
text
>> split "#theserver:theDB/thetable/thefield" charset "#:/"
== ["" "theserver" "theDB" "thetable" "thefield"]
>> split "theDB/thetable/thefield" charset "#:/"
== ["theDB" "thetable" "thefield"]
```

GiuseppeChillemi

[20:29](#msg5c3659b2aac7082e6ffd0415)Need to know the character before the Word

9214

[20:31](#msg5c365a0c1948ad07e81464cd)...

```
>> first "#a:b/c"
== #"#"
>> first "!a:b/c"
== #"!"
>> first "b/c"
== #"b"
```

GiuseppeChillemi

[20:37](#msg5c365b802e25e453d7572251)I mean: those characters are meaningful , I Need to know what they preceed

[20:42](#msg5c365cc39289cc7aa74a1c9e)I know how to extract the First char but I want to act on the following word in a different way if preceded from # or ! , And only one ":" could be in the Path

9214

[20:42](#msg5c365ccaef78da1bced6163d)Then combine two snippets above together - check the first character, split the string, then figure out what character preceeded by observing the first non-empty string.

GiuseppeChillemi

[20:42](#msg5c365ccb783a5553d80a985c)Pl

[20:42](#msg5c365cd12e25e453d7572a50)Qqp

[20:42](#msg5c365cd2ef78da1bced616aa)QZ

9214

[20:43](#msg5c365ce9783a5553d80a9951)Quit this spamming please.

[20:45](#msg5c365d836a394e2821812359)If you still insist on using Parse, here's a less convoluted version:

```
chars:     charset [#"A" - #"Z" #"a" - #"z" #"0" - #"9"]
element:   [keep some chars]
prefix:    [keep ["#" | "!"] element ":"]
delimiter: ["/" | end]
path:      [some [element delimiter]]

foreach test [
    "#this:that/end"
    "!this:that/end"
    "this/that/end"
][
    probe new-line/all parse test [collect [opt prefix path]] off
]
```

GiuseppeChillemi

[20:46](#msg5c365dbfdfe1332820252989)&gt; Quit this spamming please.

Just standing up from bed with the phone open on gitter in my hand... hit the screen without noticing it.

[20:47](#msg5c365dee783a5553d80aa4cb)I'll check it after dinner, thanks.

[20:48](#msg5c365e2254d8bb07ccc49e4d)Hoever: why this "copy" didn't work in my code ?

```
copy bword some [some caratteri-path  (print ["bword" bword]) | 1 "/"]
```

I need to learn...

9214

[20:51](#msg5c365ee3b35a08776657b04d)

```
text
some [copy bword some caratteri-path  (print ["bword" bword]) | 1 "/"]
```

[20:55](#msg5c365fbc5aa04d46c584d766)You're trying to copy the rest of the path instead of copying each element separately, which never happens because your rule inevitably fails - there's no matching `"/"` at the very end. My rule fails for the same reason, so path is never actually parsed. But each element of path is matched successfuly so `copy` and `print` work as expected for the rest of the input.

GiuseppeChillemi

[21:30](#msg5c3667dada98233022e6a489)So, copy happen only of the rule is successfull in every occurrence ? As it would fail only in the last part of the path when END is encountered

[21:32](#msg5c366850ef78da1bced6698d)No, it seems I am wrong

[21:47](#msg5c366bf5b35a0877665808d4)@9214

I have added " end, still with no success

```
some [some caratteri-path  (print ["bword" bword]) | 1 "/" | end]
```

I supposed:

```
some caratteri-path   (print ["bword" bword])
```

Would match at least one character in the bitset or a complete word until something different is found. If at least one character is found then "copy bword" is triggered and print executed.

If no bitset character is found then

```
1 "/"
```

checks for "/"

If it is not found

```
"end"
```

is checked and if we are at the end the rule succeds

The starting

```
some [c
```

Instruct parse the whole rule should happen at least one time and this happens because "end" is always encontered

[21:49](#msg5c366c4fe7832c7aa89d8b91)Found the problem as you pointed

[21:49](#msg5c366c8066f3433023a0d588)

```
some [ copy bword some caratteri-path  (print ["bword" bword]) | 1 "/" | end]
```

[21:50](#msg5c366cade7832c7aa89d8e7b)Copy now copies when a word is encountered

[21:58](#msg5c366e75b35a087766581a4d)@9214

This is a working version, need to refine it:

```
aword: copy []
	parse the-path [
		copy first-char
		0 1
		[ "!" | "#" ] (append aword first-char)
		copy first-word some caratteri-path (print ["First Word" first-word] (append aword first-word))
		any [1 [ "/" | ":" ]]
		some [ copy bword some caratteri-path  (print ["bword" bword] append aword bword) | 1 "/" (append aword "/")| end]
		(probe aword)
	]
```

```
First Word theserver
bword theDB
bword thetable
bword thefield
["#" "theserver" "theDB" "/" "thetable" "/" "thefield"]
>
```

The last modification needed is acceppting a staring path with a character from the caratteri-path bitset and I am done.

[21:59](#msg5c366ebd54d8bb07ccc50f2a)Oooops.... missing ":"

[22:09](#msg5c3671015aa04d46c58545ef)

```
parse the-path [
		0 1
		[copy first-char "!" (append aword first-char) | copy first-char "#" (append aword first-char)] 
		copy first-word some caratteri-path (print ["First Word" first-word] (append aword first-word))
		any  [copy bword [1 [ "/" | ":" ]] (append aword bword)]
		some [ copy bword some caratteri-path  (print ["bword" bword] append aword bword) | 1 "/" (append aword "/")| end]
		(probe aword)
	]
```

This works !

[22:10](#msg5c3671402e25e453d757b040)Need to be cleaner but concept understood !

## Thursday 10th January, 2019

GiuseppeChillemi

[03:55](#msg5c36c23aef78da1bced89152)@9214 a last note , I see parse collect Is different from the standard one. I am learning how It works to understand your example.

gltewalt

[06:01](#msg5c36dfa0317e2407cd0a668d)This might be of some help. Under the `Extraction` section.  
https://www.red-lang.org/2013/11/041-introducing-parse.html

GiuseppeChillemi

[08:16](#msg5c36ff66b35a0877665b80a6)@gltewalt Just reading

[08:17](#msg5c36ff886a394e2821850cdc)However, I am feeling more confortable with RED parse. I do not know why...

## Sunday 24th February, 2019

vazub

[17:05](#msg5c72cedde5eeec0d9bbbf9fa)Hi guys! A layman's question here. Does `parse` support `binary!` input to iterate through it byte by byte? I am currently struggling to grok it by means of parsing a file, read as binary, and it doesn't seem to work as I would expect it to. From the looks of it, you can match the input only as a whole, not iterate through it. Or am I mistaken here?

toomasv

[17:09](#msg5c72cfddddaa310c89e384dc)@vazub I never used it but seems to work:

```
>> parse #{00100101} [some [s: (probe s/1) skip]]
0
16
1
1
== true
```

```
>> rejoin parse #{497420776F726B7321} [collect some [s: keep (to-char s/1) skip]]
== "It works!"
```

9214

[17:35](#msg5c72d5ef9155d45d906925f5)@vazub Parse suports `binary!` input since a while, so, perhaps you're doing something wrong. What binary format are you trying to parse? You don't need Parse to iterate thru a series though.

```
>> get also 'match parse #{AA AA DEADBEEF FF FF} [2 #{AA} thru #{DEAD} copy match 2 skip to end]
== #{BEEF}
```

vazub

[18:06](#msg5c72dd3285b7eb456924ce84)Thanks @toomasv and @9214 . I initially failed to acknowledge, that `parse` returns `false`, even if the match is found before the end of the input, due to rule failure afterwards. I was expecting `true` on match and therefore assumed something was not working as expected. Using `parse-trace` helped me to get better understanding of how `parse` works.  
@9214 I am trying to read a file's "magic number" and compare it to a known signature. Your example does seem to cater to similar case, thanks!

## Monday 25th February, 2019

vazub

[19:09](#msg5c743d57d98a4d507608d6da)Continuing my previous question: is there a way to set the number for rule iteration dynamically from the word set by one of the previous `parse` rules? I have a code like this:

```
print parse some-bin-file [
    collect set x [n: keep (to integer! to binary! reverse reduce [n/1 n/2]) 2 skip]
    x collect [o: keep (to integer! to binary! reverse reduce [o/1 o/2 o/3 o/4]) 4 skip]
]
```

What I essentially am looking for is to make sure the second rule is applied `x` number of times. However, this code throws an error:

```
*** Script Error: PARSE - invalid rule or usage of rule:
```

hiiamboris

[19:14](#msg5c743ead6d148f48344d7e00)

```
>> parse to-binary "aaaaa" [(x: 3) collect [x keep skip]]
== [97 97 97]
```

9214

[19:39](#msg5c74447fb54299599d79719e)

```
text
>> parse mold quote ((( o ))) [copy match some "(" (many: length? match) skip many ")"]
== true
>> parse [3 a b c][set count integer! count word!]
== true
>> parse [3 word! a b c 2 refinement! /d /e][some [set count integer! set type! word! (type!: get type!) count type!]]
== true
```

[19:48](#msg5c744693fb14c23f17defadf)@vazub bear in mind that `set` takes only the first value from the matched portion of the input, while `copy` takes the whole portion from start to end. So, if your length is specified by 2 bytes, you need to use `copy`, because `set` takes only the first byte (as `integer!` value).

[19:51](#msg5c7447347f20ac599cc6290b)

```
text
>> binary: append/dup #{ABCD} 0FFh 0ABCDh ; 43981 number of FFh
== #{
ABCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
FFFFFFFFFFFFFF...
>> parse binary [copy count 2 skip (count: to integer! count) count #{FF}]
== true
```

## Tuesday 26th February, 2019

vazub

[06:29](#msg5c74dcd066e2b3118b1c8f4e)Thanks for the info! Much appreciated!

## Saturday 9th March, 2019

toomasv

[09:16](#msg5c83845925e4e24c073dac4b)Why doesn't Red `parse` read input through the end?  
R2 and R3:

```
>> parse "abc" [some [end (probe "end") break | s: (probe s) skip]]
"abc"
"bc"
"c"
"end"
== true
```

Red (latest and earlier ones also):

```
>> parse "abc" [some [end (probe "end") break | s: (probe s) skip]]
"abc"
"bc"
"c"
== true
```

There is a workaround:

```
>> parse "abc" [some [s: (probe s) skip [end (probe "end") | none]]]
"abc"
"bc"
"c"
"end"
== true
```

.. but it is cumbersome to use if end-check is needed, e.g. for inserting something in the end, but there many paths to reach end depending on input.

hiiamboris

[10:03](#msg5c838f778f294b134a12a4eb)is it really a problem? why can't you unite the \*many paths* into one rule and place an end check after?

toomasv

[10:06](#msg5c83901ae527821f0a2c0cdc)I can. Never mind. Just additional quirk to remember.

hiiamboris

[10:07](#msg5c83906af895944c0866717b)Could be an optimization. Esp. makes sense for tiny blocks which are many..

toomasv

[10:11](#msg5c83916786e34a126fb096a9)Probably needs to be added to "Differences...". Also a bit ugly, because `[end ... | none]` or `[end ...|]` is needed, otherwise will fail.

hiiamboris

[10:22](#msg5c8393f7d1e7281f09fd6f05)why not `parse "abc" [some [s: (probe s) skip] end (probe "end")]`

[10:23](#msg5c83942ad1e7281f09fd6ff2)and `[rule |]` is `opt rule`

[10:27](#msg5c8395031fae6423ca57d0f1)you're writing a rule that should work in both Red and Rebol?

toomasv

[10:34](#msg5c839698bf7990126e74c41f)Ah, good. Somehow missed that :blush:

## Monday 11st March, 2019

greggirwin

[03:52](#msg5c85db8d293ac75db5889262)The main thing is to know whether it's by design, or unintentional.

## Tuesday 2nd April, 2019

giesse

[02:21](#msg5ca2c71dbd70a40d5fde8eaf)anybody has any example usage for the `then` keyword? R3 examples are fine, just really hard to search on Google.

ne1uno

[03:01](#msg5ca2d0808148e555b2339fda)https://github.com/revault/rebol-wiki/wiki/Parse-Project

giesse

[06:40](#msg5ca303e00aad635019144ad1)hmm, I see

[06:40](#msg5ca303e2f851ee043d497919)thanks.

rebolek

[06:43](#msg5ca304a7b34ccd69e74ed6d8)The example seems strange:

```
any [[Parse-Project#"a" | #"b"] then [end skip] | skip]
```

9214

[09:33](#msg5ca32c4d1f6e900d5ec587c9)@giesse `then` in Red is broken IIRC, since no one could really understand its semantics.

pekr

[09:49](#msg5ca330233ebbdc55b34a75e7)Not sure the old R3 parse project / proposal helps, but: https://github.com/gchiu/rebol.net/blob/master/wikipedia/Parse%20Project.wiki#THEN

[09:51](#msg5ca3309f1f6e900d5ec5a99c)It would be probably really better being called `either`, but most probably I am missing something ....

rebolek

[10:37](#msg5ca33b82a84e0c501ac26b84)I don't see how `then` is different from normal parsing:

```
parse "ab" [#"a" then #"b" | #"c"]
```

works same as

```
parse "ab" [#"a" #"b" | #"c"]
```

giesse

[18:25](#msg5ca3a92ca84e0c501ac57747)@rebolek I think you need three alternatives at least for `then` to work.  
@9214 I vote that it should be removed rather than fixed.

9214

[18:27](#msg5ca3a97ca0790b29c94e2dcd)@giesse I might be wrong, but `then`, as it is described in Rebol docs, might be a by-product of recursive-descent Parse implementation that R3 uses.

[18:28](#msg5ca3a9b4759abc043c558a18)https://gitter.im/red/help?at=59d205da7b7d98d30d606143

giesse

[18:31](#msg5ca3aa940aad63501918fda2)I doubt that it has anything to do with the implementation details. Wouldn't you say that `topaz-parse` is recursive-descent as well? (Not that I see how implementing it as a state machine makes any difference - it's just a matter of whether you use the stack implicitly or explicitly.)

9214

[18:36](#msg5ca3abbb25686a7dc3c4849d)I'm in favor of `then` removal, but jumping over alternate rule that it makes (or supposed to make) is a nice feature.

giesse

[18:41](#msg5ca3ace97ecbdc29caeb6ba0)I'm confident that any real-world examples can be reworked into something that is more readable and understandable than `then`. :P

rebolek

[18:43](#msg5ca3ad6293fb4a7dc2c232e9)@giesse if you read the docs, it says \*if rule1 then rule2 or rule3* which to me looks like `rule1 then rule2 | rule3`, but I may be of course wrong, the docs are not very clear.

[18:45](#msg5ca3adc20aad6350191912eb)The dynamic rule described there is something I was using very often in Lest, but I'm not sure how to translate it to `then`. I have to look if I ever used it.

[18:47](#msg5ca3ae395a83c30a46fc64b4)Nope, Lest doesn't use it.

9214

[18:49](#msg5ca3aecfa84e0c501ac598e9)

```
text
[rule1 (cont: rule2) | (cont: rule3)] cont
```

```
[rule1 rule2 | rule3]
```

These two are equivalent, no? If `rule1` matched, match `rule2`. If `rule1` failed, backtrack and match `rule3`.

rebolek

[18:50](#msg5ca3af09bd70a40d5fe4f4d3)Right, I think it's bad example.

9214

[18:52](#msg5ca3af7bb34ccd69e753b8a1)Rebol wiki refers to GTDPL with the following remark:  
&gt; In GTDPL, in place of TDPL's recursive rule form A ← BC/D, we instead use the alternate rule form A ← B\[C,D], which is interpreted as follows. When nonterminal A is invoked on some input string, it first recursively invokes B. If B succeeds, then A subsequently invokes C on the remainder of the input left unconsumed by B, and returns the result of C to the original caller. If B fails, on the other hand, then A invokes D on the original input string, and passes the result back to the caller.

&gt; The important difference between this rule form and the A ← BC/D rule form used in TDPL is that C and D are never both invoked in the same call to A: that is, the GTDPL rule acts more like a "pure" if/then/else construct using B as the condition.

[18:53](#msg5ca3afa33ebbdc55b34e1454)That's why I've mentioned recursive-descent R3 implementation. `then` tries to mimick `A ← B[C,D]` rule, which is different from `A ← BC/D` only in some obscure detail related to recursive call.

giesse

[19:07](#msg5ca3b307b34ccd69e753d5c4)@rebolek I believe the idea is: `[rule1 then rule2 | rule3 | rule4]`  
\* if `rule1` fails, backtracks to `rule3`  
\* if `rule1` succeeds, but `rule2` fails, backtracks to `rule4` instead of `rule3`  
\* if both `rule1` and `rule2` succeed, then of course it does not backtrack

[19:08](#msg5ca3b32f8148e555b239bd2f)I doubt I will even remember this one year from now... so I don't think it's a good name at the very least.

[19:09](#msg5ca3b35b93fb4a7dc2c25b9e)on a separate topic, another bug:

```
>> parse ['|] ['|]
== true
```

9214

[19:14](#msg5ca3b48793fb4a7dc2c261f3)@giesse https://github.com/red/red/issues/3554 ?

giesse

[19:14](#msg5ca3b4a83ebbdc55b34e35b8)indeed.

[19:14](#msg5ca3b4af3ebbdc55b34e3626)good to see it's already there :)

[19:15](#msg5ca3b4dca0790b29c94e768e)luckily I can work around it with `ahead`

rebolek

[19:18](#msg5ca3b58ba0790b29c94e7d01)@giesse Ah! It's an interesting construct.

[19:19](#msg5ca3b5c3b34ccd69e753e79c)With very detailed help, someone may actually find it useful.

giesse

[19:35](#msg5ca3b965016a930a4550d97e)I would need to see a real use case. And I bet $1 I could come up with a better solution for it. (One that doesn't have us `parse` old-timers stumble to figure it out.)

rebolek

[19:40](#msg5ca3bab41f6e900d5ec9957a)Maybe it can be useful in some rules generator? But I'm not going to bet on it, there are better things I can spend $1 on :smile:

giesse

[19:46](#msg5ca3bbfef851ee043d4eca77)I'm not saying that it \*can't* be useful. I'm saying that there's gotta be a better way to solve the problem.

[20:44](#msg5ca3c9bc0aad63501919cf31)Updated `topaz-parse` in preparation for much bigger changes to come: https://github.com/giesse/red-topaz-parse

## Wednesday 3th April, 2019

toomasv

[07:16](#msg5ca45dc68148e555b23e1537)Here's how `then` actually works on W10:

```
parse [x y d 1][['x 'y then word! "comment here" | (probe "2") 'k 'l 'm | (probe "3") 'o 'p] then integer! "and final remarks"]
;== true

parse [k l m 1][['x 'y then word! 'comment 'here | (probe "2") 'k 'l 'm | (probe "3") 'o 'p] then integer! "and final remarks"]
;"2"
;== true

parse [o p 1][['x 'y then word! comment here | (probe "2") 'k 'l 'm | (probe "3") 'o 'p] then integer! "and final remarks"]
;"2"
;"3"
;== true

parse [x y ta-daa! 42][['x 'y then 'x (do something) | (probe "2") 'k 'l 'm | (probe "3") 'o 'p] then integer! "and final remarks"]
;"2"
;"3"
;== false

parse [x y ta-daa! 42][['x 'y then word! and whatever else | (probe "2") 'k 'l 'm | (probe "3") 'o 'p] then integer! "and final remarks"]
;== true
```

That is in case of `rule1 then rule2 rule3 | rule4` if either `rule1` or `rule2` fails, `rule4` is tried; `rule3` is always ignored.  
This effectively means that after `then rule2` you may write anything that is loadable. Seems usable for in-rule comments only?

rebolek

[07:50](#msg5ca465ca016a930a45554361)@toomasv that doesn't make any sense.

toomasv

[07:52](#msg5ca4663531aec969e8449d81)I don't claim it makes sense. I report how it seems to work currently on W10.

rebolek

[07:52](#msg5ca4664c93fb4a7dc2c6dbbc)@toomasv yes, that's not pointed at you, but at `then`

[07:53](#msg5ca4669693fb4a7dc2c6ddfa)`then : regardless of failure or success of what follows, skip the next alternate rule.`

[07:54](#msg5ca466bb759abc043c5a703c)what follows `word!` in your examples is not alternate rule.

toomasv

[07:55](#msg5ca466ec3ebbdc55b352cc06)Yes, its working doesn't match description.

rebolek

[07:56](#msg5ca4671831aec969e844a286)and what does it mean anyway? If I want to ignore next alternate rule, regardless of failure or success, I simply wouldn't write such rule.

toomasv

[08:00](#msg5ca4681e1f6e900d5ece1949)I understand it means what @giesse described, i.e. in case of `rule1 then rule2 | rule3 | rule4`, in case `rule1` fails `rule3` is tried, in case `rule1` succeeds but `rule2` fails, rule `rule3` is skipped and `rule4` is tried.

But also, shouldn't it mean that in case of `r1 then r2 r3 | r4 | r5`, if both `r1` and `r2` succeed but `r3` fails, `r4` is skipped?

rebolek

[08:05](#msg5ca469535a83c30a460140ac)From your examples it seems that `r3` is never checked.

toomasv

[08:06](#msg5ca46979a0790b29c95318dc)Currently yes, and next alternate rule is never skipped.

hiiamboris

[12:17](#msg5ca4a45d8148e555b2402c3c)then in R3:

```
>> parse "ac" ["a" "q" | "ac"]
== true
>> parse "ac" ["a" then "q" | "ac"]
== false
```

(in Red both are true)

[12:21](#msg5ca4a554f851ee043d550488)And please count my vote for removal of this abomination. The rule it's supposed to replace (`[rule1 (cont: rule2) | (cont: rule3)] cont`) is way cleaner and easier to follow than `then`.

rebolek

[12:24](#msg5ca4a618f851ee043d550977)dynamic rules ftw!

9214

[12:28](#msg5ca4a6e3016a930a45570dc0)&gt; removal of this abomination

\[Kill meh... Kill meh!](https://www.youtube.com/watch?v=SBzDU9dfpGQ)

hiiamboris

[12:38](#msg5ca4a94231aec969e84691dd):D

giesse

[17:55](#msg5ca4f38193fb4a7dc2cae67b)@hiiamboris or at least, it should be written as `[either rule1 [rule2] [rule3]]`, or perhaps `either rule1 [rule2 | rule3]`, though I find that just needlessly confusing.

[17:56](#msg5ca4f3c33ebbdc55b356d6e9)But in my experience, dynamic rules like that are the result of some other missing feature in `parse`, like `ahead` or `not` which didn't exist in R2.

hiiamboris

[18:21](#msg5ca4f9afa84e0c501ace8e01)&gt; But in my experience, dynamic rules like that are the result of some other missing feature in `parse`, like `ahead` or `not` which didn't exist in R2.

I believe so as well. Although `ahead` has a bit of a \[performance] problem: double matching.

## Thursday 4th April, 2019

greggirwin

[19:33](#msg5ca65c1225686a7dc3d6e944)After reading this chat, I vote for removal of `then` as well.

[19:34](#msg5ca65c2ebd70a40d5ff73a08)Would someone summarize and point to this chat and create a ticket for that request? Thanks.

9214

[19:36](#msg5ca65cda7ecbdc29cafddfe8):hammer:

[19:51](#msg5ca6603d8148e555b24c6878)@giesse while we are at it: how function's body can be used in Parse rules if there's a need for parameter substitution?  
e.g. in `foo: func [x] [thru x keep to x x]`, `x` either needs to be bound to a context (either `object!` or function's call frame which you need to explicitly keep intact) or substituted for a literal argument. Or you need to mimic call stack and function call by yourself, doing all associated bookkeeping.

[19:52](#msg5ca6607993fb4a7dc2d4bf3e)I also think that it would be nice to make internal Parse engine state directly accessible from rules. Right now this is possible only with `parse/trace` and some black magick trickery.

giesse

[19:57](#msg5ca661bb93fb4a7dc2d4c56e)Correct, in Topaz all the function call machinery was already available to me to tap into. With `topaz-parse` I'd have to do it myself.

9214

[19:58](#msg5ca661ecf851ee043d610479)That's cool! Direct stack access in Red is a wet dream of mine since a while.

giesse

[19:59](#msg5ca66204016a930a45637d57)But also, since I am compiling the `parse` dialect anyway, the compiler could directly substitute `x` for its value. So long as it's not a paren or something like that.

[19:59](#msg5ca662258148e555b24c7522)ie. `[foo 'c]` -&gt; `[keep to 'c 'c]`

9214

[19:59](#msg5ca66237016a930a45637dd8)Macros, sort of?

rebolek

[20:01](#msg5ca6628631aec969e851a1c2)@greggirwin I'm not against `then`, I just want it would make sense.

greggirwin

[20:06](#msg5ca663a825686a7dc3d71f8f)Given the examples and chat, it seems more confusing (hence risky) than useful. It doesn't give us any new capabilities, just a different way, and not a better one it seems.

rebolek

[20:08](#msg5ca664223ebbdc55b360f0c3)Current functionality doesn't make any sense, I believe all can agree on that. However `then` as a keyword can be useful. I'm not sure for what right now, but it certainly can.

moliad

[20:08](#msg5ca66427b34ccd69e7659609)I'm surprised it's still in the official distro, Nenad and I had convened that `then`is a redundant operator in PARSE since its the default operator.

[20:08](#msg5ca66455f851ee043d61191c)it only makes sense in the context of a PEG spec parser with its set of operators.

[20:10](#msg5ca664cc8148e555b24c8bbf)IIRC it should have been removed a long time ago (like 2 years or so)

rebolek

[20:21](#msg5ca6674cbd70a40d5ff78cc2)@moliad is there an issue on Github tracking it?

giesse

[20:29](#msg5ca6692b93fb4a7dc2d4fc4d)@9214 right, though, it can be smart enough not to evaluate the argument multiple times when it matters (I need to think about a real example though)

9214

[20:38](#msg5ca66b3631aec969e851de7d)I don't think that creating dedicated datatype (which almost 100% mimicks `function!`) for Parse rules is really worth it.

[20:38](#msg5ca66b50b34ccd69e765c808)Same argument can be made for regular Parse rules, they are \*just* blocks with some values in them.

[20:40](#msg5ca66bb03ebbdc55b3612077)Anyone who gets confused by `foo: func [x] [thru x keep to x x]` would be equally confused by `view [...]` or `draw [...]` IMO, or any other dialect.

nedzadarek

[20:47](#msg5ca66d4f25686a7dc3d76039)&gt; Anyone who gets confused about `foo: func [x] [thru x keep to x x]` would be equally confused about `view` or `draw` IMO.

With `view` or `draw` you're using commands inside the dialect. If `foo: func [x] [thru x keep to x x]` can be typed outside `parse` then it can be confusing.

rebolek

[20:48](#msg5ca66d93a0790b29c96114d8)@nedzadarek if you can write for example `parse/with blabla bleble [foo]`, then it's not so confusing.

9214

[20:49](#msg5ca66dbd93fb4a7dc2d51d23)Another point to consider are possible side-effects that called function can produce. I don't think it's really critical though, assuming that caller knows what he's doing.

rebolek

[20:49](#msg5ca66de27ecbdc29cafe56f3)As it Red ever cared about side effects.

9214

[20:49](#msg5ca66de81f6e900d5edc3ad0)Right, right.

nedzadarek

[20:52](#msg5ca66e7b8148e555b24cd2b6)@rebolek yes, something like `parse/with [source] [rules] [function1: func [...] [...] function2: func [...][...]]` wouldn't be a problem.

[20:53](#msg5ca66ecd759abc043c68c4d4)&gt; As it Red ever cared about side effects.

That's why I have function constructor that makes probably almost all things local (even `x` in `set x`). I have built it especially for parse.

9214

[20:55](#msg5ca66f40759abc043c68c7c9)I wonder if there's any gain in keeping such rules as run-time constructs (i.e. `function!`), because they can be just macros. @giesse does Topaz has anything else interesting in this regard?

giesse

[20:55](#msg5ca66f4c8148e555b24cd89b)Ok, since there's seems to be enough interest in this topic...

I've spent like a decade thinking about it (on and off, obviously, but well). There are many ways to do it and in the end it's about which compromise we like the most.

Most obvious thing is to just reuse the `function!` type just like we are just using `block!` for rules, as @rebolek says. There is no technical problem with it, it's just a matter of whether you care about possible confusion. Admittedly, most of what we do is confusing to newcomers anyway.

The benefit of a separate type is just that it would not let you call it outside of `parse`, as well as not letting you accidentally use a regular function inside `parse` (both would lead to error messages that may not be very descriptive of what the real problem is, not to mention that both may just accidentally not error out but work in some way unexpected to the programmer which then has to figure out where the bug is). This can also be solved with a flag in the function spec, and as a way to do it right now, with a refinement like @nedzadarek suggests.

[20:56](#msg5ca66f8025686a7dc3d7702f)@9214 in Topaz I was thinking about `function!` because `parse` is an interpreter like in Red. But, `topaz-parse` being a compiler to `parse` right now, they can be just "macros" indeed.

[20:57](#msg5ca66fb30aad6350192bd2c3)Another way to solve this problem is to let people define them \*within* the dialect itself. Similarly to how @rebolek suggests `/with`, we could also do:

```
parse [...] [
    foo: rule [x] [keep to x x]
    ...  foo 'c ...
]
```

9214

[20:58](#msg5ca66ff4a0790b29c9612476)&gt; The benefit of a separate type is just that it would not let you call it outside of parse

Mhm, but regular function still can be called from `paren!` expression.

[20:58](#msg5ca67012a84e0c501ad89f31)And we can construct dynanic rules that way, with a bit of trickery.

[20:59](#msg5ca670211f6e900d5edc488b)(like some `then` example above demonstrates)

giesse

[20:59](#msg5ca6702d3ebbdc55b36141e3)This way they are contained within `parse` and most of the confusion goes away. But, of course, if you have multiple rule blocks, where do those definitions appear? Are they global or local? Do we want `/with` as @rebolek suggests? etc.

[20:59](#msg5ca6704831aec969e8520376)@9214 If called from a paren it would still be called by the `do` interpreter and thus cause an error.

9214

[21:00](#msg5ca670693ebbdc55b3614333)@giesse I mean `function!`, not theoretical `parse-function!` or whatnot.

[21:01](#msg5ca6709131aec969e8520442)`parse-function!` can be called from rule but not from `paren!` expression, and the reverse holds for `function!` (`any-function!` in fact).

giesse

[21:01](#msg5ca670921f6e900d5edc4c3c)As I said, this is all a matter of different compromises. Since we don't have the benefit of a few years of using this in practice, we can't say which compromise could end up being bad in practice.

[21:01](#msg5ca670be93fb4a7dc2d52eee)@9214 for `function!` right now I would probably use a refinement like @nedzadarek suggested, so that it's unlikely that it would be called accidentally from the wrong "context".

[21:02](#msg5ca670f70aad6350192bda5e)Anyway, I'm thinking that I'll up the priority of this in `topaz-parse` quite a lot, so perhaps we can play with the idea and see if it works in practice or not?

9214

[21:04](#msg5ca67168c55bd14d358cc749)@giesse what would be interesting is to be able to check somehow if Parse's call frame is on a stack during such `function!` calls. If it isn't there then `function!` simply bails out. This call frame provides enough "contextual" info, and there's no need for crude hacks.

[21:05](#msg5ca6718331aec969e8520aa4)Although such introspection can be viewed as a crude hack itself.

[21:05](#msg5ca671913ebbdc55b3614bb8)But, like you said, it's all about trade-offs.

giesse

[21:08](#msg5ca67233a84e0c501ad8afce)Some level of access to the internals is always cool... but the other side of the coin is that people will end up doing all sort of crazy stuff with it. :)

Alternatively making it easier to change the interpreter itself is a solution. That's why it was so important to me that Topaz be written in Topaz and not JS or even a lower level dialect (which was my initial plan, similarly to Red/System...)

9214

[21:09](#msg5ca67275f851ee043d617d14)&gt; people will end up doing all sort of crazy stuff with it. :)

But that's the whole point! :neckbeard:

[21:10](#msg5ca672afa0790b29c9613826)&gt; Alternatively making it easier to change the interpreter itself is a solution

Yes, tossing arround different evaluation strategies (laziness and Scheme `amb` come to mind) or switching interpreter alltogether.

nedzadarek

[21:12](#msg5ca673447ecbdc29cafe7f0b)@giesse  
&gt; flag in the function spec

It reminds me about \[Rebol's attributes](http://rebol.com/docs/core23/rebolcore-9.html#section-7). I haven't used them but I think it would require some changes in the Red itself.

giesse

[21:13](#msg5ca6735f93fb4a7dc2d5426b)@nedzadarek correct.

rebolek

[21:49](#msg5ca67bdd7ecbdc29cafeb687)I must leave discussion for few minutes and how many interesting ideas! I believe (and can prove that with code), that basic rule with args can be implemented without going to R/S. Would it be cooler and faster? Certainly yes!

greggirwin

[23:09](#msg5ca68ebfa84e0c501ad965ba)Access to internals is a double-edged sword. It's better if you don't \*have to* handle the edges (as R2 forced with View, before accessors were added, and even after that). "The goal of a `func-rule!` type is ..."  
Let's start with that.

## Friday 5th April, 2019

greggirwin

[00:24](#msg5ca6a024a84e0c501ad9d1f9)Finally caught up in red/help and see that rule args are, as expected, the driving force.

giesse

[05:22](#msg5ca6e5fcbd70a40d5ffa801b)@greggirwin I'll add some level of support for this in `topaz-parse` so we can have a concrete basis for discussion.

moliad

[13:23](#msg5ca756c70aad63501931abee)@rebolek I have no idea. it was something we deduced when we where looking at the code of parse face to face. I guess it's something that Nenad might have forgotten to track, it was just a simple observation within a day-long meeting.

[13:23](#msg5ca756d71f6e900d5ee2189d)(above is in reference to removing `then`)

## Saturday 6th April, 2019

giesse

[20:21](#msg5ca90a407ecbdc29ca0f708b)There's a pattern I have to deal with all the time in various forms, an example being:

```
some-word: [...]
parse [some-word] [block! | set x word! if (block? get/any x)]
```

In other words, I'm expecting a `block!` value, but a word referring to a `block!` value should be accepted too.  
This happens all the time when parsing parse rules, especially because `block!` above, for eg., it's not a `datatype!` but a word referring to a `datatype!`. So if I write `['into opt datatype! block!]` it doesn't work in practice, it needs to be `['into opt [datatype! | set x word! if (datatype? get x)] block!]`, and so on. In fact, almost everywhere I'm matching a value directly that's not a keyword, I want to do word lookup.

How should this pattern be expressed in `parse`?

[20:24](#msg5ca90af77ecbdc29ca0f7512)I'm thinking of something like `[get block!]` which will match a `word!` value so long as it refers to a `block!` value. In general, `[get rule]` would match a `word!` as long as the value it refers to matches `rule`; but the generalization gets tricky because `rule` could match more than one value, and so on. So perhaps it should only allow datatypes and typesets.

[20:25](#msg5ca90b30759abc043c79ef43)Another possibility is something like `[into word! rule]`, but I don't know if that is confusing.

9214

[20:26](#msg5ca90b8ba84e0c501ae9608a)@giesse it sounds like a "semantic" rule to me - you don't want to match by the looks of the value but by its properties.

[20:27](#msg5ca90bad1f6e900d5eed20c6)e.g. `integer! > 5` or something like that would match all integers greater that 5.

giesse

[20:27](#msg5ca90bc4016a930a457547a7)Another possibility is to use a path like `word!/block!` to indicate a word that refers to a block. This would allow something like `[into word!/block! rule]` to mean `[into word! [into block! rule]]`, but that sounds like I'm going too far. :)

[20:28](#msg5ca90be3bd70a40d5f08994f)@9214 I think that `[set x integer! if (x > 5)]` is a good enough solution for that.

9214

[20:28](#msg5ca90bf97ecbdc29ca0f7b0d)@giesse but it's essentially the same as your case, no?

giesse

[20:28](#msg5ca90c083ebbdc55b37280f8)but with words it is so pervasive that I feel like having built in support would help a lot.

[20:30](#msg5ca90c48b34ccd69e7760ec8)I haven't really had to use `if (x > 5)` ever, but I have to lookup words basically every time I encounter one when compiling a `topaz-parse` rule.

[20:30](#msg5ca90c608148e555b25e642c)the dialects I use in `%ast-tools.red` also have to do the same thing

[20:30](#msg5ca90c7f016a930a45754d28)and, one of my earliest proposals for `parse` in R2 was the `do` keyword that solved a generalization of this problem.

[20:31](#msg5ca90c93016a930a45754d6e)See http://www.colellachiara.com/soft/PDFM2/compile-rules.r for eg.

9214

[20:31](#msg5ca90c95759abc043c79f7f6)I believe it's pervasive only when you work with Parse rules themselves. And it can be supported as a part of some larger feature-set, like these "semantic rules" or your `parse-function!` idea.

giesse

[20:31](#msg5ca90cb425686a7dc3e8a32a)I don't recall writing a dialect where I did \*not* want this feature. :P

9214

[20:31](#msg5ca90cb6759abc043c79f97b)&gt; generalization of this problem

Yes, exactly. We need a general mechanism, not case-by-case little keywords.

giesse

[20:32](#msg5ca90cf631aec969e8624b55)`do` does full evaluation, and it cannot back-track. I love it because you don't need `compose` on dialects anymore, but it seems that most people don't feel that way.

[20:33](#msg5ca90d230aad6350193cfb7f)looking up words is pervasive, checking arbitrary expressions is rare enough that `if` is a good general mechanism for it.

[20:33](#msg5ca90d333ebbdc55b37288e9)but, I guess it's only pervasive for me - good to know :)

9214

[20:34](#msg5ca90d6dbd70a40d5f08a319)Dunno, I might be wrong of course. Let's see what others have to say.

giesse

[21:10](#msg5ca915bf25686a7dc3e8dcef)Is this supposed to be an infinite loop?

```
parse ['collect | 'copy | 'object] [any [not '| skip | (x: none)]]
```

[21:11](#msg5ca915f1c55bd14d359e73b7)Note that this is not:

```
>> parse [| 'copy | 'object] [any [not '| skip | (x: none)]]
== false
```

9214

[21:22](#msg5ca9187ba0790b29c9729420)@giesse ?

```
>> parse ['collect | 'copy | 'object] [any [not '| skip | (x: none) skip]]
== true
```

[21:22](#msg5ca9188cbd70a40d5f08eff9)The latter might be infinite loop check kicking-in or `any` subtlety.

giesse

[21:32](#msg5ca91ae5a0790b29c972a4f4)my point is that it should stop when input doesn't advance, otherwise there's no point in having `while`. :)

[21:32](#msg5ca91af98148e555b25ec4da)I can work around it with `| (x: none) fail`

[21:34](#msg5ca91b4d31aec969e862a69f)But perhaps it's not a bug and rules should be written to not always match.

## Sunday 7th April, 2019

toomasv

[05:51](#msg5ca98fd8016a930a45786b4f)@giesse How about `block? word!`, more generally `[ | ]`,  being rule that looks at next value and if it is word queries its reference value type (`datatype!` or `typeset!`)?

greggirwin

[20:06](#msg5caa585ba84e0c501af18ec7)I see @giesse and @9214's targets as quite different, though related. Syntactic matching and evaluation/constraints are very different. Matching a word that refers to another type is a step of indirection, and nothing more. I've hit this same need myself. You can avoid it with basic dialects, but as soon as we want more expressive flexibility, it would be very nice to have.

We don't have a `get-datatype!` syntax (`:block!`), but if we agree on a `ref!` type (`@ref` syntax), that could be pressed into service in `parse` when it's added.

9214

[20:23](#msg5caa5c32f851ee043d7b1cd7)@greggirwin where should ticket about `then` go, in REP or in main repo?

greggirwin

[20:27](#msg5caa5d391f6e900d5ef57f5d)Main repo I think.

## Monday 8th April, 2019

giesse

[00:32](#msg5caa96a61f6e900d5ef6d400)@greggirwin actually... we do have `:block!`, because in practice you'll never find an actual datatype in a rule, but a word like `block!` instead; so using a get-word to indicate a level of indirection might work.

[00:34](#msg5caa970f016a930a457f0ffc)the only question is whether it is readable enough. `get block!` vs `:block!` vs not sure what else (sorry @toomasv I don't think I like `block? word!`, especially because it would force us to keyword-match all the possibilities like `block?` and `string?` and so on and so forth.)

greggirwin

[04:35](#msg5caacf77016a930a45806ea1)One concern over the get-word! syntax is that normal get-words already have a purpose, and a very different one. Might still be OK though.

giesse

[06:32](#msg5caaeae0f851ee043d7eb27a)Not in `topaz-parse` though, at least not yet :) But, again, I don't know what this feature should look like. I'm using `get` right now, just hoping to find something better.

9214

[08:07](#msg5cab014f016a930a4581c713)https://github.com/red/red/issues/3843

## Tuesday 9th April, 2019

giesse

[22:30](#msg5cad1d21f851ee043d8e40ed)I have an implementation of rule functions (ie. rules with arguments and locals): https://github.com/giesse/red-topaz-parse

There are a number of limitations (mostly due to the compilation process), but it's a start. If you guys like it and have real use cases, we can work on fixing any issues.

[22:34](#msg5cad1de793fb4a7dc2018996)

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> do %topaz-parse.red

>> foo: rule [a b] [a ("A matched") | b ("B matched") | ("Neither matched")]
>> topaz-parse [1 2 3] [foo word! integer!]
== "B matched"
>> topaz-parse [a b c] [foo word! integer!]
== "A matched"
>> topaz-parse [a b c] [foo block! paren!]
== "Neither matched"

>> foo: rule [n [integer!]] [n integer!]
>> topaz-parse [1 2 3] [foo "String"]
*** Script Error: foo does not allow string! for its n argument
*** Where: do
*** Stack: topaz-parse cause-error  
>> topaz-parse [1 2 3] [foo 3]
== 3

>> foo: rule [] [n: integer! (n * 3)]
>> topaz-parse [4] [foo]
== 12
>> n
*** Script Error: n has no value
*** Where: catch
*** Stack:
```

## Wednesday 10th April, 2019

nedzadarek

[12:13](#msg5cadddcc25686a7dc308f4be)@giesse my only problem is with the syntax (readability). With the current form there is no way to know without reading source(s) if you mean:  
\- `foo` (normal rule/block or 0-argument `rule`), a `word!` and an `integer!`  
\- `foo` `rule` that takes 1 argument (a `word!`) and an `integer!` or  
\- `foo` `rule` that takes 2 arguments - a `word!` and an `integer!`

PS. about `topaz-parse` itself:  
`end` should match whole thing as per readme:  
&gt; The parsing succeeds if the rules match, even if they don't consume all the input. To achieve the same behavior as parse, just add end to your rules appropriately.

It works with rules not in a block:

```
topaz-parse [a b c] ['a word! end]
; none
```

However it does not work when I put things into a block:

```
foo: ['a] topaz-parse [a b c] [foo word!  end]
; a
```

giesse

[18:45](#msg5cae39c6f851ee043d95ef72)@nedzadarek the same argument is valid for Red functions.

[18:46](#msg5cae3a19bd70a40d5f2aea1d)Thanks for the bug report, I'll fix it.

nedzadarek

[20:51](#msg5cae575425686a7dc30c76ba)@giesse You are right.  
With the current implementation: is this possible to make a `rule` that takes a `block!`/`paren!` and returns e.g a first and a second element (something like `r: rule [bl] [bl/1 bl/2]` - `topaz-parse [a a] [r [word! word!]]` =&gt; equivalent of 2-argument `rule`: `r2: rule [a b] [a b]` - `topaz-parse [a a] [r2 word! word!]`)

I thought it was my error. Well, thank you.

giesse

[22:03](#msg5cae6818c55bd14d35c333f4)You can see it's clearly a bug from this:

```
>> topaz-parse [a b] [word! word!]
== b
>> foo: [word!] topaz-parse [a b] [foo word!]
== a
```

[22:06](#msg5cae68daf851ee043d97304c)Using paths is possible, but there are a couple issues:  
\* Red `parse` does not handle paths, so the compiler has to work around it  
\* The compiler won't know at compile time what `bl/1` and `bl/2` are, so it can only guess. This will make it fail if you try to use this for anything more complicated than just your example above. It may be possible to get most cases to work with enough static analysis, but that's a lot of work; maybe one day. :)

nedzadarek

[22:07](#msg5cae69180aad635019618364)@giesse I see, thank you.

giesse

[22:08](#msg5cae696f31aec969e8859b7c)The whole point of this experiment so far is to figure out if this can be indeed useful enough to be worth extra effort. So if you can come up with real use cases and how it helps or fails, that can inform the design.

[22:09](#msg5cae69b28148e555b2830661)I should also mention, another option for things like your `bl/1` example is to have the compiler generate code for all possible cases and then select at runtime, or, just spit out the code for an interpreter, so when something can't be determined at compile time it just gets interpreted at runtime.

[22:11](#msg5cae69fc759abc043c9e4084)I do want to do both things eventually - analyze as deeply as possible to figure out optimizations, and fall back to an interpreter if everything else fails; but it's going to take a while to get there I think.

## Thursday 11st April, 2019

dander

[06:48](#msg5caee350b34ccd69e79c86c7)I was working on some parsing code which I wonder if it might be a helpful use case. The purpose was to strip out some extraneous sections of xml to make it smaller. In this example, the key is that there are some different elements that have to have an attribute `disabled="false"`. Here are some relevant parts:

```
close-element: function [name][
    rejoin ["</" name ">"]
]

disabled-element: function [name][
    compose/deep [
        "<" (:name) to [{enabled=} | ">" | "/>" ]
        {enabled="false"} to [">" | "/>"]
        ["/>" | ">" thru (close-element :name)]
    ]
]
```

I generated some rules from these

```
disabled-filter: disabled-element "Filter"
disabled-stream: disabled-element "Stream"
disabled-component: disabled-element "Component"
```

then remove them while walking the document

```
parse action [some [
    remove [
        manual
        | disabled-filter
        | disabled-stream
        | disabled-component
        | param-option
    ]
    | skip]
]
```

I haven't tried porting it to the topaz method yet, but it looks like it would clean it up a bit, but not change things too significantly. Still, any improvement in clarity is nice to have. I'm fairly new to parse, and getting the `to`/`thru` behavior right were the really tricky parts for me.

Incidentally, I'm also interested in if there is some better way of approaching this.

giesse

[18:30](#msg5caf87df1f6e900d5e1890b7)I haven't worked on string parsing yet, and I'm not a fan of changing the input in place, but yes, this could be a real use case for rule arguments.

I think I would address this particular problem by loading the whole xml into some internal representation, then manipulating that, then outputting back xml; it's overkill for your simple case of wanting to remove a few elements, but most of the time it can be really useful.

dander

[20:14](#msg5cafa03fb34ccd69e7a1be20)Yeah, I figure eventually there will be a built-in xml processor at some point, and I would probably go that route if it were available. It would certainly be less error prone than my approach

nedzadarek

[20:55](#msg5cafa9c23ebbdc55b3a01192)@giesse  
&gt; So if you can come up with real use cases and how it helps or fails, that can inform the design.

I have found 2 small cases:  
1\) `[ahead block! into return-parse-rule]` =&gt; so I would like to type this: `into-block: rule [...] [...] [into-block return-parse-rule]`

```
r: rule [some-rule] [ahead block! into some-rule]
rule1: ['b (print "found b")] 
topaz-parse [a [b] ] ['a r rule1]
; found b
; == b
```

2\) `set refinement refinement! (append refinements to-word refinement)` =&gt; name `refinement` is not really important. What is important is that I append matched type to some collection. I would like to do something like this:

```
create-name: does [to-word append "temp" random 9999]
r: rule [type collection ] [set (c: create-name) type (append collection c)]
arr: copy [] 
topaz-parse [42] [r integer! arr]
```

after I run this code `arr` should have `42` in it.  
PS. is this doable with the current `rule`?

9214

[21:09](#msg5cafacf93ebbdc55b3a028d2)@giesse I still don't like your idea with function's body being a Parse rule. It's too limited and requires a custom `rule` function. And, no, I don't buy an argument about it being confusing - either way it's just a function that takes some arguments and returns a block that looks like a Parse rule, what's confusing in that?

BTW, do you support refinements?

[21:15](#msg5cafae6e25686a7dc315b9e1)I also think it might be useful to pass to such functions some extra info implicitly (unless there's a direct access to it), e.g. for error reporting (series position, previous rule and it's status, etc). Another question if they can backtrack to alternates outside of themselves.

[21:28](#msg5cafb17031aec969e88e08c9)I mean, when you compile `foo: rule [][... |]` down to Parse, e.g.:

```
[a b foo c]
```

Does it act like

```
[a b [... |] c]
```

or

```
[a b ... | c]
```

?

## Friday 12nd April, 2019

giesse

[07:01](#msg5cb037bb3ebbdc55b3a39742)former, \[... |]. It's exactly like a normal rule, except you have arguments. Eg.:

```
foo: [... |]
[a b foo c]
; vs.
foo: rule [blah] [... |]
[a b foo c]
```

[07:01](#msg5cb037d3759abc043caa4e4a)You want it to be special, I want it to be \*exactly* the same as current blocks, except with arguments and locals.

[07:01](#msg5cb037ddbd70a40d5f37b18a)I don't currently support refinements.

[07:02](#msg5cb0381a0aad6350196dab8c)@nedzadarek `topaz-parse` does not have `ahead` or `set`. You can use `into block! [...]` to specify what type `into` should accept.

[07:03](#msg5cb0382fa84e0c501a19f4bc)I'll look more closely at your examples tomorrow and explain more.

[18:14](#msg5cb0d571759abc043caeb678)@nedzadarek  
1\) are you asking for the general case of allowing passing sub-rule blocks to rule functions? If that's the case, I think I just need to add some support for it. If instead you are asking specifically about `into`, as I briefly mentioned yesterday you can use `into block! some-rule`.

2\) why not just

```
>> topaz-parse [42] [collect [keep integer!]]
== [42]
```

[18:15](#msg5cb0d5beb34ccd69e7a9aa20)eg.

```
>> input: [word /refinement some-other-word /some-other-refinement "string"]
== [word /refinement some-other-word /some-other-refinement "string"]
>> topaz-parse input [collect any [keep refinement! | skip]]
== [/refinement /some-other-refinement]
```

nedzadarek

[20:28](#msg5cb0f4f920fbe911eea59256)@giesse 1)  
I guess I wasn't clear. I mean `ahead` &amp; `into`, in the Red, are used together so why not create a `rule` to make it shorter (as you have already done with `into block! some-rule` in the topaz; I would do it even shorter... well, just a few characters). There might be another keywords used together so why not join them into one `rule`.

2\) I have forgotten another thing (it's in the first line but I missed it in the later code). I have to change matched thing in my code to other type (in my case `to-word`).  
Let's say I need to convert to floats:

```
create-name: does [to-word append "temp" random 9999]
r: rule [type collection ] [set (c: create-name) type (append collection to-float c)]
arr: copy [] 
topaz-parse [42] [r integer! arr]
```

Result:

```
[42.0]
```

giesse

[20:59](#msg5cb0fc4bbd70a40d5f3d2b10)2)

```
>> input: [word /refinement some-other-word /some-other-refinement "string"]
== [word /refinement some-other-word /some-other-refinement "string"]
>> topaz-parse input [collect any [ref: refinement! keep (to word! ref) | skip]]
== [refinement some-other-refinement]
```

[21:02](#msg5cb0fcfc93fb4a7dc21bbce7)1) Ok, so I think it's just a matter of the compiler not being smart enough right now. I think I can fix this at least to the level that you need, but it will need more work to handle all possible cases. Eventually I'll get there. :) In fact, I think I have an idea on how to let you easily switch between the compiler and an interpreter, without adding too much code. Hopefully soon. :)

nedzadarek

[22:48](#msg5cb115c4016a930a45acef01)@giesse 2) `collect` + `keep (fun X)` is a nice combination. It's smaller but I still need to make a name for the word. I want to avoid creating unnecessary words yet keeping it "readable enough". Parse's functions might deal with naming such words leaving "core" to the user. It's something like \[tacit programming](https://en.wikipedia.org/wiki/Tacit\_programming).  
ps. It's not my use-case but what if an user want to collect things into different types, for example a `binary!`? In general (in harder cases), would you (or anyone) prefer to use parse's (future) functions or some external utility, For example:

```
do https://raw.githubusercontent.com/nedzadarek/cold.red/master/main.red
foo: func [bl init] [
    cold/fun/into bl func [key value] [
      init/(key): init/(key) + value
 ] init
]
foo [
    parse [1] [set i integer! (keep 1 i)]
] #{00}
```

Result:

```
== #{01}
```

## Saturday 13th April, 2019

giesse

[06:43](#msg5cb184f7b34ccd69e7adf65b)Perhaps `collect binary! [...]`. Haven't thought much about this yet.

[06:45](#msg5cb18577a84e0c501a22d483)Re: having to use a word for case 2, maybe this is how `function!` values should be used in `topaz-parse`:

```
topaz-parse input [collect any [keep to-word refinement!]]
```

[06:45](#msg5cb1859df851ee043dac27e5)Provided the function only takes one argument, it gets the result of the following rule, and results in its return value.

[06:48](#msg5cb1862231aec969e89a090f)It would probably be very useful with dialect interpreters, for eg. `[on-word word! ...]` where `on-word` is your interpreter's function for dealing with words. Combined with `collect` and `object` it would make the `parse` dialect almost functional.

[06:48](#msg5cb1864b1f6e900d5e2598e7)so instead of `[x: some-rule (do-something-with x)]` you just write `[do-something-with some-rule]`. It could be hard to read though.

## Monday 15th April, 2019

nedzadarek

[11:11](#msg5cb466fb3ebbdc55b3bf4298)@giesse  
`[collect any [keep to-word refinement!]]` and version with your `topaz`'s `object` might be good addition for core `parse`.

&gt; It could be hard to read though.

I would name my function-rules with some distinctive name (e.g. ending with `*`) but it's just a naming conventions.

giesse

[18:26](#msg5cb4ccbe20fbe911eebe99c6)It may be worth playing with. It should be super easy for me to add it.

Rebol2Red

[18:55](#msg5cb4d39725686a7dc33797ff)

```
data: {

    <s>
		<d>15</d>
		<o>
			<f1>
        </o>
	</s>
	
    <s>
		<d>25</d>
		<o>
			<f2>
        </o>
		<o>
			<f3>
        </o>
   </s>

    <s>
		<d>37</d>
		<o>
			<f4>    
        </o>
   </s>
	
}

parse data [
	collect set res [
		some [
			thru {<s>} 
				thru {<d>}
				keep to {</d>}
				some [
					thru {<o>}
						thru {<f}
						keep to {>}
					to {</o>}
				]
			to {</s>}
		]
	]
]
probe res
```

;== \["15" #"1" #"2" #"3" #"4"]

please, \** explain why \** this does not work as expected

i need to get  
\[\[15 1]\[25 2 3]\[37 4]]

dander

[20:09](#msg5cb4e4de1f6e900d5e3b5922)@Rebol2Red once you've reached your first , the parser is still in the `some` block, so the next thing it looks for is `thru {}`, not `to`, and that will jump you further down in the document than you want to go. `to` / `thru` are pretty tricky to get right. Ideally, you should try to build up rules that define the whole document, but I don't know how much more complex it is than your example

endo64

[22:09](#msg5cb5011aa84e0c501a398014)@Rebol2Red A little confusing using that double `collect` but here is what you ask:

```
ws: charset "^/^- "
aws: [any ws]
digit: charset "0987654321"
probe parse data [
	collect [some [aws "<s>" aws "<d>" collect [keep any digit "</d>" aws some ["<o>" aws "<f" keep some digit ">" aws "</o>" aws] "</s>"]]]
]
```

Output:

```
[[
    "15" #"1"
] [
    "25" #"2" #"3"
] [
    "37" #"4"
]]
```

[22:10](#msg5cb5016e1f6e900d5e3c1931)You see the reason for double `collect` if you remove the first one.

## Tuesday 16th April, 2019

nedzadarek

[08:13](#msg5cb58eb48148e555b2b2a83f)@giesse :+1:

## Friday 19th April, 2019

Rebol2Red

[10:06](#msg5cb99d8ce416b84519a4e927)I still do not get it  
I can parse this with '2 passes' but not with one pass

```
data: {
	<ul class="genres">
		<li title="Family">Family</li>
		<li title="Drama">Drama</li>
		<li title="Adventure">Adventure</li>
	</ul>				   
	<ul class="countries">
		<li title="The Netherlands">The Netherlands</li>
	</ul>                            
}
                                       
parse data [
	collect set temp [thru {<ul class="genres">} keep to {</ul>}]	
]
parse to-string temp [
	collect set genres [some [thru {<li title="} thru {">} keep to {</li>}]]
]
parse data [
	collect set temp [thru {<ul class="countries">}	keep to {</ul>}]	
]
parse to-string temp [
	collect set countries [some [thru {<li title="} thru {">} keep to {</li>}]
	]
]
probe genres
;==["Family" "Drama" "Adventure"]
probe countries
;==["The Netherlands"]
```

I want to get \[\["Family" "Drama" "Adventure"]\["The Netherlands"]]  
Countries and genres can be one or more.

9214

[10:36](#msg5cb9a4ac3d78aa6c035b96d8)@Rebol2Red

```
data: {
    <ul class="genres">
        <li title="Family">Family</li>
        <li title="Drama">Drama</li>
        <li title="Adventure">Adventure</li>
    </ul>                   
    <ul class="countries">
        <li title="The Netherlands">The Netherlands</li>
    </ul>                            
}

bl: charset reduce [space tab cr lf]
ul: [thru "<ul" thru ">" some [some bl </ul> break | li] | thru </ul>]
li: [thru "<li" thru ">" keep to </li> </li>]

probe load mold/flat parse data [collect some [to "<ul" collect ul]]
```

Rebol2Red

[10:43](#msg5cb9a6673d78aa6c035ba18b)Thank you, i will look into this.

toomasv

[15:46](#msg5cb9ed443b6cb0686a1c25dc)@Rebol2Red Alternative experiment, albeit not pure parse:

```
block: parse data rule: [
	collect [some [
	  [{"genres"} | {"countries"}] rule
	| #"^"" keep to #"^"" skip 
	| skip
	]]
]
move back tail block/1 tail block
load mold/flat block
;== [["Family" "Drama" "Adventure"] ["The Netherlands"]]
```

## Wednesday 24th April, 2019

giesse

[20:28](#msg5cc0c703a4ef097471f2e0a2)@nedzadarek updated `topaz-parse`:

```
>> foo: [word!] topaz-parse [a b] [foo word!]
== b
>> foo: ['a] topaz-parse [a b c] [foo word!  end]
== none

>> input: [word /refinement some-other-word /some-other-refinement "string"]
== [word /refinement some-other-word /some-other-refinement "string"]
>> topaz-parse input [collect any [keep to-word refinement! | skip]]
== [refinement some-other-refinement]
```

[20:30](#msg5cc0c75ae416b84519d49863)On passing a block to a rule function and then using it as a sub-rule - I think I'll deal with this later on, when I can deal with all the edge cases.

[21:48](#msg5cc0d9a22e2caa1aa6b2e133)I also cleaned up the code a bit, it should be easier to look at.

nedzadarek

[22:39](#msg5cc0e58d3d78aa6c038c4feb)@giesse :clap:

## Thursday 25th April, 2019

greggirwin

[17:58](#msg5cc1f55aa4ef097471faf6f7)@giesse the more functional approach does seem like it could be harder to read. We know from history that the pattern-action dispatch model is accessible to a wide audience; the functional approach less so.

hiiamboris

[19:25](#msg5cc2099a3b6cb0686a519785)Why is it so that `parse` cannot switch to a different input series with `:word` syntax? Are there any known hacks to do that?

greggirwin

[19:32](#msg5cc20b4697dcb371d8124dbb)I'm going mad just thinking about it @hiiamboris. =8^\\

hiiamboris

[19:33](#msg5cc20b7197dcb371d8124e6c):D

[19:33](#msg5cc20b9e990feb451800c604)And I'm going mad while inventing a hack! :D

greggirwin

[19:34](#msg5cc20bc7b489bb6ed7c4a964)That way lies madness to be sure. What are you trying to do?

[19:36](#msg5cc20c2c97dcb371d81255e5)Internally, from a clean slate, you could have multiple FSMs, and each one would have state for a single input series, then the processor would "context switch" between them, like co-routines, if the input series is switched.

hiiamboris

[19:38](#msg5cc20cc83b6cb0686a51a990)There's a dialect I'm experimenting with. I have 2 alternative implementation ideas:  
\- compile it to bare Red - very clean but I'm reinventing some `parse` wheels  
\- compile it to `parse` - thus leveraging some of it's stuff but will certainly involve some dirty hacks I won't be proud of

So I asked just for the sake of consideration of the 2nd option.

greggirwin

[19:39](#msg5cc20ce03d78aa6c03945c60)Go with option 1. :^)

[19:40](#msg5cc20d39375bac7470052f11)I remember having the same dilemma many years ago, when I worked up a CLI dialect.

[19:48](#msg5cc20f0be416b84519dd51d8)When you asked, backtracking first came to mind as an issue, but think about using set-words to mark locations, in combination with get-words to position the input. People who like `goto` and `longjmp` would probably like it. ;^)

hiiamboris

[19:49](#msg5cc20f5c97dcb371d8126d19)haha, yeah

[19:57](#msg5cc211434b4cb471d95861ff)So, the simplest hack looks like this now:

```
>> parse r: [[(change/only r [4 5 6]) (r: next r) into r end] [copy o collect some keep integer!]] r  ? o
O is a block! value.  length: 3  [4 5 6]
```

It modifies part of the rule, inserting a new input `[4 5 6]` into it, then using `into` on that input matching it against the rest of the rule.  
But no, I don't like to continue this way ;)  
Could've been better if `into` allowed to specify a custom series to go into.

greggirwin

[20:30](#msg5cc218d18446a6023e774bcd)That's an interesting idea. Though I can see where it would make things harder to reason about. What I've done in the past is break things up, so if there are sub-dialects (e.g. sub commands in a CLI app) they are all independent. It means some redundancy at times, but makes maintenance a lot easier and safer.

giesse

[20:46](#msg5cc21cba1cd0b8307d718def)@hiiamboris any more details? Specifically, what does your dialect do, what does it look like. There might be a completely different way to look at it.

rebolek

[21:05](#msg5cc220fe375bac747005b762)@hiiamboris Switching to different is series is not bad idea, but I'm fine with modifying. It's easy to use and really powerful.

[21:05](#msg5cc2211fa4ef097471fc1201)

```
>> series1: [a b c]
== [a b c]
>> series2: [1 2 3]
== [1 2 3]
>> series: series1
== [a b c]
>> parse series [some word! p: (insert p series2) some integer!]
== true
```

[21:09](#msg5cc222068790b0307efff80d)This does not refer to different series, but it's close :smile:

```
>> parse series [some word! (insert clear series series2) :series some integer!]
== true
```

hiiamboris

[21:28](#msg5cc226672e2caa1aa6bbb066)@rebolek :D

@giesse Details.. well ☺ It's focused at general purpose series transformations. In the future I'll be able to define a relation between a pair of series and expect that any modification in either of these will be automatically reflected upon the other. I'll give you some examples once I settle on the design and test it.

The rationale is that I \*hate* to deal with indices. It's a monkeys work that a human should never concern himself with. It's also a grave for declarativity. Unfortunately, using Red I often find myself deeply in index arithmetics, so that's what I wanna change.

dander

[22:07](#msg5cc22f944b4cb471d9593386)@hiiamboris using reactivity?

hiiamboris

[22:30](#msg5cc2350d990feb451801e264)Yeah, when the morphism is declared as persistent. Otherwise, a single operation.

## Thursday 16th May, 2019

hiiamboris

[21:14](#msg5cddd2c45b63ea22b3b9b7e0)Do you also think that `opt` rule is acting weird here?

```
>> parse "1234" [a: skip opt to "." a:] ? a
A is a string! value: ""
```

Whereas the following works:

```
>> parse "1234" [a: skip opt [to "."] a:] ? a
A is a string! value: "234"

>> parse "1234" [a: skip [to "." |] a:] ? a
A is a string! value: "234"

>> parse "1234.5" [a: skip opt to "." a:] ? a
A is a string! value: ".5"
```

greggirwin

[21:36](#msg5cddd7f275d9a575a6f311ea)I'll let @dockimbel speak to it being by design, but the first case does look like a bug to me. R2 and R3 return different results for `a` ("1234" and "234" respectively).

9214

[21:39](#msg5cddd88f509b1035c75df676)@hiiamboris https://github.com/red/red/issues/3679 ?

greggirwin

[21:46](#msg5cddda349404bf2aed5ab238)Thanks for finding that @9214.

hiiamboris

[21:49](#msg5cdddaea7c363c75a7f0bf85)I'll add it there then

## Wednesday 19th June, 2019

rebolek

[12:54](#msg5d0a3094faf70031f94e67f3)Hm, this result is not something I expected:

```
>> parse x: "-" [change not space #"."]
== false
>> x
== ".-"
```

toomasv

[13:30](#msg5d0a38dc4e8f972d37578b8b)@rebolek

```
>> parse x: "-" [not space change skip dot]
== true
>> x
== "."
```

rebolek

[13:32](#msg5d0a395a950f1062a9a8b4c7)@toomasv Thanks, but I'm not interest in workaround, I wonder why it's doing what it's doing.

toomasv

[13:32](#msg5d0a3981a8d9871b32c45b92)Because `not` does not advance, IMO. It's look-ahead rule. (Hence, corrected my code: `ahead` not needed)

[13:48](#msg5d0a3d26a8d9871b32c47b34)It's clear from this:

```
>> parse x: "-" [not space s: (probe s)]
"-"
== false
```

[14:34](#msg5d0a48074e8f972d37581845)Thinking of it -- where should it advance when it does not match? Let's say you have

```
parse x: "-" [not [2 space] rule]
```

where should `rule` continue from if not from same place as before trying subrule?

[14:38](#msg5d0a48f1bc56c731f8f6eb10)Above could have been written also as

```
parse x: "-" [change [not space skip] dot]
```

giesse

[19:28](#msg5d0a8ce3f5cf1f10bcae83df)@toomasv but, `change` should change not insert, no?

[19:28](#msg5d0a8cf9fbcc305cc4aca58d)though I guess if it's mapping to `change/part` it makes some sense.

[19:29](#msg5d0a8d36950f1062a9ab932d)ie. @rebolek think of it this way:

```
>> x: "-"
== "-"
>> change/part x "." x
== "-"
>> x
== ".-"
```

toomasv

[20:24](#msg5d0a9a13e527d95add119632)Nice example!

## Monday 24th June, 2019

hiiamboris

[21:28](#msg5d11406af5b00456dfd64a4e)On the old topic of preferring `while` over `any` - wanna mention another real world use case: I'm parsing a dialect and preprocessing it in place using logic like

```
parse input [while [input: 
    ...
    | (found a macro) ... (change/part input new-code 1) :input
    | ...
]]
```

`any` just stops since `input` did not advance after the substitution (by design). `while` gives me more control here.

## Tuesday 25th June, 2019

greggirwin

[16:53](#msg5d125173b03bdb2931044d09)Feel free to make notes in https://github.com/red/red/wiki/%5BDOC%5D-Parse as thoughts come up.

## Wednesday 26th June, 2019

rebolek

[08:23](#msg5d132b91850b87037c5f29de)@giesse @toomasv thanks for insights.

[08:25](#msg5d132bfbaacbfb5fb7ccb6aa)Now another problem. I want to check with `ahead` that there's colon on line. Something like:

```
ahead [copy value to newline if (find value colon)]
```

but without fallback to Red. Any ideas?

9214

[08:55](#msg5d13330a38c2bf757dbb66df)`ahead [to #":" to newline]`?

rebolek

[08:57](#msg5d13336eddc34e0f13e72edd)@9214 Thanks, that was easy. I guess my aversion to `to` makes some thing unnecessarily hard :)

hiiamboris

[09:46](#msg5d133ede850b87037c5fe7c6)`to #":"` part may skip a few newlines on it's way☺

rebolek

[09:46](#msg5d133f06501ea60f12492f8c)@hiiamboris true! My aversion to `to` is right again! :smiley:

hiiamboris

[09:46](#msg5d133f0b501ea60f12492fa0):D

9214

[10:09](#msg5d13446211ba925f6a2838b5)Well, it checks if there's colon on line... but maybe it's not the line you want :smirk:

rebolek

[10:10](#msg5d13447dd65dae046f8f7b72):)

9214

[10:17](#msg5d13464538c2bf757dbc208d)This is a common pain-point with `to` and `thru` - it's hard to delineate up to which rightmost boundary search should be made.

rebolek

[10:21](#msg5d134727b3f22a4b2a3b7f96)Hm, I think I've got it:

```
not-colon: charset [not ":^/"]
rule: [ahead [some not-colon colon]]
```

9214

[10:21](#msg5d13473f501ea60f12497f31)Ah, so you needed to check for colon at the end of the line?

rebolek

[10:22](#msg5d134752e6ae0b757c655b55)No, I need to check if there is one on the line

[10:22](#msg5d1347560a60964f8a8e2781)like in `key: value`

9214

[10:23](#msg5d13478adbd46e037d8062b4)Right, I see.

dander

[16:45](#msg5d13a12b38c2bf757dbf822a)I think this is the way to do it with `to`:

```
line-contains-colon: [to [":" | newline | end] ":"]
rule: [ahead line-contains-colon]
```

toomasv

[17:14](#msg5d13a805dbd46e037d840ceb)@dander :+1: , but considering @rebolek's aversion towards `to`, it is no-no. :smile:

dander

[17:28](#msg5d13ab46501ea60f124d3eef)Maybe it's a case of knowing what the safe patterns are. I came by this by repeatedly shooting myself in the foot though... it looks understandable to me now, but I recognize the risks. I guess the biggest thing with `to`/`thru` is that they are deceptively simple looking

toomasv

[17:30](#msg5d13aba7d92cb54b297d72f1)It is very close to @rebolek's solution actually:

```
[ahead [to [":" | newline] ":"]] ~ [ahead [some not-colon colon]]   ; not-colon: charset [not ":^/"]
```

```
to [":" | newline]     ~     some not-colon
```

dander

[17:35](#msg5d13acf0501ea60f124d4f5f)yeah, that's an interesting point. I guess `to rule` is basically equivalent to `any not rule ahead rule`

[17:37](#msg5d13ad686fb02f5f693779ba)hmm, I think `[some not-colon colon]` should maybe be `[any not-colon colon]`, but it probably doesn't matter for his example case

toomasv

[17:38](#msg5d13ad8edbd46e037d844176)@dander Ah, you are right! `any` would be better.

[17:50](#msg5d13b05ed92cb54b297da377)@dander But your suggestion `to rule` ~ `any not rule ahead rule` is not correct. Consider this:

```
rule: ["a"]
parse "bcda" [to rule rule]
;== true
parse "bcda" [any not rule ahead rule rule]
;== false
```

rebolek

[17:50](#msg5d13b06c6fb02f5f6937980e)@dander nice, thanks!

[17:51](#msg5d13b0a86fb02f5f693799a6)`some not-colon colon` makes more sense, because the key before colon should have some value, but you're right.

toomasv

[17:53](#msg5d13b11c11ba925f6a2c5b62)But

```
parse "bcda" [any [not rule skip] ahead rule rule]
;== true
```

rebolek

[17:53](#msg5d13b12a850b87037c643323)@toomasv I did some tests some time ago and IIRC, explicit rules are actually even faster than using `to` - another reason not to use it :)

toomasv

[17:56](#msg5d13b1c7850b87037c64391b)@rebolek I agree, but using `to` shouldn't be ruled out, IMO. In cases where performance does not matter, it can make rules simpler, although it must be used with much care.

rebolek

[17:58](#msg5d13b23438c2bf757dc02671)Don't get me wrong, `to` is great for simple stuff, if you're looking for one value in HTML page, it's the best solution. But converting some xMB document in random format to Red cannot be done with `to` properly.

toomasv

[17:59](#msg5d13b294aacbfb5fb7d1c911)@rebolek jawohl

rebolek

[18:00](#msg5d13b2a1b3f22a4b2a3f847f):)

dander

[18:05](#msg5d13b3f2b3f22a4b2a3f90b1)@toomasv ooh, `not rule` doesn't advance? So is this a case where parse detects an infinite loop and fails out?

[18:06](#msg5d13b43cd92cb54b297dc3ab)oh, never mind. I get it. It matches "bcd", but doesn't move forward, so ahead is still looking at the start

toomasv

[18:08](#msg5d13b49e11ba925f6a2c7a9a)@dander Don't know about failing out but see also this earlier discussion :point\_up: \[June 19, 2019 3:54 PM](https://gitter.im/red/parse?at=5d0a3094faf70031f94e67f3)

giesse

[18:50](#msg5d13be5ab3f22a4b2a3ff54f)@rebolek `to` and `thru` are useful \*very* rarely, but sometimes they are (aside from quick parsing I mean) - ie. `to #">"` is more readable than `any non-greater-than` (which also requires defining a charset) or `any not #">"` etc. It is also easier to optimize. That being said, I don't know how to stop people from using them too much.

@dander `not` cannot advance as it succeeds when the rule does \*not* match. :)

rebolek

[18:50](#msg5d13be92f040bc5fb6cdaef2)@giesse I know how to stop them, but it involves violence.

giesse

[18:52](#msg5d13bed9aacbfb5fb7d23dfb):D

pekr

[19:02](#msg5d13c134d92cb54b297e3aae)@rebolek I dont believe to/thru naysayers, sorry 😀

dander

[19:10](#msg5d13c32fd92cb54b297e4cc8)@giesse it makes sense when you say it that way 😄. So what happens when you do `any not rule`? It seems like that would match and not advance forever, but is the loop detected and interrupted?

hiiamboris

[19:21](#msg5d13c5a111ba925f6a2d21e5)`any`/`some` stop when they don't advance

## Thursday 27th June, 2019

giesse

[06:23](#msg5d1460ed850b87037c6a3e5b)@pekr if you are good enough to avoid the kind of mistakes with `to` and `thru`, you probably have little need for them.

endo64

[09:00](#msg5d1485adf040bc5fb6d4750e)I usually end up with infinite loop when using `some` or `any`

```
parse "bx" [some [not "b" | skip]]
```

rebolek

[09:03](#msg5d1486776fb02f5f693f153e)@endo64 what should this rule do other than infinite loop? ;)

hiiamboris

[09:11](#msg5d148844ddc34e0f13f33e91)@endo64 looks like a bug. I think you should report it.

rebolek

[09:12](#msg5d14886f0a60964f8a997474)@hiiamboris how is it bug?

hiiamboris

[09:13](#msg5d1488a8e6ae0b757c70b704)How it is not? `[not "b" | skip]` is always failing after the 1st iteration, yet `some` continues to match it.

[09:13](#msg5d1488bf4e13324f8b9ae12d)Look at `parse-trace "bx" [4 [not "b" | skip]]` output (I replaced `some` with a number of tries)

[09:15](#msg5d1489216e07c204706f3f4f)Ah, I see. It matches `"b" | skip` instead. Still, `some` is supposed to stop, no?

[09:17](#msg5d14899811ba925f6a33de54)

```
>> parse "xx" [any [not "b" | skip]]
== false
>> parse "bb" [any [not "b" | skip]]
== true
>> parse "xx" [some [not "b" | skip]]
== false
>> parse "bb" [some [not "b" | skip]]
== true
>> parse "bx" [some [not "b" | skip]]
(hangs)
```

Is there a logic to this? :)

rebolek

[09:19](#msg5d148a0bd92cb54b29852600)`not "b"` on `bx` -&gt; false, move to `skip`  
`skip` on `bx` -&gt; true, run rule again  
`not "b"` on `x` -&gt; true, run rule again  
and now it "hangs"

[09:19](#msg5d148a38dbd46e037d8bd75a)remember that `not` does not advance

endo64

[09:22](#msg5d148ad2dbd46e037d8bdc31)So we can't say `any`/`some` stop when they don't advance\`, no?

rebolek

[09:23](#msg5d148b21e6ae0b757c70cf5a)We can say it, that's why there's `fail` and `break`.

[09:24](#msg5d148b5f501ea60f12551799)And `reject` of course.

endo64

[09:25](#msg5d148b736fb02f5f693f495a)But why this doesn't hang: `parse "x" [some [not "b"]]`

hiiamboris

[09:25](#msg5d148b99ddc34e0f13f3650f)@endo64 exactly. And this is a mystery:

```
>> parse-trace "xx" [3 [not "b" | skip]]
 -->
   match: [3 [not "b" | skip]] 
   input: "xx"   
   -->
     -->
       match: [not "b" | skip] 
       input: "xx"       
       -->
         ==> not matched
       <--
       match: ["b" | skip] 
       input: "xx"       
     <--
   <--
 <--
return: false
== false
>> parse-trace "bx" [3 [not "b" | skip]]
 -->
   match: [3 [not "b" | skip]] 
   input: "bx"   
   -->
     -->
       match: [not "b" | skip] 
       input: "bx"       
       -->
         ==> matched
       <--
       match: [| skip] 
       input: "bx"       
       ==> matched
     <--
     match: [[not "b" | skip]] 
     input: "x"     
     -->
       match: [not "b" | skip] 
       input: "x"       
       -->
         ==> not matched
       <--
       match: ["b" | skip] 
       input: "x"       
     <--
     match: [[not "b" | skip]] 
     input: "x"     
     -->
       match: [not "b" | skip] 
       input: "x"       
       -->
         ==> not matched
       <--
       match: ["b" | skip] 
       input: "x"       
     <--
   <--
 <--
return: false
== false
```

rebolek

[09:26](#msg5d148bcff040bc5fb6d4a7e6)@endo64 hm, good question. I would expect it to hang.

endo64

[09:29](#msg5d148c9111ba925f6a33fb7a)`not "b"` doesn't advance, neither `some`, so how does it stop?

```
>> parse "x" [some [not "b" p1:] p2:]
== false
>> p1
== "x"
>> p2
== "x"
```

rebolek

[09:32](#msg5d148d244e13324f8b9b0882)IIRC there may be some checks to prevent some kind of infinite loops, this may be one of them (but I may be wrong).

endo64

[09:35](#msg5d148dd8850b87037c6be977)I asked that feature before, Nenad said that it could be added, but I didn't see a commit or message then.

hiiamboris

[09:35](#msg5d148df3b3f22a4b2a46fc5b)&gt; Iteration  
any rule : repeat rule zero or more times until failure or \*\*if input does not advance.\**  
some rule : repeat rule one or more times until failure or \*\*if input does not advance.\**  
while rule : repeat rule zero or more times until failure regardless of input advancing.

[09:35](#msg5d148dfdd65dae046f9b3074)https://www.red-lang.org/2013/11/041-introducing-parse.html

rebolek

[09:37](#msg5d148e55f040bc5fb6d4bee5)@hiiamboris Aha!

endo64

[09:44](#msg5d1490026e07c204706f7b13)Thanks @hiiamboris , so `parse "bx" [some [not "b" | skip]]` should not hang, `parse` cannot detect input does not advance in this case. Worth a ticket?

rebolek

[10:12](#msg5d149676501ea60f125583b6)Probably yes.

## Saturday 13th July, 2019

dockimbel

[13:19](#msg5d29da77c3740260bb15130e)Issue fixed.

endo64

[15:33](#msg5d29f9df01621760bca9a5da)I confirm, `parse "bx" [some [not "b" | skip]]` returns `false` and doesn't hang anymore. Thanks!

## Tuesday 16th July, 2019

toomasv

[05:45](#msg5d2d64647dbfff3242b77aff)Could action of `keep pick` be extended to expressions? Currently it works on matches only:

```
>> parse [a b c][collect some [keep ['b 'c] | skip]]
== [[b c]]
>> parse [a b c][collect some [keep pick ['b 'c] | skip]]
== [b c]
>> parse [a b c][collect some ['b keep ([add some stuff]) | skip]]
== [[add some stuff]]
>> parse [a b c][collect some ['b keep pick ([add some stuff]) | skip]]
== []
```

Same for `keep copy`.

## Friday 19th July, 2019

abdllhygt

[12:28](#msg5d31b769ec5abe7bbc0fe163)@toomasv  
the lexer works;

```
>> u ["mamazo" "mamaxo" "hama"]
== "ayah, ibu dan makanan"
>> uno ["mamazo" "mamaxo" "hama"]
== "ayah, ibu atau makanan"
```

[12:28](#msg5d31b77ac89880134726b7b3)but i didn't make the parser

[12:29](#msg5d31b78dec5abe7bbc0fe2e4)it translates to indonesian language from my conlang

toomasv

[12:32](#msg5d31b87b98514166872eea86):+1:

## Monday 22nd July, 2019

abdllhygt

[12:49](#msg5d35b0dd808425671cca7604)new sample

```
>> u [(ia[word: "mama" determiner: "ni" adjective: "hehaha"])(ia[word: "qaja"])]
== "orang tua lucu ini dan terjamah"
```

[13:24](#msg5d35b9278fe53b671db8e5fe)

```
Red
>> ieoa[[text: (oa[word: "o"])][text: (ia[word: "qima" determiner: "na"])]]["o" "i"]
== "iya, jeruk lemun itu"
```

(yes, that lemon)

greggirwin

[17:58](#msg5d35f92a8fe53b671dbab208)I'll say that's cool, even though the base lang and your conlang are foreign to me. :^)

abdllhygt

[20:52](#msg5d362212808425671ccdc799)thank you

[20:53](#msg5d362234e2d1aa6688ef9e53)but it's not my conlang, it translate to indonesian language haha

[20:53](#msg5d362257b2db751dabaf22b5)i want to make a parser for my conlang when i finished the indonesian lexer

## Tuesday 23th July, 2019

abdllhygt

[14:42](#msg5d371ce18fe53b671dc28e32)New Sample:

```
; %qslsamples/sample.red
ieoa[
  [
    text: (
      ia[
        word: "mamazo"
        determiner: "ni"
      ]
    )
  ]
  [
    text: (
      aa[
        word: "hama"
        tense: "za"
        negative: true
      ]
    )
  ]
]["i" "a"]
```

[14:43](#msg5d371cfd8fe53b671dc28f52)

```
>> do %qaja/qslsamples/sample.red
== "ayah ini tidak sedang makan"
```

[14:44](#msg5d371d3e8285d81daa46d7cb)english: this father isn't eating  
conlang: `i mamazo ni` `za no hama`

[15:24](#msg5d37269635e05c099389b455)\[sample2.red](https://github.com/abdllhygt/qaja/blob/master/qslsamples/sample2.red)

```
>> do %qaja/qslsamples/sample2.red
== "ayah saya belum terjamah bahasa ini"
```

english: my father didn't translate this language  
conlang: `i mamazom` `pa no qaja` `e qisa ni`

[15:44](#msg5d372b5b09580b7bbb91e0e3)updated:

```
>> do %qaja/qslsamples/sample2.red
== "ayah saya belum terjamah bahasa ini dirumah"
```

english: my father didn't translate this language at home  
conlang: `i mamazom` `pa no qaja` `e qisa ni` `ze me`

## Wednesday 24th July, 2019

abdllhygt

[08:17](#msg5d38141aa0351b1a8c8b3fd9)\[new sample](https://github.com/abdllhygt/qaja/blob/master/qslsamples/su-zu.red)

```
>> print do %qaja/qslsamples/su-zu.red
ayah saya belum terjamah bahasa ini ketika kita jalan jalan dijalan
```

english: my father didn't translate this language when we walk on the road  
conlang: `i mamazom` `pa no qaja` `e qisa ni` `zu` `i kisa` `a jaja` `ze jaja`

## Sunday 28th July, 2019

abdllhygt

[13:44](#msg5d3da6aa8aab922429d6a14a)hi again, i started to the parser

[13:45](#msg5d3da7018aab922429d6a538)

```
qq>> ni nama hehaha
id== nama lucu ini
```

it means `this funny name`

[13:48](#msg5d3da79184536e27e062f0f6)qq (translation language)  
id (indonesian language)

## Saturday 31st August, 2019

Rebol2Red

[08:58](#msg5d6a369c418f705d8769467b)

```
text: copy {<p></p> <p>6</p>}
res: copy []
parse text [
	some [
		thru "<p>" 	copy between to "</p>" (append res between)
	]
]
probe res/1
;==""
probe res/2
;=="6"
```

```
text: copy {<p></p> <p>6</p>}
parse text [
	collect set res [
		some [
			thru "<p>"	keep to "</p>"
		]
	]
]
probe res/1
;==#"6"
probe res/2
;==none
```

Why does the first code gives the expected result and the second code not?  
I want the same result using collect in one way or the other.

toomasv

[09:11](#msg5d6a39a9fda04e4c9d49a90c)@Rebol2Red Try `res: parse text [collect some [...]]`

Rebol2Red

[09:27](#msg5d6a3d6c7b263a4c9c86db13)@toomasv Thanks, but unfortunately it gives the same wrong result. Is this an issue? Does this works on your computer? If so which version of Red are you using?

9214

[10:52](#msg5d6a5165d3fda15e743e6637)@Rebol2Red this is not an issue, but the difference between `copy` and `collect` with `keep`. The former copies matched input in a straightforward way, the latter is more smarter and will ignore empty matches and coerce one-character strings to `char!` values (because, really, what you're parsing is a series of characters).

```
>> parse "abc" [collect some [keep skip]]
== [#"a" #"b" #"c"]
>> collect [parse "abc" [some [copy match skip (keep match)]]]
== ["a" "b" "c"]
>> collect [parse "abc" [some [set match skip (keep match)]]]
== [#"a" #"b" #"c"]

>> parse "xxx" [collect some [thru #"x" keep to #"x"]]
== []
>> collect [parse "xxx" [some [thru #"x" copy match to #"x" (keep match)]]]
== ["" ""]
```

Rebol2Red

[11:49](#msg5d6a5ecbb4d8294074a7e0e4)@9214 I see, thanks, It works, but i keep wondering if parse shouldn't be more straighforward. I mean more the way like people think it would work.  
So i am asking if there is a way to make your code compatible with my second code fragment using function/redefining/macro or whatever?

9214

[12:10](#msg5d6a63bb5b9a174fdf0fbe8d)&gt; more the way like people think it would work

I personally expect `copy` to keep the "always return a series" invariant, which it does with empty string case. Ditto for `keep` - I don't expect it to collect empty garbage, and don't think that this is useful at all in use-cases where `collect` typically applies.

People think all kinds of things, but what matters are strong, concrete examples and thorough understanding of language design / semantics. Feel free to \[propose your changes](https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-%28Feature-Wars%29) if you feel like it, but the onus is on you to convince us, not for us to argue with you why things are the way they are. OTOH, I got bitten by `keep` returning `char!` instead of `string!` myself, and agree that it can be more consistent and return `string!` in either case. Also see https://github.com/red/REP/issues/8

&gt; So i am asking if there is a way to make your code compatible...

The closest I can get is:

```
>> parse "<a> <>" [collect some [thru #"<" keep to #">" | keep ("")]]
== [#"a" ""]
```

Single-char is still an edge-case that requires workaround.

Rebol2Red

[16:20](#msg5d6a9e527b263a4c9c8994d9)@9214 Ok, I agree that things are what they are. Thank you for taken the time to explain why and for the code.

toomasv

[16:23](#msg5d6a9f148066a34073274d67)@Rebol2Red Sorry, was on phone earlier and couldn't double-check. This works:

```
res: parse "<p></p><p>6</p>" [
    collect some [
        thru "<p>" keep copy x to "</p>" thru "</p>"
]]
```

9214

[16:25](#msg5d6a9f84375cc34fdeefaeef)@toomasv I'm not sure if this is a bug or edge-case feature :confused:

toomasv

[16:26](#msg5d6a9fd138499c13a678a4a8)Which one would you suggest?

Rebol2Red

[16:27](#msg5d6a9fea8b7327421dcbf0bf)@toomasv Yes, that works  
@9214 I just executed your code and it is in some loop or so.

9214

[16:27](#msg5d6aa00bd3fda15e7440ae28)@Rebol2Red

```
>> parse "<a> <>" [collect some [thru #"<" keep to #">" | keep ("")]]
== [#"a" ""]
>> about
Red 0.6.4 for Windows built 31-Aug-2019/17:47:43+05:00 commit #b28d8f5
```

[16:38](#msg5d6aa2847b263a4c9c89b057)And while at it:

```
#do [match: none]
#macro grab: func [rule][
    compose/only [keep copy match (rule)]
]

probe parse "<p></p><p>6</p>" [
    collect some [thru <p> grab to </p>]
]
```

Rebol2Red

[16:49](#msg5d6aa53429dba2421cdd724c)@9214 Nice! My Red was not the latest. The reason is that some programs of mine from the past only works with older versions. Have to find a way to handle this.

9214

[16:51](#msg5d6aa575d3fda15e7440d469)&gt; Have to find a way to handle this.

The best way to handle this is to provide a minimal reproducible example of your bug / crash, so that we can fix it :wink:

greggirwin

[17:28](#msg5d6aae41d3fda15e744110ed):point\_up: \[August 31, 2019 6:10 AM](https://gitter.im/red/parse?at=5d6a63bb5b9a174fdf0fbe8d) :+1: @9214.

Would someone please recap the above chat and examples and add a section to https://github.com/red/red/wiki/%5BDOC%5D-Parse?

giesse

[19:21](#msg5d6ac8b18066a340732871df)@Rebol2Red @9214 compare with:

```
>> do %topaz-parse.red
== func [
    {Parse BLOCK according to RULES; return last result from RULES if it matches, NONE otherwise} 
    block [binary! any-block! an...
>> topaz-parse "<p></p> <p>text</p>" [collect some [thru <p> keep to </p> </p>]]
== [#"<" #"<"]
>> topaz-parse "<p></p> <p>text</p>" [collect some [thru <p> keep copy to </p> </p>]]
== ["" "text"]
```

toomasv

[19:45](#msg5d6ace77d3fda15e7441f2f9)@9214 :point\_up: \[August 31, 2019 7:25 PM](https://gitter.im/red/parse?at=5d6a9f84375cc34fdeefaeef) I am still wondering why do you think it is bug or edge-case?

9214

[19:52](#msg5d6ad00d7b263a4c9c8ae6a4)@toomasv because of an inconsistency in how `keep` treats empty match - without `copy` it fails, with `copy` it keeps an empty string. One can think that in both cases what was matched is an empty string (between

and

).

toomasv

[19:59](#msg5d6ad191b4d8294074ab17af)@9214 I don't think it is inconsistent. It keeps according to datatype - with `copy` it is forced to treat match as string, and it matches empty string, but with simple `keep` or `keep pick` it doesn't match anything there.

9214

[20:14](#msg5d6ad51c38499c13a67a1d12)Uhm, in both cases input datatype is the same, so why should `copy` affect anything? The only side-effect of matched `copy` IMO should be extraction of matched input into a word. "Anything there" in both cases is an empty string, it's actually equivalent to `keep none`.

toomasv

[20:28](#msg5d6ad87cb4d8294074ab4044)Surely it does. Compare these:

```
>> parse "<p></p><p>x</p><p>abc</p>" [collect some [thru "<p>" keep to "</p>" "</p>"]]
== [#"x" "abc"]
>> parse "<p></p><p>x</p><p>abc</p>" [collect some [thru "<p>" keep pick to "</p>" "</p>"]]
== [#"x" #"a" #"b" #"c"]
>> parse "<p></p><p>x</p><p>abc</p>" [collect some [thru "<p>" keep copy _ to "</p>" "</p>"]]
== ["" "x" "abc"]
```

Exactly according to \[explanation](https://www.red-lang.org/2017/03/062-libred-and-macros.html):

&gt; added pick option to keep, so user can control how keep captures the matched input:

&gt; keep collects matched values as a series if many, or as a value if only one.  
&gt; keep pick collects all the matched values separately in a block.  
&gt; keep copy &lt;word&gt; collects all the matched values as a single series (of same type as input).

9214

[20:35](#msg5d6ad9fc2efeca1df52b8f17)Unless I'm completely blind, all `keep` options "collect \*matched value(s)\*". How come first two examples haven't matched anything but the third one did, even though there's no \*value* between `<` and `>` characters?

Previously I was confused that `keep` and `copy` are separate keywords, but now it turns out that `keep copy` is a dedicated `keep` option.

[20:38](#msg5d6adacffda04e4c9d4e01e7)By definiton, `string!` is a series of `char!` \*values\*, and there's no such thing as `#""`. So, why `keep copy` "collects matched values as a single series" when no \*values* actually being matched?

toomasv

[20:41](#msg5d6adb7f5b9a174fdf12ef9f)It matches "" `(of same type as input)`.

[20:47](#msg5d6adcdd29dba2421cdee814)All `keep` variants match values of course, but of different types, i.e. strings or chars \*in this case\*. `keep` matches `char!` if one or `string!` if several. `keep pick` matches always chars, and `keep copy` matches always strings.

9214

[21:09](#msg5d6ae1ff5b9a174fdf131a88)`keep` doesn't match, it collects values from already matched input, but can do it in a variety of ways: either one-by-one in a block or together in a series of respective datatype. Anyway, since `#""` doesn't exists, it might make sense for `keep` and `keep pick` to ignore first match but `keep copy` to yield an empty string. And `keep copy` indeed preserves "`copy` always return a series" invariant (which it isn't, by the way).

```
>> parse [][copy match skip] :match
>>
```

Don't see any point in continuing this debate. My main concern was about `collect` / `keep` idiosyncrasies and a need for their further improvement (as indicated by my comment in https://github.com/red/REP/issues/8 and elsewhere). Setting a dummy word to matched input just to keep empty string is a hacky solution.

greggirwin

[21:14](#msg5d6ae339fda04e4c9d4e35db)A key point, to me, is that if we have this kind of debate, the design may be confusing.

9214

[21:23](#msg5d6ae56cb4d8294074ab9c71)Ah, scratch that, my example above is incorrect, because `skip` fails.

```
>> parse [][copy match none] :match
== []
```

So yeah, `keep copy` follows `copy` semantics faithfully, but `keep` keeping empty strings is IMO questionable. `keep only` or something like that would be OK.

GiuseppeChillemi

[21:26](#msg5d6ae60138499c13a67a8fef)@9214  
&gt;&gt; OTOH, I got bitten by keep returning char! instead of string! myself, and agree that it can be more consistent and return string! in either case. Also see red/REP#8

Also I don't like type coercing in this situation:

```
>> a: "hello"
== "hello"
>> probe first a
#"h"
== #"h"
>> probe type? first a
char!
== char!
>>
```

greggirwin

[21:27](#msg5d6ae62b0d4b1f5d8891cc32)What coercing are you talking about @GiuseppeChillemi ?

9214

[21:27](#msg5d6ae6327b263a4c9c8b704f)@greggirwin `collect` is already confusing enough as it is now, and there are a couple of REP tickets pending in this regard. I see no harm in discussing this and coming to at least some form of consensus.

greggirwin

[21:27](#msg5d6ae643418f705d876e1ac3)@9214 agreed. Hashing things out here is good.

9214

[21:28](#msg5d6ae6698b7327421dcde4b0)As long as they are wiki-ed.

GiuseppeChillemi

[21:28](#msg5d6ae66a38499c13a67a9267)@greggirwin `first "hello"` shouldn't be a string ?

9214

[21:28](#msg5d6ae6945c4d6813a53abfda)Why should it be a string and what it has to do with Parse?

greggirwin

[21:28](#msg5d6ae69b8b7327421dcde5c5)No, it should not @GiuseppeChillemi. `first` returns the first value in a series. A string is a series of `char!` values.

[21:29](#msg5d6ae6ae5c4d6813a53ac058)Just a bit of group overlap @9214 .

GiuseppeChillemi

[21:32](#msg5d6ae78a7b263a4c9c8b7853)@greggirwin The first time I used this code I expected to have a string. I has been a natural expectation. No discussion about the inner reasons of this. I just report what I expected and I suppose it is the same reason why Vladimir expected it.

[21:35](#msg5d6ae83b8066a340732948e1)Just let's wait and see if other people will come on gitter or other discussion places reporting on this topic. If it will happend we have a common behaviour and the cause should be investigated or the documentation should clearly warn the user about this.

greggirwin

[21:36](#msg5d6ae8617b263a4c9c8b7d5f)Completely different scenarios though.

When you do something for the first time, and get an unexpected result, the thing to do is understand why you got the result you did. Red is doing exactly what it says, and which has worked that way since the dawn of Rebol. It's not going to change.

[21:37](#msg5d6ae89e38499c13a67aa298)Not only would it break a million things, but the design is correct as it is.

GiuseppeChillemi

[21:41](#msg5d6ae9740d4b1f5d8891e610)@greggirwin Greg, design should not changed but \*"the documentation should clearly warn the user about this"* as I suppose it is an hole where most people will fall.

[21:57](#msg5d6aed33d3fda15e7442bcf6)And yes, people should understand before asking for a deep change. Building the architecture of a language is not easy.  
I have told you before that those "holes" trigger me the same \*"the thing to do is understand why you got the result you did"* approach about why all newcomers fall in similar holes. I have some answers and I am building the "big picture" but its not easy as visual decoding of symbols and languages from our neurons is still new science. Also I don't think that this branch of science has been included in all university courses of computer sciences bit it will be more relevant as AI and machine/brain interfaces will evolve.

9214

[21:58](#msg5d6aed8c7b263a4c9c8ba056)&gt; I just report what I expected and I suppose it is the same reason why Vladimir expected it.

That's a false implication. My original message was related to `keep` behaving differently depending on number of matched elements.

```
>> parse "ab" [collect keep 1 skip]
== [#"a"]
>> parse "ab" [collect keep 2 skip]
== ["ab"]
```

&gt; the documentation should clearly warn the user about this

Documentation shouldn't try to counter godzillion of false assumptions and expectations that people may have. The fact that `string!` is a series of `char!` values is explicitly mentioned both in \[Red](https://doc.red-lang.org/en/datatypes/string.html) and \[Rebol](http://www.rebol.com/docs/core23/rebolcore-6.html) documentation. Mechanics of series itself is consistent and uniform across the whole language: if you ask for the `first` element of a series, you get the first element (or `none`, if there's none).

&gt; it is an hole where most people will fall

Please don't speak for others when all you have is your own experience. So far, the only person who keeps claiming that such "holes" (which are, in fact, an applied common sense stemming from 20+ years of Rebol design) are unexpected and should be documented is you.

[21:59](#msg5d6aedd6b4d8294074abcfc0)@GiuseppeChillemi at this point you're derailing the room's topic. Case closed to me.

GiuseppeChillemi

[22:22](#msg5d6af31d29dba2421cdf8354)@9214 I suppose you have no knowledge on the topics I have introduced. So while I respect your deep knowledge on RED an computer science, please do the same on my knowledge on psychology, perception and knowledge building.  
REBOL design has been been influenced from neuroscience studies made from CARL. While the whole "vision" of Carl is still advanced in our times some aspects are limited from 1990 knowledge. Now we are in 2020 and some things should be refined under the light of advancements this area.  
The fact you can't see what I see doesn't implies that what I see does not exists. It could simply mean you have not sufficient knowledge about this topic. If you wish to continue this exchange and learn something in a productive feel free to choose the proper room, otherwhise we can stop here.

9214

[22:28](#msg5d6af4a8b596011df4de0747)Ad hominem and straw man. Nice try.

## Sunday 1st September, 2019

toomasv

[06:21](#msg5d6b63582efeca1df52f1451)Stumbled on a little funny Flying Dutchman:

```
>> res: parse @-+-a+-bc+ [collect some [thru "-" keep copy _ to "+" "+"]]
== [ a bc]
>> length? res
== 3
>> _?: first res
== 
>> type? _?
== email!
>> length? _?
== 0
```

This is of course same as in:

```
_?: next @
```

greggirwin

[18:29](#msg5d6c0df15c4d6813a5426607)In R2 you could create hidden data in issues.

```
>> i: to issue! "a b c"
== #a
>> mold i
== "#a"
>> length? i
== 5
>> last i
== #"c"
```

[18:29](#msg5d6c0e162efeca1df53391ac)With your discovery, it's now clear we can build a better BrainF\*\** lang dialect. :^)

## Sunday 8th September, 2019

ericguedespinto

[01:36](#msg5d745b36be4a3f13fd082845)Hello everybody!  
I am trying to convert some EBNF rules to parse rules but I stumbled into a problem with escaped unicode identifier and pattern syntax (ID\_START and ID\_CONTINUE).  
Is there any way to put this into a rule other then passing a few thousand codepoints ? like set notation.

greggirwin

[02:55](#msg5d746d9bae44a841249cc8af)@ericguedespinto , `charset`, `not`, and `union` are your friends here.

```
>> dig=: charset [#"0" - #"9"]
== make bitset! #{000000000000FFC0}
>> alnum=: make bitset! [#"0" - #"9" #"a" - #"z"]
== make bitset! #{000000000000FFC0000000007FFFFFE0}
>> non-dig=: charset [not #"0" - #"9"]
== make bitset! [not #{000000000000FFC0}]
>> hex=: union dig= charset "ABCDEFabcdef"
== make bitset! #{000000000000FFC07E0000007E}
```

See also:  
\- https://www.red-lang.org/2013/11/041-introducing-parse.html  
\- https://doc.red-lang.org/en/datatypes/char.html  
\- https://doc.red-lang.org/en/datatypes/bitset.html

[02:57](#msg5d746e1ec59390272030df7a)And we've started a \[parse cookbook](https://github.com/red/red/wiki/Parse-Cookbook) page where you can add notes that may help others.

toomasv

[06:00](#msg5d74991ab3e2fc579372ae62)@ericguedespinto I also started with \[EBNF parsing rules](https://github.com/toomasv/grammars/blob/master/ebnf.rule). So far it's strightforward translation of \[iso-14977](https://www.cl.cam.ac.uk/~mgk25/iso-14977.pdf) but I have not tried it out much. Just parsed EBNF grammar itself. E.g.:

```
do %ebnf.rule
ebnf: read %ebnf.ebnf
parse ebnf remove-gaps
parse ebnf remove-comments
parse ebnf syntax
;== true
```

ericguedespinto

[09:52](#msg5d74cf646e889c4bbdbcac63)Thank you all

## Tuesday 8th October, 2019

rebolek

[13:28](#msg5d9c8f059735874673197734)I would expect `b` instead of `a:`

```
>> parse [a a: b][quote a: set value skip to end]
== true
>> value
== a:
```

9214

[13:29](#msg5d9c8f50874aeb2d230d7b9a)@rebolek `quote a:` matches `a`, `set value skip` matched `a:`, `to end` matches `b`.

rebolek

[13:30](#msg5d9c8f8f49c7720aaf88907b)@9214 the parse rule is bit wrong, but anyway, I used `quote a:` to match `a:`, not `a`.

pekr

[13:31](#msg5d9c8fc40459254672160304)Never used `quote` myself, but why it matches `a`if a colon is used? (`quote a:`)

rebolek

[13:32](#msg5d9c8fe10e67130aae37178e)@pekr exactly

pekr

[13:32](#msg5d9c8fe737073b36a090faa2)With just a brief sight, it should fail on the first rule

[13:32](#msg5d9c8ff549c7720aaf8893a4)there should be `skip`imo

rebolek

[13:33](#msg5d9c9010464b432fc1df816a)Right, I've simplified actual rule and haven't tested it before posting, but matching `a` instead of `a:` is the point.

pekr

[13:33](#msg5d9c901d3220922ffb4dcc59)Eh, I don't understand the rest, so most probalby I should stay silent :-)

rebolek

[13:34](#msg5d9c906904592546721606d5)Ok, fixed the rule. I expect this to show `b`:

```
>> value: none parse [c a a: b][some [quote a: set value skip | skip]] value
== a:
```

But instead I have to do this:

```
>> value: none parse [c a a: b][some [ahead set-word! quote a: set value skip | skip]] value
== b
```

Why?

pekr

[13:36](#msg5d9c90d43220922ffb4dd165)I don't know, how `set`works. Never used a block parsing. Does it set the value at certain (matched) position? Then it should imo return `b`, as you suggest

rebolek

[13:37](#msg5d9c9114fcf7602cc5527347)The thing is that `quote a:` matches `a`. `set` is basically like `copy` for one value.

9214

[13:39](#msg5d9c919c5173c33ca18d3a12)@rebolek https://github.com/red/red/issues/3554 ?

[13:40](#msg5d9c91c592920c36a132904d)@pekr because that's what `quote` does - matches value that follows it literally. Except that in this case its a lax `any-word!` match.

rebolek

[13:40](#msg5d9c91d592920c36a132907d)@9214 thanks, I guess it's related.

9214

[13:43](#msg5d9c9279464b432fc1df95d0)

```
text
>> parse [a:][quote a]
== true
>> parse/case [a:][quote a]
== false
>> parse/case [a:][quote a:]
== true
```

[13:43](#msg5d9c929c9735874673198f71)So it's actually https://github.com/red/red/issues/3029, mentioned in the ticket above. They all look related to one single regression.

giesse

[18:45](#msg5d9cd93db385bf2cc6982e5e)perhaps related to this as well? https://github.com/giesse/red-topaz-parse/blob/master/targets/parse.red#L72

## Wednesday 9th October, 2019

rebolek

[06:39](#msg5d9d808f3220922ffb5495fe)Certainly. There's probably some implicit conversion of `any-word!` values to `word!` that messes this up.

## Monday 21st October, 2019

rebolek

[13:24](#msg5dadb17ce1c5e91508aa98e0)`word!` parsing:

```
>> parse [a][a]
*** Script Error: PARSE - invalid rule or usage of rule: a
*** Where: parse
*** Stack:  

>> parse [a]['a]
== true
```

`path!` parsing:

```
>> parse [a/b][a/b]
== true
>> parse [a/b]['a/b]
== false
```

I'm not sure about the first example in `path!` parsing, but shouldn't the second return `true!`?

endo64

[13:32](#msg5dadb361e886fb5aa2cc5346)

```
>> b: ['a a a/b 'a/b]
== ['a a a/b 'a/b]

>> b/1 = b/2
== true
>> b/3 = b/4
== false
```

rebolek

[13:32](#msg5dadb383a3f0b178496128dc)ok, but that's not `parse`

endo64

[13:39](#msg5dadb51e3d669b28a0ada718)In `parse` words (word! and lit-word!) are substituted by their values, but not paths. Otherwise `a: 1 parse [a/b][a/b]` would return an error and we would need to write `parse [a][quote a]` every time, so I think it is a reasonable design choice.

giesse

[19:10](#msg5dae0288f26ea4729dce0b03)@rebolek that's exactly what I posted above :P

[19:11](#msg5dae02f92a6494729c14de50)@endo64 IMHO it's a bug. `[a]` will match with the value of `a` (usually a sub-rule, but could be anything), while `['a]` will match the word `a` (equivalent to `[quote a]`); in the same way, `[a/b]` should match with the value of `a/b`, while `['a/b]` should match with the path `a/b`.

[19:13](#msg5dae036fe469ef43583cd169)Note that the current behavior is incompatible with R2:

```
REBOL/Core 2.7.6.4.2 (14-Mar-2008)
...
>> parse [a/b] [a/b] 
** Script Error: a has no value
** Near: parse [a/b] [a/b]
>> parse [a/b] ['a/b]
== true
```

and, very possibly incompatible with future versions of Red (ie. the code we are writing today, such as the one I posted a while ago above, will break at some point).

rebolek

[19:33](#msg5dae08107477946bada5ee04)@giesse as always, you're a few steps ahead :smile: And I agree with you wrote, I also expect more R2-like behavior (`lit-path!`rule for matching `path!`).

endo64

[20:05](#msg5dae0fa514d55a37854efdf3)@giesse @rebolek If `parse [a/b] [a/b]`fails (and resolves the value of `a/b`) then I agree that `parse [a/b] ['a/b]` should behave like `parse [a] ['a]`.  
Do we have a issue on GitHub for this? Or should be discuss it on /bugs room?

greggirwin

[23:21](#msg5dae3d8b3d669b28a0b1a4ad)It sounds like we all agree on this, so unless somebody else jumps in with a different view, let's open a ticket for it.

## Tuesday 22nd October, 2019

giesse

[19:01](#msg5daf521b10bd4128a1419253)https://github.com/red/red/issues/4101

greggirwin

[19:37](#msg5daf5a602a6494729c1ed0c5)Thanks @giesse.

## Sunday 3th November, 2019

cloutiy

[14:17](#msg5dbee15de1c5e9150826f8e0)Not sure if this room is the right place for this question, but is there such a thing as a C-&gt;Red or C-&gt;Red/System translator? Something that parses C and generates equivalent Red or Red/S code?

9214

[15:17](#msg5dbeef98a3f0b17849ddb977)&gt; C-&gt;Red

No, because this doesn't make any earthly sense.

&gt; C-&gt;Red/System

Only unfinished experiments (\[1](https://github.com/rebolek/parse-c-header), \[2](https://github.com/iceflow19/c2reds), \[3](https://github.com/Pebaz/RGB)).

cloutiy

[17:12](#msg5dbf0a7aa3f0b17849de68b4)@9214 ok thanks for your response

## Monday 4th November, 2019

rebolek

[09:07](#msg5dbfea6ca03ae1584f654332)@9214 Thanks for mentioning `parse-c-header`. It's unfinished because C headers are just C in disguise. For Rebol , I did Reb-C, translator for subset of Rebol to C.  
So the point is - Rebol/System to C is not that hard. It jut takes one dedicated person and some time. But it's doable.

pekr

[11:06](#msg5dc006452f8a034357332dfe)I don't know, what is Red/Pro goimg to be about, but as it is supposed to bring us some 64 bit functionality, I would expect either direct target or C emitters, so maybe itis worth a wait here?

[11:07](#msg5dc0065b14d55a3785d14103)Well, not that any effort would be bad of course ....

rebolek

[12:08](#msg5dc014d9ef84ab3786f3ff50)Red/Pro is certainly worth it, but I don't want to discourage anyone from creating alternatives. Generic C emitter would be useful (with minimal changes) for creating e.g. JS code. OTOH it seems easy but the devil is always in the details.

pekr

[12:35](#msg5dc01b189825bd6bac25270b)What I remember from the former Rebol past, was that someone tried to create a wrapper to C headers automatically. Not sure it was FFI or what it was. Something like that might be handy for R/S wrappers. But we are in a wrong group here anyway ...

rebolek

[12:39](#msg5dc01bf82a6494729c97164b)Parsing C headers requires full C parser. Anyway, we're still talking parsers, so I believe we're in right group ;)

greggirwin

[19:46](#msg5dc080159825bd6bac28334b)I did a library dialect for R2, to making wrapping APIs easier. Also some code generators to map C %.h stuff. Many things, like constants, are simply grunt work and easy to port this way.

Red/Pro will not emit C. LLVM is the likely target.

## Thursday 7th November, 2019

GiuseppeChillemi

[12:19](#msg5dc40bbfa03ae1584f833996)@greggirwin While searching for REBOL documentation I have found the page of an old REBOL developer which is specialized in LLVM. Just FYI: http://www.complang.tuwien.ac.at/vpavlu/

greggirwin

[19:44](#msg5dc4741d9c39821509fef60d)I only met Viktor once, in 2005. Very nice guy. No idea where he is these days.

pekr

[20:02](#msg5dc4784e7477946bad47bfed)Those Austrian guys got somehow lost :-) Ditto for very talented Andreas Bolka (aka Earl) - very talented reboller ....

GiuseppeChillemi

[20:59](#msg5dc485c87477946bad4824d9)If someone could make a list of all the people which have been in REBOL galaxy it would be good for getting back in contact with them. I remember Paolo Romano Tenca from Italy.

## Monday 11st November, 2019

Oldes

[12:00](#msg5dc94d6968ad1c4a0fa7da1d)Unfortunately I think that Andreas must be dead as there is no activity on his Github since year 2016

pekr

[12:08](#msg5dc94f3852b73c7cb2fa86e8)Or he just disappeared silently in the same way, BrianH did.

Oldes

[12:32](#msg5dc954fb4adf071a840d4c3f)But BrianH is still somehow active https://github.com/thoughtbot/appraisal/pull/160 in Ruby community. Also on the mini Redcon in Brno years ago Earl was showing us his unreleased Rebol cross compiled to run in browser. He would not just disappear.

[12:40](#msg5dc956a55a979223c3b2623e)I wonder if Brian was paid by Carl, because he was very active in R3 development and disappeared from Rebol together with Carl.

pekr

[13:16](#msg5dc95f316ba2347d2d743451)The prominent member of Rebol community left for Ruby, how sad. In the past, he told me, that he was once asked by Ruby to create something like View for that.

greggirwin

[17:40](#msg5dc99cfbfd6fe41fc067396e)Moved community topic to :point\_left: \[red/chit-chat](https://gitter.im/red/chit-chat?at=5dc99cd04adf071a840f652b)

Respectech

[18:08](#msg5dc9a3a452b73c7cb2fd0f4c)Here's something I'm missing in 'parse: Event loops. When I write a dialect, a lot of times I want something to happen over time or on a schedule when a certain condition is met in the dialect, or based on some outside input. VID would allow me to handle these conditions within the dialect, but I can't figure out how to easily do the same thing in 'parse rules and that limits my usage of 'parse.

greggirwin

[18:25](#msg5dc9a789add5717a88ecbb14)Can you give an example @Respectech? VID itself doesn't give you this feature, just a way to define timers. You can do the same with `parse`. In fact, @dockimbel wrote a scheduling dialect just for that, which I hacked on quite a bit for production use.

[18:25](#msg5dc9a7b46ba2347d2d766ce6)The original is \[here](https://www.softinnov.org/rebol/scheduler.shtml).

Respectech

[18:52](#msg5dc9ae0068ad1c4a0faac5ea)Something like this:

```
gpio [
		hardware odroid-c2 ;defines ids and features of pins for target hw
		
		legs: [5 4 7 6]
		
		servo-vals: read legs
		pin legs pwm rate 60 on-timer [
			write legs (gyro-correct/x)
		]
	]
	do-parse-events
```

greggirwin

[18:57](#msg5dc9aefd35889012b1edd9e1)I don't see any problem there. We just don't have a non-View event loop yet, so you'd have to loop and check against timer intervals.

Respectech

[18:58](#msg5dc9af5cc26e8923c4081578)Yeah, it's the event loop that I'm missing.

giesse

[19:07](#msg5dc9b1584adf071a840ff8f2)@Respectech that's what ports are for :)

## Wednesday 13th November, 2019

bubnenkoff

[12:26](#msg5dcbf66768ad1c4a0fbb4bc9)How to translate this from Rebol to Red?

```
probe parse "The trip will take 21 days" none
```

hiiamboris

[12:40](#msg5dcbf9b692a84f79fe5c7fe3)`split "The trip will take 21 days" sp`

bubnenkoff

[13:17](#msg5dcc025492a84f79fe5cc196)@hiiamboris is it possible to do with `parse`?

[13:17](#msg5dcc0262091dd14a0eb1ab89)I am learning red by rebol docs

hiiamboris

[13:33](#msg5dcc0643fd6fe41fc078ba1b)Sure, if you like parse ☻:  
`parse "The trip will take 21 days" [collect any [sp | keep to [sp | end]]]`

rebolek

[13:48](#msg5dcc09aae75b2d5a19c5dbcb):)

bubnenkoff

[13:48](#msg5dcc09c668ad1c4a0fbbdcae)Thanks! Am I right understand that we iteration by words that have spaces? for example how to extract img name from here?

```
a: "<img src='test.png'>"
parse a [to "="]
```

[13:57](#msg5dcc0bca52b73c7cb20e7491)

```
>> parse "He is a good man" [collect any [sp | keep to sp | end] ]
== ["He" "is" #"a" "good"]
```

Why I am getting # in output?

rebolek

[13:59](#msg5dcc0c47eeb63e1a83a71398)It collects one letter as `char!`, not as `string!`. Also, it misses last word:

```
>> parse "He is a good man" [collect any [sp | keep to [sp | end]]]
== ["He" "is" #"a" "good" "man"]
```

[14:00](#msg5dcc0c77eeb63e1a83a715a9)And to convert `char!` to `string!`:

```
>> parse "He is a good man" [collect any [sp | copy value to [sp | end] keep (form value)]]
== ["He" "is" "a" "good" "man"]
```

bubnenkoff

[14:09](#msg5dcc0e85c26e8923c41990bd)Why

```
parse "aaa bbb" [collect any sp]
== []
```

rebolek

[14:09](#msg5dcc0eb56ba2347d2d87c224)@bubnenkoff `collect` starts collection, but needs `keep` to do actual collection of elements.

[14:10](#msg5dcc0edc5eb2e813db18e1d4)`any sp` will match any space. You have more than just spaces in your input.

[14:11](#msg5dcc0f16091dd14a0eb21156)

```
>> parse "aaa bbb" [collect [keep to sp skip keep to end]]
== ["aaa" "bbb"]
```

[14:13](#msg5dcc0f9635889012b1ff271d)To better illustrate, what `any space` matches:

```
>> parse "" [any space]
== true
>> parse "               " [any space]
== true
```

bubnenkoff

[14:14](#msg5dcc0fbeca778c1fbff68ee5)

```
>> parse "" [any space]
== true
```

Why true?

rebolek

[14:15](#msg5dcc100bc26e8923c4199c1d)Because `any`matches zero or more occurrences. If you want to match at least one space, you need to use `some`.

```
>> parse "" [some space]
== false
>> parse " " [some space]
== true
```

[14:16](#msg5dcc1040e75b2d5a19c614e5)Also, you can limit by count:

```
>> parse " " [1 3 space]
== true
>> parse "    " [1 3 space]
== false
```

[14:16](#msg5dcc10526ba2347d2d87ce25)Here it matches one to three spaces. Not less, not more.

hiiamboris

[14:17](#msg5dcc10976ba2347d2d87d11b):point\_up: \[November 13, 2019 4:57 PM](https://gitter.im/red/parse?at=5dcc0bca52b73c7cb20e7491)

Okay, hotfix: `parse "He is a good man" [collect any [sp | keep copy _ to [sp | end]]]` ☻

bubnenkoff

[14:19](#msg5dcc10e45eb2e813db18f14b)`sp` is alias to `space`?

dockimbel

[14:19](#msg5dcc110aea7d147cb370bbee)@bubnenkoff

```
>> parse "He is a good man" [collect any [sp | keep copy tmp to [sp | end]] ]
== ["He" "is" "a" "good" "man"]
```

Using a `copy` command you can force a `series!` as collected value.

```
>> series!
== make typeset! [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! ha...
```

hiiamboris

[14:21](#msg5dcc1155ca778c1fbff699de)@bubnenkoff Do you know you can use `?` in console?

```
>> ? sp
SP is a char! value: #" "
```

And there's a summary of Red parse here: https://www.red-lang.org/2013/11/041-introducing-parse.html

bubnenkoff

[14:21](#msg5dcc116ce75b2d5a19c61e60)thanks for tip!

[14:22](#msg5dcc11af50010612b2af7cfe)But I do not see that there some mention in `?` that `sp` is same that `space`

hiiamboris

[14:25](#msg5dcc123fca778c1fbff6a1fb)

```
>> ? space
SPACE is a char! value: #" "
```

bubnenkoff

[14:32](#msg5dcc13e5c26e8923c419b87e)So Red have different words with similar mining?

[14:32](#msg5dcc140a50010612b2af8f9b)

```
>> parse "aaa bbb" [collect [keep any sp]]
== []
```

I expect to get at last somthing in result

rebolek

[14:33](#msg5dcc1447ea7d147cb370d7d6)You can't have anything, because your string starts with `a`, not with space.

[14:35](#msg5dcc1499091dd14a0eb23cbf)So your `space` rule does not match it and `parse` ends

[14:35](#msg5dcc14be50010612b2af95d6)To continue with parsing, every rule must pass.

## Thursday 14th November, 2019

bubnenkoff

[06:48](#msg5dccf8bec26e8923c42057f2)

```
>> parse "aaa bbb ccc ddd" [1 skip]
== false
```

Why false?

[06:50](#msg5dccf94efd6fe41fc07fb543)

```
>> parse "aaa bbb ccc ddd" [1 skip]
== false
>> parse ["aaa bbb ccc ddd"] [1 skip]
== true
```

What `[]` mean in read?

toomasv

[06:57](#msg5dccfad850010612b2b61a27)@bubnenkoff In string parsing, elements are chars. You skip just one, then stop (`1` not needed). In block parsing you skip the string and are in the end of input.

bubnenkoff

[07:02](#msg5dccfc136ba2347d2d8e8426)And what if I for example want to drop first two letters from string:  
`parse "aaa bbb ccc ddd" [collect [2 skip]]` is wrong  
`a bbb ccc ddd` is what I expected

toomasv

[07:41](#msg5dcd051b35889012b1062e1a)`collect` is meaningful together with `keep` only:

```
>> first parse "aaa bbb ccc ddd" [collect [2 skip keep to end]]
== "a bbb ccc ddd"
```

But if that's all you want, it's easier to use just `skip`:

```
>> skip "aaa bbb ccc ddd" 2
== "a bbb ccc ddd"
```

hiiamboris

[11:15](#msg5dcd37406ba2347d2d901e80)@bubnenkoff you should really at least skim through http://www.rebol.com/docs/core23/rebolcore.html to understand the very basics of the language, instead of just doing random stuff with it. Will save you a lot of time in the end

bubnenkoff

[11:39](#msg5dcd3d074adf071a8429ed20)Red is hanging on next code: `parse "He is a good man" [collect any [ keep to sp ] ]`

toomasv

[14:04](#msg5dcd5f005eb2e813db2283e4)@bubnenkoff Now think why it might do that:  
1\) It keeps string to first space  
2\) Now it is positioned before the first space  
3\) It searches for space  
4\) It finds the space just before its nose  
5\) It is at state (2) Gosh, I was here already! ...  
:point\_up: \[November 13, 2019 4:19 PM](https://gitter.im/red/parse?at=5dcc110aea7d147cb370bbee)

PS. On Windows it doesn't hang but stops.

[14:14](#msg5dcd6145eeb63e1a83b0eceb)Try `thru` instead of `to`. What happens? Why?

hiiamboris

[14:38](#msg5dcd66ca35889012b108fb56)It's probably the stable 0.6.4 build that hangs ;)

greggirwin

[17:23](#msg5dcd8dad091dd14a0ebcf3e9)@bubnenkoff as @hiiamboris suggests, take some time to read and use some basic tools for learning. For example, in `parse` you can use `set-word!` values to mark a position in the input, and you can use `paren!` values as actions. With these two simple tools you can set markers and print them out in the console, to see where parsing stopped, how rules like `some` or `any` move through an input, and more.

## Friday 15th November, 2019

bubnenkoff

[06:58](#msg5dce4ca7add5717a880f21dc)@greggirwin thanks! But could you give link with `set-word!` examples? I am about "`set-word!` values to mark a position in the input, and you can use `paren!` values as actions. With these two simple tools you can set markers and print them out in the console"

toomasv

[07:18](#msg5dce513ae75b2d5a19d6a797)Here is a simple one:

```
>> parse load "first second third" [some [s: skip (print s/1)]]
first
second
third
== true
```

bubnenkoff

[08:24](#msg5dce60a8fd6fe41fc089ee58)Why `s/1` and not simply `s`?

toomasv

[08:37](#msg5dce63c75eb2e813db2a0985)Because `s` refers to the whole input series at certain index, `s/1` picks first element at this index.

[08:40](#msg5dce6484add5717a880fdff9)You can of course `(print form s)` or `(probe s)` too. Try. See?

pekr

[08:43](#msg5dce65416ba2347d2d98d74e)I am just on y cell phone, but I use marking to copy some portion of the input, mark start:, then end: and in parens (copy/part result start end)

[08:45](#msg5dce65a7eeb63e1a83b83e7e)We shoul also mention :get-word to set new position

toomasv

[08:48](#msg5dce666935889012b110418e)Yes, like marking (simplistic) start and end of parens here:

```
parse "first (second third) fourth" [
   some ["(" s: | ")" e: (print copy/part s back e) | skip]
]
;second third
```

[09:39](#msg5dce724e50010612b2c0c5f9)And, while playing with it, here is example of using get-word! to move back in series:

```
n: 0 
parse str: copy matrjonushka: "[beware (matrjonushka) here]" [
   some [
     "(" s: 
   | ")" e: if (5 > n: n + 1)(
         change/part back s matrjonushka e
      ) :s 
   | skip]
] str
== {[beware [beware [beware [beware [beware (matrjonushka) here] here] here] here] here]}
```

greggirwin

[09:39](#msg5dce725092a84f79fe6e9704)@pekr I left out `get-word!` because it's more advanced, and @bubnenkoff is just starting out.

[09:39](#msg5dce726650010612b2c0c654)Now there's an example though! :^)

[09:40](#msg5dce729592a84f79fe6e9a26)@bubnenkoff you also want to watch out for rules that can lead to infinite loops, because some don't advance the input. Start small and you'll get there.

bubnenkoff

[13:41](#msg5dceaaf1add5717a8811e3e5)Thanks! Continue learning. New question, why collecting only second h1 tag?

```
page: {
<html> 
    <title> My Great Page</title>
    <h1>Big Heading A</h1>
        <p>Stuff in A</p>
    <h1>Big Heading B</h1>
        <p>Stuff in B</p>
</html>
    }

parse page [ collect any [thru <h1> | keep to "<" ]]
== ["Big Heading B"]
```

hiiamboris

[13:49](#msg5dceacf792a84f79fe704f9c)extra `|`

toomasv

[14:02](#msg5dceafeeeeb63e1a83ba70ab)Adding to @hiiamboris' minimalistic explanation:  
1\) `thru`

# succeeds and brings you just behind **2) as last round succeeded `any` starts next round from new position** **3) first subrule is `thru`**, let's try this**** ****4) goto (1); you are just behind second**** ******5) do (2-3)****** ******6) as there are no more **s, first subrule fails******** ********7) try next subrule, which is `keep to "<"`, success******** ********8) new round, failure on first subrule, let's try next******** ********9) infinite loop starts on second subrule as you are not advancing anymore******** ********10) stop and return collected values********

greggirwin

[17:29](#msg5dcee07ffd6fe41fc08dacdf)@toomasv these kinds of explanations are great. When we work on a `parse` IDE we can show matches and backtracking (even now, thanks to parse/trace). Figuring out how to visualize things such that they are as clear as this kind of explanation will be a fun challenge.

toomasv

[17:55](#msg5dcee6a4ca778c1fbf0baa5c)Yup, I thought a lot how to visualise it. Still not buried the thought.

[18:14](#msg5dceeb08ca778c1fbf0bcaad)Actually, I'm not sure it is correct to say in (9) that "infinite loop starts". Rather, it stops because input does not advance.

GiuseppeChillemi

[22:26](#msg5dcf262d6ba2347d2d9e85e5)@toomasv I have a couple of ideas too. I hope they will be complete in the future

[22:49](#msg5dcf2b906ba2347d2d9ea761)Is this correct ?

```
>> parse [a 1 b 2 c 3 d 4 e 5] [collect [keep any [keep word! | number! ]]]
== [a b c d e [a 1 b 2 c 3 d 4 e 5]]
```

I didn't expect another block inside the output block but duplicated word matches.

[23:04](#msg5dcf2f0052b73c7cb2256ecc)Also, I don't understand the difference:

```
>> parse [a b c d e f] [to 'b collect [keep any word!]]
== [[b c d e f]]
>> parse [a b c d e f] [to 'b collect [ any keep word!]]
== [b c d e f]
>>
```

... and not expecting `any keep word!` working

## Saturday 16th November, 2019

toomasv

[05:51](#msg5dcf8e51add5717a88186b43)@GiuseppeChillemi First case:  
1\) `collect` initialises new collection-block  
2\) enter the block following `collect`  
3\) meet `keep`; now what shall we keep?  
4\) meet `any`; enter the block  
5\) any times you meet `word!`, keep it; skip `number!` (but both are successfully matched)  
6\) now first `keep` recieves and keeps matched input from `any`, i.e. all of it  
7\) done, return collection  
To get rid of block you can use `pick` after first `keep`.

GiuseppeChillemi

[05:57](#msg5dcf8fe34adf071a843ac014)@toomasv Why an inner block appears?

toomasv

[05:58](#msg5dcf901e92a84f79fe76c175)Because you keep the block matched by `any`. `pick` would pick elements of the block, but no block.

[06:05](#msg5dcf91c6c26e8923c4334a92)To realise your wish in first case ("duplicated word matches"):

```
>> rule: [any [keep word! | number!]] parse [a 1 b 2 c 3 d 4 e 5] [collect [s: rule :s rule]]
== [a b c d e a b c d e]
```

[06:11](#msg5dcf92fe091dd14a0ecb82a4)Second problem.

In first case you keep the block matched by `any` and you keep it as block.  
In second case you keep words separately inside the `any` loop. (As `keep word!` is a rule, and `any` operates on the following rule, there is no reason why it should not be working.)

You can keep words without the block in first case if you use `pick` with `keep`:

```
>> parse [a b c d e f] [to 'b collect [keep pick any word!]]
== [b c d e f]
```

GiuseppeChillemi

[09:12](#msg5dcfbd825eb2e813db33e5ad)@toomasv @9214 pick is a new addition to the. It is not present either in blog article introducing parse, or in any other page. Only red-by-example cites it without examples or full description.

[09:14](#msg5dcfbded091dd14a0ecca254)(I have not the knowledge needed to write about it, so one of you pro should do the job)

toomasv

[09:26](#msg5dcfc0b2fd6fe41fc093c5dd)@GiuseppeChillemi It is introduced in this \[blog article](https://www.red-lang.org/2017/03/062-libred-and-macros.html).

GiuseppeChillemi

[09:27](#msg5dcfc0f7ca778c1fbf11a7e5)@toomasv  
Here is the explanation for the first case:

&gt; 2) enter the block following collect  
&gt; 3) meet keep; now what shall we keep?  
&gt; 4) meet any; enter the block

The expression "enter the block" could be bound to multiple subjects in my mind. What you mean for "enter the block" ? -Who is "entering?" (adding?) and where - or -Who is "entering?" (going inside the parsed block?) -or- "Going inside the block" , (block created by collect) -or- "Going inside the block" , (rules block).

toomasv

[09:29](#msg5dcfc18bea7d147cb38bb418)Pick whatever makes sense for you.

GiuseppeChillemi

[09:37](#msg5dcfc36068ad1c4a0fd6dc5a)@toomasv none of the above, it's me following the rule step by step.

[09:41](#msg5dcfc43fea7d147cb38bc6cc)Also you solved my doubts with the \[blog article](https://www.red-lang.org/2017/03/062-libred-and-macros.html) as other than not knowing about `pick` I didn't know it returned values as a block inside a block if multiple have been returned from the rule

[09:45](#msg5dcfc54992a84f79fe783a1e)So 2 blocks are created from this code: the one by collect, the other one by `KEEP` which receives multiple values (or it is `any` management mechanism creating the block and passing it to `KEEP`)

toomasv

[10:20](#msg5dcfcd78ea7d147cb38c07ab)`keep` is a keyword which makes things happen in Red's belly, so that whatever is matched next will be appended to the collection, either as series (if series is matched or `copy` keyword (together with a word) is used after `keep`) or as single value (if single non-series value is matched w/o `copy`) or multiple single values (if series is matched but `pick` is used after `keep`). To see how it \*exactly* happens please look at \[parse.reds](https://github.com/red/red/blob/master/runtime/parse.reds).

GiuseppeChillemi

[11:59](#msg5dcfe4a8c26e8923c4358787)@toomasv Thaks, I'll `KEEP` \[parse.red](https://github.com/red/red/blob/master/runtime/parse.reds) for future reading as the topic is too advanced and also I do not learnt R/S.

## Monday 18th November, 2019

bubnenkoff

[11:39](#msg5dd282e7091dd14a0edfde74)I am trying to write small app that parse xml and display result in VID.

```
view [ button "open" [ if file: request-file [ do [ x: parse file/text [ collect any [thru "<purchaseObject>" keep to "</purchaseObject" ]] ] ] ] area 900x700 x ]
```

The problem that I can't understand how to display result. It run but do not print nothing. I think problem with last `x` that have parse result data

xqlab

[12:21](#msg5dd28cd652b73c7cb23c8c20)Just an example

```
view [ 
	button "open" [
		if file: request-file [ 
			a/text:   read file 
		] 
	] a: area 900x700 
]
```

You have to read the file before parsing the text. Give the area a name so you can access it's fields

toomasv

[12:35](#msg5dd2902b091dd14a0ee03c1b)Little addition:

```
a/text: mold parse read file [collect...]
```

bubnenkoff

[12:37](#msg5dd2908235889012b12dcf53)I want to display parsing result, not file content

[12:37](#msg5dd2909aea7d147cb39eede6)But let me few minutes to try, I understand idea

[12:40](#msg5dd29152091dd14a0ee04603)Is it's possible to do like:

```
view [ button "open" [ if file: request-file [  x: parse read file/text ....
```

toomasv

[12:42](#msg5dd291a0add5717a882dbfdd)After `file: request-file`, `file` is of type `file!`, i.e. it is filename. You have to `read` or `load` it.

bubnenkoff

[12:51](#msg5dd293bc5eb2e813db481416)I did some improves but still can't understand how to pass result of parsing to area:

```
view [ button "open" [ if file: read request-file [ x: parse file [ collect any [thru "<purchaseObject>" keep to "</purchaseObject" ]]  ] ] area 900x700 x ]
```

toomasv

[12:53](#msg5dd2944a091dd14a0ee05bed)Combine what @xqlab and I proposed above...

bubnenkoff

[12:54](#msg5dd29473eeb63e1a83d5d976)Why do I need `mold`?

toomasv

[12:55](#msg5dd294bbea7d147cb39f07d1)Because `collect` from `parse` returns a block, `mold` will turn it into string. You can try `form` too, if it suits you.

bubnenkoff

[12:56](#msg5dd29502ea7d147cb39f08f0)Wow! That's works!

```
view [ button "open" [ if file: request-file [ a/text: mold parse read file [ collect any [thru "<purchaseObject>" keep to "</purchaseObject" ]]  ] ] a: area 900x700  ]
```

toomasv

[12:56](#msg5dd295106ba2347d2db6bec1):+1:

[12:58](#msg5dd2959392a84f79fe8c1a2b)I don't see your result, but I guess you would want to use `a: area 900x700 wrap` if it is long enough.

bubnenkoff

[13:21](#msg5dd29ad5fd6fe41fc0a7acb3)Yeah! Thanks!

[13:22](#msg5dd29b23ea7d147cb39f2d9b)is it single approach to access to parsed result in `area`? Or there is another ways?

toomasv

[13:27](#msg5dd29c4a4adf071a84501867)You mean to set areas' text?

bubnenkoff

[13:29](#msg5dd29cabca778c1fbf25e9e8)yes

toomasv

[13:31](#msg5dd29d3f92a84f79fe8c584d)From within a view itself I don't see another way as simple as that. But there surely are more ways to set areas' text.

bubnenkoff

[13:34](#msg5dd29dda4adf071a84502261)Ok, please explain me what mean `a/text:` ? And why than we writing `a: area` to display text. `a:` is creating word. Why we need create word and set area to it?

toomasv

[13:41](#msg5dd29f85ca778c1fbf25fe2e)When interpreting the VID block with `a: area`, an `area` face is created with its facets (see \[doc](https://doc.red-lang.org/en/view.html#\_area)), and `a` is refering to this face. By using set-path `a/text:` you can set `text` facet of this area and with path `a/text`you are accessing that facet. If you want just to display the text and don't want to edit it, you can use `text` instead of `area`. E.g. `t: text 900x700 wrap`. Still, to set text you use `t/text:...` and to access it `t/text`. You need to set a word to the `area` (or any face/style) if you want to directly access it later. But there are ways to access it indirectly too.

## Tuesday 19th November, 2019

greggirwin

[01:36](#msg5dd3472aeeb63e1a83db19a1)@bubnenkoff you can think of Red's path notation (`a/text`) like dot notation (`a.text`) in other langs.

GiuseppeChillemi

[21:02](#msg5dd458745eb2e813db5588a0)@bubnenkoff Which languages do you know?

## Wednesday 20th November, 2019

bubnenkoff

[14:26](#msg5dd54d16bebeec417b985f9b)@GiuseppeChillemi I am from D/Python. I am learning read in my free time.

## Friday 22nd November, 2019

bubnenkoff

[11:29](#msg5dd7c69855bbed7ade24b477)What difference between:  
`action: ['buy | 'sell]` and `action: ["buy" | "sell"]`

rebolek

[11:30](#msg5dd7c6bb9d72cd02b3247711)@bubnenkoff first rule is for block parsing, second for string parsing.

[11:30](#msg5dd7c6f15b3db9548acf0577)There is difference between `[buy 1 kg of apples]` and `"buy 1 kg of apples"`.

xqlab

[11:41](#msg5dd7c951ac81632e65e2d220)the first block contains \*\*lit-word!\*\*s, the second \*\*string!\*\*s as alternative

## Monday 25th November, 2019

cloutiy

[00:43](#msg5ddb239799dfe74c95a0ce54)Could someone explain a bit more on how to chop part of a parse subject. For example I have a start marker and stop marker and want to remove everything in between:

```
parse file [
    any [
        to separator start:
        to heading stop:
        ( change/part start stop "" )
        :stop
    ]
]
```

I think the second arg for change/part needs to be a length, but not sure how to provide it. Trying stop - start says that - doesn accept string!

[01:51](#msg5ddb33895b3db9548ae693b7)Ok, seems I got it to work....remove is what I wanted, not change. This works.

```
parse file [
    any [
        to separator start: (n1: index? start)
        to heading stop: (n2: index? stop)
        (n: n2 - n1)
        (remove/part start n)
        :stop
    ]
]
```

toomasv

[04:30](#msg5ddb58f59860605489742caf)@cloutiy It is simpler:

```
parse file [any [to separator remove to heading]]
```

[04:43](#msg5ddb5bfd99dfe74c95a25d9a)Also, in your last example `stop:` records position when hitting `heading`, and when you continue from `:stop`, then `parse` continues from the `index?` of recorded `stop:` which generally is not where you want it to continue. You can check it if you insert `(probe stop)` just after `:stop`.

greggirwin

[04:46](#msg5ddb5c96f3ea522f266295e6)Modifying the input you're parsing can be tricky, so consider doing the reverse. Collect everything you want to keep, simply skipping over the parts you don't want.

toomasv

[10:21](#msg5ddbab25c52bc74c968a5135)@cloutiy This would have worked too:

```
parse file [any [
   to separator start: 
   to heading stop: 
   (remove/part start stop) 
   :start
]]
```

bubnenkoff

[14:29](#msg5ddbe567f3ea522f26667f0b)how to print alphabet? I am genarate it like: `z: charset [#"a" - #"z"]`

[14:30](#msg5ddbe57f1bf5192e66a112a7)

```
>> foreach d z [print d]
*** Script Error: foreach does not allow bitset! for its series argument
```

dockimbel

[14:43](#msg5ddbe8ab5b3db9548aebaff4)@bubnenkoff

```
>> z: charset [#"a" - #"z"]
== make bitset! #{0000000000000000000000007FFFFFE0}
```

A bitset is just an \_array of bits_ used to represent here characters presence/absence \_by convention\_. Bitsets don't contain any other information than those bits, so they can be used to represent something else if needed. So in order to print characters corresponding to those bits, you have to generate the characters first, then check which ones are part of that bitset, like this for example:

```
>> repeat c 256 [if find z c: c - 1 [prin to-char c]] prin lf
abcdefghijklmnopqrstuvwxyz
```

bubnenkoff

[15:03](#msg5ddbed319d72cd02b341808a)so `bits: make bitset! [#"a" - #"b"]` is 8bit for a plus 8 bit for b?

[15:13](#msg5ddbefb69d72cd02b341955c)and how to get size of bitset? `length?` show me strange digit

rebolek

[15:15](#msg5ddbf02689fce12f25c49ce3)no, it's one bit for \*\*a\*\*, one bit for \*\*b\*\*, etc

bubnenkoff

[15:16](#msg5ddbf0599860605489787764)one bit?!

[15:17](#msg5ddbf078d2c92c2275f41d0c)but it's need 8 bits for representation single letter

rebolek

[15:19](#msg5ddbf111afacdc4de471c6cd)no, in bitset each bit represents one letter

bubnenkoff

[15:21](#msg5ddbf16e9860605489787fe1)bit? Bit it's 0 and 1. How they can represent letter?

rebolek

[15:22](#msg5ddbf1c0afacdc4de471caf4)let's have a simple 10bit bitset: `0100000100`. Here I have bits 2 and 8 set, so it can match for example numbers 2 and 8, or letters \*\*b\** and \*\*h\*\*.

cloutiy

[17:13](#msg5ddc0bacac81632e6500da9d)@toomasv regarding :stop, point well taken, i agree. In my file i actually put a comment to myself to see whether that was required or not. Regarding your simpler approach...briliant! I like it. Thanks for pointing that out!

toomasv

[17:14](#msg5ddc0be7f3ea522f2667a6ec)@cloutiy You are welcome!

GiuseppeChillemi

[19:46](#msg5ddc2facac81632e6501f282)Pardon, does it mean that bit n.1 correspond to letter in position 1 in bit set definition, and this sequence is stored in an ordered list, and so on?

[22:32](#msg5ddc56995b3db9548aeef6cb)@rebolek I don't understand if you match the bits comparing to their hex value of the character or something else.

rebolek

[22:33](#msg5ddc56c989fce12f25c79b2d)

```
>> enbase/base to binary! charset #"1" 2
== {00000000000000000000000000000000000000000000000001000000}
>> enbase/base to binary! charset #"2" 2
== {00000000000000000000000000000000000000000000000000100000}
>> enbase/base to binary! charset #"3" 2
== {00000000000000000000000000000000000000000000000000010000}
>> enbase/base to binary! charset #"4" 2
== {00000000000000000000000000000000000000000000000000001000}
>> enbase/base to binary! charset #"5" 2
== {00000000000000000000000000000000000000000000000000000100}
(etc)
```

[22:34](#msg5ddc56e71bf5192e66a46b87)here you can see how the character is determined by the position

[22:36](#msg5ddc575899dfe74c95a98a74)if you wonder about the zeros in the beginning, it simply starts with ASCII charater 0:

```
>> enbase/base to binary! charset to char! 0 2
== "10000000"
>> enbase/base to binary! charset to char! 1 2
== "01000000"
>> enbase/base to binary! charset to char! 2 2
== "00100000"
>> enbase/base to binary! charset to char! 3 2
== "00010000"
(etc)
```

Bitset is optimized to take shortest possible length.

greggirwin

[23:17](#msg5ddc60f4d2c92c2275f76c79)Bitsets are a generic "bitmap" of single bit values. In the context of `parse` or charsets in general, those bits are flags to indicate whether a particular character is part of the bitset. But bitsets are a powerful and space efficient structure that can be used for other purposes.

## Tuesday 26th November, 2019

bubnenkoff

[07:21](#msg5ddcd27d55bbed7ade485115)But how to code: "AB" letters? And How "BA"?  
If for example А `000001` B `000010`

[07:57](#msg5ddcdaf205eec2433d829de2)When I should use parentheses and when not?

```
tag: ["<" alpahabet ">" skip thru "</" alpahabet ">"]
```

Why I can't simply write:

```
tag: "<" alpahabet ">" skip thru "</" alpahabet ">"
```

?

rebolek

[08:03](#msg5ddcdc49d64a052fb665f76a)@bubnenkoff  
&gt; But how to code: "AB" letters? And How "BA"?

You don't- Bitset matches both A and B, not depending on order.

[08:07](#msg5ddcdd2740f1940ca9d59421)

```
>> halo: charset "halo"
== make bitset! #{0000000000000000000000004089}
>> parse "halo" [4 halo]
== true
>> parse "ahol" [4 halo]
== true
>> parse "aaaa" [4 halo]
== true
```

bubnenkoff

[08:15](#msg5ddcdf3ec3d6795b9fd26031)ok! Understood! But what size of bitset? How can it grow?

[08:16](#msg5ddcdf75c3d6795b9fd260b5)What kind of information are usually coding by bitset?

[08:33](#msg5ddce344d64a052fb6662df5)And how to debug bitset? I need to know what range it include:  
`alphabet: union charset [#"a" - #"z"] charset [#"A" - #"Z"]`  
to be sure that all correct

Oldes

[08:59](#msg5ddce98005eec2433d830d0e)@bubnenkoff

```
>> alphabet: charset [#"a" - #"z" #"A" - #"Z"]
== make bitset! #{00000000000000007FFFFFE07FFFFFE0}
>> length? alphabet
== 128
>> append alphabet #"ř"
== make bitset! #{00000000000000007FFFFFE07FFFFFE000000000000000000000000000000000000000000000000000000040}
>> length? alphabet
== 352
>> repeat i length? alphabet [ if find alphabet i [print [i to-char i]] ]
65 A
66 B
...
345 ř
```

bubnenkoff

[09:46](#msg5ddcf4856a85195b9eaa1e9f)Thanks! Is there any difference between `to char!` and `to-char`? Or it's shurtcut?

[10:16](#msg5ddcfb6932df1245cb9338e5)I can't understand how to work `break`. "break out of a matching loop, returning success."

```
a: "<app><div>Hello</div></app>"
>> parse a ["<" thru ">" break]
== false
```

Why? I thought it will evalauate first as true and then break will stop evaluation and will return true

Oldes

[10:21](#msg5ddcfcbb46397c721c388fb3)`to-char` is just a shortcut... don't use it in tight loops ;-)

```
>> ?? to-char
to-char: func ["Convert to char! value" value][to char! :value]
```

[10:24](#msg5ddcfd426a85195b9eaa625b)Just use `to end` instead of `break` if you want to end and return `true`:

```
>> parse a ["<" thru ">" to end]
== true
```

[10:27](#msg5ddcfe2c6a85195b9eaa67da)Btw.. in above bitset example, I could use: `alphabet/:i` instead of `find alphabet i`

bubnenkoff

[10:29](#msg5ddcfe786a85195b9eaa6910)but what wrong with break?

Oldes

[10:33](#msg5ddcff5ff65fec1c8e7194ff)Maybe someone else will answer... I'm not a `break` user. But it makes sense, that as there is a way how to end with true, there should be a way how to end with false too.

bubnenkoff

[12:17](#msg5ddd17cef65fec1c8e724f54)There is example of usage break, but I do not understand what it do https://www.red-lang.org/2013/11/041-introducing-parse.html

Oldes

[12:25](#msg5ddd19a9d64a052fb667aec1)It escapes from the recursive rule in the blog's example.

[12:35](#msg5ddd1c1ac3d6795b9fd4228d)@bubnenkoff maybe this will help you to understand:

```
>> parse "aabb" [some [#"a" break] copy rest to end] rest
== "abb"
>> parse "aabb" [some [#"a" ] copy rest to end] rest
== "bb"
```

[12:36](#msg5ddd1c51f65fec1c8e726f05)The `break` above escapes from the `some` rule, but still keeping successful result.

GiuseppeChillemi

[13:18](#msg5ddd260f1659720ca8ad5653)I have tried some simple instruction to understand how bitset works:

With the following, it seems you convert to a hexadecimal or octal value.

```
>> charset ["a"]
== make bitset! #{00000000000000000000000040}
```

And also:

```
>> enbase/base to binary! charset ["a"] 2
== {00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000}
```

This is the equivalent of decimal 64, so the above one is an hexadecimal rappresentation.

Well, first question: in which character set is `a` mapped to Hx0040 ?

toomasv

[13:23](#msg5ddd274c55066245981be496)@GiuseppeChillemi Wrong question :)

```
>> enbase/base to binary! charset ["a"] 16
== "00000000000000000000000040"
```

```
>> enbase/base to binary! charset ["a"] 64
== "AAAAAAAAAAAAAAAAQA=="
```

[13:30](#msg5ddd28e432df1245cb9499a9)

```
>> cs: charset "a"
== make bitset! #{00000000000000000000000040}
>> repeat i length? cs [if cs/:i [print i]]
97
```

Oldes

[13:31](#msg5ddd291b40f1940ca9d7d2d5)@GiuseppeChillemi does this help to understand?

```
>> to-integer #"a"
== 97

>> b: enbase/base to binary! charset ["a"] 2
== {00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000}

>> index? find b "1"
== 98 ;<--- 1-based indexing when using string series!
```

GiuseppeChillemi

[17:32](#msg5ddd61b45ac7f22fb5125e0e)Well, 98 is the number of zeroes before number `1`

[17:32](#msg5ddd61ba6a85195b9ead599e)\[!\[image.png](https://files.gitter.im/red/parse/KKxC/thumb/image.png)](https://files.gitter.im/red/parse/KKxC/image.png)

[17:32](#msg5ddd61c946397c721c3b9149)I have manually counted them !

[17:34](#msg5ddd6227d64a052fb669dd13)But I don't understand the source of number 97, why `a` converts to 97 ?

[17:37](#msg5ddd62cf32df1245cb965ac3)Found: `U+0061 a 61 LATIN SMALL LETTER A` \[Source](https://www.utf8-chartable.de/)

rebolek

[17:45](#msg5ddd64b78e906a1c8d20329c)@GiuseppeChillemi it's easy to find:

```
>> to char! 97
== #"a"
```

[17:45](#msg5ddd64d31659720ca8af3841)or

```
>> to integer! #"a"
== 97
```

GiuseppeChillemi

[17:46](#msg5ddd64e155066245981dca0d)@rebolek So, position is not number 97, I see UTF starts from zero, so `a` is the 98th character

rebolek

[17:47](#msg5ddd652232df1245cb966dbc)right

GiuseppeChillemi

[17:57](#msg5ddd678632df1245cb96809d)For `to integer! #"a"` the number `a` is decimal 97, while in charaset the bit is ON in position 98 because UTF8 starts from 00 ....

[18:00](#msg5ddd684b05eec2433d86c624)I am not able to understand how everything correlates, but If I consider only the position of `a` in the UTF8 table, I could imagine Red converts the letter to its absolute position and then check that flag.

[18:01](#msg5ddd688f1659720ca8af5181)So it does for any letter mentioned in the charset range

[18:02](#msg5ddd68b9c3d6795b9fd6667d)We will have as many 1 for each corresponding absolute position of the letter mentioned in the range.

greggirwin

[18:21](#msg5ddd6d1c32df1245cb96acf5)Imagine bitsets as a bunch of toggle switches, on or off. #"a" is switch 98. This, as you note, is because characters use their UCP (Unicode Code Point) to determine which switch applies to them. If you look at a charset, pretend going down the list of "letters" in it and flipping each corresponding switch up. Then you can look at your switches and see, at a glance, which are on or off.

As to #"a" specifically, it's because unicode used the old ASCII codes for compatibility.

Oldes

[18:28](#msg5ddd6ecdd75ad3721d072a89)Forget 98, #"a" is 97!

```
>> alphabet/97
== true
>> to-char 0
== #"^@"
>> alphabet/0: true
== true
>> find alphabet #"^@"
== true
```

[18:30](#msg5ddd6f4532df1245cb96beef)Bitset is using zero based indexing... the 98 was there, because classic series use 1-based indexing!

[18:31](#msg5ddd6f8d40f1940ca9d9f741)@GiuseppeChillemi I don't understand why you don't understand what `bitset` is. It is so easy.

[18:33](#msg5ddd6ffec3d6795b9fd6a1f5)If you forget `charset` and look at it just as a collection of bits:

```
>> b: make bitset! []
== make bitset! #{00}
>> length? b
== 8
>> b/0: true
== true
>> enbase/base to-binary b 2
== "10000000"
```

[18:34](#msg5ddd704846397c721c3c064f)The only thing that may be confusing is the zero based indexing in bitsets... but you are not expected to convert bits to string and count `1` characters.

greggirwin

[18:44](#msg5ddd72906a85195b9eadd957)Thanks for clarifying @Oldes.

GiuseppeChillemi

[19:21](#msg5ddd7b5126eeb8518f1f8046)@Oldes &gt; I don't understand why you don't understand what bitset is. It is so easy.

[19:22](#msg5ddd7b85b065c6433cedf8f1)I will replay to you later, I have taken notes about the thought process.

[21:53](#msg5ddd9ec426eeb8518f208451)@Oldes

The first question I asked to myself has been: how a character is converted to bitset ? Me and @bubnenkoff were convinced that a character is converted to bit rapresentation of its Hex number in ASCII or UTF8 map. We started searching for confirmation but first examples did not help because it is very difficult to make a correlation from a full charset to 000…7FFFFFE0

```
>> z: charset [#"a" - #"z"] == make bitset! #{0000000000000000000000007FFFFFE0}
```

I have started thinking about ASCII to Hex conversion, as:

```
>> charset ["a"] == make bitset! #{00000000000000000000000040}
```

Hx0040 is 64 decimal and UTF8 tables reported:

[21:53](#msg5ddd9ec91659720ca8b0e7b0)\[!\[image.png](https://files.gitter.im/red/parse/s0Iu/thumb/image.png)](https://files.gitter.im/red/parse/s0Iu/image.png)

[21:53](#msg5ddd9ed4b065c6433ceefdbc)

Having 1 integer distance could mean a different index start. (Only Later I realized than you wrote `a` and not `A` )

Another problem trying to find the was rapresented from the most and least significant bits:

\*\*How do you read this binary number ?\**

```
>> enbase/base to binary! charset to char! 3 2 == "00010000"
```

Is the least significant number on the left or on the right ? I supposed it was on the right as:

```
>> enbase/base to binary! charset ["a"] 2 == {00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000}
```

Is 64, as Hex0040! So you would never think the \*\*relevant information\** is all the zeroes on the left,\** you think that it is on the right side.\**

Your last example put me o the right track:

```
>> to-integer #"a" == 97
```

```
>> index? find b "1" == 98 ;<--- 1-based indexing when using string series!
```

Red does not convert the ASCII position to a binary number but to a bit string with N zeroes before the 1. The 1 is put on the \*\*nTH\** position from the left, based on UTF8 position of the character in UTF8 definition, whose table is considered an array starting from 00 as position 1, while in Red a series usually start at 01.  
&gt;

[22:05](#msg5ddda1a79319bb519096fa78)Correction  
\* \*Another problem was trying to find where you have rapresented the most and least significant bits:*

hiiamboris

[22:07](#msg5ddda23ad75ad3721d08bc58)Such an adventure ☻

rebolek

[22:08](#msg5ddda24255066245981f96b1)You making it sound really complicated. Bitset is simple series of bits. Each character is represented by one bit. They are ordered from left to right, according to char's position in ASCII/Unicode table. That's all.

Oldes

[22:26](#msg5ddda6b140f1940ca9db9189)Btw... Red/Rebol 's bitset implementation is trivial... Petr Kobalicek is taking more care about bitsets in his Blend2D -&gt; https://gitter.im/blend2d/blend2d/archives/2019/08/28

GiuseppeChillemi

[22:30](#msg5ddda79540f1940ca9db9964)Your explanation needs an example to be added to the end:

Let's build a simple charset:

```
charset [#"a" - #"b"]
```

take the position number of the character `a` in the UDF8 table, it is 97 but consider its position is 98 as the UTF8 table starts from 0. Then add 97 zeroes and one `1` in position 98.

This is the resulting bitset

```
== {00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000}
```

Character `b` is position 98 in UTF8 table, so it is 99 in our bitset, add 98 zeroes and set the 99th it to `1`.

```
== {00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000}
```

Merge the 2 bitsets and result is:

```
== {00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000}
```

When red encounters the letter `a` will look at 98th bit and if set to 1, as it is, will return as a matching character in parse.

[22:45](#msg5dddab1a5ac7f22fb51494b3)Hovever, thank you to everyone who helped. Personally, bitsets were obscure to me and now they are very clear. Another step forward into knowing Red.

[22:48](#msg5dddabb232df1245cb987002)@hiiamboris Such an adventure ☻

[22:48](#msg5dddabc755066245981fd483)Learning Red is a great adventure!

[23:21](#msg5dddb37b26eeb8518f211fe2)@rebolek your..

[23:21](#msg5dddb38632df1245cb98a500)&gt; Bitset is simple series of bits

[23:22](#msg5dddb3c6f65fec1c8e76d5b7)Let me think that "bitseries" better describes the real mechanism.

## Wednesday 27th November, 2019

toomasv

[04:45](#msg5dddff851659720ca8b38bd8)@GiuseppeChillemi This may explain your initial confusion:

```
>> to-binary "a"
== #{61}
>> to-binary to-bitset "a"
== #{00000000000000000000000040}
```

greggirwin

[05:41](#msg5dde0ca432df1245cb9b2080):point\_up: \[November 26, 2019 11:21 AM](https://gitter.im/red/parse?at=5ddd6d1c32df1245cb96acf5) @GiuseppeChillemi (or anyone else), did my explanation make any sense, or how can it be improved?

@GiuseppeChillemi "bitseries" does not describe the mechanism. Bitsets are not series. They are \*exactly* what the name says: sets of bits.

GiuseppeChillemi

[06:23](#msg5dde1665f65fec1c8e797774)@greggirwin my difficulty has been on the correlation mechanism between the source and the bitset.

I was imaging converting the single character to its bit representation. #"a" which is decimal w97 would be converted to "01100001".

&gt; Imagine bitsets as a bunch of toggle switches, on or off. #"a" is switch 98

I think adding a little phrase to the end would help:

\*Imagine bitsets as a bunch of toggle switches, on or off. #"a" is switch 98 because on UCP8 #"a" is located on position 98 of the table.*

Then a note:

\*"Decimal value is different than its position in the UCP table as it starts from 0, so #"a" is located in position 98 while its decimal value in the table is 97*

[06:24](#msg5dde16968e906a1c8d251060)As you can see, this conversion had multiple subtle difficulties finding the correct mechanism.

[06:29](#msg5dde17e305eec2433d8badcc)@toomasv

&gt; @GiuseppeChillemi This may explain your initial confusion:  
&gt;

```
> >> to-binary "a"
> == #{61}
> >> to-binary to-bitset "a"
> == #{00000000000000000000000040}
>
```

Yes, it is confusing right now:

`#{61}` and `#{00000000000000000000000040}`

For me, these numbers are not a binary representation. I expect 00101010100 style but maybe they are an I am ignoring something.

toomasv

[07:01](#msg5dde1f4ec3d6795b9fdb5f7b)`to-binary` results in binary series represented in base 16. To convert it to base 2 use `enbase/base 2`.

[07:03](#msg5dde1fc48e906a1c8d255477)(But this is string, so not actually a conversion)

[07:31](#msg5dde265640f1940ca9df1dc2)This would be the base 2 binary representation:

```
>> print head insert back tail "2#{}" enbase/base to-binary "a" 2
2#{01100001}

>> print head insert back tail "2#{}" enbase/base to-binary charset "a" 2
2#{00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000}
```

GiuseppeChillemi

[07:37](#msg5dde27a51659720ca8b4a61f)@toomasv You have touched a point I have intentionally skipped deferring it to a further investigation: the lack of visual information of the numeric base used. I did not know if it was me lacking of this knowledge or there really where no such info.

toomasv

[07:40](#msg5dde285855066245982338f8)See `binary!` in \[doc](https://doc.red-lang.org/en/datatypes/binary.html) or in \[spec](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#binary).

bubnenkoff

[09:29](#msg5dde41e75ac7f22fb518c5c6)&gt; Thanks! Continue learning. New question, why collecting only second h1 tag?  
&gt;

```
> page: {
> <html> 
>     <title> My Great Page</title>
>     <h1>Big Heading A</h1>
>         <p>Stuff in A</p>
>     <h1>Big Heading B</h1>
>         <p>Stuff in B</p>
> </html>
>     }
> 
> parse page [ collect any [thru <h1> | keep to "<" ]]
> == ["Big Heading B"]
>
```

I solve it with `break`:

```
>> parse page [ collect any [thru <h1> keep to "<" break]]
== ["Big Heading A"]
```

toomasv

[09:42](#msg5dde4513b065c6433cf381f4)@GiuseppeChillemi  
Crash course in binary and charset (Sorry @rebolek!)

```
;Let's convert a string to binary
bn: to-binary "Březovský"
;== #{42C599657A6F76736BC3BD}

;Now try to convert each byte back to characters
foreach b bn [prin to-char b]
;BÅezovskÃ½

;But if we convert it to string
to-string bn
;== "Březovský"

;Let's see the chars
to-binary "B"
;== #{42}
to-binary #"ř"
;== #{C599}

;Ha!
forall bn [
    either bn/1 < 128 [
        prin to-char bn/1
    ][  prin to-char copy/part bn 2 bn: next bn]
]()
;Březovský


;Now charset
cs: charset "Březovský"
;== make bitset! #{0000000000000000200000000411122000000000000000000000000000000004000000000000000000000040}

;Here they are in "alphabetic" (or rather "utfic") order
repeat i length? cs [if cs/:i [prin to-char i]]()
;Bekosvzýř

;Nice thing about charsets (well, bitsets actually) is that we can do set operations with these
cs2: charset "Boleslav"
;== make bitset! #{000000000000000020000000440912}

cs-union: union cs cs2
;== make bitset! #{0000000000000000200000004419122000000000000000000000000000000004000000000000000000000040}
repeat i length? cs-union [if cs-union/:i [prin to-char i]]()
;Baeklosvzýř

cs-excl: exclude cs cs2
;== make bitset! #{0000000000000000000000000010002000000000000000000000000000000004000000000000000000000040}
repeat i length? cs-excl [if cs-excl/:i [prin to-char i]]()
;kzýř

cs-diff: difference cs cs2
;== make bitset! #{0000000000000000000000004018002000000000000000000000000000000004000000000000000000000040}
repeat i length? cs-diff [if cs-diff/:i [prin to-char i]]()
;aklzýř

cs-compl: complement cs2
;== make bitset! [not #{000000000000000020000000440912}]
repeat i length? cs-compl [if cs-compl/:i [prin to-char i]]()
	

 !"#$%&'()*+,-./0123456789:;<=>?@ACDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`bcdfghijkmnpqrtuwx
```

Quick \[intro](https://medium.com/@apiltamang/unicode-utf-8-and-ascii-encodings-made-easy-5bfbe3a1c45a) to Unicode, UTF and ASCII.  
Have a look at \[utf/unicode chartable](https://www.utf8-chartable.de/unicode-utf8-table.pl)

```
to-string #{e28880 78 e28883 79 20 28 42 78 20 e288a7 20 47 79 29 20 e28a83 20 4C 78 79}
;== "∀x∃y (Bx ∧ Gy) ⊃ Lxy"

;You can use unicode code points to get characters if you convert these to integers first:
to-char to-integer #{01F609}
;== #"😉"
to-char to-integer #{01F475}
;== #"👵"

;But to get multibyte characters (also chars with decimal value > 127) in string you should use utf encoding
print to-string #{f09f91b5 20 f09f9889}
👵 😉
```

[10:17](#msg5dde4d5026eeb8518f25609b)@bubnenkoff If you want first heading only then you don't need `any` loop:

```
>> parse page [ collect [thru <h1> keep to "<"]]
== ["Big Heading A"]
```

rebolek

[11:25](#msg5dde5d1ab065c6433cf43a41)@toomasv :smile:

xqlab

[12:47](#msg5dde707746397c721c434da2)@bubnenkoff you get only the second block because of your `|` with the meaning \*\*or\*\*. As the first condition is fulfilled the second with `keep`will not be processed as long as the first condition is sufficient.

```
>> parse page [ collect any [thru <h1>  keep to "<" ]]
== ["Big Heading A" "Big Heading B"]
```

endo64

[13:21](#msg5dde7867d64a052fb671a82f)Great explanations as always @toomasv , just a small addition, to see what is going on (I've shorten the output to not flood your screens):

```
repeat i length? cs [either cs/:i [prin to-char i] [prin "."]]
...................B..................................e.....k...o...s..v...z.........................................................ý...................................................ř.......
```

rebolek

[13:22](#msg5dde7884d64a052fb671a9a5)@endo64 great visualisation!

endo64

[13:28](#msg5dde7a1a6a85195b9eb57a3a)Should we create a wiki page for `bitset!`s and add those conversation notes + Toomas' explanations there?

rebolek

[13:31](#msg5dde7aa526eeb8518f26cbd4)It makes sense, so next time we can just point people to that wiki.

toomasv

[14:45](#msg5dde8bfa5ac7f22fb51b0ae8)@endo64 :+1: Nice!

GiuseppeChillemi

[17:16](#msg5ddeaf78b065c6433cf6d5b6)I am not in front of my pc but I see I have new Red lessons ready for this evening.

[17:16](#msg5ddeaf8af65fec1c8e7e19af)Thanks @toomasv!

toomasv

[17:32](#msg5ddeb346f65fec1c8e7e392f):smile:

GiuseppeChillemi

[21:17](#msg5ddee807c3d6795b9fe190f7)@toomasv Lesson read. Some things to try but everything is taking a shape.  
@endo64 Nice visualization.

greggirwin

[21:39](#msg5ddeecf426eeb8518f2a4832)Wiki page FTW! :^)

## Thursday 28th November, 2019

bubnenkoff

[08:03](#msg5ddf7f65b065c6433cfc9c1d)`ws: charset reduce [space tab cr lf]`  
Why reduce is here? Why not simple: `ws: [space tab cr lf]`?

xqlab

[09:19](#msg5ddf91079319bb5190a504d4)because words in a block are shielded against evaluation / automatic reducing. Just see the block in the command line with and without reducing.

bubnenkoff

[10:09](#msg5ddf9cc66a85195b9ebdb921)"`find` simply checks if the field exists, returning `true` or `none`"  
:

```
>> b
== ["name" "price" "age"]
>> find b ["age"]
== ["age"]
```

Why I am not getting true\\false?

[10:26](#msg5ddfa0de46397c721c4bf4e9)There is bug in latest compiler. I am getting exception on next code:

```
obj: object [a: 44]
print find obj 'a
```

[10:30](#msg5ddfa1c932df1245cba6ca06)&gt; "`find` simply checks if the field exists, returning `true` or `none`"  
&gt; :  
&gt;

```
> >> b
> == ["name" "price" "age"]
> >> find b ["age"]
> == ["age"]
>
```

&gt;  
&gt; Why I am not getting true\\false?  
&gt;

The same behavior on latest and stable Red

endo64

[10:33](#msg5ddfa284b065c6433cfda108)&gt; find simply checks if the field exists, returning true or none

@bubnenkoff Where did you read this? `find` was working on objects before and was return true/false, but not anymore. that feature removed on recent versions.  
Now you should get `*** Script Error: find does not allow object! for its series argument` error.

[10:35](#msg5ddfa2e4b065c6433cfda455)For the blocks `find` returns the given block in the position where it found the searched value (or `none` if it can't find). So `find b ["age"] ; == ["age"]` is correct.

bubnenkoff

[11:23](#msg5ddfae3c7d00806b130c74c6)I read it in Helpin' Red.pdf sorry, I messed mention about object at top

[11:24](#msg5ddfae7f6a85195b9ebe3aa4)@endo64 how to evaluate find as true\\false for the block checking?

endo64

[11:26](#msg5ddfaee6f65fec1c8e853132)

```
b: ["name" "price" "age"]
not none? find b "age" ; returns true/false
; or
if find b "age" [print "found!"]
```

xqlab

[12:09](#msg5ddfb8f1d64a052fb67abd9f)or short `to-logic`

[12:10](#msg5ddfb94ff65fec1c8e857f73)

```
>> to-logic find ["name" "price" "age"]  'a
== false
>> to-logic find ["name" "price" "age"]  "name"
== true
```

bubnenkoff

[13:16](#msg5ddfc89405eec2433d982173)thanks!

toomasv

[14:02](#msg5ddfd36c32df1245cba8247b):point\_up: \[November 27, 2019 11:39 PM](https://gitter.im/red/parse?at=5ddeecf426eeb8518f2a4832)

&gt; One should use caution when using the term to older people who are unaware of the new connotation.

\[Source](https://turbofuture.com/internet/ftw-meaning\*)

endo64

[14:59](#msg5ddfe0d35ac7f22fb524cc44)@toomasv I thought the same thing :)

greggirwin

[18:22](#msg5de010788e906a1c8d33ad2d)Wow! My apologies. I had never seen the other meaning. The one time I try to keep up with the times...

[18:25](#msg5de011155ac7f22fb5262482)There's a comedian named (An)Drew Tarvin who does a bit on this.

&gt; I got back from Switzerland and texted my Grandma. She wrote back "Switzerland? WTF!". I had to call her and ask what she thought WTF meant. "Oh, a lady in my bridge club said it means 'Wow, that's fun!'", and I told my Grandma...that's \*exactly* what it means.

[18:28](#msg5de011bbb065c6433c00dade)@bubnenkoff on true/false testing, in Red only 2 values are considered "false": the `logic!` value `false` (use `help logic!` to see all aliases), and `none`. Everything else, including `unset!` is considered `true`. So you don't have to cast to `logic!` values if all you care about is truthiness.

## Friday 29th November, 2019

bubnenkoff

[10:11](#msg5de0eeddd64a052fb68313c9)I described simple open\\closing tag construction:  
`tg: [any ["<" thru ">" opt lf "<" opt "/" thru ">"]]`  
How I can iterate by simple tags:

I tried to do something like:

```
>> foreach tg "<div><title></title></div>" [print "hello"]
hello
hello
hello
hello
hello
hello
hello
hello
hello
hello
hello
hello
hello
hello
hello
hello
hello
```

But can't understand why so many `hello` printed.

[10:24](#msg5de0f1ce6a85195b9ec6f112)It's seems that it's doing print after every check of rule. But I need to do print only 4 times on: "div" "title" "title" and "div"

Oldes

[10:39](#msg5de0f54955066245983739df)@bubnenkoff try this: `foreach tg " " [print tg]` and you will understand.

[10:40](#msg5de0f58c6a85195b9ec708b4)You are expecting `tg` to contain tags, but actually you are getting each char from the given string series.

pekr

[10:41](#msg5de0f5de5506624598373d72)The code does not make much sense, most probably you wanted to use your tg rule as a rule in parser?

Oldes

[10:48](#msg5de0f7826a85195b9ec71376)@bubnenkoff you probably want something like this:

```
>> tg: [#"<" opt #"/" thru #">"]
== [#"<" opt #"/" thru #">"]
>> parse "<div><title></title></div>" [any [s: tg e: (probe copy/part s e)]]
"<div>"
"<title>"
"</title>"
"</div>"
```

[10:50](#msg5de0f7e705eec2433da05254)Or:

```
parse "<div><title>blabla</title></div>" [any [s: tg e: (probe copy/part s e) | 1 skip]]
```

if you want do deal with other content, not just tags.

[10:53](#msg5de0f8ae32df1245cbaffd33)Or:

```
>> parse "<div><title>blabla</title></div>" [collect any [keep tg | 1 skip]]
== ["<div>" "<title>" "</title>" "</div>"]
```

bubnenkoff

[12:10](#msg5de10aca08d0c961b7bc0d14)@Oldes please explain me this part:

```
s: tg e: (probe copy/part s e)
```

Oldes

[12:13](#msg5de10b5846397c721c55b847)`s` and `e` hold series at positions (start and end) of the input. Just add `probe s probe e` and see.

[12:15](#msg5de10bce9319bb5190afa0b0)`copy/part s e` creates a new substring from the input.

[12:19](#msg5de10ce346397c721c55c633)@bubnenkoff and when you are in the learning phase, it is good to know, that you can change the input using `get-word!`.. for example:

```
>> parse str: "aabbaa" [any [some #"a" | s: some #"b" e: (e: change/part s #"c" e) :e]]
== true
>> str
== "aacaa"
```

bubnenkoff

[12:35](#msg5de1107d32df1245cbb0b9c1)@Oldes You wrote:

```
>> tg: [#"<" opt #"/" thru #">"]
```

My code is:

```
tg: [any ["<" thru ">" opt lf "<" opt "/" thru ">"]]
```

Is they are same? Should I use `#` for single chars as in your example?

[13:28](#msg5de11d0205eec2433da18575)&gt; `s` and `e` hold series at positions (start and end) of the input. Just add `probe s probe e` and see.

Not fully understand. It's standard `any` behavior? Could you provide another example of Handling start and end position with `any`

[13:35](#msg5de11e84c3d6795b9ff0e77b)I am trying to figure out how to work any with start and end. I tried to do small example but failed with it logic and result:

```
>> parse "aabbcc" [any [s: "aa" (print s) "bb" e: "cc" (print e) ] ]
aabbcc
cc
```

I expect to get printed `s` and `e` values

pekr

[13:35](#msg5de11e9432df1245cbb13f40)I think that it would be good to read about Rebol's parse here: http://www.rebol.com/docs/core23/rebolcore-15.html

[13:44](#msg5de120a98e906a1c8d3b4131)set-words marks the position during the parsing. If you mark two positions, it means 2 index positions, so copy/part start end will copy the string between the start and end marks:

```
>> string: "This is some text."
== "This is some text."
>> start: skip string 4
== " is some text."
>> end: skip string 8
== "some text."
>> copy/part start end
== " is "
```

[13:48](#msg5de121a05ac7f22fb52d8e16)In your above example, you got printed `s`and `e`values. Just remember - those are just kind of pointers/markers at certain string position.

Oldes

[14:15](#msg5de128171659720ca8ca6682)I think it is good to read \[all chapters](http://www.rebol.com/docs/core23/rebolcore.html), not just about parsing;-)

[14:34](#msg5de12c93d75ad3721d21efe8)@bubnenkoff the set-words in the parse rules are not related to `any`. Try this:

```
>> str: "abc" (parse str [1 skip bc:] bc) = skip str 1
== true
```

## Tuesday 3th December, 2019

bubnenkoff

[11:57](#msg5de64dc432df1245cbd66433)&gt; `s` and `e` hold series at positions (start and end) of the input. Just add `probe s probe e` and see.

Still can't understand why you are saying that it's hold position, but not data

[12:10](#msg5de650bb46397c721c7b868d)&gt; set-words marks the position during the parsing. If you mark two positions, it means 2 index positions, so copy/part start end will copy the string between the start and end marks:  
&gt;  
&gt;

```
> >> string: "This is some text."
> == "This is some text."
> >> start: skip string 4
> == " is some text."
> >> end: skip string 8
> == "some text."
> >> copy/part start end
> == " is "
>
```

Am I right understand that here start and end store not simple value, but value and pointer to data?

toomasv

[12:29](#msg5de6551955066245985df994)They all point to the same string, their own data is index in that string.

bubnenkoff

[12:33](#msg5de655fd8e906a1c8d607fcf)I am not understanding:

```
>> x
== "aaabbbcccddd"
>> parse x [any [s: "aaa" (print s) e: "ccc" (print e) ] ]
aaabbbcccddd
```

I expected:

```
aaabbbccc
```

toomasv

[12:56](#msg5de65b6bc3d6795b9f167be8)`s:` will point to `x` at index 1. When rule reaches `(print s)` it prints `s`, which is basically same as `x`. As it doesn't match anything further, it fails.

```
>> s = x
== true
```

[13:07](#msg5de65e2508d0c961b7e291c3)To get what you expected:

```
>> parse x [s: "aaa" thru "ccc" e: (print copy/part s e)]
aaabbbccc
== false
>> parse x ["aaa" thru "ccc" e: (print copy/part x e)]
aaabbbccc
== false
>> parse x ["aaa" thru "ccc" e:] print copy/part x e
aaabbbccc
```

greggirwin

[15:57](#msg5de6860446397c721c7d4281)@bubnenkoff leave `parse` for the moment and play with series values directly. Use navigation funcs like `[head tail next back skip at index? pick poke]` and things like `copy/part`. Get a feel for those, then come back to parse, and I think it will make more sense.

toomasv

[16:25](#msg5de68c7605eec2433dc91646)@bubnenkoff One more funny thing to ponder:

```
>> parse x ["aaa" thru "ccc" e:] clear e print x
aaabbbccc
```

## Wednesday 4th December, 2019

bubnenkoff

[13:19](#msg5de7b273d75ad3721d513548)@Oldes I am not understanding why you wrote:

```
tg: [#"<" opt #"/" thru #">"]
```

`opt` is skip one element. So I should write something another like: `opt any alpahabet`. Why your code is working?

Oldes

[13:20](#msg5de7b29fd75ad3721d5136a4)to accept and also ... yes.. there is the `thru`, so I could avoid it, but there could be also something more sophisticated instead of the `thru`.

rebolek

[13:20](#msg5de7b2ad1659720ca8f91bf1)`opt` is not skip one element. `opt` is for optionally matching it.

[13:21](#msg5de7b2d49319bb5190de85f9)"this element may be here or may not, both is fine"

bubnenkoff

[13:25](#msg5de7b3d3c3d6795b9f2016e8)&gt; to accept and also ... yes.. there is the `thru`, so I could avoid it, but there could be also something more sophisticated instead of the `thru`.

Oh! I understood!

rebolek

[13:31](#msg5de7b52ed64a052fb6b40130)`to` and `thru` are great way to shoot yourself in the foot

bubnenkoff

[14:19](#msg5de7c0758e906a1c8d6ab215)@Oldes I am still trying to understand. You Wrote:  
"`parse " " [any [s: tg e: (probe copy/part s e)]]`"  
&gt; `s` and `e` hold series at positions (start and end) of the input. Just add `probe s probe e` and see.

I have trouble with understanding start and end.  
So if I am parsing string:

```
parse "aabbcc"
```

the end of it is `cc`. So parsing rule will be:  
`parse "aabbcc" [s: "aa" e: thru "cc"]`  
`s` - will hold start, `e` - end

right?

[15:26](#msg5de7d03b5ac7f22fb55d4bc6)Or here in `any [...]` can be more that two positions:

```
parse "<div><title></title></div>" [any [s: tg e: (probe copy/part s e)]]
```

Oldes

[16:29](#msg5de7df04d75ad3721d527bb3)

```
>> parse "aabbcc" [s: "aa" e: thru "cc"]
== true
>> s
== "aabbcc"
>> index? s
== 1
>> e
== "bbcc"
>> index? e
== 3
>> copy/part s e
== "aa"
>> copy/part "aabbcc" (3 - 1)
== "aa"
```

[16:32](#msg5de7dfa926eeb8518f687f83)when you use `set-word!` as a parse rule, it stores current input's position.

## Thursday 5th December, 2019

bubnenkoff

[12:07](#msg5de8f3141659720ca8021036)@Oldes big thanks, sorry for many simple questions about same. Yes now I am understanding more. But still have problem with:

```
e: (probe copy/part s e)
```

we are creating word `e` and what happens than? What value have last `e` (before closing paren)

[12:13](#msg5de8f4545ac7f22fb565876a)How it will evaluate? the last `e` will automatically point to end of match? and than we will do `copy/part` from start to end?  
I can't understand how end index will be placed there.

[12:18](#msg5de8f5a76a85195b9e00f49f)Wow! I did not sot that it's possible!

```
parse "aaabbbccc" [s: "aaa" thru "ccc" e: ]
```

`e` is getting `ccc` index!

[13:00](#msg5de8ff7d5506624598711f8f)

```
>> print ("aa" "bb")
bb
```

How to print both?

[13:03](#msg5de9002132df1245cbe9d85d)I am playing with index and want to print them:

```
parse a [any [s: tg e: (probe (index? s index? e) ) ]]
```

[13:14](#msg5de902b5d75ad3721d5adb21)What difference between `join` and `rejoin`? Is it good to write like:

```
>> parse a [any [s: tg e: (probe rejoin [index? s " - " index? e] ) ]]
"1 - 6"
"6 - 11"
"11 - 18"
"18 - 26"
"26 - 32"
"32 - 38"
```

GiuseppeChillemi

[13:58](#msg5de90ceb26eeb8518f6fe195)@bubnenkoff Red has no join

bubnenkoff

[14:09](#msg5de90f8008d0c961b7f6281b)@GiuseppeChillemi `join` is rudimental?

```
>> ? join
     rejoin          function!     Reduces and joins a block of values.
```

GiuseppeChillemi

[14:22](#msg5de912a646397c721c8f9680)\[!\[image.png](https://files.gitter.im/red/parse/j62N/thumb/image.png)](https://files.gitter.im/red/parse/j62N/image.png)

bubnenkoff

[14:22](#msg5de912be32df1245cbea6a5b)oh! thanks!

GiuseppeChillemi

[14:22](#msg5de912c105eec2433ddb2332)There is no join, only REJOIN

[14:22](#msg5de912c3c3d6795b9f2a2193)Ok

[14:24](#msg5de9131826eeb8518f700a57)you are welcome

xqlab

[14:45](#msg5de917f78e906a1c8d745d1b)@bubnenkoff

```
>> print ["aa" "bb"]
aa bb
```

`(""aa" "bb")` is the same as `do ["aa" "bb"]`which gives the last value

bubnenkoff

[14:47](#msg5de91894d64a052fb6be2558)Is it's possible to do?

```
d: charset [#"0" - #"9"]
```

I am asking because I have empty result:

```
>> repeat c length? d [if find to-string d c [ print to-char c]]
== none
```

Oldes

[14:58](#msg5de91b24d64a052fb6be3c6c)@bubnenkoff just: `repeat c length? d [if find d c [ print to-char c]]`

GiuseppeChillemi

[18:42](#msg5de94f8e8e906a1c8d760f81) A definition appeared in my mind today: "fuzzy parse".

[18:43](#msg5de94fd2f65fec1c8eca6057)Let's search if it exists.

greggirwin

[21:14](#msg5de9734cd64a052fb6c0c3b0):point\_up: \[December 5, 2019 5:07 AM](https://gitter.im/red/parse?at=5de8f3141659720ca8021036) @bubnenkoff there is a \*very important* thing to note here. `Set-word!`s work differently in the `parse` dialect than in normal Red. In Red's standard evaluator `e: (probe copy/part s e)` would set `e` to refer to the result of the paren evaluation, but in `parse` `e:` marks a location in the input, which you can refer to (e.g. in the paren), but the evaluation of the paren is ignored. Everything \*inside* the paren is evaluated normally, not as `parse` dialect.

## Friday 6th December, 2019

meijeru

[10:21](#msg5dea2bb05506624598799687)@bubnenkoff Allow me to quote from the \[spec document](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc), section 2.5  
Red makes available a large number of different value types. The evaluation rules describe the interpretation of these values when they occur in a Red \_program_ which is nothing more or less than a sequence of values. The users may furthermore use and interpret Red values, when considered as \_data\_, in ways of their own, and thus create dialects or Domain Specific Languages (DSLs). Implementing the interpretation of dialects in Red is greatly facilitated by the parse facility.  
In fact, Red itself contains a number of dialects where blocks of data are interpreted in a specific way; this includes the preprocessor dialect, the parse dialect, the visual interface dialect (VID), which also uses the draw dialect and its shape sub-dialect, the various spec dialects involved in defining vectors, images, bitsets, objects, errors, ports, maps, functions and routines, furthermore the compose and construct dialects and the system dialect (Red/System).

bubnenkoff

[13:26](#msg5dea571c8e906a1c8d7d6d78)

```
a: "<app><div><title>Hello</title></div></app>"
alphabet: charset [#"a" - #"z" #"A" - #"Z" #"0" - #"9"]
>> parse a [ any [s: tg e: (print copy/part e s) | collect keep alphabet ]  ] 
<app>
<div>
<title>
</title>
</div>
</app>
== [#"H" [#"e"] [#"l"] [#"l"] [#"o"]]
```

How to extract `Hello` not as separate charsets?

[13:33](#msg5dea58a632df1245cbf37d8c)I tried collect into, but got very strange result:

```
>> parse a [ any [s: tg e: (print copy/part e s) | collect into q keep alphabet ]  ] 
<app>
<div>
<title>
</title>
</div>
</app>
== true
>> q
== "olleHaaab"
```

GiuseppeChillemi

[14:16](#msg5dea62bad64a052fb6c75f29)@meijeru are you the author of the spec document?

meijeru

[14:28](#msg5dea65a31659720ca80ca2db)I have written 99% of it. Tell me what you think of it.

cloutiy

[14:32](#msg5dea666f26eeb8518f787ae6)@bubnenkoff maybe try keep some alphabet?

GiuseppeChillemi

[16:49](#msg5dea86a9c3d6795b9f34a278)@meijeru Its really complete and I am learning lot of concepts and terms. I am having only difficulties on few specific topics.

greggirwin

[18:49](#msg5deaa2c332df1245cbf5b981)@bubnenkoff I think there's an example that does exactly what you want (or very close) on https://www.red-lang.org/2013/11/041-introducing-parse.html

toomasv

[18:58](#msg5deaa4eed64a052fb6c94e2f)@bubnenkoff Three examples:

```
>> first parse a [collect any ["><" | #">" keep to #"<" | skip]]
== "Hello"
>> first parse a [collect any [#">" not #"<" keep to #"<" | skip]]
== "Hello"
>> form first parse load a [collect any [keep word! | skip]]
== "Hello"
```

dockimbel

[20:18](#msg5deab7921659720ca80f0983)@bubnenkoff

```
parse a [ collect any [s: tg e: (print copy/part e s) | keep copy tmp [any alphabet]]]
```

or

```
parse a [ collect any [s: tg e: (print copy/part e s) | keep thru [any alphabet]]]
```

## Saturday 7th December, 2019

meijeru

[13:52](#msg5debaeb426eeb8518f80344e)@GiuseppeChillemi Feel free to ask! Perhaps better in red/help.

GiuseppeChillemi

[14:19](#msg5debb4f305eec2433dedea84)@meijeru I am reading your document again and again and if I won't find what I was searching for I will ask there.

## Monday 9th December, 2019

ericguedespinto

[13:11](#msg5dee47fd46397c721cb46057)Hello all  
I need help!  
I am trying to parse a long list of references (loaded from a txt file as a string) in order to reformat them into something more useful and I am getting this strange error where the parsing stops in the middle of the file. When I do a parse-trace, I get this error

````
```, although with parse-trace it actually happens before the point it would happen with parse. 
I thought that this could be memory related, but then I tried to cut the file and go at it in chunks but it always breaks at the some points.
Does anyone have any thoughts?
````

results: read %pubmed\_result.txt  
output: ""  
search\_tag: \[ "search tags(\\\[\[a-zA-Z-&amp;]\*\\])^/^/" ]  
digit: charset "0123456789"  
index: \[ some digit #":" ]  
letters: charset \[#"a" - #"z" #"A" - #"Z"]  
linebreak: charset \[ #"^/" ]  
chars: union union letters charset\[ #"," #" " #":" "-" #"\[" #"]" #"^"" #"ş" #"ı" #"Ç" #";" #"'" #"í" #"ó" #"(" #")" #"ö" ] digit  
authors: \[ index some \[ chars ] #"." any \[ #" " ] ]  
title: \[ collect \[ some \[ keep some \[ chars ] opt linebreak ] keep \[ #"." | #"?" ] ] ]  
ref: \[ thru "^/^/^/" ]  
article: \[ authors opt linebreak title ref ]  
file: \[ search\_tag some article end ]  
print parse-trace results file

```
The actual file is about 60000 lines long, but it doesn't get past line 279... and it breaks with this line
```

'Sonographic diagnosis of thyroid cancer with support of AI. '\`

hiiamboris

[13:13](#msg5dee487a550662459896e6dd)What Red build are you using?

ericguedespinto

[13:15](#msg5dee48e45ac7f22fb58b77cc)I am on win10, just downloaded the new build today  
%gui-console-2019-12-3-34266

hiiamboris

[13:16](#msg5dee49409319bb51900820ed)Can you upload this file with 280 lines so we can reproduce the glitch?

[13:17](#msg5dee4978d64a052fb6e31630)That error message rings some bell slightly..

ericguedespinto

[13:23](#msg5dee4ae49319bb5190082e00)\[pubmed\_result.txt](https://files.gitter.im/red/parse/8eEG/pubmed\_result.txt)

hiiamboris

[13:25](#msg5dee4b5b5ac7f22fb58b8f93)Just tried. No Script Error with this file.

ericguedespinto

[13:27](#msg5dee4ba85506624598970063)does it process the whole file? I can't get past entry 65 on line 279

hiiamboris

[13:29](#msg5dee4c38d64a052fb6e32f54)Wait. I reproduced it. Without `--cli` I see `*** Script Error: reset-buffer does not allow vector! for its argument`

[13:30](#msg5dee4c659319bb5190083704)With `--cli` I get parse to finish with `false` and last words it prints are " Sonographic diagnosis of Sonographic diagnosis of"

[13:31](#msg5dee4cb0d64a052fb6e332b4)Definitely a memory related error. I have lots of these when I use parse and View at the same time.

[13:34](#msg5dee4d4b1e0b827cc8cbd860)By the way, that was line 89 for me:

```
match: [some [chars] #"." any [#" "]] 
                                       input: { Mahmoudzadeh AP, Malkov S, Fan B, Greenwood H, J                                       
                                       -->
*** Script Error: reset-buffer does not allow vector! for its <anon> argument
*** Where: reset-buffer
*** Stack: parse-trace
```

ericguedespinto

[13:34](#msg5dee4d67d64a052fb6e338ea)that is where it stops with parse instead of parse-trace, but I can't understand why it would stop there...  
Curiously enough, if I delete the first part of the file up to that line, it still stops at the same point with "Sonographic diagnosis of", which makes me wonder if it realy is memory related

[13:35](#msg5dee4d9705eec2433d005f54)Yes, with parse-trace it stops in line 89 (entry 25) for me as well, but with parse, it prints half of line 279

hiiamboris

[13:35](#msg5dee4da46a85195b9e26c915)I see. Interesting.

ericguedespinto

[13:40](#msg5dee4eb41659720ca82894a1)and if I just delete that entry 65, it goes further than before

ne1uno

[13:40](#msg5dee4ed105eec2433d006795)bit of unicode there

hiiamboris

[13:40](#msg5dee4edcb065c6433c66fbba)Why I believe it's memory related is because with `--cli` the behavior is different.

ne1uno

[13:43](#msg5dee4f7d32df1245cb0f2f9a)00000000 73 75 70 70 6F 72 74 C2 A0 6F 66 20 41 49 support of AI

ericguedespinto

[13:46](#msg5dee503b32df1245cb0f36b3)Yes, unicode would be a good explanation.  
I just rewrote by hand that line and now it parses easily.  
So a bit of hidden information is that txt file? o maybe something to do with encoding of the string?

hiiamboris

[13:50](#msg5dee5135f65fec1c8eed99a1)There's a lot of unicode there, so what? Looks like valid UTF8. If it wasn't, `read` would have failed.

ericguedespinto

[13:58](#msg5dee52fa9319bb5190086567)fair point and the error does refer to reset-buffer.  
If I delete the entry 65, it goes on so it's not running out-of-memory, but it could be a bug with memory-management (reset-buffer)

hiiamboris

[13:58](#msg5dee531f05eec2433d008f01)Indeed. I didn't mean out-of-memory, but rather memory corruption.

ericguedespinto

[13:59](#msg5dee534205eec2433d008fbe)Thanks:

hiiamboris

[13:59](#msg5dee535d6a85195b9e26fd1a)Also, older builds' (June 1st, 2019 and before) `parse-trace` is a bit different. Fails on the 1st line, returning false. `parse` stops with vector thing again on 289 line.

ericguedespinto

[14:00](#msg5dee538146397c721cb4cadc)I'll go and check on the issues if this is a possible bug worth reporting.

[14:00](#msg5dee53865506624598974834)Thanks a lot!

hiiamboris

[14:00](#msg5dee53986a85195b9e26fe89)Yes, please raise an issue about it :)

[14:01](#msg5dee53a926eeb8518f917700)And refer to this chat there.

[14:02](#msg5dee53e0c3d6795b9f4f7a3d)Thanks for finding a reproducible case :)  
As a temporary solution, I suggest you split the input on double line breaks, and parse each entry separately.

## Tuesday 10th December, 2019

greggirwin

[01:57](#msg5deefb7ed64a052fb6e8a86a)Thanks for the analysis all. Good find.

## Wednesday 11st December, 2019

bubnenkoff

[08:49](#msg5df0ada3e726562301249833)Could you help me? Why is false?

```
a: "<app><div><title>Hello</title></div></app>"
alphabet: charset [#"a" - #"z" #"A" - #"Z" #"0" - #"9"]
tg: [any [#"<" opt "/" thru #">"]]
>> parse a [any tg | skip any alphabet]
== false
```

[08:51](#msg5df0ae187d382b523f59bdb1)And what difference between:

```
parse a [any tg | skip [any alphabet] ]
```

and

```
parse a [any tg | skip any alphabet]
```

?

hiiamboris

[09:20](#msg5df0b4c4c6ce6027eb9ffbb3)`[any tg | skip any alphabet]` &lt;- how do you understand this rule? what should it do, in your opinion?

endo64

[09:26](#msg5df0b63b2bca3016aa5e4241)You can also add `a:` just before the `skip` and `b:` after the `alphabet`, then see what a &amp; b shows you to understand where parsing stuck.

bubnenkoff

[09:37](#msg5df0b8e1072446515d889963)&gt; `[any tg | skip any alphabet]` &lt;- how do you understand this rule? what should it do, in your opinion?

Accept any tag or skip any alphabet

endo64

[09:41](#msg5df0b9d155d9392300ef7d35)`skip` doesn't work that way. Hint `5 skip` skips 5 characters.

bubnenkoff

[09:48](#msg5df0bb800995661eb8c75133)@endo64

```
>> parse a [any tg | a: skip [any alphabet] b: ]
== false
>> a
== "<app><div><title>Hello</title></div></app>"
>> b
*** Script Error: b has no value
*** Where: catch
*** Stack:
```

rebolek

[10:09](#msg5df0c05455d9392300efa8c2)@bubnenkoff  
`[any tg | whatever]` will accept any number of tags. Any is zero or more, so basically anything is fine for this rule. That means that the alternate rule is never checked.

bubnenkoff

[14:42](#msg5df10072072446515d8ab2d1)is there any pro/const of debugging with `print` or `parse-trace`?

[14:52](#msg5df102b20995661eb8c95977)I still can't understand how to debug code:

```
parse-trace a [any tg skip [any alphabet] ]
```

Could you show me an example?

[15:01](#msg5df104e155d9392300f1b6b7)&gt; `skip` doesn't work that way. Hint `5 skip` skips 5 characters.

Am I right understand that my rule do not work because `any alphabet` return `true` on first symbol and do not moving forward because "Repeat rule zero or more times until failure or if input does not advance"?

[15:16](#msg5df108592cc1b31e34fed509)

```
>> parse a [[any tg q: skip thru alphabet] ]
== false
>> q
== "Hello</title></div></app>"
```

or

```
>> parse a [[any tg q: skip thru any alphabet] ]
== false
>> q
== "Hello</title></div></app>"
```

Why it's not skipping thru alphabet?

hiiamboris

[15:23](#msg5df109f9f1cc6c27ea2fc492)@ericguedespinto I made the ticket https://github.com/red/red/issues/4184

[15:27](#msg5df10ae72bca3016aa60a378)@bubnenkoff perhaps programming is just not your thing? or at least not yet ☺

dander

[19:05](#msg5df13de8ce2b2e652bbb6b51)@bubnenkoff a few comments on `tg: [any [#"<" opt "/" thru #">"]]`  
The way `any` works is if the input matches the rule, it will advance the input until it stops matching, then it will move to the next rule. If you have `any rule1 rule2`, rule1 will always match, then parse will advance to rule2. If you have `any rule1 | rule2`, rule2 will never be hit because `any rule1` never fails

[19:05](#msg5df13e11ac14cc652c67e35f)`skip` is sort of like `.` from regex

GiuseppeChillemi

[22:29](#msg5df16db3e47fb31eb7970a21)@bubnenkoff  
&gt;&gt; `parse a [[any tg q: skip thru alphabet] ]`

Why are you using double square brackets ?

[22:37](#msg5df16fb7ce2b2e652bbcd80d)@bubnenkoff

```
parse-trace a [any tg skip [any alphabet] ]
```

Your parse istructions:

```
any tg  ;<---  right associative. It's argument is "tg" 
skip ;<--- no associative or  left associative: skip = skip one position; 5 skip = skip 5 positions.
```

```
skip [any alphabet] ;skip open position [any alphabet] is not a SKIP argument
```

[22:42](#msg5df170ddc6ce6027eba5583a)@dander  
&gt;&gt; The way any works is if the input matches the rule, it will advance the input until it stops matching, then it will move to the next rule.

So, if `any` will match until the END position, the next rules will receive END as start position ?

hiiamboris

[22:49](#msg5df172760616d6515e221518)Yes.

GiuseppeChillemi

[23:02](#msg5df17585072446515d8e1fde)\*skip open position = skips one position

## Thursday 12nd December, 2019

bubnenkoff

[08:18](#msg5df1f7d442784416abd2a359)

```
>> parse a [any tg to tg e: ]
== false
>> e
== "Hello</title></div></app>"
```

Why `e` not:

`"` ?

GiuseppeChillemi

[08:29](#msg5df1fa590995661eb8d04769)The first ANY has eaten all your tags. Then, TO TG has noting to process.

bubnenkoff

[08:30](#msg5df1faa60616d6515e259e3c)Why it's not stopped on `Hello`?

GiuseppeChillemi

[08:31](#msg5df1faedc6ce6027eba8fc0d)Pardon, I have not read properly your post

[08:32](#msg5df1fb192bca3016aa671503)First any fails

[08:32](#msg5df1fb3b2cc1b31e34055244)The you ask TO TG to move just before the first tag

[08:33](#msg5df1fb4a0995661eb8d04e2c)Then you set the input there

[08:36](#msg5df1fc0a2bca3016aa671bd6)ANY checks the first character of the string. It won't advance as it fails immediately. Remember, it advances if it finds something matching its argument and until it fails.

bubnenkoff

[08:37](#msg5df1fc52e47fb31eb79ad328)&gt; First any fails

Why?!

GiuseppeChillemi

[08:39](#msg5df1fcb1ce2b2e652bc0a58e)Pardon, I have not used the proper words.

[08:42](#msg5df1fd7df1cc6c27ea3643d7)First ANY does not find a TG, so it stops searching immediately. It won't fail, it returns true.

bubnenkoff

[08:45](#msg5df1fe2c7ce7ea1e356dc7ab)%) "First ANY does not find a TG"

```
>> probe a
"<app><div><title>Hello</title></div></app>"
```

So it should find TG:

```
>> tg
== [any [#"<" opt "/" thru #">"]]
```

GiuseppeChillemi

[09:07](#msg5df20352ce2b2e652bc0d7d7)Ok, found the my mistake. I have not seen the original A

[09:11](#msg5df2044c7d382b523f6333ef)\*my

[09:16](#msg5df2057755d9392300f8c896)Try to remove ANY from TG definition and the outher square brackets.

[09:20](#msg5df2067355d9392300f8cfad)I suppose the inner ANY fails so TO fails immediately at the starting of HELLO. The series position remains just before H, so E: is set to it.

[09:22](#msg5df206bbc6ce6027eba95000)(please pardon any mistake, I am on mobile)

bubnenkoff

[09:22](#msg5df206e2f1cc6c27ea368bc7)No problem))

GiuseppeChillemi

[09:30](#msg5df208c4ce2b2e652bc100eb)Has it worked?

bubnenkoff

[09:32](#msg5df2093b2bca3016aa6779e7)No, but I am looking deep in tg, and trying understand what can be wrong with it

greggirwin

[09:37](#msg5df20a55e47fb31eb79b3833)@bubnenkoff it can help others if you include all the code with a question. Otherwise we have to sift messages and don't know if earlier messages contain your exact code in new versions.

bubnenkoff

[09:37](#msg5df20a6fe7265623012e54bd)@greggirwin ok!

[11:42](#msg5df22797ac14cc652c6e1ed2)How to get work skip not with chars but with words? I want to skip first tag.

```
>> a: "<app><div><title></title></div></app>"
== "<app><div><title></title></div></app>"
>> probe tg
[any [#"<" opt "/" thru #">"]]
== [any [#"<" opt "/" thru #">"]]
```

How to write it? `parse a [ skip tg ]` is skipping just first latter

GiuseppeChillemi

[12:00](#msg5df22bfbce2b2e652bc1f99a)@bubnenkoff I am still newbie at parse. Other will help but I will try to resolve your questions too.

[12:01](#msg5df22c2ff1cc6c27ea37930f)Note, you can use parse-trace instead of parse to debug your rules. It is very helpful.

bubnenkoff

[12:10](#msg5df22e377d382b523f64512e)The docs says that skip have args:

```
ARGUMENTS:
     series       [series! port!] 
     offset       [integer! pair!]
```

But I can't understand how to pass them. Or it's impossible?

meijeru

[12:15](#msg5df22f6b7ce7ea1e356f2360)There is a built-in function `skip` which you can use in "normal" Red programming, and there is a `skip` word in the \_parse dialect_ . These are not to be confused. Concerning the use of Red values (including words) in dialects, may I refer to the spec document, \[section 2.5](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#25-dialects).

bubnenkoff

[12:28](#msg5df232872bca3016aa68a008)I should know the dictionary of every dialect to prevent confusing?

meijeru

[12:40](#msg5df23529e7265623012f8c10)Only the ones you use... But yes, Red is rich and there is much to learn if you want to use it to advantage.

bubnenkoff

[12:54](#msg5df2386a42784416abd48a31)So if `skip` (correct me if I am wrong) in parse dialect works not as I expected I should create new own word with proper behavior?

meijeru

[13:03](#msg5df23a870616d6515e276456)You should first learn how skip works in parse dialect. And what is, according to you, proper behaviour?

bubnenkoff

[13:09](#msg5df23c020616d6515e277072)By the docs it can skip only series. Do I understand docs correctly?

GiuseppeChillemi

[13:47](#msg5df244ff55d9392300fa887c)String series and block series. I don't know if you can parse other series too, just try.

meijeru

[14:57](#msg5df2554e42784416abd55a43)"skipping series" applies to "normal" Red programming. `skip` in parse applies to elements of the string being parsed. Plese stop confusing the two.

bubnenkoff

[15:10](#msg5df2586de726562301308f8c)@meijeru where can I read it? Or you use your experience when answering?

meijeru

[15:22](#msg5df25b38ce2b2e652bc37635)The best description of Parse is \[here](http://www.red-lang.org/2013/11/041-introducing-parse.html)

GiuseppeChillemi

[17:32](#msg5df2799c42784416abd669c3)@bubnenkoff Dmitry consider `PARSE` having its own language. It has similarities with Red but words work differently. `Skip` in parse is `SKIP` where  is an integer and optional.

dander

[17:58](#msg5df27fafac14cc652c70bfc0)@bubnenkoff

```
>> a: "<app><div><title></title></div></app>"
== "<app><div><title></title></div></app>"
>> tg: [#"<" thru #">"]
== [#"<" thru #">"]
>> parse a [tg mark:]
== false
>> mark
== "<div><title></title></div></app>"
```

GiuseppeChillemi

[18:22](#msg5df2855e0616d6515e298bb9)I have read that `IF` \*evaluate the Red expression\*, could the success of a rule be evaluated with or without moving the input ?

[18:24](#msg5df285c62bca3016aa6b0852)I mean something like `IF [RULE] then [RULE]` or `THEN (code)`.

dander

[18:25](#msg5df2862fac14cc652c70ecfa)@GiuseppeChillemi if you want to check for a rule without advancing the input, you can use `ahead rule`

GiuseppeChillemi

[18:38](#msg5df2891c578ecf4b1f90ce9c)@dander could you please show me an example of alternate rule evaluation path taken after and ahead check and setting a word to true after a successful ahead match ?

dander

[18:46](#msg5df28b1e2bca3016aa6b2f3f)@GiuseppeChillemi, Advent of code has had some good parse challenges. \[This one](https://github.com/dander/advent-of-code/blob/master/2016/day-7.red) had some `ahead` usage, though I'm not sure if it's the sort of example you are looking for

hiiamboris

[19:28](#msg5df294d70dc628523e24b97e)&gt; I mean something like `IF [RULE] then [RULE]` or `THEN (code)`.

`opt [rule (code)]` or `opt [ahead rule (code)]` depending on your needs

GiuseppeChillemi

[19:36](#msg5df296be0dc628523e24c6f2)@hiiamboris I am experimenting with this.

[19:37](#msg5df296eec6ce6027ebad732f)A simple question:

is there any difference between:

`parse "a b c" [e: any ["a b c"]]` and `parse "a b c" [any e: ["a b c"]]` ?

[19:39](#msg5df297772bca3016aa6b89c1)I understand that the index is set before `any` in the first example but if you put the set word between ANY and the rule, is `e` set multiple times ? Is the set just one ?

hiiamboris

[19:48](#msg5df29987e47fb31eb79f3676)&gt; parse "a b c" \[any e: \["a b c"]]

Same as `parse "a b c" [[any e:] ["a b c"]]`

GiuseppeChillemi

[20:33](#msg5df2a428ce2b2e652bc59133)In my example the first E is set before...

## Monday 16th December, 2019

bubnenkoff

[09:26](#msg5df74db442784416abf6eec5)Could anybody show an example of: "`:word` : resume input at the position referenced by the word"

toomasv

[10:21](#msg5df75a912cc1b31e3429a1a3)@bubnenkoff Silly example:

```
>> parse str: "This is get-word example" [some [" " s: | "get-word" :s change "g" "s" | skip]]
== true
>> str
== "This is set-word example"
```

bubnenkoff

[13:57](#msg5df78d667d382b523f892878)I have got function:

```
>> f: t: func [w][print ["--> " w " <--"]]
```

I want to call it when I will be on "bb" in next code:

```
>> parse "aabbcc" ["aa" s: "bb" (f s) "cc"]
```

But I am getting:  
`--> bbcc <--`  
But I need  
`--> bb <--`

pekr

[14:04](#msg5df78ee8578ecf4b1fb32452)Because your `s:` is just a marker of the position in the while string. Try to use something like `parse "aabbcc" ["aa" s: "bb" e: (f copy/part s e) "cc"]`

[14:06](#msg5df78f49c6ce6027ebcfb7a5)Simply using two markers, at the start position, and the end of the position and copying what's between them ....

bubnenkoff

[14:06](#msg5df78f5b2cc1b31e342b44f5)Thanks!

pekr

[14:06](#msg5df78f807d382b523f893b82)Or you can modify your func to accept two params and do a copy/part in terms of your function, to keep a parse call a bit cleaner.

bubnenkoff

[14:07](#msg5df78fabdbf24d0becfcc170)`f: func [a b][print ["--> " a b " <--"]]` ?

[14:10](#msg5df7903f0616d6515e4bea48)Am I right understand that parse \*always* to process parsing by single symbol?

pekr

[14:10](#msg5df790407d382b523f8943af)copy/part a b, or it will print two string "bbcc" and "cc" imo

[14:12](#msg5df790bd2bca3016aa8cf9c6)Yes, you are mostly correct. You can use `skip` for that as an alternate rule. But parse also can move "faster", using `to` or `thru`keywords. In R3 and Red (in contrast to R2), something like `to [a | b | c]` should work too. But beware, what you get. Do some printing like you already do, that keeps you learning ....

bubnenkoff

[14:15](#msg5df79187578ecf4b1fb33f0c)@pekr Do you mean by `a` and `b` start and end (like `s`, `e`)?  
I can't understand the last idea about "you can modify your func to accept two params and do a copy/part in terms of your function, to keep a parse call a bit cleaner."

[14:19](#msg5df7926df1cc6c27ea5c9027)

```
>> parse "aabbcc" ["aa" s: "bb" e: (f copy/part s e) "cc"]
*** Script Error: f is missing its b argument
```

Oldes

[14:34](#msg5df795df2cc1b31e342b7951)

```
f: func [a b][print ["--> " copy/part a b " <--"]]
parse "aabbcc" ["aa" s: "bb" e: (f s e) "cc"]
```

pekr

[14:34](#msg5df79603ac14cc652c93a605)exactly like that ....

Oldes

[14:52](#msg5df79a3942784416abf94d59)@bubnenkoff but in real life, you would probably used this instead:

```
>> parse "aabbcc" ["aa" copy b "bb" (probe b) "cc"]
"bb"
== true
>> b
== "bb"
```

[15:13](#msg5df79efd7d382b523f89b2a6)@bubnenkoff for example this raw-example of data mining:

```
page: read https://medium.com/topic/visual-design
parse page [
	some [
		thru {<h3 class="ap} thru {>} [
			{<a href="} copy url to {"}
			thru {>} copy text to {</a}
			( print [text lf url lf] )
			| 1 skip
		]
	]
]
```

bubnenkoff

[15:13](#msg5df79f30e72656230154c2bd)Why instead of quotes used `{}`?

ne1uno

[15:19](#msg5df7a0920dc628523e46eaa6)so you won't have to escape the double quote

bubnenkoff

[15:19](#msg5df7a09c7d382b523f89c01b)When we are writing:

```
parse "aabbcc" ["aa" s: "bb" e: (print copy/part e s)]
```

How Red understand that `e` is data and `s` is digit?  
here all explicit:

```
>> copy/part "aabbcc" 4 ; first element is data, second is index
== "aabb"
```

Oldes

[15:20](#msg5df7a0cdce2b2e652be76552)It is not a digit... it is series at given index.

[15:21](#msg5df7a0e8c6ce6027ebd03cf2)But I thought this was explained here many times already.

[15:21](#msg5df7a10e55d93923001f16dd)

```
>> s: "abc"
== "abc"
>> index? s
== 1
>> e: next s
== "bc"
>> index? e
== 2
>> copy/part s e
== "a"
```

bubnenkoff

[15:23](#msg5df7a15e2bca3016aa8d86cc)So under the hood:

```
copy/part "aabbcc" 4
```

is doing same as you shown in your example? It's move index of series?

Oldes

[15:24](#msg5df7a1c6f1cc6c27ea5d05ea)

```
>> copy/part "aabbcc" 4
== "aabb"
>> copy/part s: "aabbcc" skip s 4
== "aabb"
```

bubnenkoff

[15:27](#msg5df7a27c2bca3016aa8d8d24)So what I wrote above it's correct? That it's just shortcut?

Oldes

[15:28](#msg5df7a283c6ce6027ebd048c3)Yes

bubnenkoff

[15:28](#msg5df7a28ce72656230154de09)Thanks!

pekr

[15:31](#msg5df7a3610616d6515e4c8782)I suggest to find a Rebol/Core 2.3 manul, chapter 6 - Series - http://www.rebol.com/docs/core23/rebolcore.html

[15:32](#msg5df7a3767d382b523f89d202)One really needs to understand Redbol series principles first ....

greggirwin

[20:53](#msg5df7eeae0dc628523e4949d2)@bubnenkoff, as @pekr says, and I suggested some time ago, it will probably help for you to learn Red fundamentals outside the scope of `parse`. You're doing well, but learning how series work is key, because `parse` operates on them (though in a special way).

## Tuesday 17th December, 2019

bubnenkoff

[06:32](#msg5df8766fce2b2e652bed84d9)@greggirwin thanks! I understand, but some syntax futures confuse me. For example I have not seen any mention in docs about shortcut cut above words. I will reread docs, I hope that it will help. But it's pretty hard to thinks different and to found goog and simple examples

[07:13](#msg5df8802d7d382b523f8ffadd)Why head is print all block content, but tail is not?

```
>> d: [aa bb cc]
== [aa bb cc]
>> tail d
== []
>> head d
== [aa bb cc]
```

But the doc head is pointer to first element, so I expect that it will print not all block, but only first element

greggirwin

[07:17](#msg5df880ff2bca3016aa93bc73)Don't think of the two `copy/part` syntaxes as shortcuts, either way. It's two \*ways* to do it, either of which may be more convenient in a given circumstance. That is, sometime you know how \*many* items you want to copy, and sometimes you know a position in a series you want to copy \*to\*.

[07:18](#msg5df8812a0616d6515e52bd61)Have you used `? head` and `? tail`?

[07:19](#msg5df88168c6ce6027ebd6ac5d)To continue general series questions, we can move to the red/help room.

bubnenkoff

[07:34](#msg5df884ec42784416abfffcb5)ok, one moment I need to play with examples

greggirwin

[07:35](#msg5df8853ace2b2e652bedf38a)I posted in red/help

bubnenkoff

[14:59](#msg5df8ed530616d6515e55cd33)

```
s1: "aabbccddee"
s2: next next s1

>> copy/part s2 s1
== "aa"
>> copy/part s1 s2
== "aa"
```

Why the same result?

pekr

[15:14](#msg5df8f0b9c6ce6027ebd9d0f1)Checked the R2, the results are the same. Not sure, how the function does it internally ....

ne1uno

[15:19](#msg5df8f1ea7ce7ea1e359e2a36)use latest? try `s1: "abcdef"`

pekr

[15:19](#msg5df8f202578ecf4b1fbd2f57)We would have to study series.reds file, copy function source. Can't read the code properly to find out, why it is so like that ...

bubnenkoff

[15:20](#msg5df8f23cac14cc652c9d3c50)&gt; use latest? try `s1: "abcdef"`

please explain what I should to try? Just single string?

ne1uno

[15:21](#msg5df8f27cac14cc652c9d3e06)you're not using a good test string to see what is going on

greggirwin

[21:56](#msg5df94f1edbf24d0bec0990a2)@bubnenkoff I responded in red/help

## Wednesday 18th December, 2019

toomasv

[04:17](#msg5df9a872b1701e50ca42cdd3)Fantasy wish: `list` keyword that enable shortcut for writing e.g. `element any [separator element]` as `list element separator`.

giesse

[05:58](#msg5df9bff8c62fdf33f70f5a29)

```
>> do %topaz-parse.red
>> list: rule [element separator] [element any [separator element]]
>> topaz-parse "a,a,a,a" [list #"a" #","] 
== #"a"
>> topaz-parse "a,a,a,a" [copy list #"a" #","] 
== "a,a,a,a"
```

toomasv

[06:44](#msg5df9cab93e3f133894b55882):+1: No fantasy any more :smile:

[06:46](#msg5df9cb56c62fdf33f70fa5d5)Xmas wish granted! Thanks, Santa!

bubnenkoff

[12:15](#msg5dfa1869260751301ccc50b6)Why next code always stops on second value:

```
alphabet: charset [#"a" - #"z" #"A" - #"Z" #"0" - #"9"]
tg: [{<}  opt {/} thru {>} opt lf] 
parse-trace a [any tg some alphabet any tg]
```

data for parsing:

```
a: {<root>
<lots>
<lot>
<name>Foo1</name>
<price>100</price>
</lot>
<lot>
<name>Bar1</name>
<price>202</price>
</lot>
</lots>
</root>}
```

it will always stops on 100. If remove it, it will stop on `Bar1`

pekr

[12:45](#msg5dfa1f5fb1701e50ca45f7d5)I don't use opt parse directive myself and can't follow your code properly (have just few minutes to react), but if you use any/some, you should enclose the rest in the block, to make it iterative - something like :

`parse a [any [s: tg e: (print ["tag:" copy/part s e]) | s: some alphabet e: (print ["txt: " copy/part s e])| skip]]`

[12:45](#msg5dfa1f758dfce538b5ca1a0a)not sure why it prints empty line, it comes from the tag rule ....

[12:47](#msg5dfa1fd83e3f133894b799de)

```
>> tg: [{<}  opt {/} thru {>}] 
== ["<" opt "/" thru ">"]
>> parse a [any [s: tg e: (print ["tag:" copy/part s e]) | s: some alphabet e: (print ["txt: " copy/part s e])| skip]]
tag: <root>
tag: <lots>
tag: <lot>
tag: <name>
txt:  Foo1
tag: </name>
tag: <price>
txt:  100
tag: </price>
tag: </lot>
tag: <lot>
tag: <name>
txt:  Bar1
tag: </name>
tag: <price>
txt:  202
tag: </price>
tag: </lot>
tag: </lots>
tag: </root>
== true
```

[12:49](#msg5dfa2050260751301ccc89da)Removing the "debugging" print info: `parse a [any [tg | some alphabet| skip]]`

bubnenkoff

[12:56](#msg5dfa21f044e1fb33f6e988d0)"but if you use any/some, you should enclose the rest in the block"  
@pekr so it's rule do not work?

```
parse a [any tg some alphabet any tg ]
```

pekr

[13:05](#msg5dfa24038897197969b9c973)Your rule does work in a specific way. It is basically 3 rules, followed one after each other. So first it tries to identify any tag. It works so far, as there is any tag. What if your string would start with text? It would fail right there and not print anything ....

[13:06](#msg5dfa2459d2dadb389339f873)`any [a | b | c]`simply means - repeat zero or many times, `a`or `b`or `c`

bubnenkoff

[13:09](#msg5dfa24f3e0131f50c9657dfe)@pekr big thanks!

pekr

[13:36](#msg5dfa2b57c62fdf33f7125655)Just keep your work, parse is great. Once you grasp it, it is going to be a very useful tool for you!

greggirwin

[21:09](#msg5dfa95918dfce538b5cd80f8)Thanks for assisting @pekr !

pekr

[22:08](#msg5dfaa361c62fdf33f715a8be)It was just a luck, I got it kind of working at first try :-) But also a refreshing reminder how good tool parse can be ....

## Thursday 19th December, 2019

bubnenkoff

[10:35](#msg5dfb525f0cb24d1d44e6efaf)My `tg` is described as:

```
["<" opt "/" thru ">" opt lf]
```

I can't understand why next rule do not work with data:

```
a: {<root>
<lots> 
</lots>
</root>}
```

I am still debugging with `parse-trace` because I do not see how print can help me here.

```
parse-trace a [any [tg | some alphabet | tg ] ]
```

If I add `skip` at end of rule all works. But I do not understand whats it's does

[10:39](#msg5dfb536ccf771f7708f45d83)As I understand it should moving line by line because every line is `tg`. And this part of rule should not works: `some alphabet | tg`

hiiamboris

[10:42](#msg5dfb5405c62fdf33f71a29c1)Look closer here ☻:

```
>> a: {<root>
{    <lots> 
{    </lots>
{    </root>}
== {<root>^/<lots> ^/</lots>^/</root>}
```

bubnenkoff

[10:43](#msg5dfb543d44e1fb33f6f1934e)The space?!

hiiamboris

[10:43](#msg5dfb5443d2dadb389342089d)Yep :)

bubnenkoff

[10:43](#msg5dfb544ec62fdf33f71a2aec)omg! Thanks!!

[10:45](#msg5dfb54e58897197969c1c000)@hiiamboris is it good to write tg as:

```
tg: [{<}  opt {/} thru {>} opt lf opt space]
```

?

hiiamboris

[10:58](#msg5dfb57ecc0c8ef301bdac2d8)you might have a space before newline, or a few spaces ;)

[10:59](#msg5dfb5804d2dadb3893422710)or a number of newlines ;)

pekr

[11:24](#msg5dfb5de30cb24d1d44e73b80)Why are you adding lf there at all? I have showed you a working example, removing exactly that element. If you want to skip anything else, just use - skip :-)

[11:25](#msg5dfb5e168dfce538b5d292ba)`parse a [any [tg | some alphabet| skip]]`

bubnenkoff

[11:36](#msg5dfb60d33e3f133894c0181d)Yes, now I understanding why you have add `skip`, but till I am learning I want to declare all explicitly

pekr

[11:39](#msg5dfb616a8dfce538b5d2ab0e)well, if you want to cover all possible cases, you should add more than one possibiliy of space or a newline

[11:40](#msg5dfb6194260751301cd4ecff)something like any \[lf | space], or creating a bitset callled spacers, containing various options

GiuseppeChillemi

[11:48](#msg5dfb6393c62fdf33f71a9512)@bubnenkoff If I remember correctly when working in block mode, space is not considered. So when you will use parse in that way you should remember this.

pekr

[11:55](#msg5dfb651b260751301cd50671)He uses a string mode though ....

GiuseppeChillemi

[14:19](#msg5dfb86f9cf771f7708f5be0d)@pekr I am giving him the information that when he will try block mode there will be this difference. I have learned that if you are not informed of rules changes you will try to use the old one in similar contexts.

bubnenkoff

[14:45](#msg5dfb8d0c8897197969c33982)@GiuseppeChillemi block mode is wrapping brackets like: `a: { ... }`?

pekr

[14:51](#msg5dfb8e608dfce538b5d3e9ac)No, what you mention is a string mode. "This is a string" is equivalent to {This is a string}, those curly braces allow you to use multiline strings, eg. in console ....

[14:51](#msg5dfb8e6e0cb24d1d44e898d6)\[This is a block mode]

[14:52](#msg5dfb8e9349314a1d45a60e20)Parsing blocks and dialects: http://www.rebol.com/docs/core23/rebolcore-15.html#section-9

greggirwin

[17:48](#msg5dfbb7dacf771f7708f714d7)@bubnenkoff

```
>> a: {<root>^/<lots> ^/</lots>^/</root>}
== {<root>^/<lots> ^/</lots>^/</root>}
>> b: load a
== [<root> 
    <lots> 
    </lots> 
    </root>
]
>> parse b [some tag!]
== true
```

[17:48](#msg5dfbb7fcc0c8ef301bdd6898)The catch is that your data needs to be valid Red. Don't expect to `load` any random input and have it work.

dander

[17:59](#msg5dfbba8bb1701e50ca50fdcc)@bubnenkoff I would suggest removing the whitespace from your `tg` definition, unless it really is part of the tag. Then in the rule which contains `tg`s, you can define where your whitespace can appear. For example, instead of using `| skip` (which is like "something else can appear here, but I don't know what"), you could have `| some whitespace`

[18:02](#msg5dfbbb27b1701e50ca5101d3)`whitespace: [crlf | lf | cr (print "how old is this text file?!") | tab | space]`

[18:04](#msg5dfbbb92c62fdf33f71d073c)It could have more or less than that... you would know best what the constraints on your input would be

pekr

[18:53](#msg5dfbc70ce0131f50c970ceb8)It could be also done as bitset, instead of rule.

dander

[18:55](#msg5dfbc7b5c62fdf33f71d69ee)@pekr true, unless you specifically need to match `crlf` instead of either `cr` or `lf`

pekr

[18:56](#msg5dfbc7cac62fdf33f71d6a83)Yes, you are of course right :-)

cloutiy

[21:42](#msg5dfbeec584c21677092f54cd)Hi all, I've been trying to do simple which in principle is simple enough for the last few hours, but for some reason is not giving the expected results. I would love some input on what is wrong with my rule.

The objective: a) insert

before a `#"^/"` followed by a `string!`; b) insert a

after a `string!` followed by a `#"^/"`.

For some reason only b gets done.

```
doctree: [
    [<h3> ["Preparation for Code Generation"] </h3>]
    #"^/"
    #"^/"
    {Before code can be generated, it is generally necessary tomanipulate and change the internal fprogram in some way. Runtimestorage must be allocated to variables. In FORTRAN, COMMON andEQUIVALENCE statements must be prccessed. One important pointincluded here is the optimization of the program in order toreduce the execution time of the object program.}
    #"^/"
    #"^/"
    [<h3> ["Code Generation"] </h3>]
    #"^/"
    #"^/"
    {This is the actual translation of the internal source progranminto assembly language or machine language. This is perhaps themessiest and most detailed part, but the easiest to understand.Assuming we have an internal form of quadruples as outlinedabove, we generate code for each quadruple in order. For thethree quadruples listed above we could generate, on the IBM 360,the assembly language}
    #"^/"
    #"^/"
]

parse doctree [ 
   any [ 
         to #"^/" string! insert <p>
        | thru string! #"^/" insert </p> insert <p>
        | skip ] 
  ]
```

Oldes

[21:47](#msg5dfbf008e0131f50c971f465)I'm just on mobile.. but when you have `to ..` than it does not skip thru it.. so the first line always fails. @cloutiy

hiiamboris

[21:51](#msg5dfbf0eac5a23938b44b5bdb)Also unify your alternate to/thru rules, otherwise you skip them with to/thru

cloutiy

[21:58](#msg5dfbf27d0cb24d1d44eb61c0)@hiiamboris @Oldes I just tried something after posting and got it to work. I needed to do `to [#"^/" string!]`.

[22:00](#msg5dfbf2feb1701e50ca5280e7)This is my updated rules that gets me to where I wanted to be:

```
parse doctree [ any [
         to [#"^/" string!] insert <p> to [string! #"^/"] thru [string! #"^/"] insert </p>
        | skip ]  ]

remove-each item doctree [ item = #"^/" ]
```

hiiamboris

[22:02](#msg5dfbf374c5a23938b44b7155):+1:

cloutiy

[22:06](#msg5dfbf4758dfce538b5d6bc1d)Not gonna lie. Feels kind of great to figure things out ;)

greggirwin

[22:08](#msg5dfbf4c2260751301cd9088e)I know that feeling well...some days. ;^)

## Friday 20th December, 2019

toomasv

[04:18](#msg5dfc4b9f49314a1d45ab0712)@cloutiy You can leave out `to [string! #"^/"]`.

## Monday 23th December, 2019

bubnenkoff

[11:41](#msg5e00a7cc0cb24d1d4409cabb)Why next code add line break?

```
parse a [any [s: tg e: (checktag copy/part e s ) | some alphabet | tg ] ]

checktag: func [tag] [
    if find tag "<lots>" [print [tag " - " length? tag]]
]
```

result:

```
>> parse a [any [s: tg e: (checktag copy/part e s ) | some alphabet | tg ] ]
<lots>
 -  7
== true
```

I expect: `- 7` on one line

[11:54](#msg5e00ab028897197969e4674c)it's seems that there is line break. I tried to add `trim`, but did not get result:  
`parse a [any [s: tg e: (checktag trim copy/part e s ) | some alphabet | tg ] ]`

hiiamboris

[11:56](#msg5e00ab5b8897197969e4699d)Try `? trim` ;)

bubnenkoff

[12:02](#msg5e00acea44e1fb33f614d089)thanks! is there any way to print on console nonprintable symbols like `lf`for simplify debuging?

pekr

[12:03](#msg5e00ad1bc62fdf33f73d9a4c)`print mold`

bubnenkoff

[12:04](#msg5e00ad563e3f133894e32cde)Yeah!

toomasv

[12:24](#msg5e00b1ffc62fdf33f73dbb13)Or just `probe`

bubnenkoff

[13:00](#msg5e00ba698dfce538b5f60bda)How I can continue parsing inside function?

```
parse a [thru "<lots>" s: to  "</lots>" e: (checktag copy/part s e)]

checktag: func [tag] [
    tag: trim/lines tag
    any [tg (print "hello")]
]
```

I just want to move some parsing to function. But current code do not print nothing. It's not possible or I have some error?  
data:

```
a: {<root>
<id>19160099</id>
<purchaseNumber>0373200101018000262</purchaseNumber>
<lots>
<lot>
<name>Foo1</name>
<price>101</price>
</lot>
<lot>
<name>Bar2</name>
<price>201</price>
</lot>    
<lot>
<name>Baz3</name>
<price>302</price>
</lot>
</lots>
</root>}
```

[13:44](#msg5e00c4c144e1fb33f6156dad)Am I right understand that I should not/can not delegate parse rules to separate functions?

toomasv

[14:06](#msg5e00c9d6b1701e50ca72587d)@bubnenkoff In `checktag` function there is regular Red code, not `parse` dialect. `checktag` returns the result of `any` (native!) function, not `parse` dialect\`s keyword.

pekr

[14:06](#msg5e00c9e784c21677094f5aa9)Parse rules work only inside of the parse.

toomasv

[14:08](#msg5e00ca5284c21677094f5ec3)But you can split your parse rule into several subrules and refer to these subrules in your rule.

[14:39](#msg5e00d184c62fdf33f73ea0b4)Something like this:

```
checktag: [some [not </lots> [remove [#" " | #"^/"] | skip]]] 
parse a [thru <lots> checktag </lots>] 
print a
<root>
<id>19160099</id>
<purchaseNumber>0373200101018000262</purchaseNumber>
<lots><lot><name>Foo1</name><price>101</price></lot><lot><name>Bar2</name><price>201</price></lot><lot><name>Baz3</name><price>302</price></lot></lots>
</root>
```

## Tuesday 24th December, 2019

bubnenkoff

[09:42](#msg5e01dda3e0131f50c9995e19)Big thanks! Is next rule are good written? Or it can be simplified?

```
>> parse "<bb><aa><bb><aa><aa>" [ any [to "<aa>" s: thru "<aa>" e: (print copy/part e s) ] ]
<aa>
<aa>
<aa>
```

I am trying to print all tags.

Btw @toomasv am I right understand that I can specify some letters in rules without quote mark? Like you wrote ` ` but not `""`

toomasv

[09:44](#msg5e01ddfd84c216770956b9ab)@bubnenkoff

&gt; am I right understand that I can specify some letters in rules without quote mark? Like you wrote &lt;/lots&gt; but not "&lt;/lots&gt;"

This concerns complete tags only.

```
>> print parse "<bb><aa><bb><aa><aa>" [collect any [keep <aa> | skip] ]
<aa> <aa> <aa>
>> parse "<bb><aa><bb><aa><aa>" [any [copy _ <aa> (print _) | skip] ]
<aa>
<aa>
<aa>
== true
```

bubnenkoff

[10:45](#msg5e01ec2e3e3f133894eba6ab)Thanks! What is next code doing? (from Rebol doc)

```
NAMES: copy []
```

Why name is initialize with copy?

toomasv

[10:47](#msg5e01ecd7090f137968420b7d)To be used later without being affected by other `[]` probably. Have you \[read](https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values) about importance of `copy`?

[11:20](#msg5e01f46ec0c8ef301b06a328)Consider this:

```
list: ["Abel" "Cain" "Seth"] 
add-names: func [/local names][names: [] append names list]
add-names
;== ["Abel" "Cain" "Seth"]
add-names
;== ["Abel" "Cain" "Seth" "Abel" "Cain" "Seth"]
add-names
;== ["Abel" "Cain" "Seth" "Abel" "Cain" "Seth" "Abel" "Cain" "Seth"]
;-----------
add-names: func [/local names][names: copy [] append names list]
add-names
;== ["Abel" "Cain" "Seth"]
add-names
;== ["Abel" "Cain" "Seth"]
add-names
;== ["Abel" "Cain" "Seth"]
```

bubnenkoff

[12:39](#msg5e0207133e3f133894ec59a2)I want to generate json.

```
parse "<bb><aa>123</aa><bb><aa>642</aa>" [ any [ thru "<aa>" copy x to "</aa>" (append vals x)  ] ]
```

The next code is doing similar thing:

```
>> to-json vals
== {["123","642"]}
```

But how I can create key-value pairs? For example I want to get:

```
{
	"vals": [123, 642]
}
```

pekr

[12:45](#msg5e020859d2dadb38936e75aa)You could as well use Rebolek's json codec ....

[12:47](#msg5e0208d08dfce538b5ff06df)

```
>> data: [name [123 642]]
== [name [123 642]]
>> data/name
== [123 642]
>> data/name/1
== 123
>> select data 'name
== [123 642]
>> pick select data 'name 1
== 123
```

bubnenkoff

[12:51](#msg5e0209dacf771f770820fcdd)Do I need to use external codec? It's impossime to do with default?

toomasv

[12:57](#msg5e020b220cb24d1d441333c2)You can do it the hard way :)

```
print json: rejoin collect [
    vals: [] 
    parse "<bb><aa>123</aa><bb><aa>642</aa>" [ 
        collect into vals any [ thru "<aa>" keep to "</aa>" ]
    ] 
    keep {^{^/    "vals": [} 
    forall vals [
        if not head? vals [
            insert vals comma 
            vals: next vals
        ]
    ] 
    keep rejoin vals 
    keep "]^/}"
]
{
    "vals": [123,642]
}
```

bubnenkoff

[12:59](#msg5e020bc3c0c8ef301b074292)Yes, it's a little bit hard for me now. Could you link codec?

toomasv

[13:03](#msg5e020cad3e3f133894ec81e0)`? to-json`

bubnenkoff

[13:04](#msg5e020ce9cf771f7708211344)I used help, but did not understand how to do what I want

toomasv

[13:07](#msg5e020d8db1701e50ca7af761)https://github.com/red/red/blob/master/environment/codecs/json.red

bubnenkoff

[13:10](#msg5e020e5044e1fb33f61e2794)"Rebolek's json codec"  
it's name of default codec?

toomasv

[13:12](#msg5e020ea6cf771f7708211f1c)

```
>> print to-json object [vals: [123 345]]
{"vals":[123,345]}

>> print to-json/pretty object [vals: [123 345]] "    "
{
    "vals": [
        123,
        345
    ]
}
```

[13:14](#msg5e020f20e0131f50c99ab339)May be he meant this: https://github.com/rebolek/red-tools/blob/master/codecs/json.red

[13:17](#msg5e020ffa49314a1d45d0df20)With the last (rebolek's):

```
>> print json/encode object [vals: [123 456]]
{"vals":[123,456]}
```

[13:25](#msg5e0211dab1701e50ca7b0fc2)So you could do something like this with default codec:

```
xml: "<bb><aa>123</aa><bb><aa>642</aa>" 
print to-json object [vals: parse xml [collect [any [<aa> keep to </aa> | skip]]]]
{"vals":["123","642"]}
```

[13:38](#msg5e0214ea0cb24d1d4413712a)Sorry, `copy _ to keep (load _)`

bubnenkoff

[14:34](#msg5e0221ebe0131f50c99b34a2)@toomasv what `load` is doing here?

toomasv

[14:34](#msg5e0222080cb24d1d4413d1e8)loading value from string

[14:35](#msg5e0222433e3f133894ed0fa3)With `load` it results as `{"vals":[123,642]}` instead of `{"vals":["123","642"]}`

[14:36](#msg5e02226bd2dadb38936f2ae7)`to-integer` might be used too of course

bubnenkoff

[15:07](#msg5e0229c63e3f133894ed4426)Why on the next code work only one rule, but not both?

```
prices: []
names: []
parse a [thru "<lots>" 
    collect [
         any [
           ws |
           some [ 
               collect set prices any [ thru "<price>" keep to "</price>" | skip ] 
               collect set names any [ thru "<name>" keep to "</name>" | skip ]
                ] 
        ]
    ]
 "</lots>" ]
```

result:

```
>> to-json object [_prices: :prices]
== {{"_prices":["101","201","302"]}}
>> to-json object [_names: :names]
== {{"_names":[]}}
```

data:

```
a: {<root>
<id>19160099</id>
<purchaseNumber>0373200101018000262</purchaseNumber>
<lots>
<lot>
<name>Foo1</name>
<price>101</price>
</lot>
<lot>
<name>Bar2</name>
<price>201</price>
</lot>    
<lot>
<name>Baz3</name>
<price>302</price>
</lot>
</lots>
</root>}
```

`some` and nested rules should process both of sub-rule

toomasv

[15:19](#msg5e022c6bcf771f770821f0d6)Think hard, what does the rule `any [ thru "" keep to "" | skip ]` do?  
...  
...  
Correct, it finishes through input before next one even starts.  
Here is how they work:

```
parse a [
	thru <lots> 
	some [ 
		</lots> to end
	|	collect into prices [ "<price>" keep to "</price>" ] 
	|	collect into names [ "<name>" keep to "</name>" ]
	|	skip
	] 
]

to-json object [_prices: :prices]
;== {{"_prices":["302","201","101"]}}
to-json object [_names: :names]
;== {{"_names":["Baz3","Bar2","Foo1"]}}
```

As you were warned already, `thru`-`to` pair is tricky and treacherous, especially combined with `any` or `some` quantifier.

Nomarian

[23:12](#msg5e029b4ac5a23938b477cbed)Is there a way to inherit an object?

[23:12](#msg5e029b588dfce538b502f361)I have things like digit: charset ...

[23:12](#msg5e029b62c62fdf33f74ad29c)constantly remaking such things is rather silly

greggirwin

[23:38](#msg5e02a185b1701e50ca7eec5d)

```
>> o: object [digit: charset [#"0" - #"9"]]
== make object! [
    digit: make bitset! #{000000000000FFC0}
]
>> oo: make o [alpha: charset "abc..."]
== make object! [
    digit: make bitset! #{000000000000FFC0}
    alpha: make bitset! #{00000000000200000000000070}
]
```

## Wednesday 25th December, 2019

Nomarian

[00:15](#msg5e02aa3ed2dadb3893729b32)thanks gregg!

bubnenkoff

[09:52](#msg5e0331438dfce538b506b114)@toomasv thanks! Am I right understand that I will change `collect into`to `collect set` `set` will create new variable that will be cleaned on every iteration (because it inside `some`)?

[09:55](#msg5e0331f7b1701e50ca82608d)I can't understand why with `set` `prices` is empty

[10:40](#msg5e033c95d2dadb3893762f0d)I did simple example for question above:

```
>> parse "aabbccddaa" [some [collect into b keep "aa" | skip ] ]
== true
>> b
== ["aa" "aa"]
>> 
>> parse "aabbccddaa" [some [collect set b keep "aa" | skip ] ]
== true
>> b
== ["aa"]
```

pekr

[11:14](#msg5e03449444e1fb33f6260ac0)You are right - each time you run the `some`loop, your `b`is being re-set to the actual value. I am not used to use `set`, I prefer a more freedom in terms of the paren (code).

bubnenkoff

[11:48](#msg5e034c9ad2dadb3893769003)Why is adding `thru` is breaking collecting both `price` and `names` (without `thru` both of them are collectiing)

```
id: []
prices: []
names: []
parse a [
    ; collect into id [thru "<id>"  keep to  "</id>"]
    thru "<lots>"
    any [
        collect into prices [thru "<price>"  keep to  "</price>"] |
        collect into names [ thru "<name>" keep to "</name>" ] | 
        skip
    ]
 "</lots>" ]

to-json object [_prices: :prices]
to-json object [_names: :names]

>> to-json object [_prices: :prices]
== {{"_prices":["302","201","101"]}}
>> to-json object [_names: :names]
== {{"_names":[]}}
```

I do not see any reason why it work different

[12:49](#msg5e035aecc5a23938b47c79de)Now I faced with new problem. it's seems that collect do not working woth objects:

```
data: object [
    id: [] 
    prices: [] 
    names: []
    ]
parse a [
    collect into id [thru "<id>"  keep to  "</id>"]
    thru "<lots>"
    any [
        collect into data/prices [thru "<price>"  keep to  "</price>"] |
        collect into data/names [ thru "<name>" keep to "</name>" ] | 
        skip
    ]
 "</lots>" ]

to-json object [data]
```

I am getting error:  
`Script Error: PARSE - unexpected end of rule after: collect`

[13:07](#msg5e035efa260751301c09993a)Can't edit post: `thru` above should be removed, because they are part of different question

toomasv

[13:08](#msg5e035f308dfce538b507e60a)&gt; Why is adding `thru` is breaking collecting

Because with `thru` you are jumping to next  on each iteration and second rule gets its chance only when there are no more  tags (alas, no more  tags either), but without `thru` rules are advancing orderly by little steps.

bubnenkoff

[13:09](#msg5e035f8c260751301c099ccd)so with `thru` `keep to` do not working? Mmm.... yes I see it's logic

pekr

[13:28](#msg5e0363fd260751301c09c4c6)You imo need general thru rule with options. But then I am not sure you can collect to two different blocks?

bubnenkoff

[13:39](#msg5e03667a090f1379684badff)I did not understand your idea about general rule for `thru`... If I understand Toomas correctly `keep to` working, but `thru` is force to jumping to next `price` block

[13:46](#msg5e03681cc5a23938b47cd2f9)&gt; Now I faced with new problem. it's seems that collect do not working woth objects:  
&gt;

```
> data: object [
>     id: [] 
>     prices: [] 
>     names: []
>     ]
> parse a [
>     collect into id [thru "<id>"  keep to  "</id>"]
>     thru "<lots>"
>     any [
>         collect into data/prices [thru "<price>"  keep to  "</price>"] |
>         collect into data/names [ thru "<name>" keep to "</name>" ] | 
>         skip
>     ]
>  "</lots>" ]
> 
> to-json object [data]
>
```

&gt;  
&gt; I am getting error:  
&gt; `Script Error: PARSE - unexpected end of rule after: collect`

I found one way to do what I need. But if anybody will show how to work with `collect into object` I will be thankful.  
working code:

```
[ "<price>"  copy price to  "</price>"] (append data/prices price ) |
```

pekr

[13:51](#msg5e03694d090f1379684bc19c)I have never used `collect`myself, am mentally stuck with the R2 parse and doing stuff in parens, like you just did :-), but here's the code, which seems to work:

```
id: [] 
prices: [] 
names: []

parse a [
    collect into id [thru "<id>"  keep to  "</id>"]
    thru "<lots>"
    any [
       thru [
           "<price>" collect into prices keep to "</price>"
         | "<name>"  collect into names  keep to "</name>"
       ] | skip
    ]
 to end
]
== true
>> id
== ["19160099"]
>> prices
== ["302" "201" "101"]
>> names
== ["Baz3" "Bar2" "Foo1"]
```

[13:53](#msg5e0369ead2dadb3893774df5)1) I made a `thru`an alternating rule. Not two of them, just one with options. 2) the problem also seems to be your objects. It seems parse can't use something like `collect into data/prices`, most probably it considers it being a path. When I moved those subobjects from the `data`object, it seems to work ....

toomasv

[15:12](#msg5e037c61260751301c0a65b2)As far as I know, paths are not supported by `parse` yet.

pekr

[15:25](#msg5e037f6d3e3f133894f5c3e5)Maybe you could use some bind trickery to get those blocks being part of the object :-)

bubnenkoff

[15:43](#msg5e03839dc5a23938b47d8bfc)Heh, I got more complex problem. Now I am trying to find solution. I need to get next data structure:

```
{{"id":["19160099"],"lots":[ {name: "", price: "" } ] }}
```

Without creation nested object I would not able to access to elements by name. So I should write something like:

````
data: object [
    id: [] 
	lots: object [
        prices: [] 
        names: []		
	]
   ]
 ```
but `to-json` generate `lots` not as array, but as dict:
````

{{"id":\[],"lots":{"prices":\[] ,"names":\[] }}}  
\`

I will continue in next day, but could you give any advice what I should to try? Maybe some methods for object?

toomasv

[16:08](#msg5e0389838dfce538b5090f24)@bubnenkoff How about this:

```
id: [] coll: [] 
parse a [
    collect into id [
        thru <id> keep to </id>
    ] 
    thru <lots> 
    collect into coll any [
          </lots> to end 
    |     <price> copy p to </price> thru <name> copy n to </name> 
          keep (object compose [price: (p) name: (n)]) 
    |     skip
    ]
]
to-json object compose/only [id: (id) lots: (coll)]
;== {{"id":["19160099"],"lots":[{"price":"101","name":"Bar2"},{"price":"201","name":"Baz3"}]}}
```

cloutiy

[16:12](#msg5e038a6a090f1379684c997d)Hello reducers, here with another question. But first, I just want to say how amazing the world becomes once you start to understand Red/Rebol and parse a bit more!

Now the question. I ran `parse` on a text file using `collect` to give me a `block!`. The output is as follows.:

```
[
 chapter "Title" 
p ["Some text with @i[inline @b[formatting]]"] 
p ["Another paragraph"] 
h2 "A Level 2 Heading"
]
```

What I'd like to do now is run this block through a second `parse`, using different rules. Specifically the `block!` following `'p` is just a `string!`. What I want to do is find every sequence of `'p block!` and `parse` the `string!` that is in the block, then replace that block with the result of parsing its contents (collected using `collect`.)

Is this where one would use `into`? Something along the lines of:

```
parse doctree rules: [
   'p mark: into block! (
         poke mark parse mark collect [ 
              the.rules.to.parse.the.paragraph.string ] )
]
```

Overlooking the details of my crude example, is the the general idea?

hiiamboris

[16:15](#msg5e038b2a090f1379684ca0c4)`ahead block! change into [set s string!] (do something with s, return new result)`

[16:17](#msg5e038b8dc62fdf33f750cecc)or `ahead block! into [set s string! (modify s buffer in place)]` if you still need the block

toomasv

[16:29](#msg5e038e633e3f133894f62707)@bubnenkoff How to get all three pieces correct? Homework for you.

cloutiy

[18:29](#msg5e03aaa544e1fb33f628a27b)@hiiamboris thanks for that. that gives me something to experiment with. I do want to keep the block, but I was going to use collect to collect the result of the parse, and then replace the original block altogether. Well at least that's how I imagined doing it with my current level of knowledge/comfort. I'm sure I'll make a few mistakes along the way. But that's te best way to learn!

hiiamboris

[18:36](#msg5e03ac243e3f133894f6e5c0)Indeed ;)

## Thursday 26th December, 2019

bubnenkoff

[07:08](#msg5e045c85cf771f7708303169)@toomasv Red is awasome! Every day I am starting with "Wow!". Thanks I will try your and maybe some other approach!

[11:59](#msg5e04a08de0131f50c9ab592d)@toomasv after some attempts I did:

```
data: object [
    id: [] 
	lots: [ 
	]
   ]
   
parse a [
       thru "<lots>"
       collect any [
           "<price>" copy p to "</price>" thru "<name>" copy n to "</name>" ( append data/lots object compose [ price: (p) name: (n) ] ) | skip
       ]
        "</lots>" 
    ]

to-json data
```

Not sure if it's better that yours, but at last I did it myself)

toomasv

[12:02](#msg5e04a1443e3f133894fd1fae):+1: BUT, the result is still `{{"id":[],"lots":[{"price":"101","name":"Bar2"},{"price":"201","name":"Baz3"}]}}`, whitch is not correct result. Homework exercise still not done :) You should get

```
[{"price":"Foo1","name":"101"},{"price":"Bar2","name":"201"},{"price":"Baz3","name":"302"}]
```

And you don't need `collect` if you are not keeping anything.

[12:13](#msg5e04a3cd49314a1d45e19d72)Also, try to run your parse several times. See what happens to data.

bubnenkoff

[13:09](#msg5e04b123d2dadb38937f89af)Yes, I have seen it :( I read about copying, but still not fully understand. Need more time for my mind. Because I do not simply copy-past without understanding.  
Look. I have next data structure. And I need to fill it.

```
data: object [
    id: [] 
    lots: [
    maxPrice: []    
    purchaseObjects: [ 
        ]
    ]
   ]
```

```
append data/lots/purchaseObjects object compose [ price: (2 + 2) name: ("Mike") ]
```

But I am getting:

```
make object! [
    id: []
    lots: [
        maxPrice: [] 
        purchaseObjects: [make object! [
            price: 4
            name: "Mike"
        ]]
    ]
]
```

I do not need `make object!` here...

toomasv

[13:37](#msg5e04b7abc62fdf33f7586b0c)@bubnenkoff

&gt; I do not need `make object!` here...

Hmm.. What can I say... don't make it then.

bubnenkoff

[13:38](#msg5e04b7cdcf771f770832824e)Is `to-json to-block data` good idea?

toomasv

[13:40](#msg5e04b83dc5a23938b4855517)You mean, to get something like this?:

```
{["id:",[],"lots:",["maxPrice:",[],"purchaseObjects:",[{"price":4,"name":"Mike"}]]]}
```

bubnenkoff

[13:40](#msg5e04b859260751301c126228)Yes

toomasv

[13:41](#msg5e04b8848897197969ff1f16)Don't make your data `object`. Everything else is same.

bubnenkoff

[13:47](#msg5e04b9d549314a1d45e21f9c)it's seems that I should use `to-block` in my code, because in my variant of code I use `object compose` for creation `{"price":4,"name":"Mike"}`. But now it's not problem for me. This function is dowing what I want

toomasv

[13:49](#msg5e04ba83c5a23938b485656d)I meant you can use `data`as block if you don't want it to be object:

```
data: [
    id: [] 
    lots: [
    maxPrice: []    
    purchaseObjects: [ 
        ]
    ]
   ]
```

[13:52](#msg5e04bb2dc5a23938b4856a9d)Why bother making it object if you'll convert it into block at once?

[13:54](#msg5e04bbade0131f50c9ac039c)&gt; Yes, I have seen it :( I read about copying, but still not fully understand. Need more time for my mind. Because I do not simply copy-past without understanding.

:+1: Good attitude! And it's definitely about copying. (And ordering your parse rules.)

bubnenkoff

[13:59](#msg5e04bcd5e0131f50c9ac0b5b)@toomasv object is needed to get correct json. Look:

```
a: {<root>
<id>19160099</id>
<purchaseNumber>0373200101018000262</purchaseNumber>
<lot>
<maxPrice>8186313.66</maxPrice>
<purchaseObjects>
    <purchaseObject>
    <name>Foo1</name>
    <price>111</price>
    </purchaseObject>
    <purchaseObject>
    <name>Bar2</name>
    <price>222</price>
    </purchaseObject>
    <purchaseObject>
    <name>Baz3</name>
    <price>333</price>
    </purchaseObject>        
</purchaseObjects>
</lot>
</root>}
```

```
data: [
    id: [] 
    lots: [
    maxPrice: []    
    purchaseObjects: [ 
        ]
    ]
   ]

parse a [
       thru "<id>" copy id to "</id>" (append data/id id )
       thru "<purchaseObjects>"
       collect any [
           "<price>" copy p to "</price>" thru "<name>" copy n to "</name>" ( append data/lots/purchaseObjects object compose [ price: (p) name: (n) ] ) | skip
       ]
        "</purchaseObjects>" 
    ]

write %file.txt to-json data
```

I am getting wrong result:

```
["id:",["19160099"],"lots:",["maxPrice:",[],"purchaseObjects:",[{"price":"111","name":"Bar2"},{"price":"222","name":"Baz3"}]]]
```

`"id:",["19160099"],` instead of `"id:": ["19160099"],`etc

toomasv

[14:01](#msg5e04bd40260751301c128495)Then why did \[you answer "Yes"](https://gitter.im/red/parse?at=5e04b859260751301c126228) to my question? ;)

bubnenkoff

[14:04](#msg5e04bdddc0c8ef301b18ba58)Oh sorry, I did not noticed the difference there

toomasv

[14:05](#msg5e04be22c5a23938b48583d4)With your `to-block` the result would be exactly if as you made `data` into a block in the first place.

bubnenkoff

[14:05](#msg5e04be35cf771f770832b1cf)thanks!

toomasv

[14:06](#msg5e04be7b0cb24d1d44247cc7)You are welcome!

[14:14](#msg5e04c05e0cb24d1d4424898f)@bubnenkoff Try this:

```
data: object [
    id: [] 
    lots: [
        maxPrice: []    
        purchaseObjects: []
    ]
]
parse a [
    (clear data/id clear data/lots/purchaseObjects)
    thru "<id>" copy id to "</id>" (append data/id id )
    thru "<purchaseObjects>"
    collect any [
        "<name>" copy p to "</name>" thru "<price>" copy n to "</price>" ( 
            append data/lots/purchaseObjects object compose [ price: (p) name: (n) ] 
        ) 
    | skip
    ]
     "</purchaseObjects>" 
]
probe to-json data
```

## Friday 27th December, 2019

bubnenkoff

[08:02](#msg5e05ba830529860498f421ff)@toomasv thanks!

[13:33](#msg5e060818b4ed68096ee9024d)Is there any principle difference between:

```
parse "<bb><aa><bb><aa><aa>" [any [copy _ <aa> (print _) | skip] ]
```

and

```
parse "<bb><aa><bb><aa><aa>" [any [to _ <aa> (print _) ] ]
```

or absolutely same? The output is same. I checked

hiiamboris

[13:48](#msg5e060b9b6ff7ae03fc579b16)Try 2nd rule in a freshly started console

endo64

[15:06](#msg5e061dd9d5a7f357e68ea03e)@bubnenkoff Don't confuse, `_` is nothing special but just a ordinary word, so `to _` is like `to my-word-without-a-value`, hence it will fail.

## Monday 30th December, 2019

bubnenkoff

[09:49](#msg5e09c818b4ed68096e0063ed)@hiiamboris why it's do not work in fresh console?

hiiamboris

[11:06](#msg5e09da5205298604980e3278)What does it say?

bubnenkoff

[11:33](#msg5e09e090833c373f4d7ed2eb)

```
>> parse "<bb><aa><bb><aa><aa>" [any [to _ <aa> (print _) ] ]
*** Script Error: PARSE - invalid rule or usage of rule: _
*** Where: parse
*** Stack:
```

hiiamboris

[11:34](#msg5e09e0caeaa2cd096fc64b11)I see. Yes, quite cryptic message ;)

[11:34](#msg5e09e0da8ba16b107cf32e34)What it tries to tell you is that word `_` is unset (and it expects this word to hold a rule).

bubnenkoff

[11:35](#msg5e09e0ff2d574c7d1ee009f0)why it's work in not empty console?

toomasv

[13:15](#msg5e09f85fd5a7f357e6a728b5)Because if \[you have copied it before](https://gitter.im/red/parse?at=5e060818b4ed68096ee9024d), then it is not `unset!` but `""`, but if you haven't (in fresh console), then it has no value.
