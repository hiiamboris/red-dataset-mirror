# Archived messages from: [gitter.im/red/mezz](/gitter.im/red/mezz/) from year: 2017

## Saturday 1st April, 2017

meijeru

[12:55](#msg58dfa3410e4137042ad1fcae)I have just uploaded a function to split a `url!` value into components. See \[this](https://gist.github.com/meijeru/4a44ff148e44182580c79182f61113b0) Gist.

dockimbel

[15:29](#msg58dfc73f408f90be667ad3cb)@meijeru Thanks! One less thing I'll have to code. ;-)

## Monday 8th May, 2017

x8x

[20:46](#msg5910d909e4cfd50062a5c9a9)This room needs to be used more! 😁

[21:30](#msg5910e38f551ea6485ba807ff)Added some comments to \[split-url](https://gist.github.com/meijeru/4a44ff148e44182580c79182f61113b0) candidate from @meijeru .  
Question being how to treat internationalised domain names.

## Tuesday 9th May, 2017

dockimbel

[07:43](#msg5911732c0a783b6c0a7c382c)@x8x  
&gt; This room needs to be used more! 😁

:+1:

greggirwin

[16:21](#msg5911ec710a783b6c0a7e861d)@toomasv's very cool dir tree has a long section of defaults for refinement args. I don't often have that many, but a few times I've come close. The standard `var: any [var ]` approach is good, and we've all used it. I use it a \*lot\*. I started moving toward a `default` func, and still like the idea.

[16:21](#msg5911ec7cd1a7716a0aabaebd)

```
e.g.: :comment
defaulting-ctx: context [
	def: func [w "Word" v "Value"][
		; We're setting one word, so don't need to use set/only.
		if any [not value? :w  none? get w][set w :v]
		get w
	]
	set 'default function [
		"Sets the value(s) one or more words refer to, if the word is none or unset"
		'word "Word, or block of words, to set."
		value "Value, or block of values, to assign to words."
	][
		; CASE is used, rather than COMPOSE, to avoid the block allocation.
		case [
			word?  :word [def word :value]
			block? :word [
				collect [
					repeat i length? word [
						keep/only def word/:i either block? :value [value/:i][:value]
					]
				]
			]
		]
	]
	e.g. [
		default a 1
		default [a b c] [2 3 4]
		default f :append
		default [g h i j k l m] [1 2 [3] 4 5 6 7]
		default [g h i j k l m n o] [. . . . . . . .]
	]
]
```

[16:22](#msg5911ecdd33e9ee771c8cf49b)After looking at @toomasv's code, it made me wonder if a different format, using a single block of name-value pairs, would be better than separate `words` and `values` blocks. It could even be spec block format.

Thoughts?

[16:24](#msg5911ed37d1a7716a0aabb1b4)The spec block interface could also be used for just one value, where using a set-word for a single arg now is problematic.

[16:45](#msg5911f2150a783b6c0a7ea0b6)I think this also goes along with recommendations on when to use a catch-all `/with opts [block!]` approach. I have `refine` experiments as well, because propagating refinements was such a pain under R2.

toomasv

[18:27](#msg59120a2dc89bb14b5ae79dd5)@greggirwin Thanks for a provocatve suggestion! I am sure it is worth to go in this direction. But I have a problem. I tried your code and it gives some strange results. I am not sure where the strange behaviour comes from. Perhaps you can help me on this? Here is what happend:  
First I tried some experiments with my dir-tree. Then I `do`ed your `defaulting-ctx: contect [...`. Everything worked fine. But after trying the `e.g.` `default [g h i j k l m] [1 2 [3] 4 5 6 7]` I got the result:

```
>>         default [g h i j k l m] [1 2 [3] 4 5 6 7]
== [1 2 %CyberLink%20YouCam%28Webcam%29.lnk 4 5 6 7]
```

Tried it again, same result. Then I gave directly values to the `word: [g h i j k l m]` and `value: [1 2 [3] 4 5 6 7]`, and tried:

```
collect [
                    repeat i length? word [
                        keep/only def word/:i either block? :value [value/:i][:value]
                    ]
                ]
```

with the result:

```
== [1 2 3 4 5 6 7]
>> reduce word
== [1 2 7 4 5 6 7]
```

Can you explain, what is going on here?

Oh, and after entering your `defaulting-ctx: contect [...` code, `i` was already

```
>> i
== %CyberLink%20YouCam%28Webcam%29.lnk
```

and after entering `collect...` `i` was 7.

greggirwin

[19:12](#msg59121489c89bb14b5ae7cdd2)My first thought was that `repeat` wasn't capturing `i`, which I thought it should in `function`. But that doesn't seem to be it. I can't dupe the problem here (nor the `%Cyber...` file value which isn't surprising). I just jumped on here quickly, and need to do some other things, but will try to look at this later. Certainly there could be some binding issue I'm not seeing at a glance, since `i` is the repeat counter, but also the word being set. If I can dupe it, that will help.

toomasv

[20:01](#msg59122037631b8e4e61bc0e8f)I think I got it -- as `def:`sets only fresh words or words with `none` value, and `i` had got its value from earlier use of `filter` when I tried `dir-tree/only`, then `i` was already set (ie. had it's "default" value) and wasn't changed, and when I run the `default [g h i j k l m] [1 2 [3] 4 5 6 7]` example `i` got its value from `repeat i ...` and again wasn't changed by`def`. But the strange thing is that `filter`'s `foreach i` and also `repeat i` changed the global `i`'s value -- as classics have said \*there is no scope, ahem, spoon\*.  
And this raises the question how to ensure we have fresh words -- is the solution `set [g h i j k l m] none` before trying the above example?

greggirwin

[21:09](#msg5912300ad1a7716a0aacef92)The difference is that filter uses `func`, which doesn't capture `i`. In Rebol, iterator words are captured. In Red they are not, not yet anyway. `Function` collects local set-word! values, and also catches the word args for `[foreach remove-each repeat]` (glancing at `%function.reds collect-deep`). `Func` does not do that.

[21:10](#msg59123056d1a7716a0aacf09b)That example does assume a clear set of words. Clearing them explicitly isn't a bad idea, since it was confusing when it worked correctly in this case.

## Tuesday 23th May, 2017

toomasv

[13:59](#msg59244028c4d73f445ad6bea9)Added to \[regex](https://gist.github.com/toomasv/58040ccbbfb70150dee90ba0e27b16b8) capturing groups, absolute, relative and named backreferences to captured strings and to subroutines with different syntactical flavors (Perl, PCRE, Ruby), some examples. Also reorganized code somewhat.

## Wednesday 24th May, 2017

dockimbel

[01:44](#msg5924e577f3001cd3425139aa)@toomasv How much of regex features does it support now?

[01:55](#msg5924e82bfcbbe1891c3b4f07)Shouldn't `rule` be declared local \[there](https://gist.github.com/toomasv/58040ccbbfb70150dee90ba0e27b16b8#file-regex-red-L293)?

[01:58](#msg5924e8ce05e3326c6701ff6a)It is amazing how many Red language features you used in a relatively small script.

@PeterWAWood Shouldn't we integrate a version of that script and its examples into our test suite, it covers so many ground and many feature combinations we have no test for right now?

[02:08](#msg5924eb0dc4d73f445ad9b250)@toomasv Also, I would suggest using a more efficient way to convert digits from char! to integer, without requiring the creation of a temporary string:

```
to-int: func [char][to-integer char - #"0"]
```

toomasv

[09:37](#msg5925546c2b926f8a678944e2)@dockimbel  
&gt;How much of regex features does it support now?

Let's see:  
\* limited unicode characters and `.`  
\* charclasses (wo subtraction) -- named, escaped and inline, with negation  
\* quantifiers - possesive ones, but with greedy syntax  
\* nested groups with alternatives - noncapturing and capturing, numbered and named  
\* anchors - start and end, line, wordboundaries  
\* backreferences - absolute, relative and named, to captured strings and subroutines  
\* comments  
\* modes: icase, singleline, multiline, freespace  
The last one (`/freespace` refinement) was added just now.  
I corrected the `to-int` function into `func [numstr][to-integer numstr]`. Initially it converted char, and later strings, but I forgot to correct the function. And I should clean the code from unused words, which have remaind there from some experiments, as was `rule`, which you pointed out.

PeterWAWood

[09:41](#msg5925552e2b926f8a67894839)@dockimbel I've added a trello card to add Toomas's regex convertor to the tests.

toomasv

[10:06](#msg59255b13f3001cd3425309a8)Sorry, somehow I introduced a mistake into the code for quantifiers. Corrected now.

dockimbel

[10:28](#msg5925604df3001cd342532314)@toomasv Impressive! Also is impressive how quickly you mastered Red. Did you have prior exposure to Rebol?

toomasv

[10:39](#msg592562f4631b8e4e6109f596)@dockimbel I tried rebol few years ago, but didn't get hooked then.

rebolek

[12:58](#msg5925836afcbbe1891c3dd985)@toomasv This is really cool! I've tried writing regex to parse converter to Rebol years ago, so I know what it takes. Solving backtracking then was \*very* hard, it's great that Red provides new features that make it easier.

toomasv

[13:01](#msg5925843d9f4f4ab05bf76120)@rebolek Indeed! I think the change of `parse`into kind of FSM did the trick, as @dockimbel wrote, when introducing the brand new `parse`.

[17:16](#msg5925bfdf05e3326c6705c77e)There is a trick to use `regex`on block also:

```
>> ints: copy []
== []
>> funny: [any [collect into ints [keep integer! | skip]]]
== [any [collect into ints [keep integer! | skip]]]
>> parse [a 3 c 5 any words #(some: maps) [block] 357] regex "\A\k'funny'\z"
== true
>> ints
== [357 5 3]
```

Of course, no sense to use `regex` here, but still funny. For some reason `regex/parse` fails on this, even if it uses the same parse spec.

rebolek

[17:19](#msg5925c08beec422e415e57f83)wt*

toomasv

[17:36](#msg5925c484fa63ba2f767748e5)But externally specified rules might be useful in some cases:

```
>> _funny: ["Re" some #"d" "ish"]
== ["Re" some #"d" "ish"]
>> regex/parse/spec "\g'funny'" "Very Reddish indeed!"
[thru [_funny] to end]
== true
```

greggirwin

[20:52](#msg5925f2a10a783b6c0ad07bba)Wow! I go away for a week and look how much you've done @toomasv! I have a lot to catch up on, but scanning the code was great just now. Strictissimo! :^)

## Thursday 25th May, 2017

toomasv

[03:43](#msg592652d1c4d73f445ae01b3b)Hi, @greggirwin! Glad you are back! And thanks for looking into it! Waiting for suggestions for improvement :)

greggirwin

[05:03](#msg592665bc0a783b6c0ad23637)Glad to be back, but not much chance I can improve on your work in this case. I imagine it will get a lot of visibility and feedback, as it's a great example piece.

## Friday 26th May, 2017

x8x

[11:56](#msg592817e80de3eb3e19a7d053)Amazing stuff @toomasv !! That's going to be super useful when porting code from other languages. 🤓

toomasv

[13:30](#msg59282de0631b8e4e61161d11)Thanks, @x8x! I had an idea to mimic main flavors of regex, but this may be too ambitious, as there is too much variation.

meijeru

[13:33](#msg59282eab2b926f8a6795939b)@toomasv Excellent work! I did a much more modest version in my grep implementation. I am thinking of incorporating yours if I may.

toomasv

[14:43](#msg59283f2efa63ba2f7681dd0c)Thanks, @meijeru ! I try to make it feature-rich, but for many tasks a more efficient one is preferable.

[15:21](#msg592847ff5e34568d5e936cfa)@meijeru , of course you can incorporate anything you find worthy in it.

## Sunday 28th May, 2017

toomasv

[14:22](#msg592add120ba4d59763eba0dd)Modes in \[regex](https://gist.github.com/toomasv/58040ccbbfb70150dee90ba0e27b16b8) have now short equivalences (`/i` for `/icase`, `/s` for `/singleline`, `/m` for `/multiline` and `/x` for `/freespace`). Modes can also be specified via refinement `/modes options`, where `options` is a string of shortcoded modes.  
Also added capturing of overall match (captured in `br_0`), global mode refinement `/global`, short `/g`(or `/modes "g"`) and non-capturing refinement `/simplex`, short `/n` (or `/modes "n"`), which turns off numbered capturing for all non-named groups). To keep track of captured strings, I added a map `br_`, with numbered keys (at least `0` for overall match, and numbers for each captured group + named keys for named groups). In global mode captured strings are gathered into blocks on these keys, otherwise in strings. `br_0`, `br_1`... `name` refer to the first match if not in the global mode, and to the last match if in global mode. In global mode captured strings can be referred as e.g. `br_/1/2` for second match of the first capturing group. See examples.

greggirwin

[17:57](#msg592b0f80cb83ba6a41097605)You're going to have to write an extended article about all this @toomasv. It's very cool. "Per aspera ad astra" indeed.

[18:00](#msg592b10272b926f8a679f63f1)And the award for most refinements on a function goes to... :^)

toomasv

[18:00](#msg592b104e631b8e4e611fc936):) Just wait, there are lot's of these coming still!

## Monday 29th May, 2017

dockimbel

[04:25](#msg592ba2af0ba4d59763ee1e37)@toomasv If you want to write an article about that, I would be glad to publish it on the Red blog.

toomasv

[07:06](#msg592bc8645e34568d5e9ef60a)@dockimbel Thank you for the proposal! I'll start thinking about it.

dockimbel

[07:08](#msg592bc8d9eec422e415fb6485)@toomasv If you prefer to open your own blog, that's fine too. ;-)

toomasv

[07:09](#msg592bc934f3001cd3426b642a)@dockimbel Rather not. This is only a temporary project.

## Tuesday 30th May, 2017

toomasv

[11:39](#msg592d5a0238b37b98283b66f1)\[regex](https://gist.github.com/toomasv/58040ccbbfb70150dee90ba0e27b16b8) has got its first try in substitution. I added `/replace replacement` refinement to it . For now `replacement` can be only string, which may contain backreferences to captured strings, numbered and named. Works also in global mode. Also changed `br_` symbol into tcl-like `&` and made it changeable as eg. `re-ctx/symbol: '¤`, or, why not `re-ctx/symbol: 'capture`:). Made a repositoy for it, too: https://github.com/toomasv/regex.

geekyi

[12:53](#msg592d6b49631b8e4e6128a850):sparkles: :clap:

9214

[15:40](#msg592d92720a783b6c0aecaefc)Force great feel I  
!\[yoda](https://charmedyogi.files.wordpress.com/2013/01/yoda-meditating.jpg)

greggirwin

[15:41](#msg592d92b7c4d73f445afaf038)Go Toomas, Go!

9214

[15:45](#msg592d9399cb83ba6a41133cfe)`regex` is the path to the Red side. `regex` leads to `parse`. `parse` leads to `/refinements`. `/refinements` leads to the joy of programming.

greggirwin

[15:46](#msg592d93cd2b926f8a67a923ba)"Life is a series of refinements" -- Red Gregg

9214

[15:47](#msg592d940bcb83ba6a41133f6e)Indeed :^)

```
>> series? "life"
== true
```

greggirwin

[15:52](#msg592d95440a783b6c0aecbee1)We start with a random seed and basic event handlers. Later we develop rules we use to process larger patterns we experience, choosing options and (to tie in regex) sometimes being too greedy as we collect results.

geekyi

[15:53](#msg592d95675e34568d5ea68b3f)Mmm.. On positive side. @9214 looking is

toomasv

[18:20](#msg592db7e75e34568d5ea7481e)Hmm.. For those who don't like excessive refinements -- here is one with no refinements at all: \[~ operator](https://gist.github.com/toomasv/a667dd4ff3b1495c58547abd56b1596a)  
Usage: `string ~ "m/pattern/modes"` for matching, `string ~ "s/pattern/replace/modes"` for replacing. Delimiters are up to you -- choose ones which do not occur in your pattern, eg. "m:pattern:modes". You can drop `m` from the beginning when matching, and `modes` may be empty.

```
>> (s: "dao ke dao fei chang dao") ~ "s/dao/ming/g" head s
== "ming ke ming fei chang ming"
```

greggirwin

[23:21](#msg592dfe810ba4d59763f7b2e7)@toomasv, nice. Something else we can do with refinements is create a single `/with` refinement that takes an `opts` arg, and put everything in there. That can make propagating refinements a lot easier.

## Wednesday 31st May, 2017

geekyi

[18:12](#msg592f07a800efc2bb3ec2e85f)Careful @toomasv, you might reinvent perl ;P

[18:13](#msg592f07c82b926f8a67af9b16)

```
red
>> (s: "道可道非常道") ~ "s/道/名/g" head s
== "名可名非常名"
```

(Just a literal trancription of what you wrote above)

toomasv

[18:13](#msg592f07cff3001cd342795e14)@geekyi That's my purpose :) And thanks for the great example!

9214

[18:16](#msg592f087b38b37b9828430dec)sugoi sugoi! :sparkles:

geekyi

[18:20](#msg592f097efcbbe1891c636470)When I wish `source` or `??` is more powerful:

```
>> source ~
Sorry, ~ is an op! so source is not available
>> ?? regex
regex: unset!
>> ?? re-ctx/regex
*** Script Error: ?? does not allow path! for its 'value argument
*** Where: ??
>> code: :re-ctx/regex
```

[18:31](#msg592f0be95e34568d5ead305b)I was gonna say: \*problem is because arguments are quoted: `'word [word!]`, the type is redundant*  
I couldn't make a strong case for it tho.  
Still, I wonder what's preventing showing source of `op!`?

rebolek

[18:31](#msg592f0c095e34568d5ead3117)@geekyi lot of things.

greggirwin

[18:31](#msg592f0c1b631b8e4e61301633)We can't currently reflect the body of an op. Most are Red/System.

[18:33](#msg592f0c610a783b6c0af349fc)Bolek has a nice idea for linking to native sources, but not much chat about whether we should add it yet.

rebolek

[18:33](#msg592f0c7438b37b982843215b)It's possible to get and show Red/System source, but it has its own problems.

geekyi

[18:33](#msg592f0c7b0ba4d59763fc34b6)@greggirwin if it's not Red/System? But I guess you can't easily distinguish that? Just, `make op! :some-func` seemed very simple to me

rebolek

[18:34](#msg592f0ccff3001cd342797675)@greggirwin I would love to discuss it. There are some things that need to be considered before implementing it.

greggirwin

[18:35](#msg592f0ceccb83ba6a4119dd8b)We could add path support to `??`. Just a bit more logic.

Yes, even if not Red/System currently. Try `body-of :~`

[18:36](#msg592f0d2c0ba4d59763fc36ed)@rebolek, me too. I haven't done it, because we should iron out details first. I like the idea though.

toomasv

[18:48](#msg592f0ff200efc2bb3ec3117c)

```
>>(s: "无名天地之始") ~ "s/.(.)..(.)./有\1万物\2母/" head s 
== "有名万物之母"
```

geekyi

[19:22](#msg592f17dc0ba4d59763fc7436)@geekyi thinks it's something along the lines of "Anonymous scope.. `system` context is anonymous.." (I don't understand enough to say)

## Thursday 1st June, 2017

PeterWAWood

[01:33](#msg592f6efa3aeff8a61f649972)@gltewalt I use the

```
print ""
```

cheat way to return an

```
unset!
```

@rebolek I return

```
unset!
```

from functions that I will run in the console so that I don't get the console output "polluted" with the return value.

[01:36](#msg592f6fa33aeff8a61f649c02)In Rebol2 you can use the so-called "construction" syntax to create an

```
unset!
```

value.

```
>> f: func [] [#[unset!]]
>> type? f
== unset!
```

[01:40](#msg592f70795e34568d5eaeda1d)I don't know if the capability to create an

```
unset!
```

value will be introduced to Red.

dockimbel

[02:14](#msg592f7876fcbbe1891c65400d)@greggirwin  
&gt; We can't currently reflect the body of an op.

`reflect` on `op!` made out of `function!` values should be able to retrieve the body. Worth a wish ticket I think.

greggirwin

[03:00](#msg592f8362cb83ba6a411bb8cf)OK. @geekyi, do you want to make that ticket, or should I?

meijeru

[06:59](#msg592fbb4200efc2bb3ec59000)There are two other ways to create an `unset!` value: `( )` and `do [ ]`.

PeterWAWood

[07:54](#msg592fc81c5e34568d5eb022ce)Thanks @meijeru

geekyi

[13:48](#msg59301b115e34568d5eb1b317)@greggirwin https://github.com/red/red/issues/2727

## Friday 2nd June, 2017

geekyi

[00:18](#msg5930aed7f2dd2dba065ea601)date gist from @luce80 https://gist.github.com/luce80/96d48297f2307a713c918c68bf046520

[00:19](#msg5930af17142826e97274df81)Has conversion from julian calendar dates

## Monday 12nd June, 2017

geekyi

[19:59](#msg593ef298f31c8ced0c2c0dea)https://gist.github.com/greggirwin/ab10ae521654d7f74dd4c784de6b32a2 native source by @rebolek and @greggirwin .. before it gets lost. I'm able to use this with local files btw

greggirwin

[20:19](#msg593ef76f02c480e672399cfe)@geekyi, did you add a base-dir value for local files? I thought about that as well.

geekyi

[20:20](#msg593ef79df31c8ced0c2c252c)@greggirwin yes, wait let me post my code.. https://gist.github.com/geekyi/c87928743c9575a417e8213c0537f2d2/revisions

[20:28](#msg593ef962c59bd9c4640cdbbb)@geekyi didn't realize revisions of gists got embedded too..

greggirwin

[20:30](#msg593ef9d06549436c7d3f902a)Cool, thanks!

geekyi

[20:33](#msg593efaa531f589c64f9e44d9)I only changed a small part. Next should probably be `nsource/action 'word datatype`

rebolek

[21:06](#msg593f024fc59bd9c4640d0452)@geekyi Cool! BTW the name `nsource` should be change to something that makes sense, it's just temporary dev name.

geekyi

[21:08](#msg593f02e36462d8493c06f4b2)@rebolek `source` or `??`:p Or.. I'm not sure..

rebolek

[21:09](#msg593f0316e531dbc905d82bf5);)

gltewalt

[21:09](#msg593f031b31f589c64f9e6c71)source/native ?

rebolek

[21:17](#msg593f04dacf9c13503c7cc25e)I think that the local version should fall back to github, when source is not available locally.

greggirwin

[23:16](#msg593f20e76462d8493c076ec9)The catch is that a local config will need to be used, since not everyone will have local source in the same place.

## Tuesday 13th June, 2017

rebolek

[04:19](#msg593f67daf6a78eab48425324)@greggirwin Exactly, that's my problem with local version too.

[05:17](#msg593f7579c59bd9c4640e8a1d)@greggirwin btw, I noticed you "fixed" my name :smile: May I ask why?

greggirwin

[05:24](#msg593f770ce531dbc905d9c33a)I did? If I did, it wasn't intentional.

[05:26](#msg593f778731f589c64f9ff585)What the heck? I see it now too, but don't think I changed that. I wonder if it was a cut and paste encoding issue. I'll fix it.

rebolek

[05:27](#msg593f77af6462d8493c088ddd)No problem, I was just wondering if there's some encoding issue or something like that.

greggirwin

[05:27](#msg593f77daca6d4ae80c0ab2d8)Should be fixed now. Please confirm. Don't want you confused with some other Bolek and him getting all the credit.

rebolek

[05:28](#msg593f77f5e531dbc905d9c646):)

[05:28](#msg593f7804cf9c13503c7e45c1)That probably won't happen, my surname is not that common :)

[05:29](#msg593f783cd83c50560c0211ea)It's fine, thanks.

greggirwin

[05:30](#msg593f785a31f589c64f9ff7bb)Whew! Thanks for pointing it out.

rebolek

[05:30](#msg593f788b02c480e6723b6961)It's not that important, I was just wondering what's the reason.

greggirwin

[05:31](#msg593f789631f589c64f9ff879)Syntax error.

rebolek

[05:32](#msg593f78e7f31c8ced0c2de537)Ok :)

[14:47](#msg593ffaf5142826e972af6f90)I was thinking how to get local copy of Red repo for the `nsource` and my idea was to use GitHub API. Of course you can do it with `git`, but with the API, you have no external (`call`) dependency, so it's more "clean" IMO. While looking for the right API call, I found out there is new GitHub API - v4. Unlike its predecessor, v4 is based on Facebook's GraphQL, that has no support in Red.

At least it hadn't, because I wrote:

\* Full GraphQL parser (for validation)  
\* Basic GraphQL dialect that converts Red data to GraphQL (not everything is supported yet, but it's good enough for basic usage)  
\* basic GitHub API v4 support for Red

Code is available at https://github.com/rebolek/red-tools

[14:47](#msg593ffb0402c480e6723dbf19)But I still need to find out how to clone repo using that API ;)

greggirwin

[16:30](#msg5940130ee531dbc905dc9d5a)Go Bolek Go!

rebolek

[16:31](#msg5940137731f589c64fa2db7d):)

greggirwin

[16:32](#msg59401391cf9c13503c81196e)The power of `parse`. Very cool Bolek.

rebolek

[16:32](#msg59401396e531dbc905dc9f8c)It was funny, just look at their type notation https://developer.github.com/v4/reference/query/

[16:32](#msg594013a4d83c50560c04ca6d)`string!` - I wonder how they came up with that ;)

greggirwin

[16:33](#msg594013ca142826e972afeca7)I see Redbol-isms creeping in more places it seems.

rebolek

[16:34](#msg594014306462d8493c0b70fe)I agree. It's a good thing, it makes writing parsers much easier 🕵🏽

greggirwin

[16:36](#msg5940149c142826e972aff059)Yes. I also love using specs as the data for code generation. They already exist, and you just have to run things again if they update them. I should port my ABNF parser. That has been handy, through the years, when pulling specs from IETF RFCs.

rebolek

[16:38](#msg594014ebf6a78eab48455e2f)You should. Pleeeease ;)

dander

[17:56](#msg5940275831f589c64fa33a1f)cool stuff!

geekyi

[22:22](#msg594065aaf6a78eab4846c157)@rebolek wow, and I was gonna ask if you'd seen the GraphQL api!

## Wednesday 14th June, 2017

rebolek

[02:53](#msg5940a545ca6d4ae80c0fd306):)

## Sunday 18th June, 2017

toomasv

[15:37](#msg59469e1fe531dbc905f645b4)Some advances in \[regex](https://github.com/toomasv/regex/blob/master/regex.red) translator:  
\* allowed any-string! as `/parse string` argument, so that emails, urls, tags and filenames could be parsed directly  
\* lookarounds: negative and positive lookahead (?!re)(?=re) and lookbehind (?&lt;=re)(?&lt;!re) (single ones, multiple lookarounds still problematic)  
\* soft quantifiers (well, sort of -- they are not working on and in groups/lookarounds, only possesive ones do):  
\-- greedy: `?`, `*`, `+`  
\-- lazy: `??`, `*?`, `+?`  
\-- possessive: `?+`, `*+`, `++`  
\* refinement `/possessive` (short `/+`) switches on possessive mode, where quantifiers `?`, `*`, `+` are interpreted as possessive  
\* charclass manipulation:  
\-- unions, e.g. \[\[:lower:]\\d] -&gt; "a-z0-9",  
\-- subtraction e.g. \[\[:lower:]-\[aeiou]] -&gt; lower consonants,  
\-- intersection e.g. \[1234&amp;&amp;\[3456]] -&gt; "34".  
Operating with complemented charclasses is a bit problematic, because of the bits allocation mechanism, e.g. \[\\d&amp;&amp;\[^^1234]] -&gt; "0567", but should be "056789". Better to use \[\\d-\[1234]] in such cases.

rebolek

[16:31](#msg5946aaf631f589c64fbcc7a4):clap:

greggirwin

[21:31](#msg5946f145caf4d68d6f490966)\*Some* advances = understatement. Sounds great @toomasv.

## Monday 19th June, 2017

dockimbel

[03:19](#msg594742c7cf9c13503c9c86d5)@toomasv Great progress, I really hope you'll write some day an article about your journey implementing such regex translator in Red. ;-)

## Tuesday 20th June, 2017

rebolek

[13:50](#msg59492809142826e972d434d3)GraphQL now has both encoder and decoder, so it's possible to use Red as GraphQL server also. The dialect should support all features (it definitely supports those I tested ;) ). In the GitHub API v4, there is now one example function (`comment-issue`) showing how to compose the dialect. Though I will add some GitHub-specific dialect for it, GraphQL may be more powerful than REST API, but it's definitely harder to use and there's not a lot of examples.

toomasv

[14:17](#msg59492e7d5bf0bef94cc52428)@rebolek :+1:

greggirwin

[16:09](#msg594948d5bf1bfe6770cfc745)Go Bolek Go!

## Monday 31st July, 2017

geekyi

[10:48](#msg597f0af1614889d475062011)https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5 @greggirwin 's Object browser

[10:50](#msg597f0b6a45fc670746e01a47)\[!\[image.png](https://files.gitter.im/red/mezz/E7A4/thumb/image.png)](https://files.gitter.im/red/mezz/E7A4/image.png)

greggirwin

[15:46](#msg597f50ea76a757f808612978)&lt;he he&gt; We want to be careful with that "set value" button.

[15:48](#msg597f516a76a757f808612bb0)The original R2 version let you spec a top level target, rather than system objects. One thought is that something like this can be used for config objects.

geekyi

[16:02](#msg597f54abc101bc4e3ad75fb6)@greggirwin one thing missing is a filter(e.g. don't show `none` values)  
Well, I can think of lots of features.. generally preprocess and postprocess.. (what about showing `type?`)  
Have to look at anamonitor again.  
More importantly tho, this enabled me to browse and inspect the code faster than reading from `source`

[16:05](#msg597f555c614889d475076022)\[!\[image.png](https://files.gitter.im/red/mezz/9Q9n/thumb/image.png)](https://files.gitter.im/red/mezz/9Q9n/image.png)

[16:07](#msg597f55a54bcd78af56ffa879)^- I had a `word-browser.r`, not sure where that came from tho, might be from a link Gregg posted

[16:08](#msg597f5605329651f46edaad22)&gt;history: [  
2.0.1 12-Sep-2005 "Carl" {First release on the web}  
2.1.0 16-Sep-2005 "Didier Cadieu" {Resizing and mouse wheel handling.}  
2.1.1 17-Sep-2005 "Gregg Irwin" {Minor UI tweaks - top bar height, func summary/bkgnd color}  
]

greggirwin

[16:13](#msg597f571f2723db8d5e612891)Word Browser is great. As were EasyVID and EasyDraw. More things to port. Need to see why Anamonitor doesn't work here.

I think the first new feature should be resizing.

geekyi

[16:48](#msg597f5f614bcd78af56ffd981)@greggirwin anamonitor from rebol.net isn't working, but \[anamonitor2 works](http://rebol2.blogspot.com/2011/11/anamonitor-2-check-block-contents.html)

greggirwin

[16:50](#msg597f5fc8614889d475078f84)Excellent! Thanks!

geekyi

[16:53](#msg597f609abc464729743f44dd)\[!\[image.png](https://files.gitter.im/red/mezz/R7TV/thumb/image.png)](https://files.gitter.im/red/mezz/R7TV/image.png)

[16:54](#msg597f60bf614889d475079492)Really nice but... crashes too often

## Tuesday 8th August, 2017

DideC

[14:38](#msg5989cce0a7b406262d6c6b0b)`Word-browser.r` I even did not remember I made a contrib on that. Thanks ;-)

## Friday 29th December, 2017

x8x

[10:29](#msg5a4618f981cd9a5d7ea23295)Hello, I'm poking with adding `/case` and `/tail` to `replace`, the question is what should `/tail` return when used with `/deep` in a `any-list` series.  
Current implementtation will return tail only if last replacement is NOT in a nested `any-list` and return `any-list` at head otherwise:

```
replace/all/deep/tail [b [a [a]] a b] 'a 'z
;   [b]
  replace/all/deep/tail [b [a [a]] b b] 'a 'z
;  [b [z [z]] b b]
```

I'm really not sure if that is the best approach, should `/deep/tail` just return head of `any-series` if it detects a nested `any-list` ??  
For non nested `any-series`, `/tail` is a nobrainer:

```
replace/all/deep/tail [a a a b b] 'a 'z
;   [b b]
```
