# Archived messages from: [gitter.im/red/sandbox](/gitter.im/red/sandbox/) from year: 2019

## Friday 4th January, 2019

gltewalt

[09:56](#msg5c2f2dea33e089363b41a004)It balked at first with an error that it couldn't open it, but red can read the recycle bin.

```
== %/C/$Recycle.Bin/S-1-5-21-2591063332-1437243679-3381992044-1002/
>> ll
	$IJZSB9O.adoc                                                                                                 
	$IOOBK12.html                                                                                                 
	$RD8ECNO/                                                                                                     
	.����0003000000061666d56ae6179e777be2                                                                         
	.����00030000000616e8dd50a72ab4668b33                                                                         
	.����000400000006f0624d774787a48947ac                                                                         
	desktop.ini
```

[10:00](#msg5c2f2eb509b8066849b16f79)

```
>> cd ..
== %/C/
>> next-dir
*** Access Error: cannot open: %/C/$Recycle.Bin/0ddcedc6dddb6b5384675bcf1728/
*** Where: do
*** Stack: next-dir change-dir cause-error  

>> next-dir
== %/C/$Recycle.Bin/S-1-5-21-2591063332-1437243679-3381992044-1002/
```

## Tuesday 8th January, 2019

toomasv

[15:25](#msg5c34c0ff1491b27876de0833)Longest Common (Sub)Sequence (based on \[Rosettacode examples](http://rosettacode.org/wiki/Longest\_common\_subsequence))

```
lcs: func [a b][
	lens: make block! 1 + x: length? a
	loop x + 1 [append/only lens append/dup make block! 1 + y: length? b 0 y + 1]
	repeat i x [
		repeat j y [
			lens/(i + 1)/(j + 1): either a/:i = b/:j [
				lens/:i/:j + 1 
			][
				max lens/(i + 1)/:j lens/:i/(j + 1)
			]
		]
	]
	result: make type? a min x y
	while [all [0 < x 0 < y]][
		case [
			lens/(x + 1)/(y + 1) = lens/:x/(y + 1) [x: x - 1]
			lens/(x + 1)/(y + 1) = lens/(x + 1)/:y [y: y - 1]
			'else [
				if a/:x = b/:y [
					insert/only result a/:x
				]
				x: x - 1
				y: y - 1
			]
		]
	]
	result
]
```

```
>> lcs "12462" "1224533324"
== "1242"
>> lcs [1 two [three] 3 #(four: 4)] [one two three #(four 4)]
== [two #(
    four: 4
)]
>> lcs "12462" [#"1" #"2" #"2" #"3" #"4"]
== "124"
; But no alternatives
>> lcs [#"1" #"2" #"2" #"3" #"4"] "12462"
== [#"1" #"2" #"2"]
```

[16:30](#msg5c34d0421491b27876de700a)Improved, added some checks and took advantage of common prefixes and suffixes:

```
lcs: function [a b][
	case [
		a == b [return copy a]
		empty? a empty? b [return copy ""]
	]
	while [all [a b a/1 == b/1]][a: next a b: next b]
	start: index? a
	x: length? a y: length? b
	while [all [x > 0 y > 0 a/:x == b/:y]][x: x - 1 y: y - 1]

	lens: make block! 1 + x;: length? a
	loop x + 1 [append/only lens append/dup make block! 1 + y 0 y + 1];: length? b
	repeat i x [
		repeat j y [
			lens/(i + 1)/(j + 1): either a/:i = b/:j [
				lens/:i/:j + 1 
			][
				max lens/(i + 1)/:j lens/:i/(j + 1)
			]
		]
	]
	result: make type? a min x y
	insert result at head a start + x ;- 1
	while [all [0 < x 0 < y]][
		case [
			lens/(x + 1)/(y + 1) = lens/:x/(y + 1) [x: x - 1]
			lens/(x + 1)/(y + 1) = lens/(x + 1)/:y [y: y - 1]
			'else [
				if a/:x == b/:y [
					insert/only result a/:x
				]
				x: x - 1
				y: y - 1
			]
		]
	]
	insert result  copy/part head a start - 1
	result
]
```

ne1uno

[21:23](#msg5c3514dd57c6883f9b839ff3)I'm getting `""`

greggirwin

[21:28](#msg5c35160f1d1c2c3f9ce1ed6d)Nice @toomasv. I have an old one for R2. Also an old rebcode version, which was much faster, but still not quite enough for my taste. I only handled strings, but always wanted to do blocks as well, so we could diff Red structures.

ne1uno

[23:17](#msg5c352f831948ad07e80d0dc7)win7 recent 064, not sure why, but this fixed returning `""`, changed near the top of lcs: `any [empty? a empty? b] [return copy ""]`

## Wednesday 9th January, 2019

toomasv

[05:33](#msg5c3587bd1948ad07e80effd0)@ne1uno Should be `any [empty?...]` On mobile now, can’t check.

[07:04](#msg5c359ceabd592b2e6e75b9f5)@ne1uno Thanks for spotting! Does it work for you with `any [empty? a empty? b] [return copy ""]`?

ne1uno

[07:05](#msg5c359d3273360b4d55def009)the few rosetta tests I tried pass

toomasv

[07:24](#msg5c35a1b4bd592b2e6e75da99)Thanks!

## Sunday 13th January, 2019

toomasv

[18:12](#msg5c3b7fa8dab15872ce8b5d57)Simple syntax highlighting:

```
Red []
skp: charset " ^/^-[]()"
addr: func [s1 s2 style] bind [keep as-pair i: index? s1 (index? s2) - i keep style] :collect
rule: bind [any [s:
	skp
|	#";" [if (s2: find s newline) | (s2: tail s)] (addr s s2 reduce ['italic beige - 50]) :s2
|	(el: load/next s 's2)(
		case [
			string? el 		[addr s s2 gray]
			any-string? el 	[addr s s2 orange]
			word? el 		[case [
				any-function? get/any el [addr s s2 reduce ['bold blue]]
				immediate? get/any el [addr s s2 blue]
			]]
			path? el 		[if any-function? get/any el/1 [addr s s2 reduce ['bold blue]]]
			any-word? el 	[addr s s2 navy]
			any-path? el 	[addr s s2 water]
			number? el 	[addr s s2 mint]
			scalar? el 		[addr s s2 teal]
			immediate? el 	[addr s s2 leaf]
		]
	) :s2
]] :collect
view/no-wait [
	files: drop-list 200 with [data: read %.] 
	on-change [
		rt/text: read pick face/data face/selected 
		clear rt/data 
		collect/into [parse rt/text rule] rt/data
	]
	button "Dir..." [
		files/data: read change-dir request-dir/dir normalize-dir %. 
		clear rt/data clear rt/text
	]
	return rt: rich-text 800x800 "" with [data: []]
]
```

Sorry, w/o scrolling

greggirwin

[21:35](#msg5c3baf280999400604e71e62)Niiiiice!

## Monday 14th January, 2019

toomasv

[05:10](#msg5c3c19b91cb70a372ad59664):smiley\_cat:

## Wednesday 16th January, 2019

toomasv

[19:00](#msg5c3f7f6520b78635b633f198)Little bit more sophisticated syntax highlighting:  
\[!\[syntax-highlighting](http://vooglaid.ee/red/syntax-highlighting.gif)](http://vooglaid.ee/red/syntax-highlighting.gif)

rebolek

[19:07](#msg5c3f80f8cb47ec300053e50b)@toomasv That expressions highlighting is really interesting.

[19:07](#msg5c3f810e1cb70a372aec5a5c)

toomasv

[20:02](#msg5c3f8de320b78635b6345344)@rebolek I was surprised when it worked :smile: Currently works on predefined funcs only.

rebolek

[20:05](#msg5c3f8e7af780a1521f1f3660)@toomasv I thought so :) It's a nice thing anyway. I have something similar for \*Value\*, but the ultimate goal is to make it work for dynamic data and also somehow to have ability to highlight different blocks according to different rules - like parse rules, your dialects, etc.

toomasv

[20:05](#msg5c3f8e9c39596c372bf145e5)Same thoughts here.

greggirwin

[20:37](#msg5c3f95fa35350772cf40cfd3)Still, that's a \*fantastic* start for some overnight tinkering. Go @toomasv, go!

@dockimbel, check it out.

dander

[20:37](#msg5c3f95fe0721b912a58efba6)@toomasv really great! I started experimenting with the `gui-console-ctx/terminal/theme` colors, but the datatype based colorization feels a bit limited. I like how you are differentiating words based on their value types

toomasv

[20:41](#msg5c3f96ebba355012a44d12e6)Thanks! :smile:

gltewalt

[23:56](#msg5c3fc4aa09994006040214a0)@toomasv Creates a window that is a bit off the screen on Win7. Too tall to get to the menu.

[23:57](#msg5c3fc504cb47ec300055b282)Fantastic work in a short time, though @toomasv

## Thursday 17th January, 2019

dockimbel

[01:40](#msg5c3fdd24099940060402af4f)@toomasv Very nice, and impressively short :+1:. That is getting close to the kind of native Red IDE I had in mind that we could provide, built-in the GUI console. Please put the code in a gist, so we can tweet both the gif and the code.

[01:45](#msg5c3fde4c0721b912a590c2ec)@qtxie Look at that rich-text demo ^---

qtxie

[02:27](#msg5c3fe81cf780a1521f2169e0)@toomasv Really cool! :+1:

toomasv

[04:46](#msg5c400892dab15872cea87780)Thanks everybody! I placed the code in \[repo](https://github.com/toomasv/syntax-highlighter). Please see the list of limitations/problems in readme. Last three may be out of my competence. Any advice?

[05:14](#msg5c400f2732a8370605e43ce8)@dockimbel It's not so short anymore. The above snippet was only elementary types coloring. Now it has expanded significantly.

dockimbel

[06:30](#msg5c402112c45b986d1173a1cb)@toomasv Thanks, tweet posted.

dander

[09:36](#msg5c404c81831899452402d09a)@toomasv I posted a \[gist](https://gist.github.com/dander/a7546f4ee56a0192ee97ab0dbca497db) with the solarized color palette in case any part of that looks useful to you. It doesn't work great with the console, partially because the foreground/background colors don't get updated by setting the theme, and I don't know if the color choices are very good, but it seems like a start. I guess there is probably a more elegant way to compose the themes as well, but that part is ok at least

rebolek

[09:47](#msg5c404f4a1cb70a372af1425a)@toomasv I'll try to use your editor as a front-end for \*Values\*.

toomasv

[09:58](#msg5c4051be35350772cf45503e)@dander Great! I shall study it.  
@rebolek Cool! Only .. er, it's not editor yet :(. I have to merge it with my earlier experiment with rt to enable it as editor.

BeardPower

[10:44](#msg5c405ca3f780a1521f242c3f)@toomasv Fantastic work!

rebolek

[11:02](#msg5c4060c38318994524035518)@toomasv that's actually not a problem at all, given how \*Values* work right now.

toomasv

[11:06](#msg5c4061cc0721b912a593eaa5)@rebolek Good! I'll look forward to see it.

[13:34](#msg5c40844e20b78635b63a6e5a)@BeardPower Thanks!

greggirwin

[20:04](#msg5c40dfe59bfa375aab190069)@dander I'm a huge fan of Solarized.

dander

[20:14](#msg5c40e23a7a0f4d5b19c5c54e)@greggirwin me too. I hadn't realized before spending some time looking at it that the light/dark color schemes are so symmetrical. It's pretty neat.

rebolek

[20:15](#msg5c40e2620721b912a5974b81):)

dander

[20:17](#msg5c40e2dc1cb70a372af54077)I didn't actually look it up in the code, but it seems like the swatches in the settings dialog are based on the solarized colors too?

## Friday 18th January, 2019

toomasv

[11:14](#msg5c41b4f935350772cf4e3b24)Added code stepping and incremental execution:  
\[!\[syntax-highlighting2](http://vooglaid.ee/red/syntax-highlighting2.gif)](http://vooglaid.ee/red/syntax-highlighting2.gif)

Phryxe

[11:21](#msg5c41b6a38ce4bb25b8cf13e5)@toomasv :clap:

toomasv

[11:50](#msg5c41bd9c83189945240c3727):smile:

dander

[18:56](#msg5c42217195e17b45257178ae)@toomasv Great! So do I have it right that `next` is just walking across the expressions, but not evaluating, and `do` is like `next` but also evaluates? I wonder if the behavior of `skip` and `into`could be combined, so that for `block!` it goes into the block, but for other things it goes to the next value. I can't help the feeling that I am looking at a debugger :smile:

toomasv

[19:02](#msg5c4222be0a491251e31a0783)@dander Yes, `Do` is same as `Next` + evaluating. But about `Skip` and `Into` I have to see, may be I can unite these indeed. Thanks!

dander

[19:08](#msg5c4224148ce4bb25b8d1e88d)@toomasv my brain is just heavily biased by the common "step-over" / "step-into" debugger concepts

toomasv

[19:14](#msg5c42258335350772cf513775)@dander Done. Works well. Thanks! Would current "Do", "Next" and "Into" be good names or do you have better ones? I retained "Into" because the action is similar in both cases -- stepping \*into* block or stepping \*into* expression.

dander

[19:19](#msg5c4226adc45b986d1180c521)I agree that "Into" makes sense for both. I could see "Next" being renamed to "Skip" or something similar as that makes it clear that it is not evaluating

[19:21](#msg5c42274cc45b986d1180c877)What about "Do" =&gt; "Do/next"? Maybe a little too verbose, but it's pretty descriptive...

toomasv

[20:05](#msg5c42318d20b78635b6459a7a)Yeah, initially I had "Next" instead "Do" and "Skip" instead "Next". :)

dander

[21:40](#msg5c4247c0ba355012a45e6883)That is funny. There is also the thought that conventional debugging may not apply to Red in the same ways. Like how the state of a running app can be different from the way the source code would look, and sometimes you might want to modify the source code, or sometimes just the running state. Then copy things from one to the other

greggirwin

[23:22](#msg5c425fce20b78635b646c72b)More great progress @toomasv. Just wow.

In traditional langs, we would have the concept of "step over" and "step into", to eval a func call without changing your view, or following the eval into the call, as @dander noted. Starting with that, which many people will expect, we can see how it works with non-dynamic Red code. Even there we face the question of whether there's another level: user vs runtime stepping.

Time to put some real thought into this.

## Saturday 19th January, 2019

dander

[00:07](#msg5c426a3e95e17b45257343d3)@greggirwin, I was thinking the sources could be used to determine which parts of the running system are interesting to the user (function definitions, etc) and construct an accurate view of those using reflection methods. It would be nice to be able to edit and run either version - either for building / debugging the live system, or for restoring some part of the initial state. It would be so cool to be able to tweak a single function inside your application until it was working properly, then save it back to sources.

greggirwin

[22:47](#msg5c43a91f746d4a677add079d)@dander I have many ideas on tools, one of which is a function IDE that lets you work on a single function (which may call others of course), and see all the aspects easily. e.g. do you have a doc string? Did you annotate any modified args? Are you using names in the spec that conflict with standard names (e.g. `/all`), places for sample inputs and their associated output, with a way to have it run and just click to say "That's correct. Make it a test." and all tests auto run as you work. Stuff like that.

## Sunday 20th January, 2019

gltewalt

[01:43](#msg5c43d23ff780a1521f3a27f7)Linter?

toomasv

[07:07](#msg5c441e44746d4a677adf9612)Great ideas! Some similar ones have been lingering in my mind too. Refining funcs in memory by providing sample input and saving changes back to source, testing state by selected words/paths, checking conflicts with system words, stepping into already defined funcs... With objects/contexts it is tricky. I think for stepping through object, it should first be `construct`ed and then its words incrementally set from the original spec block. Otherwise, when stepping into spec block and incrementally evaluating it, words are set in default context, and this distorts the state. What do you think?

gltewalt

[19:22](#msg5c44ca80ba355012a46d94df)Have a panel with all functions. Click on `any-function!` word and get help text

[19:23](#msg5c44cabdc45b986d1190b2d6)Can get all `any-function!` words with `what/buffer`

dander

[19:41](#msg5c44cef9c45b986d1190c963)There are some interesting ideas in \[ozcode](https://www.oz-code.com/), which is an extension for Visual Studio. They pre-evaluate expressions in some sort of sandbox so that it doesn't affect the running application, but shows what sections of code will evaluate to and highlights true or false as different colors, for example. It seems like a general purpose evaluation sandbox could be useful for lots of things

## Monday 21st January, 2019

ne1uno

[22:17](#msg5c4645100a491251e3336486)@toomasv your latest range function fails to compile. passing `cause-error` a block is a typo compared to an earlier version I've been using and thanks!

[22:17](#msg5c4645100721b912a5b8c281)`cause-error ['user 'message ["Only`any-string!`will be debased!"]]`

## Tuesday 22nd January, 2019

toomasv

[04:15](#msg5c4698c48ce4bb25b8ed3a36)@ne1uno Thanks! Corrected. Can't remember how it crept in there.

greggirwin

[21:42](#msg5c478e418ce4bb25b8f3b1df)@toomasv good thoughts on issues with context evaluation.

## Wednesday 23th January, 2019

gltewalt

[10:58](#msg5c4848bd95e17b45259830a1)Make a tool for this awful looking markup for framemaker.  
Rake in the gold from Adobe.

https://help.adobe.com/en\_US/framemaker/mifreference/mifref.pdf

qtxie

[13:25](#msg5c486b52dab15872cedd30d8)&gt; It doesn't work great with the console, partially because the foreground/background colors don't get updated by setting the theme

@dander Add `gui-console-ctx/terminal/update-theme` in the end of file should make it work.

[13:27](#msg5c486bc00721b912a5c6a890)Hmm, I should add caret color in the theme.

[13:29](#msg5c486c1c7a0f4d5b19f558b7)As a workaround, setting`gui-console-ctx/caret-clr` will change the caret color.

dander

[20:02](#msg5c48c838cb47ec30008f17d5)@qtxie cool, thanks!

greggirwin

[21:48](#msg5c48e112dab15872cee0661e)@gltewalt data transformations are a great fit for Red. We need to start a list of apps and tools to build.

gltewalt

[21:59](#msg5c48e3d8f780a1521f5a88d1)FrameMaker is a big one for documentation writing for Windows based businesses. It’s a GUI program of course, but it can generate MIF and also read in MIF, so a tool that can generate MIF may be an opportunity for Red.

## Saturday 26th January, 2019

toomasv

[21:19](#msg5c4cced47b68f9410222c44d)\[Advances](https://github.com/toomasv/syntax-highlighter) since last demo:  
1\. Wheeling  
2\. Resizing  
3\. Responsive options panel  
4\. Step-history and back-stepping  
5\. Expression selection with click in "Step" mode  
6\. Tips and expressions now seen throughout longer files too  
6\. Simple search ("Find" and "Show") with contextual menu  
7\. Now recognizes also functions in objects  
8\. Keyboard navigation  
9\. EDITING  
10\. File menu  
11\. Font-size adjusting  
12\. Automatic and manual recoloring  
13\. Lot's of bugs

endo64

[22:10](#msg5c4cdac713a2814df6d10401)That's great @toomasv !

Ungaretti

[23:01](#msg5c4ce6cb41775971a08c0ae1)@toomasv I'm truly amazed!! Congratulations and THANK YOU!

## Sunday 27th January, 2019

toomasv

[05:31](#msg5c4d422eca428b06450b160e)@endo64 @Ungaretti Thanks!

## Tuesday 29th January, 2019

greggirwin

[05:54](#msg5c4feaaac2dba5382ea58f3c)Holy cow! All in under 1 KLOC too. :clap:

BeardPower

[14:10](#msg5c505ed893fe7d5ac00cbb83)--bloat ;-)

greggirwin

[20:35](#msg5c50b92c975714406b61579a):^)

## Thursday 7th February, 2019

toomasv

[12:10](#msg5c5c2044ceb5a2264fabc9d8)Finally managed to make it \[compileable](https://github.com/toomasv/syntax-highlighter). I am curious, if somebody succeeds in trying to actually run \[Win](https://github.com/toomasv/syntax-highlighter/raw/master/syntax3.exe) or \[Mac](https://github.com/toomasv/syntax-highlighter/tree/master/syntax3.app) compiled version.

Phryxe

[13:55](#msg5c5c38dff46373406a6ac614)@toomasv Tried to run the compiled Win exe, but it was deleted by F-secure before it got completely downloaded (Trojan.TR/Crypt.XPACK.Gen2).

toomasv

[13:58](#msg5c5c39778790df0620744517)@Phryxe Did you try to "Allow" it from F-Secure "Tools/Quarantine-and-exclusions/Quarantined" panel? Other possibility is to temporarily "Turn off all security features" on "Tools" panel. You can also turn off "Real-time-scanning" on "Firewall settings".

dsunanda

[14:27](#msg5c5c40531b62f12650b9f0af)Was also swatted aside by my anti-virus goons - don't have time now to sedate them while I try to run syntax3.exe  
False anti-virus reporting is a bane for many small developers -- eg see \[https://coolsoft.altervista.org/en/blog/2018/05/antivirus-false-positives-are-plague-small-developers](this lament).  
I don't remember ever having the problem with R2 or R3 - so still much to learn from the old masters :)

rebolek

[14:31](#msg5c5c4136f04ef00644f599f1)R2 and R3 weren't compiling, so it wasn't possible to hit this problem.

toomasv

[14:45](#msg5c5c44a2ca428b06456e38f2)Now there is UPX-packed \[win exe](https://github.com/toomasv/syntax-highlighter/raw/master/syntax3.exe).

Phryxe

[14:56](#msg5c5c470d454aad4df70e05cc)@toomasv F-secure didn't like that one either. I'm at work now, where I can't change AV settings. I hope you get help from others ...

toomasv

[14:59](#msg5c5c47e2ca428b06456e5186)@Phryxe Thanks!

ne1uno

[15:07](#msg5c5c49c6c2dba5382ef7e462)I was able to compile &amp; run after fixed up in `#include`path to help.red

[15:10](#msg5c5c4a5a78e1ed4103f95983)red compiler should cut error report to under 20 lines

[15:10](#msg5c5c4a7b78e1ed4103f95b12)spews off console buffer

endo64

[15:23](#msg5c5c4d5bf46373406a6b5da8)@toomasv UPX-packed exe works on my pc I have installed Windows Defender.  
9 / 70 antiviruses think it is malicious.  
https://www.virustotal.com/#/file/bee6b7f4b55db42fb388472412a44486dcf401d10d129db7df1b5980f9398c4b/

toomasv

[15:24](#msg5c5c4dc813a2814df6361001)Thanks, @endo64 !

greggirwin

[19:50](#msg5c5c8bf2975714406baf9a38)Fantastic @toomasv! Flagged for me as well, but worked around it.

\- Tips do a partial match, so `upper` as a var name shows help for `uppercase`. This is a good start for an Intellisense type feature.  
\- Handled pasted content really well.  
\- Didn't keep my font selection a couple times. Might have had text selected when I did it. Then it worked.  
\- Multiple `Red []` headers in the content confuse the line numbering.  
\- Ah, font set only until a second `Red []` is found. Then it goes back to the default for the remaining text.  
\- What does `Construct` do?  
\- Should expr highlighting also work for `{...}` strings? They aren't an expression, per se.  
\- Sometimes the scrolling gets confused and the vertical offset jumps. No pattern discerned yet.  
\- Removing extra `Red []` causes line numbering to fix immediately, but the font issue persists.  
\- Holding Shift and arrowing down, to select lines, makes it jump once you go beyond the last line in the viewport.

Have to make sure @dockimbel and @qtxie check it out. Super impressive.

toomasv

[20:40](#msg5c5c97d3454aad4df7105bad)@greggirwin Thank you! I'll start checking these issues tomorrow.

About "Construct". It's experimental. Works currently for files which have their program not in anonymous object/context, neither in path-named context. Clicking "Construct" first constructs the file as object, then fills in functions. After that, in step mode, if you select an expression and then ctrl-click it, then there opens an extra panel on the right, with two areas. Selected expression should appear in upper area. Click on "Do" button executes the expression in constructed context. You can play and change it until satisfied, then click "Save" and modified expression is pasted back to main program text.

If you select in this upper area some word which is defnined in your program, and then select from contextual menu "Show def", then the first set-word with following expression is sought out and pasted into second area. You can also run, modify and save back that, select another word in above area ...

Just experimenting, probably needs much more work.

greggirwin

[20:42](#msg5c5c984f9221b9382d30764b)Maybe add a little help screen with instructions? :^)

toomasv

[20:44](#msg5c5c98a5f46373406a6d8324)Yes, TBD :)

Ah, also, line numbering does not take into account wrapped lines. I'm not sure yet how to do it.

greggirwin

[21:45](#msg5c5ca712f04ef00644f88bd8)Editors handle line wrapping differently. One way is to show a placeholder for the wrapped parts of lines. e.g.

```
34   This is line 34 ...
.    and the part of line 34 that would wrap.
35   This is line 35
```

[21:46](#msg5c5ca7419221b9382d30e5b5)Toggling wrap mode has to rescan.

## Friday 8th February, 2019

gltewalt

[00:45](#msg5c5cd12716e46822598602b8)Two line Red for windows updater?

```
if exists? %red.exe [call/shell {rename red.exe red.exe.old}]
write/binary %red.exe read/binary https://static.red-lang.org/dl/auto/win/red-latest.exe
```

greggirwin

[00:46](#msg5c5cd182ef98455ea4fa27cc):^)

gltewalt

[00:48](#msg5c5cd1fa126af75deb6b807a)If Ctrl C could be sent to cmd.exe via `call`, could fire off the console compiling.

[01:06](#msg5c5cd60e28c89123cb8ffda7)Come on, full IO

## Saturday 9th February, 2019

toomasv

[05:07](#msg5c5e6005d1e3093ab5ec6f32) @gltewalt :+1:

qtxie

[06:36](#msg5c5e74f97502282258cf8657)@toomasv Really nice. It's a bit slow when open a big file. (600 lines of code).

gltewalt

[06:50](#msg5c5e7834253c2b5ea3e00f8a)`forever [browse %/C/]`

toomasv

[08:35](#msg5c5e90e5ecef85660b7605ae)@qtxie Thanks! Yes, it is slow. I have to learn RS to speed it up.

## Tuesday 12nd February, 2019

toomasv

[12:06](#msg5c62b6cd8328315decdfb199)Added auto-completion

\[!\[auto-complete](http://vooglaid.ee/red/syntax4.gif)](http://vooglaid.ee/red/syntax4.gif)

rebolek

[12:10](#msg5c62b7ab5095f6660cded1be):clap:

Phryxe

[13:19](#msg5c62c7ea126af75deb92fbbb)@toomasv = 1337 :bow:

toomasv

[13:21](#msg5c62c86f5095f6660cdf5077):smile:

dander

[17:59](#msg5c630991ef98455ea423ec36)@toomasv awesome progress! keep it up 🤩

toomasv

[18:54](#msg5c63166aef98455ea42448d4)@dander Thanks! Will try.

endo64

[20:57](#msg5c633330dc3f0523cca4a1b5)@toomasv very nice!

## Wednesday 13th February, 2019

ne1uno

[09:15](#msg5c63e0244003460b2d4227f3)anyone know the sets card game? here's my version \[setsgame.zip](https://github.com/ne1uno/util-games/blob/master/setsgame19213.zip)

[09:16](#msg5c63e080dc3f0523cca93642)\*unfinished, probably has bugs. `hint` doesn't work compiled

[09:18](#msg5c63e0f828c89123cbbf04e5)`hints` may not work w/ 064 stable. working with latest interpreted

toomasv

[10:08](#msg5c63ec85ef98455ea42a07a2)@ne1uno :+1:

## Friday 15th February, 2019

xqlab

[12:12](#msg5c66acb24003460b2d55cb7d)I just checked a simple loop

```
delta-time [x: 0 loop 1000000 [x: x + 1]]
```

Red is 2x to 3x slower than Rebol2 or Rebol3

9214

[12:45](#msg5c66b4654bafd97ca3f7ddd5)... with Red having zero optimizations (some core parts, like lexer, are mezz code rather than R/S, for ease of development) and being an alpha software. Can't follow what you're trying to say with this microbenchmarking, which, in general, does more harm than good.

Is there a room for improvement? Definitely. Is this a fair comparison? Well, that depends.

## Saturday 16th February, 2019

greggirwin

[17:23](#msg5c68470f253c2b5ea322fc01)@9214 +1

## Monday 18th February, 2019

gltewalt

[22:02](#msg5c6b2b69e5eeec0d9b8ac9d8)http://books.pharo.org/updated-pharo-by-example/

## Sunday 24th February, 2019

gltewalt

[18:58](#msg5c72e9459e430b3086bd15a0)Does this cover everything ok as the complement to `first`?

```
last: func [value [series! tuple! pair! time! date!]][
    case [
        series? value [back tail value]
        tuple?  value [pick reverse value 1]
        any     [pair? value time? value] [pick value false]
        date?   value [pick value (length? system/catalog/accessors/date!) - 1] 
    ]
]
```

[18:58](#msg5c72e9545df86a456889c84d)OCD formatting

[19:04](#msg5c72eaaec4da4a11f5ab78c3)Or maybe this, as `first` seems to return `none`

```
last: func [value [series! tuple! pair! time! date!]][
    case [
        series? value [either empty? value [none][back tail value]]
        tuple?  value [pick reverse value 1]
        any     [pair? value time? value] [pick value false]
        date?   value [pick value (length? system/catalog/accessors/date!) - 1] 
    ]
]
```

[19:50](#msg5c72f586c4da4a11f5abc128)What if number of date accessors changes?

[19:53](#msg5c72f6259e430b3086bd6d24)`first` accepts those same datatypes, that's why I added them

toomasv

[19:54](#msg5c72f6805df86a45688a1883)Sorry, I deleted it. Have to reconsider.  
@gltewalt What if last accessor will be implemented?

gltewalt

[19:56](#msg5c72f6f09e430b3086bd7187)It might still change, though probably rarely

toomasv

[20:11](#msg5c72fa80c82c68509e2d3ec3)OK, here:

```
last: func [value [series! tuple! pair! time! date!]][
    case [
        any [series? value tuple? value] [pick value length? value]
        pair? value [second value]
        time? value [third value]
        date? value [value/14]
    ]
]
```

9214

[20:18](#msg5c72fc07b6c74f1e2ea59229)

```
text
last: func [value [series! tuple! pair! time! date!]][
    pick value length? any skip [
        next select system/catalog/accessors type?/word value
        value
    ] make integer! not date? value
]
```

gltewalt

[21:19](#msg5c730a4bab952d3085859779)I don't understand that one. Other than realizing I hadn't bothered to look at `system/catalog/accessors` beyond date

## Monday 25th February, 2019

gltewalt

[04:20](#msg5c736cf4a7d733509dbfa99e)`value/14` should be `julian` if blocks are supposed to be ordered, no?

[04:20](#msg5c736d2bc4da4a11f5aea2bc)

```
>> n: now
== 24-Feb-2019/21:20:21-07:00

>> n/julian
== 55
>> n/14
== 8
```

[04:21](#msg5c736d5ae5eeec0d9bbfbe62)Or does it count `newline`?

[04:26](#msg5c736e809e430b3086c04ab0)

```
>> system/catalog/accessors/date!/14
== isoweek
>> system/catalog/accessors/date!/15
== julian
```

[04:27](#msg5c736ebbab952d308587fbb2)

```
>> pick n 15
*** Script Error: value out of range: 15
*** Where: pick
*** Stack:
```

[04:29](#msg5c736f38a7d733509dbfb716)Seems that just can't pick julian

[04:34](#msg5c73704dab952d308588055d)So, scratch that - `value/14` is `isoweek`. But it isn't the last value in the block

toomasv

[04:41](#msg5c73720b85b7eb45692841cf)@gltewalt It is a wonderful opportunity to learn from @9214's illustrious wizardry. Let's break it up:  
1\. `pick value`  
2\. : `length?`  
3\. : `any`  
4\. : `skip`  
5\. : `[next value]`  
6\. : `select system/catalog/accessors`  
7\. : `type?/word value`  
8\. : `make integer!`  
9\. : `not`  
10\. : `date? value`

So you'll pick something from provided value at some index. The index is length of any of the following series. The following series may be considered starting from first or second element depending whether the value is date! or not. If it is not date!, then `make integer! not date? value` returns 1 and series starts from second element, i.e. `select...`. If the value is date! series starts from `next select...`. So if valueś type is found in `system/catalog/accessors` the length? is that of the corresponding accessors' block, which in case of date is 1 shorter, as length is counted from the second (`next`) element. If it is not found in accessors (block!, tuple!), the length? is calculated from the value itself returned by any.

rebolek

[11:50](#msg5c73d6701f14630421199d9b)I'm thinking about adding UPX compression for Windows builds on my build server. It should

1\. save disk space and bandwidth  
2\. should work better with AV software from what I've read

And it's basically just downloading one package on Linux and adding one line to build script.

[11:50](#msg5c73d6857667931e2ffa5e35)Any ideas why I shouldn't do it?

gltewalt

[15:38](#msg5c740c0e7667931e2ffbf289)Depends. Are you sharing your builds?

[15:40](#msg5c740c60e5eeec0d9bc40cc8)If it’s cool with Red team, I don’t see the harm

rebolek

[15:42](#msg5c740d00c4da4a11f5b31c19)@gltewalt oh, you haven't seen http://rebolek.com/builds ?

[15:45](#msg5c740d8a9e430b3086c49eb1)I was thinking more technical reasons, not legal ones, this is known service within terms of license I believe.

gltewalt

[15:52](#msg5c740f2dddaa310c89ebbb18)I don’t think I had seen it. Or I forgot about it.

[18:00](#msg5c742d4c00aa630d9a0e8887)Legal and politically prudent aren’t always the same thing

[18:14](#msg5c74309785b7eb45692daa6a)@toomasv Thanks for taking the time to try to illustrate Vladimir’s code.

toomasv

[18:41](#msg5c7436eced21832d370c4f69)@gltewalt Was it of help? For me it was interesting exercise.

gltewalt

[19:05](#msg5c743c780bd37b4835c8fa0b)It helped but it still has a density to it. Evaluation is from left to right, but arguments have to come from the right so there is an expanding and collapsing nature to it. My pea brain struggles with high density Red.

[19:06](#msg5c743cd1d0bfe95811a4aa01)‘Accordion Evaluation’ ?

[19:16](#msg5c743f1a66e2b3118b18a3b3)I’m not sure I’ll ever be at @9214 level

9214

[19:20](#msg5c744009fec94e50777e0f22)@gltewalt you won't of course, because you'll hit higher than that. This snippet was just for fun and excercise though, don't take it seriously.

[19:21](#msg5c74401f4d8904118ce8ab19)&gt; ‘Accordion Evaluation’ ?

https://www.youtube.com/watch?v=Rv-6kVUht5M

gltewalt

[19:23](#msg5c7440c76d148f48344d8fe6)https://youtu.be/CgCMBFcifVE

rebolek

[21:52](#msg5c7463ad66e2b3118b19a476)I don't even know what "politically prudent" means. I was just asking for some technical problems that my arise from using UPX instead of not packing the exe. Nevermind.

gltewalt

[22:43](#msg5c746f8ffec94e50777f7632)I’m just one person. My opinion is not a big deal.

rebolek

[22:44](#msg5c746fb7d98a4d50760a4859)It's the only opinion I got :)

greggirwin

[22:49](#msg5c747110d98a4d50760a51f6)@gltewalt, what is the goal of adding date/time/pair support to `last`? They are not ordered values.

gltewalt

[22:50](#msg5c7471444e758e79a398245a)`first` accepts them?

greggirwin

[23:13](#msg5c74769ced21832d370d5d30)I'm inclined to suggest removing them from `first` instead.

gltewalt

[23:14](#msg5c7476d0fb14c23f17e05d27)Ok.  
Looks like it accepting those types was borrowed from R3

greggirwin

[23:14](#msg5c7476e1d0bfe95811a64d40)Yes, we get them basically for free, but that doesn't make them useful, or that it will lead to clear code.

## Tuesday 26th February, 2019

rebolek

[06:52](#msg5c74e21e0bd37b4835cd4341)So I've added UPX compression for Windows builds. It will takes some time before it kicks in, as today's builds are done already and there wasn't any new commit anyway, so today's builds just link to yesterday. So I should know if everything works fine in few days (it works fine manually, so I don't expect any problems).

endo64

[11:43](#msg5c75267035c01307533edded)Thanks @rebolek we can compare with and without UPX when the next AV issue appears.

rebolek

[12:03](#msg5c752afb2ca5ec547441fcaf)Right. And I will have more space on my VPS :)

greggirwin

[19:16](#msg5c7590908a7def0752df5a44)Thanks @rebolek!

## Sunday 3th March, 2019

toomasv

[19:36](#msg5c7c2cafcbebcf784a3435a8)\[!\[dotty-font](https://toomasv.red/images/Tools/dotty-font.gif)](https://toomasv.red/images/Tools/dotty-font.gif)

rebolek

[19:43](#msg5c7c2e700966d91204190c48)Nice, I have similar editor, for fonts with size 3x5 + renderrer. I am thinking to extending it to 5x7 (as your editor), but I would like to use 5bits to represent each letter, so I need to come up with some trick to reduce 35 values down to 32.

toomasv

[20:15](#msg5c7c35e00966d9120419412d)I havn't yet thought much about how to save the font.

rebolek

[20:16](#msg5c7c362fd2d62067b73a8fb6)here's how I store 3x5 letters:

```
#"A" 15951
#"B" 32427
#"C" 14897
#"D" 32302
#"E" 32433
#"F" 32400
```

toomasv

[20:22](#msg5c7c378ce8ea143737a83aaf)Interesting! I'll try to figure it out.

## Monday 4th March, 2019

BeardPower

[11:41](#msg5c7d0ee365ffa019ea85c2b6)You can just save it as a bitset.

rebolek

[11:41](#msg5c7d0f00e1446a6ebe7e0d79)bitsets are PITA.

BeardPower

[11:42](#msg5c7d0f084a65f7547360c0dd)Like in the C64 days (sprites).

[11:43](#msg5c7d0f56d2d62067b73ff6cb)Each row is an accumulation of the bit values set.

[11:45](#msg5c7d0fcc212d0c1e1ace5f75)@rebolek What does 15951 represent?

rebolek

[11:45](#msg5c7d0fd9c1cab53d6f72af5e)letter `A`

BeardPower

[11:45](#msg5c7d0fee35c0130753724a6e)Yes, but what property?

[11:45](#msg5c7d0ff147276019e9b34afb)Set pixels?

rebolek

[11:45](#msg5c7d0ff5cbebcf784a39c64c)yes

[11:46](#msg5c7d100bde3a6e64c0d93b31)it's a 15bit number

BeardPower

[11:46](#msg5c7d100f2ca5ec54747520e0)The sum of pixels set or the specific pixel?

[11:46](#msg5c7d101ad2d62067b73ffba8)So it's like on the C64 ;-)

rebolek

[11:46](#msg5c7d101c2ca5ec54747520f8)representing 3x5 area

[11:46](#msg5c7d102bd2d62067b73ffc00)1 is set pixel, 0 is unset

BeardPower

[11:47](#msg5c7d103d53efa91203aedf87)Yeah.

[11:47](#msg5c7d10468a7def07520fabaa)A bitmap.

rebolek

[11:48](#msg5c7d1079e1446a6ebe7e14e6)and due to wrongly placed loop, it's not organized by rows, but by columns :) but that's easy to convert

BeardPower

[11:49](#msg5c7d10ce65ffa019ea85ce09)Nice. Reminds me of the old C64/Amiga painter/sprite tools.

toomasv

[19:52](#msg5c7d821735c0130753757438)@rebolek My take on 3x5/7  
\[!\[image.png](https://files.gitter.im/red/sandbox/iG25/thumb/image.png)](https://files.gitter.im/red/sandbox/iG25/image.png)

rebolek

[20:44](#msg5c7d8e1047276019e9b6cf2c)@toomasv Nice! I believe my chars are almost same, there's not much possibilities in such limited space (expect that I'm using strictly 3x5 size).

## Tuesday 5th March, 2019

toomasv

[21:01](#msg5c7ee3a235c01307537ef7f4)4x7/9 (variable width):  
\[!\[image.png](https://files.gitter.im/red/sandbox/gdE5/thumb/image.png)](https://files.gitter.im/red/sandbox/gdE5/image.png)

greggirwin

[23:56](#msg5c7f0cc386e34a126f9297fd)Very cool @toomasv.

## Wednesday 6th March, 2019

BeardPower

[10:16](#msg5c7f9e001c597e5db690ef24)Preparing for a synthi app?

toomasv

[12:31](#msg5c7fbd881fae6423ca3e24a9)

BeardPower

[12:56](#msg5c7fc398bf7990126e5b7644)A synthesizer app.

rebolek

[13:00](#msg5c7fc466d1e7281f09e49ea9):)

## Thursday 7th March, 2019

toomasv

[16:46](#msg5c814af7bf7990126e660655)\[!\[dotty-font2](https://toomasv.red/images/Tools/dotty-font2.gif)](https://toomasv.red/images/Tools/dotty-font2.gif)

rebolek

[16:48](#msg5c814b7886e34a126fa1f322)Nice:)

toomasv

[16:50](#msg5c814be71fae6423ca48face):smile:

rebolek

[16:59](#msg5c814e0c1fae6423ca490ac8)is it just a demo, or is it implemented as VID style also?

toomasv

[17:09](#msg5c81503025e4e24c072f6263)It is not imlemented as style, but is functioning tool for creating dotty fonts an messages. But too many bugs still.

rebolek

[17:10](#msg5c815078c8e5bc5162020a84)It's much nicer than my tool!

toomasv

[17:10](#msg5c815096c8e5bc5162020b04)I have to look at it.

[17:11](#msg5c8150bdb4b6ef7bc87038e4)Or you mean the `segment`?

rebolek

[17:11](#msg5c8150c186e34a126fa21b4d)There's nothing to look at, it's just one button and empty area :)

[17:11](#msg5c8150df86e34a126fa21bfd) segment is seperate, but it's almost same

[17:12](#msg5c8150fb293ac75db56bf964)I need both LCD and bitmap fonts for my project

toomasv

[17:21](#msg5c815309d3b35423cb7e6457)There are beginnings of dotty rich-text too:  
\[!\[dotty-fonts3](https://toomasv.red/images/Tools/dotty-font3.gif)](https://toomasv.red/images/Tools/dotty-font3.gif)

rebolek

[17:24](#msg5c8153dc25e4e24c072f8065):)

greggirwin

[18:43](#msg5c81665d86e34a126fa2bbbe)Really cool @toomasv. More great showcase material.

toomasv

[19:54](#msg5c81770eb4b6ef7bc8714b28)@greggirwin Thanks!

## Friday 8th March, 2019

toomasv

[20:30](#msg5c82d0dbd3b35423cb88651b)Pressing on:  
\[!\[dotty-font4](https://toomasv.red/images/Tools/dotty-font4.gif)](https://toomasv.red/images/Tools/dotty-font4.gif)

greggirwin

[23:05](#msg5c82f53e8f294b134a0f0313)Ah! So fun. I hope, given all the menus in your demos, that you've made a menu builder utility for yourself. ;^)

## Saturday 9th March, 2019

toomasv

[03:36](#msg5c8334d63162ec7bc740e9d8)@greggirwin Good idea! Thanks.

[03:38](#msg5c83353186e34a126fae71c3)Er... Probably I will not stay with menus.

## Tuesday 19th March, 2019

toomasv

[15:29](#msg5c910ae949fdaa0d81dec837)Re(d)inventing the computer :smile:

D-type flip-flop  
\[!\[flip-flop](https://toomasv.red/images/Logic-gate/D-type-flip-flop.gif)](https://toomasv.red/images/Logic-gate/D-type-flip-flop.gif)

8-to-1 selector  
\[!\[8to1-selector](https://toomasv.red/images/Logic-gate/8-to-1-selector.gif)](https://toomasv.red/images/Logic-gate/8-to-1-selector.gif)

3-to-8 decoder  
\[!\[3to8-decoder](https://toomasv.red/images/Logic-gate/3-to-8-decoder.gif)](https://toomasv.red/images/Logic-gate/3-to-8-decoder.gif)

Phryxe

[15:52](#msg5c911025fa5b721a1fb6031a)Wow

dander

[16:33](#msg5c9119d1f3dbbd230c818f25)neat!

rebolek

[18:33](#msg5c9135f652c7a91455bfeffc)@toomasv can it run Red? :smile:

toomasv

[18:35](#msg5c913674fa5b721a1fb727bd)As you see from my face :rage: not yet.

rebolek

[18:37](#msg5c9136d1d0133e21e5df8c04)OK, I'll wait, you'll probably have it by tomorrow :smiley:

toomasv

[18:40](#msg5c91379d49fdaa0d81e00ec5) :smirk:

greggirwin

[20:25](#msg5c91504e49fdaa0d81e0c26e)So cool @toomasv. Coming from the previous menu message, I'm not sure this is the most intuitive UI for users though. ;^)

[20:26](#msg5c915063fa5b721a1fb7f05e)Great example of domain specific use.

toomasv

[20:40](#msg5c9153c9fa5b721a1fb80c09)@greggirwin Yes, I don't think plethora of menus is good UI. It was just a quick try-out, come-and-gone. :smile:

## Wednesday 20th March, 2019

greggirwin

[00:55](#msg5c918f7b2f6ded0abb0f69b5)I meant the flip-flops and decoders as a UI. :^)

toomasv

[04:44](#msg5c91c5379d9cc8114aed120b)They'll have to bear with it if they want their reduter :angry: But eventually they'll get chips instead of gate networks :smile:

[14:44](#msg5c9251d48126720abc14146d)Full-adder:  
\[!\[full-adder](https://toomasv.red/images/Logic-gate/full-adder.gif)](https://toomasv.red/images/Logic-gate/full-adder.gif)

greggirwin

[16:52](#msg5c926fde8aa66959b6415c42):+1:

## Thursday 21st March, 2019

toomasv

[16:43](#msg5c93bf18a21ce51a209a5595)8-bit Ripple Carry Adder:  
\[!\[8 Bit RCA](https://toomasv.red/images/Logic-gate/ripple-carry-adder.gif)](https://toomasv.red/images/Logic-gate/ripple-carry-adder.gif)

9214

[16:44](#msg5c93bf699d9cc8114afa9a79)@BeardPower Mill soon 🌚 :point\_up:

greggirwin

[16:48](#msg5c93c06c0d7190505741143b)It's like a time machine. Cool visualization example for teaching.

rebolek

[16:50](#msg5c93c0e00d71905057411861)@toomasv see http://www.nandgame.com/

toomasv

[16:52](#msg5c93c13ad0133e21e5f0b295)@rebolek Nice, thanks!

BeardPower

[16:56](#msg5c93c23e3dd81711492b14f8)@9214 I'm looking forward to a belt machine :-)

toomasv

[17:04](#msg5c93c434a21ce51a209a7445)@greggirwin It \*is* kind of time machine -- I'm reading Petzold.

9214

[17:06](#msg5c93c4a52fb6800d8059df12)@toomasv https://www.nand2tetris.org/book

toomasv

[17:08](#msg5c93c4fa6a3d2e230d009fe6) :baby:

## Saturday 23th March, 2019

toomasv

[21:09](#msg5c96a06cd0133e21e503b7e8)Playing with the above little reactive networks brought me somewhat unexpectedly to this:  
\[!\[funcgraph](https://toomasv.red/images/Graph/funcgraph.gif)](https://toomasv.red/images/Graph/funcgraph.gif)

rebolek

[21:13](#msg5c96a18efcaf7b5f7302f40a)it's nice, but I must say bit confusing. But maybe it's just late :)

## Sunday 24th March, 2019

toomasv

[05:30](#msg5c9715e53dd81711494096cf)@rebolek I hope it was just late :smile: What is confusing about it?

rebolek

[06:37](#msg5c9725ba81b15c5e4b78faeb)Order of the arguments.

toomasv

[06:39](#msg5c9726055547f774485725c8)It's the order in-coming edges are drawn.

greggirwin

[18:29](#msg5c97cc823dd8171149451a56)Shows how a block programming system could be built though.

## Wednesday 27th March, 2019

toomasv

[12:28](#msg5c9b6c7c0d71905057736bdf)Pressing on:  
Edge-triggered D-type flip-flop:  
\[!\[edge-DFF](https://toomasv.red/images/Logic-gate/edge-triggered-D-type-flip-flop.gif)](https://toomasv.red/images/Logic-gate/edge-triggered-D-type-flip-flop.gif)

Same with clock: (something is fishy here):  
\[!\[clocked-edge-DFF](https://toomasv.red/images/Logic-gate/edge-DFF.gif)](https://toomasv.red/images/Logic-gate/edge-DFF.gif)

Aaand 4-bit counter abstracted from previous:  
\[!\[4-bit counter](https://toomasv.red/images/Logic-gate/4-bit-counter.gif)](https://toomasv.red/images/Logic-gate/4-bit-counter.gif)

BeardPower

[12:31](#msg5c9b6d208126720abc5077a3)@toomasv I see an alternative to Spice ;-)

toomasv

[12:37](#msg5c9b6e708aa66959b67c870d):)

greggirwin

[15:49](#msg5c9b9b9d6a3d2e230d34481b):+1:

## Friday 29th March, 2019

toomasv

[15:47](#msg5c9e3dfde4561321d05b4672)Towards micro-AST:  
\[!\[micro-AST](https://toomasv.red/images/Graph/AST.gif)](https://toomasv.red/images/Graph/AST.gif)

endo64

[16:02](#msg5c9e41abe2245b5109d29987)That's pretty cool @toomasv !

toomasv

[16:33](#msg5c9e48eae422d1519933bbb8):)

greggirwin

[17:24](#msg5c9e54bbb7e27d2f05a405ae)That's...wow! @dockimbel, are you watching this?

[17:24](#msg5c9e54cca100047111dde518)Go @toomasv, go! :^)

[17:25](#msg5c9e54f95349305a4c8dce21)One of my favorite things about Toomas' posts is that I can almost feel the process. "I wonder if I could..." and the learning and tinkering, the play, the fun. Even the frustrations.

toomasv

[17:37](#msg5c9e57f17160b42285367b63)@greggirwin You put it very exactly! That's the "heureka" experience in my micro scale.

greggirwin

[17:44](#msg5c9e597eb7e27d2f05a4277b)Heureka! I love it.

gltewalt

[23:03](#msg5c9ea4496a9761361b24a668)@toomasv That is really cool

[23:07](#msg5c9ea5297160b4228538a77f)I wonder if this can fit in with the graphical translator that @abdllhygt wants to do?

## Saturday 30th March, 2019

toomasv

[04:20](#msg5c9eee928df8b02f04836a5f)@gltewalt Thanks! Don't know about translator, but I imagine it could in principle be adapted for building NL syntax trees, if NL grammar DB is at hand.

[10:18](#msg5c9f425993fb4a7dc2a46481)Browsing my old gists I discovered that after 1.5 years \[GOL](https://gist.github.com/toomasv/5cdec157a412364cdd30347e05e572bc) is still working. Here's an example of relatively short-lived \[symmetric beauty](https://toomasv.red/images/Animations/game-of-life.gif) and \[chaotic longevity](https://toomasv.red/images/Animations/gol-longevity.gif).

endo64

[12:26](#msg5c9f608d016a930a4532e146)@toomasv wouldn't be nice to put that beauty to red/community repo? :) https://github.com/red/community

[12:29](#msg5c9f613b25686a7dc3a7af73)Or even better to red/code.

toomasv

[14:14](#msg5c9f79ac7ecbdc29caceffb8)@endo64 There were already some GOLs, but I PRed mine too.

## Monday 1st April, 2019

gltewalt

[22:37](#msg5ca292b4759abc043c4e17fe)!\[alt](https://i.imgur.com/pAWCEYH.jpg)

## Saturday 6th April, 2019

toomasv

[11:56](#msg5ca894081f6e900d5eea055c)I wondered how close to NL a dialect can be made without `parse`, i.e. based on `op!`s and `function!`s only, and it appears at least in some domains it can come quite close. I tried in family relations:  
\[!\[relations](https://toomasv.red/images/Deduction/infer0.gif)](https://toomasv.red/images/Deduction/infer0.gif)

And here is a fuller example with little help from `parse`: \[toy genealogy](https://toomasv.red/images/Deduction/infer.gif)

endo64

[12:31](#msg5ca89c05016a930a45725a86)A cool experiment once again @toomasv :)

toomasv

[12:40](#msg5ca89e2d0aad6350193a1514)One limitation is that `op!`s don't let to use mixed `lit-` and not-`lit-` arguments. If one is given as `lit-word` both are interpreted as `lit-words`. Thus funcs can't be used as second arg if first is `lit-word`. I wonder if this is intended.

9214

[13:00](#msg5ca8a2fb759abc043c774224)https://github.com/red/red/issues/3344

toomasv

[13:55](#msg5ca8afe925686a7dc3e62c1d)Ah, thanks!

greggirwin

[18:03](#msg5ca8e9efb34ccd69e7753af2)Nice @toomasv. Someone did a Prolog engine in R2, and some of my early Rebol experiments were on the unification side.

## Tuesday 9th April, 2019

toomasv

[19:32](#msg5cacf334b34ccd69e78f9dfd)Some steps further with syntax tree:  
\[!\[syntax tree](https://toomasv.red/images/Graph/ast1.gif)](https://toomasv.red/images/Graph/ast1.gif)

dander

[20:22](#msg5cacff0ba84e0c501a03edff)@toomasv That looks really cool. Nice work!

greggirwin

[21:13](#msg5cad0af5f851ee043d8dd2fd)Indeed!

## Wednesday 10th April, 2019

toomasv

[03:17](#msg5cad602ef851ee043d8fde46)Thanks!

endo64

[10:05](#msg5cadbfe9f851ee043d926358)That's very cool @toomasv !

toomasv

[10:15](#msg5cadc255b34ccd69e7951152)Thanks @endo64 ! As you see dialects are not correctly parsed yet. Lot to do still.

## Friday 12nd April, 2019

toomasv

[17:10](#msg5cb0c68c1f6e900d5e20cecf)Taught `ast` to recognize spec-dsl and added colors:  
\[!\[spec-tree](https://toomasv.red/images/Graph/spec-tree.gif)](https://toomasv.red/images/Graph/spec-tree.gif)

[17:38](#msg5cb0cd33b34ccd69e7a96f42)Analysis of the `collect` function:  
\[!\[image.png](https://files.gitter.im/red/sandbox/GQJc/thumb/image.png)](https://files.gitter.im/red/sandbox/GQJc/image.png)

greggirwin

[18:30](#msg5cb0d95c759abc043caecf28)Nice!

toomasv

[19:46](#msg5cb0eb0020fbe911eea54f1a):smile:

## Thursday 25th April, 2019

toomasv

[12:18](#msg5cc1a58ee416b84519da462a)\[Looking back at my two years of reducing](https://toomasv.red/Two-years.md.html) (Sorry for overgiffing!)

endo64

[12:26](#msg5cc1a77d5b3f941aa58cbad4)Wow! That's cool @toomasv !

rebolek

[12:28](#msg5cc1a8086a84d76ed8f12d3a)Great!

[12:29](#msg5cc1a819b4700e023dcdfe6a)Does it run in Microbrowser? ;)

toomasv

[12:49](#msg5cc1acc73d78aa6c03918dd5)@rebolek :) \[Easily](https://toomasv.red/images/Browser/Two-years.gif)

rebolek

[12:50](#msg5cc1acfe8790b0307efc9452):smile:

greggirwin

[17:11](#msg5cc1ea52b4700e023dcfdee7)Fantastic. Thanks for doing that @toomasv. And congratulations on being 2 years old.

toomasv

[17:15](#msg5cc1eb44e416b84519dc4aa8)Thanks, Gregg!

rebolek

[17:28](#msg5cc1ee3a8790b0307efe7fee)@greggirwin @toomasv when I was two years old, I was glad not to sh\*t my pants, this wizardry was absolutely out of my reach.

greggirwin

[17:33](#msg5cc1ef4d3d78aa6c039388e0)Some of it still looks like magic to me. I have to find time to dig through his code to see how it all works.

toomasv

[17:34](#msg5cc1ef933b6cb0686a50de67) :blush:

greggirwin

[17:38](#msg5cc1f07e6a84d76ed8f363e2)I do fear, @toomasv, that you may have made some Faustian bargain to achieve all this. ;^)

toomasv

[17:52](#msg5cc1f3c6e416b84519dc839b)The only bargain was with Red Foundation! Honestly

greggirwin

[18:01](#msg5cc1f5f53d78aa6c0393b89c)Close enough. }:^)

## Friday 26th April, 2019

Claudio08

[14:27](#msg5cc315622e2caa1aa6c21a19)@toomasv a gold mine! thanks

toomasv

[16:15](#msg5cc32e8d8790b0307e07492c)@Claudio08 :smile:

## Thursday 2nd May, 2019

Ungaretti

[21:51](#msg5ccb6649b4700e023d102fd2)@toomasv Truly amazing!!

## Saturday 4th May, 2019

toomasv

[18:08](#msg5ccdd516a4ef0974714c10fb)Thanks @Ungaretti !  
First steps towards railroad diagram:

\[!\[image.png](https://files.gitter.im/red/sandbox/ULVR/thumb/image.png)](https://files.gitter.im/red/sandbox/ULVR/image.png)

[18:19](#msg5ccdd7a1e416b845192dad52)To get these lines working correctly is agonizing:  
\[!\[rr-start](https://toomasv.red/images/Railroad/railroad.gif)](https://toomasv.red/images/Railroad/railroad.gif)

greggirwin

[19:02](#msg5ccde1ba5b3f941aa5e0462d)Agonizing for you, but \*fantastic* for the rest of us! ;^) That's exciting stuff.

[19:03](#msg5ccde1e58446a6023ec730d6)@toomasv, Red Rail Baron. :^)

[19:05](#msg5ccde26d8446a6023ec7337e)The design and thought process behind many of the things you've built would make great articles. From the outside, it's easy to simplify what needs to be done, but doing it brings out all the details that come into play.

toomasv

[19:24](#msg5ccde6ff1cd0b8307dc200aa)@greggirwin Writing an article is much more agonizing! I've failed on this more than once. :(

## Sunday 5th May, 2019

Phryxe

[05:18](#msg5cce721897dcb371d8669e3f)Impressive as always. Maybe we will see a genealogy program i Red some day? @toomasv

gltewalt

[14:31](#msg5ccef3be2e2caa1aa6120cff)What might be interesting -  
keep a diary along with the next little project that you do.  
Write down the thoughts before each piece of program (or even each piece of code), and when you have a working version 1, take the diary entries and make an article.

## Monday 6th May, 2019

toomasv

[19:35](#msg5cd08c922e2caa1aa61cdf49)\[!\[image.png](https://files.gitter.im/red/sandbox/RE6H/thumb/image.png)](https://files.gitter.im/red/sandbox/RE6H/image.png)

greggirwin

[19:55](#msg5cd09139e416b845194007e6)Snake diagrams?

## Tuesday 7th May, 2019

toomasv

[02:37](#msg5cd0ef726a84d76ed85a3f1d)Started to write an article but somehow this popped out from nowhere :flushed:

rebolek

[04:47](#msg5cd10dd38790b0307e653cd4)or a Python interpreter in Red?

## Wednesday 8th May, 2019

dander

[06:44](#msg5cd27acc8fcdb05d479ab3e4)@greggirwin  
&gt; Who wants to whip up a Red Source parse tool for finding patterns? :^) Could be a fun auto-refactoring experiment.

You're right, this was kind of fun: https://gist.github.com/dander/47d10aa43d04bfcd27080ba6f3cf04ba  
It shows the matched pattern, and relative location in the file as a path. A line number would be nice, but I'm not sure the best way to do that yet...

```
[%/C/Users/dave/Source/red/redcodex.red [[on-over: on-down: function] 85/4/14/5]]
[%/C/Users/dave/Source/red/tests/source/units/function-test.red [[
    a:
    b: function
] 1110/2/8/1]]
```

endo64

[10:49](#msg5cd2b4535a1d435d4605ff0a)Good work @dander , you can add `has` and `does` also.

toomasv

[18:17](#msg5cd31d336fd7c11cd8837161)Try-out: \[Expression syntax](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#33-expressions-and-evaluation-order)  
\[!\[image.png](https://files.gitter.im/red/sandbox/ZfjX/thumb/image.png)](https://files.gitter.im/red/sandbox/ZfjX/image.png)

BeardPower

[18:17](#msg5cd31d4cda34620ff909443e)Awesome!

toomasv

[18:19](#msg5cd31d9e5a1d435d460943af):smile:

## Thursday 9th May, 2019

greggirwin

[01:14](#msg5cd37f045a887e1cd9b5f758)Go @dander and @toomasv, go!

The line number part is tricky. Either you parse as a string, and count newlines, so the data isn't `load`ed, or...more fun, track locations in blocks and `new-line` markers.

OK, that's not actually going to be fun, and is something that should be built into `parse`. May require a refinement, though, to avoid the overhead of checking at every value.

dander

[03:24](#msg5cd39d588fcdb05d47a31ad1)What if load had a refinement that would populate some data structure with line numbers and offsets for each loaded value? It seems like something like that could find some other use cases as well.

greggirwin

[03:41](#msg5cd3a1815a887e1cd9b6d490)For the adventurous, `system/lexer/transcode` already has some newline counting logic in it.

dander

[03:56](#msg5cd3a4ff8fcdb05d47a34a72)@toomasv that does look great. I'd love to be able to auto generate a diagram like that from a set of parse rules.

[04:08](#msg5cd3a7c78fcdb05d47a35b9d)@greggirwin 😲 thanks for the hint

gltewalt

[05:04](#msg5cd3b4f079d70050993c8669)`system/console/prompt: rejoin ["Line " length? system/console/history " >>"]`

[05:05](#msg5cd3b52656271260f92db05e)Find away to loop that without it blocking, and `console session line numbers`?

[05:10](#msg5cd3b633b149ca50985ccc2f)Oh, that doesn't work :smile:

[05:13](#msg5cd3b6e1e7f42160fa59b13d):sweat\_smile:

rebolek

[05:14](#msg5cd3b747252dbb75152615c0)@gltewalt you are on the right track:

```
system/console/prompt: func [][rejoin ["Line " length? system/console/history " >> "]]
```

gltewalt

[05:17](#msg5cd3b7d279d70050993c996c)It was from my head without testing, so I was initially happy. Then I tested it. lol

[05:20](#msg5cd3b898f251e60ffa4d9926)I'm shocked that I remembered `system/console/history`, because I forget everything over the past year or so

rebolek

[05:39](#msg5cd3bd070f381d0a76849098):smile:

## Friday 10th May, 2019

gltewalt

[08:38](#msg5cd53880e7f42160fa645a02)can parse match non explicit newlines?

[08:39](#msg5cd538b9e7f42160fa645bf8)Or for that matter, spaces

rebolek

[08:40](#msg5cd538f95a1d435d46180644)of course

[08:41](#msg5cd539205a887e1cd9c22b53)

```
>> parse "a b^/c" [skip space skip newline skip]
== true
```

gltewalt

[08:42](#msg5cd53963252dbb751530ca53)So you could just parse newlines and increment a counter for line numbers?

rebolek

[08:42](#msg5cd5397a5a1d435d461809dc)in string? yes

moliad

[17:40](#msg5cd5b79bda34620ff91be947)@toomasv btw, I am seriously jealous of all the time you have for all these fun little applets. :smiley:

[17:49](#msg5cd5b994252dbb7515348e0c)I used to build a lot of these for Rebol2 :-)

toomasv

[18:29](#msg5cd5c30c56271260f93ca458)@moliad :smile:

## Tuesday 14th May, 2019

toomasv

[11:12](#msg5cdaa2a6252dbb751555490d)First draft of the first part of the \[interactive article](https://github.com/toomasv/article)

\[!\[snakeline](https://toomasv.red/images/Article/snakeline.gif)](https://toomasv.red/images/Article/snakeline.gif)

BeardPower

[15:29](#msg5cdadebd6fd7c11cd8b85c69)Great!

toomasv

[16:17](#msg5cdaea2c5a887e1cd9e8b606):smile: @BeardPower

endo64

[16:32](#msg5cdaeda2b149ca50988ecfde)@toomasv Very nice!

dander

[16:53](#msg5cdaf27d5d48a24fd0c95b26)yeah, really cool idea

greggirwin

[17:00](#msg5cdaf42e5a887e1cd9e8ff6e)Fantastic @toomasv !

toomasv

[17:09](#msg5cdaf6646fd7c11cd8b9052e)@endo64 @dander @greggirwin Thanks! Still long way to the end of it.

## Wednesday 15th May, 2019

rebolek

[08:32](#msg5cdbce9f5a887e1cd9eeb999)It reminds me of \[HyperNotes](http://rebol.net/demos/demo-contest.html)

moliad

[14:18](#msg5cdc1fb1da34620ff9473f92)ah the fabled demo competitions... these where fun.

greggirwin

[17:30](#msg5cdc4cace7f42160fa94a3d2)Hypernotes seems to be missing, along with some others. :^( But yeah, those were great. I remember Anton's Christmas Drive blowing me away.

## Tuesday 2nd July, 2019

rebolek

[06:18](#msg5d1af74399847a1a59d8d5e3)test

[06:19](#msg5d1af77b84cbda1764b101b4)Gritter works nice on Red/GTK :)

dander

[07:06](#msg5d1b028cf0f22f6645fa90d9)@rebolek 😁👍

## Thursday 4th July, 2019

toomasv

[13:51](#msg5d1e047f0ee3c30b1d86fed9)Some experiments with force-directed layouts:  
\[!\[force1](https://toomasv.red/images/Diagram/force1.gif)](https://toomasv.red/images/Diagram/force1.gif)  
\[force2](https://toomasv.red/images/Diagram/force2.gif)  
\[force3](https://toomasv.red/images/Diagram/force3.gif)

greggirwin

[14:11](#msg5d1e09176658420b1cf57114)Nice!

endo64

[15:59](#msg5d1e22595ce02535b023c9d4)may the force be with you :)

greggirwin

[16:01](#msg5d1e22c5b8926b674fe30d32)Well played. :^)

toomasv

[16:31](#msg5d1e29e084e3391a5ad84d36):smile:

## Friday 5th July, 2019

toomasv

[14:04](#msg5d1f58db77c54c13e60469fa)Flying the kite:  
\[!\[kite](https://toomasv.red/images/Diagram/kite.gif)](https://toomasv.red/images/Diagram/kite.gif)

endo64

[16:41](#msg5d1f7da7ccfbb80e41444e39)Very nice as always @toomasv :)

dander

[17:17](#msg5d1f861c5e957c4d48da3b48)Yeah, pretty interesting. I sense some cool visualizations coming 😏

toomasv

[17:40](#msg5d1f8b97b5d39c1bfefa1493)Thanks!  
Keeping bots at bay:  
\[!\[radial-force](https://toomasv.red/images/Diagram/radial-force.gif)](https://toomasv.red/images/Diagram/radial-force.gif)

GiuseppeChillemi

[20:57](#msg5d1fb9a25e957c4d48dbbb8d)👏👏👏

## Monday 8th July, 2019

toomasv

[14:05](#msg5d234da5cbe5956568c8928e)Formation of galaxies:  
\[!\[galaxies](https://toomasv.red/images/Diagram/force4.gif)](https://toomasv.red/images/Diagram/force4.gif)

greggirwin

[18:04](#msg5d2385b1b0027d2b19979ae2)I go away for a few days and you work your way up from new kites, to oceans, to galaxies? Sheesh! ;^)

dander

[18:10](#msg5d23871cf867ec1687d2b748)It's @toomasv . He's a machine! Toomas, have you been thinking about using this force layout for positioning your graph stuff? I wonder if that was the purpose from the beginning.

greggirwin

[18:21](#msg5d2389b5b0027d2b1997b6b5)What happens when I see his experiments, is that they trigger new ideas for me. In this case, I'm watching these visualizations, and imagining the nodes as software components in a distributed system. In a self-organizing system, you most often have generic, local rules. And the agents are likely homogeneous. In a heterogeneous system, how would we define rules for nodes picking which server to use, or how to apply backpressure in a congested environment, which may also lead to spawning new agents?

[18:22](#msg5d238a03d0e06b66756d03f2)That is, what are the forces, and reactions to them, that we could build into systems? Another view of reactivity.

toomasv

[18:58](#msg5d239248cdb70805c95ee468)These are still too deep questions to me :flushed: Above is part of diagram-styles. One of possible layout types for diagram. Hmm.. self-organizing diagrams of distributed systems sounds interesting.

dander

[19:19](#msg5d23975772d4092b1aaa0b2c)@greggirwin have you been thinking about distributed actor model stuff? I don't know much about it, but that's what came to my mind. Also container orchestration projects have been working on some of those problems, but it seems more like a top-down rather than bottom-up approach

[19:26](#msg5d2398ffacab0914d8d1b862)I was sort of thinking that once Red gets async, a decent inter-process communication model could replace 95% of the need for concurrency, and it's not too far a leap to go from external process workers to scaling across machines

greggirwin

[19:35](#msg5d239afabea9f357411cb4f9)@dander, yes. I have a favorite model, and lots of notes in the works for the team, so we can discuss various possibilities.

## Thursday 11st July, 2019

toomasv

[17:45](#msg5d2775b74d750532412a7b31)PoC of simple flowchart generator:  
\[!\[flowchart](https://toomasv.red/images/Diagram/flowchart.gif)](https://toomasv.red/images/Diagram/flowchart.gif)

dander

[18:49](#msg5d2784ae202bb93f0086e208)@toomasv really neat! Nicely done!

toomasv

[18:54](#msg5d2785fd3596f56f8cbf4ace)@dander Thaks!

greggirwin

[22:23](#msg5d27b6cb54d3383937ee4e52)@toomasv put that on the list to turn into a real app. For years I wanted to recreate AllClear (http://www.allclearsoftware.com/, ignore the cheesy video), and there are a zillion options today, online and otherwise, so the trick is to figure out how we distinguish ours. e.g., once you've got the logic branching, can you click on the generated face for a process and make notes or even write code?

Yahoo Pipes never took off in a big way, AFAIK, but it could go in that direction as well.

## Friday 12nd July, 2019

GiuseppeChillemi

[08:57](#msg5d284b89c3740260bb0a4054)I see infinite applications of Toomas work.

toomasv

[09:20](#msg5d2850cf3596f56f8cc4a6c7)@greggirwin Yes, sir! I looked at AllClear. It has impressive analytic features. My first purpose with this project is to be able to turn into flowchart (parts of) Red code. Descriptionally, I think `diagram-style` is ~ able to produce all their example diagrams, just not automatically. They seem to use totally different hierarchical description method. I'll try that for automatic generation.

GiuseppeChillemi

[15:28](#msg5d28a722eab6cd7763578848)@toomasv Hope the new version will be able to handle single mouse click and other events more than the last one, so we can easily update elements aspect to reflect the user action.

[16:03](#msg5d28af624d7505324132f184)@toomasv Looking at each change on GITHUB source. Seems that new events have been implemented and also I read the words "zoom" an "navigate".

[16:05](#msg5d28afbfd14e297762bc78e8)When I will be at home I wil try the modified to the examples.

[16:09](#msg5d28b0bb3b41924785a8efa4)However, there are a lot of changes !

toomasv

[16:12](#msg5d28b17a01621760bca0e36c)@GiuseppeChillemi Try the examples in the end. In the code there are many unfinished pieces, but examples contain what works. To try examples just change the number in `switch`.

GiuseppeChillemi

[17:11](#msg5d28bf2a202bb93f008faaaa)I have just seen all the example. I like a lot to be able to reposition a larger than screen diagram.  
Demo 8 is really slow here, it even slows down my notebook.  
The last one, "gregg example" is very elegant.

greggirwin

[17:19](#msg5d28c1134d75053241338388)@toomasv do you edit the `switch` line to run the tests? What about having a little GUI that let's you run the demos? Nice to have all of it in one script, which makes adding anything interactive conflict with loading a library, so the demo running could be extracted and separate. If still mainly for experimenting, build it in.

[17:20](#msg5d28c1494d750532413384c6)For me, I love running an example an seeing something happen, often copy-pasting from the clipboard for gists and such.

GiuseppeChillemi

[17:23](#msg5d28c2297dbfff324297195f)I think you could check if an ARG is provided and switch to its value

toomasv

[17:27](#msg5d28c2e5f4fe943971f71e89)@greggirwin Good idea, will do! Thanks.

[17:33](#msg5d28c4514d75053241339e2c)@GiuseppeChillemi Yes, demo 8 does lot of calculations and face moving. You can set lower numbers on lines 2009 and 2010 for `each`.

## Tuesday 16th July, 2019

toomasv

[18:21](#msg5d2e15b34f7f9e219c064077)Little steps forward:  
\[!\[flowchart](https://toomasv.red/images/Diagram/flowchart1.gif)](https://toomasv.red/images/Diagram/flowchart1.gif)

greggirwin

[18:38](#msg5d2e19b9d14e297762e2c1f2)One small step for @toomasv !

toomasv

[20:02](#msg5d2e2d393e2c7e397098fa30):smile: Here is part of your `array` func. Not perfect, but with expressions:  
\[!\[flowchart3](https://toomasv.red/images/Diagram/flowchart2.gif)](https://toomasv.red/images/Diagram/flowchart2.gif)

greggirwin

[21:59](#msg5d2e48bc3b41924785d08a06)Nice!

## Wednesday 17th July, 2019

toomasv

[18:15](#msg5d2f65c4eab6cd7763875e6e)Are these representatons of conditional loops (1) correct, (2) easily understandable? (3) Is there some significantly better representation?  
\[!\[conditional-loops](https://toomasv.red/images/Diagram/flowchart-loops1.png)](https://toomasv.red/images/Diagram/flowchart-loops1.png)

greggirwin

[18:32](#msg5d2f69d47dbfff3242c6b9e8)It's tricky. Is `a b c` a single expression, or just `c` as the test condition. Same for `a b` in `while`. And should there be a decision diamond? I do like the flow going down, with the `while` body out of that flow. But that's tricky too, because `until`'s body is inline. Did Edward Tufte do anything with flowcharts? I came across a Small Multiples article that led to \[this](http://www.visual-literacy.org/periodic\_table/periodic\_table.html) recently.

[18:37](#msg5d2f6ade3e2c7e3970a2133f)A key goal in data viz:

&gt; Shift the reader’s effort from understanding how the chart works to what the data says

[18:39](#msg5d2f6b78eab6cd7763878ce9)@rebolek @BeardPower note the breakdown in the periodic table by type, and the distinction between Data and Information visualization.

toomasv

[19:32](#msg5d2f77e53e2c7e3970a2790a)Letters represent expressions. So, in `until` block there are three expressions. While `until` block might be easier to follow if `c` was source of logic links, with `while` it would get scrumbled if `yes` link runs from `b` to `c` and back-link from `e` to `a`. Besides, if no-link runs back up inside the `until` block, it would become computationally much more complex as each expression-box may be of different length and we have to navigate around these. About diamond for decision-expressions -- it is nice for short expressions, but with long expressions angles become such that borders will cut text. Especially if condition is of the form e.g. `all [ ...]`. Diamond boxes seem to be suitable if we truncate expression to predefined length and show it on hover. So, currently I traded diamond for sky-color, applied to expression or to a block, if we have a condition-block as in case of `until` and `while`, where condition depends on the result of the computations in block.

The periodic table will take the rest of my evening (and probably dreams also).  
Will ponder on the key goal. Thanks!

greggirwin

[19:46](#msg5d2f7b1e54d338393725b3b0)Thanks for the explanation. Should haven been obvious, but I'm context switching a lot lately. :^)

Maybe some other visual affordance to denote loops, in addition to color?

toomasv

[20:14](#msg5d2f819401621760bcd1b1e6)I thought of adding text with the type of condition to the top of condition-block.

BTW, `array` is now fully generated:  
\[!\[flowchart3](https://toomasv.red/images/Diagram/flowchart3.png)](https://toomasv.red/images/Diagram/flowchart3.png)

greggirwin

[20:20](#msg5d2f82fdd14e297762ed2123)Nice!

## Thursday 18th July, 2019

toomasv

[12:35](#msg5d30678cd14e297762f31fc2)Breaking the spell:  
\[!\[break](https://toomasv.red/images/Diagram/flowchart-break.gif)](https://toomasv.red/images/Diagram/flowchart-break.gif)

endo64

[15:47](#msg5d30947fb74a8716e2775b17)Very nice!

toomasv

[19:10](#msg5d30c41fa26c1643bcd08f28):smile:

greggirwin

[19:47](#msg5d30ccc7202bb93f00c940ce)Indeed.

## Friday 19th July, 2019

rebolek

[05:28](#msg5d3154f8c89880134723c0d9)@toomasv https://argdown.org/#

toomasv

[06:42](#msg5d31666d5ea6e644ecde925d)@rebolek Thanks! It is a facinating project. And another possible application area for diagram-style. :yum:

rebolek

[11:51](#msg5d31aeb9a0351b1a8c5e9a51)@toomasv That's what I though :smirk:

BeardPower

[20:28](#msg5d3227d2d1cceb1a8d885f8c)@greggirwin It works unless we do not add the isotopes etc.

[20:28](#msg5d322801f9af9a44ed56b7a4)And nature has a plan ;-)

[20:29](#msg5d3228398fe53b671da09b50)@toomasv Nice tools for learning programming.

## Monday 22nd July, 2019

toomasv

[13:34](#msg5d35bb4a5ea6e644ecfc7fa5)@BeardPower Yes, I can be used for that too.

Are representations of `any` and `all` understandable and agreeable?  
\[!\[any-all](https://toomasv.red/images/Diagram/any-all.png)](https://toomasv.red/images/Diagram/any-all.png)

greggirwin

[17:39](#msg5d35f4d6d444310992750fee)They're nice, but also very similar. Great to have the `t/f` affordances there. That makes sense, as the functions they display are as well. But I'll throw out a quick thought, then ponder other ideas.

Is there any precedent in flowcharts to use weighting or patterns for true/false logic paths? e.g., true paths could be bold, or false paths could be dashed. Or maybe the `all` expressions butt right up against each other, without an intervening arrow, to show that they are a collective? Then your true arrow comes out of the last expression (which is returned), while false falls out the bottom of the enclosing blue frame.

In code, you generally want to write for the positive case first, as negation can be a speed bump when reading. But we've all seen plenty of code including our own, where we want to put the shorter logic branch first, because that also helps following the logic.

I pulled out Flow Based Programming, and he uses a couple annotations that sparked an idea for loops. Overlaying another decoration on the loop-again like, smaller arrows, * or + like kleene operators?

endo64

[20:34](#msg5d361dc28fe53b671dbbbd33)How about using different colors for `all`, `any` and others, that way we can distinguish them easily. Or putting a small text on top-left corner of the boxes.

toomasv

[20:38](#msg5d361edcd6188741641cc972)@greggirwin @endo64 Thanks for the suggestions! I will ponder on these and will try few different representations.

## Thursday 25th July, 2019

toomasv

[20:39](#msg5d3a1393ca086f6739da3ecd)At prompting from @greggirwin  
\[!\[rays](https://toomasv.red/images/Animations/rays.gif)](https://toomasv.red/images/Animations/rays.gif)  
\[Example](https://github.com/krisajenkins/elm-rays)  
\[Tutorial](https://ncase.me/sight-and-light/)

There are still some artefacts and flickering, but generally seems to work.

greggirwin

[20:45](#msg5d3a14ec6ec2e14223ecf879)Man, you'r fast! Woohoo!

[20:47](#msg5d3a15574a32b65507d67717)That tutorial is great too. Nice find.

[20:48](#msg5d3a159f095759422282ba9b)Once the code is up somewhere, announce it in red/red and we should tweet about it too. It's very cool and useful functionality.

toomasv

[20:53](#msg5d3a16bef4c906673aeada65)Will try tomorrow to get rid of flickering, then will announce. BTW, event/shift? and event/ctrl? seem not to work?! Will try further tomorrow.

greggirwin

[21:08](#msg5d3a1a460d0ffc3975827a08)Interesting. In the tutorial demo, the larger triangles flicker for me, and I can get the mouse in a position where they rendering goes awry.

[21:08](#msg5d3a1a49f4c906673aeaf019)\[!\[image.png](https://files.gitter.im/red/sandbox/4L1h/thumb/image.png)](https://files.gitter.im/red/sandbox/4L1h/image.png)

dander

[21:18](#msg5d3a1c966ec2e14223ed345a)yeah, seriously neat demo. Makes me think of a tactical shooter game

## Friday 26th July, 2019

toomasv

[17:27](#msg5d3b37faf3e76e13271087fd)In my version much less rays are created:  
\[!\[ray-lines](https://toomasv.red/images/Animations/rays4.gif)](https://toomasv.red/images/Animations/rays4.gif)

greggirwin

[17:47](#msg5d3b3ccdf4c906673af315da)Sorting and minimizing based on the number of endpoints? Nice.

[17:48](#msg5d3b3ceca8e8ed1328144c9e)The gradient addition is lovely too.

toomasv

[17:51](#msg5d3b3d9a6ec2e14223f555d5)I only take into account lines which are not intersected. No need to render lines/points which do not extend to original position.

greggirwin

[17:59](#msg5d3b3f93a8e8ed132814641e)So automatically scales based on the number of non-intersecting lines (lines \*not* hit by a ray)?

[18:00](#msg5d3b3fd004534306f331bf68)It seems the reverse of that, as I watch it.

toomasv

[18:24](#msg5d3b4559f4c906673af35d75)My algorithm is such:  
1\. Register endpoints from shapes  
2\. Set source of light  
3\. For each endpoint:  
a. Check if line from source to endpoint is intersected by some segment of shapes  
b. If not, add a (long) line to both sides of the current line as close as possible (ignore current line)  
c. Calculate their intersections (they have to intersect somewhere)  
d. Set closest intersection points as polygon points and register its angle from source  
4\. Sort points by their angles from source  
5\. Draw polygon

dander

[18:26](#msg5d3b45dbad9a483d8c46c432)@toomasv I bet you might find this game interesting: https://www.euclidea.xyz/

toomasv

[18:32](#msg5d3b474fa8e8ed1328149c40)Very nice! Thanks.

greggirwin

[18:37](#msg5d3b48596ec2e14223f5a160)@toomasv thanks for the explanation. Elegant.

@dander that's a very cool site. Ah, how much time can I spare...

[18:40](#msg5d3b491f4a32b65507df26e5)Now, to combine Euclidia with raycasting, where the goal is to use a fixed set of shapes to "shine lights" on the outer boundaries. That is, you can set your light source position, and are given a toolbox of shapes, and the target pattern is shown to start with. Move your source and place/move shapes to match it.

dander

[18:44](#msg5d3b4a1c04534306f33212b6)I just now found out that it was also a site. I've been playing it on my phone when I needed a distraction. Seems that soon we'll have android support... I could see something like that showing up in the store :smiley:

## Sunday 28th July, 2019

toomasv

[11:00](#msg5d3d8062d254cf27df921365)Exercise in ray-casting (and a primitive tuplespace?):  
\[!\[fly and spider](https://toomasv.red/images/Animations/fly.gif)](https://toomasv.red/images/Animations/fly.gif)

[11:20](#msg5d3d84e8840e2871805e0604)\[gist](https://gist.github.com/toomasv/b4dfcea98898b0c653998e6a05846a6e)

endo64

[13:39](#msg5d3da580b2f4075cb818c8df)Ruthless! :)

toomasv

[14:17](#msg5d3dae7f3e51d77b1b83452b)Nature...

greggirwin

[16:55](#msg5d3dd365d254cf27df945ab6)That...is great. All those watching, be sure to click on it, to see the detail int he spider and the fly, with just simple draw commands. Really nice @toomasv.

toomasv

[16:57](#msg5d3dd3e6a9200c242812f33c):smile:

greggirwin

[17:03](#msg5d3dd5737e00fc4ace659444)I imagine you're already thinking of the multi-fly scenario, and the making the underlying rays visible, as with the original raycasting demo. I like how the spider's logic makes him sit in wait for the fly. With flys eyes, there would be a lot of rays to cast. ;^) It would also be interesting to see a reactive approach. That is, rather than using the rate for the spider to monitor `bb` (the world/space), you could have the world be a reactor, which notifies agents of changes to the world state. They could still run logic on timers, which are just another type of world event (time passing).

toomasv

[17:21](#msg5d3dd997d254cf27df9487d5)Yes, \[two flies](https://toomasv.red/images/Animations/fly2.gif) are already flying .. and it's funny to see spider confused. Needs to develop some rational decision ability to choose which one to follow. And yes, I'll try with reactions and multiple messages into bb, scheduling actions etc. Happily, currently flies are blind (despite their huge eyes), but spider has excellent hearing.

greggirwin

[17:45](#msg5d3ddf41b2f4075cb81a5998):^)

[17:47](#msg5d3ddfb9c356af25e0447bb6)That's the fun thing about simulations (the confused spider). The ability to change simple rules and see new behaviors emerge, or understand the world by seeing things behave as they do, when it doesn't make sense. e.g., if you had a smart, planning spider.

## Monday 29th July, 2019

toomasv

[05:55](#msg5d3e8a5becf3bf7b1a56f70b)It's hard to be dumb. \[This species of spider](https://toomasv.red/images/Animations/fly3.gif) would die out quickly despite abundant food.

greggirwin

[06:31](#msg5d3e92cc071bb025df0d055c)Poor indecisive spider.

## Tuesday 30th July, 2019

toomasv

[09:51](#msg5d40132f84bc7a717feae5d0)\[This one](https://toomasv.red/images/Animations/fly4.gif) will survive, although it's a bit inflexible.

greggirwin

[16:07](#msg5d406b372136933a871aa3a0)Now \*that* is a smart spider.

toomasv

[18:30](#msg5d408ce184536e27e0780dc1)Added some \[fancy rays](https://toomasv.red/images/Animations/fly5.gif).

greggirwin

[19:33](#msg5d409b8fc356af25e0588472)&lt;hehe&gt; very fun.

[19:34](#msg5d409bbdf0ff3e2bba970ce3)I can see the next steps of pre-casting nets and struggling flies awaiting their doom.

toomasv

[20:10](#msg5d40a4447e00fc4ace79dfb5)Clairvoyant

greggirwin

[20:18](#msg5d40a5f97e00fc4ace79e959)Me or the spider? ;^)

## Wednesday 31st July, 2019

toomasv

[12:07](#msg5d418494e2802b6790a1cac7)The one who can see the next steps...

## Thursday 1st August, 2019

abdllhygt

[15:23](#msg5d4303ff7c87746165f2b964)hi!

[15:25](#msg5d4304707a151629e105b4aa)!\[qaja](https://media.giphy.com/media/hSQVZROxkOtheAvXg3/giphy.gif)  
it translate my conlang to indonesian language  
means: "yes, the funny parent ate this lemon when you walk on the street"

[15:30](#msg5d4305b145da450fec890d1a)\[github: qaja](https://github.com/abdllhygt/qaja)

toomasv

[15:59](#msg5d430c593d8f1f29e0f31a5f)@abdllhygt Nice! :+1:

greggirwin

[18:13](#msg5d432bde4b8ca519c9c93131)Nice to see you still enjoying Red and making progress @abdllhygt. Thanks for keeping us posted.

abdllhygt

[19:11](#msg5d433958ee80d76164ced4b4)@toomasv @greggirwin thank you

## Sunday 4th August, 2019

abdllhygt

[22:35](#msg5d475db67c8774616511a9b2)!\[qsl](https://media.giphy.com/media/igtV87VezcMj9wRUBF/giphy.gif)

[22:36](#msg5d475dd14b8ca519c9e6583b)qsl to indonesian

[22:48](#msg5d4760a1e939ab2447f8b176)!\[qaja](https://media.giphy.com/media/XDe2LthrACXkJeD9iF/giphy.gif)  
qisau qaja to indonesian

greggirwin

[23:18](#msg5d4767cee939ab2447f8e692):+1:

## Monday 5th August, 2019

abdllhygt

[21:13](#msg5d489c177a151629e12d2cac)is it more interesting if translating to english?

greggirwin

[21:21](#msg5d489dca4b8ca519c9ef8fce)Since I don't know your conlang, or Indonesian (aside from a phrase I memorized years ago), it would be for me.

abdllhygt

[21:25](#msg5d489eafa96def4751c39cac)indonesian has a really simple grammar. so, i selected indonesian for it. now, i want to make english lexer for taking some comments.

[21:26](#msg5d489eeb7a151629e12d43e2)because i can't tell someone this project in my life. and i want to talk with red users about it.

## Saturday 10th August, 2019

toomasv

[14:33](#msg5d4ed5abd03a7c63e602b279)On fire-line (\[gist](https://gist.github.com/toomasv/2f31327c6995c43dbc73bac9c4926e0f)):  
\[!\[shooting](https://toomasv.red/images/Animations/shooting.gif)](https://toomasv.red/images/Animations/shooting.gif)

endo64

[17:14](#msg5d4efb67bfd2887f53c5959b)Nice! limit the number of try so we can compete :p

toomasv

[17:40](#msg5d4f0178beba830fff6c5e80)Yeah, training mode and competition mode, moving target, several targets by time, wind etc. :smile:

greggirwin

[17:56](#msg5d4f05622612bb718c44309a)Woohoo! Angry Birds, here we come! I still fondly remember the Gorillas game that came with QBasic too.

I like your little bullseye dance. :^)

[18:06](#msg5d4f079653490e334dcb2f1d)The cannonball velocity is relative to your "pull" distance. My first shot I thought "Man, it's slower than his demo." ;^)

toomasv

[19:18](#msg5d4f1872a4efe3718ddcd9d8)Yes, I thought of Angry Birds when writing this.  
To improve hitting chances (read: to eliminate omissions) you can decomment the checkbox in the beginning of VID. But then it is not so fun any more.

## Monday 12nd August, 2019

toomasv

[13:17](#msg5d5166d390bba62a1261c56b)\[Added](https://gist.github.com/toomasv/2f31327c6995c43dbc73bac9c4926e0f) some variations and controls:  
\[!\[shooting2](https://toomasv.red/images/Animations/shooting2.gif)](https://toomasv.red/images/Animations/shooting2.gif)  
When trying out holopoint try with and without holding down `shift` to get some interesting variations.

greggirwin

[19:51](#msg5d51c358c87a0963e75c25b2)Fantastic! What does `hardness` do? My darts seem to meet a lot of resistance if I set it to 1.

toomasv

[20:19](#msg5d51c9c7beba830fff7f7538)Technically, hardness flattens the curve. Set trajectory on to see what happens to it with different hardness values. It may be thought of as hardness of the spring.

greggirwin

[20:25](#msg5d51cb56a4efe3718def2de4)Ah! The viz helps a lot. So setting it to one gives me such a weak spring that finding \*any* combo to hit the target is a \*real* challenge.

ctrl+click sets new start points, but old ones don't go away. `Clear` then shows errors in the console.

toomasv

[20:39](#msg5d51ce90a4efe3718def492f)Thanks for noting! I'll correct these tomorrow.

[20:43](#msg5d51cf5953490e334dde51c3)Hm. I get no errors. Will seek more with fresh head.

greggirwin

[21:58](#msg5d51e1069507182477c90a87)

```
*** Script Error: path wpn/2: is not valid for none! type
*** Where: set-path
*** Stack: view do-events do-actor do-safe
```

## Tuesday 13th August, 2019

toomasv

[13:58](#msg5d52c20853490e334de51815)@greggirwin I could not reproduce this, BUT I have new weapons! Gun is not finished but cannon is funny:  
\[!\[shooting3](https://toomasv.red/images/Animations/shooting3.gif)](https://toomasv.red/images/Animations/shooting3.gif)

endo64

[20:57](#msg5d53243ebeba830fff89252e)This is fantastic! :)

dander

[22:00](#msg5d5332e21db76d0ffec8e772)haha, I love that

## Wednesday 14th August, 2019

greggirwin

[00:12](#msg5d5351dba4efe3718dfa164f)AAAaaaahh! That's great. :^)

toomasv

[03:02](#msg5d5379cd1dadc42a11681902):smile:

[08:06](#msg5d53c10a90bba62a12726ae1)\[Shattering earlier projectiles](https://toomasv.red/images/Animations/shooting4.gif)

[10:08](#msg5d53ddabbb5364334c2bdecf)\[Rifle ~ready](https://gist.github.com/toomasv/2f31327c6995c43dbc73bac9c4926e0f)

greggirwin

[18:45](#msg5d5456d990bba62a1276cdba)So fun. Some other nice fixes too, like arrow and dart defaulting to pointing right rather than down. I tried each weapon in order, moved the canon before its first shot, and get this error:

```
*** Script Error: hop has no value
*** Where: +
*** Stack: view do-events do-actor do-safe
```

Can't wait for ports in Red, so we can easily do sound, and have balloon targets popping. :^)

Hearkening back to some old vector games, and I think we already have the exploding SVG tiger ported, does anyone know what kind of tools are used for creating things like that in games today? I can see doing random generation, previewing them, picking elements you like, then being able to tweak manually. e.g. start with the cannon, see 5 auto-generated explosions of its parts, pick the barrel from v2 and the wheel from v5, or even drag interactively, use a simple dialect like `high arc left and rotate slowly`. If a component is made up of sub-parts (rim and spokes in wheel), you could choose to keep them together or separate them.

[18:47](#msg5d54573c5178a72476899bfe)I may have noted other 2D physics engines, but can't find my list right now.

[18:51](#msg5d54583bbb5364334c2f8a93)http://box2d.org/ has a nice manual, which I now remember also mentions units it has to work with, which brings us back to a `unit!` type.

toomasv

[20:01](#msg5d5468ae4e17537f52309a09)@greggirwin Thanks, this time I caught it! Corrected. Now I got headache trying to figure out how to get longbow working. WIll meditate on your thoughts after a rest.  
Sound would be great addition! I also imagined puffs of smoke from cannon.

greggirwin

[20:08](#msg5d546a31bb5364334c301b07)Careful with that longbow, the French might not like it. ;^)

toomasv

[20:09](#msg5d546a65beba830fff9275b0):smile: Would crossbow be better?

greggirwin

[20:09](#msg5d546a707d56bc6080538eb2)One on each side. :^)

GiuseppeChillemi

[21:40](#msg5d547fcca4efe3718d02a764)@toomasv I won't try it. I have a fixed resolution monitor and I risk breaking it on each shot of the cannon.

greggirwin

[23:14](#msg5d5495cea4efe3718d0344f9)It correctly knocks the right edge to the next monitor for me. :^)

## Thursday 15th August, 2019

toomasv

[05:14](#msg5d54ea2d2612bb718c6da0c1)Should it instead knock the resolution? :confused:

greggirwin

[05:19](#msg5d54eb7fbfd2887f53ef3683)Noooo!

## Sunday 18th August, 2019

toomasv

[18:10](#msg5d599495beba830fffba1ca2)Took a quick sailing trip on weekend:  
\[!\[sailing](https://toomasv.red/images/Animations/sailing.gif)](https://toomasv.red/images/Animations/sailing.gif)

GiuseppeChillemi

[18:29](#msg5d59991553490e334d194f26)Beware, season is ending and sea condition could change quickly !

toomasv

[20:05](#msg5d59afa753490e334d1a0d90)Yes, taking advantage of the good weather and last days before September.

## Monday 19th August, 2019

greggirwin

[17:39](#msg5d5adec41db76d0ffe041f84)The Raycasting Regatta?

toomasv

[17:53](#msg5d5ae21dbeba830fffc51190)Minimal raycasting still, but potential for multiple strategy games. E.g. manipulating results with wind-shifts:  
\[!\[sailing2](https://toomasv.red/images/Animations/sailing2.gif)](https://toomasv.red/images/Animations/sailing2.gif)

greggirwin

[17:56](#msg5d5ae2e9bfd2887f531e192c)Nice. Your examples may prove very useful as we evaluate options for smooth animation.

toomasv

[17:58](#msg5d5ae34bbeba830fffc51cea)Currently the integer coordinates set certain limits and make movements and directions somewhat jumpy.

## Wednesday 4th September, 2019

toomasv

[14:05](#msg5d6fc4b16d7c672b45b24440)Hooray! Resuscitated my old \[zooming func](https://gist.github.com/toomasv/64f8dd8d142de4bc859ecd411cdb2d2e):  
\[!\[zooming](https://toomasv.red/images/Animations/zooming.gif)](https://toomasv.red/images/Animations/zooming.gif)

endo64

[19:45](#msg5d7014706d7c672b45b4bd01)That's brilliant @toomasv ! We should have a dedicated red/toomas room!

toomasv

[19:50](#msg5d7015708ab9652541baa9de):joy:

GiuseppeChillemi

[20:59](#msg5d7025a1b61aa038862b5562)@toomasv No joke, I agree with @endo64 !!!

greggirwin

[21:12](#msg5d7028ccb207005977172ef0)Sandbox is perfect, because @toomasv plays in it. :^)

[21:13](#msg5d702902d7201325423b0726)And yes, the zooming is \*really* nice, being mouse pos sensitive.

[21:14](#msg5d7029536d7c672b45b55391)Comments in the code will help those of us who don't live in `draw` to suss things out. I expected a lot more code. What's there is just...magic.

## Thursday 5th September, 2019

toomasv

[05:35](#msg5d709ea82f93ab5a1509d4bf)\[Comments](https://gist.github.com/toomasv/64f8dd8d142de4bc859ecd411cdb2d2e) added.  
\[Here](https://gist.github.com/toomasv/6734701334ac1e9e8c8e8714167e6ed9) is application with different faces:  
\[!\[zoom-and-move](https://toomasv.red/images/Animations/zoom-and-move.gif)](https://toomasv.red/images/Animations/zoom-and-move.gif)

GiuseppeChillemi

[05:47](#msg5d70a156ae44a84124818f7c)😮

dander

[08:00](#msg5d70c08532e48c5df23e52f1)@toomasv those demos look great! I noticed though that the coordinates used for zooming depend on the position of the window on the screen. So if you drag the box down and to the right and try to zoom, the objects jump around a bit.

toomasv

[08:06](#msg5d70c1ec767de913fc859049)@dander Thanks for reporting! On which platform? On W10 it doesn't do this. At least on Aug 9 build. It used to behave thus earlier and I had to find positions in relation to screen, but now it seems to be corrected on W. May be not on other platforms?

dander

[08:07](#msg5d70c22950508949d3dd2ce7)I'm on win 10 too, but it seems like a bit of an older build. I'll try updating and see if that makes a difference

[08:12](#msg5d70c362b3e2fc579357d6ad)@toomasv that fixed it :smile:

toomasv

[08:12](#msg5d70c374c38d6341239c2780):relieved:

dander

[08:13](#msg5d70c39cc59390272016bd09)it seems really neat and useful :thumbsup:

greggirwin

[19:46](#msg5d716616be4a3f13fdf334c8)@toomasv thanks! Nice updates. Once we get @rebolek's `stylize` in place, I can see people leveraging this a lot. Could be used for GUI designers as well as drawing and diagramming tools.

## Friday 6th September, 2019

rebolek

[06:01](#msg5d71f61fbe4a3f13fdf73cfa)@greggirwin I hope to finish it this month, I know where the problem is, but doing it right is, unfortunately, time-consuming as I have to recompile whole Red on every change. So it’s just a matter of time.

## Wednesday 2nd October, 2019

rebolek

[13:13](#msg5d94a2789d4cf17360577d04)Have you ever wondered if the current value is of type `x!` what's the probability that the next value will be of type`y!`? Probably not, I know. But I've got the stats anyway (for some random script that I used for testing):

```
#(
    word!: #(
        block!: 20.92675635277%
        file!: 0.1494768310912%
        word!: 54.85799701046%
        set-word!: 7.772795216741%
        refinement!: 3.139013452915%
        paren!: 5.231689088191%
        lit-word!: 0.5979073243647%
        char!: 1.046337817638%
        integer!: 1.644245142003%
        string!: 2.092675635277%
        get-word!: 0.1494768310912%
        path!: 2.391629297459%
    )
    block!: #(
        word!: 46.15384615385%
        set-word!: 53.84615384615%
    )
    file!: #(
        set-word!: 100%
    )
    set-word!: #(
        word!: 64.70588235294%
        map!: 1.960784313725%
        block!: 14.70588235294%
        path!: 7.843137254902%
        integer!: 4.901960784314%
        string!: 4.901960784314%
        char!: 0.9803921568627%
    )
    string!: #(
        word!: 66.66666666667%
        set-word!: 19.04761904762%
        char!: 4.761904761905%
        paren!: 4.761904761905%
        block!: 4.761904761905%
    )
    refinement!: #(
        refinement!: 14.81481481481%
        word!: 85.18518518519%
    )
    map!: #(
        word!: 50%
        set-word!: 50%
    )
    paren!: #(
        word!: 76.08695652174%
        paren!: 4.347826086957%
        string!: 10.86956521739%
        path!: 2.173913043478%
        set-word!: 2.173913043478%
        get-word!: 4.347826086957%
    )
    lit-word!: #(
        word!: 58.33333333333%
        lit-word!: 33.33333333333%
        string!: 8.333333333333%
    )
    path!: #(
        block!: 27.27272727273%
        word!: 54.54545454545%
        set-word!: 6.060606060606%
        set-path!: 3.030303030303%
        path!: 6.060606060606%
        string!: 3.030303030303%
    )
    char!: #(
        path!: 7.142857142857%
        word!: 57.14285714286%
        string!: 7.142857142857%
        set-word!: 21.42857142857%
        paren!: 7.142857142857%
    )
    integer!: #(
        word!: 52.94117647059%
        integer!: 5.882352941176%
        set-word!: 23.52941176471%
        path!: 5.882352941176%
        block!: 5.882352941176%
        set-path!: 5.882352941176%
    )
    get-word!: #(
        word!: 100%
    )
    set-path!: #(
        word!: 100%
    )
)
```

endo64

[15:42](#msg5d94c568290b8c354a15a4e3)@rebolek That's interesting. We can feed your code with more scripts and put the results somewhere, later we might update VS Code extension to use that and open a bracket after a word automatically.

rebolek

[18:54](#msg5d94f27024509b60469a3cc3)@endo64 thanks, I of course plan to feed it with more scripts and also to not check just by types but by value also.

greggirwin

[18:54](#msg5d94f2807fe6a605d16df989)\*Very* interesting indeed @rebolek. I did old stats on what funcs were used most commonly, and always liked that we could analyze Redbol code and data for this kind of insight. The 100% items jump out at me.

[18:55](#msg5d94f2a366c8b45122591794)I think you did something similar for the frequency of type usage, yes @rebolek?

rebolek

[18:56](#msg5d94f2e9eb1eff63d665746e)@greggirwin yes, I'm diving deeper and deeper into code statistics :)

greggirwin

[18:57](#msg5d94f32b6d4b2512c15594a5)What will be \*really* cool, is to tie this into ticket processing, so we can start to identify patterns that lead to bugs.

rebolek

[18:59](#msg5d94f37f290b8c354a170b53)@greggirwin I'm working on fuzzy tester, that's why I need these stats.

[19:22](#msg5d94f904462ada51233a09a3)And with fuzzy tester, identifying patterns that lead to bugs should be easier and automated.

[19:39](#msg5d94fd01fcb47b627f05f5d8)I've already got a few improvements in mind, now that it's working. Looking not for just types, but for specific values and checking not just one, but more values in advance. So with a few simple improvements, it should be able to identify things like `func block! block!`without looking at `func` definition.

endo64

[21:56](#msg5d951d05086a72719ea3bea2)@rebolek In the end we can use it many places like static code analysis, like PHPStan https://medium.com/@ondrejmirtes/phpstan-2939cd0ad0e3 or RIPS https://www.ripstech.com/

## Thursday 3th October, 2019

rebolek

[04:02](#msg5d9572e85173c33ca15b8681)@endo64 Thanks for links, I take a look at it.

## Friday 4th October, 2019

rebolek

[09:45](#msg5d9714a53220922ffb27ca49)Another useless statistic: there are 40984 blocks in Red source code, the average length is 8, 1923 blocks are empty and the longest block has 80662 values.

[12:14](#msg5d973794fcf7602cc52d2b5b)Another one, this time TOP20 of words in Red source!

```
--assert: 42872 
    --test--: 25730 
    =: 18293 
    strict-equal?: 12517 
    i: 6983 
    j: 6476 
    a: 4688 
    parse: 3996 
    not: 3449 
    make: 3431 
    b: 2588 
    none: 2519 
    to: 2367 
    equal?: 2268 
    ===start-group===: 2171 
    ===end-group===: 2157 
    -: 1995 
    skip: 1768 
    try: 1758 
    +: 1705
```

[12:15](#msg5d9737defcf7602cc52d2cfc)Non-symmetric `===start-group===` and `===end-group===` looks suspicious...

[12:22](#msg5d97398d37073b36a06bb881)So there are really some `===end-group===` marks missing in tests. For example https://github.com/red/red/blob/master/tests/source/units/find-test.red#L368 Looks like the statistics aren't that useless as I thought :smile:

endo64

[14:52](#msg5d975cac0e67130aae1316d4)Nice statistics!

greggirwin

[16:53](#msg5d9778f79735874673f6a36a)Good stuff @rebolek ! Being able to treat code as data this way is so great. We can learn from this. And we can do it like no other language, because the rich set of datatypes will provide even more patterns and information.

[16:57](#msg5d9779eb464b432fc1bc59f1)e.g., we can look at function specs, and correlate usage and issues. Given a func with a `series!` arg, how often is it called with each type or pseudotype of series? If it dispatches on type with `switch/case`, are all possible types covered? Do refinements get used? Do they lead to bugs? Are well-doc'd funcs less prone to errors in usage, or to internal bugs? Are there patterns associated with reliability based on bodies? It's a world of ways to look at things.

## Sunday 6th October, 2019

endo64

[00:55](#msg5d993b930e67130aae200e1a)I used this function once, it loads all values including the unloadable ones (by converting them to strings), could be useful for someone:

```
load-safe: function ["Loads all values, convert unloadable values to string" value] [
	ws: charset " ^-^/^M^(00A0)"
	r: load/trap value
	while [error? r/3] [
		;Stringfy the unloadable value
		either pos: find insert r/2 {"} ws [insert pos {"}] [append r/2 {"}]
		r: load/trap/into r/2 r/1
	]
	r/1
]

>> load "a 1k b 2xx4"
*** Syntax Error: invalid integer! at "1k b 2xx4"

>> load-safe "a 1k b 2xx4"
== [a "1k" b "2xx4"]
```

[00:58](#msg5d993c1a0e67130aae201094)Well, actually it is not safe as its name says :)

greggirwin

[01:09](#msg5d993ec6973587467302a73f):^)

[01:10](#msg5d993f1b7aa5602ffc779299)An interesting twist would be to provide a callback for unloadable values.

endo64

[11:58](#msg5d99d6cd7aa5602ffc7b6f2d)Yes, could be useful.

[12:02](#msg5d99d7bf3220922ffb3aadf3)I just realized `load/trap` points to the string position where the issue happen for `invalid value/syntax`:

```
load/trap {3"a}
== [[3] {"a} make error! [  <-- points to "
    code: 200
    type: 'syntax
    id: 'invalid
```

But, points to the string just after the issue, for `missing`:

```
load/trap {] 3}
== [[] " 3" make error! [  <-- point to space char after ]
    code: 201
    type: 'syntax
    id: 'missing
```

greggirwin

[19:23](#msg5d9a3f2c49c7720aaf78603e)Good to note. Maybe in Guru Meditations?

## Monday 7th October, 2019

lucindamichele

[01:17](#msg5d9a922aeac5612d22c9826b)@greggirwin : "Good stuff @rebolek ! Being able to treat code as data this way is so great. We can learn from this. And we can do it like no other language, because the rich set of datatypes will provide even more patterns and information." This is a seriously awesome application. It could make Red priceless for analysts evaluating large amounts of data.

greggirwin

[02:43](#msg5d9aa66b49c7720aaf7b1777)@rebolek we should get lang stats for the test and non-test parts of the code base. When you have time. :^)

rebolek

[06:38](#msg5d9add570e67130aae2b098e)@greggirwin of course, I just need to improve the loop to ignore some directories. An easy fix.

[07:18](#msg5d9ae6aae8de6f3ca0537fa8)@greggirwin top 20 words without tests:

```
integer!: 748 
    |: 661 
    if: 631 
    =: 436 
    make: 382 
    func: 350 
    either: 312 
    as: 301 
    value: 300 
    logic!: 261 
    block!: 259 
    any: 247 
    all: 240 
    +: 237 
    -: 228 
    none: 206 
    red-value!: 200 
    cmd: 194 
    function: 189 
    face: 188
```

9214

[10:48](#msg5d9b17e1eac5612d22cd23ae)@rebolek would be interesting to know if some of them are from Red or Red/System, make it dialect-sensitive to a possible extent.

rebolek

[11:42](#msg5d9b24bf874aeb2d23037f82)@9214 It's Red only. Dialect-sensitive - any ideas how?

9214

[11:49](#msg5d9b2638b385bf2cc68bbfda)@rebolek So `red-value!` is from routines? Taking file extension (`.red` / `.reds`) and headers into account would be a good start, and also `#system` with `#call`.

rebolek

[11:50](#msg5d9b267e92920c36a128809e)@9214 it checks `*.red`files only, but doesn't check for `#system` blocks yet.

greggirwin

[18:38](#msg5d9b86325173c33ca185e418)Wow. Look how small the numbers are without tests. It seems almost impossible.

[18:39](#msg5d9b864cb385bf2cc68e9cd7)Ah! %.red files only. Makes more sense.

rebolek

[18:39](#msg5d9b865337073b36a089c2d2)It means that the test suite is really big :)

greggirwin

[18:40](#msg5d9b86983220922ffb46a0e7)Now that we have some basics, and if @rebolek puts the code someplace we can all play, more ways to analyze will surely come.

rebolek

[18:43](#msg5d9b874a3220922ffb46a5f9)It's part of my Values editor - https://gitlab.com/rebolek/values/blob/master/tools/scanner.red it's older version (I will push newer one tomorrow, I have it on different computer) and needs `%func-tools.red`from my `red-tools` repo.

[18:44](#msg5d9b878549c7720aaf8166e0)There's no documentation as the functions are still evolving, but it should be easy to understand it.

[18:45](#msg5d9b87c149c7720aaf8168d5)`get-word-count` and `get-count` are probably most interesting functions (plus `-dir-` variants)

greggirwin

[18:54](#msg5d9b89d15173c33ca185fccc)I can look for my old analyzer as well.

rebolek

[18:57](#msg5d9b8a98fcf7602cc54b6e29)it would be useful to look at different approach

## Tuesday 22nd October, 2019

ne1uno

[22:18](#msg5daf804ae1c5e91508b83168)game to sort sequence by reversing sub-sequences \[reverser.red (https://gist.github.com/ne1uno/a5d79c0b7a8f9dac65f4737834b900b4)]

## Friday 25th October, 2019

ne1uno

[20:55](#msg5db36126ef84ab3786998c9b)@greggirwin updated gist reverser.red to remove no-wait . the console acts like -e and bypasses `either interpreted?` checker https://gist.github.com/ne1uno/a5d79c0b7a8f9dac65f4737834b900b4

## Saturday 26th October, 2019

toomasv

[03:23](#msg5db3bc419c39821509874c3d)Nice game! :+1:

endo64

[07:23](#msg5db3f45a2f8a034357dd0105)@ne1uno Doesn't `numbers` and `ordered` is same already? `numbers: random ordered: [1 2 3 4 5 6 7 8 9]`, `random` will shuffle in place.

ne1uno

[07:32](#msg5db3f6889825bd6baccf16d4)should be `copy` there? I didn't test it, that's from comments on the game link page.

endo64

[10:24](#msg5db41ef99825bd6bacd027b4)For Red and R3 yes there should be a `copy`, but `random` in R2 returns a copy the series (I misremembered this).

greggirwin

[18:04](#msg5db48abce1c5e91508dd32e2)Interesting. If I paste into the console it works. If I `do read-clipboard`, the console dies.

Fun indeed. I need to make a Red Distractions folder for this, Cave In, Island Alleys, and some others, just to relax but still be in a Red mindset.

toomasv

[18:55](#msg5db49687ef84ab3786a20b57)Good idea! :joy:

## Saturday 9th November, 2019

greggirwin

[21:43](#msg5dc73316fd6fe41fc05628fb):point\_right: \[Giuseppe's thought experiment from red/help](https://gitter.im/red/help?at=5dc72a095eb2e813dbf62c7c)

GiuseppeChillemi

[21:52](#msg5dc73513b95ae413dcac21af)@greggirwin Thanks Gregg, hope the room change won't kill the topic as it usually happens to discussions moved from a room to another.

[21:55](#msg5dc735ccfd6fe41fc05638cd)Regarding the observation and thought experiment, I have experienced a higher error chance when the output has elements which of that could reinforce the erroneous association.

toomasv

[22:04](#msg5dc7380350010612b28d1845)

```
>> split: func ['path][to-block path]
== func ['path][to-block path]
>> split my/path
== [my path]
```

GiuseppeChillemi

[22:10](#msg5dc7394b6ba2347d2d65807c)@toomasv  
Toomas, thanks but the experiment is aimed to have feedback from the people which have thought that `MY/PATH` would be split as \[MY PATH] and \[ANOTHER PATH POINTED BY] `MY/PATH`

[22:12](#msg5dc739eaca778c1fbfd472b7)No code should be generated but as usual you are very gentle and avalable when code is needed (and when it is not, like know :relaxed: )

## Sunday 10th November, 2019

toomasv

[06:26](#msg5dc7ada6eeb63e1a8388402f)Ah, sorry! As you started with \*“Let's create a SPLIT function:”* so I though to follow your instructions...

[06:29](#msg5dc7ae46b95ae413dcaf6829)-&gt; thought

GiuseppeChillemi

[09:47](#msg5dc7dcbb091dd14a0e94177d)@toomasv I used \*"Let's create..."* but I meant \*"Let's define..."\*. It should be a warning for the future to avoid writing to you things: \*"Let's conquer the world..."\*. I would not be responsible for WWIII !

greggirwin

[16:11](#msg5dc8369eca778c1fbfdaee62)Hey @toomasv, let's... };^)

toomasv

[16:23](#msg5dc8397d6ba2347d2d6c22c9)What?

[16:23](#msg5dc8399735889012b1e3a2ce)You want to start WWIII?

greggirwin

[16:27](#msg5dc83a66c26e8923c4fddbf6)Hey, I just want to conquer the world. If everybody else agrees, there's no problem.

toomasv

[16:28](#msg5dc83a90add5717a88e29227)Good for me..

GiuseppeChillemi

[18:08](#msg5dc8520b6ba2347d2d6cd7c6)@toomasv  
&gt; What?  
&gt; You want to start WWIII?

Yes, I want to get rid of those Visual Studio, and its, 80GB once installed, lovers. (Also Apple HQ)

## Monday 11st November, 2019

rebolek

[13:19](#msg5dc95fe2c26e8923c405b15e)I would like to propose a new datatype: `any-typo!`. It would accept anything I write and convert my typos to valid values.

GiuseppeChillemi

[13:45](#msg5dc966004adf071a840dcc49)@rebolek  
&gt;&gt; I would like to propose a new datatype: `any-typo!`. It would accept anything I write and convert my typos to valid values.

Why not for reboot resistant strings?

[13:46](#msg5dc966344adf071a840dcde4)You restart the REPL and words with those strings are still in `system/words` context.

endo64

[15:07](#msg5dc9792ceeb63e1a839490a2)&gt; I would like to propose a new datatype: `any-typo!`. It would accept anything I write and convert my typos to valid values.

Nice idea for the GUI console! ;) auto-fix, combobox for auto-complete, word suggestions from system/words :)

GiuseppeChillemi

[16:53](#msg5dc991f4b95ae413dcbcaeab)I have some ideas for an "augmented consolle". Would be really good for starters and debugging.

greggirwin

[17:43](#msg5dc99db4eeb63e1a83958e66)@rebolek we're working on that. A tool that, when run long enough, given your constraints, will eventually produce a correct program for you. The tricky part is finding which one of the ~100B versions (for simple programs) is the correct one.

rebolek

[20:43](#msg5dc9c80bca778c1fbfe6472d)With some AI and ML it would be pretty easy. And blockchain would also help. And of course cloud.

## Tuesday 12nd November, 2019

greggirwin

[21:32](#msg5dcb24d3fd6fe41fc072599f)CAMP-G: The Cloud AI ML Program Generator. Step 1 done.
