# Archived messages from: [gitter.im/red/sandbox](/gitter.im/red/sandbox/) from year: 2020

## Friday 3th January, 2020

rebolek

[12:17](#msg5e0f30ea6dda2430fec0b04b)Gritter test

## Sunday 12nd January, 2020

toomasv

[16:16](#msg5e1b467765540a529a049710)\[Color-by-dragging](https://gist.github.com/toomasv/e556609f624e30fa661ab3bf1627279e):  
\[!\[color-by-dragging](https://toomasv.red/images/Colors/color-by-dragging.gif)](https://toomasv.red/images/Colors/color-by-dragging.gif)

greggirwin

[18:38](#msg5e1b67a63254b6754c9869a9)Nice.

[18:39](#msg5e1b67d4a859c14fa1d408fa)I've done similar experiments for interactive value setting.

## Monday 2nd March, 2020

geekyi

[22:06](#msg5e5d837f8e04426dd01b1fcd)Yo. I finally got access to github, after getting locked out for a while..

rebolek

[22:07](#msg5e5d8396ec379e558e9fb5eb)Locked out? Why?

geekyi

[22:07](#msg5e5d83a7ec7f8746aaabaaef)2FA on phone

rebolek

[22:08](#msg5e5d83d23ca0375cb3980994)2FA. I see. I'm trying to avoid it if I can.

geekyi

[22:08](#msg5e5d83d6ca2f5a558d6042af)While cleaning up my laptop, I found some access codes

endo64

[22:09](#msg5e5d840790a8295824fefa08)What a luck! Otherwise it is impossible to get access to your account, even support team can't help on that.

geekyi

[22:10](#msg5e5d84383ca0375cb3980ac1)I took some precautions so it hopefully won't happen again. Problem was the original 2FA app by Google couldn't export or backup codes. Most modern apps do that..

greggirwin

[22:10](#msg5e5d844d8e04426dd01b213e)The F in 2FA stands for something else when that happens.

geekyi

[22:10](#msg5e5d846b8e04426dd01b217f):D

endo64

[22:10](#msg5e5d846f2e398f46abd72596):)))

geekyi

[22:12](#msg5e5d84b1d045e258250d84bc)Gitter doesn't appear to have changed one bit. It's still like I remember it

[22:12](#msg5e5d84c6cb91b5224f0808a5)My last message was in 2017 btw..

greggirwin

[22:12](#msg5e5d84cb7fef7f2e89989bcc)Even the bugs seem the same. :^\\

endo64

[22:13](#msg5e5d8515ec379e558e9fb948)Welcome back then!

rebolek

[22:15](#msg5e5d856e2e398f46abd7279e)@greggirwin that's not true, I follow Gitter development closely and there are some new bugs.

endo64

[22:15](#msg5e5d859ccb91b5224f080a0c):D

greggirwin

[22:19](#msg5e5d8666cb91b5224f080ba8)LOL!

geekyi

[22:19](#msg5e5d866d376d882250c90f16)\[!\[image.png](https://files.gitter.im/red/sandbox/IWbt/thumb/image.png)](https://files.gitter.im/red/sandbox/IWbt/image.png)

[22:19](#msg5e5d86727fef7f2e8998a01e)Meanwhile, I've been coding in a another language, but my computer still thinks it's Rebol :D

greggirwin

[22:19](#msg5e5d868aff6f6d2e887f4cb0)There can be only one!

geekyi

[22:22](#msg5e5d873e3ca0375cb398121a)@endo64

Thanks!

[22:37](#msg5e5d8a9dd045e258250d94cc)OK, gonna have to read and catch up on this later

## Thursday 5th March, 2020

toomasv

[20:57](#msg5e6167b5cb91b5224f12c767)Boundary-math with \[James' numbers](http://www.wbricken.com/pdfs/01bm/06number/bnums-complete/07bnums-james.pdf):

```
object [
	main:     [(res: 0 clear stack) struct collect keep (round/to res .001)]
	stack:    copy []
	res:      0
	unit:     ["*" (res: res + 1)]
	exponent: ["(" (insert stack res res: 0) struct ")" (res: (exp res)   + take stack)] 
	ln:       ["[" (insert stack res res: 0) struct "]" (res: (log-e res) + take stack)]
	invert:   ["<" (insert stack res res: 0) struct ">" (res: 0 - res     + take stack)]
	struct:   [any [
		exponent | ln | invert | unit | " "
	]]
	set 'bmath does [
		while ["" <> formula: input][
			print parse formula main
		]
	]
]
```

```
>> bmath
***
3.0
*** ****
7.0
******* <***>
4.0
([**][***])
6.0
([**** ****]<[**]>)
4.0
([*****]<[**]>)
2.5
(([[**]][***]))
8.0
(([[*********]]<[**]>))
3.0
(([[([********][**])]]<[**]>))
4.0
```

## Friday 6th March, 2020

rebolek

[07:08](#msg5e61f6fecb91b5224f1432e2)Brainfuck for mathematicians?

toomasv

[10:08](#msg5e622115c366b32c9adfd745)Something like that, yes.

## Friday 27th March, 2020

toomasv

[15:45](#msg5e7e1fa5c8bfec7e2c606072)\[replace-each](https://gist.github.com/toomasv/74a22688ff1efe12ebc8a647dffddd15)

```
>> print rejoin [greek "Hi there!" newline fr "Check it out."]
Ηι θερε!
ℭ𝔥𝔢𝔠𝔨 𝔦𝔱 𝔬𝔲𝔱.
```

greggirwin

[17:48](#msg5e7e3c637aae4c624073e73c)Nice. :^)

## Wednesday 3th June, 2020

toomasv

[08:12](#msg5ed75b50b101510b2034c012)Using console as live work-bench:  
\[!\[live](https://toomasv.red/images/Console/live1.gif)](https://toomasv.red/images/Console/live1.gif)

qtxie

[08:15](#msg5ed75c1ff0b8a2053acefa91)Awesome! 😍

rcqls

[08:16](#msg5ed75c66f0b8a2053acefafc)Amazing as usual! :clap:

rebolek

[08:17](#msg5ed75c872c49c45f5abcc028)Great :-)

toomasv

[08:20](#msg5ed75d463ffa6106f1f031d5):smile:

hiiamboris

[08:24](#msg5ed75e2f3ffa6106f1f033ef)Do you just remove the `state` facet from the `area`?

[08:24](#msg5ed75e43b101510b2034c741)And `parent`?

toomasv

[08:26](#msg5ed75ed37f08394226c3454c)I just don't show the facets changing of which doesn't make sense (that is for me, so far :) ).

hiiamboris

[08:27](#msg5ed75ee7f0b8a2053acf0169)I see ;)

pekr

[08:30](#msg5ed75fc2a3a1b13679c445bd)Brilliant - live coding born :-)

[08:31](#msg5ed75fd34c9b0f060d3f7c20)Just - why are () required?

toomasv

[08:32](#msg5ed7601c7f08394226c34a71)They are not required, just to keep sceen cleaner by returning `unset`:)

pekr

[08:32](#msg5ed760384c9b0f060d3f7d01)ah :-)

[08:33](#msg5ed7605389941d051a3da765)We need console mode to prevent printing result then :-)

GiuseppeChillemi

[08:50](#msg5ed7644522dd444224f6986a)@toomasv 2 questions: could we know the XxY position of `live` word after it has been draw?

[08:51](#msg5ed76494225dc25f54c291aa)Is there a way to change it, like color or font?

toomasv

[08:52](#msg5ed764bd4c9b0f060d3f8703)What do you mean by "`live` word"?

[08:52](#msg5ed764e6a91f120a6cddf269)Editing box?

GiuseppeChillemi

[08:56](#msg5ed765be7da67d06faebd8cd)The third line of the console at the left of the clock. I am asking if there is a way to change already printed elents in the console.

[08:56](#msg5ed765d3b101510b2034d9d5)\*elements

toomasv

[09:05](#msg5ed767bc778fad0b134381b7)Something like this?  
\[!\[live2](https://toomasv.red/images/Console/live2.gif)](https://toomasv.red/images/Console/live2.gif)

GiuseppeChillemi

[09:11](#msg5ed7694989941d051a3dbe1d)\[!\[image.png](https://files.gitter.im/red/sandbox/qSzb/thumb/image.png)](https://files.gitter.im/red/sandbox/qSzb/image.png)

[09:11](#msg5ed7694adaf4cf366edb626f)I mean already printed generic consolle text like the text I have pointed in the image

[09:13](#msg5ed769b29da05a060a4afcc8)`ty` characters, `panel` word, `304x0`, `>>`

[09:13](#msg5ed769ce778fad0b1343865f)I would like to discover the text coordinates and change it.

[09:17](#msg5ed76a8c89941d051a3dc1b0)This is to be able to either change text aspect in its position and also do things like painting a circle around a word like "Paint a circle on the first `live` word of the screen"

[09:18](#msg5ed76ae4b101510b2034e80d)Or "outline `304x0`"

[09:19](#msg5ed76b35b101510b2034e89a)Or "create an arrow which point to the `type` word".

toomasv

[09:28](#msg5ed76d43778fad0b13439124)Hmm. Interesting problem. Let me think..

GiuseppeChillemi

[09:36](#msg5ed76f30b101510b2034f304)Yes, if you solve this problem, \*"augmented help"* in Red could become a reality. It is a vision I have had more than a year ago and you are making it possible with your great skills.  
(Do you now see the connection with your `diagram dialect` and why I was so sad when I thought it wasn't developed anymore? )

toomasv

[10:14](#msg5ed7780edaf4cf366edb8897)I tink it is doable in principle. Main problem will be the moving target.

GiuseppeChillemi

[10:17](#msg5ed778bd778fad0b1343b132)I agree, the first soulution I see is to redraw the GFX with updated coordinates when a scroll happens but having it on a static text is already a great thing.

toomasv

[10:35](#msg5ed77cea225dc25f54c2cdf1)If affordances are placed on a dedicated layer, this layer can be scrolled in sync with base text.

planetsizecpu

[12:28](#msg5ed7975c89941d051a3e395f)Good job @toomasv

pekr

[13:19](#msg5ed7a3499da05a060a4b99dd)@GiuseppeChillemi what you request seems to be an implementation obstacle, which I am not sure is all that necessary .... or you want to have a Smalltalk like text editor, where you can run whatever code appears at the particular place of the page?

GiuseppeChillemi

[13:58](#msg5ed7ac917da67d06faec9aa3)Petr, I am just thinking about the user entering a text and an `augmented help` command will highlight the REPL code and draws arrows to or from it, pointing Diagrams to show additional help information, object structure and so on. To me REPL editing can remain as it was but the new Toomas experiments are showing us that higher interaction levels can be reached.

rebolek

[14:00](#msg5ed7ad167da67d06faec9c72)This sounds like a great gimmick but would be annoying as hell in everyday usage. However for some beginner's mode it makes sense.

GiuseppeChillemi

[14:28](#msg5ed7b393daf4cf366edc40ae)Yes, Boleslav the idea has just beginners as targets. The idea is to create an \*augmented REPL* for their first times on Red.

greggirwin

[18:14](#msg5ed7e89c2c49c45f5abe6543)@toomasv I love black magic...when the magician is on my side. :^) Very cool.

[18:33](#msg5ed7ed0a3ffa6106f1f1dc47)Nenad mentioned Inception recently, in another context, but this is...wow.

toomasv

[18:47](#msg5ed7f03aa91f120a6cdf8452) :relaxed:

TimeSlip

[18:56](#msg5ed7f262daf4cf366edcfbf7)@toomasv Wow.

GiuseppeChillemi

[20:02](#msg5ed801c3778fad0b134548a2)@greggirwin We will have full Inception when the main code block (or any other) will be able to see itself, and also when `parse`, side running from the the current data/code flow, will be able to interpret it and return back to Red when needed. (Something that reminds me Arexx on Amiga)

## Thursday 4th June, 2020

rebolek

[06:38](#msg5ed896e47da67d06faef0325)@greggirwin when the magician is on your side it's white magic ;-)

[06:42](#msg5ed897d7b101510b2037fa67)Which reminds me that there were five wizards in Middle Earth of which we knew only three by name: Gandalf the Grey, Saruman the White and Radagast the Brown. Now we finally know fourth: @toomasv the Red :-D

rcqls

[07:07](#msg5ed89dcd3ffa6106f1f36f27):smile:

toomasv

[09:29](#msg5ed8bee92c49c45f5ac05bde):neckbeard:  
@GiuseppeChillemi Seeds:  
\[!\[finder](https://toomasv.red/images/Console/finder1.gif)](https://toomasv.red/images/Console/finder1.gif)

rebolek

[10:19](#msg5ed8caabb101510b20388053):clap:

toomasv

[11:09](#msg5ed8d66a9da05a060a4ebb93)Just gimmicking :santa:

pekr

[11:19](#msg5ed8d8c1a3a1b13679c81849)Unbelievable 😀

greggirwin

[12:55](#msg5ed8ef4d4c9b0f060d439146)Toomas the Red! Yes! Great insight @rebolek. :^)

Go, Toomas (the Red), Go! Wow!

[13:08](#msg5ed8f249b101510b2038e8d4)There are so many possibilities for something like this.

\- Markers as you have above, which the user can configure, to go beyond syntax highlighting. Make certain things in code jump out, so they are there while you're working. Not only specific vars, but sets of them which are related.  
\- Rather than a single piece of text, the criteria could be `parse` rules, so you can visually lint code, show questionable formatting or constructs. That can be done in a tool, or a company's standards committee.  
\- Cross referencing. Arrows could be smart, based on some clever "distance" heuristic, so they change color, weight, direction, or length. That way, even though you can't see the other end point (though the arrow could be a clickable link to it), you get a sense of where the reference is.  
\- Per another chat on zooming, and as you did in DiaGrammar, a mini map of your code could show you a lot. Cross-ref arrows, at the line or module level, red flags for linting issues, markers for TBD bits, colors by "context". e.g. you set up rules for DB related code or memory allocations in R/S, even read v write, and suddenly you can see where and how many of those things occur.  
\- Use tickets and commits to see where bugs have been, and where fixes were made, including how extensive or widespread.

GiuseppeChillemi

[13:11](#msg5ed8f3093ffa6106f1f452dc)Yes Gregg, this is the idea. Give to Red an "Augmented REPL", something other languages do not have.

greggirwin

[13:14](#msg5ed8f3a24c9b0f060d439d67)This doesn't even have to be in the REPL. These can be standalone tools, part of an IDE, etc. Power tools for managers, visibility for FOSS projects. So many ideas!

GiuseppeChillemi

[13:17](#msg5ed8f468ff7a920a723009e7)@toomasv What can I say? Thank you for having realized my request. Now the whole community can see what I have imagined time ago. I am 100% sure they will start having more and more ideas (as @greggirwin is just doing!)

[13:21](#msg5ed8f54fa3a1b13679c86faf)Personally I can say one 2 things:  
1\) Toomas the Red, you are great!  
2\) Thank you for having believed in my words and realized this (And also diagram dialect which will come in handy here and in other scenarios)

[13:40](#msg5ed8f9e17da67d06faf0063e)@toomasv But! There is a \*last request* which was part of the vision I had, and I wish to ask if you could realize it now that you are working on this area:  
it would be really useful having a way to know the word/text element the mouse is hoovering (and also the coordinates) and have the corresponding mouse actor events fire. Why? To open windows with in-depth explanation/diagrams about that element if the user clicks on it or just a tooltip about the word that is being hoovered.  
Would be easy for you to realize it?

[13:48](#msg5ed8fbb9a91f120a6ce20441)@greggirwin  
&gt; This doesn't even have to be in the REPL. These can be standalone tools, part of an IDE, etc. Power tools for managers, visibility for FOSS projects. So many ideas!

Yes Gregg, the limit is just our imagination.

Also, there is another idea that would help all FOSS projects (and also private ones) which has born recently but I will keep the secret on it until I have realized its skeleton (but I have already left traces about it in red/help ;) ). It is parse based and only Red could make it possible. I will show you to have your opinion soon (tm!)

[13:53](#msg5ed8fce422dd444224fac485)(Note, I am keeping a link to your \[vision 1](https://gitter.im/red/sandbox?at=5ed8f249b101510b2038e8d4) and \[vision 2](https://gitter.im/red/sandbox?at=5ed8f3a24c9b0f060d439d67), it is really interesting and could be the source of many other ideas!)

[14:19](#msg5ed902fc22dd444224fae178)Have I ever said interactive REPL courses? (no, that's not the secret idea I was talking, but another one I had for Red that Toomas work has made possible)

toomasv

[14:21](#msg5ed9036ea91f120a6ce22224)Thanks for ideas, all! I'll have to digest it.  
Meanwhile.. this can be used for recording explanations, too:  
\[!\[finder2](https://toomasv.red/images/Console/finder2.gif)](https://toomasv.red/images/Console/finder2.gif)  
Writing notes stright on console would be needed, though.

GiuseppeChillemi

[14:26](#msg5ed904b37da67d06faf0283b)You need just 2 more buttons and you have already made a great tool: "screenshot to clipboard" and "screenshot to file" (Of the REPL area/window)... and here will be filled with annotations made with this instrumentl!

toomasv

[16:24](#msg5ed92055ff7a920a72309194)Voilà \[screenshooting](https://toomasv.red/images/Console/finder3.gif).

GiuseppeChillemi

[16:57](#msg5ed92812778fad0b13482f17):clap: :clap: :clap: :clap: :clap: Waiting to use it !

greggirwin

[18:22](#msg5ed93bda4c9b0f060d447d70)@toomasv even those simple drawing tools are fantastic, especially if `line` (which I'm guessing) snaps to horz for example. This makes for clean annotations, and you don't need to switch contexts (screenshot, open paint, paste, draw, save, ...)

GiuseppeChillemi

[18:38](#msg5ed93f974c9b0f060d448a3a)@greggirwin Also, if you save to the clipboard, with a simple CTRL-V you have the image pasted in Gitter! When we could add text together with arrows it will be a cointhe current, the tool is already usable!  
Well, today a new era has started. I am very happy for all of us!

toomasv

[18:56](#msg5ed943f47f08394226c85e80)Main problem for now is syncing with scrolling. And there are some tools more budding..

dander

[19:04](#msg5ed945bc9da05a060a5016e0)I'm curious how tools like this will open up when console plugins become available

## Friday 5th June, 2020

toomasv

[03:13](#msg5ed9b85f7da67d06faf20181)Good question! Besides @qtxie only wind and future know the answer :). Depends on how much the current structure will be altered. Anyway, for me it started as research into console's inner workings and there is much to learn! Still far from understanding all of it.

GaryMiller

[09:01](#msg5eda09f6b101510b203bd497)Symbolic Debugger with breakpoint/watchpoints and profiling running from a secondary IDE window seem like they could all benefit.

toomasv

[10:39](#msg5eda20e77f08394226ca87f4)I can copy the screenshot to clipboard and paste it from clipboard to some image program, but not to Gitter :( . Nevertheless, `%screenshot.png` file can be dragged into Gitter, also copy made in some image editing program can be pasted.

GiuseppeChillemi

[11:13](#msg5eda28d3f0b8a2053ad65dbf)\[!\[image.png](https://files.gitter.im/red/sandbox/2n1s/thumb/image.png)](https://files.gitter.im/red/sandbox/2n1s/image.png)

[11:13](#msg5eda28d3f0b8a2053ad65dc0)\[!\[image.png](https://files.gitter.im/red/sandbox/2n1s/thumb/image.png)](https://files.gitter.im/red/sandbox/2n1s/image.png)

[11:14](#msg5eda28fcff7a920a7233372d)I don't know why they are 2 but as you can see they where both copied

[11:14](#msg5eda2905225dc25f54c9caa9)Windows 10 here + Chrome

toomasv

[11:19](#msg5eda2a5adaf4cf366ee29f83)Copying text (or copy from image editing prg) is totally different.  
Try this:

```
write-clipboard draw 100x50 [text 10x10 "Some text here"]
```

And paste it to Gitter.

GiuseppeChillemi

[11:24](#msg5eda2b567da67d06faf338a7)\[!\[image.png](https://files.gitter.im/red/sandbox/BAPI/thumb/image.png)](https://files.gitter.im/red/sandbox/BAPI/image.png)

[11:24](#msg5eda2b66ff7a920a72333d74)It was not a copied text

[11:24](#msg5eda2b78a91f120a6ce52faf)This time I have grabbed an area with GFX to not make confusion

[11:25](#msg5eda2ba289941d051a44e879)This hs been copied too.

[11:25](#msg5eda2ba5225dc25f54c9d2f3)Trying

[11:28](#msg5eda2c757da67d06faf33aa9)@toomasv Toomas, I confirm I CAN'T paste it here. (But I can paste it everywhere!)

toomasv

[11:30](#msg5eda2cd14c9b0f060d46e181)Alas.

GiuseppeChillemi

[11:30](#msg5eda2cf222dd444224fdf39b)I make to myself a different question: which properties has the Red made clipboard image to not be accepted but the other software copied images are ?

rebolek

[11:31](#msg5eda2d1a89941d051a44eb18)it's probably too red

GiuseppeChillemi

[11:33](#msg5eda2d7a7f08394226caacb8):-D

toomasv

[11:34](#msg5eda2dc52c49c45f5ac42df4)\[!\[image.png](https://files.gitter.im/red/sandbox/PWL3/thumb/image.png)](https://files.gitter.im/red/sandbox/PWL3/image.png)

GiuseppeChillemi

[11:44](#msg5eda301cdaf4cf366ee2ad2a)You made it!?

toomasv

[11:45](#msg5eda305522dd444224fdfbda)No, just text annotation adding.

GiuseppeChillemi

[12:25](#msg5eda39ac2c49c45f5ac44e75)&gt; No, just text annotation adding.

Nice!

pekr

[13:30](#msg5eda48ee4c9b0f060d4730c2)@toomasv popularised your work a bit in terms of the Red FB group :-)

toomasv

[14:29](#msg5eda56b59da05a060a52ee97)Thx! Which group is it? Apparently not "Redprogramminglanguage"?

pekr

[15:52](#msg5eda6a4b89941d051a45ae4c)It seems to be the one?

[15:53](#msg5eda6a7722dd444224feaa2f)https://www.facebook.com/groups/redlanguage/

toomasv

[16:09](#msg5eda6e32778fad0b134b8a1d)Ah, thanks!

## Tuesday 9th June, 2020

toomasv

[14:38](#msg5edf9ed7035dfa12610cfbf8)Making use of console styles:  
\[!\[styles](https://toomasv.red/images/Console/styles1.gif)](https://toomasv.red/images/Console/styles1.gif)

greggirwin

[16:24](#msg5edfb7c3a85de303940216bf)Nice! The color selector looks like an efficient approach, both for UI space and selection.

toomasv

[16:48](#msg5edfbd747b6da9126a844c81)Added it all to the \[repo](https://github.com/toomasv/console-tools). No usage docs so far, but you can try any of these short commands:

Simple figures:

```
circle
ellipse
square
rectangle
box
arrow
```

Also you can add any face with `console add`.

Other tools:

```
notes        ;take quick notes while playing (try `note 'last | note <int>` or enter issue(s) as marker(s) and then `note/to #start #end` )
finder       ;find words and draw on screen, capture into %screenshot.png
live <lit-word or lit-path> ;live editing experiment
reminder     ;experiments with reminder
history      ;quick selection from console's history (with contextual menu) into notes or caret (click)
define       ;adaptation of @rebolek's `where`
helper       ;console hot-keys only so far
styles       ;play with console's styling options
```

greggirwin

[17:06](#msg5edfc18824a3382d5d57812e):+1:

GiuseppeChillemi

[18:55](#msg5edfdb2a30401c1f24471d66)Great!

endo64

[20:49](#msg5edff5f17c64f31f114e8deb)Great work @toomasv !

## Wednesday 10th June, 2020

toomasv

[03:02](#msg5ee04d595782a31278ed555f)Thanks!

## Thursday 11st June, 2020

toomasv

[11:28](#msg5ee2154130401c1f244d72d7)Added inspector to helper:  
\[!\[inspector](https://toomasv.red/images/Console/helper1.gif)](https://toomasv.red/images/Console/helper1.gif)

pekr

[12:14](#msg5ee22020ee693d6eb3ba5b72)awesome ... I would add such a tools into a Tools menu in a console :-)

toomasv

[12:22](#msg5ee2221c30401c1f244d9238)Yep, that is TBD.

GiuseppeChillemi

[13:04](#msg5ee22be5a85de30394091730)@toomasv You have totally made real my idea and it is even better than the way I have thought it (As it happens when ideas are open and free). Now it is walking and growing up with you. God bless you! Thank you again.

[13:11](#msg5ee22d6f7c64f31f1154a0bf)Now that everything is ready, I wish to give you another input, which is the most important for the future of Red (and believe me, I am very serious writing this). I am preparing a little screenshot and I will be back in few minutes.

toomasv

[13:36](#msg5ee2335e7a7f8d2d632baf71)@pekr Added "Tools" menu  
\[!\[Tools-menu](https://toomasv.red/images/Console/menu1.gif)](https://toomasv.red/images/Console/menu1.gif)  
@GiuseppeChillemi :)

pekr

[13:43](#msg5ee235122cf2f36eae52a1c3)How did you add that menu? In the sources? Or is that just VID, so that you can add it danymically? :-)

[13:44](#msg5ee23535035dfa1261147707)Dunno what RedTeam means by the console plugins, but you just created some nice ones!

toomasv

[13:47](#msg5ee235e230401c1f244dcf4b)Menu is just a block, changing `on-menu` actor was more interesting. But with Red's reflective powers it is pure fun.

GiuseppeChillemi

[14:26](#msg5ee23f137b6da9126a8b857c)@toomasv  
I have changed my mind, it is OK to continue here.

We have a problem with what I have called \*\*the invisibility of the context\**

Please look at this block:

`[a a a]`

When the newcomers look at it, they will see 3 equal symbols (words) and they have absolutely no clue they could have 3 different contexts.  
Such invisibility, when they start using Red, let them create their Red knowledge without this important topic.  
Part of our learning is inferred from what we see, so \*if contexts are visible from the very first steppes, the wiring of their neurons will be "context-aware"*  
To make contexts visible I have had some ideas:

1\) Hoovering a word with the mouse, on an auxiliary pane you should be able to see its context (you already have everything to make it possible)  
2\) A kind of `context-id` should be shown in the heading of such pane or overing a word, in the REPL, so if the users see 2 different IDs, they will also acknowledge that contexts that display the same are different. (But I don't think it could be possible, as Red does not make the internal context ID available)  
3\) We could show a partial part of the context content. A `show-context 'word|[words]` could make visible the start of the context contents as tooltips.  
4\) You even colorize the words of REPL which display the same in a different way if they belong to a different context.

I repeat, the most important part is to make the existence of context visible to let them be contexts aware. Let the user see it from the very beginning.

toomasv

[15:10](#msg5ee2497a013105125a2bd9f9)@GiuseppeChillemi This is challenging!

GiuseppeChillemi

[15:20](#msg5ee24bb3a85de30394097ca3)You have solved all the challenges I have given to you, building complete toolsets from just a few words . I don't think there is such an impossible challenge for you, just some that will take more time than planned ;-)

toomasv

[15:41](#msg5ee250aea85de30394098d97)Here is a simple(r) solution, where you can check context with `ctrl?` I have to meditate on a more subtle way.  
\[!\[helper2](https://toomasv.red/images/Console/helper2.gif)](https://toomasv.red/images/Console/helper2.gif)

GiuseppeChillemi

[16:11](#msg5ee257c77b6da9126a8bd09c)Nice. I see that half of the right pane is empty. Why just don't you split it and show both context and help ? (One on the top part, one on the bottom part)

hiiamboris

[17:55](#msg5ee2702c1e099b0388be513d)I was going to say the same as Giuseppe did in his clause (1). However funny thing is that once displayed on the console (molded), the context info is lost. I guess it's possible to infer where each word belongs to, from it's indentation and console history. But this will still be not a precise way (although maybe good enough in 95% of cases), as the contents of the context under inspection might have changed since. And it feels like fighting the design of the console.

toomasv

[18:06](#msg5ee2728830401c1f244e80bd)I think this is a bit better than previous  
\[!\[context checking](https://toomasv.red/images/Console/helper3.gif)](https://toomasv.red/images/Console/helper3.gif)

Checking context of word directly on hovering needs some thought still.

hiiamboris

[18:11](#msg5ee273d3ee693d6eb3bb58cf)And console logic modification ;)

[18:12](#msg5ee2741a7a7f8d2d632c7793)And a hacked `mold` ;)

toomasv

[18:14](#msg5ee27479035dfa12611532fa):) With some parsing hocus-pocus it could be done, but is unsafe, as requires extra evaluation of possibly harmful data/code.. :( (Actually, it is unsafe now too.)

hiiamboris

[18:15](#msg5ee274d149260560aa558e6e)Why evaluate?

toomasv

[18:17](#msg5ee2753924a3382d5d5f23c9)To get the context, otherwise I think it needs implementation of extensive logistics to determine where the context is set.

hiiamboris

[18:18](#msg5ee275787b6da9126a8c27b0)Ah, you mean paths like `c/1`?

toomasv

[18:20](#msg5ee27601013105125a2c5dd7)Nevermind, I may be confused on this, have to go now.

TimeSlip

[18:46](#msg5ee27c185782a31278f35984)@toomasv That is just an incredible tool you have made. Do you think you could add a way to capture the info that is being displayed? Perhaps optionally saving it to a log that can be later inspected. I often have to do that to study what's going on, grabbing a bunch of text and pasting it into my editor. That Context function is going to be a life-saver. I don't know how many times I've wondered, what in the world is going on with this "stupid" Word? Thanks for working on this.

greggirwin

[19:23](#msg5ee284b25782a31278f36ded)@toomasv Wow! :clap::clap:

toomasv

[20:08](#msg5ee28f392cf2f36eae53a1f0)@greggirwin :)  
@TimeSlip `Notes` is general note-taking tool. Needs some work still, but I added a `Note` button to Helper:  
\[!\[note-helper](https://toomasv.red/images/Console/helper-notes.gif)](https://toomasv.red/images/Console/helper-notes.gif)  
Did you mean something like that?

TimeSlip

[22:45](#msg5ee2b414035dfa126115d789)@toomasv I should have asked you to add a "Time Travel" button! Sir, you got it. Does it continuously add to the note so that, for example, you could click on C/1 ,C/2, and C/3 and have the info concatenated?

greggirwin

[22:48](#msg5ee2b4b130401c1f244f270b)@TimeSlip what about highlighting a section, and analyzing it as an expression?

GiuseppeChillemi

[23:12](#msg5ee2ba5a5dcbb760b6e459c6)&gt;&gt; I think this is a bit better than previous  
Yes, it is nice.

Now context is present and always visible!  
I think I could drop the request to have a visible CONTEXT-ID to handle the special case `[a a a]` when all symbols have the same value and context have equal content or no other content. This because such a scenario happens not so often and we have enough context visibility to let newcomers automatically suspect the contexts can be different.

[23:12](#msg5ee2ba657a7f8d2d632d2c91):clap: :clap: :clap:

## Friday 12nd June, 2020

TimeSlip

[02:11](#msg5ee2e46b29d8bc28f9ef7f1f)@greggirwin That would be good too. I'm thinking in terms of what gotcha's I normally run into. Mostly user error so I'm thinking, what tools could be helpful to find them. With that in mind, having a way to look at "behaviors" seems helpful.

toomasv

[03:24](#msg5ee2f550ef5c1c28f01a4ce9)@greggirwin

&gt; what about highlighting a section, and analyzing it as an expression?

As in \[syntax-highlighter](https://toomasv.red/images/Syntax-highlighter/syntax-highlighting.gif)? Good idea!

@TimeSlip

&gt; Does it continuously add to the note

Yes, but I intend to improve it, so that you can save it to notes with e.g. double-click. Then you don't have to fix it, go to panel, click "Note", go back, unfix. Saving 5 steps.

[03:34](#msg5ee2f7e17a7f8d2d632daaa9)@GiuseppeChillemi What did you think of using diagrams for in this context?

greggirwin

[04:30](#msg5ee304d730401c1f244fda95)&gt; As in syntax-highlighter?

Yes. It will turn into deep visualization R&amp;D for sure. Consider (historically) that we can `probe` single values (the `print` model of debugging), and set breakpoints or watchpoints on vars. An expression could show you not only the final result, but intermediate results that don't have vars defined for them.

A contrived example:

[04:30](#msg5ee304dd29d8bc28f9efbd18)\[!\[image.png](https://files.gitter.im/red/sandbox/Rm92/thumb/image.png)](https://files.gitter.im/red/sandbox/Rm92/image.png)

toomasv

[05:57](#msg5ee31944ef5c1c28f01a9b7a)Nice example! But it still shows results of (intermediate) expressions, no?

greggirwin

[06:01](#msg5ee31a4c49260560aa571777)Yes, that's what I meant. So you don't have to set vars to see them. At a glance you might see where an unexpected result shows up in the chain.

[06:02](#msg5ee31a7b30401c1f24500a3c)What I meant was that it \*should* show them.

toomasv

[06:03](#msg5ee31ab3ef5c1c28f01a9f6d)Yes, sorry, acted on quick thought, w/o further thinking :flushed:

greggirwin

[06:52](#msg5ee326232cf2f36eae54f6e6)NP. e.g. I'm thinking you set a breakpoint, then highlight an expression, and you probably figured out that the `...` means you're not at the head of the block. There could even be decals/hints about how many items come before or after, so you can keep the hints short and ellipsize both ends.

[06:52](#msg5ee3262f29d8bc28f9f00856)Like a reverse `range`. ;^)

toomasv

[10:55](#msg5ee35f2e7b6da9126a8e455a)Quick \[attempt](https://gist.github.com/toomasv/22c14738f37070676eb0ebe7a6db0401) for simple cases:

```
blk: [a b c 1 + 3]()
show add first back find blk '+ first next find blk '+

blk: [a 2 b 3 c 4]()
show power add first next find blk 'b last blk pick blk first next blk
show power add blk/b blk/c blk/a
```

Results:

```
>> show add first back    find blk '+ first next find blk '+
        4   1     [1 + 3] [+ 3]       3     [3]  [+ 3]
== 4

>> show power add first next    find blk 'b last blk pick blk first next blk
        49    7   3     [3 c 4] [b 3 c 4]   4        2        2     [2 b 3 c 4]
== 49

>> show power add blk/b blk/c blk/a
        49    7
== 49
```

hiiamboris

[11:09](#msg5ee362552cf2f36eae558b3d)https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/show-deep-trace.red

toomasv

[11:19](#msg5ee364b5ef5c1c28f01b5f1b)Nice! I was aiming at syncing results with code as per @greggirwin's example above.

hiiamboris

[11:31](#msg5ee3677429d8bc28f9f0b368)☻ Yeah this is challenging  
Let's see. `trace-deep` gives you the copied expression to be evaluated, which you can look for (deeply) in the original. Although it's not a 100% precise method. It copies because it modifies the original, while it evaluates.

[11:32](#msg5ee367d4013105125a2ea7c1)So, to be able to map the evaluated snippet back to the original, we could add some sort of deep path (e.g. `original/1/3/2/4...`) to serve as a pointer.

[11:33](#msg5ee367ef29d8bc28f9f0b517)Messy, but doable ;)

toomasv

[12:46](#msg5ee379387c64f31f1157ed3c):+1:

GiuseppeChillemi

[13:31](#msg5ee383b35dcbb760b6e63380)@toomasv Diagrammar in this context could have been used to navigate blocks and contexts or represent them in a linked or a separate way.

[13:31](#msg5ee383ba30401c1f24511afe)\[!\[image.png](https://files.gitter.im/red/sandbox/xTrr/thumb/image.png)](https://files.gitter.im/red/sandbox/xTrr/image.png)

[13:32](#msg5ee383ec7a7f8d2d632f0467)But I think you have bettered the idea with your panel!

[13:34](#msg5ee3846f5782a31278f5e02d)I find it handier and it does not give you any headache implementing block structures.

[13:35](#msg5ee384b330401c1f24511e34)But there is something else we can use Diagrammar for:

[13:53](#msg5ee388cc035dfa126117d101)Newcomers find it difficult to read a long phrase because they do not handle how Redbol languages build the argument of functions when multiple functions are nested and their return values become another one argument.  
The reduction and execution tree could be graphically explained:

[13:53](#msg5ee388ea29d8bc28f9f105c6)This is idea 1:

[13:53](#msg5ee388ef013105125a2efd34)\[!\[image.png](https://files.gitter.im/red/sandbox/cmzS/thumb/image.png)](https://files.gitter.im/red/sandbox/cmzS/image.png)

[13:54](#msg5ee389161e099b0388c10e03)These are idea 2 and 3:

[13:55](#msg5ee389387b6da9126a8eb7f4)\[!\[image.png](https://files.gitter.im/red/sandbox/wJ2F/thumb/image.png)](https://files.gitter.im/red/sandbox/wJ2F/image.png)

[13:56](#msg5ee389a2013105125a2eff8d)Hoovering a word and hitting a key the reduction tree relative to the word should be displayed

[14:01](#msg5ee38a9f5782a31278f5f643)But the story has demonstrated that things should be kept simple, so here is the essence of the idea (The reason why I have asked you if words can be outlined)

[14:02](#msg5ee38ae47b6da9126a8ebca8)\[!\[image.png](https://files.gitter.im/red/sandbox/xRFT/thumb/image.png)](https://files.gitter.im/red/sandbox/xRFT/image.png)

[14:02](#msg5ee38af824a3382d5d61c4f5)This is the result of hoovering of `find`

[14:03](#msg5ee38b47035dfa126117d782)\[!\[image.png](https://files.gitter.im/red/sandbox/yQSL/thumb/image.png)](https://files.gitter.im/red/sandbox/yQSL/image.png)

[14:04](#msg5ee38b585782a31278f5f7fa)This is the result of hoovering on `pick`

[14:09](#msg5ee38cab5dcbb760b6e64e96)You have already created everything in text mode and in this context to diagrammar remains just the role to embelish what you have already done like creating boxes, rounds, retangles and rows with text inside to be later screeenshotted!

[14:11](#msg5ee38cfa7a7f8d2d632f22e0)To me, the only relevant thing to add is * to underline the arguments of word we are currently hoovering*

[14:15](#msg5ee38e197c64f31f11582c87)I have some other ideas but they are still in their embryonic state. Let them mature and I will be back!

[15:20](#msg5ee39d225dcbb760b6e6795c)Note, last image is wrong, the correct one for hoovering on `pick` is the following:

[15:20](#msg5ee39d49013105125a2f3a00)\[!\[image.png](https://files.gitter.im/red/sandbox/cG7D/thumb/image.png)](https://files.gitter.im/red/sandbox/cG7D/image.png)

toomasv

[15:25](#msg5ee39e83035dfa1261180bd4)Thanks! Let me sit on it a bit.

TimeSlip

[16:57](#msg5ee3b3dc2cf2f36eae566e2a)@toomasv "you can save it to notes with e.g. double-click." Wow, a double-click is one step down from single click in the most important mouse interactions hierarchy...that means it's an important function! :-) Great work. Many thanks.

## Saturday 13th June, 2020

toomasv

[03:32](#msg5ee448c6035dfa126119aa28)@TimeSlip \[Added](https://github.com/toomasv/console-tools) noting with dbl-click in inspector.

TimeSlip

[06:05](#msg5ee46ca029d8bc28f9f31136)@toomasv Awesome!

toomasv

[14:10](#msg5ee4de645782a31278f8fd67)Expanded inspector with scopes:  
\[!\[expanded inspector](https://toomasv.red/images/Console/helper4.gif)](https://toomasv.red/images/Console/helper4.gif)  
Item is colored red if number of args does not match (in this case `add` it is just keyword, not function).  
If argument spans several lines as in blocks, it is not underlined but background is tinted to avoid clutter of lines.

hiiamboris

[15:00](#msg5ee4ea135782a31278f91d58)Cool ☻

toomasv

[17:12](#msg5ee508e924a3382d5d653b4a):)

greggirwin

[17:36](#msg5ee50e977b6da9126a925011):+1: :clap:

[17:50](#msg5ee511c82cf2f36eae598f4e)In looking at the examples, it struck me how most tools follow the original Intellisense model where, until recently, you only ever had a single-line tooltip for information. This is so much richer. The tradeoff being that it's not as close to the target, but it gives me some thoughts:

\- The expression tracer could use a tooltip approach, especially in an IDE context, but maybe even in the console.  
\- How a user gets help, via an implicit hover or an explicit hot-key, tells you they're either mousing around and not actively coding at that very moment. e.g. they stopped typing to get help and moved the mouse. Or they simply stopped typing, maybe selected a word, and pressed F1.

With the approach @toomasv has taken, in either case, once you have Help open, it can stay open. And while it could constantly update, you may only want that when mousing. If you're typing, it will be distracting. But stale data there may be bad too. An affordance might be to dim it slightly, or turn the text gray instead of black. It could go away entirely, but that's eye-catching as well. Plus, you may have wanted to leave the info up since that was the most recent thing you looked up. "What was that thing I just read?"

When typing, there could also be hint modes. Pausing, as a tooltip hover queues from, could do the tooltip help, while a hot-key would update the rich help info. You can have hot-keys for both of course.

toomasv

[18:01](#msg5ee51470a85de30394102dfe)@greggirwin Would you expand on "tooltip approach", please! How should it work?  
The problem with current helper/inspector is, that it shows a snapsot of code. Yes you can scroll it and it sync with the history then, but when you start typing it doesn't change. You have to close inpector to get history moving again. I need to think on this more.

Although you can fix the info in helper by clicking on a word, and you can hide helper to right border by double-clicking on separator.

I'll show in a moment.

GiuseppeChillemi

[18:07](#msg5ee515ff5782a31278f98187)@greggirwin  
&gt;&gt; The expression tracer could use a tooltip approach, especially in an IDE context, but maybe even in the console.

I have no knowledge on how VSCode plugin works internally but an IDE should have the contexts available to reach this level detail.

[18:12](#msg5ee51719013105125a32936d)@toomasv  
I suppose he mean something like this:

[18:13](#msg5ee5174e7b6da9126a926259)\[!\[image.png](https://files.gitter.im/red/sandbox/7vQd/thumb/image.png)](https://files.gitter.im/red/sandbox/7vQd/image.png)

greggirwin

[18:14](#msg5ee517721e099b0388c4a3ee)Mouse-based tooltips show up after a short delay, imagine typing `func` then pausing. The hint system, after a few seconds, shows `func spec [block!] body [block!]` in a tooltip. `Func` is maybe a bad example, because ultimately and eventually, it's a prime candidate for a code template. My editor does this today, though it's mainly useful as you're learning, or for more complex calls. I need to fire up VSCode and play with the plugin there.

GiuseppeChillemi

[18:15](#msg5ee517b8013105125a329485)@greggirwin :point\_up: \[this?](https://gitter.im/red/sandbox?at=5ee5174e7b6da9126a926259)

[18:19](#msg5ee518a32cf2f36eae599f88)I think it could also be implemented as an alternate method. Help panel covers part of the output but if you have tooltips open when you hover on a word then you get help while retaining the full REPL width

greggirwin

[18:21](#msg5ee519431e099b0388c4a735)Summarizing the info is a deep subject itself. I'd start by keeping it very simple, with only basic info, and let them ask for more in the full help system. It could even be a little different, but also crosses into auto-complete territory. e.g. type `find` and a `/` gives you a list of refinements, where a space gives you a param name hint. The VSCode plugin isn't working here, so I can't test to see what it does. Templates are interesting to me, because they're in between no-help-at-all and block programming.

(Bad net connection. Losing messages here.)

GiuseppeChillemi

[19:18](#msg5ee5266cee693d6eb3c1abf9)@toomasv If you will experiment with tooltips I have request about it: could you give to your code a future-ready structure? I am thinking here about vocabularies and text getters:  
The retrieving of the text should be based on a vocabulary block with `[word "Tooltip text"]` couples the develper can pass to your code.  
Other than a vocabulary block, your code should accept a foreign `get-text word` function. Your code will run this function with the hovered word as argument and receive get the text to display as result.

This because this part of work can be used for another \*\*idea\*\*: \*Live Words* in VID. I think about an `on-hovered-word` actor (@qtxie) which fires and a `face/hovered-word` that countains the word/value under the mouse pointer. This will let you have the full power of Red words under you fingers to display context relative text, or perform word relative action on any text data you are presenting in your GUI!

greggirwin

[19:24](#msg5ee527e824a3382d5d65803a)The interesting bigger picture that aligns with is how to document dialects, and how interrogative interfaces work.

GiuseppeChillemi

[19:35](#msg5ee52a81ef5c1c28f01f8989)Dialects are the essence of Red. Words relative to a context that do something while you type or hover on them is the final goal:  
Think about `Sell 100 shares of "Acme" at $47.97 per share` (do you \[remember](http://www.rebol.com/docs/core23/rebolcore-4.html#section-1) it?) and after you type `at` a listview of suggested prices opens!

[19:38](#msg5ee52b435dcbb760b6ea1518)In my wet dreams, I have clearly seen this being typed inside a text area, and then GUI has reacted showing me something.

[19:42](#msg5ee52c12013105125a32bead)I think nowhere in the world but on IDE made for coding such \*live words* technology exists. Coupled with DIAGRAMMAR, we will have a killer application for Red!

[19:44](#msg5ee52c97013105125a32bf8f)(End of my big picture. I have revealed a some of my best ideas here. It's my gift for the community for all the help received!)

hiiamboris

[19:47](#msg5ee52d441e099b0388c4d5d2)@GiuseppeChillemi :+1:

## Sunday 14th June, 2020

GiuseppeChillemi

[16:11](#msg5ee64c40ef5c1c28f021d56a)The idea of having live text interfaces is summarized \[here](https://drive.google.com/file/d/1YwkCydeberAOyDiYmLeskmeRpIo\_ASw2/view?usp=sharing):

[16:13](#msg5ee64c931e099b0388c71d4f)However I am a total newbie at parse and I have had some problems

[16:17](#msg5ee64da329d8bc28f9f72e8e)Code is:

```
digit:  charset "0123456789"
to-append: copy ""
total: 0
number: none
price: none

rule: [
		 any space
     set action ["buy" | "sell"]
     any space
     not ahead
     [set number
  	 some digit]
		  	(
		  	prin ["number: " ] probe number	
		  	either none? number  [
		  		to-append: select-value quantities
		  		prin ["To-append: " ] probe to-append: rejoin [" " to-append]
		  	]
		  	[
		  		to-append: ""
		  	]
		  	)
  	 if (to-append <> "") insert to-append
  	  (probe "xxx" probe to-append: "" probe number: none) ;<----- it is never executed
]
  
shares: ["22.00" "35.22" "44.35"]
quantities: ["1" "2" "3" "4" "5" "6" "7" "8" "9"]

select-value: func [data-block /local out-data] [
	view [
		
		below
		text-list 100x80 data data-block on-change [
				out-data: data-block/(face/selected)
				]

		]

	out-data
]

View [
	text "example: Sell 10 shares at 20" 
	field 350x40 on-key [
		current-text: none
		if all [not none? face/text not empty? face/text] [parse probe face/text rule]
	]
]
```

I do not know why face/text gains 1 space character in its head and one less in its tail.  
Also I do not know why code in parens after insert does not work.

[16:18](#msg5ee64dcf29d8bc28f9f72edc)If you want to reply, let's go to /parse section

[16:19](#msg5ee64e1e49260560aa5e3599)It is an embryo of an idea, nothing definitive, but it has already given me a lot of headheache !

toomasv

[18:47](#msg5ee670d07c64f31f115e9fee)Try `on-key-up`.

TimeSlip

[19:24](#msg5ee6798130401c1f2457dd27)@toomasv Again, you are saving us so much time by not having to look up that information (which I do often). Thank you. There might be something to this "direct democracy" thinking of yours :-).

toomasv

[19:35](#msg5ee67c0a49260560aa5ea704):)

GiuseppeChillemi

[20:34](#msg5ee689d2ef5c1c28f022643b)Yes, they have helped me a lot too.

## Monday 15th June, 2020

toomasv

[07:20](#msg5ee721325dcbb760b6ee234a)Making the look more joyful  
\[!\[helper-styles](https://toomasv.red/images/Console/helper-styles1.gif)](https://toomasv.red/images/Console/helper-styles1.gif)  
Are diagonal lines too weird?

rebolek

[07:22](#msg5ee721d12cf2f36eae5de980)Yes a bit :)

hiiamboris

[07:23](#msg5ee721e07a7f8d2d6336ef6e)Agree ;)

[07:23](#msg5ee721ed013105125a36e2c4)Why not just vertical to the left?

rebolek

[07:23](#msg5ee722057b6da9126a96a014)BTW, it's very nice, it's basically what I am doing in the Values editor, but I use just terminal (I prefer keyboard to mouse).

toomasv

[07:25](#msg5ee7226f30401c1f2459368b)@hiiamboris Yes, that's what I think too, but I'll have to write some helper funcs, because multiline blocks are not always that orderly. :)

GiuseppeChillemi

[07:33](#msg5ee7246449260560aa5ff38d)How do you alternate colors when arguments at more than 2? Do you repeat the first one or is it another one?

[07:34](#msg5ee724855dcbb760b6ee2b52)\*are

[07:36](#msg5ee7250d29d8bc28f9f8fc39)Another question: does it work with console hystory too?

toomasv

[07:38](#msg5ee725657a7f8d2d6336f78f)There are more colors to select from - 8 colors for backdrop and 10 for line and text.  
It works with console history as long as lines are not truncated (as return values often are).

GiuseppeChillemi

[07:39](#msg5ee725a6a85de303941486a9)And a final one, could your helper window become a side window off the main red one?

toomasv

[07:41](#msg5ee7262f035dfa12611fd66a)In principle it could, altough it would be inconvenient to use because of focus management problems.

GiuseppeChillemi

[07:41](#msg5ee7263b7b6da9126a96a98c)&gt;&gt; It works with console history as long as lines are not truncated (as return values often are).

[07:44](#msg5ee726ea1e099b0388c8de2b)What happens when the same word changes and you hover it before and after the change position? I think it will display only the last one.

[07:45](#msg5ee726fe49260560aa5ff893)\*same word changes its value

[07:46](#msg5ee727385782a31278fdd5c5)(and I think nothing can be done to avoid this)

[07:50](#msg5ee7283a7b6da9126a96af26)Ps: what a nice way to start the week, with a big smile in my face!

toomasv

[08:13](#msg5ee72da824a3382d5d69ba77)&gt; What happens when the same word changes and you hover it before and after the change position?

It shows the current value in global context. If will not see your values in private contexts unless you refer to these with full paths. If you look at printout of some program (as above), it still reports corresponding values in global context, not values as you see these changing in you program. So, it is not good for that kind of debugging. More like syntax helper.

greggirwin

[08:17](#msg5ee72e815dcbb760b6ee4313)More great progress @toomasv. :+1: I am in awe. The different highlighting styles may each have a place. The diagonals are different, but the general idea of them could apply to call maps or cross reference visualizations.

GiuseppeChillemi

[08:45](#msg5ee7352629d8bc28f9f91ddd)When we will have a full debugger and the corresponding underling screen text -&gt; red data link we will have these features. Until then this tool is already a great instrument.

toomasv

[08:47](#msg5ee7359049260560aa601de2)@greggirwin Thanks! Yes, with some additional parsing, lines (arrows) could be used for cross-referencing.  
@GiuseppeChillemi BTW I am surprised that detaching/attaching seems to work ~OK:  
\[!\[detach](https://toomasv.red/images/Console/detach.gif)](https://toomasv.red/images/Console/detach.gif)

GiuseppeChillemi

[08:50](#msg5ee736661e099b0388c90129)This is your and @qtxie good work.

[08:52](#msg5ee736cd013105125a370fe8)&gt;&gt; It shows the current value in global context. If will not see your values in private contexts unless you refer to these with full paths

pekr

[08:55](#msg5ee737867b6da9126a96d282)I like line mode too and agree, that diagonal should be just vertical, on the left side ideally ....

[08:55](#msg5ee7379b29d8bc28f9f923b4)I am speachless of what is actually possible. It's above exciting ....

GiuseppeChillemi

[08:58](#msg5ee7383049260560aa602580)Damn @pekr, my message was not complete because I was in 1 finger mode on mobile! I have to rewrite it!

[08:59](#msg5ee7387d1e099b0388c90782)&gt;&gt; It shows the current value in global context. If will not see your values in private contexts unless you refer to these with full paths. If you look at printout of some program (as above), it still reports corresponding values in global context, not values as you see these changing in you program.

[08:59](#msg5ee7388229d8bc28f9f9260a)I think we should put a warning that the word context used to get its the main one while it could be another one. Also an "use path notation" to access private contexts would be good!

[09:00](#msg5ee738a37a7f8d2d633725a0)(done! :) )

toomasv

[11:00](#msg5ee754b024a3382d5d6a1d34)This line-style seems better. Or something different?  
\[!\[line-style](https://toomasv.red/images/Console/lines-style.gif)](https://toomasv.red/images/Console/lines-style.gif)

rebolek

[11:08](#msg5ee756c9035dfa126120495e)much better

toomasv

[11:49](#msg5ee7604f2cf2f36eae5e84c9)Here is alternative. Which one is better?  
\[!\[line-style2](https://toomasv.red/images/Console/lines-style2.gif)](https://toomasv.red/images/Console/lines-style2.gif)

hiiamboris

[12:06](#msg5ee764352cf2f36eae5e8eef)Both are fine

pekr

[12:11](#msg5ee7658a013105125a378588)I like the first one more, as it is more to the left, better outlining what is covered. The idea though - I might prefer, if the bottom of the line would end at the beginning of the closing bracket ...

[12:13](#msg5ee765e55dcbb760b6eeca23)We might as well use the dotted line, to make it more lightweight, but it depends ....

toomasv

[12:20](#msg5ee76793ef5c1c28f02448af)Thanks! @pekr Like this?

\[!\[image.png](https://files.gitter.im/red/sandbox/zGDT/thumb/image.png)](https://files.gitter.im/red/sandbox/zGDT/image.png)

GiuseppeChillemi

[13:39](#msg5ee77a0a1e099b0388c9ac00)I admit I have a little confusion when the vertical bar for a block changes its color because I think like in terms of block start/end instead of the block as an argument. But it is just a personal thing, please don't change anything!

[13:43](#msg5ee77afaef5c1c28f0247e45)Also "Addnote:" has been able to give me a lot of confusion and I have to look at the video 3 times until I have understood it is just one argument because of the line is divided into 2 parts. Could you try to have the same starting vertex for both lines?

[13:45](#msg5ee77b7b30401c1f245a1bac)No, don't do anything.

[13:45](#msg5ee77b9530401c1f245a1be3)Too many variations of blocks and arguments over multiple lines...

toomasv

[13:56](#msg5ee77e252cf2f36eae5ed93a)

pekr

[13:58](#msg5ee77e88035dfa126120b367)Thanks for the modification. Now let's think about what is more clear? Should we have just one color line for the whole `either` body? What about with the stuff like `case`? Will you change the color for each condition part?

toomasv

[14:03](#msg5ee77fa65782a31278feb5ca)Color is changed for each argument (including refinement args). `case` has one argument - therefore one color, `either` has three arguments (condition and two blocks), therefore three colors. Set-words have an expression for "argument" - one color.

pekr

[14:06](#msg5ee780527c64f31f1160fa0c)Thanks ....

[14:06](#msg5ee78078035dfa126120b7bd)Are you just experimenting here, or is any of your work going to be official part of the Red console releases? Or some kind of extensions?

GiuseppeChillemi

[14:07](#msg5ee780ab5782a31278feb8ec)Toomas, the breaking of line continuity is associated to having a different argument.

[14:07](#msg5ee780b429d8bc28f9f9e883)\[!\[image.png](https://files.gitter.im/red/sandbox/mXvL/thumb/image.png)](https://files.gitter.im/red/sandbox/mXvL/image.png)

[14:08](#msg5ee780db24a3382d5d6a9c2c)So in "add-note:" it seems you have two arguments.

[14:08](#msg5ee780e95782a31278feb9fc)Because you have two pieces of lines.

[14:09](#msg5ee7810c30401c1f245a2bc2)The color will help in this case to understand it is just one.

[14:09](#msg5ee78132ef5c1c28f0249231)But the two lines first confused me as there is a different knowledge asspciated to them.

[14:10](#msg5ee781587c64f31f1160fe58)Having just one with the same vertex would be better

[14:11](#msg5ee781915dcbb760b6ef12f8)Something like this:

[14:11](#msg5ee781947a7f8d2d6337e2c3)\[!\[image.png](https://files.gitter.im/red/sandbox/Uzpd/thumb/image.png)](https://files.gitter.im/red/sandbox/Uzpd/image.png)

[14:12](#msg5ee781e8035dfa126120ba91)But I am not sure 100% as goes under the word which contains the functions

hiiamboris

[14:14](#msg5ee7823a7c64f31f1160ffd5)And we return to the original model where everything was clear ☻  
:point\_up: \[June 15, 2020 10:20 AM](https://gitter.im/red/sandbox?at=5ee721325dcbb760b6ee234a)

pekr

[14:14](#msg5ee7823d7a7f8d2d6337e3c9)I don't like it :-) I prefer the one with the space ...

toomasv

[14:27](#msg5ee7856449260560aa60f2b8)@pekr These are my own experiments, byproduct of investigating the belly of console.  
@GiuseppeChillemi Yes, I agree, this may be confusing, and clearest is backdrop model as @hiiamboris pointed out.

hiiamboris

[14:30](#msg5ee7861630401c1f245a391e)Or there can be a hybrid: underline arguments that fit one line, paint those that span more.

toomasv

[14:31](#msg5ee7863649260560aa60f4f8):point\_up: \[June 13, 2020 5:10 PM](https://gitter.im/red/sandbox?at=5ee4de645782a31278f8fd67) ?

GiuseppeChillemi

[14:37](#msg5ee787bfef5c1c28f024a60e):point\_up: \[June 15, 2020 9:20 AM](https://gitter.im/red/sandbox?at=5ee721325dcbb760b6ee234a) I like this a lot.

[14:40](#msg5ee78840013105125a37e468)Ok, this one ^ ^ ^ + hybrid as additional option is the right solution for me!

hiiamboris

[14:40](#msg5ee788625dcbb760b6ef2743):D

GiuseppeChillemi

[14:42](#msg5ee788e849260560aa60fea1)Hiiamboris, the last one with divided lines was able to make me crazy. The lines were telling to my mind there where 2 arguments and the color just one!

hiiamboris

[14:44](#msg5ee78933035dfa126120d0f0)Let's keep it simple: just using the backdrop ;)

toomasv

[14:51](#msg5ee78ae61e099b0388c9ddba):) OK, final test with hybrid added  
\[!\[helper-styles](https://toomasv.red/images/Console/lines-style3.gif)](https://toomasv.red/images/Console/lines-style3.gif)

GiuseppeChillemi

[14:59](#msg5ee78cc624a3382d5d6ac007)It is perfect!

[14:59](#msg5ee78cd5013105125a37f011)Could you please add a fireworks effect? :-)

hiiamboris

[14:59](#msg5ee78ce1a85de30394159550)☻☻☻

greggirwin

[15:03](#msg5ee78db67b6da9126a97b849)What we learn from experiments like this is that we may agree on some things, but not others. That's just because we're all different people with different brains and processing systems. Ultimately, and I agree with @pekr about how exciting this all is, offering the user options may be the way to go. Then we can also use telemetry to see what the most common settings are (likely the default ;^).

GiuseppeChillemi

[15:34](#msg5ee7950e30401c1f245a63c4)The experiment is nice and I hope Red will adopt it. The only dangerous thing is that words are always bound to the global context even if they are bound to another one (Until path notation is used). This could cause to wrong knowledge being learned that, at this level, we can avoid only with big warnings.  
However, it is a start, a good start, an incredible nice start! I will have gratitude toward Toomas until the end of times for this great work.  
I hope a full word/context association can be made in the future. This will need some low-level work and additions to Red itself (I suppose) but I think we all are seeing how precious this tool is for everyone!

pekr

[16:20](#msg5ee79fb8013105125a38287e)1000 ppl 1000 opinions. I myself don't like backdrop much. Most probably prefer just colored text, so please don't remove that one :-) What I don't like about the backdrop option is the heavy left screen part ... the more your code is indented, the more heavy it feels ...

toomasv

[16:51](#msg5ee7a6fe7a7f8d2d633847fd)@GiuseppeChillemi

&gt; Could you please add a fireworks effect?

Be careful with your wishes

\[salute](https://toomasv.red/images/Console/salute.gif)

GiuseppeChillemi

[17:01](#msg5ee7a964ef5c1c28f0250506)@toomasv  
:-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O :-O

[17:04](#msg5ee7aa001e099b0388ca34a8)Fantastic! Let's keep it for some Easter Egg!

planetsizecpu

[19:49](#msg5ee7d0d549260560aa61c7ad)Wow fantastic job @toomasv

toomasv

[19:50](#msg5ee7d10824a3382d5d6b8071)Kudos to @Respectech  
\[!\[salute2](https://toomasv.red/images/Console/salute2.gif)](https://toomasv.red/images/Console/salute2.gif)

hiiamboris

[19:55](#msg5ee7d216ee693d6eb3c7a62c)Haha. We need a "Blow this code up to hell" button ;)

[19:55](#msg5ee7d2417b6da9126a987c75)And an animation how the letters fly around then explode each

toomasv

[19:56](#msg5ee7d26430401c1f245b08ad):joy:

hiiamboris

[19:56](#msg5ee7d26f2cf2f36eae5fc43a)Will be a killer feature. Like the \[Lazer Cat](https://addons.mozilla.org/en-US/firefox/addon/the-laser-cat/).

greggirwin

[20:03](#msg5ee7d41c24a3382d5d6b897e)When you fix a bug, and look back at it in the log, The Exterminator comes in, highlights the changed code, and destroys it in some random fashion. Jason Statham would be good. If you're thinking Joker, think again, he \*adds* bugs, so shows up for regressions.

hiiamboris

[20:08](#msg5ee7d5531e099b0388caa9fa)Arnie!

greggirwin

[20:09](#msg5ee7d5797c64f31f1161ea1c)I guess he is the EX-terminator.

hiiamboris

[20:09](#msg5ee7d5805dcbb760b6eff817):D

greggirwin

[20:11](#msg5ee7d5d6013105125a38b77a)I did some old VB fireworks eons ago, and ported it to R2, but the effect wasn't the same. Not sure I can find the original, but there was a random offset or rounding issue as the pixels were written, or something, that make them sparkle.

hiiamboris

[20:13](#msg5ee7d64f30401c1f245b1425)Oh. Glitch-based programming... that's a new paradigm for me ;)

greggirwin

[20:27](#msg5ee7d9987c64f31f1161f517)This? https://glitch.com/

[20:27](#msg5ee7d9b47c64f31f1161f56a)Ah, no, you mean the unintended sparkle. Got it.

GiuseppeChillemi

[20:27](#msg5ee7d9cc2cf2f36eae5fd34a)&gt;&gt; And an animation how the letters fly around then explode each

This will work better if you implement console text to code binding, so the explosion alters the underlying letters and the blocks too!

## Tuesday 16th June, 2020

toomasv

[04:22](#msg5ee84922013105125a39d14f)@pekr How about this?  
\[!\[helper-style](https://toomasv.red/images/Console/helper-styles2.gif)](https://toomasv.red/images/Console/helper-styles2.gif)

TimeSlip

[04:51](#msg5ee84fdd7c64f31f11630323)@toomasv I like the highlighting. Lightweight and easy to focus on without distraction. What happens when there is an error in the code such as a missing bracket? (One of my favorite things to do apparently)

pekr

[05:21](#msg5ee856eb29d8bc28f9fbfedb)@toomasv and others - so what do you prefer more? The whole block hilite, or just a text hilite without the indented white space?

[05:33](#msg5ee859c4013105125a39f442)The new block hilite mode is closer to the text hilite mode .... I might prefer the latter, but can imagine some ppl preferring the former version ....

toomasv

[05:48](#msg5ee85d23ee693d6eb3c8e565)@TimeSlip I haven’t dealt with errors much yet. We’ll see.  
@pekr There are some possibilities more. I’ll try these too (last version is compact but a bit rugged maybe).

rebolek

[05:52](#msg5ee85e1d5dcbb760b6f124c2)VIM highlights just opening/closing brackets, another posibility.

toomasv

[06:13](#msg5ee8631c035dfa126122e45a)@rebolek BTW Does your `values` access private contexts?

rebolek

[06:15](#msg5ee8637dee693d6eb3c8f358)@toomasv no, not yet, currently it just checks words in global context

toomasv

[06:19](#msg5ee8645729d8bc28f9fc1f5b)Then it does not adapt coloring to dialects either, does it?

pekr

[07:33](#msg5ee875d0ef5c1c28f026f1e3)Yes, hiliting only the brackets might be the way to go too ...

GiuseppeChillemi

[09:44](#msg5ee8946829d8bc28f9fca0b1)I don't like it because brackets can be lost in a pile of blocks. Also, when there are missing or too many brackets it is very easy to discover them when the full block is highlighted. Together with lines it gives you either the limit and the included content.

toomasv

[14:39](#msg5ee8d9a57c64f31f116454e2)Hope dies last  
\[!\[contexts](https://toomasv.red/images/Console/contexts.gif)](https://toomasv.red/images/Console/contexts.gif)

GiuseppeChillemi

[15:59](#msg5ee8ec7530401c1f245de33c):clap: :clap: :clap: :clap: :clap:

[16:05](#msg5ee8edbb2cf2f36eae62819a)Are you creating a temporary environment for the helper were the code is executed to have a reference to the evaluated data ? Or even normal red blocks that have been loaded and evaluated can provide the contexts data?

TimeSlip

[16:25](#msg5ee8f27e29d8bc28f9fd9939)@toomasv See on väga tore. (According to Google Translate :-) )

toomasv

[17:44](#msg5ee904fcee693d6eb3caac3a)@GiuseppeChillemi Yes, it is temporary structure and some additional hocus-pocus :).  
@TimeSlip Ma ei teadnudki, et eesti keel on ülemaailmselt nii tuntud! :)

greggirwin

[18:40](#msg5ee91205a85de30394196c57)Hocus pocus indeed. :+1:

I imagine, because developers are so clever, that tooling won't be able to handle every dynamic case or strange approach we construct, as with compiling. But we can handle the known cases, and when not sure, use heuristics and provide choices to let the user pick from, and a confidence rating. This can even be a feature, rather than a limitation. If the tooling can't figure it out, that may be a sign that people will have trouble, too. In some cases, it may be simple naming conflicts; in others it may be advanced binding being used where not needed.

TimeSlip

[18:52](#msg5ee914d6035dfa126124c4a5)@toomasv  
Google teab kõike!

toomasv

[19:16](#msg5ee91a875782a3127802c7de):) Tõesti!

[19:19](#msg5ee91b5b1e099b0388cddfa0)@greggirwin Thanks for these toughts! I have to figure out how to send these directly from Gitter to console's notebook..

hiiamboris

[19:23](#msg5ee91c4b7b6da9126a9bd4df)You can just embed Gritter into console ;)

[19:24](#msg5ee91c5c2cf2f36eae630a19)Won't need no notebook ;)

toomasv

[19:24](#msg5ee91c7329d8bc28f9fe110f):)

## Wednesday 17th June, 2020

planetsizecpu

[10:32](#msg5ee9f12e384f9b064c111b72)&gt; Hocus pocus indeed. :+1:  
&gt;  
&gt; I imagine, because developers are so clever, that tooling won't be able to handle every dynamic case or strange approach we construct, as with compiling. But we can handle the known cases, and when not sure, use heuristics and provide choices to let the user pick from, and a confidence rating. This can even be a feature, rather than a limitation. If the tooling can't figure it out, that may be a sign that people will have trouble, too. In some cases, it may be simple naming conflicts; in others it may be advanced binding being used where not needed.

In that sense perhaps a netbeans-style "Refactoring" option could be useful, so that an apparently problematic code can be seen more clearly. Tab, parenting and block rules maybe not very complex, for sure "pecata minuta" for Toomas :-)

## Thursday 18th June, 2020

ralfwenske

[11:22](#msg5eeb4e81bb149531edb7b516)Sandbox sounds like play. I have been playing and find my little tool useful - so may be others have use for it too: a 'quick-view' generator (object). If someone is interested to dig a little into it and give hints for bringing it a bit closer to the 'Red' spirit, I would welcome that. An extensive example is on Github \[quick-view](https://github.com/ralfwenske/quick-view)  
Btw. I have tested it on Mac, Windows and Linux - the results are shown in the example.

```
Red []
#include %q-v.red
v: q-v/duplicate
view/flags v/window 'resize
```

!\[alt default view](https://github.com/ralfwenske/quick-view/raw/master/.view-default.jpg)  
\- - - -

Outer panel's width can be set with /widths \[t r b l]

```
Red []
#include %q-v.red
v: q-v/duplicate/widths [50 50 30 80]
v/window/size: 400x200
view/flags v/window 'resize
```

!\[alt default view](https://github.com/ralfwenske/quick-view/raw/master/.view-widths.jpg) !\[alt default view](https://github.com/ralfwenske/quick-view/raw/master/.view-resized.jpg)  
\- - - -  
more in the %example1.red on Github

toomasv

[18:38](#msg5eebb48afa0c9221fc47f44d)@ralfwenske Very nice? May be as next step develop refinements into a dialect. Something like

```
q-v ["Quick View Demo" 600x400 [50 50 30 80] order [l r t b] resize colors [c white]]
```

The problem with Windows font: probably it should be "Courier New".

hiiamboris

[18:41](#msg5eebb567a813c72dcff77d60)looks like a W10 bug to me. This is on W7:  
!\[](https://i.gyazo.com/edd8f151be2117a84485fc7efb4d58b1.png)

[18:41](#msg5eebb576ec4a341beed61b25)title is all cool, and the bottom labels

greggirwin

[19:12](#msg5eebbca8405be935cdabdb95)Thanks @ralfwenske ! I had \*no* idea what the numbers meant until I read the notes in the repo. It's a very cool idea. The default order in my mind is different, though I understand yours. It's sparking thoughts here.

hiiamboris

[19:21](#msg5eebbeb1405be935cdabe018)A spiraling layout ;)

greggirwin

[19:25](#msg5eebbf8dfa0c9221fc48143b)That will just get out of control. :^)

[19:26](#msg5eebbff53a0d3931fa9e0cf4)More like thin template wrappers for common layouts.

## Friday 19th June, 2020

ralfwenske

[02:11](#msg5eec1eeae6668d35db0a1469)Thank you @toomasv - Yes: `Courier New` works on all three platforms, even though i found that on W10 `text` without background colour is not transparent.  
Also I had been thinking about dialects: compactness versus readability. I remember having seen some experiments with function parameters somewhere. Will have to dig into this topic.

[02:16](#msg5eec1feec4bdd83475f175a5)@greggirwin @hiiamboris In my mind it is spiraling like a clock (dims). What’s in your mind? Or do you mean the default order of \[t b l r] ?

greggirwin

[02:18](#msg5eec2089fa0c9221fc48e42f)I understood it clockwise as well, but since I'm a westerner, I read across then down.

[02:19](#msg5eec20a8a813c72dcff86fae)Maybe another way to say it is that I don't think of rectangular UIs in a circular manner.

[02:22](#msg5eec214cfa0c9221fc48e58f)I had a 2-second thought about how you'd do with 2 pairs, but that's even less intuitive. e.g. `[200x50 150x25]` would be `[200 50 150 25]` in `[l t b r]` or some other order.

[02:23](#msg5eec2185fa0c9221fc48e607)So I would probably go with named values for clarity.

[02:24](#msg5eec21f9fa0c9221fc48e6f0)Then all your internal indexed size references (`[1 2 3 4]`) become named as well.

ralfwenske

[02:28](#msg5eec22b96c06cd1bf43f7e13)Thanks @greggirwin Named values probably makes it clearer for the user but it also will make the code more digestible :)  
Just realise: I may be able to combine the `/order` and `/widths` params eg. \[top 50 right 70 bottom 30 left 100]  
or \[top 50 bottom 40 left 150 right 0]

greggirwin

[02:29](#msg5eec232347fdfd21edd0f190):+1:

[02:33](#msg5eec240dbb149531edb9cbaa)Yes, that's what I was thinking. You can also easily set default widths if any are missing.

ralfwenske

[02:35](#msg5eec2458613d3b3394f5cf7e)I guess I’ll have to spend some time with parsing…

greggirwin

[02:35](#msg5eec2470e6668d35db0a1f3a)Nope. Do it the easy way. Just use path notation.

ralfwenske

[02:39](#msg5eec2562a813c72dcff877b7)You mean \[top/50 right/70 bottom left/100] ? How do I check for non existing width? length? = 2 ?  
I like the idea

greggirwin

[02:40](#msg5eec259b47fdfd21edd0f4bd)No, I mean use `sizes: [top 50 right 70 bottom 30 left 100]` format, then access as `sizes/top sizes/left` etc.

[02:42](#msg5eec260954d7862dc496791f)If you want defaults for non-spec'd values, you'll need to set them in the block or as vars. e.g. `top: any [sizes/top 50]` then use `top` in the rest of the code.

ralfwenske

[02:46](#msg5eec2702e6668d35db0a23e0)So many options.. But with this I couldn’t do \[top/50 right/70 bottom left/100] My concern is that order and widths are independent from each other - meaning that if you want a different order you need to give all 4 of them whereas the widths have individual defaults and you’d need to give only the one(s) you want differently to the default.

greggirwin

[02:49](#msg5eec27d0e0e5673398c00d12)Not necessarily. You can get tricky, to save code.

[02:52](#msg5eec2863405be935cdacc8a1)

```
sizing: function [sizes [block!]][
	defs: [top 50 left 200 right 150 bottom 25]
	sizes: append copy sizes defs ; this is the tricky bit
	probe reduce [sizes/top sizes/left sizes/right sizes/bottom]
]
sizing [top 500 left 2000 right 1500 bottom 250]
sizing [top 100 bottom 75]
sizing [left 300 right 90]
sizing []
```

[02:54](#msg5eec28d5ec4a341beed71897)I generally avoid tricky and clever code, but a small comment should be enough for this. ;^)

ralfwenske

[02:57](#msg5eec29a4bb149531edb9d5d5)I agree. Still I can’t see in your proposal how I do eg \[left right top bottom] when I accept the default widths but I want the left and right panels to extend to the borders and then the top and bottom to fit in?  
(The third image in my repo shows what I mean)

greggirwin

[03:01](#msg5eec2a8eec4a341beed71c0c)I haven't analyzed your code to see how you use the sizes, but it should work basically like you do it now. You're just using names instead of numbers as indexes into the block of sizes.

[03:03](#msg5eec2aed405be935cdaccd40)Hard to scan quickly as I need to figure out where `dims`, `sizes`, and face facets are used in coordination.

ralfwenske

[03:06](#msg5eec2ba2e6668d35db0a2c1e)Thank you @greggirwin I will play with it and find ways to improve the code (have it compact and still easy to guess/remember how to use it).

greggirwin

[03:16](#msg5eec2e24bb149531edb9de42)I'll suggest a slightly different approach to creation, while I'm here. :^) Rather than `duplicate` as a method, internally copying the context and using `v` as the ref to it throughout, consider a `make` model. e.g. `view-a: make-quick-view`. It's more idiomatically Red, and avoids having an object's method copying its parent context from the inside which is a little mind bending. This being the sandbox, I imagine people will come up with \*really* clever ideas for how to leverage and abuse that approach. ;^)

[03:18](#msg5eec2e99b8152d34844ea670)That is, `make-quick-view` wouldn't be inside the context, but make use of it. It may not work, as your code might rely on bindings in such a way that it breaks things.

ralfwenske

[03:22](#msg5eec2f7ae0e5673398c019a6)'...is a little mind bending' :) Indeed I felt that at times. For some reason I wanted it all inside the context which consequently created a few hurdles. I will remake it following your suggestion. Thank you for your effort @greggirwin

greggirwin

[03:24](#msg5eec2fdabb149531edb9e0f6)Well...now I want to tinker too. ;^)

ralfwenske

[03:28](#msg5eec30d5613d3b3394f5e86a)I won’t be able to keep up ;^)  
I wouldn’t mind though if we end up with a model close to Red idioms. I think it would be very useful as a tool and at the same time a comprehensive source to explore how things can be (should?) done in Red.

[03:44](#msg5eec3493b8152d34844eb104)… some things ...

[03:47](#msg5eec3552405be935cdace008)@hiiamboris Did you declare a background colour for the 'log: text' face on W7? On W10 without it there is no transparency.

greggirwin

[04:51](#msg5eec444b54d7862dc496b0bf)\[\_5-pane-view.red](https://files.gitter.im/57f22e43d73408ce4f2b38c1/qps2/\_5-pane-view.red)

[04:53](#msg5eec44e554d7862dc496b203)No resizing yet, and need to think about the init process for things like menus and actors, whether you should spec sizes separately or have panels control it, etc.

[04:58](#msg5eec460847fdfd21edd12e6a)Panel-layouts should have defaults that are just overridden as well, like sizes.

ralfwenske

[05:00](#msg5eec468bc223cc536a21a9de):( I was afraid you would do this within the hour ;^) Looks very Red. I will certainly take a closer look and learn...

greggirwin

[05:02](#msg5eec46ebc4bdd83475f1bccb)Thanks making me thinker. :^)

pekr

[05:16](#msg5eec4a2ab8152d34844ed961)This panel layout reminds me of the possible setup for the apps. Top bar for icons or tabs, left for the vertical navigation, content pane, status bar pane. Now make them draggable / resizable (split-window) and we've got a top level elements for our GUIs ...

greggirwin

[05:23](#msg5eec4be03a0d3931fa9f346e)We can tackle this in many ways, with this being very, very simple and limited. Resizing and docking is great, but also recursive in nature, and then we'll just (that much sooner) list and tree views, file-explorer and toolbar styles, draggable tabs, ...it gets complex quickly.

What we can do, very easily, is create things like @ralfwenske is doing, and templates for common application needs. I expect this will be part of our IDE, but even without that, being able to copy an example can get people started.

[05:25](#msg5eec4c3afa0c9221fc493a2c)As an in-house developer, I've never been above delivering a crude app and, when users complain and ask for resizing and such, promising I will get to that...someday. ;^)

[05:26](#msg5eec4c82c4bdd83475f1c776)The catch is that when they ask for a new app, or \*needed* feature, I get to ask which they want more, that or resizing.

ralfwenske

[05:34](#msg5eec4e573a0d3931fa9f39e8)When you have a fully working (resizable) template to start with you might not have to ask that question and your user will be the happier - needed or not. When they are happy they will come for more - keep business running ... ;^)

pekr

[07:09](#msg5eec64b4a813c72dcff8ff75)@greggirwin Difficult to not provide resizing app, apart from some simple dialog window based small app. Today web is responsive, can rearrange elements, etc. It just feels to me, that we reinvent the wheel again. IIRc, for R2 I remember at least 3 resizing engines - Doc, Romano, Cyphre .... and for R3, it was extensive Ladislav's work with spacers, etc.

[07:11](#msg5eec6512e6668d35db0aa647)But - when things get complex, or ugly in how they influence the look of the source code, sometimes simple stuff wins. I do remember how Carl did resizing by having a resize handler, and knowing the needs of your app, you can target the stuff from within one handler function ....

[07:12](#msg5eec6542e6668d35db0aa6a1)Sometimes we forget about the simplicity principles ... again and again :-)

hiiamboris

[09:41](#msg5eec884d7ba3965373b7ba0b)&gt; @hiiamboris Did you declare a background colour for the 'log: text' face on W7? On W10 without it there is no transparency.

@ralfwenske no, I ran it unmodified

ralfwenske

[10:08](#msg5eec8e863a0d3931fa9fccb8)So indeed must be a W10 issue.

[10:46](#msg5eec97966c06cd1bf4408089)Following @greggirwin ’s suggestion I have cleaned up a little and indeed it seems way more transparent to me now. Thanks again. The interface is also (hopefully) a bit more logical.  
A working 5-panel view: resizable, menu, prevention of accidental data loss.  
I have also included Gregg’s quick alternative (so it doesn’t get lost): \[quick-view (q-v)](https://github.com/ralfwenske/quick-view)

toomasv

[12:59](#msg5eecb6cdfa0c9221fc4a3381)Digging into private contexts:  
\[!\[contexts](https://toomasv.red/images/Console/contexts2.gif)](https://toomasv.red/images/Console/contexts2.gif)

TimeSlip

[15:59](#msg5eece0d97ba3965373b8a2e7)@toomasv Now, that is cool. I've always had a hard time with Bind, and this would make it clear what is going on behind the scenes. Thank you. Your tools have captured so many aspects of programming in Red. To coin a new phrase, (perhaps only relevant to the US), you've created a "Harbor Freight"* app. \[\*Harbor Freight is a tool store that sells every conceivable tool that you thought you didn't need but have to have.]

toomasv

[16:08](#msg5eece318bb149531edbba2a3)@TimeSlip I looked it up, nice store! Honored :) This last one needs sill some polishing. I'm trying out the new `transcode` feature here.

greggirwin

[18:34](#msg5eed0534b8152d348450b401)@ralfwenske Nice. "FILL IT WITH LIFE". :+1:

[18:39](#msg5eed066dfa0c9221fc4b1640)@toomasv it gets better every day. I imagine the logic will apply easily to a step-tracing features in an IDE, and a watch window. e.g. select and add items to watch, and when you step (or hit a breakpoint or probe-point) you see the results. In that context (no pun intended), path notation may be needed, or at least helpful. Depends on complexity of getting call stack contexts, how to deal with dynamic code, and more.

toomasv

[19:10](#msg5eed0da9613d3b3394f81111)@greggirwin Yes, I've been dreaming of live debugging tool :) Hopefully it will be next tool to add.

greggirwin

[19:15](#msg5eed0eb7b8152d348450cbc5)To @pekr's points.

&gt; Difficult to not provide resizing app, apart from some simple dialog window based small app.

How many apps, percentage wise, \*can be* the small and simple kind? IME, most of them; the vast majority. This is, of course, my experience as an old desktop developer. Of the remaining apps, many need only basic resizing. e.g. a fixed width nav bar on the left and a document area. Note that @toomasv put a lot of work into resizing in DiaGrammar, and it \*needs* it. As a commercial app with 3 separate editing/viewing areas, it's a real app. For people creating those kinds of apps, yes, we absolutely need a real resizing system. Work like @ralfwenske's can fill the middle gap well.

&gt; Today web is responsive, can rearrange elements, etc. It just feels to me, that we reinvent the wheel again.

This can be a big topic. I'm in Gitter in the browser right now. I can't resize the sidebars, only show and hide them. If I resize the window, only the message area changes width. Eventually the left nav area hides, but that's it. The various tabs in Github seem to have one of 3 different behaviors, so they are clearly using different resizing systems or rules even within a single "app". How many resizing systems are out there in the browser world. And there is some necessity in reinvention here, as Red has a reactive system (which @hiiamboris has done some amazing work on recently, related to resizing too). We also use native controls. It's all different, but we have learned from the past. I suggested a constraint based system in the past, which is cool, but not a priority yet.

I love my email client and programming editor, which resize and have splitters. But they also both have issues that occasionally cost me time and confusion. None of this comes for free, for us \*or* for the user.

We've had some team chat about how hard HCI is, but people used to \*research* this, as they used to do quality studies across the industry, which also doesn't happen anymore. I'm not saying the A/B model is bad, or that "trying stuff and see what users click on most" is an invalid approach, but do they help us move forward. Is it progress and can we build on it in the future? I don't think so, but I'd be \*thrilled* to be proven wrong. Old HCI approaches were certainly flawed and limited. In many ways, we just do the same thing faster, with more people, automatically now.

What's exciting is stuff like analyzing saccades (where your eyes go without you thinking about it), and controlled studies that look at how long a task takes and how many errors or corrections are made. How do humans operate? The more we know about that, the more we can help them, er, us.

I'll liken this also to the original desktop publishing craze. For a long time, we had no control over fonts and such. When we got it, we went \*nuts\*, and spent far more time on the look than the content. Often with terrible results. Typographers and designers know what they're doing. The rest of us do not.

Here's what I'd love (and a wiki page would be \*great\*). List the apps and UIs we love(d). Who gets it, or got it, right? @pekr I think you cross user boundaries, as a dev, admin, semi old guy, and browser user. Could you champion that? Reach out on red/red and help curate the list?

[19:25](#msg5eed1130e0e5673398c24d98)@pekr this ties directly to what we build, because as we identify UI models for different types of apps, we should be able to point people to libraries, templates, and examples for them.

## Thursday 17th September, 2020

toomasv

[18:07](#msg5f63a5c7b468994d0d364e8e)Finally got some geometric algebra to work. Gimbal-lock-free 3d-cube:  
\[!\[pga3d](https://toomasv.red/images/3D/pga3d.gif)](https://toomasv.red/images/3D/pga3d.gif)  
Earlier experiments had gimbal-lock:  
\[3Dcube](https://toomasv.red/images/3D/3Dcube3.gif)

theSherwood

[18:12](#msg5f63a6f9df4af236f913af33)@toomasv You're a magician.

[18:12](#msg5f63a722c1d1a53705abc169)Is the repo public?

[18:13](#msg5f63a758a857200e6d68a67a)This is very cool.

toomasv

[18:24](#msg5f63a9e7c1d1a53705abcd1f)Not yet. It is too messy :flushed: . Will try to tidy it a bit. I used materials from \[bivector](https://bivector.net/). Impressive work!

theSherwood

[18:29](#msg5f63aaf5b190f2328e7d0722):thumbsup:

greggirwin

[19:09](#msg5f63b4604f19dd093356aafa)Nice! Including the axis labels is great.

[19:12](#msg5f63b5325fde567ffa5381f6)It will be some time before I have enough brain to look at `bivector`. =8^@

toomasv

[19:17](#msg5f63b664c1d1a53705abef79)Great thing about it is that it simplifies geometric manipulations tremendously (er.. after the inner workings have been got right, which may be tricky)

## Friday 18th September, 2020

toomasv

[15:41](#msg5f64d543b190f2328e8002fc)Yay! Got Cayley tables:  
Complex numbers:

```
>> cayley/show/with [0 1 0]
1   e1  
e1  -1
```

2D Euclidean geometry:

```
>> cayley/show/with [2 0 0]
1    e1   e2   e12  
e1   1    -e12 -e2  
e2   e12  1    e1   
e12  e2   -e1  -1
```

3D Projective geometric algebra:

```
>> cayley/show/with [3 0 1]
1      e0     e1     e2     e3     e01    e02    e03    e12    e13    e23    e012   e013   e023   e123   e0123  
e0     0      -e01   -e02   -e03   0      0      0      e012   e013   e023   0      0      0      -e0123 0      
e1     e01    1      -e12   -e13   e0     -e012  -e013  -e2    -e3    e123   -e02   -e03   e0123  e23    e023   
e2     e02    e12    1      -e23   e012   e0     -e023  e1     -e123  -e3    e01    -e0123 -e03   -e13   -e013  
e3     e03    e13    e23    1      e013   e023   e0     e123   e1     e2     e0123  e01    e02    e12    e012   
e01    0      -e0    e012   e013   0      0      0      -e02   -e03   e0123  0      0      0      -e023  0      
e02    0      -e012  -e0    e023   0      0      0      e01    -e0123 -e03   0      0      0      e013   0      
e03    0      -e013  -e023  -e0    0      0      0      e0123  e01    e02    0      0      0      -e012  0      
e12    e012   e2     -e1    e123   e02    -e01   e0123  -1     e23    -e13   -e0    e023   -e013  -e3    -e03   
e13    e013   e3     -e123  -e1    e03    -e0123 -e01   -e23   -1     e12    -e023  -e0    e012   e2     e02    
e23    e023   e123   e3     -e2    e0123  e03    -e02   e13    -e12   -1     e013   -e012  -e0    -e1    -e01   
e012   0      -e02   e01    -e0123 0      0      0      -e0    e023   -e013  0      0      0      e03    0      
e013   0      -e03   e0123  e01    0      0      0      -e023  -e0    e012   0      0      0      -e02   0      
e023   0      -e0123 -e03   e02    0      0      0      e013   -e012  -e0    0      0      0      e01    0      
e123   e0123  e23    -e13   e12    e023   -e013  e012   -e3    e2     -e1    -e03   e02    -e01   -1     -e0    
e0123  0      -e023  e013   -e012  0      0      0      -e03   e02    -e01   0      0      0      e0     0
```

dander

[17:10](#msg5f64ea21f969413294f3da3b)I have no idea what is happening here, but it looks very intriguing :smile:

toomasv

[17:17](#msg5f64ebc3a857200e6d6befb8)It defines the basic multiplication table for Clifford (aka geometric) algebras. From this other operations can be derived.

[18:51](#msg5f650199ce5bbc7ffdd33754)But signs are reversed in non-numerics. Oops :flushed:

## Sunday 20th September, 2020

toomasv

[15:40](#msg5f6777f589b38d09213d8158)Added translations:  
\[!\[pga3d-translations](https://toomasv.red/images/3D/pga3d-translations.gif)](https://toomasv.red/images/3D/pga3d-translations.gif)  
Next will probably try to add perspective and camera.

endo64

[18:24](#msg5f679e72d993b837e0774805)Cool! 😍

GiuseppeChillemi

[22:11](#msg5f67d3abd993b837e077c1da)Super!

## Monday 5th October, 2020

toomasv

[11:29](#msg5f7b03936e0eb8446967d6a2)Added \[perspective](https://github.com/toomasv/GA):  
\[!\[3D perspective](https://toomasv.red/images/3D/pga3d-perspective.gif)](https://toomasv.red/images/3D/pga3d-perspective.gif)

geekyi

[15:10](#msg5f7b376e4603547484fe93be)Wow, cool!

[15:11](#msg5f7b37901adcf94d3f013286)I have to try this immediately!

[15:23](#msg5f7b3a5e00f5b82075b5f4a4):point\_up: \[September 17, 2020 11:07 PM](https://gitter.im/red/sandbox?at=5f63a5c7b468994d0d364e8e)  
&gt; Earlier experiments had gimbal-lock:  
&gt; \[3Dcube](https://toomasv.red/images/3D/3Dcube3.gif)

How'd you show? It isn't clear to me how you demonstrate in the examples.  
I do know about Gimbal lock and imagine how it happens physically, but the exact mechanism in how it's avoided is unclear to me.

Maybe showing or displaying a state where it happens, side by side, might help?

rebolek

[15:56](#msg5f7b424200f5b82075b611db)Next step, z-buffer, textures, Doom in Red :)

greggirwin

[16:45](#msg5f7b4da5b949c45310c24b12)Very cool @toomasv !

GiuseppeChillemi

[18:24](#msg5f7b64fa00f5b82075b67403)@rebolek  
&gt; Next step, z-buffer, textures, Doom in Red :)

One day we will be the scripting language for Half Life NG with RED and the coding language for the game with R/S

## Sunday 11st October, 2020

BeardPower

[10:28](#msg5f82de5799e1ab4dd1f15acf)@toomasv What is the difference between outer and inner axis? I don't see a different outcome. Is it global vs. local manipulation?

[10:30](#msg5f82dececdb04d1ea0766fd0)@GiuseppeChillemi Coding such stuff in R/S would need a lot of features. E.g. specific memory allocators.

[10:31](#msg5f82df1502e81701b01508eb)Who will code the batteries? Does R/S come with "batteries included"?

GiuseppeChillemi

[11:15](#msg5f82e9691cbba72b63d2e71f)@BeardPower could you make an example?

BeardPower

[11:38](#msg5f82eed33775d02b5a02da18)@GiuseppeChillemi Arena allocators, heap recursion instead of stack recursion, threading pools, ring buffers, ECS, acceleration structures, Vulkan and Metal APIs etc.

[11:40](#msg5f82ef2ca605930a78a1557e)And of course support for hardware features. The Apple SoCs support a plethora of them.

[11:42](#msg5f82ef8fa605930a78a15650)Apple silicon is using tile based rendering which has a ton of advantages compared to the standard techniques in current AMD and Nvidia architectures.

GiuseppeChillemi

[12:54](#msg5f83007b3775d02b5a0305f5)I have to learn every single word you have used but "stack recursion".

toomasv

[13:26](#msg5f8307f53775d02b5a0318dd)@BeardPower

&gt; What is the difference between outer and inner axis?

Yes, global (relative to screen) vs local (relative to cube).

[15:39](#msg5f83274299e1ab4dd1f21326)\[2D geometric algebra](https://github.com/toomasv/GA/blob/master/D201.red) in work. Pappus' s theorem:  
\[!\[pga2d-pappus](https://toomasv.red/images/GA/pga2d-pappus.gif)](https://toomasv.red/images/GA/pga2d-pappus.gif)

GiuseppeChillemi

[19:03](#msg5f8356eda1c81d0a7ed72a20)👏🏻👏🏻👏🏻

## Monday 12nd October, 2020

geekyi

[11:56](#msg5f84447299e1ab4dd1f4c66e)\[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/Zg2v/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/Zg2v/image.png)  
Red 0.6.4 for Windows built 8-Sep-2020/6:24:23+05:00 commit #0e44831

toomasv

[13:00](#msg5f845376a605930a78a4b94c)@geekyi Sorry, what is the problem there?

[14:44](#msg5f846bdd07361f0cc64893d6)Desargues's theorem:  
\[!\[pga2d-desargues](https://toomasv.red/images/GA/pga2d-desargues.gif)](https://toomasv.red/images/GA/pga2d-desargues.gif)

## Tuesday 13th October, 2020

geekyi

[13:56](#msg5f85b221cdb04d1ea07dcdb7)@toomasv oh, I didn't realize that yellow blob at the pointer was from your screen recording software

toomasv

[14:01](#msg5f85b32560efef1ec37bab72)Yes :)

geekyi

[15:02](#msg5f85c19e43fa5d19e60a6b16)\[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/LZRa/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/LZRa/image.png)

[15:04](#msg5f85c1e23775d02b5a0a0521)Managed to find a bug:

```
*** Math Error: math or number overflow
*** Where: multiply
*** Stack: play view do-events do-actor do-safe on-click render
```

toomasv

[15:05](#msg5f85c23060efef1ec37bd30f)Interesting! Did you change anything?

geekyi

[15:06](#msg5f85c25cdc95072254d3e3a8)\[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/WYvD/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/WYvD/image.png)

[15:06](#msg5f85c27edc95072254d3e3ff)Just nearby: 15

```
red 2 ;Dragable points
nearby: 15
```

[15:07](#msg5f85c2bba1c81d0a7edd57c1)I'm able to reproduce.  
When you get the points into a configuration close to the above 2..

toomasv

[15:07](#msg5f85c2cb02e81701b01c589c)Ah, `nearby` should be changed in the beginning of `d201.red` line 7.

geekyi

[15:11](#msg5f85c39524a20801a8e4ac84)\[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/HguV/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/HguV/image.png)

[15:12](#msg5f85c3e824a20801a8e4ad55)Btw, it works at the beginning, it's the particular configuration of lines that's the problem.  
And putting `nearby` at the start doesn't display anything either, yeah.  
But works when you put on the second line?

toomasv

[15:14](#msg5f85c4586e1aa94de7f8ce71)I mean `nearby` should be defined not in this window, but in file %d201.red.  
In this window there is special syntax, a mini geometric algebra DSL.

[16:58](#msg5f85dca61cbba72b63da5ff4)@geekyi But it works nevertheless :) Here it just sets line-weight for red points too. And if you grab too close to orange (non-dragable) points of smaller triangle, then the error occurs.

geekyi

[18:23](#msg5f85f0bb07361f0cc64c92f4)Ah I see, that's what's happening

## Thursday 15th October, 2020

toomasv

[09:55](#msg5f881c907be0d67d2774dc7a)Added \[3D-player](https://github.com/toomasv/GA) (%d301.red):  
\[!\[pga3d-player](https://toomasv.red/images/GA/pga3d-cube.gif)](https://toomasv.red/images/GA/pga3d-cube.gif)

greggirwin

[18:06](#msg5f888fb9c990bb1c390e144a)\*Really* nice @toomasv.

toomasv

[18:23](#msg5f8893bf3d172d78b37899ad):smile:

GiuseppeChillemi

[19:20](#msg5f88a0f5a7e77a0ff14c70c5)SuperToomas!

## Thursday 22nd October, 2020

toomasv

[16:36](#msg5f91b526a7e77a0ff16313d3)\[Humpty-Dumpty](https://toomasv.red/images/GA/Humpty-Dumpty.gif)

rebolek

[17:06](#msg5f91bc27270d004bcfe31d0f):point\_up: \[5. říjen 2020 17:56](https://gitter.im/red/sandbox?at=5f7b424200f5b82075b611db) So z-buffer is done, textures are next and Doom is around the corner :-D

Respectech

[17:12](#msg5f91bd7b98a7774f1b5d1e7f)@rebolek Screenshots, please! Or better yet, link to the .red file so we can try it on our own computers. ;-p

rebolek

[17:15](#msg5f91be386c8d484be29f842b)@Respectech I'm just commenting on @toomasv post, he's doing the 3D stuff (see his post for GIF), my 3D-fu is basically dead, unfortunately.

GiuseppeChillemi

[18:33](#msg5f91d079270d004bcfe35666)Waiting Redfx game engine!

greggirwin

[19:13](#msg5f91d9e557fe0a4f30290c16)@toomasv wow. Very cool, but I'm bad with directions even on a planar surface, so...

toomasv

[19:52](#msg5f91e3047be0d67d278dd240)As you see on gif, directions are totally messed up. Not sure, if I can strighten these :).

greggirwin

[19:58](#msg5f91e475c990bb1c39257f81)I thought it was me who didn't understand the physics of your world. :^)

toomasv

[20:06](#msg5f91e640a0a3072b439b2044)Yes, it is a weird world I live in.

greggirwin

[20:07](#msg5f91e686631a250ab286b170)And you created it!

## Monday 26th October, 2020

toomasv

[14:23](#msg5f96dbe6631a250ab293259b)\[Strightening Humpty-Dumpty](https://toomasv.red/images/GA/directions.gif)

endo64

[16:35](#msg5f96fac1a0a3072b43a7b8bf)Cool!! 😲

greggirwin

[17:38](#msg5f97099cc7ef520fffc71151):+1: No more strange physics? But can you write a program to show it solving a Rubik's cube? ;^)

toomasv

[18:41](#msg5f971871eb82301c1a4ede63)Nope :( Not yet.

GiuseppeChillemi

[21:04](#msg5f9739cceb82301c1a4f3d36)I have written a small piace of code to show which function WORDS have been defined between the current used interpreter and and older one. The script needs some refinements but it works:

```
mee: [
	system/script/args: to-file system/script/args
	write system/script/args "" 
	x: words-of system/words
	forall x [
		if value? first x [
			if find [function! native! action! op! routine!] ty: to-word type? get first x 

			[WRITE/append/lines system/script/args TO-STRING first x]		 
	;		[prin [first x " : " spec-of get first x] probe ty]
		]
	]
]

do/args mee "words-red.txt"

save %save-words.r head insert tail insert copy mee reduce ['Red []] reduce ['quit]

;---------------vvvvvvvvvvv---Change-here-----------------
call/show/wait "red-063.exe save-words.r words-red-old.txt"

foreach word sort exclude read/lines %words-red.txt read/lines %words-red-old.txt [
	Print ["New-word: " word]
]

delete %words-red-old.txt
delete %words-red.txt
delete %save-words.txt
```

This is the result between a Red version from August and Red 0.63:

```
New-word:  alert
New-word:  as-money
New-word:  average
New-word:  caret-to-offset
New-word:  close
New-word:  compress
New-word:  count-chars
New-word:  create
New-word:  debug-info?
New-word:  decode-url
New-word:  decompress
New-word:  deep-reactor
New-word:  dt
New-word:  encode-url
New-word:  last?
New-word:  load-csv
New-word:  load-json
New-word:  make-face
New-word:  money?
New-word:  offset-to-caret
New-word:  offset-to-char
New-word:  open
New-word:  open?
New-word:  os-info
New-word:  query
New-word:  reactor
New-word:  recycle
New-word:  ref?
New-word:  register-scheme
New-word:  rename
New-word:  rtd-layout
New-word:  scan
New-word:  set-slot-quiet
New-word:  single?
New-word:  stop-events
New-word:  stop-reactor
New-word:  sum
New-word:  to-csv
New-word:  to-json
New-word:  to-local-date
New-word:  to-money
New-word:  to-ref
New-word:  to-UTC-date
New-word:  transcode
New-word:  update
New-word:  _save-cfg
```

The script is mean to remain updated with the new Words added to Red

[21:07](#msg5f973a95ea6bfb0a9a5dd260)Further version will grab the console I/O  
Please note: you have to change the interpreter name to the filname of the one you want to compare. I have pointed which filename to change in the comment. I have not defined many words to avoid polluting the system/words context just in case, so many instructions and strings are repeated.

[21:12](#msg5f973bcb6c8d484be2ad5299)The script can compare both Red and Rebol dictionaries. Just put `Rebol.exe` in the current script dir and change the following lines:

```
save %save-words.r head insert tail insert copy mee reduce ['Red []] reduce ['quit]

;---------------vvvvvvvvvvv---Change-here-----------------
call/show/wait "red-063.exe save-words.r words-red-old.txt"
```

To:

```
save %save-words.r head insert tail insert copy mee reduce ['Rebol []] reduce ['quit]

call/show/wait "rebol.exe save-words.r words-rebol.txt"
```

[21:14](#msg5f973c24955f6d78a9542153)The following words \*\*are not in Rebol\**

```
New-word:  %
New-word:  <<
New-word:  >>
New-word:  >>>
New-word:  a-an
New-word:  acos
New-word:  alert
New-word:  all-word?
New-word:  any-list?
New-word:  arctangent2
New-word:  as
New-word:  as-color
New-word:  as-ipv4
New-word:  as-money
New-word:  as-rgba
New-word:  asin
New-word:  atan
New-word:  atan2
New-word:  average
New-word:  caret-to-offset
New-word:  center-face
New-word:  class-of
New-word:  clear-reactions
New-word:  complement?
New-word:  context?
New-word:  continue
New-word:  cos
New-word:  count-chars
New-word:  create
New-word:  create-dir
New-word:  debug-info?
New-word:  deep-reactor
New-word:  dir
New-word:  distance?
New-word:  do-actor
New-word:  do-events
New-word:  do-file
New-word:  do-safe
New-word:  do-thru
New-word:  draw
New-word:  dump-face
New-word:  dump-reactions
New-word:  ellipsize-at
New-word:  encode-url
New-word:  eval-set-path
New-word:  exists-thru?
New-word:  expand
New-word:  expand-directives
New-word:  extend
New-word:  extract-boot-args
New-word:  face?
New-word:  fetch-help
New-word:  find-flag?
New-word:  flip-exe-flag
New-word:  float?
New-word:  foreach-face
New-word:  get-current-dir
New-word:  get-scroller
New-word:  handle?
New-word:  help-string
New-word:  hex-to-rgb
New-word:  immediate?
New-word:  insert-event-func
New-word:  is
New-word:  keys-of
New-word:  last-lf?
New-word:  layout
New-word:  link-sub-to-parent
New-word:  link-tabs-to-parent
New-word:  ll
New-word:  load-csv
New-word:  load-json
New-word:  load-thru
New-word:  make-face
New-word:  math
New-word:  metrics?
New-word:  modify
New-word:  NaN?
New-word:  normalize-dir
New-word:  object
New-word:  offset-to-caret
New-word:  offset-to-char
New-word:  on-face-deep-change*
New-word:  open?
New-word:  os-info
New-word:  overlap?
New-word:  pad
New-word:  parse-trace
New-word:  path-thru
New-word:  percent?
New-word:  put
New-word:  quit-return
New-word:  react
New-word:  react?
New-word:  reactor
New-word:  read-clipboard
New-word:  read-thru
New-word:  red-complete-input
New-word:  ref?
New-word:  register-scheme
New-word:  remove-event-func
New-word:  request-dir
New-word:  request-file
New-word:  request-font
New-word:  routine
New-word:  rtd-layout
New-word:  scan
New-word:  set-current-dir
New-word:  set-flag
New-word:  set-focus
New-word:  set-quiet
New-word:  set-slot-quiet
New-word:  shift-left
New-word:  shift-logical
New-word:  shift-right
New-word:  show
New-word:  sin
New-word:  single?
New-word:  size-text
New-word:  split
New-word:  sqrt
New-word:  stop-events
New-word:  stop-reactor
New-word:  sum
New-word:  tan
New-word:  to-csv
New-word:  to-float
New-word:  to-json
New-word:  to-local-date
New-word:  to-percent
New-word:  to-red-file
New-word:  to-ref
New-word:  to-unset
New-word:  to-UTC-date
New-word:  transcode
New-word:  unview
New-word:  update-font-faces
New-word:  vector?
New-word:  view
New-word:  within?
New-word:  write-clipboard
New-word:  write-stdout
New-word:  _save-cfg
```

[21:20](#msg5f973db6a0a3072b43a870ca)Newer versions will compare refinements too.

greggirwin

[22:00](#msg5f9747173d172d78b39dd35d)Nice. Thanks for posting @GiuseppeChillemi.

Oldes

[22:43](#msg5f97510bc7ef520fffc7e166)Now the question is, how many of these are leaks?

GiuseppeChillemi

[22:44](#msg5f975131270d004bcff1398f)What you mean for leaks?

greggirwin

[22:48](#msg5f97524aa0a3072b43a8a9e4)Things used internally that aren't meant to be user-facing.

[22:49](#msg5f97528661007f7d1b984a0a)e.g. `_save-cfg` is a likely suspect.

[22:50](#msg5f9752c0ea6bfb0a9a5e13d6)`red-complete-input` is likely from the console, etc.

GiuseppeChillemi

[22:53](#msg5f97536b6c8d484be2ad9edd)You have found a secondary use for the script 😁

greggirwin

[22:55](#msg5f9753c67be0d67d279bb6cb)I have an old func for R2 called `mark-my-words` which helped me track leaked words.

GiuseppeChillemi

[22:56](#msg5f975428bbffc02b58405d83)Nice to know!

[22:57](#msg5f975440631a250ab294886f)I am already in my bed, I will search for it on rebol.org.

[22:57](#msg5f97545e6c8d484be2ada234)Also `set-slot-quiet` makes me curios.

[22:59](#msg5f9754ebc990bb1c39333c4b)`on-face-deep-change*` also seems a leaked word

greggirwin

[22:59](#msg5f9754edbbffc02b58405ecf)

```
REBOL []

mark-my-words: context [
    init: does [query/clear system/words]
    dump: has [val] [
        print ['Word tab 'Type tab 'Value]
        foreach word query system/words [
            print [word tab type? val: get word tab either not object? :val [mold :val] [mold first :val]]
        ]
    ]
    set 'globals? func [file [file!]] [
        query/clear system/words
        do file
        mark-my-words/dump
        print ['Word tab 'Type tab 'Value]
        foreach word query system/words [
            print [word tab type? val: get word tab either not object? :val [mold :val] [mold first :val]]
        ]
    ]
]

; Usage:
; mark-my-words/init
;
; o: make object! [a: b: c: none set 'xx none]
; my-int: 23
; I-have-issues: #this-is-my-biggest-issue
; fn: does [print "some fun now!"]
;
; mark-my-words/dump
; halt

globals? %stopwatch.r
halt
```

GiuseppeChillemi

[23:01](#msg5f9755416c8d484be2ada415)I'll try it! Nice, thanks

## Tuesday 27th October, 2020

toomasv

[04:17](#msg5f979f567be0d67d279c5e5e)@GiuseppeChillemi Very nice and useful!

GiuseppeChillemi

[06:39](#msg5f97c0b6c7ef520fffc8ddff)@toomasv Thank you!

[17:29](#msg5f9858e4955f6d78a956f0e0)I have tried to diff the current version providing a late march executable:

```
New-word:  as-money
New-word:  count-chars
New-word:  dt
New-word:  enhex
New-word:  money?
New-word:  ref?
New-word:  scan
New-word:  set-slot-quiet
New-word:  to-money
New-word:  to-ref
New-word:  transcode
New-word:  transcode-trace
```

It was interesting to discover `DT` which benchmarks a block execution.

Also, set-slot-quiet is not a leaked word.

Oldes

[18:13](#msg5f986340ea6bfb0a9a60b47f)I think that none of these is leaked.

GiuseppeChillemi

[19:49](#msg5f9879b77be0d67d279e9598)I think too. It represents just the word level visible work they have made from March to now.

## Wednesday 28th October, 2020

GiuseppeChillemi

[10:50](#msg5f994ce2f2fd4f60fc3b82ea)&gt; First we should make sure they are leaks.

Ok, I will do some checks.

## Thursday 29th October, 2020

toomasv

[05:10](#msg5f9a4eaac10273610ad17435)Now you can try to scramble and solve \[mini-rubik's-cube](https://github.com/toomasv/GA/blob/master/rubicon.red) manually (or should I say - mousically):  
\[!\[rubicon](https://toomasv.red/images/GA/rubikon.gif)](https://toomasv.red/images/GA/rubikon.gif)  
(Needs `algebra.red` and `rubik222.red` too.)  
Press "Show" to see cube. Press keys `x`, `y` or `z` and then wheel to rotate whole cube.  
Grabbing on some piece drag shortly in wanted direction to get the side rotating.  
Does not always work reliably though.

Respectech

[15:18](#msg5f9add2ac10273610ad2e105)@toomasv amazing work!

toomasv

[16:20](#msg5f9aebbf8a236947ba7231dd)@Respectech Thanks! Glad you like it :)

greggirwin

[18:46](#msg5f9b0e0cdc70b5159addb85b)Thanks @toomasv. I will try to play this weekend.

toomasv

[20:08](#msg5f9b214cdc70b5159addee37)Beware, after some time it can start falling apart again, probably due to small but growing inexactness in floating point calculations. Just hypothesis.

greggirwin

[20:18](#msg5f9b238ec6fe0131d4c33328)Interesting. Probably too much effort to experiment with using `money!`.

## Friday 30th October, 2020

toomasv

[14:17](#msg5f9c208a06fa0513dd816414)Basic elements are vectors, but they can't contain `money!` values, can they?

rebolek

[14:20](#msg5f9c21397cac87158f772f7f)They can't, right now, but IMO they could.

toomasv

[14:37](#msg5f9c2528c10273610ad6086d)Hmm, would be nice tro try. @9214?

9214

[16:21](#msg5f9c3d7a2a35440715f56df7)Probably would.

greggirwin

[21:39](#msg5f9c881606fa0513dd826f1f)When we have a non-money decimal type, that's probably better. Unless somebody is doing HFT, I don't see a benefit of money's added complexity in vectors. :^)

## Monday 9th November, 2020

bkalef88\_gitlab

[23:31](#msg5fa9d13ebf955735eb6d0aae)@9214 You posted a visualization of the defined Red system colors back in July.

```
colors: exclude sort extract load help-string tuple! 2 [transparent glass]
view/tight collect [
    until [
        foreach color take/part colors 4 [
            keep reduce [
                'base 70x40 form color get color pick [white black] gray > get color
            ]
        ]
        keep 'return
        empty? colors
    ]
]
```

Why is it that Green and Cyan don't use the black font, more precisely, they fail the `gray > get color` test? Whereas the Red color passes the test. All three have one at least one color maxed-out at 255, with cyan having green and blue, but both green and cyan not having red, but being of a very high intensity color wise.

Is there a bug in how this logic works for tuples as colors? Recall from your code;  
`FALSE` renders BLACK text and  
`TRUE` renders WHITE text

```
foreach c  [red green cyan blue][col-tup: (reduce c) print compose[c (col-tup) (gray > col-tup)]]
```

```
red 255.0.0 false                 ;white
green 0.255.0 true                 ;black
cyan 0.255.255 true                 ;black
blue 0.0.255 true                 ;black
```

These following two scenarios are where some other colors also suggest there may be an inconsistency.

```
foreach c  [yellow brick brown sky][col-tup: (reduce c) print compose[c (col-tup) (gray > col-tup)]]
```

```
yellow 255.255.0 false                 ;white
brick 178.34.34 false                 ;white
brown 139.69.19 false                 ;white
sky 164.200.255 false                 ;white
0.200.255 0.200.255 true                 ;black
1.255.255 1.255.255 true                 ;black
```

[23:32](#msg5fa9d17e8a236947ba967d18)Why are brick and brown false (black text) and below, the first two numeric colors show that even though they have very high numbers of 128, that they are 'smaller than gray'

```
foreach c  [0.255.255 64.255.255 128.255.255][col-tup: (reduce c) print compose[c (col-tup) (gray > col-tup)]]
```

```
0.255.255 0.255.255 true                 ;black
64.255.255 64.255.255 true                 ;black
128.255.255 128.255.255 false                 ;white
```

greggirwin

[23:38](#msg5fa9d2e1b86f6407043f857b)Brown and brick are not less than gray here. Tuple values, whether used for colors or otherwise, are simply compared as the value in each segment, in order, just as with a block of integers.

[23:38](#msg5fa9d30bd5a5a635f2afb82a)

```
>> sort reduce [yellow brick brown sky gray]
== [128.128.128 139.69.19 164.200.255 178.34.34 255.255.0]
```

[23:39](#msg5fa9d34cb4283c208a55ece5)

```
>> sort [3.2.1 2.1.3 1.2.3 2.2.2 1.1.1 3.3.3]
== [1.1.1 1.2.3 2.1.3 2.2.2 3.2.1 3.3.3]
```

bkalef88\_gitlab

[23:42](#msg5fa9d3e97cac87158f98976b)okay, then this is simply the case that an alternate logic needs to be used here then. I was expecting the way this was coded that it understood the difference between colors... thanks for the explanation.

greggirwin

[23:47](#msg5fa9d509d5a5a635f2afbc36)Color space is much trickier, but I vaguely remember that someone has done something in that area.

## Tuesday 10th November, 2020

9214

[01:04](#msg5fa9e7188a236947ba96a9b2)@bkalef88\_gitlab

&gt; being of a very high intensity color wise

Tuples encode colors in RGB space, not HSV, so there's no such thing as intensity, only ratios of 3 primary colors.

```
bright?: func [color [tuple!]][
	50% < divide third sort to binary! color 255
]

colors: exclude sort extract load help-string tuple! 2 [transparent glass]

view/tight collect [
    until [
        foreach color take/part colors 4 [
            keep reduce [
                'base 70x40 lowercase form color get color pick [black white] bright? get color
            ]
        ]
        keep 'return
        empty? colors
    ]
]
```

bkalef88\_gitlab

[01:19](#msg5fa9ea84d37a1a13d69874f4)apologies, was saying intensity, thinking brightness, or proximity to pure white.

## Wednesday 23th December, 2020

toomasv

[19:17](#msg5fe397bc63fe034496156b8d)Did anybody have a need to make parts of an image transparent based on color? E.g. you have image ...

```
img1: draw 120x120 [
	anti-alias off 
	pen off 
	box 0x0 119x119 
	pen black 
	line-width 10 
	fill-pen red 
	circle 59x59 40
]
```

... that is on blue background...

```
view [backdrop blue image img1]
```

\[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/x76p/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/x76p/image.png)

... and you'd like to make black (or red or white) transparent?

\[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/ujQR/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/ujQR/image.png) \[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/iJqb/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/iJqb/image.png) \[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/Bf6H/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/Bf6H/image.png)

How would you do this? (I mean taking the existing image, not by new image with new Draw)

My \[attempt](https://gist.github.com/toomasv/eee95ae869b71d221076aebf2da7bb8a).

hiiamboris

[19:25](#msg5fe399b522f12e449b0acf8f)Using `img/argb` should be faster

[19:28](#msg5fe39a43dbb17f28c5978088)what's your use case? ;)

toomasv

[19:35](#msg5fe39c17de608143153ce7bf)Just playing around now.  
I'll look at the `argb` too. But you have still to "smudge" the color as they are sometimes set off a bit.

hiiamboris

[19:36](#msg5fe39c3dc746c6431cd19ae6)It (color being off) won't happen on D2D. It's a workaround for a GTK+ issue.

[19:37](#msg5fe39c86e7f693041f2a2b45)I do have a need to subtract and multiply images though ;)

[19:38](#msg5fe39c9fdbb17f28c5978a05)We really need that and some masking in Draw.

[19:41](#msg5fe39d70e7f693041f2a2e26)Using 3 charsets is a clever way out :+1:

## Thursday 24th December, 2020

toomasv

[06:01](#msg5fe42ea3dbb17f28c598e28c)@hiiamboris BTW I arrived at this solution only after having tried and failed to manipulate color of individual pixels directly. E.g. by `img/alpha/: <1 - 255>`This seems to have no effect. Neither does it work on `rgb` nor on `argb`. Only changing the whole lot at once works, i.e. `img/alpha: 255`. Same for `rgb` and `argb`. But for these it is rarely needed I guess. Is it intended or bug?

hiiamboris

[09:36](#msg5fe46105c746c6431cd3687f)I mean you can parse (change) whole `argb` then set it back `img/argb: ..` and it'll be faster than mold/load

[09:36](#msg5fe46130dbb17f28c59954b5)I think it's intended but better ask @qtxie ;)

toomasv

[09:52](#msg5fe464d7dbb17f28c5995c5a)Ok, thanks!

qtxie

[10:18](#msg5fe46b04aa6bb528c36be7cb)&gt; Did anybody have a need to make parts of an image transparent based on color? E.g. you have image ...

`key-color` ? http://www.rebol.com/docs/draw.html#section-14

toomasv

[10:31](#msg5fe46dfac746c6431cd3834e)@qtxie Yes, that would be cool too, but is there a simple way to do this just manipulating `image!`, not from inside Draw dialect? Or it will remain a task for user func?

[11:40](#msg5fe47e3eac9d8e7463cbffe4)@hiiamboris I compared two versions of `transparent`, and interestingly, while manipulating `argb` as you suggested is more memory-efficient, it will slow down in proportion to length of changed color, but time of my original method will remain ~constant.

```
set 'transparent function [img [image!] color [tuple!]][
		spec: load mold img 
		color: smudge color 
		alpha: rejoin parse spec/3/2 [
			collect some [
				color keep (#{FF})
			| 	3 skip keep (#{00})
			]
		] 
		append spec/3 alpha 
		do spec
	]
	set 'transparent2 function [img [image!] color [tuple!]][
		img: copy img
		color: reverse smudge color 
		argb: copy img/argb
		parse argb [
			some [
				color change skip (#{00}) 
			| 	4 skip
			]
		] 
		img/argb: argb
		img
	]
```

Profiling:

```
>> profile/count/show [[transparent img1 black][transparent2 img1 black]] 100
Count: 100
Time         | Time (Per)   |      Memory | Code
0:00:01.85   | 0:00:00.019  |    17341884 | [transparent2 img1 black]
0:00:01.886  | 0:00:00.019  |   176054040 | [transparent img1 black]
>> profile/count/show [[transparent img1 red][transparent2 img1 red]] 100
Count: 100
Time         | Time (Per)   |      Memory | Code
0:00:01.827  | 0:00:00.018  |   176055640 | [transparent img1 red]
0:00:02.242  | 0:00:00.022  |    17343484 | [transparent2 img1 red]
>> profile/count/show [[transparent img1 white][transparent2 img1 white]] 100
Count: 100
Time         | Time (Per)   |      Memory | Code
0:00:01.76   | 0:00:00.018  |   176058840 | [transparent img1 white]
0:00:03.535  | 0:00:00.035  |    17346684 | [transparent2 img1 white]
```

hiiamboris

[15:20](#msg5fe4b1aaaa6bb528c36c9538)that's odd

[16:36](#msg5fe4c373ac9d8e7463cca3a2)

```
set 'transparent3 function [img [image!] color [tuple!]][
        img: copy img
        color: smudge reverse color 
        argb: img/argb
        img/alpha: to #{} parse/case argb [
            collect [
                some [
                    color  keep #{00}
                |   3 skip keep skip
                ]
            ]
        ] 
        img
    ]
```

this one seems best

[16:36](#msg5fe4c385dbb17f28c59a3c0f)ideally we want `collect into` but it's broken on binary :(

[16:37](#msg5fe4c3c663fe03449618326d)I find it suspicious though that parse's `change` is that slow

toomasv

[18:52](#msg5fe4e367aa6bb528c36d04ae)Thanks! But.. er.. this doesn't work :anguished:

[19:03](#msg5fe4e61e8bb734746952458b)It works (and is best so far) this way:

```
set 'transparent3 function [img [image!] color [tuple!]][
        img: copy img
        color: smudge reverse color 
        argb: img/argb
        img/alpha: to #{} parse/case argb [
            collect [
                some [
                    color  skip keep (#{FF})
                |   4 skip keep (#{00})
                ]
            ]
        ] 
        img
    ]
```

hiiamboris

[19:23](#msg5fe4ea9c2084ee4b786e81c0)Ah right! I forgot that `alpha` is complementary to alpha in `argb` ;)

toomasv

[19:48](#msg5fe4f0a8dbb17f28c59aa247)There is another possibility of direct change, that is best memory-wise but worst time-wise:

```
set 'transparent4 function [img [image!] color [tuple!]][
		img: copy img
		repeat i length? img [
			all [
				1 >= absolute (a: img/:i/1) - color/1
				1 >= absolute (b: img/:i/2) - color/2
				1 >= absolute (c: img/:i/3) - color/3
				img/:i: as-rgba a b c 255
			]
		]
		img
	]
```

## Friday 25th December, 2020

qtxie

[01:13](#msg5fe53cbf2084ee4b786f3b09)&gt; @qtxie Yes, that would be cool too, but is there a simple way to do this just manipulating `image!`, not from inside Draw dialect? Or it will remain a task for user func?

A task for user func.

## Saturday 26th December, 2020

toomasv

[14:29](#msg5fe748d922f12e449b12e8f5)\[!\[Merry Christmas!](https://toomasv.red/images/Misc/merry-christmas.gif)](https://toomasv.red/images/Misc/merry-christmas.gif)

greggirwin

[19:55](#msg5fe795284eba353cdffe817c)Code! I want the code for Christmas! ;^)

Very nice Toomas. Thanks for posting that.

[19:55](#msg5fe795468bb7347469580b14)I always love the creative things you come up with.

toomasv

[21:18](#msg5fe7a89dac9d8e7463d2c54c):smile: Thanks! Code is below. `transparent` is any func from above. For some reason switching off anti-aliasing seems sometimes not to work and there are still half-tones. I added a step to eliminate these but this makes font fatter. The version above was made without this step.

```
xmas: make font! [size: 32 style: 'bold]
ximg: draw 360x70 [
   anti-alias off 
   fill-pen white pen off 
   box 0x0 359x69 
   pen black font xmas 
   text 4x0 "Merry Christmas!"
]
ximg/rgb: to #{} parse ximg/rgb [
   collect some [keep #{FFFFFF} | 3 skip keep (#{010101})]
]
do %transparent.red
xi: transparent ximg black
img: load %rainbow.png
view/tight/flags [
   title "" 
   box 360x70 
   draw [
      i1: image img 0x0 359x69 
      i2: image img -360x0 -1x69
   ] on-time [
      x1: i1/3/x + 5 % 360 
      i1/3/x: i2/4/x: x1 
      i1/4/x: x1 + 360 
      i2/3/x: x1 - 360
   ] 
   rate 30 
   at 0x0 image xi
][no-min no-max]
```

[21:18](#msg5fe7a8b297312f4b6bf0382e)Here is `rainbow.png`:  
\[!\[rainbow.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/X9b2/thumb/rainbow.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/X9b2/rainbow.png)

hiiamboris

[21:47](#msg5fe7af6faa6bb528c37305fa)Should be possible to replace rainbow with a gradient

greggirwin

[23:11](#msg5fe7c31863fe0344961e8f72)Thanks!

## Sunday 27th December, 2020

gltewalt

[05:46](#msg5fe81fb1aa6bb528c373dedf)peeking in, looking around

toomasv

[06:10](#msg5fe82548ac9d8e7463d3b159)@gltewalt Hi, Greg! Nice to see you around!  
@hiiamboris Yes, but rainbow was just before my nose..

gltewalt

[06:46](#msg5fe82db18bb73474695931d1)Hi @toomasv :-)

[06:49](#msg5fe82e61de6081431546e0fb)Easy using Red despite my extreme rust, but the possibility of solving it without a string involved got me thinking...

https://leetcode.com/problems/palindrome-number/

toomasv

[06:50](#msg5fe82ec8c746c6431cdb92a7)Ok, so, what's your solution?

gltewalt

[06:53](#msg5fe82f5ece40bd3cdb051ffa)I don't have one that doesn't involve a string.

[06:54](#msg5fe82fa3ce40bd3cdb0520bf)the quick solution that involves `mold`

```
num-palindrome?: func [num [integer!]][either negative? num [false][num == load reverse mold num]]
```

toomasv

[06:56](#msg5fe83003ce40bd3cdb0521a0)Yes, string manipulation for that seems easiest. I got this:

```
palindrome: func [input][(a: form input) = reverse copy a]
```

gltewalt

[06:56](#msg5fe8301a22f12e449b14c052)And by their example #2, should a positive sign also be false? `+909`

toomasv

[06:57](#msg5fe83048acd1e516f8b83f2f)I think so, because he treats number as string, otherwise `-121` could not become `121-`.

gltewalt

[06:57](#msg5fe830494eba353cdfffb532)The thing that interested me was whether it would be possible in Red to do it without a string

[06:57](#msg5fe8306edbb17f28c5a1663b)As for +909, Red treats them the same, discarding the +

toomasv

[06:59](#msg5fe830c963fe0344961f5eb4)Hmm, I think only treating it on lexer level (or transcode) can detect this.

gltewalt

[06:59](#msg5fe830d7dbb17f28c5a16724)I think you are right

toomasv

[07:00](#msg5fe830f5dbb17f28c5a167a2)Ok, have to go. Hope to see you around!

gltewalt

[07:00](#msg5fe8311122f12e449b14c32d)Ok, see you later :)

[08:32](#msg5fe84690ce40bd3cdb054de9)

```
?: func [n [integer!]][
   if find n: append copy http:// n '- [false]
   (last split n "//") == (first split reverse n "//")
]
```

[08:33](#msg5fe846cdaa6bb528c3742e3e)bed time..

toomasv

[10:35](#msg5fe8637c2084ee4b7875c512)@gltewalt Here's my try to solve it numerically:

```
pal-int-rome: function [i [integer!]][
   case [
      i = 0 [return true] 
      i < 0 [return false] 
      'else [
         n: 1 
         pieces: clear [] 
         while [i > 0][
            append pieces i - (i: round/floor/to i m: 10 ** n) / (m / 10) 
            n: n + 1
         ] 
         pieces = reverse copy pieces
      ]
   ]
]
pal-int-rome 11 ;== true
pal-int-rome 12 ;== false
pal-int-rome 22 ;== true
pal-int-rome 222 ;== true
pal-int-rome 322 ;== false
pal-int-rome 22322 ;== true
pal-int-rome 22332 ;== false
pal-int-rome 23332 ;== true
pal-int-rome -23332 ;== false

;But also...
pal-int-rome +23332 ;== true
pal-int-rome -0 ;== true
```

[13:41](#msg5fe88f07c746c6431cdc6988)Here is adjusted code for rainbow messages. Doesn't need extras anymore:

```
xfont: make font! [size: 32 style: 'bold]
sz: 360x70
ximg: draw sz [font xfont text 4x0 "Merry Christmas!"]
area: make-face 'area [size: 1200x20]
make-merry: func [/color clr [tuple!] /font fspec [block!] /text txt /pad pd][
	if font [xfont: make font! fspec]
	pd: any [pd 4x0]
	if text [
		area/font: xfont 
		sz: size-text/with area txt 
		ximg: draw sz compose [font xfont text (pd) (txt)]
	]
	clr: either color [reverse to-binary clr][#{FFFFFF}]
	xi: copy ximg
	xi/argb: to #{} parse xi/argb [
		collect some [set a 3 skip keep (clr) skip keep (a)]
	]
	system/view/auto-sync?: off
	
	view/tight/flags compose/deep [
		title "" 
		box (sz) draw [
			pen off 
			fill-pen linear blue green yellow red blue 
			i1: box 0x0 (sz - 1) 
			i2: box (as-pair 0 - sz/x 0) (as-pair 0 sz/y - 1)
		] on-time [
			x1: i1/2/x + 5 % (sz/x) 
			i1/2/x: i2/3/x: x1 
			i1/3/x: x1 + (sz/x) 
			i2/2/x: x1 - (sz/x) 
			show face
		] rate 30 
		at 0x0 image xi
	][no-min no-max]
]
```

Try with examples:

```
make-merry
make-merry/text "Happy New Year!"
make-merry/color/font sky [size: 48 style: 'bold name: "Courier New"]
```

hiiamboris

[13:47](#msg5fe89074acd1e516f8b90e70):clap:

toomasv

[14:04](#msg5fe8948063fe034496203842)@hiiamboris Thanks for your help and suggestions!

gltewalt

[17:52](#msg5fe8c9ccde60814315483921)yep, I was thinking in wrangling datatypes but math works

greggirwin

[21:54](#msg5fe902a863fe034496214003)@gltewalt nice to see you!

@toomasv that's a great and terrible pun name. And a nice numeric solution!

## Monday 28th December, 2020

gtzip

[02:40](#msg5fe945abde60814315493f10)Can do it with a formula, I'm sure, but im math disabled

[02:41](#msg5fe945d98bb73474695b9209)I always sign in to an ancient github thats the wrong one

gltewalt

[02:46](#msg5fe9470f2084ee4b7877bb4e)There

[02:47](#msg5fe9473397312f4b6bf3a044) Hi Gregg

greggirwin

[19:47](#msg5fea3636acd1e516f8bcc22a)@toomasv don't lose that code! Really nice, and efficient if my CPU meter is to be trusted.

## Tuesday 29th December, 2020

gltewalt

[00:18](#msg5fea75c5de608143154c0cef)Been slowly working through Haskell, and it's a mind jostler.

[00:41](#msg5fea7b3aac9d8e7463d8efff)Might hit a wall

[00:54](#msg5fea7e6197312f4b6bf67615)Forgot about red/chitchat. So... are sandbox and chitchat essentially the same ?

greggirwin

[00:56](#msg5fea7eb8ce40bd3cdb0a68fa)Chit chat is more social, sandbox is for fun things people work on.

toomasv

[13:59](#msg5feb365263fe034496265632)@greggirwin

&gt; don't lose that code!

Tuned it a bit more:  
https://gist.github.com/toomasv/2089756677219fca1cd67a0067e7e07d

[18:16](#msg5feb727cde608143154e7385)It's snowing here  
\[!\[white-christmas](https://toomasv.red/images/Misc/flakes.gif)](https://toomasv.red/images/Misc/flakes.gif)

greggirwin

[18:43](#msg5feb78c7aa6bb528c37b9ab1):clap: :^)

[18:45](#msg5feb793bdbb17f28c5a8f9d8)Maybe we should add a holiday folder to red/code or red/community for seasonal demos.
