# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2018

## Monday 1st January, 2018

rebolek

[00:05](#msg5a497b3429ec6ac311a4434e)@nedzadarek `??` and `dump-face` use `print`to output some additional informations and format the result in some way.

nedzadarek

[00:09](#msg5a497c42edd2230811fa85c1)@gltewalt @rebolek it's seems just `??` just adds `make object [...]`. Can we make `dump-face` to output more/other informations or not to output some field? For example, in `Style: base Offset: 10x10 Size: 20x20 Text: none`I don't want `Text` but I want `Color`.

gltewalt

[00:25](#msg5a497fe829ec6ac311a456fb)`view [b: base on-over [?? b/color]]`

[00:25](#msg5a497ff90163b028109ab9ea)or `[print b/color]`

[00:28](#msg5a4980b6b48e8c3566870ff0)Here's the source for `dump-face`, so yeah you could modify it for your own needs

```
dump-face: func [
    {Display debugging info about a face and its children} 
    face [object!] "Face to analyze" 
    /local depth f
][
    depth: "" 
    print [
        depth "Type:" face/type "Style:" if face/options [face/options/style] 
        "Offset:" face/offset "Size:" face/size 
        "Text:" if face/text [mold/part face/text 20]
    ] 
    append depth "    " 
    if block? face/pane [foreach f face/pane [dump-face f]] 
    remove/part depth 4 
    face
]
```

[00:39](#msg5a49835f5355812e573998be)Once you have an object to refer to, like `b`, you could do `select b 'color` if you just wanted the value of color

rjriv

[00:41](#msg5a4983b9ba39a53f1ac0ddcb):point\_up: \[December 31, 2017 6:43 PM](https://gitter.im/red/red/gui-branch?at=5a49761f84fb74b940230226)Alas, no, that is not my site, but I just volunteered yesterday to help out with it and have been trying to organize the useful bits I can pay attention to in these conversations! I reached out to @mikeparr to offer assistance, but would be willing to help receive and organize ideas and examples.

[00:54](#msg5a4986e203838b2f2a581b3a)Amazingly, this works on a Mac (not Windows, sorry...):

```
cursor_resizeleftright: %/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/HIServices.framework/Versions/A/Resources/cursors/resizeleftright/cursor_1only_.png

view [ base 2x100 cursor cursor_resizeleftright ]
```

The resulting cursor does not scale nicely like the built-in cursors (hand, I-beam, cross) when the cursor size is increased via accessibility services, but might be useful if you are trying to create a vertical splitter. "resizeupdown" is available as well.

BeardPower

[01:10](#msg5a498a9d232e79134db04fe6)It would be interesting what is planned for the custom widgets, as there was already some discussion about draw-based charts.

[01:11](#msg5a498ab868d092bb620d54ed)&gt;Provide a structured way for custom widgets creation.

mikeparr

[10:53](#msg5a4a1344232e79134db21664)@rjriv great! Thanks.

toomasv

[16:16](#msg5a4a5ec029ec6ac311a787fb)Is this a bug or intended? `panel` (and `group-box` as well) seems not to fully support reactions (on W10). Compare these two snippets:

```
; With `box`, `react` works while moving either colored box
view [
   size 500x300 
   at 0x0 base react [
      face/offset: n/offset 
      face/size: p/offset + p/size - n/offset
   ] 
   n: box loose red 50x50 
   p: box blue loose 
]

; With `panel`, `react` works only when moving red box, not while moving blue panel
view [
   size 500x300 
   at 0x0 base react [
      face/offset: n/offset 
      face/size: p/offset + p/size - n/offset
   ] 
   n: box loose red 50x50 
   p: panel 100x100 blue loose []
]
```

In clean console it doesn't even get `p`!

greggirwin

[16:49](#msg5a4a668068d092bb62108c8b)@toomasv, it does seem to be an issue of some kind. With no pane spec for the panel, it works.

```
view [
   size 500x300 
   at 0x0 base react [
      face/offset: n/offset 
      face/size: p/offset + p/size - n/offset
   ] 
   n: box loose red 50x50 
   p: panel 100x100 blue loose
]
```

It also works if you remove the reference to `p` in the `base` that is has the react actor. Other than that part of the demo not working of course.

toomasv

[20:01](#msg5a4a93adb48e8c35668b4772)@greggirwin Thanks! Solved it:

```
lay: layout [
   size 500x300 
   n: box loose red 50x50 
   p: panel 100x100 blue loose []
]
insert lay/pane layout/only [
	at 0x0 base react [
		face/offset: n/offset 
		face/size: p/offset + p/size - n/offset
	]
]
view lay
```

greggirwin

[22:51](#msg5a4abb5503838b2f2a5cdabc)Still worth a ticket IMO. I can file it if you're busy.

## Tuesday 2nd January, 2018

nedzadarek

[00:07](#msg5a4acd45ba39a53f1ac5ded1)@gltewalt thank you for source  
@rjriv Do you have place where we can upload code? I think github has gists - sample codes that you can comment.

greggirwin

[00:15](#msg5a4acf1003838b2f2a5d2e6b)@toomasv, another way around it. Just need `p` to exist before the reactor body is evaluated.

```
move-to-top: func [face] [move find face/parent/pane face tail face/parent/pane]

view/no-wait [
   size 500x300 
   at 60x60
   p: panel 100x100 blue loose []
   at 0x0 base react [
      face/offset: n/offset 
      face/size: p/offset + p/size - n/offset
   ] 
   n: box loose red 50x50 
]
move-to-top p
do-events
```

[01:02](#msg5a4ada400163b028109ff6a9)@toomasv I added notes to the reactivity wiki page for now, in any case.

toomasv

[04:42](#msg5a4b0db90163b02810a0a60d)@greggirwin Thanks, you saved my day! Again! :)

[07:08](#msg5a4b2ffa5355812e57403339)@greggirwin The cleanest way to do it:

```
view [
	size 500x300
	style node: box loose
	style pan: panel loose []
	at 0x0 base react [
		face/offset: n/offset 
		face/size: p/offset + p/size - n/offset
	] 
	n: node red 50x50 
	at 60x60 p: pan 100x100 blue
]
```

I added this to the wiki-page too.

greggirwin

[07:35](#msg5a4b36355355812e57404d60)Excellent. Thanks @toomasv.

[07:36](#msg5a4b367b84fb74b94029c61e)That may give @qtxie a clue about why it happens in the first place as well.

mikeparr

[12:04](#msg5a4b75565355812e574183eb)@greggirwin Where is the reactivity wiki page please?

soapdog

[12:29](#msg5a4b7b24ba39a53f1ac8a985)friends, thanks a lot for the `text-box!` tip. I am failing to find more information about it. Can someone point me in the correct direction?

rebolek

[12:31](#msg5a4b7ba9ba39a53f1ac8ab9a)@soapdog https://github.com/qtxie/red/wiki/Text-box!-Usage

soapdog

[12:36](#msg5a4b7cca232e79134db834de)Thanks again @rebolek :grin: I might have something shippable today (as a POC)

Phryxe

[12:37](#msg5a4b7cf1edd223081102a890)`?? text-box!` will give slightly different info ...

rebolek

[12:37](#msg5a4b7d210163b02810a29beb)It is possible some changes have been made to `text-box!` after writing this document.

soapdog

[12:40](#msg5a4b7dc603838b2f2a60031f)it might because all the examples there are crashing red 0.6.3 on Windows 10

[12:40](#msg5a4b7dd5edd223081102af03)in crashing, I mean it explodes and the console app closes

Phryxe

[13:17](#msg5a4b8673edd223081102d90f)I tried to paste the text-box examples from @qtxie in console on Win 7 (with latest Red) and all I get is a blank window.

[13:20](#msg5a4b872f0163b02810a2cdaf)On the other hand I don't have the Menlo font installed ...

rebolek

[13:21](#msg5a4b875368d092bb62155c85)@Phryxe Then you probably need to wait until `text-box!` is finished, it's still under development.

Phryxe

[13:21](#msg5a4b8777ba39a53f1ac8e774)@rebolek Ah, nemas problemas.

rjriv

[13:36](#msg5a4b8ad70163b02810a2ddef):point\_up: \[January 1, 2018 7:07 PM](https://gitter.im/red/red/gui-branch?at=5a4acd45ba39a53f1ac5ded1) Hi @nedzadarek, perhaps this can be used without reinventing anything...

toomasv

[14:03](#msg5a4b914529ec6ac311acc5d0)About `text-box!` see :point\_up: \[December 15, 2017 2:40 PM](https://gitter.im/red/red/gui-branch?at=5a33c2ca03838b2f2afa9e95)

greggirwin

[19:02](#msg5a4bd73f03838b2f2a61eae1)@mikeparr, https://github.com/red/red/wiki/Reactivity.

A good trick is to search in the wiki box on the repo, though it won't always find you the page you want.

toomasv

[19:17](#msg5a4bdad75355812e5743a144)Does anybody else see, that line-break is eaten up from multi-line text with background color?

```
; Multiline shown correctly
view [box "split-^/text"]
; Line-break swallowed
view [box white "split-^/text"]
```

It will wrap with `wrap`, but then it will be vertically aligned to top:

```
view [box white wrap "split-^/text"]
```

greggirwin

[19:22](#msg5a4bdbdb232e79134dba440d)Confirmed.

toomasv

[19:22](#msg5a4bdc0c0163b02810a49f5a)@greggirwin Is it a bug?

greggirwin

[19:24](#msg5a4bdc5568d092bb6217364d)I would say so, seems OK if you use a tuple! value directly that has an alpha segment.

[19:24](#msg5a4bdc62ba39a53f1acac21d)No matter what value is in that segment.

toomasv

[19:25](#msg5a4bdc9d68d092bb62173766)Yep

[19:25](#msg5a4bdcab68d092bb621737cf)Worth a ticket?

greggirwin

[19:25](#msg5a4bdcc0232e79134dba4830)Yes.

gltewalt

[19:27](#msg5a4bdd15ba39a53f1acac6d6)Speaking of tickets - can I just fix the ‘jpeg’ thing myself and do a PR, even though he plans to redo camera with COM?

greggirwin

[19:32](#msg5a4bde36edd223081104c8fe)What is the fix again? Just adding a new extension?

gltewalt

[19:52](#msg5a4be2f8b48e8c35669144f0)It has all the file suffixes for jpeg, but only 'jpeg' for the name

[19:53](#msg5a4be32f29ec6ac311ae9a79)So if you you use 'jpg or 'jpe, it won't do anything. And not doing anything is also a fix, because it should have a cause-error

[19:53](#msg5a4be3475355812e5743cee2)`help system/codecs`

greggirwin

[19:54](#msg5a4be36bba39a53f1acae9aa)Is that a general codec issue then? That is, do all codecs fail silently if given an unknown type?

gltewalt

[19:54](#msg5a4be37b0163b02810a4c850)looks like it

[19:54](#msg5a4be37dba39a53f1acae9e9)https://github.com/red/red/blob/96b4dcdb47d6f47781ed1853d10a066d23aa530e/environment/functions.red#L414

greggirwin

[19:55](#msg5a4be3c668d092bb62175d5b)That seems like a great catch then. Definitely worth a PR.

gltewalt

[19:56](#msg5a4be3f468d092bb62175e07)Oh it looks like the issue was assigned already so probably too late

greggirwin

[19:58](#msg5a4be47603838b2f2a6234a2)What ticket? I can't find one in a quick search.

gltewalt

[19:59](#msg5a4be4b729ec6ac311aea2b4)#3176

greggirwin

[20:02](#msg5a4be53cb48e8c3566915099)Ah, need a `save` ticket specifically. I think the camera issue is separate.

[20:02](#msg5a4be56168d092bb62176456)So file a new ticket and submit a fix. Thanks!

gltewalt

[20:11](#msg5a4be78d29ec6ac311aeb598)easiest fix would be error in place of `exit`

[20:12](#msg5a4be79db48e8c3566915d2b)If I could find where `caue-error` is again....

[20:12](#msg5a4be7b8ba39a53f1acb0384)The table of errors

greggirwin

[20:49](#msg5a4bf0470163b02810a50f3a)%environment/system.red

gltewalt

[20:54](#msg5a4bf19668d092bb6217a5ee)Got it

## Friday 5th January, 2018

toomasv

[12:54](#msg5a4f756a29ec6ac311c06ede)Attempt on toy \[graph-DSL](https://gist.github.com/toomasv/be38d5b451bc02da25e81a1cdba589fc) E.g.:

```
graph [n1 -> [n3 n4] n1 -> n2 nodes [big-square mint] n4 -> n5 "three" n2 -> n5 n3 -> [n6 "one" n7 "two"]]
```

results in !\[graph](http://vooglaid.ee/red/graph.png)  
(Some examples in the end of file)

pekr

[12:54](#msg5a4f759203838b2f2a73ba4e)nice :-)

toomasv

[12:56](#msg5a4f75f10505ad8b45b9dd38):)

9214

[13:00](#msg5a4f76ec03838b2f2a73c1d0)sometimes I hack into @rebolek's keyboard, and sometimes @toomasv hacks into my Trello list of ideas and implements everything I came up with :smile: :+1:

greggirwin

[13:00](#msg5a4f7704b48e8c3566a2eeb6)Fantastic @toomasv. I have a slow video card, so I can generate some lag when dragging quickly, but that's the only thing I noticed so far. When I first saw this, I thought of a couple things people have done to limit dragging horz/vert, and that this could be used for drag nubs on faces in a GUI layout tool.

rebolek

[13:01](#msg5a4f771d0163b02810b62ec6)@toomasv cool

toomasv

[13:04](#msg5a4f77d8ce68c3bc7480635b)Thanks everybody! Especially @greggirwin , for helping me out with `react`!

BeardPower

[13:51](#msg5a4f82e40163b02810b66ce0)@toomasv Totally awesome! :+1:

Phryxe

[14:04](#msg5a4f85e25355812e5755fc81)@toomasv Impressive! :+1:

nedzadarek

[14:18](#msg5a4f893629ec6ac311c0d95a)&gt; :point\_up: \[January 1, 2018 7:07 PM](https://gitter.im/red/red/gui-branch?at=5a4acd45ba39a53f1ac5ded1) Hi @nedzadarek, perhaps this can be used without reinventing anything...

@rjriv  
what do you mean?

toomasv

[14:28](#msg5a4f8b705355812e57561c28)@BeardPower , @Phryxe Thanks! :)

qtxie

[23:15](#msg5a500728ce68c3bc74836bb0)@toomasv Awesome! :+1:

## Saturday 6th January, 2018

toomasv

[04:03](#msg5a504a9c232e79134dd0806e)@qtxie Thanks, highly appreciated! BTW, is there an easy way to get arrowheads or I just have to take my math-course finally? :)

qtxie

[04:05](#msg5a504afb232e79134dd0815e)We'll implement the `arrow` draw command as in Rebol.

toomasv

[04:10](#msg5a504c2b6117191e612fe052)OK, thanks!

greggirwin

[05:26](#msg5a505e14b48e8c3566a7708c)@rgchris, should we dust off the old `arrow` style?

planetsizecpu

[10:45](#msg5a50a8c40505ad8b45bf6050)@toomasv well done!

toomasv

[14:00](#msg5a50d68e232e79134dd28a15)@planetsizecpu Thanks!

rgchris

[16:28](#msg5a50f92c03838b2f2a7aa9ce)@greggirwin Should do, think it's all still applicable.

greggirwin

[16:38](#msg5a50fb82ba39a53f1ae31b7c)I found it and pulled it out.

[16:43](#msg5a50fc96ce68c3bc748710c0)We don't have the ability to add custom words for styles yet, so that will have to be done differently.

rgchris

[18:20](#msg5a51136403838b2f2a7b2b77)@greggirwin Old work notes: \[Field Guide](http://reb4.me/r/field-guide.html), \[Area Guide](http://reb4.me/r/area-guide.html) : ) (I do like that pixel font at the bottom-left of the Field Guide)

greggirwin

[18:25](#msg5a51147eba39a53f1ae39271)Beautiful work, as always, Chris.

rgchris

[18:27](#msg5a5114fbba39a53f1ae393ce)\*(as a historical note, there was a brief to produce a look that resembled XP but allowed for easy colour variations—the resultant graphic files barely measured in KB and were quite versatile)*

greggirwin

[18:27](#msg5a51151d29ec6ac311c7f66d)Those are the base-64 encoded images in the styles folder, yes?

[18:29](#msg5a51157c6117191e6133063c)We should be able to use the same approach, once Red supports the effect pipeline, with `extend` and such.

rgchris

[18:30](#msg5a5115c3b48e8c3566aa5e69)Should be possible to recreate with Draw dialect now. Was fairly elementary shapes.

[18:30](#msg5a5115cbb48e8c3566aa5e92)!\[Area Look](http://reb4.me/r/ui-area.jpg)

greggirwin

[18:32](#msg5a511644ba39a53f1ae3999d)Cool. I think it will be helpful to show to skin and theme things with images, too, though. Some people find that much easier.

rgchris

[18:32](#msg5a51164e6117191e61330b54)Fair point.

greggirwin

[18:33](#msg5a51168403838b2f2a7b37a9)Just don't want to get to the point where we have 100M of images for a 1K app.

rgchris

[18:34](#msg5a51169e232e79134dd3ad01)This was the last concept I produced along those lines—was sort of an OS X/XP hybrid:  
!\[Blue](http://reb4.me/r/ui-blue.png)  
!\[Luna](http://reb4.me/r/ui-luna.png)

greggirwin

[18:34](#msg5a51169f232e79134dd3ad06)You always amazed me with your image optimizations, so that won't be an issue. :^)

rgchris

[18:34](#msg5a5116ce6117191e61330e6d)Was painstaking pixel-level work : )

greggirwin

[18:34](#msg5a5116d3ba39a53f1ae39cab)Those are fantastic Chris.

[18:35](#msg5a5116e4290a1f4561585946)You are a true artist and craftsman.

rgchris

[18:36](#msg5a5117426117191e613310cc)Not sure if I still have the patience for that type of work again! Or indeed the patience to set up Personal Paint again (if anyone recalls that particular piece of software).

greggirwin

[18:37](#msg5a5117736117191e6133118e)I don't remember that particular app, but I'm not a designer.

rgchris

[18:38](#msg5a51179d232e79134dd3b29f)Was a competitor to Deluxe Paint on Amiga. Had some handy palette mapping features.

[18:39](#msg5a5117d8ce68c3bc748788f7)Still would like to set up some PNG tools for manipulating palettes/pixels at that level.

rebolek

[18:51](#msg5a511aaa03838b2f2a7b4cf7)Oh, Personal Paint. I still have original disk(s?) of v6.4 I got with A1200.

rgchris

[18:53](#msg5a511b3db48e8c3566aa7733)I think you get it bundled with Amiga Forever these days.

toomasv

[18:54](#msg5a511b53232e79134dd3c51d)@rgchris Very beautiful!

rebolek

[18:55](#msg5a511bb35355812e575d3297)@rgchris that’s possible, I got mine with A1200 when Escom bought Amiga, together with Final Writer and some other apps I don’t remember, but I can look at the disks.

9214

[18:56](#msg5a511bc0ce68c3bc74879b4b)for some reason, looking at @rgchris' work, I'm missing good ol' Rebol days, even though I'm fresh blood and never got a chance to participate in that community :^(

rebolek

[18:57](#msg5a511c0329ec6ac311c81660)@rgchris Photogenics, TurboCalc, Organizer and DataStore.

[18:58](#msg5a511c5fb48e8c3566aa7bbf)@9214 you were saved from lot of pain and broken promises

rgchris

[18:59](#msg5a511c74290a1f4561587206)@rebolek All are familiar! Escom was strange—as I recall they bought everything for the Commodore branding, the Amiga was a bonus.

[18:59](#msg5a511c9829ec6ac311c81859)&gt; you were saved from lot of pain and broken promises

See also: Amiga.

rebolek

[19:00](#msg5a511ce1ba39a53f1ae3ba4a)@rgchris they were strange indeed, they went bankrupt very soon after buying Commodore. And they were huge in Germany and CZ.

rgchris

[19:01](#msg5a511cec290a1f456158742d)@9214 Some ideas way ahead of their time (even still!), just couldn't quite bring it all together.

greggirwin

[19:01](#msg5a511d0d03838b2f2a7b586c)@9214, you're an old Rebol soul.

rgchris

[19:01](#msg5a511d1d03838b2f2a7b58a9)Still cite the \[Desktop](http://desktop.rebol.info) as an idea that would've revolutionized mobile development.

9214

[19:02](#msg5a511d40b48e8c3566aa7ea5)with all the brainpower and young uneployees here, we can regain the lost paradise :sparkles:

[19:02](#msg5a511d56ce68c3bc7487a2f4)I wonder how first version of Rebol looked like

greggirwin

[19:03](#msg5a511d78290a1f4561587654)It was written in Scheme, by Joe Marshall. I might still have a copy, or notes somewhere.

9214

[19:04](#msg5a511dd26117191e61332e9b)@greggirwin that would be great to dig up, at least for historical reasons

rgchris

[19:06](#msg5a511e43290a1f4561587c27)I was a 2.0 noob. Intro courtesy of \[Amiga Format](http://amr.abime.net/issue\_274) (see cover pic).

9214

[19:07](#msg5a511e825355812e575d3f09)"Red alert" webzine would be great :)

rgchris

[19:24](#msg5a5122515355812e575d501d)Ah, there's the one last item:  
!\[Chevron Glyph](http://reb4.me/r/glyph.gif)  
A guide to the coordinates for the chevron shape.

greggirwin

[19:33](#msg5a5124a4ba39a53f1ae3e823)Niiiice!

toomasv

[20:37](#msg5a51337329ec6ac311c88c68)Great!

## Sunday 7th January, 2018

luce80

[13:46](#msg5a52249d5a9ebe4f7558918b)Is it by design that in VID `with` is behaving as a kind of synonym of `do` ?

9214

[13:48](#msg5a522516290a1f45615c5374)@luce80 can you show an example?

[14:08](#msg5a5229df5a9ebe4f7558a6bc)they are similar in a sense that both `do` and `with` evaluate their block argument, but `with` also binds block to the current face

luce80

[14:38](#msg5a5230e7ba39a53f1ae7dac9)@9214 I simply hoped `with`was used to "extend" a face in a way similar to R2 VID.

9214

[14:39](#msg5a52310a5a9ebe4f7558cbd9)@luce80 you mean extend with new facets?

luce80

[14:40](#msg5a52314f03838b2f2a7f72ba)@9214 Yes, own custom new facets.

9214

[14:44](#msg5a523250ba39a53f1ae7e2d9)I think that's what `extend` is for, though, it's not feature complete and doesn't accept `object!`s yet

BeardPower

[15:25](#msg5a523bd95a9ebe4f7558fa66)The trello card for Android GUI support states the following: Provide a structured way for custom widgets creation.  
Is this also a general GUI idea? I want to make some pie/donut chart widgets. Will this structured way be different to creating widgets based on the basic face?

toomasv

[15:40](#msg5a523f645a9ebe4f75590a0c)@luce80 @9214 While `with` binds block to the current face, `do` binds it to the current panel, e.g.:

```
>> view [box with [probe type] do [probe type]]
base
window
```

But:

```
>> view [panel with [probe type] [do [probe type]]]
panel
panel
```

See in \[VID.red](https://github.com/red/red/blob/master/modules/view/VID.red#L594) line 594:

```
do [do-safe bind fetch-argument block! spec panel]
```

9214

[15:49](#msg5a524177b48e8c3566aee20c)@toomasv yes, it's actually \[in the docs](https://doc.red-lang.org/en/vid.html#\_do)

toomasv

[15:52](#msg5a52422dce68c3bc748c01f1)Oh, how did I miss that :question:

9214

[15:52](#msg5a524238ba39a53f1ae82c9a)@toomasv so am I :exclamation:

rebolek

[15:56](#msg5a52434603838b2f2a7fc3de)@BeardPower I don't think it will be different, it will just make things easier IMO.

nedzadarek

[16:24](#msg5a5249ab5355812e5761bc6c)

```
i: 0
view [
    im: image 800x800 rate 600 draw[
      box 350x350 450x450 0
    ] on-time [
      i: i + 1
      if (i > 500) [i: 0]
      ind: length? im/draw
      im/draw/:ind: i ; changing corner attribute of the box command
    ]

]
```

Is this a correct behaviour of the `box`'s `corner` attribute? Are you going to change it? It looks nice so you don't have to "fix" it.

BeardPower

[16:26](#msg5a524a36290a1f45615cf162)@rebolek What exactly will be easier? Will there be some template provided or similar?

rebolek

[16:38](#msg5a524ce8b48e8c3566af165d)@BeardPower I can'ŧ talk for Red team, but I guess you're right.

BeardPower

[16:44](#msg5a524e6a232e79134dd87b48)@rebolek Thanks! So I will start with a tweening code/port for fancy animations and some basic widgets to test :)

toomasv

[16:45](#msg5a524eb2ce68c3bc748c366b)Proto-arrows:

```
Red []
angle: func [start end /local dims ang][
	dims: end - start 
	ang: arcsine 1.0 * dims/y / (sqrt (power dims/y 2) + (power dims/x 2))
	either 0 <= dims/x [ang][180 - ang]
]
inner: function [face ang dir][
	cent: face/size / 2
	switch face/extra [
		box [
			cent-ang: angle 0x0 cent
			case [
				((ang <= cent-ang) and (ang >= negate cent-ang)) or
				((ang >= (180 - cent-ang)) and (ang <= (180 + cent-ang))) [
					x: cent/x
					y: x * any [attempt [tangent ang] 10000]
				]
				'else [
					y: cent/y
					x: y / any [attempt [tangent ang] 10000]
				]
			]
			sqrt (x ** 2) + (y ** 2)
		]
		circle [cent/x]
	]
]
arrow: func [start end face /local ang][
	s: start/offset + (start/size / 2) - face/offset
	e: end/offset + (end/size / 2) - face/offset
	ang: angle s e
	dims: e - s
	in-s: round/to inner start ang 'out 1
	in-e: round/to inner end ang 'in 1
	len: (sqrt (power dims/x 2) + (power dims/y 2)) - in-s - in-e
	len: as-pair len 0
	compose/deep [
		translate (s) 
		rotate (ang) 
		translate (as-pair in-s 0)
		line 0x0 (len) 
		shape [move 0x0 'line 10x-5 'move 0x10 'line -10x-5]
		shape [move (len) 'line -10x-5 'move 0x10 'line 10x-5]
	]
]
lay: layout compose/only [
	size 300x200
	at 125x80 b: box 70x40 loose draw [fill-pen brick box 0x0 69x39] with [extra: 'box] 
	at 10x10 c: box 40x40 loose draw [fill-pen mint ellipse 0x0 39x39] with [extra: 'circle]
]
clear-reactions
insert lay/pane layout/only [
	at 0x0 box react [
		face/offset: as-pair 
			min b/offset/x c/offset/x  
			min b/offset/y c/offset/y
		face/size: subtract as-pair 
			max b/offset/x + b/size/x c/offset/x + c/size/x
			max b/offset/y + b/size/y c/offset/y + c/size/y
			face/offset
		face/draw: arrow c b face
	]
]
view/tight lay
```

BeardPower

[16:46](#msg5a524ef90505ad8b45c600ab)@toomasv nice one, as always :+1:

toomasv

[16:50](#msg5a524fe2ba39a53f1ae86964):)

rebolek

[16:51](#msg5a5250245a9ebe4f75595900)@BeardPower cool, I am interested!

BeardPower

[16:55](#msg5a52510e5355812e5761e13a)@rebolek Cool. As I'm using this Haxe library \[TweenX](http://tweenx.spheresofa.net/core/en.html), my idea was to port it to Red. It's under the MIT license, so no licensing issues here.

toomasv

[16:57](#msg5a52518403838b2f2a800135)The arrow pointing to the box flickers sometimes, drawing an extra line. Can someone tell, why? What's wrong with arrow `shape`?

rebolek

[17:03](#msg5a5252e6ba39a53f1ae87704)@BeardPower interesting!

gltewalt

[17:31](#msg5a52596c03838b2f2a802604)Could we do a `Processing` dialect with current vid and draw?

https://processing.org/books/

[17:32](#msg5a5259a003838b2f2a8026b8)JS has a library https://p5js.org/

9214

[17:33](#msg5a5259da232e79134dd8b160)@gltewalt you mean to interface with p5?

gltewalt

[17:34](#msg5a525a0f5a9ebe4f755982c8)To duplicate (more or less) Processing

9214

[17:34](#msg5a525a26ba39a53f1ae894af)@gltewalt isn't that what Draw and View do already?

[17:34](#msg5a525a37232e79134dd8b339)aside from audio stuff

gltewalt

[17:35](#msg5a525a4c6117191e6137f49c)I think, but I don’t know enough yet. Are capabilities equal?

9214

[17:35](#msg5a525a6c6117191e6137f540)I don't know much about it either, though @honix might tell something if he'll come back someday

greggirwin

[19:43](#msg5a527874ba39a53f1ae92546)@nedzadarek, pretty indeed. Should at least note it in a ticket.

[19:44](#msg5a52789b03838b2f2a80bc3f)Nice @toomasv! Can't say at a glance what the issue might be.

nedzadarek

[23:24](#msg5a52ac345a9ebe4f755b00b5)Shouldn't `drop-list` and `drop-down` put scrollbar automatically? Only `text-list` does this.

```
arr: copy [] repeat w 122 [append arr to-string w]
view [d: drop-list do [d/data: arr]]
view [d: drop-down do [d/data: arr]]
view [d: text-list do [d/data: arr]]
```

@9214 I am not sure about The Processing but with the p5.js you can:  
1\) capture sound/screen using camera/microphone  
2\) manipulate/create dom elements dynamically  
Here is libraries: https://p5js.org/libraries/ and examples: https://p5js.org/examples/  
Here is the slider dance (A) https://youtu.be/CMsD3IigG7g?list=PLRqwX-V7Uu6bI1SlcCRfLH79HZrFAtBvX at 9:11.  
Clappy bird (B): https://www.youtube.com/watch?v=aKiyCeIuwn4 at 17:00  
Everything is done in js/p5.js.

## Monday 8th January, 2018

greggirwin

[00:50](#msg5a52c04d83152df26d4273bb)@nedzadarek, that's up to the native widget.

[02:00](#msg5a52d0a2290a1f45615f4046)@BeardPower, I just saw https://popmotion.io/, and TweenX looks interesting. These will be valuable in the future. Glad to see someone knows what they're doing there.

BeardPower

[10:58](#msg5a534ebd5a9ebe4f755dcc8e)@greggirwin TweenXCore is more flexible, as it's only working on values between 0 and 1. How you apply these values to some properties is totally up to you. popmotion is different in this regard, as it's offering a different toolset like moving from A to B, scaling from X to Z. The latter approach limits your possibilities or makes it harder for you to stop animations, fade, intertwine, combine them etc.

Games need fancy stuff and I hope even AAA games will be made with Red in the future ;-)

greggirwin

[17:12](#msg5a53a689290a1f4561639650)Great info @BeardPower, thanks!

luce80

[19:52](#msg5a53cc0c290a1f45616482a1)This used to work:

```
system/view/VID/styles/newstyle: [
	template: [
		type: 'base size: 100x100
		abc: 1
	]
]
view [button "hi" newstyle "ho"]

*** Script Error: old has no value
*** Where: series?
*** Stack: dc view layout series?  

>> about
Red for Windows version 0.6.3 built 27-Nov-2017/19:24:27+01:00
```

without `abc: 1` it works but it worked in 0.6.2, is it OK?

greggirwin

[20:47](#msg5a53d8deb48e8c3566b6f1a6)Likely a temporary regression in the build you're using. It works here.

## Tuesday 9th January, 2018

toomasv

[17:31](#msg5a54fc57290a1f45616ad851)Would it be possible to make recursive references contractable(by default)/expandable while `probe`-ing VID blocks? Otherwise finding problematic pieces by endless scrolling is near to impossible. :cry:

greggirwin

[17:37](#msg5a54fdc6290a1f45616ae295)Would `dump-face` work for you? Or a custom prober that lets you spec what words to emit maybe.

toomasv

[18:02](#msg5a5503cfb48e8c3566bd2de0)@greggirwin Thanks! I have to experiment with that.

gltewalt

[18:09](#msg5a550573d0514c785b0d7df6)`??` has been more useful for me than dump-face

[18:11](#msg5a5505d2ce68c3bc749a0a83)You can constrict it to dumping the face you care about or dump out the whole hierarchy

toomasv

[18:16](#msg5a550703ce68c3bc749a13fb)Tried both ways. Same result. :sweat: Probably I have to reform my code. Too early evaluation.

[18:26](#msg5a550957b48e8c3566bd520a)One of main culprits is `font`, proudly showing its `parent`.. in endless recursion, again and again and..

gltewalt

[18:27](#msg5a5509aeba39a53f1af65d65)Even if you name the face? Like ?? b/face

toomasv

[18:28](#msg5a5509ce83152df26d4eb198)Yes

gltewalt

[18:28](#msg5a5509d85a9ebe4f7567b8bb)I can’t experiment right now - not at home

toomasv

[18:33](#msg5a550b115a9ebe4f7567c112)OK, I'll trod the thorny path!

rebolek

[18:43](#msg5a550d55ce68c3bc749a3b64)@toomasv maybe you will find some ubercool `vid-probe` on the road and will share it with us ;)

9214

[18:44](#msg5a550d78b48e8c3566bd695a)@9214 another hacking session on my Trello board! :smile:

toomasv

[18:45](#msg5a550daf290a1f45616b475a)@9214 If you haven't upgraded your security, you are doomed

9214

[18:45](#msg5a550dd5ce68c3bc749a3f26)I sprinkle holy water on my PC once in a while

toomasv

[18:47](#msg5a550e2cd0514c785b0db590)I keep it in my pocket!

## Wednesday 10th January, 2018

gltewalt

[05:42](#msg5a55a7b5ce68c3bc749d16c9)@toomasv Where is this code that is giving you problems? Or is it in secret for now?

toomasv

[06:00](#msg5a55ac1bba39a53f1af96c57)Thanks @gltewalt , solved it already

gltewalt

[06:01](#msg5a55ac3aae53c15903cc921e)What was the solution?

toomasv

[07:04](#msg5a55baec5a9ebe4f756b2fd0)Good Ol' TAF

Oldes

[11:30](#msg5a55f954ba39a53f1afaf9a4)Should not be this code working? (printing dot when I write into the field?)

```
view [f: field 400 react [prin "."]]
```

9214

[11:31](#msg5a55f99aae53c15903ce361a)@Oldes

```
view [f: field 400 on-key [prin "."]]
```

Oldes

[11:33](#msg5a55fa15b48e8c3566c21c57)hm... but with `on-key` I get the `f/text` before modification

[11:34](#msg5a55fa3ab48e8c3566c21eb0)`on-key-up` maybe?

9214

[11:34](#msg5a55fa46ae53c15903ce3b48)@Oldes yes, that's my guess also

Oldes

[11:34](#msg5a55fa56232e79134deba419)yes.. it works. thanks

9214

[11:34](#msg5a55fa61b48e8c3566c21f7e)@Oldes you're welcome!

Oldes

[13:56](#msg5a561b92ae53c15903ceff67)another thing... lets say, that I want to do some action using `call` on each file in a directory and want to update the gui with result of the processing... as we don't have threads yet, how to get the gui updated after each call? Because now it is updated only when all files are processed.

pekr

[13:58](#msg5a561c0e290a1f456170922f)and if you do call on the per-file basis? Not sure how big the overhead would be.

Oldes

[14:00](#msg5a561c6eb48e8c3566c2ec60)I do it per-file, but in `foreach file` loop

[14:02](#msg5a561d10ce68c3bc749f71d1)I wanted to make a first funky gui application instead of console one (for not technical client, who hardly know what `terminal` is), but I'm not sure if it is possible in current state:/

[14:05](#msg5a561d935a9ebe4f756d5bed)@dockimbel any way how to force the gui to update itself from running loop started in the button action? I tried `do-events/no-wait`, but it still does not respond until the loop is ended.

rebolek

[14:05](#msg5a561dc5290a1f4561709d9d)@Oldes what about starting animation and checking for call result periodically?

pekr

[14:06](#msg5a561de2232e79134dec7795)Oldes - you might want to refer to @qtxie , he's here right now ....

rebolek

[14:06](#msg5a561df5ba39a53f1afbc3ac)So you won't start event loop from button, but it will be running already

qtxie

[14:09](#msg5a561ea8ae53c15903cf1104)@Oldes Try `loop 10 [do-events/no-wait]` ?

Oldes

[14:11](#msg5a561f026117191e614bbf08)Thanks... it is working:)

[14:11](#msg5a561f1d83152df26d546045)How to get the output area to scroll on bottom?

[14:13](#msg5a561f81ce68c3bc749f7d3f)here is over-simplified script to show what I do:

```
view [
	source: field
	button [
		foreach file read to-file source/text [
			append output/text file
			call/wait rejoin ["some action with " to-local-file file]
			loop 10 [do-events/no-wait]
		]
	]
	return
	output: area
]
```

qtxie

[14:13](#msg5a561f9c290a1f456170a670)Seems cannot for now...

Oldes

[14:14](#msg5a561fbfb48e8c3566c2ff2d):/

qtxie

[14:20](#msg5a562144ce68c3bc749f8809)I'll create a wish on github.

Oldes

[17:12](#msg5a564981d0514c785b140c61)@qtxie is it known issue, that gui-console.red from the Red master branch is not possible to compile on macOS?

[17:13](#msg5a5649c7d0514c785b140e22)

```
Compiling /Users/oldes/GIT/red/environment/console/gui-console.red ...
...compilation time : 1927 ms

Target: macOS 

Compiling to native code...
*** Compilation Error: undefined symbol: string-lines? 
*** in file: %/Users/oldes/GIT/red/environment/console/terminal.reds 
*** in function: exec/terminal/reposition
*** at line: 241 
*** near: [string-lines? data node/offset node/length 
    y >= vt/rows
]
```

[17:15](#msg5a564a3283152df26d556ed3)Also I noticed, that the build now produces app bundle, so its not so easy to run the console version... one must use:

```
console.app/Contents/MacOS/console
```

to run it from terminal.

[17:18](#msg5a564af6ba39a53f1afcd7be)As I don't have gui console, I cannot work with interpreted code on macOS and unfortunately my gui compiled app crashes when I use the `on-key-up` event with `access violation`. It works fine on Windows but not on mac:/

## Thursday 11st January, 2018

PeterWAWood

[00:38](#msg5a56b1faba39a53f1aff1651)@Oldes If you add

```
needs: View
```

to console.red and compile it with the `-r` option, you can use View interactively on macOS.

qtxie

[01:40](#msg5a56c07a5a9ebe4f75710a33)@Oldes Yes. Only the new GUI console (red-console) which is in 0.6.4 branch can be compiled on macOS.

[01:41](#msg5a56c0e4ba39a53f1aff4f72)On macOS, you need to use `open APP_NAME` to launch a .app bundle.

toomasv

[14:20](#msg5a577291ce68c3bc74a63ac0)A tiny \[color-picker](https://gist.github.com/toomasv/19e45ce2cbd7dc213548400fcdec1f8b):  
!\[color-picker](http://vooglaid.ee/red/color-picker.png)

9214

[14:20](#msg5a5772c45a9ebe4f75747dfc)@toomasv why you're using separate block for colors?

[14:21](#msg5a5772cdae53c15903d61285)https://gist.github.com/9214/307b69bfdfb8f71c96d7ebf8daeee628

toomasv

[14:22](#msg5a57732eba39a53f1a02acca)@9214 May I borrow this?

9214

[14:22](#msg5a577334b48e8c3566c9f479)@toomasv sure thing

toomasv

[14:22](#msg5a57733b290a1f4561777c0f)Thanks!

[14:31](#msg5a577554b48e8c3566c9ff5c)New \[version](https://gist.github.com/toomasv/19e45ce2cbd7dc213548400fcdec1f8b).

djrondon

[17:13](#msg5a579b3a290a1f4561787663)Folks where can I download the GUI for Ubuntu/Linux?

9214

[17:14](#msg5a579b5cce68c3bc74a7383f)@djrondon offical GTK backend is a work in progress

[17:14](#msg5a579b6561a861c927ffb427)though, there's a community effort https://toltex.u-ga.fr/RedGtk

djrondon

[17:21](#msg5a579d355a9ebe4f757590d4)Cool!!!!

greggirwin

[17:58](#msg5a57a5e0ae53c15903d74bb2)@toomasv, nice. I was going to suggest using `form` in place of `to-string`, then thought I should profile it. :^) Then I had fun looking at your code (which is always nice), because I love dynamic layout generators. Here's a version that uses `extra` to move some handling to the style, so it's not generated for every face. This approach can be helpful as your GUIs get larger, because the faces carry around more info that can be used for debugging.

```
context [
	colors: exclude sort extract load help-string tuple! 2 [glass]
	lay: copy [
	    style color: base 70x70 font [size: 8] wrap top on-down [
			write-clipboard form face/extra
			tx/data: rejoin [
			    "Color '" face/extra "' (" get face/extra ") copied to clipboard!"
			]
		]
	]
	x: 0 
	foreach j colors [
		font-color: either 3 = length? get j [255.255.255 - (get j) / 2]['black]
		append lay compose/deep [
			color (j) (rejoin [form j #"^/" form get j])
			font [color: (font-color)] 
			extra (to lit-word! j)
		] 
		if (x: x + 1) % 10 = 0 [append lay 'return]
	] 
	view append lay [tx: text 310x70 white "color" font [size: 12] wrap center]
]
```

[18:00](#msg5a57a637ce68c3bc74a77b00)And the profile results:

```
>> profile/count/show [[form ""][to-string ""][to string! ""]] 1000000
Count: 1000000
Time         | Time (Per)   | Memory      | Code
0:00:00.263  | 0:00:00      | 46014464    | [form ""]
0:00:00.311  | 0:00:00      | 43913216    | [to string! ""]
0:00:00.347  | 0:00:00      | 43913216    | [to-string ""]
>> profile/count/show [[form ""][to-string ""][to string! ""]] 1000000
Count: 1000000
Time         | Time (Per)   | Memory      | Code
0:00:00.253  | 0:00:00      | 43913216    | [form ""]
0:00:00.321  | 0:00:00      | 43913216    | [to string! ""]
0:00:00.452  | 0:00:00      | 43913216    | [to-string ""]
```

toomasv

[18:10](#msg5a57a888ba39a53f1a040395)@greggirwin I see! Thanks for the pointers, sir! I'll upgrade my picker!

greggirwin

[18:12](#msg5a57a8f061a861c927000e39)Also, I know you're busy, but you have a \*lot* of tools that would be great to have on the new Tools wiki page. I'll try to curate some if you're overloaded.

9214

[18:12](#msg5a57a907ae53c15903d760b8)s/curate/tip/ :^)

[18:13](#msg5a57a953d0514c785b1b2cf7)`toomasv` stands for `too(l)ma(ker) s(ir), v(ery)`

toomasv

[18:15](#msg5a57a9a5ba39a53f1a040a03)@toomasv \[Upgraded](https://gist.github.com/toomasv/19e45ce2cbd7dc213548400fcdec1f8b) ! Thanks for your proposal! I would love to have feedback/enhancements on these!  
@9214 C'mon!

greggirwin

[18:15](#msg5a57a9db6117191e6154034c)You fixed your typo before I could enchant you!

toomasv

[18:16](#msg5a57a9f2ce68c3bc74a79036)Quick one!

greggirwin

[18:16](#msg5a57a9fbba39a53f1a040b96)Yeah, that's a stretch @9214. ;^) I just read it as "Too Massive".

[18:17](#msg5a57aa3983152df26d5c9d88)I'm sure the kids will all be using that phrase any day now, to say somebody's code is great or their output prolific. And I should get some RED every time they do.

toomasv

[18:19](#msg5a57aa9861a861c927001a32)I am relieved it was not "enchant-cements"

djrondon

[18:43](#msg5a57b04d5a9ebe4f75760c7f)I'm receiving this message Gtk-Message: Failed to load module "unity-gtk-module"

9214

[18:43](#msg5a57b06461a861c9270037f2)@rcqls :point\_up: any tips?

[18:45](#msg5a57b0b383152df26d5cc333)@djrondon meanwhile, you can consider to use Wine, View is mostly functional on it

djrondon

[18:45](#msg5a57b0d783152df26d5cc3e4)it's working but I'm receiving that error message.

rcqls

[20:16](#msg5a57c62d83152df26d5d3a4c)@djrondon @9214 Sorry, I have no accurate idea as a macOS user now. It seems related to the gtk3 install… In my VirtualBox 64bits (for testing), I have this message: « failed to load module "unity-gtk-module » too but IMHO it is a Gtk-Message (some kind of warning) not a an error…. I guess you need to google it to maybe fix this issue...

greggirwin

[20:45](#msg5a57ccdfae53c15903d82bd5)Moving from red/help. @qtxie, @toomasv and I are looking at his https://gist.github.com/toomasv/af7fb8c5f3534b7865a1c2708dab1721 table, which takes 3 clicks to close the window. Lots of faces in there, and some are removed each time you click X to close the window. (all testing on Windows platform here).

[20:46](#msg5a57cd11290a1f456179a6b2)Removing the `font` and `para` settings for the cells fixes that.

[20:47](#msg5a57cd47ce68c3bc74a850be)As we work down through free-faces, unlink-sub-obj, and free-font, there's clearly a lot being done during teardown, which is expected.

[20:49](#msg5a57cdd6290a1f456179aa7d)At a glance, and logically, each face gets its own font object when it is made, yes? I seem to recall that R2 shared fonts, and so changing one face font directly could produce unexpected results. Is it the case that a new OS font is created for each face in Red, if a font facet is spec'd? Can't tell at a glance, but can trace more if you're busy. Just thought you might know.

pekr

[20:52](#msg5a57ceaa83152df26d5d68a8)It was mostly a result of a default Rebol "subobject sharing", no, not a GUI related design decision?

greggirwin

[20:54](#msg5a57ceec6117191e6154d546)Yes, I think so. And if Red avoids that by making a new font for each face, it's a lot of OS fonts to make, and then destroy.

[20:55](#msg5a57cf57ae53c15903d83db5)

```
fnt: make font! [size: 8]

view [
	f-a: text "ABC" font fnt
	f-b: text "DEF" font fnt
	button [
		print [same? f-a/font f-b/font]
		f-a/font/size: 12 show f-b
	]
]
```

[20:59](#msg5a57d016ae53c15903d84107)It looks like the font object is not shared.

[20:59](#msg5a57d02161a861c92700ec3b)Compared to:

```
fnt: make font! [size: 8]
view [
	f-a: text "ABC"
	f-b: text "DEF"
	button [
		print [same? f-a/font f-b/font]
		f-a/font/size: 12
	]
	do [f-a/font: f-b/font: fnt]
]
```

[21:01](#msg5a57d0b6ce68c3bc74a863a3)Or using `with`:

```
fnt: make font! [size: 8]
view [
	f-a: text "ABC" with [font: fnt]
	f-b: text "DEF" with [font: fnt]
	button [
		print [same? f-a/font f-b/font]
		f-a/font/size: 12 show f-b
	]
]
```

[21:02](#msg5a57d0fb61a861c92700f0ee)So I think this comes down to whether the font should be shared if applied from a style, yes? Because it looks like a font defined for a style, in @toomasv's code, is not shared. And the same discussion for `para`.

[21:26](#msg5a57d685b48e8c3566cc4150)Can't trick it quickly and easily by using `repend lay ['cell 'with [para: par font: fnt]]` when adding cells. But there's definitely a breakpoint. Using types up to `float 1.0` is fine, add `get-path` and it doesn't clear everything. All cells, yes, but not your highlighters.

qtxie

[23:26](#msg5a57f2c383152df26d5e1eba)@greggirwin Yes. When use styles, each face gets its own font object. \[here](https://github.com/red/red/blob/master/modules/view/VID.red#L392) is the code. I think if we make it unshared by default, we should provide an easy way to change it to shared when we need.

## Friday 12nd January, 2018

greggirwin

[00:42](#msg5a580491ba39a53f1a05e4ae)`[tip @qtxie ₡0.1RED #thanks!]` I was close to finding the answer, just gave up a little too soon.

gltewalt

[00:47](#msg5a5805a6ba39a53f1a05e8e8)What happens if you remove `copy`?  
Chaos?

[00:50](#msg5a580668ae53c15903d93f97)Delete `face-font: copy face-font`

greggirwin

[00:51](#msg5a580679d0514c785b1d10f2)Not likely chaos. See above examples with just two faces. Need to think about how it could be made clear, to copy/make a font if you provide a spec, but share if a font object is used directly. The catch, there, is then the default would change to sharing, which then leads to "is it shared per style, or globally?"

gltewalt

[00:56](#msg5a5807b7ae53c15903d94401)

```
font: opts/font
		if any [face-font: face/font font][
			either face-font [
				if font [
					set/some face-font font				;-- overwrite face/font with opts/font
					opts/font: face-font
				]
			][
				face-font: default-font
			]
			foreach [field value] face-font [
				if none? face-font/:field [face-font/:field: get value]
			]
		]
```

[00:56](#msg5a5807c76117191e6155e7f7)Kaboom probably

[00:57](#msg5a5807fcb48e8c3566cd2b36)Optionally sharing per style would be a good option

[01:04](#msg5a5809a961a861c92701ff76)^ That snippet is just a guess

toomasv

[04:56](#msg5a583fe8b48e8c3566cdfc35)I don't quite get this code (may be too sleepy still): Why is there `either face-font [..` after `if any [face-font: face/font font]`?

gltewalt

[05:05](#msg5a584214ae53c15903da1aee)I thought it meant “if face/font is there, bind it to the word face-font. If it is font, binding doesn’t happen, so either gives the false block”

[05:06](#msg5a58424f61a861c92702ddaf)I still get confused with `all` and `any` though for... some reason

toomasv

[05:26](#msg5a5846f083152df26d5f6d6b)I understand that in `if any..` conditional `face-font` is bound to either `opts/font` or `face/font` if any of these is not `none`. And if both are `none`it would not go into the block. But `either` IN the block is again checking it.

gltewalt

[05:28](#msg5a584796ce68c3bc74aa4711)I thought it only binds to face/font

[05:29](#msg5a5847abb48e8c3566ce1a47)I’ll wait until someone who knows better shows up

[05:29](#msg5a5847c65a9ebe4f7578d29b)Better than me (which is most)

toomasv

[07:01](#msg5a585d50d0514c785b1e64f1)@gltewalt @gltewalt You are right, I was still :sleeping:

[09:06](#msg5a587a94ae53c15903db209e)One more \[tool](https://gist.github.com/toomasv/63a0ee4b5e5c5df2d2d83d76eb884989):  
!\[Conversion-lab](http://vooglaid.ee/red/con-lab.png)(Bigger \[picture](http://vooglaid.ee/red/con-lab.png))

rebolek

[09:07](#msg5a587acd5a9ebe4f7579c5a6)@toomasv nice

toomasv

[09:10](#msg5a587b92ce68c3bc74ab3659):)

rebolek

[09:20](#msg5a587de81dcb91f1773faeee)@toomasv have you tried `text-table` for the conversion matrix?

toomasv

[09:53](#msg5a588590ba39a53f1a080939)@rebolek Not yet, but I will try.

rebolek

[09:55](#msg5a58861fb48e8c3566cf3ad3)@toomasv if you'll have some troubles using it, let me know. There are some open issues (not bugs, requests for improvements) that I'd like to close soon when I've got some time.

toomasv

[09:56](#msg5a58864283152df26d6097e6)OK, thanks.

planetsizecpu

[11:50](#msg5a58a116ba39a53f1a089dae)@toomasv cool push hard. These days I'm too busy to take care of my scripts, may be next week, I missed red so much :worried:

greggirwin

[19:01](#msg5a59060983152df26d637c7c)Go Toomas, Go!

luce80

[19:10](#msg5a59082f83152df26d6386f3)@toomasv Could you please add some info in the script header such as purpose of the script but also author, licence, release date? (for posterity and acknowledgements...)

greggirwin

[19:41](#msg5a590f87ae53c15903de6c7b)@luce, I'm guilty of that more than most. I treat gists as snippets, not repos, so they get little attention or extra time. Some of mine don't even have `Red []` in them, as they just meant to paste into a console to run. :^\\

toomasv

[19:56](#msg5a5912eaba39a53f1a0b1d75)@luce80 Sorry for being sloppy! I'll try to be more accurate in future!  
@greggirwin It appears too much imprinting is not good! :hatched\_chick: :chicken:

greggirwin

[19:59](#msg5a59138ace68c3bc74ae8668)I'm a bad influence and a cautionary tale.

[19:59](#msg5a5913a66117191e615b14f2)I won't promise to do better, I know myself too well. :^)

toomasv

[20:12](#msg5a5916c1ce68c3bc74ae9656)@luce80 Annotated some of my more recent gists.

## Saturday 13th January, 2018

toomasv

[09:48](#msg5a59d5f91dcb91f17745ff03)Got \[conversion-lab](https://gist.github.com/toomasv/63a0ee4b5e5c5df2d2d83d76eb884989) reactive finally.

greggirwin

[11:20](#msg5a59eb69ae53c15903e1c75b)@toomasv, nice! Now that we have a few `*-lab` examples, maybe we need to step up a level and create `lab-lab` for building more. ;^)

9214

[11:21](#msg5a59eba0ba39a53f1a0e63f6)Toomas Voog`lab` :wink:

greggirwin

[11:24](#msg5a59ec5ace68c3bc74b1c2f5)@9214, Niiiiice.

pekr

[12:47](#msg5a59ffd85a9ebe4f7580c39d)Red FB group - 199 members. One more plese, let's go! :-)

toomasv

[13:12](#msg5a5a05a4290a1f456183b68c) :panda\_face:

luce80

[18:10](#msg5a5a4ba86117191e615ff40c)Can someone, please, help me improve this gist makeing it more "general" ? I have tried variuos things but without success. https://gist.github.com/luce80/fc8825613a4e8aeedcf700ec47aae518

9214

[18:17](#msg5a5a4d2f1dcb91f17747e316)@luce80 what's the general idea, to make a list of clickable faces?

greggirwin

[18:25](#msg5a5a4f0296885c834c351a57)@9214, yes. R2 had a `list` style which was based on this model. And you could use a spec for an entire panel as the item.

luce80

[18:25](#msg5a5a4f2cce68c3bc74b351f3)@9214 The general idea is not that they are clickable but that they are iterated. There is ONLY ONE text face that is iterated to make a list (or whatever you want). Could also be useful in @toomasv recent "labs". Could be the base of many complex faces.

9214

[18:33](#msg5a5a5108ce68c3bc74b358b7)http://www.rebol.com/docs/view-face-other.html#section-1 ?

greggirwin

[18:35](#msg5a5a5189290a1f456184f2a8)Yes. One of the drawbacks, IIRC, was that you couldn't easily dynamically work with iterated faces. e.g. having a field that you could enter data into that was bound to a backed data structure.

luce80

[18:49](#msg5a5a549d290a1f456184fe9f)Making iterated fields is possibly problematic but any other type of content, static or dinamically generated (as the one in the gist) shouldn't be a problem.

greggirwin

[18:52](#msg5a5a555b290a1f4561850238)We should be able to do it. You really just need a backing store. There was an old custom control for VB, called TrueGrid, that gave you options, one of which was the ability to use a callback (basically) when it needed a piece of data, or when a piece of data needed to be stored. e.g. because it was going to scroll off the page (long ago, memory may be bad on details). In any case, you managed the data however you wanted, and it would just ask for data when re-rendering a cell.

## Sunday 14th January, 2018

greggirwin

[03:22](#msg5a5acce6290a1f456186b235)@luce80, it will require a bit of thought, about how best to approach iterated faces. Red is based on native controls, until we write a pure Red GUI system. VB eventually added what were called "graphical controls", which weren't real OS widgets at all, had no window handle, couldn't get focus, etc., that were much lighter on resources.

We can get creative, with a circular "pool" of sub-layouts or faces, that can be cycled through in a visible window area, or use `draw` commands as you have. I imagine there is a lot of prior art in this area.

[03:23](#msg5a5acd2e290a1f456186b34e)@henrikmk has done a lot of GUI work in Rebol, and should be full of ideas, suggestions, and known problems we need to deal with.

luce80

[09:25](#msg5a5b2216517037a212a42b20)@greggirwin Or you can always cheat. Still not perfect or even finished but \[here it is](https://gist.github.com/luce80/fc8825613a4e8aeedcf700ec47aae518#file-iterated-fields-red) . Just set fields text based on a block of strings and we should be done.

henrikmk

[12:11](#msg5a5b49015ade18be39741d25)however you do it, iterated faces shouldn't be the only way to make table views, unless you've figured out how to solve the redraw issues that R2 has, because the entire table view is always forcibly redrawn.

[12:12](#msg5a5b4931290a1f4561884c63)AFAIR, iterated faces were implemented as a measure against memory constraints that don't really exist today.

[12:16](#msg5a5b4a19517037a212a4cf11)the redraw issues are especially a problem, if you need to draw constantly displayed tool-tips over the grid. it's very dificult to make it fast.

[12:19](#msg5a5b4aed1dcb91f1774b6ebc)furthermore, I think also, if you want to implement a table widget for speed, you need to pay attention to the weaknesses of the underlying graphics engine and just write one table widget per engine. split it in a core renderer and accessor functions, so that it can be used as close to identically as possible between different graphics engines.

pekr

[12:22](#msg5a5b4b6c290a1f4561885812)It also depends, how do you aproach a design of the grid. Some might generate wide and long plate with elements. The one I used almost 20 years sgo was fast, was able to scroll endless amounts of rows, was able to didplay various controls as cells.

henrikmk

[12:22](#msg5a5b4b836117191e61638566)my newest table widget for RebGUI doesn't use iterated faces at all and instead is designed to display the fewest amount of faces possible and then using visual tricks to display the grid. it's quite fast by R2 standards and supports thousands of columns along with millions of rows with no discernible slowdown.

rebolek

[12:24](#msg5a5b4c005a9ebe4f7585a7f2)`text-table` also displays only visible rows, it doesn't make sense to render everything.

pekr

[12:24](#msg5a5b4c0f517037a212a4db2a)The trick was to always draw only what is visible. That means calculating the width of columns, rows and draw accordingly. Then implement data caching for the scroller or keypress movements, recalculate the position, draw again. It wa fast on Windows 95. It is hilarious, that with recent power of Hw, accelerations, we are still having such issues ...

rebolek

[12:26](#msg5a5b4c77ae53c15903e6f7b3)Shaders won't help you with displaying 2D grid very much ;)

pekr

[12:29](#msg5a5b4d1b5a9ebe4f7585abaf)What about Direct2D? As I said, it was done on Win 3.1/95 PC with much less RAM you have available today ...

henrikmk

[12:35](#msg5a5b4e96ce68c3bc74b6cfc1)You might run into other bottlenecks, before dealing with HW acceleration, at least if it's not a full screen table on a 4k screen. Typically, if the content is advanced enough, your bottleneck will be obtaining and forming data for each cell.

It's probably the fastest to draw the table view in one DRAW area in R3 or Red, then overlay that with click regions (faces?) for cells or rows.

A test you could do here is to check how quickly they can draw up entire screens of text.

rebolek

[12:40](#msg5a5b4fa2290a1f45618866e6)I agree with DRAW for the table view, click regions can be done in `on-over` actor, it's fast enough.

henrikmk

[12:42](#msg5a5b5029ce68c3bc74b6d52c)I'd be plenty happy if Red could render text as quickly as Sublime Text. :-)

BeardPower

[13:28](#msg5a5b5b075a9ebe4f7585e3be)@rebolek Regarding elements like lines to form a grid, arrows and what not, can be implement on the GPU. The same is true with text rendering (vector graphics). Performant spreadsheets/grids are implemented as a DAG.

[13:32](#msg5a5b5bf6ba39a53f1a13a573)Having a dedicated UI engine in Red, like in REBOL, would, in my eyes, be the most flexible. I personally don't need perfect native widgets. The fancy UI these days are some flat design. Windows 10 also uses a more flat/panel look.

[13:42](#msg5a5b5e5cba39a53f1a13af95)Are we still want to have this dated/retro look? There are also other architectures besides the stateful scenegraph-like ones used for UI: an ECS like approach, as implemented in Lighttable.

pekr

[14:40](#msg5a5b6bd6ba39a53f1a13eacc)As for me, I don't need in place editing. As for DB apps, I am used just to row hilite, enter/del/ins combination and separate forms for editing. DB app i snot an excell and you often want to see your data on a form, in a context with other related data.

rebolek

[15:47](#msg5a5b7b92517037a212a5aaa8)@BeardPower therr's alrrady everything present to have Red GUI. All it takes is just someone willing to spent some time on it :)

pekr

[15:49](#msg5a5b7c0f6117191e61645c76)And the GC, as you found out with your grid implementation, no? :-)

BeardPower

[15:52](#msg5a5b7ca5ba39a53f1a1438e2)@rebolek Can you please explain more about it in detail? I think you are referring to using the draw dialect for custom and fast widgets?  
What exactly needs to being worked on?

[15:59](#msg5a5b7e5e290a1f4561893773)Implementing the widgets (with skinning support)? A better signaling architecture?

rebolek

[16:14](#msg5a5b81c81dcb91f1774c6ab0)@pekr well... ;)

[16:16](#msg5a5b8276ba39a53f1a145468)@BeardPower yes, implementing the widgets. I have code for things like field or area, button can be done almost instantly, I have also slider... What else have I forgotten?

[16:18](#msg5a5b82c75ade18be397524a8)It's easy, I just don't see the point. Why doing custom Red GUI, when we have native one.

BeardPower

[16:20](#msg5a5b83485ade18be397527aa)Combobox, Inputfield, Password field, datepicker and much more :)

[16:23](#msg5a5b83e65a9ebe4f7586a583)&gt;It's easy, I just don't see the point. Why doing custom Red GUI, when we have native one.

Yes it's easy. The point is, native widgets are slow, not optimized, are behaving differently on various platforms, the amount of supported native widgets differs on various platforms, no GPU support, inflexible (you cannot change some properties on mac OS, because Apple won't let you) etc.

[16:25](#msg5a5b8488ae53c15903e7f109)Many developers/users want to have the same experience on any platform, not how the OS forces you to.

[16:26](#msg5a5b84bc1dcb91f1774c7835)Maybe I'm biased, because of game development, where you WANT to have the same UI experience.

greggirwin

[16:43](#msg5a5b88b05a9ebe4f7586b9b8)I think native widgets were the right target for Red to start, but there's also no reason we can't build our own if we want. Pros and cons. The basics aren't hard, but we should wait for pipeline effects as that may lead to an implementation that is much simpler for detailed control. @rgchris has done a lot of nice work in R2 in that regard, and I own the rights to a style set we can port if we want.

[16:44](#msg5a5b88f6ce68c3bc74b7ced6)Thanks for the input @henrikmk! Is your RebGUI model something you think we could leverage? Like others, I think we can do this pretty easily. Relatively anyway. The old tricks may be the best tricks.

gltewalt

[16:47](#msg5a5b89b26117191e61649a56)That same UI experience is now html5 + css3

9214

[16:48](#msg5a5b89dbae53c15903e80966)and &gt;200MB of Electron

gltewalt

[16:49](#msg5a5b8a1c517037a212a5eedb)That too

greggirwin

[16:49](#msg5a5b8a1eba39a53f1a147587)R2 VID is that same experience, as I believe QNX Photon and some game engines are as well.

endo64

[16:49](#msg5a5b8a205ade18be39754521)Would it be slow to make each cell a `base` face, it would be much easier than draw as it already has all events and it's also lightweight (not as much as draw of course) But supporting images, colors, events etc. could be easier.

greggirwin

[16:52](#msg5a5b8ab91dcb91f1774c929d)@endo64, `base` is still an OS-backed style, so it will be heavy if you have thousands of them. e.g. as in @toomasv's table matrix. It can work well in smaller cases though, which is where we need to look at use cases. Because the idea of a "table", where cells may nest, is also a useful model. e.g. a table that is infinitely zoomable, but also interactive.

BeardPower

[16:54](#msg5a5b8b4ece68c3bc74b7dbbc)@gltewalt Which is horrific. @9214 explained why. Electron is ridiculous. A simple crypto wallet built with Electron: 200MB of data and 100MB of RAM usage. The same crypto wallet in C/C++: 1MB of data and 3MB of RAM usage. Any other questions? ;-)

[16:56](#msg5a5b8baa290a1f456189781a)Built in Red: close to C/C++, I'm sure!

[16:59](#msg5a5b8c61b48e8c3566dc03a6)Of course, resources are not as limited as in the early days of computing, but why should we waste them just because we can afford it?

greggirwin

[17:00](#msg5a5b8cb21dcb91f1774c9b43)I'll never get to look at @luce80's latest code at this rate! :^)

9214

[17:02](#msg5a5b8d42ae53c15903e81728)

```
text
>> view [style Gregg: base ":^^)" Gregg rate 9000]
```

greggirwin

[17:04](#msg5a5b8d9e1dcb91f1774c9e30)

```
`text
>> view [style Gregg: base ":^^)" rate 9000   Gregg Gregg Gregg ...]
```

[17:05](#msg5a5b8dbf5a9ebe4f7586cf8c)But then I need to have a blackboard system so all my instances can share information.

## Monday 15th January, 2018

henrikmk

[13:46](#msg5a5cb0a15a9ebe4f758c12ed)@greggirwin My table widget is R2 specific, and I had a month to come up with the fastest possible table solution for the software we're building. What I know is that building everything from faces is typically not the fastest way to do it. In R2's case, it's very far from the fastest way.

The first design requirement was to build a table that could manage any size of data and work as fast as possible with scrolling, selection and tool-tips, so the starting point was to build the table grid to never process any kind of data that isn't going to be displayed now. That means building per-cell data picking functions and functions that calculate all dimensions and visible parts with pixel accuracy without drawing anything on screen.

The second design requirement was that everything is offline until you call REDRAW, something that is a problem with RebGUI's TABLE widget. REDRAW should never do any kind of calculations on sizes, offsets, content formatting, etc. It just reads all settings and dimensions and draws the table for you, once.

RebGUI unfortunately has a tendency to make REDRAW do too much, and requires redrawing the UI to get new sizes and offsets. This puts annoying limitations on its resize system, where you cannot inform certain parts of a UI about dimensions without specifically drawing other parts. For example, if you have a tab panel, UI elements in hidden panels do not have the correct size and offset, until the panel is drawn. That means, if I want to use the size and offset of a hidden UI element in another tab, I can't do that without calculating and setting the size manually, bypassing RebGUI's resizing system. This is the wrong way to do it. Don't do that with Red.

A third design requirement was to not have the table widget ever do any filtering, sorting or editing of data on its own. This should all be worked in with handlers, so we don't need to have the table widget redrawn, if we want to export data sorted and filtered in a particular fashion, and also avoid bloating the widget with sophisticated sorting methods.

A fourth design requirement is the ability to store and apply table states for undo/redo, and allow saving and retrieving them from disk, if needed. This goes back to the REDRAW issue. So the table state is a list of all properties required to configure the table for a particular display. Each property is settable or retrievable via standard functions available through its API (which does not have a dialect at all yet). If you need to do any kind of face hacking or probing the structure of the face tree, then there's a function missing. Once all properties are set up, call REDRAW once, and the table is correct.

A fifth design requirement is that row and column references are never physical. This was an infuriating part of RebGUI's TABLE, until some functions were added to clunkily convert physical row IDs into logical row IDs. In 99.9% of cases, you want to get and set selection data from sorted row and column order, not from the physical order.

I may release the source for it at some point, when the table widget is integrated into our program and depending if I'm allowed to do that.

pekr

[14:30](#msg5a5cbaebba39a53f1a19e591)+1

[14:30](#msg5a5cbb22ba39a53f1a19e64d)When Cyphre did a grid for me, my requirement was, that the return of the SQL data query, for e.g., does not need to be altered. There were virtual columns/rows, pointing at the data block ...

BeardPower

[14:45](#msg5a5cbe72517037a212ab8e46)@henrikmk Sounds a lot like streaming tile maps to me :)

[14:46](#msg5a5cbea95a9ebe4f758c65f8)Megatexture; anyone? ;-)

endo64

[14:56](#msg5a5cc12bba39a53f1a1a0b59)Thank you @henrikmk for the details.

nedzadarek

[15:06](#msg5a5cc374b48e8c3566e1a10e)&gt; This used to work:

```
system/view/VID/styles/newstyle: [
	template: [
		type: 'base size: 100x100
		abc: 1
	]
]
view [button "hi" newstyle "ho"]
```

I have 2 questions about the above code.  
A) How do I set `abc`? Is `do [/abc: 42]` the easiest way? Could I do something like this: `view [newstyle abc: 42]`?  
B) How do I make a "module of styles" - for example styles like `foo`, `baz`, `bar` grouped under `quux`; so I can do something like `view [quux/foo quux/baz quux/bar]`?  
I have tried to make style as map (something like this `system/view/VID/styles/bar: make map! [baz: [template: [type: 'base size: 100x100]]]` but it's a syntax error when I try `[bar/baz]`.

greggirwin

[18:27](#msg5a5cf2785a9ebe4f758da693)Thanks @henrikmk! I'm going to save that.

## Tuesday 16th January, 2018

9214

[12:24](#msg5a5def061dcb91f177580527)https://libfive.com/studio/

maximvl

[16:51](#msg5a5e2d96517037a212b36e5f)how hard is it to bring opengl to Red view?

9214

[16:52](#msg5a5e2db9ce68c3bc74c4dbd7)maybe @Oldes might say something in this regard

rebolek

[17:09](#msg5a5e31baba39a53f1a21b203)It depends on what you demand from it.

[17:10](#msg5a5e31ed5ade18be3982b05d)https://github.com/Oldes/code/tree/master/Library/OpenGL

9214

[17:14](#msg5a5e32e51dcb91f17759ba11)@nedzadarek regarding your questions - I don't think that we can define custom facets (as `abc:` in your example), perhaps you should use `extra` facet to store additional information; and View dialect doesn't support `path!` values, hence the error. You can of course group your styles as you want, but then you'll need to preprocess VID block with `compose` or something like that. (e.g. `view compose [(quux/foo) mystyle "test"]`)

[17:15](#msg5a5e3315ba39a53f1a21bb6f)`view [newstyle abc: 42]` could be written as `view [newstyle with [abc: 42]]`, though I haven't checked if it actually works

[17:15](#msg5a5e33271dcb91f17759bb4c)here `abc:` should be any valid facet, not a user-defined one

[17:15](#msg5a5e332b6117191e6171f148)AFAIK

greggirwin

[18:12](#msg5a5e4085b48e8c3566e9b16e):point\_up: \[January 16, 2018 5:24 AM](https://gitter.im/red/red/gui-branch?at=5a5def061dcb91f177580527) @9214, are you going to build the interactive libfive-lab.red demo? :^)

[18:12](#msg5a5e409c517037a212b3ef61)Oh, that means you'll need to write the 3D `draw` dialect first.

9214

[18:13](#msg5a5e40b3ce68c3bc74c55572)@greggirwin nay, just dropped it here

[18:13](#msg5a5e40bf5ade18be39831076)as in "I wish we could do the same sometime"

Oldes

[19:12](#msg5a5e4eb6ba39a53f1a226623)@9214 @maximvl Regarding OpenGL in Red - you would have to ask @qtxie - I was not able to get it running in Red itself, just in Red/System - I've got not enough help unfortunately.

9214

[19:13](#msg5a5e4ec8ba39a53f1a226672)thanks @Oldes !

BeardPower

[20:25](#msg5a5e5fcfba39a53f1a22c930)@maximvl As Red has the "use native OS functionality" approach, we would need to support DX on Windows and OpenGL, Metal and Vulkan on other platforms. An alternative would be a binding to third party graphic libs, which will support all the rendering backends.

[20:33](#msg5a5e617fce68c3bc74c60e43)So would it be beneficial, that Red itself offers a 3D engine? It would definitely be awesome. 🤓😎

[20:38](#msg5a5e62af1dcb91f1775adc58)How does the Red team design dialects in the first place? Is there some working group for designing an API or specification?

rebolek

[21:28](#msg5a5e6e876117191e6173603a)@BeardPower it \*would* be awesome, if Red offered 3D engine, but it's something that's certainly not a top priority, If you are curious about dialect design, they are mostly based on Rebol dialects, with some additions. And dialects are designed by their authors.

BeardPower

[21:37](#msg5a5e7097ce68c3bc74c67366)@rebolek Sure, I understand that. I wished I have more time for it. Will see what I can do. So even the dialects, which maybe get integrated into Red?

rebolek

[21:53](#msg5a5e745eae53c15903f70e21)@BeardPower I'm not sure what dialect do you mean. AFAIK, most of Rebol dialect were designed by Carl, with the exception of Draw, that was done by Carl and Cyphre (probably mostly by Cyphre, who integrated AGG to Rebol), but there's also lot of dialects that are not part of core language, designed by their respective authors. Another exception is Parse, which was designed by Carl, but updated for R3 with input from community.

BeardPower

[21:56](#msg5a5e74f1ae53c15903f710f3)@rebolek I'm referring to draw. Let's assume 3D should be integrated into Red as a draw3d dialect. How would this be decided on? Design, integration and so on.

rebolek

[22:02](#msg5a5e767d517037a212b54466)@BeardPower that's hard question. It certainly depends on implementation, Rebol used AGG that was small enough to be linked into executable, for 3D libraries, some OS-native thing probably would be used. I have not enough experience with 3D to guess how the dialect would be designed, I guess it's up to author of the library integration.  
But dialect is just an abstraction over an API, so if some dialect doesn't make much sense, another one may appear and overtake.

BeardPower

[22:06](#msg5a5e7783517037a212b54ac1)Thanks. Need to check on some libs I use, if they are small enough or some wrapper would make more sense.

dander

[22:12](#msg5a5e78ea5ade18be39846bfe)Another consideration is what module support will be like. Something like that seems like it could be a good candidate for a module, and later if it seemed appropriate, integration into the core could be considered.

BeardPower

[22:16](#msg5a5e79c7ce68c3bc74c6ac0e)Absolutely. With support of modules, different UI engines could also be separated from the native UI widgets.

rebolek

[22:18](#msg5a5e7a3eb48e8c3566eb1d3e)Of course, writing custom non-native Red GUI and binding current VIDialect to it is possible even now. Modules would make it even easier.

qtxie

[23:36](#msg5a5e8c97ce68c3bc74c71000)@Oldes @9214 @maximvl There is a experimental \[DX backend](https://github.com/red/red/tree/Direct2D) for 2D Draw already. For 3D draw, we need to design the DSL first.

## Wednesday 17th January, 2018

nedzadarek

[01:02](#msg5a5ea0aaae53c15903f7fae2)@9214  
Using `extra` means that user has to do something like this with (`view [el: newstyle ]`: `do [el/extra/abc: 42]`? I can do the same without extra (`do [el/abc: 42]`  
I wish `draw` supported `path!`. It would make making modules much easier.  
So... I guess there is not yet a consensus about gui's modules.

`view [newstyle with [abc: 42]]` doesn't work.

BeardPower

[10:06](#msg5a5f201a5ade18be39877bcf)@qtxie Thanks! Do you have any ideas on how the community could participate in the DSL design? Wiki/slack/gitter...?

rebolek

[10:09](#msg5a5f20caae53c15903fa4fc1)I would suggest discussion here and putting ideas to wiki.

BeardPower

[10:14](#msg5a5f21f75a9ebe4f759931a8)Exciting times ahead!

rebolek

[10:33](#msg5a5f2697ba39a53f1a26a8b9):)

PeterWAWood

[10:45](#msg5a5f294dce68c3bc74c9f4fb)@BeardPower For a significant addition to (or change in) Red, we would want to follow the \[Red Enhancement Proposal Process](https://github.com/red/red/wiki/Red-Enhancement-Proposal-Process).  
It hasn't really been used yet:  
\* partly because Red is still being formed  
\* partly because the Red Team and Community is quite small  
\* and partly because @dockimbel is too accommodating.

[10:48](#msg5a5f29fdba39a53f1a26ba17)These are changing. Even before the ICO:  
\* Red is becoming more and more concrete as we near 1.0  
\* The number of contributors is growing  
\* Nenad is still very accommodating

[10:51](#msg5a5f2aa46117191e6176f75b)We are now looking forward to:  
\* Red 1.0 being finalised  
\* A larger Red team and wider Red community  
\* Nenad continuing to be accommodating.

maximvl

[10:55](#msg5a5f2bac5ade18be3987c012)check this out: http://www.luna-lang.org/#Overview

9214

[10:56](#msg5a5f2bc01dcb91f1775ec65f)@maximvl too late ;) https://gitter.im/red/sandbox?at=5a5f2a84ba39a53f1a26bd53

PeterWAWood

[10:57](#msg5a5f2c266117191e617701b5)With a bigger Red Team and a wider community, we will need to be a bit more formal in our serious project communication.

maximvl

[10:58](#msg5a5f2c4b5a9ebe4f75997069)@9214 :+1:

Oldes

[11:07](#msg5a5f2e561dcb91f1775ed5c1)@qtxie @maximvl This is where I ended - https://gist.github.com/Oldes/8e542f44b1d0ea2e02636b5a9877bcf4 - to move the OpenGL in the View farther, I would have to get the gl.red script working in a way, that there would be the GL area in the Window and I would be able to catch the system events.. When I'd tried last time, I've got just some events so I was quite close... when I was trying now, I get this error when compiled with MSDOS target (needed to see the output in console)

```
x:\GIT\Red>gl.exe
*** Script Error: old has no value
*** Where: series?
*** Stack: layout series?
```

maximvl

[11:10](#msg5a5f2f165ade18be3987d609)@Oldes cool! :)

Oldes

[11:11](#msg5a5f2f6dae53c15903faa8d7)It's not cool... cool it would be, if it would be working somehow... I don't think DSL for 3D is needed to start.

maximvl

[11:12](#msg5a5f2f98ba39a53f1a26dbf5)that's a good progress already, DSL can be designed later once we have things working, I agree

Oldes

[11:30](#msg5a5f33e06117191e617730fc)@maximvl @qtxie My fault... the above error is with the `v0.6.4` Red branch. With `master` it is still partially working like before:

[11:30](#msg5a5f33e76117191e61773119)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/3b99/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/3b99/image.png)

[11:32](#msg5a5f34376117191e617732f9)So current problem is, that I don't know, how to make the widget redrawing on each \_frame\_.

[11:38](#msg5a5f359b5ade18be3987fd14)Regarding the rendering itself... my idea was, that there would be intermediate binary representation of the GL program with connection to data buffers. So completely different than current `VID` or `draw` dialects.

[11:40](#msg5a5f362fba39a53f1a2702b7)The advantage would be, that not all GL function would have to be included using Red/System binding, but would be imported from DLL only if really needed.

[12:24](#msg5a5f4086517037a212b931ca)@maximvl ok... I improved the gist slightly.. so now it renders a triangle... so it is more cool now... still don't have any idea, what I should change to be able do some animations.

[12:24](#msg5a5f408d1dcb91f1775f3ea4)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/RBHv/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/RBHv/image.png)

[12:25](#msg5a5f40ce5ade18be39884214)I mean animation with 60fps.

rebolek

[12:26](#msg5a5f40feba39a53f1a27430f)You need to refresh the triangle 60 times per second :P

BeardPower

[12:27](#msg5a5f4125517037a212b935cd)@Oldes Cool! What do you think about creating some wiki entry or a place, where we can discuss 3d related things?

[12:27](#msg5a5f41435ade18be3988446c)So we can gather what is needed, wanted etc.

maximvl

[12:28](#msg5a5f41701dcb91f1775f45dd)is there something easy to read about how opengl works / how to use it?

BeardPower

[12:32](#msg5a5f42555a9ebe4f7599f5c7)@maximvl Here you go: http://www.opengl-tutorial.org/

Oldes

[12:32](#msg5a5f426b290a1f45619c61ea)Internet is full of OpenGL tutorials... but it is recommended to search for these describing the modern api.

BeardPower

[12:33](#msg5a5f428fba39a53f1a274d86)Just keep in mind, that OpenGL is "retro". The new rendering APIs work completely different (DX12, Vulkan, Metal).

Oldes

[12:33](#msg5a5f42a51dcb91f1775f4db1)Also the hard thing is not OpenGL itself, but how to integrate it with Red for all platforms... people usually just include GLFW library for that.

BeardPower

[12:34](#msg5a5f42e75a9ebe4f7599fa4c)The big question is, if OpenGL should be directly integrated into Red or a binding to a Library, which takes care context creation, windows, buffers. shaders etc.

Oldes

[12:34](#msg5a5f42e8ae53c15903fb1ec0)@BeardPower I don't agree it is so much \_retro_ if will take ages since everybody will have HW and OS capable to run Vulkan for example.

BeardPower

[12:35](#msg5a5f431e5a9ebe4f7599fb48)OpenGL itself is retro, as there is also OpenGL ES. On mobile there is EGL.

Oldes

[12:35](#msg5a5f432b290a1f45619c6705)Using binding is easy... you can check my example in Red/Code - but it is more interesting to have GL context inside View as is in the gist.

[12:36](#msg5a5f4342b48e8c3566eefe39)Right... I call EGL a new OpenGL API:)

[12:37](#msg5a5f43a7ae53c15903fb23c1)Btw... if someone is interested in C code, this is cool project to handle all APIs -&gt; https://github.com/floooh/sokol

BeardPower

[12:38](#msg5a5f43c5290a1f45619c6a0d)Thanks for your shared work, btw. :+1: Yes, bindings would be easier, so don't you think it's something to consider? Sure, having a GL content inside View would be very helpful. The thing is, which API should be concentrated on: OpenGL (ES), as it's cross platform, or DX12 for Windows and OpenGL (ES) for all other platforms?

[12:39](#msg5a5f440d5ade18be3988553e)EGL -&gt; they called it an interface between OpenGL ES and the underlying window interface.

[12:43](#msg5a5f44de1dcb91f1775f59e8)&gt; sokol\_gfx.h is a “modern 3D API wrapper” around GLES2/WebGL, GLES3/WebGL2, GL3.3, D3D11 and Metal especially suited for small web- and native-mobile projects.

Unfortunately DX12 and Vulkan is missing. Fortunately there are other libraries, which support all :)

Oldes

[12:43](#msg5a5f44df5ade18be39885b74)I would start with OpenGL3 (ES) as the original API (for example the calls I used in the gist) is really deprecated.

[12:44](#msg5a5f454b290a1f45619c7219)I really don't care much about Vulkan/DX12 - you would have to provide back compatibility anyway.

BeardPower

[12:46](#msg5a5f4590ae53c15903fb304b)&gt;I really don't care much about Vulkan/DX12 - you would have to provide back compatibility anyway.

Which some libs provide.

Which version do you want to use? ES 3.0? As 3.1 is only supported from Android 5.0 and up.

Oldes

[12:46](#msg5a5f45bdba39a53f1a27619d)https://github.com/floooh/oryol/tree/vulkan  
https://github.com/floooh/oryol/tree/d3d12-wip

but it is C++

[12:48](#msg5a5f461c290a1f45619c768b)You can use OpenGL easily with any version.. you must load the functions dynamically anyway according supported driver. The same works Vulkan.

BeardPower

[12:49](#msg5a5f465bb48e8c3566ef0f36)Unfortunately most libs are using C++. I will create a list with some libs, we could look into (there are some C ones).

[12:50](#msg5a5f46b05a9ebe4f759a109c)&gt;You can use OpenGL easily with any version.. you must load the functions dynamically anyway according supported driver. The same works Vulkan.

Sure, it's just that Vulkan works completely different. But of course, OpenGL would be a nice start :+1:

Oldes

[12:52](#msg5a5f46f75ade18be39886603)Here is how I load the functions in Red/System -&gt; https://github.com/red/code/blob/master/Library/OpenGL/gl3-common.reds

BeardPower

[13:02](#msg5a5f49756117191e6177b317):+1:

Oldes

[13:04](#msg5a5f49f8517037a212b96fad)Anyway.. what I would need is help from @qtxie to be able do the same functionality, which is in the gist, to be working also on the other platforms and also some way, how to evaluate the WM\_PAINT event... because now I don't know how to communicate between the Red and Red/System layers.

[13:10](#msg5a5f4b4c6117191e6177be44)Ideally when I would modify `code` property like \[here](https://gist.github.com/Oldes/8e542f44b1d0ea2e02636b5a9877bcf4/6401224676bd3398e0a33bf51e8ff16745d872b8#file-gl-red-L326-L329)

## Thursday 18th January, 2018

qtxie

[06:41](#msg5a6041871dcb91f17764dc99)@Oldes What do you want to do in `g/code`? Calling OpenGL APIs?

Oldes

[08:04](#msg5a6054fa517037a212bf398e)Ideally to pass data to R/S layer and make it to redraw the content of the widget.

## Friday 19th January, 2018

qtxie

[08:08](#msg5a61a77a5a9ebe4f75a7a6e9)@Oldes Use `draw` facet will be easier. \[This is the code](https://github.com/red/red/blob/master/modules/view/backends/windows/base.reds#L513) how to access `draw` block in R/S.

[08:12](#msg5a61a881ce68c3bc74d7ea3c)Also, need to add this line: `wcex/cbWndExtra: 80`.

[08:13](#msg5a61a88fe01412265063e062)

```
wcex/cbSize: size? WNDCLASSEX
wcex/cbWndExtra: 80					;-- reserve extra memory for face! slot
wcex/hInstance: hInstance
wcex/lpszClassName: #u16 "RedOpenGL"
wcex/lpfnWndProc: :OpenGLWndProc
```

Oldes

[09:18](#msg5a61b7ef9cdc721e4f9eee10)You mean `g/draw` instead of `g/code`? That would be fine... I used name `code` just as an example... you may notice that in first versions there was `url` used as I was reusing parts from my attempts to make a `browser` widget (where I also had a show stopper).

[09:20](#msg5a61b872ae53c1590308d64c)Btw... in the code you linked it is under `WM_PAINT` event.. but how to get that event fired when the draw facet would be modified?

qtxie

[09:30](#msg5a61baae9cdc721e4f9eff99)Yes. `g/draw`. If `system/view/auto-sync?` is true, the event is fired just after you modify the draw block. if false, use `show g` to fire the event.

BeardPower

[11:38](#msg5a61d8b7e01412265065049f)@Oldes Are you trying to implement /use OpenGL for an event based application or for a rendering loop like in a game?

Phryxe

[13:04](#msg5a61ecd3290a1f4561ab412f)In an earlier post he mentioned 60 fps so I guess it is the latter.

BeardPower

[13:12](#msg5a61eed75ade18be39977917)So why is a redraw event needed? The whole screen is redrawn at x FPS.

Oldes

[13:32](#msg5a61f368ae53c159030a3ba7)I'm not trying to do anything serious. Just trying what is posible.

BeardPower

[14:31](#msg5a62012e517037a212c900c2)Alright :+1:

[14:32](#msg5a620161517037a212c9025f)Much appreciated.

## Saturday 20th January, 2018

toomasv

[17:49](#msg5a638110ae53c1590311c924)I've been traveling recently and not much participated, but got some little steps on with \[graph](https://gist.github.com/toomasv/be38d5b451bc02da25e81a1cdba589fc):  
1\. Added arrows `->`, `<-` (plus previous `-`).  
2\. Added elementary interactive editing.  
3\. Added subtree-moving with ctrl-drag.  
Overall, this is another strain-test.

9214

[17:59](#msg5a6383816117191e618eb773)@toomasv toomassive as usual! :clap:

ldci

[18:04](#msg5a6384b7ae53c1590311da8e) RedCV update with ZLib support (http://redlcv.blogspot.fr/2018/01/image-compression-with-red.html)

toomasv

[19:14](#msg5a63950ace68c3bc74e169d4)@ldci Seems great! :+1:  
@9214 I enjoy to make little systems, very little, not too massive, even if the code to make these may be too massive indeed, compared to what might be possible..

## Sunday 21st January, 2018

ldci

[11:53](#msg5a647f4a5ade18be39a313ac)@toomasv : thanks! @9214 : please feel free to participate to RedCV and improve the code :)

nedzadarek

[17:15](#msg5a64cabdae53c15903170246)@toomasv  
Do I need something special in order do run it? I have found `do %graph.red` so I created that file with

```
graph [n1 -> n2]
graph [n1 -> [n2 n3]]
```

but it does nothing or I don't see a change. Without `graph.red` it shows:

```
*** Access Error: cannot open: %graph.red
*** Where: read
*** Stack: do-file
```

Is there some simple example in the style of "hello world"?

```
about
; Red for Windows version 0.6.3 built 22-Nov-2017/17:20:39+01:00
```

So I guess I need that `graph.red` file. At least one time. 2nd time it doesn't show that error.

btw. You shouldn't use `comment []`. Blocks are still parsed so your code display an error. I think you should use `comment "code"` or `comment {}` if you have strings inside (`"string"`).  
(If I made a mistake in above statement anyone should correct me)

toomasv

[20:08](#msg5a64f3585ade18be39a53ef3)@nedzadarek Thanks for noting! I changed formatting of comments at some point and forgot to change block into {}-string. It doesn't use anything except %graph.red. I have `Red for Windows version 0.6.3 built 29-Dec-2017` and it runs without problems.  
!\[graph-example](http://vooglaid.ee/red/graph1.png)

## Monday 22nd January, 2018

toomasv

[04:24](#msg5a65677b517037a212d84cb6)Little study on borders:

```
view [
   image 300x300 
   draw [
      scale 5 5 [
         line-width 5 
         box 10x10 50x50 
         pen red 
         line-width 1 
         box 10x10 50x50 
         pen off 
         fill-pen 255.205.40.150 
         box 10x10 50x50
]  ]  ]
```

!\[borders.png](http://vooglaid.ee/red/borders.png)

Oldes

[12:50](#msg5a65de255ade18be39a994ee)@qtxie so I \[managed](https://gist.github.com/Oldes/8e542f44b1d0ea2e02636b5a9877bcf4) to catch the content of the `draw` facet in my GL widget, but there is still the problem, that I'm not able to force it to redraw it correctly from the View. The `show g` does not work and `system/view/auto-sync?: true` too. The WM\_PAINT event is correctly sent when resizing the window, but when I try to resize the widget changing its size, the WM\_PAINT is sent only when the size is enlarging - not when the widget is becoming smaller. Is it normal?

qtxie

[12:56](#msg5a65df695a9ebe4f75bbbad1)@Oldes My mistake. You'll have to add some code in \[here](https://github.com/red/red/blob/master/modules/view/backends/windows/gui.reds#L2107). like:

```
if type = OpenGL [InvalidateRect hWnd null 1]
```

Oldes

[12:57](#msg5a65dfac98927d57451ef592)Hm... but it would require custom made Red.

qtxie

[13:00](#msg5a65e0570ad3e04b1b52c9af)I added a `system/view/platform/redraw` routine before in view engine. But I'm not sure we'll keep it in the future.

[13:00](#msg5a65e089ce68c3bc74eb5d51)So you can use `system/view/platform/redraw g` to force the redraw.

Oldes

[13:02](#msg5a65e0df5ade18be39a9a6e9)Also now I'm playing with OpenGL, but next day may come someone else and try it with `Vulkan` or some other widget.

[13:02](#msg5a65e102ce68c3bc74eb6003)`system/view/platform/redraw g` works.

[13:04](#msg5a65e154517037a212dae9b7)Regarding the resizing the widget.. is it recommended to call the draw function from the WM\_SIZE event too?

[13:05](#msg5a65e18a98927d57451f00b1)Even with the price that when enlarging, it would be drawn 2x?

qtxie

[13:05](#msg5a65e18a6117191e61992226)@Oldes Adds CS\_HREDRAW and CS\_VREDRAW styles when register the window class. https://msdn.microsoft.com/en-us/library/windows/desktop/dd162910(v=vs.85).aspx

[13:05](#msg5a65e1ac98927d57451f021a)

```
wcex/style: CS_HREDRAW or CS_VREDRAW
```

Oldes

[13:08](#msg5a65e256d9f895c36046e5d9)@qtxie great.. that works too.. thanks.. so now one have everything to play with OpenGL on Windows... how difficult it would be for macOS and Linux? Because without cross-compatibility it does not make sense.

qtxie

[13:10](#msg5a65e2c55a9ebe4f75bbccc8)I'm not sure on macOS. On Linux should be easy.

toomasv

[13:51](#msg5a65ec656117191e61996a6d)I wonder, if this difference in behaviour is intentional?

```
view [
	;Square
	image 300x300 draw [scale 5 5 [
			line-width 5 box 10x10 50x50 
			pen red line-width 1 box 10x10 50x50 ;box 0x0 60x60
			pen off fill-pen 255.205.40.150 box 10x10 50x50 
		] 	
		pen black line-width 1 line 150x0 150x300 line 0x150 300x150 box 0x0 299x299
	]
	;Ellipse
	image 300x300 draw [scale 5 5 [
			line-width 5 ellipse 10x10 50x50 
			pen red line-width 1 ellipse 10x10 50x50 ;box 0x0 60x60
			pen off fill-pen 255.205.40.150 ellipse 10x10 50x50 
		] 	
		pen black line-width 1 line 150x0 150x300 line 0x150 300x150 box 0x0 299x299
	]
	;Circle
	image 300x300 draw [scale 5 5 [
			line-width 5 circle 30x30 20 
			pen red line-width 1 circle 30x30 20 ;box 0x0 60x60
			pen off fill-pen 255.205.40.150 circle 30x30 20 
		] 	
		pen black line-width 1 line 150x0 150x300 line 0x150 300x150 box 0x0 299x299
	]
]
```

!\[borders-comp.png](http://vooglaid.ee/red/borders-comp.png)

greggirwin

[14:02](#msg5a65ef04ce68c3bc74ebb8c4)Looks like the second pair for `ellipse` is the size, not the LR corner as with `box`.

[14:05](#msg5a65efabce68c3bc74ebbc93)As the diameter in each direction, so:

```
view [
    ;Square
    image 300x300 draw [scale 5 5 [
            line-width 5 box 10x10 50x50 
            pen red line-width 1 box 10x10 50x50 ;box 0x0 60x60
            pen off fill-pen 255.205.40.150 box 10x10 50x50 
        ]     
        pen black line-width 1 line 150x0 150x300 line 0x150 300x150 box 0x0 299x299
    ]
    ;Ellipse
    image 300x300 draw [scale 5 5 [
            line-width 5 ellipse 10x10 40x40 
            pen red line-width 1 ellipse 10x10 40x40 ;box 0x0 60x60
            pen off fill-pen 255.205.40.150 ellipse 10x10 40x40 
        ]     
        pen black line-width 1 line 150x0 150x300 line 0x150 300x150 box 0x0 299x299
    ]
    ;Circle
    image 300x300 draw [scale 5 5 [
            line-width 5 circle 30x30 20 
            pen red line-width 1 circle 30x30 20 ;box 0x0 60x60
            pen off fill-pen 255.205.40.150 circle 30x30 20 
        ]     
        pen black line-width 1 line 150x0 150x300 line 0x150 300x150 box 0x0 299x299
    ]
]
```

[14:07](#msg5a65f00bae53c159031ca7fe)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/wioS/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/wioS/image.png)

toomasv

[14:11](#msg5a65f10e0ad3e04b1b533ba5)@greggirwin Thanks! I misunderstood the docs :(

greggirwin

[14:14](#msg5a65f1e2ae53c159031cb47d)It took me a minute too. Got it wrong the first time I tried.

Oldes

[15:02](#msg5a65fd206117191e6199d8cc)@qtxie what if I would like to store some more info with the widget.. like last widget's known cursor position? Should I use the `draw` facet for it and let say.. consider it to be always as a special object?

BeardPower

[15:11](#msg5a65ff0a5a9ebe4f75bc8aa3)@Oldes Couldn't you use the extra facet/keyword for this?

[15:12](#msg5a65ff6a98927d57451fbe80)

```
6.1.10. extra
Syntax
extra <expr>
<expr> : any value (any-type!).

Description
Sets the face’s extra facet to a value (can be the result of a Red expression).
```

Oldes

[15:14](#msg5a65ffd86117191e6199ebc7)Yes... probably could be used too.

[15:16](#msg5a66003a517037a212dbb40e)Still there would have to be checks for valid values inside when updating it or accessing it.

[15:16](#msg5a660061517037a212dbb5f9)Or maybe the `extra` facet could just hold a handle! to internal struct.

rebolek

[15:19](#msg5a6601045a9ebe4f75bc9865)I use `extra` as object full of settings and internal stuff for custom widgets.

Oldes

[15:21](#msg5a6601786117191e6199f86d)But than you must trust that your users will not mess with it, right? :)

rebolek

[15:23](#msg5a6601d70ad3e04b1b53b056)Right, but user can currently mess with everything, so it's not such a problem ;)

BeardPower

[15:24](#msg5a660211ce68c3bc74ec3378)But isn't this a responsibility of the user? I'm calling you, C! :smile:

Oldes

[15:27](#msg5a6602f898927d57451fd7be)Right... using `handle!` in the `extra` is not much safer.. as one could just destroy the handle and it could not be recreated.

BeardPower

[15:47](#msg5a660781ce68c3bc74ec564b)Code is data is code ;-)

nedzadarek

[17:45](#msg5a662328d9f895c360489404)@toomasv I got this:

```
graph [nodes [circle] at 100x50 n1 -> [n2 n3 -> [nodes [squoare] n4 n5] n6 "6" -> n7 "" [glass]]]
; *** Script Error: VID - invalid syntax at: [with [color: 0.0.0.255 font: make object! [name: "Consolas" size: 12 style: none angle: 0 color: none anti-alias?: false shadow: none state: none parent: none ] text: "n1" extra: make reactor! copy/deep props extra/type: 'circle extra/label: "n1" draw: [line-width 1 pen 0.0.0 fill-pen 100.200.100 ellipse 0x0 39x39 font make object! [name: "Consolas" size: 12 style: none angle: 0 color: none anti-alias?: false shadow: none state: none parent: none ] text 15x10 "n1"] menu: ["Add child" add "Delete" delete] actors: object [offs: copy [] descs: copy [] on-down: func [face event /local des] [if event/ctrl? [clear offs descs: to-block face/extra/descendants foreach des descs [append offs des/offset - face/offset]]] on-drag: func [face event /local des n] [if event/ctrl? [n: 0 foreach des descs [n: n + 1 des/offset: face/offset + offs/:n]]] on-menu: func [face event /local n list new idx bef my-ancs depth root levels level me sib diff sib-ancs ancs-level anc x y sib-x i] [switch event/picked [add [append face/parent/pane new: first layout/only add-node 'node copy ["node"] copy [style node: box loose] 'live append face/extra/children new idx: either bef: find before to-word face/extra/label [index? bef] [append before to-word face/extra/label append/only middle copy [] append/only after copy [] 1] append pick middle idx to-word "->" append pick after idx to-word new/extra/label adjust-offsets face draw-edge to-word new/extra/label "->"] delete [all [n: find before to-word face/extra/label foreach list [middle after] [remove at get list index? n] remove n] forall after [all [n: find after/1 to-word face/extra/label remove at middle/(index? after) index? n remove n]] unless empty? face/extra/edges [foreach edge face/extra/edges [remove find edge/extra/head/extra/edges edge remove find edge/extra/tail/extra/edges edge remove find edge/parent/pane edge]] remove find face/parent/pane face remove find node-list to-word face/extra/label]]]]] n2:]
*** Where: do
*** Stack: graph layout layout cause-error
```

9214

[17:45](#msg5a66235598927d574520b2f9)@nedzadarek update your console

[17:46](#msg5a66236bce68c3bc74ed0ab5)the old version you use doesn't support `with` keyword

BeardPower

[17:47](#msg5a6623c6517037a212dca6b1)squoare should be square

nedzadarek

[17:47](#msg5a6623c95a9ebe4f75bd8e53)@9214 but should I download main 0.6.3.exe or &lt;date&gt;.exe?

9214

[17:52](#msg5a6624d4e0141226507990c1)@nedzadarek http://static.red-lang.org/dl/auto/win/red-latest.exe

nedzadarek

[17:59](#msg5a66266ce014122650799c69)@9214 that one. Great. Everything works now.  
btw. is there some kind of change log?

9214

[17:59](#msg5a66269dd9f895c36048a827)well, you can read commit history back from 22 Nov

nedzadarek

[18:01](#msg5a6626e65ade18be39ab893a)@9214 Great! I'll do this. Thank you.

greggirwin

[19:00](#msg5a6634bfae53c159031e7f4d)&gt; But isn't this a responsibility of the user? I'm calling you, C! :smile:

:^)

[19:10](#msg5a663714ae53c159031e8e92)In R2, VID had a `words` section for styles, so you could add custom words and handle them. It also later added accessor funcs, which were helpful in hiding details (e.g., `text-list/lines`). Since Red VID is still fairly new, and more OSs will be coming online. Can we outline a possible plan for how we \*want* this kind of thing to work? We know exposing all internal details, and \*making* users understand them in order to get work done, isn't great. We might also safely say that just putting everything behind individual accessors isn't a great fit in Red.

I imagine adding words to faces will be easier once we can extend objects.

Basically, we can expect there to be a fixed set of interfaces, facets and events, and a need to add more at some point, keeping in mind that building new, compound styles should be supported. Do we view these as two aspects to faces and styles (oh, and don't forget L10N!), or would it work to have a single model of `face` where \*every* facet/event is an extension/plugin?

pekr

[19:20](#msg5a66399298927d57452141b6)In Carl's version I also remember somethink like a facility to distinguish shared vs non-shared properties. Was it facet vs faced?

[19:25](#msg5a663a93ae53c159031ea140)Hmm, actually it was something different ....

greggirwin

[19:44](#msg5a663f3a517037a212dd523c)I don't remember either Petr.

DideC

[21:05](#msg5a66522b0ad3e04b1b55c606)IIRC it was by adding a word in the /flag list. See `source set-font`.

## Tuesday 23th January, 2018

meijeru

[10:34](#msg5a670fa0ce68c3bc74f1ba27)@pekr @greggirwin I looked it up in a write-up I made a long time ago for R3:  
A `style` object in R3 had three important fields

```
facets:	object!		face properties of interest to the application
					–	enrich/override those of parent style
					–	their values are shared between all faces
						created in this style, unless overridden
						in the VID dialect
faced:	object!		face properties that are not to be shared
					with other faces created in this style
options:	object!		names and types of face properties that can be set
					using the VID dialect
```

[10:35](#msg5a6710035ade18be39b02c59)The R3 approach was more complicated that the Red one because it had `gob`s as well as `face`s, and also `style`s were objects.

greggirwin

[18:02](#msg5a6778ac6117191e61a234b6)Thanks @DideC and @meijeru! I believe @qtxie said we might get something like `gob!` as well, in the future.

guibus

[18:42](#msg5a67821398927d5745285722)Hi all, I'm new to red and it looks fantastic ! I used rebol many years ago, but that's old now. i have a question about panels. I would like to know how I can add facets on an already opened panel.

greggirwin

[18:43](#msg5a678264d9f895c360503d0a)Add facets or new sub-faces? Can you give an example?

guibus

[18:43](#msg5a678266e014122650816a88)ex : my-panel: panel 1000x30 \[] -&gt; empty  
my-func: func \[] [append my-panel button ... -&gt; does not work. Thanks in advance.

greggirwin

[18:43](#msg5a67826d517037a212e471e1)And welcome to Red!

guibus

[18:44](#msg5a6782a36117191e61a26eb1)I have an empty panel and want to be able to remove and add new buttons depending on values I don't know in advance.

[18:45](#msg5a6782c7c95f22546dd66a69)Thanks!

[18:46](#msg5a67831e517037a212e47638)I'm not sure with the terms, but it seems it would be sub-faces

greggirwin

[18:47](#msg5a678354e014122650816fc5)Here's a tab-panel example, for tabs themselves:  
https://gist.github.com/greggirwin/c4ba0b07e73b7e050b0f1df6bd80c15a

Looking for one that matches. Basically, you want to append to the `pane`.

9214

[18:48](#msg5a678376c95f22546dd66ebf)@guibus kinda like that

```
view [p: panel 100x100 [text "hi" return] button "add" [append p/pane layout/only [text "welcome to Red!"]]]
```

greggirwin

[18:49](#msg5a6783a898927d57452860fe)https://github.com/red/red/blob/master/tests/view-test.red has a lot of examples, at the lower level. @9214 beat me by using `layout` internally. Clever devil.

[18:50](#msg5a678400517037a212e47db9)In %view-test.red, you can see how to make faces directly, without using VID, though a VID wrapper for single face generation could be nice.

guibus

[18:51](#msg5a67842cd9f895c3605048fa)Yes, thanks a lot ! that was the layout/only the key ... going to look further at view-test.red

9214

[18:52](#msg5a67846a0ad3e04b1b5c3c07)@guibus rather something like

```
view [p: panel 100x100 [button "1"] on-over [append p/pane layout/only [at 10x50 button "2"]]]
```

[18:52](#msg5a6784855a9ebe4f75c56120)you need to specify coordinates of new button or it will overlap with an existent one

guibus

[18:54](#msg5a67850098927d5745286b25)@9214 Yes, it's what I was experiencing, thanks !

9214

[18:55](#msg5a678524d9f895c360505012)maybe there's a way to pad everything automatically

guibus

[18:55](#msg5a678536ae53c1590325f350)@9214 or would it be possible to concatenate all buttons in one block and apply the layout/only only one time ?

9214

[18:56](#msg5a67854398927d5745286cd8)@guibus yes, why not

[18:56](#msg5a678559ce68c3bc74f4b5a4)you can generate VID block any way you want and then just feed it into `layout/only`

guibus

[19:14](#msg5a67898ece68c3bc74f4ce17)@9214, now my problem is I use styles defined in the view, but when doing the layout/only it's not recognized.  
style tib-button: button 20 font-name "Microsoft Himalaya" font-size 16  
style bt-root: tib-button \[init-words-by-root face/text]  
style bt-maincons: tib-button \[init-words-by-maincons face/text]  
executing { append pn-maincons/pane layout/only \[bt-maincons c] } , with c being a string, then returns "Script Error: VID - Invalid syntax at \[bt-maincons c]]"

[19:14](#msg5a678992e0141226508198d0)any suggestion ?

9214

[19:15](#msg5a6789d90ad3e04b1b5c5be6)@guibus perhaps you should insert all styles descriptions at the beginning of `[bt-maincons c]` block?

[19:19](#msg5a678aae0ad3e04b1b5c60d4)ah, or experiment with `/styles` refinement

greggirwin

[19:28](#msg5a678cd698927d5745289c7a)@9214, in your last code example, you'll just keep adding the second button on every `on-over`, yes?

9214

[19:28](#msg5a678ce56117191e61a2ae76)@greggirwin hm, I think yes

greggirwin

[19:29](#msg5a678d0a6117191e61a2af1b)@guibus, just be aware that it doesn't magically know you only want that done once.

[19:31](#msg5a678d8598927d574528a134)Alsol, we don't have `stylize` yet, which will help with that. In the meantime, remember that there is no real scoping in Red. That's why your dynamic additions don't know about the "outer" styles.

guibus

[19:37](#msg5a678ef1c95f22546dd6b2f4) @greggirwin @9214 , actually I'm discovering red, so I don't know the subtleties of the language and VID. As you pointed out, red is still in alpha stage, so I'll try to find a work-around. Anyway, I'm going to try things as you both gave me some directions to study.

[19:38](#msg5a678f23e01412265081ba84)And thanks for being so reactive !

9214

[19:38](#msg5a678f3d5a9ebe4f75c5a775)

```
text
>> make reactor! [9214]
== make object! [
]
```

greggirwin

[19:38](#msg5a678f4d517037a212e4c5ff)We're all about reactivity: https://doc.red-lang.org/en/reactivity.html

9214

[19:39](#msg5a678f59517037a212e4c64b)@guibus feel free to ask any questions as you proceed :)

guibus

[19:39](#msg5a678f8bc95f22546dd6b645)@greggirwin @9214 , that's right!

greggirwin

[19:40](#msg5a678f9d98927d574528b10c)@9214, I was going to try an `on-deep-change ... values-of self` meta-philosophical snippet, but too short of time, and don't want to send you down the abyss.

9214

[19:41](#msg5a678fdee01412265081beda)@greggirwin `??` thy`self`

greggirwin

[19:41](#msg5a678ff8517037a212e4cab3)Niiiiice.

9214

[19:44](#msg5a67909eae53c15903263c08)

```
text
>> reflect on words-of [Gregg]
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: reflect
*** Stack: words-of
```

guibus

[20:50](#msg5a67a018d9f895c36050f827)@9214 works perfect, thanks. All at once, with styles. Still one thing pending. I don't know how to suppress the 20x20 offset for the first button, so it could be displayed right at the top of the panel. Any idea ?

9214

[20:51](#msg5a67a0670ad3e04b1b5cee1c)@guibus just don't prepend it with `at`?

[20:52](#msg5a67a08eae53c15903269d02)`button at 20x20 button at 30x30 button` etc

guibus

[20:57](#msg5a67a1a7e0141226508232f8)thanks. that's what I was looking for. but it seems it's valid only for the next sub-face. Is there a way to generalize it ?

[20:57](#msg5a67a1bb5a9ebe4f75c61ebc)looking at your code I code the answer, sorry.

9214

[20:57](#msg5a67a1cd0ad3e04b1b5cf628)you meant `at` thing?

[20:57](#msg5a67a1d5ae53c1590326a735)you want every button be at the same offset?

[20:58](#msg5a67a2115a9ebe4f75c62151)maybe `origin` or `pad`

[20:58](#msg5a67a212ae53c1590326a8c1)https://doc.red-lang.org/en/vid.html

guibus

[20:59](#msg5a67a232ce68c3bc74f5646e)I just would like to define the start at 0x0 of the pane and then add the buttons; I thought that across was going to conserve the right line so the buttons would be on then same line.

[21:00](#msg5a67a2606117191e61a3330b)Yes that was origin, thanks

9214

[21:00](#msg5a67a27698927d57452926e2)you can navigate by the coordinates of the very first placed button I think

[21:01](#msg5a67a292d9f895c360510778)

```
text
>> l: layout/only [button "test"]
== [make object! [
    type: 'button
    offset: 10x9
    size: 62x25
    text: "tes...
>> l/offset
== none
>> l/1/offset
== 10x9
```

[21:01](#msg5a67a2c5ce68c3bc74f567d4)then just incrementally add offsets to x and y coordinates

guibus

[21:03](#msg5a67a329d9f895c360510b1d)origin works just fine. I've already tried offset but I looks it can be defined only afterwards.

## Wednesday 24th January, 2018

toomasv

[09:35](#msg5a68534eae53c1590329f57e)Added rounded corners and edges/arrows formatting to \[graph](https://gist.github.com/toomasv/be38d5b451bc02da25e81a1cdba589fc).  
!\[nodes.png](http://vooglaid.ee/red/nodes.png)  
!\[edges.png](http://vooglaid.ee/red/edges.png)  
!\[edges2.png](http://vooglaid.ee/red/edges2.png)

rebolek

[09:46](#msg5a6855daae53c159032a02c3):+1:

endo64

[09:46](#msg5a6855e7ae53c159032a02ff)Very nice! @toomasv

maximvl

[11:05](#msg5a68687298927d57452cdf64)@toomasv WOW, I tried to do something like this a while ago but it wasn't that fancy

[11:05](#msg5a68688cae53c159032a74d2)@toomasv I wonder which algorithm do you use to position the nodes?

[11:06](#msg5a6868b5517037a212e91ae4)also, what's the idea of this: `set 'graph function` instead of `graph: function` ?

toomasv

[11:06](#msg5a6868cec95f22546ddaf1c9)@maximvl Self-cooked, very naive.

maximvl

[11:07](#msg5a6868ecae53c159032a77bf)let me try if it works on wine ;)

toomasv

[11:07](#msg5a6868fd5a9ebe4f75ca051b)`set 'graph function` makes `graph` public

[11:08](#msg5a68692aae53c159032a79a1)And it is unstable on W10

maximvl

[11:08](#msg5a6869356117191e61a6fcf3)

```
>> graph [node1 -> node2]
*** Script Error: VID - invalid syntax at: [with [color: 0.0.0.255 font: make object! [name: "Consolas" size: 12 style: none angle: 0 color: none anti-alias?: false shadow: none state: none parent: none ] text: "node1" extra: make reactor! copy/deep props extra/type: 'ellipse extra/label: "node1" draw: [line-width 1 pen 0.0.0 fill-pen 100.200.100 ellipse 0x0 69x39 font make object! [name: "Consolas" size: 12 style: none angle: 0 color: none anti-alias?: false shadow: none state: none parent: none ] text 15x10 "node1"] menu: ["Add child" add "Delete" delete] actors: object [offs: copy [] descs: copy [] on-down: func [face event /local des] [if event/ctrl? [clear offs descs: to-block face/extra/descendants foreach des descs [append offs des/offset - face/offset]] 'done] on-drag: func [face event /local des n] [if event/ctrl? [n: 0 foreach des descs [n: n + 1 des/offset: face/offset + offs/:n]] show face/parent] on-menu: func [face event /local n list new idx bef my-ancs depth root levels level me sib diff sib-ancs ancs-level anc x y sib-x i] [switch event/picked [add [append face/parent/pane new: first layout/only add-node 'node copy ["node"] copy [style node: box loose] 'live append face/extra/children new idx: either probe bef: find before to-word face/extra/label [index? bef] [append before to-word face/extra/label append/only middle copy [] append/only middle-opts copy [] append/only after copy [] 1] append pick middle idx to-word "->" append/only pick middle-opts idx copy [] append pick after idx to-word new/extra/label probe reduce [before middle middle-opts after] adjust-offsets face show face/parent draw-edge to-word new/extra/label "->" copy [[red]] show face/parent] delete [all [n: find before to-word face/extra/label foreach list [middle middle-opts after] [remove at get list index? n] remove n] forall after [all [n: find after/1 to-word face/extra/label remove at middle/(index? after) index? n remove at middle-opts/(index? after) index? n remove n]] unless empty? face/extra/edges [foreach edge face/extra/edges [remove find edge/extra/head/extra/edges edge remove find edge/extra/tail/extra/edges edge remove find edge/parent/pane edge]] remove find face/parent/pane face remove find node-list to-word face/extra/label show face/parent]]]]] node2:]
*** Where: do
*** Stack: graph layout layout cause-error
```

9214

[11:08](#msg5a68693e0ad3e04b1b60ae9c)@maximvl update console

maximvl

[11:09](#msg5a6869550ad3e04b1b60aef8)I remember new red versions were broken

[11:09](#msg5a68695de01412265085f8e6)are they still?

9214

[11:09](#msg5a686968d9f895c36054bd4d)kinda, yeah

maximvl

[11:09](#msg5a686973ae53c159032a7aef)heh

toomasv

[11:09](#msg5a6869786117191e61a6fe94)My version is `Red for Windows version 0.6.3 built 29-Dec-2017/16:33:38+02:00`

9214

[11:09](#msg5a6869806117191e61a6ff0b)you can always fall back to latest stable

rebolek

[11:09](#msg5a686985ae53c159032a7b26)@maximvl you can try @gltewalt 's branch, he seems to have fixed it.

maximvl

[11:10](#msg5a686997ae53c159032a7c72)getting branches is too much for me, lol

rebolek

[11:10](#msg5a6869ad98927d57452ce7fa)then you're doomed :ghost:

maximvl

[11:11](#msg5a6869d4e01412265085fb5a)hopefully I will draw enough attention to the problem

[11:11](#msg5a6869de517037a212e9215c)by complaining all the time xD

rebolek

[11:12](#msg5a686a220ad3e04b1b60b52e)Don't worry, I'm with you.

maximvl

[11:13](#msg5a686a3ece68c3bc74f91690)https://i.imgur.com/mP4Owy5.png

[11:13](#msg5a686a4d0ad3e04b1b60b5f1)I don't see the arrows unfortunately

[11:13](#msg5a686a62c95f22546ddafbb3)but I wonder if there's an arrow node2 -&gt; node3

rebolek

[11:15](#msg5a686ac6ae53c159032a844b)@maximvl same here, maybe it's Wine problem?

maximvl

[11:15](#msg5a686ad3d9f895c36054c4d0)it is, for sure :)

toomasv

[11:19](#msg5a686bccc95f22546ddb063a)I have no idea!

maximvl

[11:20](#msg5a686be96117191e61a70d1c)it's not the arrows I wanted to see but how your algorithm performs ;)

[11:20](#msg5a686bf35a9ebe4f75ca16fc)will test it once I get to windows machine

rebolek

[11:20](#msg5a686c015a9ebe4f75ca1761)@maximvl are you on Wine 2 or 3?

maximvl

[11:20](#msg5a686c0de014122650860c33)I wonder if I add `node3 -> node1` in the end, what will happen

[11:20](#msg5a686c175a9ebe4f75ca1802)2.4

toomasv

[11:27](#msg5a686dbbc95f22546ddb1217)

```
do %graph.red
graph [node3 -> node1]
```

!\[simple-graph.png](http://vooglaid.ee/red/simple-graph.png)

[11:28](#msg5a686dfa0ad3e04b1b60c93c)

```
>> graph [node1 -> node2 node3 -> node1]
*** Math Error: math or number overflow
```

maximvl

[11:29](#msg5a686e0dae53c159032a9864)what about this?

```
[node1 -> node2 node2 -> node3 node1 -> node4 node4 -> node3 node3 -> node1]
```

toomasv

[11:34](#msg5a686f3c517037a212e9429c)Circular referencing not allowed (yet!) So, without last one:  
!\[max.png](http://vooglaid.ee/red/max.png)  
Seems it gets confused about node-names :) . Ah, it is because only one parent is allowed now. It's a tree structure.

maximvl

[12:35](#msg5a687d916117191e61a777fa)a-ha, so it's not a graph

[12:36](#msg5a687dd698927d57452d5e20)I did a bit of research and this https://en.wikipedia.org/wiki/Force-directed\_graph\_drawing looks like the most practical way to do it

toomasv

[14:06](#msg5a6892d4ce68c3bc74fa0846)@maximvl What do you mean by "it's not a graph"? :neutral\_face:

maximvl

[14:09](#msg5a68939ed9f895c36055c126)well you yourself said it's a tree :D

[14:10](#msg5a6893d6e01412265086fb24)for example graph can have circular arrows and self-pointing arrows

toomasv

[14:20](#msg5a68964ad9f895c36055d1c6)But I didn't say it's not a graph :wink: . Tree is acyclic connected graph. Mine can be forest also.

greggirwin

[17:26](#msg5a68c1bc4a6b0dd32b40bb86)More great work @toomasv.

toomasv

[17:28](#msg5a68c22e4a6b0dd32b40bfd1) :blush:

nedzadarek

[17:30](#msg5a68c2c0c95f22546ddd3f32)@guibus Maybe you can use `view/tight` or `layout/tight`? Or `at 0x0` at the beginning, for example `view [at 0x0 base red]`.

## Thursday 25th January, 2018

planetsizecpu

[12:02](#msg5a69c7490ad3e04b1b6836ae)Today I started \[this](https://github.com/planetsizecpu/alert/blob/master/alert.red) little project while I'm learning, to do some usable thing!. Somebody may have already developed it, but in any case I have to keep learning.

BeardPower

[12:17](#msg5a69caf0d9f895c3605c65ea)@planetsizecpu Nice. Wouldn't it be more convenient to use the draw dialect for the icons or some Unicode symbols/font?

9214

[12:19](#msg5a69cb62ce68c3bc7400b4b1)@planetsizecpu interesting usage of binary representations

maximvl

[12:22](#msg5a69cbff517037a212f10725)@planetsizecpu I would recommend to change number types to words - easier to type and remember and don't mix camel case and dash-case in symbols ;)

planetsizecpu

[12:22](#msg5a69cc016117191e61aeb843)@BeardPower Of course, I'm just starting, just wanted it to work, I'm aware of it's weight and want to slim down some kb :)

maximvl

[12:23](#msg5a69cc28517037a212f107aa)eg do not use camel-case at all

planetsizecpu

[12:24](#msg5a69cc8f98927d5745348636)@maximvl aah there are too much camel case years in my mind, so I feel a little bit late to change ... :smile:

maximvl

[12:25](#msg5a69ccd4ce68c3bc7400be3e)well it's your mind so you can do whatever you want with it ;)

planetsizecpu

[12:26](#msg5a69ccf50ad3e04b1b685a4d)@9214 just wanted it to run stand-alone without other files

9214

[12:27](#msg5a69cd1598927d574534894d)@planetsizecpu yes, I wonder if Red will allow to pack all resources together in one exe

[12:27](#msg5a69cd20ce68c3bc7400c041)like Rebol's encap I believe

BeardPower

[12:28](#msg5a69cd5e517037a212f10f34)It would be nice to have some asset management like a virtual filesystem with compression and encryption.

9214

[12:29](#msg5a69cd8c517037a212f110af):+1:

planetsizecpu

[12:29](#msg5a69cd97ae53c15903325040)That's my first approach, to take pbrush and paint the icons, when I have learned about unicode management, I will try to improve it.

rebolek

[12:30](#msg5a69cdcc0ad3e04b1b685ff8)@BeardPower do you think there's something missing to do it now?

9214

[12:30](#msg5a69cdf4517037a212f11292)@rebolek some high-level DSL wrapper on top of existing functionality

rebolek

[12:31](#msg5a69ce224a6b0dd32b4655a7)It would be of course better once we get ports, but you can fake filesystem with `map!` or `object!` easily.

BeardPower

[12:33](#msg5a69ce9d5a9ebe4f75d1ef67)@rebolek for big files and high throughput, support for memory mapped files is missing. Besides that, all is available to do it now.

[12:34](#msg5a69cebc98927d5745349311)But @qtxie already confirmed, that these are coming.

[12:40](#msg5a69d03dd9f895c3605c84e3)There are two interesting virtual file systems, which could be ported: \[PhysicsFS](https://www.icculus.org/physfs/) and \[ttvfs](https://github.com/fgenesis/ttvfs) / \[liblvpa](https://github.com/fgenesis/liblvpa)

[12:43](#msg5a69d10898927d574534a1b2)@rebolek I think this also could be interesting for you: \[Tea Files](http://discretelogics.com/teafiles/)

rebolek

[12:47](#msg5a69d1ef4a6b0dd32b466a16)@BeardPower thanks, the specification looks simple enough, I may write parser/emitter, so I'll be prepared when ports will come ;)

BeardPower

[12:50](#msg5a69d290c95f22546de2f52f):+1: Unfortunately my Red skills are lacking behind.

[12:53](#msg5a69d335ce68c3bc7400e7be)It would be great, if you could "prepare" some tutorial, how you are approaching/writing it. I really need some Red tokens to spend...

[12:55](#msg5a69d3d9c95f22546de2fbce)I appreciate everyone's effort and time.

9214

[12:56](#msg5a69d41198927d574534b09f)in the end it all boils down to specifying PEG and inserting `paren!`s in the right places :)

BeardPower

[12:57](#msg5a69d43e5a9ebe4f75d21225)Sorry, what's PEG again?

9214

[12:57](#msg5a69d447c95f22546de2fe80)\[parsing expression grammar](https://en.wikipedia.org/wiki/Parsing\_expression\_grammar)

rebolek

[12:58](#msg5a69d493ce68c3bc7400efc9)@BeardPower I may. This format looks simple enough to be good material for a tutorial.

9214

[12:59](#msg5a69d4a3517037a212f13b65)@rebolek :red\_circle:

BeardPower

[12:59](#msg5a69d4acd9f895c3605c9fab)Ah, thanks! Sometimes I'm stuck in abbreviation hell. :+1:

9214

[13:00](#msg5a69d4d1d9f895c3605ca0c9)@rebolek and don't forget to fix your "R/S in Red" invisible article

rebolek

[13:00](#msg5a69d4ffc95f22546de3024f)@9214 Damn, why do I have to fix it every few months...

BeardPower

[13:00](#msg5a69d5084a6b0dd32b467c43)@rebolek Awesome.

9214

[13:02](#msg5a69d55d6117191e61aeeff7)@rebolek because someone really loves to hack on your blog :neckbeard:

rebolek

[13:08](#msg5a69d6e34a6b0dd32b468759):D

abdllhygt

[13:42](#msg5a69deb9ae53c1590332bb68)hi!

[13:43](#msg5a69df0e517037a212f17d62)can text-list alternatives the data-grid? For only show, not edit.

rebolek

[13:50](#msg5a69e08b5a9ebe4f75d26487)Hi @abdllhygt `text-list` provides one column only, there is no inbuild data grid so far. You either need to write your own or you can take a look at `text-table` here: https://gitlab.com/rebolek/red-styles/

abdllhygt

[13:54](#msg5a69e196517037a212f18fb4)@rebolek text-table works in `view`?

rebolek

[13:54](#msg5a69e1a9517037a212f19007)@abdllhygt of course, if you know how ;)

[13:55](#msg5a69e1e8ae53c1590332d0d6)it's a custom style, so it's bit harder to use it, but not impossible

abdllhygt

[13:55](#msg5a69e1ed5a9ebe4f75d26e97)i need a tutorial :)

rebolek

[13:56](#msg5a69e1fcd9f895c3605cf110):)

[13:56](#msg5a69e20098927d57453508c5)just a minute

abdllhygt

[13:57](#msg5a69e2326117191e61af4499)Appearance is good?

rebolek

[13:58](#msg5a69e26c5a9ebe4f75d27173)I don't know, I like it ;)  
https://i.imgur.com/UTzFbIn.gif

abdllhygt

[13:59](#msg5a69e2a4517037a212f1962d)imgur doesn't work in here :)

[13:59](#msg5a69e2aa5a9ebe4f75d272d2)i try proxy

rebolek

[13:59](#msg5a69e2c8ce68c3bc7401461d)@abdllhygt clone the repo and run `%demo.red`, you will see it in action

abdllhygt

[14:00](#msg5a69e30d0ad3e04b1b68e5a1)I like it too :) this is good @rebolek

BeardPower

[14:01](#msg5a69e34aae53c1590332daa2)It deserves the predicate "TooMassive" :smile:

[14:03](#msg5a69e395ae53c1590332dd1f)Now add some mini real-time chart for every row in a column :+1:

abdllhygt

[14:03](#msg5a69e3adc95f22546de363fc)Oh, it needs xml-lib

[14:05](#msg5a69e4186117191e61af51d5)how do i download red-tools?

rebolek

[14:06](#msg5a69e46cc95f22546de368b5)https://github.com/rebolek/red-tools

[14:06](#msg5a69e4826117191e61af54f6)@abdllhygt Hm, I see that the demo isn't working right now, sorry, I need to fix it

[14:07](#msg5a69e48bd9f895c3605d0416)But I can't right now.

[14:07](#msg5a69e4adae53c1590332e36a)I will let you know once it's ready and will add some tutorial also.

[14:08](#msg5a69e4e6ae53c1590332e4d3)(at least it's not working on Wine, maybe it's fine on Windows, I can't test it)

abdllhygt

[14:08](#msg5a69e4fb517037a212f1a7b4)

```
*** Script Error: graph-style has no value
*** Where: insert
*** Stack:
```

rebolek

[14:09](#msg5a69e51c4a6b0dd32b46e24f)@abdllhygt redownload the repo, I've fixed it

abdllhygt

[14:09](#msg5a69e51f6117191e61af57da)@rebolek thanks, i wait the tutorials

rebolek

[14:10](#msg5a69e54bc95f22546de36e6a)But here I see empty table that crashes on mouse over, but that may be caused by Wine, I can't tell for sure.

abdllhygt

[14:12](#msg5a69e5e66117191e61af5f61)new error:

```
*** Script Error: VID - invalid syntax at: [on [gp/extra/mode: 'spline gp/extra/redraw gp] radio]
*** Where: do
*** Stack: layout layout layout cause-error
```

rebolek

[14:13](#msg5a69e60bae53c1590332eb41)Ok, you need to wait until I get home, thanks for the report.

[14:14](#msg5a69e63098927d57453520bc)I've been doing some changes recently and probably messed up something.

abdllhygt

[14:14](#msg5a69e6325a9ebe4f75d28c79)@rebolek i will wait :)

toomasv

[14:27](#msg5a69e9634a6b0dd32b46ff7a) :tada:  
!\[dashes-circ.png](http://vooglaid.ee/red/dashes-circ.png)

rebolek

[14:34](#msg5a69eb0bd9f895c3605d2bc1):)

toomasv

[14:44](#msg5a69ed68ae53c15903331a2a) :sweat\_smile:

Phryxe

[14:50](#msg5a69eeabce68c3bc740192b9)@toomasv :thumbsup:

rebolek

[14:57](#msg5a69f0526117191e61afa327)Not sure why, but I can't see the picture here and it does not work as link also. To get to the picture, I must do some black gitter magic.

9214

[14:58](#msg5a69f07bce68c3bc74019ed5)this means only one thing - your rig is totally hacked

[14:58](#msg5a69f07f0ad3e04b1b693f3a)and you're doomed :ghost:

toomasv

[14:58](#msg5a69f08c4a6b0dd32b4730ae)\[dashes-circ.png](http://vooglaid.ee/red/dashes-circ.png)

rebolek

[15:00](#msg5a69f0fece68c3bc7401a1b2):open\_mouth:

ne1uno

[16:07](#msg5a6a00d198927d574535cab3)images don't work from the irc bridge. I can open them if I open gitter in a browser. maybe it sets a session cookie? they probably don't want anyone to direct link them anywhere

rebolek

[16:24](#msg5a6a04c5d9f895c3605dd358)@9214 hahaa, I am not hacked totally, on phone it works right!

9214

[16:26](#msg5a6a05246117191e61b0346d)maybe someone makes you think that everything is right by stopping hacking at the time when you check your phone? :shipit:

[16:27](#msg5a6a055698927d574535eac0)maybe someone uses a time machine

[16:27](#msg5a6a05720ad3e04b1b69c4ac)world is a strange place indeed

rebolek

[16:41](#msg5a6a08ccce68c3bc74022f70):worried:

toomasv

[16:42](#msg5a6a090bae53c1590333cfe8)\[dotted](http://vooglaid.ee/red/dotted.png)  
!\[dotted.png](http://vooglaid.ee/red/dotted.png)

[17:09](#msg5a6a0f4f517037a212f2b157)If there is no easier way of doing this, it seems impractical:

```
pat-f: func [c d l s][collect [
   repeat i 360 / l [keep reduce ['arc c d (i - 1 * l) s 'closed]]
]]
view compose/deep [image draw [
   pen pattern 100x100 [fill-pen black (pat-f 50x50 50x50 8 1)][circle 50x50 40] 
   pen pattern 100x100 [(pat-f 70x30 30x30 15 1)][circle 70x30 20]
]]
```

rebolek

[20:01](#msg5a6a3787ae53c1590334fd82)@abdllhygt `%demo.red` with `text-table` seems to work fine on Virtual Box with W10, so it was probably just Wine problem. I will write some tutorial and let you know when it's ready.

## Friday 26th January, 2018

ralfwenske

[05:52](#msg5a6ac20298927d574539c6df)In mac console following works fine:

```
>> print read request-file
Git commands even a monkey can understand
>> print read to-file request-file
Git commands even a monkey can understand
>> print read to-red-file request-file
Git commands even a monkey can understand
>>
```

On mac the following fails

```
Red [needs 'View]
view [ below
    button "1 to-red-file request-file" [print "btn 1" f: to-red-file request-file]
    button "2 to-file request-file" [print "btn 2" f: to-file request-file]
    button "3 request-file" [print "btn 3" f: request-file]
    button "read & show" [print "read & show" a/text: read f]
    return
    a: area 400x200
]
```

result is

```
macmini:red-tests ralfwenske$ ~/Dropbox/os/mac/red --cli /Users/ralfwenske/Dropbox/red-tests/test-requestfile.red
btn 1
*** Script Error: to-red-file does not allow function! for its path argument
*** Where: to-red-file
*** Stack: view do-events do-actor do-safe to-red-file
btn 2
read & show
*** Access Error: cannot open: %?function?
*** Where: read
*** Stack: view do-events do-actor do-safe
btn 3
read & show
*** Script Error: f is missing its face argument
*** Where: f
*** Stack: view do-events do-actor do-safe f
```

whereas the same code works as expected on win10:

```
PS C:\Users\Ralf\Dropbox\red-tests> C:/Users/Ralf/Dropbox/os/win/red.exe --cli c:\Use
rs\Ralf\Dropbox\red-tests\test-requestfile.red
btn 1
read & show
btn 2
read & show
btn 3
read & show
```

Can anyone confirm this - and if so is it a known issue?

Phryxe

[05:56](#msg5a6ac329c95f22546de81ccc)@ralfwenske Compare https://github.com/red/red/issues/3207

ralfwenske

[05:58](#msg5a6ac374ce68c3bc7405e9e4)@Phryxe ahhh - thank you

rebolek

[07:18](#msg5a6ad6604a6b0dd32b4c01dd)@BeardPower there's one problem with Tea Files, it needs 64 bit integers (I can leave them in hexa for now).

abdllhygt

[10:24](#msg5a6b01cfc95f22546de95e05)@rebolek but i work with wine linux :/

rebolek

[10:51](#msg5a6b0826ae53c159033918ed)@abdllhygt I see... I may try to find where exactly the problem is and fix it, if there's a way, but that will take time.

abdllhygt

[10:52](#msg5a6b088b0ad3e04b1b6ee086)@rebolek i think to develop a commercial app with red. now i can develop with pascal if you don't fixed :)

[10:53](#msg5a6b089b98927d57453b381e)but i want to do with red

rebolek

[10:56](#msg5a6b0944ae53c1590339201b)@abdllhygt well, if it crashes, it's bug in Red, not in text-table ;)

abdllhygt

[10:57](#msg5a6b0989ce68c3bc74074dc3)@rebolek :D no, it's bug in wine

[10:58](#msg5a6b09c6494bd0f53028fd49)do you use webbrowser for text-table?

rebolek

[10:58](#msg5a6b09d9494bd0f53028fd81)webbrowser? how?

abdllhygt

[10:58](#msg5a6b09e84a6b0dd32b4d1e7a)webbrowser in gui

rebolek

[10:59](#msg5a6b09fb494bd0f53028fdf6)Ah, no. It's done in Draw.

abdllhygt

[10:59](#msg5a6b0a04ce68c3bc7407522b)it's good

rebolek

[10:59](#msg5a6b0a0f5a9ebe4f75d8c6f0)thanks

abdllhygt

[11:07](#msg5a6b0bf05a9ebe4f75d8d1f5)@rebolek bug is in `radio "spline" on [gp/extra/mode: 'spline gp/extra/redraw gp]` line. I delete this line and it works without table :)

[11:07](#msg5a6b0c0540259f1a33acdfa5)in demo.red file

rebolek

[11:08](#msg5a6b0c43494bd0f530290b0b)@abdllhygt if you checkout `table-styles` branch, then the table shows data, but still crashes on mouse over in Wine.

[11:10](#msg5a6b0c95494bd0f530290cff)@abdllhygt just delete `on`, not sure why it throws error for you, but not here.

abdllhygt

[11:15](#msg5a6b0db6c95f22546de9a002)it works but doesn't show data.

[11:20](#msg5a6b0ef6ce68c3bc74076de9)lazarus ide (pascal) is gpl/lpgl license. Can i develop a commercial app with it?

rebolek

[11:23](#msg5a6b0fb30ad3e04b1b6f06b4)@abdllhygt are you on `table-styles` branch, or on `main` branch.

abdllhygt

[11:33](#msg5a6b12206117191e61b5aff9)what do you means?

[11:34](#msg5a6b124140259f1a33ad0193)`wine red.exe redstyles/demo.red`

rebolek

[11:40](#msg5a6b13b398927d57453b7137)I mean git branch. How did you downloaded the code?

toomasv

[11:55](#msg5a6b171a0ad3e04b1b6f2cf3)Some experiments with \[dashed circles](https://gist.github.com/toomasv/a9f6ae187484fa6629a3e4756fa3ed8b)  
\[Static](http://vooglaid.ee/red/circles-dashed.png)  
!\[circles-dashed.png](http://vooglaid.ee/red/circles-dashed.png)  
And \[dynamic](http://vooglaid.ee/red/dashed-anim.gif)  
!\[dashed-anim.gif](http://vooglaid.ee/red/dashed-anim.gif)

abdllhygt

[12:00](#msg5a6b1868ce68c3bc7407a3fa)@rebolek i downloaded clone with tar.gz (text-table) and zip (tools)

rebolek

[12:01](#msg5a6b188d494bd0f530294ffa)So you don't use `git`?

abdllhygt

[12:01](#msg5a6b1891c95f22546de9db00)no

rebolek

[12:01](#msg5a6b18aac95f22546de9db7b)Ok. I let you know when the fixed version will be in main branch.

abdllhygt

[12:02](#msg5a6b18ce40259f1a33ad258c)@rebolek i will wait

BeardPower

[13:06](#msg5a6b27ca4a6b0dd32b4dc338)@toomasv Awesome!

toomasv

[13:06](#msg5a6b27e140259f1a33ad7d8a):)

9214

[13:06](#msg5a6b27f340259f1a33ad7de1)@toomasv I remembered that first thing I wanted to do once I learn View and Draw is to model solar system

BeardPower

[13:07](#msg5a6b280b0ad3e04b1b6f9000)@9214 In 3D, I hope ;-)

rebolek

[13:08](#msg5a6b28675a9ebe4f75d97950):D

BeardPower

[13:11](#msg5a6b28f940259f1a33ad83f0)@rebolek  
&gt; @BeardPower there's one problem with Tea Files, it needs 64 bit integers (I can leave them in hexa for now).

That's fine. To get the full performance, MMF are needed as well. This wouldn't smaller the value of your work. Once these features are available, it's an additional lesson to adapt the code to 64-bit and MMF. :+1:

Phryxe

[13:25](#msg5a6b2c3d5a9ebe4f75d99018)@toomasv :bow:

toomasv

[15:02](#msg5a6b4321c95f22546dead52c)\[Self-portrait](http://vooglaid.ee/red/self-portrait.png)  
!\[self-portrait.png](http://vooglaid.ee/red/self-portrait.png)

9214

[15:03](#msg5a6b43404a6b0dd32b4e6553)new userpic?

rebolek

[15:04](#msg5a6b4378ce68c3bc7408a7a8):clap:

toomasv

[15:10](#msg5a6b44fb5a9ebe4f75da2f60)@9214 Hmm.. May be

9214

[15:11](#msg5a6b452cce68c3bc7408b148)@toomasv would be cool if you can come up with an algorithm for generating identicons from github usernames

[15:12](#msg5a6b45446117191e61b6ed28)i.e. emit draw commands from hashed username or something like that

BeardPower

[15:33](#msg5a6b4a51c95f22546deb03d3)Prepare for horrifying pics.

[15:35](#msg5a6b4ac7494bd0f5302a89e5)@toomasv The picture is missing some glasses :smile:

9214

[15:35](#msg5a6b4ad46117191e61b7129e)and Red hat

toomasv

[15:56](#msg5a6b4f9c40259f1a33ae7784)Oops! Sorry, forgot \[glasses](http://vooglaid.ee/red/self-portrait.png) on table while taking snapshot.  
!\[self-portrait.png](http://vooglaid.ee/red/self-portrait.png)

9214

[15:56](#msg5a6b4fb6494bd0f5302aaad9):joy:

planetsizecpu

[17:16](#msg5a6b6270c95f22546deba921)@toomasv Fine!, it looks like me in the morning when I get up :smile:

[17:19](#msg5a6b6318c95f22546debac9a)@toomasv ah, it's your self portrait, so we will recognize ourselves if we are on the street :smile:

toomasv

[19:32](#msg5a6b825e4a6b0dd32b4ffd68)\[Eye-exercises](http://vooglaid.ee/red/self-anim.gif)  
!\[self-anim.gif](http://vooglaid.ee/red/self-anim.gif)

9214

[19:34](#msg5a6b82b64a6b0dd32b4fff7e)https://www.youtube.com/watch?v=Yxsnbqp44ak

## Saturday 27th January, 2018

PeterWAWood

[02:00](#msg5a6bdd26ce68c3bc740c0be3)@toomasv Pure magic!!!

toomasv

[05:24](#msg5a6c0d0a40259f1a33b22e7b):) \[Trained eyes](http://vooglaid.ee/red/eyes.gif)

ghost~5680c5f416b6c7089cc058a5

[13:03](#msg5a6c78ac6117191e61bc943d)@toomasv Awesome!!! :clap:

toomasv

[13:10](#msg5a6c7a2de217167e2c08d0bd) :bowtie:

luce80

[13:24](#msg5a6c7d83ce68c3bc740e6711)When I run the code below directly (NOT from red console) I get a "tween" window ;) . I am on `Red for Windows version 0.6.3 built 27-Nov-2017/19:24:27+01:00` . Can anyone confirm it?

```
Red []

lay: layout [canvas: image 100x100]
view/no-wait lay
unview/only lay
view/options lay [offset: 50x50]
```

9214

[13:25](#msg5a6c7de20ad3e04b1b75f720)@luce80 well, it's because you're using same tree of faces in each case

[13:26](#msg5a6c7dea0ad3e04b1b75f7ae)what did you expect?

[13:27](#msg5a6c7e294a6b0dd32b542637)oh, I misread, sorry. Yeah, if I run it from script I get the glitch you're talking about

[13:29](#msg5a6c7ea30ad3e04b1b75fa2a)\[!\[Peek 2018-01-27 18-28.gif](https://files.gitter.im/red/red/gui-branch/PkSM/thumb/Peek-2018-01-27-18-28.gif)](https://files.gitter.im/red/red/gui-branch/PkSM/Peek-2018-01-27-18-28.gif)

ghost~5680c5f416b6c7089cc058a5

[13:34](#msg5a6c7fe3ae53c15903403f66)@9214 Can't reproduce, which build are you on?

[13:34](#msg5a6c7fef98927d5745424cb0)@luce80 Can you try with latest automated build?

9214

[13:35](#msg5a6c8007494bd0f5303032cb)@nc-x latest, on Wine

ghost~5680c5f416b6c7089cc058a5

[13:35](#msg5a6c803e6117191e61bcb1f1)\[!\[t.gif](https://files.gitter.im/red/red/gui-branch/oOLv/thumb/t.gif)](https://files.gitter.im/red/red/gui-branch/oOLv/t.gif)

9214

[13:36](#msg5a6c80685a9ebe4f75e01d1b)@nc-x W10?

ghost~5680c5f416b6c7089cc058a5

[13:36](#msg5a6c8071ce68c3bc740e7251)Yes

9214

[13:37](#msg5a6c8086494bd0f5303034e0)IIRC mine emulates Win7

luce80

[14:04](#msg5a6c86dece68c3bc740e8fc7)@nc-x Same behaviour with: `Red for Windows version 0.6.3 built 27-Jan-2018/15:00:13+01:00` on Win7

ghost~5680c5f416b6c7089cc058a5

[14:08](#msg5a6c87d46117191e61bcd411)Maybe related to Windows 7

[14:08](#msg5a6c87eb98927d57454274a4)Can anyone on windows 10 reproduce this issue?

[14:08](#msg5a6c87f64a6b0dd32b5453bc)@luce80 Please open an issue (along with the screen recording `https://files.gitter.im/red/red/gui-branch/PkSM/Peek-2018-01-27-18-28.gif`)

toomasv

[14:09](#msg5a6c88306117191e61bcd5b1)I have 23 Jan build on W10, and the code runs OK, i.e. no "tween".

luce80

[17:49](#msg5a6cbb9f98927d5745435e6b)What am I missing here ?

```
system/view/VID/styles/newpanel: [
	default-actor: on-down
	template: [
		type: 'panel
		pane: reduce [
			make face! [
				type: 'base
				size: 10x50
			]
		]
	]
]
view [button "hi" newpanel]

*** Script Error: path face/parent/type is not valid for none! type
*** Where: find
*** Stack: view layout foreach-face foreach-face
```

9214

[18:05](#msg5a6cbf674a6b0dd32b556029)@luce80 you haven't specified parent face for your `base`, and I'm not even sure if it's possible to do so

luce80

[18:13](#msg5a6cc156e217167e2c0a118e)@9214 Yess! Just add `init [face/pane/1/parent: face/pane]` . Thanks!

9214

[18:14](#msg5a6cc16c6117191e61bde639)@luce80 nice!

## Sunday 28th January, 2018

nedzadarek

[12:19](#msg5a6dbfda4a6b0dd32b594a8b)Do you think `template` should use default values as `style`?  
I mean we can do this with `style` without setting the size:

```
view [
    style foo: base red
    foo "hey"
]
```

but with `template` you have to specify all values, `size` especially:

```
system/view/VID/styles/foo: [
  template: [
    type: 'base
    color: red
    size: 100x100
  ]
]
view [foo "hey"]
```

toomasv

[13:07](#msg5a6dcb1d98927d57454784ad)@nedzadarek I don't think so. `template` is there to define default values, IMO

## Monday 29th January, 2018

BeardPower

[13:24](#msg5a6f20814a6b0dd32b6007c3)@rebolek I'm trying to run your chart demo, but somehow I cannot find \*coinbase.red\*. Can you please lead me to it, as it was not needed before. Thanks!

rebolek

[13:26](#msg5a6f21084a6b0dd32b600b17)@BeardPower open the `demo.red` file and change `offline?` to `false`. That should force downloading data online. I will fix it and add some demo data to the repository. Thanks for letting me know.

BeardPower

[13:27](#msg5a6f2128ae53c159034bf32b)@rebolek Thank you. My pleasure :)

[13:31](#msg5a6f2226ce68c3bc741a324e)@rebolek UI opens and I have the loading circle of death -&gt; crashes after eating up about 1.5GB of RAM.

[13:32](#msg5a6f227b6117191e61c867eb)I will try to get some error logs in the evening.

rebolek

[13:32](#msg5a6f227cac509d207d8fbfdb)ouch

BeardPower

[13:33](#msg5a6f229a4a6b0dd32b601929)I used a fresh git pull on Red.

rebolek

[13:33](#msg5a6f229e6117191e61c8689c)I will take a look at it in the evening when I have access to Win VM.

BeardPower

[13:34](#msg5a6f22e0ce68c3bc741a3666)I will try to run it through VSC, as it prints an error code, when crashing. The REPL unfortunately does not, as it's killed together with the app.

nedzadarek

[14:42](#msg5a6f32dc4a6b0dd32b60876a)@toomasv is there a way to inherit some values?  
I can do this:

```
system/view/vid/styles/foo: [template: [type: 'base color: red]]
 system/view/vid/styles/baz: system/view/vid/styles/foo
 append system/view/vid/styles/baz/template [size: 222x222]
```

but when I change the `foo`, the `baz` will have the old values.

toomasv

[15:37](#msg5a6f3fa298927d57454ec8a1)@nedzadarek What do you mean?

```
>> system/view/vid/styles/foo: [template: [type: 'base color: red]]
== [template: [type: 'base color: red]]
>>  system/view/vid/styles/baz: system/view/vid/styles/foo
== [template: [type: 'base color: red]]
>>  append system/view/vid/styles/baz/template [size: 222x222]
== [type: 'base color: red size: 222x222]
>> system/view/vid/styles/foo
== [template: [type: 'base color: red size: 222x222]]
>> put system/view/vid/styles/foo/template 'size 200x200
== 200x200
>> system/view/vid/styles/baz
== [template: [type: 'base color: red size: 200x200]]
```

[15:40](#msg5a6f40575a9ebe4f75ececcf)But values in `baz`are not inherited - they are the \*same* as in `foo`.

rebolek

[15:43](#msg5a6f410f4a6b0dd32b60eb5d)@nedzadarek you can `copy/deep` the style, so the blocks won't be same.

BeardPower

[20:29](#msg5a6f841a6117191e61cb070f)@rebolek You posted some time ago, that you implemented some basic widgets like button, slider, etc, with draw. Is it possible to share them? I want to make some measurements with draw based widgets and C# WPF widgets,

rebolek

[20:44](#msg5a6f87c54a6b0dd32b62c5a1)@BeardPower I wrote that it's \*easy* to implement, I did slider/scroller that is available in \[red styles](https://gitlab.com/rebolek/red-styles/). Actually doing `button` as the easiest interactive style would be nice tutorial. After I fix the demo ;)

BeardPower

[20:47](#msg5a6f885d40259f1a33c26d97)@rebolek Ah, sorry for the misunderstanding. That would be very nice. I want to have/kindly asking of some kind of template from someone who knows better than me, how it's done. Kind of "best practices".

[20:51](#msg5a6f896cce68c3bc741ce3af)Regarding the demo: unfortunately I cannot get an error log from VCS, as red.exe (the one with the Rebol compiler) is not supporting some styles of your demo. It will only log an error, if run with red.exe.

rebolek

[20:52](#msg5a6f89a198927d574550b840)@BeardPower no problem, I am looking at it right now.

BeardPower

[20:53](#msg5a6f89acce68c3bc741ce5fa)Much appreciated!

rebolek

[21:00](#msg5a6f8b7840259f1a33c284a7)@BeardPower I've added missing datafiles, can you please check, if it works?

BeardPower

[22:20](#msg5a6f9e3be217167e2c180ff2)Was afk, will check now.

[22:24](#msg5a6f9f3aae53c159034f495c)@rebolek It crashed right after the UI is appearing.

[22:32](#msg5a6fa1114a6b0dd32b6371b9)If I'm copy&amp;paste the code without loading data, the following error message is printed:

```
Red [
	Title: "Text table demo"
]

do %../red-tools/xml.red
do %../red-tools/html-tools.red
do %../red-tools/json.red

do %scroller.red
do %text-table.red
do %chart.red

main: [
	tab-panel [
		"Text-table" [
			button "test" [
				load-data
			]
			ff: field 400 [
				probe tt/extra/cell-index
				tt/extra/set-cell-content tt tt/extra/cell-index ff/text
				tt/extra/draw-table tt
			]
			return
			tt: text-table ; FIXME: Can't use T here, why?
			scroller
			return
			text "X padding" slider 40% [tt/extra/cell-padding/x: to integer! 20 * face/data tt/extra/draw-table tt] 
			text "Y padding" slider 40% [tt/extra/cell-padding/y: to integer! 20 * face/data tt/extra/draw-table tt]
			check "Alternate colors?" [tt/extra/alt-color?: face/data tt/extra/draw-table tt]
			return
			text "Background" field "220.250.220" [tt/extra/background: to tuple! face/data tt/extra/draw-table tt]
			text "Border" 
			radio "Full" [tt/extra/row-border: 'full tt/extra/draw-table tt]
			radio "Horizontal" [tt/extra/row-border: 'horizontal tt/extra/draw-table tt]
			radio "None" [tt/extra/row-border: none tt/extra/draw-table tt]
			return
			text "Highlight"
			radio "Cell" [tt/extra/highlight/style: 'cell]
			radio "Row" [tt/extra/highlight/style: 'row]
			radio "Column" [tt/extra/highlight/style: 'column]
			return
			text "Stats: 0" 400 rate 1 on-time [face/text: rejoin ["Stats: " stats]]
		]
		"Chart" [
			gp: chart
			return
			radio "line"      [gp/extra/mode: 'line gp/extra/redraw gp]
			radio "spline" on [gp/extra/mode: 'spline gp/extra/redraw gp]
			radio "box"       [gp/extra/mode: 'box gp/extra/redraw gp]
		]
	]
]

insert main scroller-style
main: layout main
view/no-wait main

do-events
```

```
>> main: layout main
*** Script Error: VID - invalid syntax at: [text-table scroller return]
*** Where: do
*** Stack: layout layout layout cause-error
```

nedzadarek

[23:04](#msg5a6fa89aae53c159034f7dbc)@toomasv That's weird. Last time it worked differently. Well never mind.  
@rebolek Yes, copy is good.

It's nice that template takes functions (`system/view/vid/styles/qux/template/color: does [system/view/vid/styles/baz/template/color]`) and `path!` (`system/view/vid/styles/qux/template/color: 'system/view/vid/styles/baz/template/color`)

## Tuesday 30th January, 2018

rebolek

[04:01](#msg5a6fee0cae53c1590350a9eb)@BeardPower This error: `Script Error: VID - invalid syntax at: [text-table scroller return]` is triggered when you want to run the demo twice in same console. I'm not sure what's causing it, you have to restart the console.

[04:02](#msg5a6fee5147505419173ef19b)Are you running this on Wine? It crashes for me under Wine (when I move mouse over the UI), but works fine on W10 in VirtualBox.

BeardPower

[10:21](#msg5a70470fce68c3bc74208dbe)@rebolek No, I'm running it on Windows 10. I ran it from a fresh console.

```
>> about
Red for Windows version 0.6.3 built 29-Jan-2018/14:17:10+01:00
```

rebolek

[10:47](#msg5a704d47ae53c159035297bc)@BeardPower ok, thanks. I am using some old version, so I will try to recompile, it may be some regression in newer Red.

[17:11](#msg5a70a731ae53c1590354e88a)@BeardPower I've tested `%demo.red` with latests source and can confirm the crash. It is certainly caused by #3156.

[17:12](#msg5a70a761e217167e2c1dd8e7)From now, I am going to call that bug `MEBIR` as in the Most Evil Bug In Red.

gltewalt

[17:21](#msg5a70a9aa494bd0f530454bea)Fixed in my version?

[17:43](#msg5a70aea94750541917438d3a)I let loose arrows into MEBIR, but does he still live?

9214

[17:43](#msg5a70aed36117191e61d1bec3)you can't fight the true evil

rebolek

[18:03](#msg5a70b367e217167e2c1e310c)@gltewalt I will try to compile gui-console with your version, I think it should be fixed there

[18:26](#msg5a70b8d598927d57455768da)@gltewalt yes, your version works fine

BeardPower

[18:30](#msg5a70b9bf475054191743d15f)@rebolek That's unfortunate. I want to create some widgets with skinning/theming support. Would you suggest to implement each widget in a separate file or some global widgets.red file?

gltewalt

[18:35](#msg5a70bb05494bd0f53045be5d):sparkles:

toomasv

[18:38](#msg5a70bbb4494bd0f53045c262)@rebolek I don't understand, why don't you use as workaround explicit type-setting, as

```
>> c: context [f: func[a][""]]
== make object! [
    f: func [a][""]
]
>> t: to-string c/f []
== ""
```

rebolek

[18:39](#msg5a70bbc8475054191743de73)@BeardPower I would suggest one file per style, for easier maintenance.

[18:40](#msg5a70bc134a6b0dd32b699304)@toomasv because this bug affects lot of code and using older build is easier than changing every file that crashes.

BeardPower

[18:40](#msg5a70bc29ac509d207d990e59)@rebolek :+1:

toomasv

[18:41](#msg5a70bc6f494bd0f53045c692) :weary:

rebolek

[18:45](#msg5a70bd3ce217167e2c1e6e08)let's hope that the crypto tour ends soon and Nenad or Qtxie could take a look at it. It doesn't require that much work, because @gltewalt 's branch seems to fix it.

BeardPower

[19:12](#msg5a70c3b86117191e61d2461f)@rebolek How does Red know/dissect the words under the hood, because I can type:

```
style b: base green 120x120 b
```

or

```
style b: base 120x120 green b
```

[19:14](#msg5a70c407e217167e2c1e969e)Does it use a parser to check the different sequences?

rebolek

[19:18](#msg5a70c51098927d574557b24c)@BeardPower VID is actually not using `parse` but `while` loop that reads the dialect.

[19:19](#msg5a70c5514a6b0dd32b69cecf)But it is parser anyway and the order of arguments to styles is not strict.

[19:23](#msg5a70c623ce68c3bc7423d143)If you are interested in details, it's in `%red/modules/view/VID.red`, functions `layout` for parsing layout and `fetch-options` for parsing style's arguments.

BeardPower

[19:24](#msg5a70c67398927d574557bdb6)Thanks!

[19:27](#msg5a70c72e7dcd63481ff7ee6e)I just read about macros to be used as a DSL compiler (we discussed the speed of parse some time ago). Very interesting.

[23:39](#msg5a71023a4750541917458728)@rebolek Thanks to your slider code, I'm getting the hang of it :+1:

[23:40](#msg5a71025136de78850cce3988)And yes, it's easy an awesome!

## Wednesday 31st January, 2018

nedzadarek

[00:21](#msg5a710c046117191e61d3ed94)@rebolek so when you type `style ...`, `fetch-options` is called, right?

```
f: :system/view/vid/fetch-options
system/view/vid/fetch-options: func spec-of :f append [print 'hey] body-of :f
view [style b: base 120x120 green b]
```

Why the above code doesn't work (it should print `hey`)?

BeardPower

[00:36](#msg5a710f717dcd63481ff98e1a)Are there only opaque colors supported for the draw dialect?

nedzadarek

[00:37](#msg5a710fdbe217167e2c205dce)@BeardPower `transparent` `view [base loose red base loose transparent "ppp"]`

BeardPower

[00:38](#msg5a7110097dcd63481ff990c2)@nedzadarek Thanks!

gltewalt

[02:06](#msg5a7124a298927d574559bc2c)I think `help tuple!` will show all the predefined colors

BeardPower

[02:13](#msg5a712650ce68c3bc7425cb48)@gltewalt Yes, thanks. I was just missing the `transparent` keyword for view.

toomasv

[04:21](#msg5a7144467dcd63481ffa6fba)@BeardPower You can use alfa with all colors (tuples):

```
view [image draw [
   fill-pen 40.100.130 box 15x50 80x70 
   fill-pen 255.205.40.150 box 10x10 60x60 
   fill-pen 178.34.34.150 circle 60x60 30
]]
```

rebolek

[05:37](#msg5a715631475054191746fabd)@BeardPower `fetch-options` is called from `layout`

[08:30](#msg5a717e984a6b0dd32b6d7368):point\_up: \[31. leden 2018 0:39](https://gitter.im/red/red/gui-branch?at=5a71023a4750541917458728) cool!

9214

[08:32](#msg5a717f2d98927d57455b5fde)@BeardPower `transparent` is a color too

```
>> transparent
== 0.0.0.255
```

nedzadarek

[10:29](#msg5a719a7498927d57455c0406)@BeardPower  
It's interesting that we can just define colors. We need to just set transparency (alpha, 4th value, here 222). It doesn't have to be fully transparent/opaque :

```
foo: 222.11.222.222
view [base yellow "the yellow block" base loose foo "you can move me over the yellow block"]
```

@rebolek &gt; `fetch-options` is called from `layout`

so when I do `view layout [style b: base red b]`, `fetch-options` should be called?

If yes, then I tried and it didn't work:

```
f: :system/view/vid/fetch-options
system/view/vid/fetch-options: func spec-of :f append [print 'hey] body-of :f
view layout [style b: base 120x120 green b]
```

rebolek

[11:16](#msg5a71a5aa7dcd63481ffc915f)@nedzadarek I don't think you can patch system functions like that. This doesn't work too:

```
insert body-of :layout [print "hello"]
view [button "asdf"]
```

9214

[11:17](#msg5a71a5d86117191e61d70213)@nedzadarek https://github.com/red/red/issues/3171

[11:18](#msg5a71a5f836de78850cd186a7)you need to re-bind `layout` word to patched function for this to work

[11:21](#msg5a71a6b56117191e61d706a2)doesn't seems to work with `view` though, only with `layout` called directly

[11:22](#msg5a71a6ef6117191e61d70970)

```
text
>> layout: func spec-of :layout head insert body-of :layout [print "test"]
== func [
    {Return a face with a pane built from a VID description} 
    spec [block!] "Dialect bl...
>> layout [button]
test
== make object! [
    type: 'window
    offset: none
    size: 98x45
    text: none
    image: none
 ...
>>
```

BeardPower

[11:27](#msg5a71a814475054191748eb67)@toomasv Thanks. I used the 4th value, but somehow it was not working because of my wrong coding.  
@rebolek :+1: Need to dig into the source.  
@9214 Wasn't aware of that in the first place. :smile:  
@nedzadarek I thought it was because of some optimized rendering, so transparency is disabled by default or something like that.

[12:00](#msg5a71afe17dcd63481ffccf64)Is it possible to push additional options into a style, which is cloned from another style like in Rebol v3?  
There is the `option` facet, but where and how has this to be called? E.g. `face/options: [radius: 30]` is not recognized for "myButton" 100.  
E.g. cloning from a button, and having radius as an option, so I can do this: `view [myButton "mybutton" 100`] -&gt; recognizing 100 as the value for radius.

rebolek

[12:04](#msg5a71b0d2e217167e2c23b647)I may be wrong, but I don't think that current `layout` supports it.

BeardPower

[12:07](#msg5a71b16fac509d207d9e2f94)It seems so. I tried `[style mybutton: base 156x45 255.255.255.0 options [radius: 30]`,but options is not applicable to every face.

[12:09](#msg5a71b1e56117191e61d7565d)It would be great to have this feature, just like in Rebol v3, so the values can be specified in a block, just like the other "default" options of the existing faces.

[12:12](#msg5a71b2c9ce68c3bc7428b18b)FYI: my little project is creating all the widgets of the \[Grade UI kit](https://www.uichest.com/products/grade-ui-kit). I licensed them and I think they are awesome!

rebolek

[12:14](#msg5a71b30b494bd0f5304b093b)@BeardPower cool! you've got a lot of work to do :)

BeardPower

[12:14](#msg5a71b33e6117191e61d75dcc)Could take a while, yes :) I think it's a nice way to learn.

[12:18](#msg5a71b41fce68c3bc7428b985)Should I create an issue tagged as wish regarding the "options"?

9214

[12:19](#msg5a71b4476117191e61d763f9)@BeardPower I think it's worth at least to be mentioned

BeardPower

[12:20](#msg5a71b48e494bd0f5304b1134)@9214 OK, will do in the evening :+1:

toomasv

[13:41](#msg5a71c79f475054191749c292)Little \[study](https://gist.github.com/toomasv/e77df7ac18beee352f343b0729fb0a7a) of matrix transformations (\[pic](http://vooglaid.ee/red/matrix-study.png))  
!\[matrix-study.png](http://vooglaid.ee/red/matrix-study.png)

BeardPower

[13:42](#msg5a71c7bb475054191749c35e):+1:

9214

[13:42](#msg5a71c7d96117191e61d7ebf5)@toomasv nice, always wondered how this thing works

BeardPower

[13:43](#msg5a71c7eece68c3bc742940e2)@9214 Math is the key to everything :smile:

Phryxe

[13:43](#msg5a71c80898927d57455d2af7)@toomasv :cool:

toomasv

[13:44](#msg5a71c856e217167e2c2454a6)Oops, y-axis should point down! :flushed:

9214

[13:45](#msg5a71c86f475054191749c8fa)-5 coins from your account!

BeardPower

[13:45](#msg5a71c87db3c4a0d376c1f637)And a temporary ban ;-)

rebolek

[13:46](#msg5a71c8c47dcd63481ffd786f)

```
>> probe reverse copy redchain chain [steal 5 coins from @toomasv]
[[steal 5 coins from @toomasv] #{
9D104D04F2ADDF75DBF31EDB2933642559F3D867FB587A84B4B56404DF8F7791
} [tip @9214 10 coins] #{
4F53CDA18C2BAA0C0354BB5F9A3ECBE5ED12AB4D8E11BA873C2F11161202B945
}]
```

[13:46](#msg5a71c8ca4a6b0dd32b6f4aa6)It's all there.

BeardPower

[13:46](#msg5a71c8cf4a6b0dd32b6f4ab4)It is the OpenGL coordinate system. So the correct one :smile:

9214

[13:47](#msg5a71c8f1b3c4a0d376c1f986)`le` in @rebolek stands for `ledger` I suppose?

rebolek

[13:48](#msg5a71c915ce68c3bc742947a7):)

toomasv

[13:52](#msg5a71ca10ce68c3bc74294eca)Image corrected \*\*Give back my coins!\** :rage:

9214

[13:52](#msg5a71ca2a98927d57455d37c0)there's a proof of work or whatever it's called in blockchains? :)

rebolek

[13:53](#msg5a71ca43ce68c3bc74295039)all right, all right

```
>> probe reverse copy redchain chain [give back 5 coins to @toomasv]
[[give back 5 coins to @toomasv] #{
A23190974DEBB443A4B1618890B83DD9DDDB1BD0D9BCB92A63BD7DA9D46BA598
} [steal 5 coins from @toomasv] #{
9D104D04F2ADDF75DBF31EDB2933642559F3D867FB587A84B4B56404DF8F7791
} [tip @9214 10 coins] #{
4F53CDA18C2BAA0C0354BB5F9A3ECBE5ED12AB4D8E11BA873C2F11161202B945
}]
```

toomasv

[13:53](#msg5a71ca466117191e61d7fd7b)Reload :wink:

9214

[13:53](#msg5a71ca5798927d57455d38ae)10 points to Gryffindor!

rebolek

[13:53](#msg5a71ca76ce68c3bc742951e9)There's of course proof of work, your current git commit number must start with six zeroes.

[13:54](#msg5a71ca99ac509d207d9edb6e)then you will be rewarded with one coin

nedzadarek

[16:12](#msg5a71eb076117191e61d8e3c7)@9214 how do I bind it? `bind 'system/view/vid/fetch-options 'layout` doesn't seems to work (`bind` doesn't accept `path!`) and `bind 'f 'layout` works but I should bind not `f` but `system/view/vid/fetch-options`, right?

9214

[16:13](#msg5a71eb4736de78850cd36079)@nedzadarek why are you using `bind`?

nedzadarek

[16:15](#msg5a71eba898927d57455e1f78)@BeardPower to pass some values you can use `with`: `view [base red with [color: blue]]`.

9214

[16:15](#msg5a71ebbc4a6b0dd32b703e29)wait, I re-checked and it seems that you've already tried that I proposed  
https://gitter.im/red/red/gui-branch?at=5a719a7498927d57455c0406

nedzadarek

[16:17](#msg5a71ec276117191e61d8ec31)@9214 https://gitter.im/red/red/gui-branch?at=5a71a5d86117191e61d70213  
&gt; you need to re-bind `layout` word to patched function for this to work

9214

[16:18](#msg5a71ec3d7dcd63481ffe7045)yes, and I showed you how to do that

[16:18](#msg5a71ec437dcd63481ffe706a)in the same message

[16:18](#msg5a71ec5f36de78850cd3687a)but you've already tried this method before and it didn't seems to work

[16:19](#msg5a71ec7d47505419174ac601)maybe not re-bind but re-set

nedzadarek

[16:28](#msg5a71ee97b3c4a0d376c30702)@9214 ah, I see. Now I wonder how can I edit `fetch-options`. I guess I have to edit `layout` function (as it worked) and inject my own `fetch-options`.

9214

[16:28](#msg5a71eebfb3c4a0d376c307a0)maybe, although I don't get what you're trying to achieve :)

[16:28](#msg5a71eec9ce68c3bc742a3dcd)sorry, didn't followed the discussion

[16:31](#msg5a71ef5eb3c4a0d376c30cf1)modularize styles?

nedzadarek

[16:33](#msg5a71efe347505419174adf17)@9214 I wanted the `view` to accept `path!`, so I was trying to edit `fetch-options`/`fetch-argument` functions.

BeardPower

[17:09](#msg5a71f82d36de78850cd3c6e8)@nedzadarek Yes, but I want to use additional options for a new style:

```
mybutton 400x200 0.19.213 with [radius: 3]
```

[17:09](#msg5a71f845b3c4a0d376c35359)How can I do something like this?

9214

[17:09](#msg5a71f85e6117191e61d9448f)`with [extra: [radius: 3]]`?

[17:10](#msg5a71f872ac509d207da024a7)you can dump everything you want in `extra` facet I suppose

BeardPower

[17:10](#msg5a71f8a347505419174b221b)Yes, but I want to use my new style like any other style as well:

```
mybutton 400x200 0.19.213 radius 3

 mybutton 400x200 radius 3 0.19.213
```

9214

[17:11](#msg5a71f8bbb3c4a0d376c357db)write some kind of preprocessor for view?

[17:12](#msg5a71f90ace68c3bc742a87ca)hm, I wonder how Red will handle dialects over dialects

BeardPower

[17:13](#msg5a71f926ac509d207da02b8f)I was looking into the `set 'layout function`of view.red, but I can't figure out where the block is parsed and the order is not important.

9214

[17:14](#msg5a71f961e217167e2c25b367)`view preprocess [...]` there `preprocess` is dark `parse` magic

[17:15](#msg5a71f998ce68c3bc742a8c7a)which takes `radius integer!` and, idk, creates some acceptable thing which you can use

BeardPower

[17:15](#msg5a71f9bd4a6b0dd32b70a96b)Could you tell me where the parsing of the words take place? https://github.com/red/red/blob/b8671131936ec037145f3ebdaf7b016d49164102/modules/view/VID.red

9214

[17:16](#msg5a71f9e2e217167e2c25b719)@BeardPower here? https://github.com/red/red/blob/b8671131936ec037145f3ebdaf7b016d49164102/modules/view/VID.red#L262

BeardPower

[17:17](#msg5a71fa2dce68c3bc742a9088)Yes, but how does it parse button "text" 40x100 and button 40x100 "text", as these are not pairs.

[17:18](#msg5a71fa82ac509d207da0353e)L262 parses style options but I'm looking at the parsing of button, slider and so on.

9214

[17:19](#msg5a71fa8be217167e2c25bf3e)I guess it just matches by type and decides what means what  
https://github.com/red/red/blob/b8671131936ec037145f3ebdaf7b016d49164102/modules/view/VID.red#L316

BeardPower

[17:20](#msg5a71fad8ce68c3bc742a94e0)I thought about the same. So it's kind of hard-coded for the faces.

[17:22](#msg5a71fb534a6b0dd32b70b4e8)So it would need changes to support the parsing of extras like `mybutton "mybutton" 40x12 radius 3 theme dark`

[17:23](#msg5a71fbaa98927d57455e9af3)And why are the Red sources so sparely with comments? ;-)

9214

[17:25](#msg5a71fc1f6117191e61d9605e)because it is in a sort of a permanent "we gonna bootstrap it really quick and then ditch for fresh rewrite" state :D

[17:26](#msg5a71fc2ae217167e2c25ce76)I suppose

BeardPower

[17:27](#msg5a71fc877dcd63481ffee85f)Yeah, only a handful of gits have commented code.

[17:28](#msg5a71fcc1ac509d207da0450e)So you are saying, that Red will be rewritten?

9214

[17:28](#msg5a71fcceac509d207da0451f)sure, that's the plan

nedzadarek

[17:28](#msg5a71fcd1ce68c3bc742aa507)@BeardPower is `radius` in your `mybutton` style already implemented?

9214

[17:29](#msg5a71fcdeb3c4a0d376c374a9)bootstrap in Rebol and then rewrite in Red itself

[17:29](#msg5a71fcfbe217167e2c25d43e)@nedzadarek I think what @BeardPower wants is to extend VID syntax

BeardPower

[17:29](#msg5a71fd01e217167e2c25d452)@nedzadarek I set it as an extra.

[17:30](#msg5a71fd266117191e61d967ea)@9214 Yes, the compiler, but why rewrite something like VID.red?

9214

[17:31](#msg5a71fd73e217167e2c25d8ae)well, I don't know, just follow the convention that the things you care about are rewritten at least 2 times :)

BeardPower

[17:32](#msg5a71fd9dce68c3bc742aa961)@nedzadarek As @9214 said correctly, I want to have the ability to add anything I want in the view/vid dialect: `worldominationWidget blue 42x42 radius 20% of 100 theme ultra`

nedzadarek

[17:33](#msg5a71fdf698927d57455eac49)Now I wonder if @BeardPower knows how to set/use that `radius`...  
@BeardPower I have seen function (in vid.red) looks something like this:

```
foo: function [args] [get the code from next lines]
code is here
```

It doesn't look good in my Atom.

BeardPower

[17:33](#msg5a71fdf998927d57455eac52)@9214 Ah, THIS convention :)

nedzadarek

[17:36](#msg5a71fe967dcd63481ffef5f6)@BeardPower but what's wrong with instead of `hello-world-widget blue 42x42 radius 20% of 100 theme ultra` you can write

```
hello-world-widget blue 42x42 with [
          radius 20% of 100
          theme ultra
]
```

9214

[17:37](#msg5a71fed86117191e61d97409)you can't, basically

BeardPower

[17:37](#msg5a71feeb36de78850cd3f5f3)@nedzadarek  
&gt; Now I wonder if @BeardPower knows how to set/use that radius...

Unfortunately not the correct way.

It's nothing wrong with it, but I somehow can't get the values of these set words.

[17:38](#msg5a71ff32e217167e2c25e74b)VID is parsing the block and if it parses something, it can't match to an existing style, it will bail out.

rebolek

[17:39](#msg5a71ff3cce68c3bc742ab5fc)`layout` is complex function and currently not very easy to extend.

9214

[17:39](#msg5a71ff4f98927d57455eb7f8)that's another reason why I think rewrite should be done at some point

nedzadarek

[17:39](#msg5a71ff5247505419174b53a3)@9214 why? If you make `radius` and `theme` a functions. `of` can be infix operator.

9214

[17:39](#msg5a71ff576117191e61d97988)to make it more modular

BeardPower

[17:39](#msg5a71ff6047505419174b53e4)I checked out the docs of Rebol v3, and it seems it supports this.

9214

[17:40](#msg5a71ff80e217167e2c25e8c0)@nedzadarek https://doc.red-lang.org/en/vid.html#\_with

rebolek

[17:40](#msg5a71ff8c47505419174b54f0)R3gui is very different.

9214

[17:40](#msg5a71ff94e217167e2c25e8f0)no facet will be set in the process

[17:40](#msg5a71ffa136de78850cd3fb37)well, in theory, I suppose, with some `bind` magic

BeardPower

[17:41](#msg5a71ffcdac509d207da05ad3)&gt;Allows directly setting the face fields, overriding other VID options.

But only existing ones from the cloned faces.

9214

[17:41](#msg5a71ffd7e217167e2c25ea54)correct

[17:42](#msg5a72001dac509d207da05cd5)or there might be another dialect on top of View

[17:42](#msg5a72002347505419174b582a)to handle more sophisticated GUIs

rebolek

[17:43](#msg5a720028b3c4a0d376c38a1c)@BeardPower you can write preprocesor that will output VID code, where additional options will be converted to `extra`

9214

[17:43](#msg5a720038b3c4a0d376c38a78)yes, that's what I actually proposed in a first place

rebolek

[17:43](#msg5a720045ce68c3bc742abd3d)Or on top of View, that's also possible.

9214

[17:43](#msg5a7200476117191e61d97e34)extract your custom stuff and put it into `extra` or somewhere else

rebolek

[17:44](#msg5a72007336de78850cd400dc)I use `extra` extensively in my styles

9214

[17:44](#msg5a72008198927d57455ec253)@rebolek should `extra` block be reduced though?

BeardPower

[17:44](#msg5a720087ac509d207da0616d)@rebolek Yep, as @9214 was proposing. I'm trying to come up with something. :+1:

nedzadarek

[17:44](#msg5a72008b6117191e61d97fb9)@9214

```
system/view/vid/styles/foo: [template: [type: 'base color: red my-theme: "null" theme: func [a] [my-theme: a]] ]
view [f: foo with [theme "foo"]]
f/my-theme
; == "foo"
```

9214

[17:46](#msg5a7200fc6117191e61d98309)hmm

[17:46](#msg5a72010f36de78850cd4062d)well, instead of function(s) I'd use custom dialect

rebolek

[17:46](#msg5a72011247505419174b5fb7)@9214 I usually setup layout with `no-wait` and then set the data, so I don't use `extra` directly in VID

nedzadarek

[17:47](#msg5a72014c98927d57455ec84c)@9214 but you cannot use it directly, you have to do something like `... with [custom-dialect [...]]`

9214

[17:48](#msg5a7201564a6b0dd32b70e1bb)@nedzadarek yes, that's what I meant

[17:49](#msg5a72019047505419174b630e)then slap another dialect on top which will turn `radius 3` to `with [another-dialect [radius 3]]` :crown:

nedzadarek

[17:49](#msg5a7201b898927d57455eca36)^^ it's more powerful but I wouldn't want put so many brackets (`[]`)

9214

[17:49](#msg5a7201bbac509d207da0680f)@BeardPower your beard will become powerful indeed

[17:50](#msg5a7201e26117191e61d98794)well, who cares about brackets, it's just internal representation

nedzadarek

[17:52](#msg5a72025d6117191e61d98ac1)@9214 it's not the internal representation. User of your "super button" would have to use brackets.

9214

[17:53](#msg5a720287ce68c3bc742acaf4)why? He just writes `view preprocess [button radius 3]`

nedzadarek

[17:53](#msg5a7202b6ce68c3bc742acc8e)@9214 I mean your style `with [another-dialect [radius 3]]`, sorry If I made a mistake

9214

[17:54](#msg5a7202df47505419174b6d96)it will be generated by preprocessor, which, in turn, will be turned to tree of faces by View

[17:55](#msg5a72030f36de78850cd4180d)well, okay, either 2-level nesting of blocks or create every nice-looking function (`radius`, `of`, etc) by hand

nedzadarek

[17:56](#msg5a720364ce68c3bc742ad34d)@9214 if it's preprocessed then it's ok.

9214

[17:57](#msg5a72036c98927d57455ed9a6)but user won't write `with [...]` by himself, it will be generated by top-level dialect

nedzadarek

[17:58](#msg5a7203b236de78850cd41f7f)@9214 yeah, I got it.

[17:59](#msg5a7203f398927d57455eddcc)

```
system/view/vid/styles/foo: [
  template: [
    type: 'base color: red 
    
    my-theme: "null" 
    theme: func [a] [my-theme: a]

    of: make op! func [a b] [compose [(a) (b)]]
    my-radius: copy []
    radius: func [a] [my-radius: a]
  ]
 ]
view [f: foo with [
  theme "foo"
  radius 2 of 3
  ]

]
f/my-theme
; == "foo"
f/my-radius
; == [2 3]
```

pekr

[19:14](#msg5a72159ee217167e2c267f8e)Not sure if I would not prefer a set-word notation for 'with'

BeardPower

[20:46](#msg5a722b316117191e61da9aae)@pekr What are the pros/cons?

pekr

[21:56](#msg5a723b7936de78850cd58583)none, just a personal preference. Perhaps the familiarity with the object syntax, dunno ...

BeardPower

[22:04](#msg5a723d76ce68c3bc742c41df)I see :)

[22:51](#msg5a72488398927d57456092c3)Is this by design? The drawing of the text starts at 0x0, it still has an offset.  
!\[Text offset bug?](https://i.imgur.com/tctryzi.gif)

## Thursday 1st February, 2018

nedzadarek

[01:01](#msg5a72670298927d5745611fe5)@BeardPower yes. You can use `view/tight`  
&gt; What are the pros/cons?

When you write `foo:`you are supposed to set/write something, right? `foo http://google.pl` can be anything (pinging given url, storing url into some variable named however programmer wanted, ...)  
Implementing little DSLs using `word!`s (like in my examples) are very easy. If you want DSL with `set-word!` I guess you need parse.

toomasv

[08:06](#msg5a72ca79ce68c3bc742ece7e)@BeardPower There are several \[positioning options](https://doc.red-lang.org/en/vid.html#\_layout), \[e.g.](http://vooglaid.ee/red/positioning.png):

```
view/tight [
   base 
   origin 30x30 
   base blue base red 
   space 10x10 return 
   base red base blue 
   at 70x70 base green
]
```

!\[positioning.png](http://vooglaid.ee/red/positioning.png)

[08:15](#msg5a72cc87b3c4a0d376c7e34b)Added different edge-endings and layout-orientations to \[graph](https://gist.github.com/toomasv/be38d5b451bc02da25e81a1cdba589fc) (unstable :confused:):

```
graph [[
		n1 -> [head 20x10] n2 -> [head 20x10 0] n3 
		n1 -> n4 -> [head 10x10 5] n5 
		n1 -> [head 5x10] n6 -> [head 5x10 -5] n7
	][
		[up] edges [head 10x10 0 tail 10x10 0]
		a >- b o- c
		a >- [tail [glass 10x10 -7]] d +- [tail 6x10 3] e
		a <- f n- g
	][
		[star 20x20] 
		nodes [circle] edges [head [4x4 black] tail [3x3 snow]]
		at 320x280 x n-o [y z q w p]
	][
		[star 20x20]
		nodes [square] edges [head [6x6 black] tail [6x6 3 snow]]
		at 750x280 b1 >-> [b2 b3 b4 b5] 
	]
]
```

!\[graph-layouts.png](http://vooglaid.ee/red/graph-layouts.png)  
\[pic](http://vooglaid.ee/red/graph-layouts.png)

nedzadarek

[12:08](#msg5a73033f475054191750d042)@toomasv can we set Z coordinate, like in `z-index` in HTML: https://www.w3schools.com/cssref/tryit.asp?filename=trycss\_zindex ?

toomasv

[12:11](#msg5a7303dd475054191750d5be)@nedzadarek I am not aware of such possibility besides the order of faces in pane. The function to move face up and down in this order can be implemented.

nedzadarek

[12:11](#msg5a7303fb98927d5745642c61)@toomasv I see. Thank you.

toomasv

[12:13](#msg5a730485ce68c3bc74301892)@nedzadarek See short remark in discussion of \[face tree](https://doc.red-lang.org/en/view.html#\_the\_face\_tree)

[12:25](#msg5a73074936de78850cd98334)Try this to change z-order:

```
view [style ord: base loose on-down [move find pane: face/parent/pane face tail pane] ord teal ord beige]
```

maximvl

[13:04](#msg5a73107498927d57456470ed)@toomasv oh wow

[13:04](#msg5a731079ac509d207da60a57)looks great

toomasv

[13:07](#msg5a73110ce217167e2c2bb5b0)@maximvl I am half-way to implementation of loops and cycles :wink:

maximvl

[13:35](#msg5a7317aa36de78850cd9e3c0)nice

BeardPower

[13:49](#msg5a731af36117191e61df895e)@toomasv @nedzadarek Thanks. I used offset 0x0 for the root base, which tight offers, but it's not working for a text/font. The font still has an offset. Could you please try to draw a text at 0x0 and check?

toomasv

[14:21](#msg5a73225f98927d574564e2af)@BeardPower My \[try](http://vooglaid.ee/red/texts.png):

```
view/tight/no-wait [base beige draw [text 0x0 "Text"]] 
view/tight [base gold "Text" 'left 'top]
```

!\[texts.png](http://vooglaid.ee/red/texts.png)

BeardPower

[14:43](#msg5a7327864a6b0dd32b773f1d)You need to make a font, to see it:

```
font: make font! [
    name: "times"
    size: 40
    style: 'bold
     color: white
]

view/tight [base draw [pen blue fill-pen red box 0x0 50x50 pen white font font text 0x0 "hello"]]
```

[14:44](#msg5a7327c94a6b0dd32b77403f)You will see, that the font is offset from the top.

[14:45](#msg5a732814b3c4a0d376c9f0b7)As it's using the lower left corner of the red box as origin.

toomasv

[14:46](#msg5a73285136de78850cda4e8f)On feet now. Will try at home

BeardPower

[14:46](#msg5a732858b3c4a0d376c9f25c)Sure, thanks!

[14:48](#msg5a7328c57dcd63481f05471e)&gt;As it's using the lower left corner of the red box as origin.

That was just a coincidence. Try with font size 70 and 100. The top offset will increase.

nedzadarek

[15:16](#msg5a732f35ac509d207da6c410)@BeardPower maybe fonts have tiny space around them? Do you have some software to make fonts? You can make it black to see if I'm right.

BeardPower

[15:20](#msg5a73303f98927d5745653bb2)@nedzadarek I do. Need to check on this. The space is not tiny. For a font of 100px the space is about 35px.

nedzadarek

[15:21](#msg5a733081475054191751ed12)@BeardPower nice

BeardPower

[15:22](#msg5a7330b07dcd63481f057d29)!\[Huge offset](https://i.imgur.com/Jr662Eq.png)

[15:22](#msg5a7330b96117191e61e012b6)The red box is 50x50, the font is 100px.

[15:24](#msg5a733115475054191751f086)It seems, that this is the line spacing. If so, the spacing should be on the bottom, not the top.

nedzadarek

[15:24](#msg5a7331404a6b0dd32b778865)@BeardPower could you send bigger picture... I'm not sure what it's it.

BeardPower

[15:27](#msg5a7331d04a6b0dd32b778bea)Sure: !\[font offset](https://i.imgur.com/eQyUJEi.png)

[15:28](#msg5a7332014a6b0dd32b778c4a)The font is drawn at 0x0.

nedzadarek

[15:29](#msg5a733244475054191751f84b)@BeardPower but have you done that square in the font software or in red?

BeardPower

[15:29](#msg5a73324e98927d5745654aef)Red.

[15:31](#msg5a7332d8475054191751fd45)Without the red block: !\[pure font](https://i.imgur.com/QxJGEj6.png)

nedzadarek

[15:31](#msg5a7332e236de78850cda9815)Well, when you make a letter (all is black) in the font software try using it with offset 0x0.

rebolek

[15:32](#msg5a73331ece68c3bc74314655)IMO to properly place text on screen you would need to have access to font's baseline and other properties.

nedzadarek

[15:32](#msg5a73332036de78850cda9940)btw. you can translate it `view/tight [base red draw [translate -20x-20 box 20x20 40x40]]` Dynamically calculating it won't be a problem

BeardPower

[15:32](#msg5a73332198927d57456550a3)Will do in the evening/weekend, when I have access to my font software :)

9214

[15:33](#msg5a733336e217167e2c2c90ff)3 messages at the same time

BeardPower

[15:33](#msg5a73334e98927d5745655200)@9214 Worth a Red token ;-)

rebolek

[15:33](#msg5a7333574750541917520053)hm, something that stats could catch

9214

[15:34](#msg5a73337d6117191e61e0290f)we're all spontaneous EEG activity of @greggirwin's brain

nedzadarek

[15:34](#msg5a733391ac509d207da6e147)^^ weird

9214

[15:34](#msg5a7333a34a6b0dd32b7796fd)right now he remembered how he miss this chat

BeardPower

[15:35](#msg5a7333a46117191e61e02983)@nedzadarek Yep, thanks. I will look into my custom font and if there is some access to the font properties and report back ASAP.

[15:36](#msg5a7333e36117191e61e02a63)I will try to write a book/wiki as a tutorial in my UI journey :)

toomasv

[15:50](#msg5a73372a7dcd63481f05aa21)@BeardPower Cheating (\[pic](http://vooglaid.ee/red/text-position.png)):

```
view/tight [base 120x38 draw [pen white font font text 0x-12 "Hello"]]
```

!\[text-position](http://vooglaid.ee/red/text-position.png)

BeardPower

[15:53](#msg5a7337f1ce68c3bc74316800)@toomasv That would be the last resport :)

nedzadarek

[16:05](#msg5a733ac698927d5745658112)btw. there is `data []` that sets `data` field of the face, there is `with`. Are there other syntaxes that work with view's element?

9214

[16:06](#msg5a733aec4a6b0dd32b77c850)@nedzadarek https://doc.red-lang.org/en/vid.html ?

nedzadarek

[16:07](#msg5a733b2f98927d57456583e8)@9214 ah, docs. Thank you.

BeardPower

[16:15](#msg5a733d3c7dcd63481f05cf5f)The issue is too important to wait ;-)

So I created my own font with the letter `A` as a block. You can see, it's definitely NOT a font issue.

!\[I smell a bug](https://i.imgur.com/7kLVN9b.png)

rebolek

[16:16](#msg5a733d73ce68c3bc74318cce)@BeardPower if you try two lines, how much space is between them?

nedzadarek

[16:17](#msg5a733d8ce217167e2c2cdb5f)@BeardPower could you send the font and the code? I want to try it too.

BeardPower

[16:17](#msg5a733d9de217167e2c2cdbbe)Sure, give me a few minutes.

[16:18](#msg5a733dd6ce68c3bc74318f7a)@rebolek How do I render 2 lines again? Escaping `\n` won't do anything.

rebolek

[16:18](#msg5a733deab3c4a0d376ca80fb)@BeardPower `^/` is the right escape sequence

BeardPower

[16:19](#msg5a733e1098927d5745659977)@rebolek Thanks. I need Red 1.x, so I don't have to switch between languages any more ;-)

rebolek

[16:19](#msg5a733e1e47505419175244ee):D

nedzadarek

[16:20](#msg5a733e4bb3c4a0d376ca837f)At least there are new features. I like that. :D

9214

[16:20](#msg5a733e577dcd63481f05d5de)then you'll need to switch between dialects

BeardPower

[16:21](#msg5a733e834a6b0dd32b77df3b)Here we go:  
!\[baseline issue](https://i.imgur.com/fAsXyFx.png)

rebolek

[16:24](#msg5a733f2b4a6b0dd32b77e380)So the space between lines is added at top. Interesting.

BeardPower

[16:24](#msg5a733f2cac509d207da72ba3)@nedzadarek Here is the font: "My Font". I only changed the letter `A`(block) and the `B`(empty). \[My Font](https://drive.google.com/open?id=1hyJ6sa12cWBZMFipJSVq7hnzsHICE\_q4)

rebolek

[16:25](#msg5a733f87e217167e2c2ce75e)We need to see what @qtxie can tell us about it.

BeardPower

[16:26](#msg5a733f9a6117191e61e0781c)

```
font: make font! [
    name: "My Font"
    size: 100
    style: 'bold
    color: white
 ]

view/tight [base 500x500 draw [pen white font font text 0x0 "HALLO^/HALLO"]]
```

[16:27](#msg5a733fee98927d574565a73a)If you want to create your own font for testing, there is a nice free online/offline font creator: \[Glyphr Studio](http://glyphrstudio.com/)

[16:28](#msg5a73404498927d574565a867)The blocked letter is filling out capheight to baseline. So no ascent and no descent.

[16:29](#msg5a734085ac509d207da734cc)It seems, the font has a y-offset of the descent value..

[16:35](#msg5a7341b6b3c4a0d376ca9b04)Because of my awesome skills, I was able to update the font with ascent and descent ;-)  
!\[full range](https://i.imgur.com/RLxR2vH.png)

[16:37](#msg5a7342564750541917526000)&gt;It seems, the font has a y-offset of the descent value..

The picture proves that now. It would be great, if there was access to these properties to increase the UI flexibility.

rebolek

[16:37](#msg5a73425fb3c4a0d376ca9fc5)So it's fine then.

BeardPower

[16:38](#msg5a7342867dcd63481f05f125)Yes, it's not a bug, it's just how fonts are rendered, because some fonts have ascents.

[16:39](#msg5a7342bee217167e2c2cfa5b)The issue is, fonts which have no ascent also have an offset, which would not be needed, as the next line has an offset by the descent value.

nedzadarek

[16:40](#msg5a73430b4a6b0dd32b77f968)@BeardPower I downloaded your font and I pasted code and `A` in `HALLO` is still normal letter.

BeardPower

[16:41](#msg5a734348e217167e2c2cfd98)@nedzadarek Could you open the font file after installation?

[16:41](#msg5a7343516117191e61e08f3e)You should see the blocks.

nedzadarek

[16:42](#msg5a73436a98927d574565bf83)@BeardPower yes, I see the block instead of A

BeardPower

[16:42](#msg5a73437db3c4a0d376caa7dd)So it should render it this way.

[16:43](#msg5a7343b34a6b0dd32b77fc72)Let me check with a fresh Red "installation".

nedzadarek

[16:43](#msg5a7343c1b3c4a0d376caa94f)@BeardPower stop

BeardPower

[16:44](#msg5a7343db36de78850cdb00e8)@nedzadarek Works for me.

nedzadarek

[16:44](#msg5a7343e74a6b0dd32b77fd6b)I guess I have to install it. Red doesn't seem to see it in the same folder.

BeardPower

[16:45](#msg5a734412ce68c3bc7431b88d)Yes, you need to install the font, as Red is using the installed fonts on your system.

[16:45](#msg5a73442b36de78850cdb02f6)Red definitely needs a feature to load the font file directly.

nedzadarek

[16:46](#msg5a73446398927d574565c73f)@BeardPower but it's weird... why your A is lower than H?

BeardPower

[16:47](#msg5a7344b1b3c4a0d376caafe9)Because I did not change every character. It will use defaults for the missing ones, and these defaults are drawn into the ascent area.

nedzadarek

[16:49](#msg5a73451336de78850cdb090d)@BeardPower interesting

[16:50](#msg5a734550e217167e2c2d0b36)btw. `text` does the same: `view/tight [text 500x500 "HALLO^/HALLO" font-size 100 font-name "my font"]`

BeardPower

[16:50](#msg5a734552e217167e2c2d0b4b)The guides are not standard values. Designing fonts is an art for itself :)

nedzadarek

[16:51](#msg5a7345757dcd63481f06030c)@BeardPower yeah, I remember online course about it.

BeardPower

[16:51](#msg5a7345987dcd63481f060394)Nice. Totally forgot to check with text :+1:

[16:54](#msg5a734647b3c4a0d376cab95d)So how should we solve this "issue"? I think access to the ascent and descent properties (others as well) would be the best solution. The designer knows, which font has ascents and other properties when using them.

9214

[16:55](#msg5a734666ce68c3bc7431c7f6)extend `font!` object

BeardPower

[16:56](#msg5a7346d1ce68c3bc7431ca45)@9214 Could also be an option, but as the font has these properties, giving access to them would be quite logical.

nedzadarek

[16:57](#msg5a7346edb3c4a0d376cabe79)btw. is there a way to force `extra` to merge values. For example `view [style base-extra: base extra #(a: 42) b: base-extra extra #(b: 500)] print b/extra` prints `b: 500`. I want extra to be "merged": `#(a: 42 b: 500)`

9214

[16:58](#msg5a734738b3c4a0d376cac0b1)you can `extend` it inside `do` block

[16:58](#msg5a73475036de78850cdb15c7)or try to

nedzadarek

[16:59](#msg5a73476e36de78850cdb1774)@9214 you mean something like `view [b: base do [b/extra: b/extra ++ ]]`?

[16:59](#msg5a73477736de78850cdb17a1)^^ pseudo code

9214

[16:59](#msg5a73477ce217167e2c2d1905)yes

[17:00](#msg5a73479298927d574565dba6)`extend b/extra #(new stuff)`

nedzadarek

[17:01](#msg5a7347fce217167e2c2d1b85)It's too bad I cannot do this without `do` or `with`. Well, thank you.

9214

[17:03](#msg5a7348524a6b0dd32b78155e)maybe `on-create [extend ...]`

nedzadarek

[17:05](#msg5a7348d198927d574565e472)@9214 it's the same as above

9214

[17:05](#msg5a7348ece217167e2c2d2112)well, this means that you can do this without `do` or `with` ;)

nedzadarek

[17:08](#msg5a7349944750541917528f91)@9214 I can but it's not very nice. I mean I created some style (`foo`) with `extra: #(a 42)`. User of my style have to do something like this `view [foo with [extra/b: 42]]`.

9214

[17:09](#msg5a7349e4ce68c3bc7431de83)then create a wrapper which will abstract this details

BeardPower

[17:13](#msg5a734ad736de78850cdb2e2c)@nedzadarek This is where the fancy DSL comes in, @9214 talked about yesterday :smile:

nedzadarek

[17:14](#msg5a734ae96117191e61e0be00)@9214 wrapper? Something that will be used like: `view [foo with [wrapper []]`

[17:14](#msg5a734b03ce68c3bc7431e7c1)@BeardPower yes, but I'm interested in simple things too.

9214

[17:14](#msg5a734b10e217167e2c2d2cde)`view wrap [very nicely written no nested blocks wow tip me]`

BeardPower

[17:15](#msg5a734b1c98927d574565f197)Sure :) It's always a balance.

[17:15](#msg5a734b48ce68c3bc7431e8b8)But a DSL would turn nasty things into nice things.

9214

[17:16](#msg5a734b687dcd63481f062582)the same way you're using VID DSL instead of constructing tree of faces by hand

nedzadarek

[17:19](#msg5a734c2e98927d574565f6f5)@9214 then my `wrap` would have to parse nested blocks, because someone might have panel of my `foo`s, right?

9214

[17:20](#msg5a734c4836de78850cdb3856)I think so

nedzadarek

[17:20](#msg5a734c72ac509d207da7803c)@9214 It's doable but it require little more time. Well, thank you for your opinions/informations.

9214

[17:21](#msg5a734c7d98927d574565f90e)you're welcome :+1:

## Friday 2nd February, 2018

greggirwin

[01:04](#msg5a73b926ac509d207da9d706)I have missed this chat. And can only begin to imagine how much Nenad has missed things, with all the ICO work that took his focus for a while.

[01:05](#msg5a73b963ac509d207da9d81c)@BeardPower, awesome skills indeed.

BeardPower

[02:47](#msg5a73d158ce68c3bc7434992a)@greggirwin Working hard to become Red-Skilled. Still a long way to go. 😁

toomasv

[18:07](#msg5a74a8fa7dcd63481f0d61b9)@nedzadarek I tried this \[z-ordering](https://gist.github.com/toomasv/fdac9ae51f60dac58ce69483e4a055c1) thing:  
!\[z-order.gif](http://vooglaid.ee/red/z-order.gif)

9214

[18:09](#msg5a74a9606117191e61e8197c)@toomasv massive! :clap:

toomasv

[18:11](#msg5a74a9e06117191e61e81c24) :blush:

nedzadarek

[22:11](#msg5a74e1f4b3c4a0d376d3682a)@toomasv impressive :clap: I have to study this code later.

[22:13](#msg5a74e28ae217167e2c35c3df)ps. sometimes colours are similar.

greggirwin

[22:51](#msg5a74eb8536de78850ce403e5)Great stuff @toomasv. I hope we can mezz this up in the future.

## Saturday 3th February, 2018

toomasv

[04:10](#msg5a75362a4a6b0dd32b81f877)@nedzadarek Thanks! Yep, colors can be similar, luckily not same. But you can just fix any pallette for it.  
@greggirwin :smile: Maybe a kind of tuzzorial?

greggirwin

[04:33](#msg5a753b8ba3447aac7535a21b)Very soon it will sound like we'zz all beezz drinking too much.

planetsizecpu

[10:30](#msg5a758f36a3447aac7536d722)@toomasv cool &amp; clean, I like the easyness of this kind menus, fast to implement :+1:

[10:31](#msg5a758f81b3c4a0d376d5f23b)@greggirwin It depends on what you drink :)

## Monday 5th February, 2018

nedzadarek

[01:18](#msg5a77b0d4e217167e2c415b1b)If I don't care about displaying things, are `view/no-wait [] the same as layout []?`

``PeterWAWood 02:12@nedzadarek They shouldn't be the same. view/no-wait should display a window, layout returns a "face-tree". It does on Windows but not on macOS (`view/no-wait' doesn't display the window). I will raise an issue. Which OS are you running under? 02:21#3220 greggirwin 02:55You can do source view and see that it does some other initialization steps as well. nedzadarek 16:20@PeterWAWood No, no. I know that the view displays the window and thelayoutreturns an object. I want to test whenever or not values are "good". For example I set some gui element to the variable view [b: base red extra #(a: 42)] and I check it later print b/extra. I know that the view will display a red box so I immediately close the window. I put no-wait refinement so I can see all results at once not just one (e.g. it displays 2 values: view/no-wait [b: base red] print b/color view/no-wait [b: base blue] print b/color). The layout is even better because it doesn't open the window... @greggirwin It seems that the view does some OS specific things (I guess setting things like an order of [cancel] [ok] buttons etc) and sets offset & window's title. 9214 16:22@nedzadarek http://www.red-lang.org/2017/07/063-macos-gui-backend.html skip to "Cross platform GUI metrics" nedzadarek 16:26@9214 I remembered that I read it. Thank you for the link.``

``Tuesday 6th February, 2018 toomasv 16:54Little steps further with [graph](https://gist.github.com/toomasv/be38d5b451bc02da25e81a1cdba589fc): new layouts (away in addition to former default across, and alignment clockwise (cw) and counter-clockwise (ccw) in addition to the previous default center (c)), also no-draw mode: graph [ star away edges step [a -> [down b c d e]] [a -> [left a1 -> [f g h]]] [a -> [up cw i j k]] [a -> [right across edges straight a2 - [l m n]]] ] ![graph4.png](http://vooglaid.ee/red/graph4.png) graph [ star away nodes no-draw glass edges step [a -> [down b c d e]] [a -> [left a1 -> [f g h]]] [a -> [up cw i j k]] [a -> [right across edges straight a2 - [l m n]]] ] ![graph5.png](http://vooglaid.ee/red/graph5.png) 9214 16:56this is @toomasv 24/7, I suppose :clap: https://www.youtube.com/watch?v=dPWkNS5AMVM toomasv 16:58Ehm.. how do you.. All right.. Correct 9214 16:59@toomasv I'm the one with :banana: 17:00operators should be @rebolek Phryxe 17:24@toomasv Really cool! Delete worked, but add child crashes the app ... TBD maybe. toomasv 17:25@Phryxe Yes, interactive adding currently broken :( Phryxe 17:25Still, super cool! :thumbsup: toomasv 17:26Thanks! Wednesday 7th February, 2018 greggirwin 03:11@toomasv, the only thing I can find fault with is that you're still calling it a "toy" and "baby" DSL. ;^) Wow. toomasv 04:02:flushed: Will promote it to "toddler" DSL with next release. greggirwin 06:23<he he> nedzadarek 14:32@greggirwin maybe his DSL is some kind of Time Lord (from Dr. Who) who lives hundreds years? toomasv 20:35Experiment with dragging on grid: Red [Needs: View] system/view/auto-sync?: off view [ title "Grid dragging" size 100x100 box teal loose 30x30 with: [ actors: object [ pos: 0x0 changed?: false grid: 10x10 on-down: func [face][pos: face/offset] on-drag: func [face event][ either 0 = absolute dx: event/offset/x - face/state/4/x % grid/x [ pos/x: face/offset/x: face/offset/x + dx changed?: true ][ face/offset/x: pos/x ] either 0 = absolute dy: event/offset/y - face/state/4/y % grid/y [ pos/y: face/offset/y: face/offset/y + dy changed?: true ][ face/offset/y: pos/y ] if changed? [show face changed?: false] ] ] ] ] ![grid.gif](http://vooglaid.ee/red/grid.gif) rebolek 20:57:globe_with_meridians: :+1: BeardPower 21:23 @toomasv Nice! Another feature request: window/panel snapping 🤓 Thursday 8th February, 2018 rgchris 08:06@toomasv Seems to SHOW whether the face moves or not. An experiment with ROUND: actors: object [ grid: 10 last-offset: 0x0 on-down: func [face][last-offset: face/offset] on-drag: func [face event][ face/offset: round/to face/offset grid unless equal? face/offset last-offset [ probe last-offset: face/offset show face ] ] ] (keeping it in the window) face/offset: round/to max 0x0 min face/parent/size - face/size face/offset grid toomasv 08:13@rgchris Much cleaner! Only grid-x/y cannot be set separately, otherwise :+1: rgchris 08:13Yeah, the integer was just for brevity. Can round per x and y with an extra line. 08:14 lisp grid: 10x20 ... face/offset/x: round/to face/offset/x grid/x face/offset/y: round/to face/offset/y grid/y toomasv 08:20Very nice! rgchris 08:24(if ROUND's /TO refinement took a PAIR!, could be one line : ) nedzadarek 13:31@toomasv @BeardPower I tried to add window/panel snapping: system/view/auto-sync?: off view [ title "Grid dragging" size 100x100 box teal loose 30x30 with: [ actors: object [ pos: 0x0 changed?: false grid: 10x10 on-down: func [face][pos: face/offset] on-drag: func [face event][ either 0 = absolute dx: event/offset/x - face/state/4/x % grid/x [ pos/x: face/offset/x: face/offset/x + dx changed?: true ][ face/offset/x: pos/x ] either 0 = absolute dy: event/offset/y - face/state/4/y % grid/y [ pos/y: face/offset/y: face/offset/y + dy changed?: true ][ face/offset/y: pos/y ] ; 2 lines added: if pos/y < 0 [pos/y: 0] if pos/y > (100 - face/size/y) [pos/y: 100 - face/size/y] if pos/x < 0 [pos/x: 0] if pos/x > (100 - face/size/x) [pos/x: 100 - face/size/x] if changed? [show face changed?: false] ] ] ] ] but for some reason x coordinate doesn't work correctly. 100 is hardcoded - how to get window/panel size? BeardPower 13:54With face/size, face/parent/size, view/size nedzadarek 15:38@BeardPower view [button "view size" [print view/size]] *** Script Error: view has no refinement called size *** Where: view *** Stack: view do-events do-actor do-safe view about Red for Windows version 0.6.3 built 6-Feb-2018/14:52:56+01:00 Well... with face/parent/size it works... in most cases. Sometimes the box goes out of the bound (disappears) . system/view/auto-sync?: off view [ title "Grid dragging" size 100x100 box teal loose 30x30 with: [ actors: object [ pos: 0x0 changed?: false grid: 10x10 on-down: func [face][pos: face/offset] on-drag: func [face event][ either 0 = absolute dx: event/offset/x - face/state/4/x % grid/x [ pos/x: face/offset/x: face/offset/x + dx changed?: true ][ face/offset/x: pos/x ] either 0 = absolute dy: event/offset/y - face/state/4/y % grid/y [ pos/y: face/offset/y: face/offset/y + dy changed?: true ][ face/offset/y: pos/y ] ; 3 lines added: parent-size: face/parent/size if pos/y < 0 [pos/y: 0] if pos/y > (parent-size/y - face/size/y) [pos/y: parent-size/y - face/size/y] if pos/x < 0 [pos/x: 0] if pos/x > (parent-size/x - face/size/x) [pos/x: parent-size/x - face/size/x] if changed? [show face changed?: false] ] ] ] ] rgchris 15:49> @BeardPower > Well... with face/parent/size it works... in most cases. Sometimes the box goes out of the bound (disappears) . See my example above with MAX and MIN. toomasv 17:01Still [drawing](http://vooglaid.ee/red/drawing.gif): ![drawing.gif](http://vooglaid.ee/red/drawing.gif) 9214 17:05@toomasv may I call you Jesus? :angel: 17:05@toomasv maybe you can contribute to @honix's Redraw https://github.com/honix/Redraw BeardPower 17:06@nedzadarek Oops, sorry. view has no size path to read. You need to use the screen face and it's panes. system/view/screen/pane/1 would return the first window. 17:09@toomasv Are you working full-time on Red? 🤖 greggirwin 17:18I started on something like @rgchris was thinking, but only had a couple minutes and it didn't work right away. Thanks @rgchris ! @toomasv on the paint app, so cool, please steal any useful bits from https://gist.github.com/greggirwin/989ca6ffcec29f0700f54a0f3331d7eb 17:20@honix's work is very cool indeed. 17:28On grid snapping, I was thinking about how to generalize it. e.g.: snap-to-grid: function [ offset [pair!] ; face [object!] size [pair!] ;action [block!] ;/within range [pair!] "How close you have to be to a grid point to snap" ][ ;range: any [range 0x0] res: make pair! offset res/x: round/to offset/x size/x res/y: round/to offset/y size/y ;if res <> offset [do action] res ] toomasv 17:34@9214 Thanks! Thought about this also, i.e. how to mix these. @BeardPower No, but I am currently full time ill at home :) @greggirwin Thanks for the link, will study. greggirwin 17:36@greggirwin thinks about how to keep @toomasv sick as long as possible... 9214 17:37I heard that @toomasv got sick from reading all the new articles on red-lang ;) greggirwin 17:37I thought it was the hope for them finally turning to despair. toomasv 17:38I'd love @greggirwin to succeed on this! greggirwin 17:38The fatal ennui of @toomasv. toomasv 17:55What ennui? ![drawing2.png](http://vooglaid.ee/red/drawing2.png) 9214 17:55praise the sun \\[T]/ greggirwin 17:56The storm has passed! Yay! rebolek 17:57@toomasv cool! I should find my old R2 animation editor and try to port it. BeardPower 18:11Photoshop has a new contender 😎 9214 18:12Photooshop greggirwin 18:16Photoomasv toomasv 18:17@greggirwin Hei!! You wrote in red-paint-with-time-travel.red that it is worlds' smallest paint-program. But it has 161 LOC while my drawing.red has *only* 159!!! greggirwin 18:18Well, I ported an old R2 app, but then added time travel, so you have to go back in time to make it smaller again. toomasv 18:19:) @9214 is good on this time-traveling stuff :wink: greggirwin 18:20He is actually my younger self. http://abstrusegoose.com/strips/ars_longa_vita_brevis.png 18:22https://gist.github.com/greggirwin/989cf1909edc0d98cc38bc47e4b6718f toomasv 18:23:flushed: 9214 18:27I'm TEMPEST emanations of dying server that still runs first version of Rebol compiler somewhere, that manifested itself in organic matter and got bootstrapped from DNA dialect 18:28@9214 sips some coffee greggirwin 18:32>> parse @9214 RNA-rules+actions == the-future 9214 18:37https://www.youtube.com/watch?v=B7UKgbl7_Xg Friday 9th February, 2018 nedzadarek 12:49@rgchris I have checked your code. The main culprit was updating/painting things. Your unless part helped a lot! Saturday 10th February, 2018 toomasv 14:33[Preview](http://vooglaid.ee/red/drawing3.gif): ![drawing3.gif](http://vooglaid.ee/red/drawing3.gif) meijeru 16:24:+1: greggirwin 18:37@toomasv, nice! Are you drawing into sub faces to use your z-order func, or z-ordering by modding a single draw block? If the latter, I assume each command is a sub block for easy reordering. planetsizecpu 18:38@toomasv looks very well done. Much encouragement greggirwin 18:38I love watching the polygon evolve as you add points. 18:39Ah, watching closer now, I think you're using faces by how you're dragging them to new positions. 18:40Really cool to see the drawing properties applied, or not, as you change the z-order. toomasv 18:42@greggirwin Modding a draw block, no sub-blocks. At least so far. Tried but got into problems. But to implement trasformations, I have to get sub-blocks to work :) Just now added line-joins. greggirwin 18:43So you're just going based on selection in the list and any mouse down and drag applies to that? toomasv 18:44Yep greggirwin 18:45After transformations, multi selection? ;^) toomasv 18:46The thought has occurred to me: multi-selection into named block ?? To apply transformations greggirwin 18:47If you have sub-blocks, you could select them by index, yes? 18:47Nested blocks will be a different story. Hmmmm. 18:47e.g., can you change nesting levels of elements. toomasv 18:47Yes, but I use indexes now too, although somwhat more involved. This was about your first sentence :) 18:49About third: Haven't figured it out yet greggirwin 18:49Yes, you have to know the range of each command, so you're making it more of a challenge for yourself right now, or maybe trickery with set-words as markers? toomasv 18:51It's actually not so complicated. I search in draw for the name in text-list, then the following name, which will be the limit for the first range. greggirwin 18:52And those names are set-words in the block? I did something like that with a couple experiments. toomasv 18:52Yes, set-words greggirwin 18:52:+1: toomasv 18:53:) rebolek 19:16@toomasv wow, that is really good. toomasv 19:55Happy to hear. Thanks! ldci 20:24redCV can red tiff files now. See https://github.com/ldci/redCV BeardPower 20:36Z-ordering would be much easier with gobs. Is there an easy way to steal them from REBOL v3? toomasv 20:42@ldci Impressive work! greggirwin 20:59Very nice @ldci! Your work will be a seminal reference for future work I'm sure. Sunday 11st February, 2018 ldci 10:56Thanks for comments. Please feel free to participate :) greggirwin 16:48@ldci, I'd love to, but I'm just the *tiniest* bit busy lately. :^) toomasv 16:55POC for [transformations](http://vooglaid.ee/red/drawing4.gif): ![rotation](http://vooglaid.ee/red/drawing4.gif) 9214 16:56@toomasv I beg you to stop 16:56you're blinding me with your coolness toomasv 16:59:) greggirwin 17:00You have *got* to be kidding me. Wow. toomasv 17:06![rotation2](http://vooglaid.ee/red/rotation2.gif) 9214 17:06I worry that when whole tipping part starts @toomasv will just drown in tokens :( greggirwin 17:07We'll get him a snorkle, and he can swim through them to his machine. toomasv 17:09Don't worry! I'll :boat: to my :computer: and drop an :anchor: 9214 17:10@toomasv you should draw yourself a snorkle 17:10on 3d printer toomasv 17:19BTW There is error in official doc for Draw. It says the order of transform arguments is <angle> <center> <scale-x> <scale-y> <translation>. But it is actually <center> <angle>... (rotation has <angle> <center>). 9214 17:19@toomasv don't forget to make a PR/issue on that! toomasv 17:19OK greggirwin 18:31@toomasv, that's right, sailing! toomasv 18:44Here is more natural [rotation](http://vooglaid.ee/red/rotation3.gif) driving: ![rotation3](http://vooglaid.ee/red/rotation3.gif) Monday 12nd February, 2018 rebolek 15:50 Basic documentation for text-table is now available at https://gitlab.com/rebolek/red-styles/wikis/text-table BeardPower 15:55@rebolek Very nice! rebolek 15:57@BeardPower Thanks! toomasv 16:03Super! Sorry I haven't tried it yet with conversions table. :flushed: rebolek 16:04No problem at all, doing your paint program is time spent better than trying text-table :) toomasv 16:40Today's [advances](http://vooglaid.ee/red/manipulate1.gif): ![manipulation1](http://vooglaid.ee/red/manipulate1.gif) 9214 16:41@toomasv https://www.youtube.com/watch?v=RrxlbLVcpqI rebolek 16:41See? I told you so :smile: greggirwin 17:33Once we get an effect pipeline, there will be no stopping him! BeardPower 18:05Who is in charge for the effect pipeline? :smile: 18:06The Red blog needs some new postings ;-) toomasv 18:52POC of [animation](http://vooglaid.ee/red/animation1.gif): ![animation](http://vooglaid.ee/red/animation1.gif) BeardPower 18:54:+1: rebolek 18:55Can you record the animation? toomasv 18:55Not yet rebolek 18:55Ok, I'll wait 20 minutes ;) toomasv 18:55 :joy: 19:28No-recording! :wink: ![animation2](http://vooglaid.ee/red/animation2.gif) BeardPower 19:30Red has a new in-house animator :D rebolek 19:30:sun_with_face: :palm_tree: pekr 19:35cool :-) toomasv 19:41:smile: greggirwin 21:29This is great. :^) endo64 22:52That is very cool @toomasv !! Tuesday 13th February, 2018 toomasv 04:18Thanks guys! planetsizecpu 07:40@toomasv, this time you have surpassed yourself, very well done PeterWAWood 08:40@toomasv Pretty cool. A blue sky and fluffy white clouds sailing past for our next treat? BeardPower 13:37Widget 1/1000 :D ![Button](https://i.imgur.com/zQMkiAk.gif) 9214 13:38@BeardPower https://inception.davepedu.com/ :clap: rebolek 13:39@BeardPower COOL! toomasv 14:26@BeardPower Nice! BeardPower 15:45@rebolek Do you know hot to change the color of the pen dynamically? face/draw: compose [ pen (face/extra/color) ] I change it in on-time, print also shows me the changed value, but draw does not pick it up. on-time [ face/extra/color/2 + 1 print face/extra/color] ] 9214 15:47perhaps you should change color inside Draw block directly? 15:48it's not like Draw block "knows" that the color value comes from extra/color 15:48you just sticked it there with compose and that's it BeardPower 15:48But it takes the correct color from extra/color, when it's drawing it first. 9214 15:49yes, because you've inserted it there nedzadarek 15:49@BeardPower but that's compose has done 9214 15:49and from that moment it will sit there in Draw block until you'll change it BeardPower 15:49Ah, you mean it's a composed string, which does not change? 9214 15:49 text >> x: 1 == 1 >> b: compose [(x)] == [1] >> x: 2 == 2 >> b == [1] 15:50you expect 1 in b to change to something? BeardPower 15:50yes 9214 15:50why? 15:50it's just static data BeardPower 15:51Yeah, that was my issue :) 15:51Once composed, it stays that way, until I change the static data. 9214 15:51so what you need is something like face/draw/2: 15:52@BeardPower yes, it's like inserting something into template BeardPower 15:53:+1: Still wating for my "aha, now I get it" event ;-) 9214 15:54you want me to explain more? :D BeardPower 15:56Sure :) I changed the arc radius of the arc word through the path, but somehow I forgot, that I can change any code :blush: 9214 15:57there no two-side connection between a word and the value to which word is bound 15:58once value of a word composed into a block, it's just a value BeardPower 15:58It's basically like the Haxe macros, where values will be composed at compile-time. It's baked in, so to speak. 9214 15:59on the other hand, if you'll create [x] block and will change x word, x inside block will change its value too 15:59 text >> b: [x] == [x] >> x: 1 == 1 >> reduce b == [1] >> x: 2 == 2 >> reduce b == [2] BeardPower 16:00Thanks. So reduce can be seen as a baking command? 9214 16:01yes, but it will "bake" everything, which might be undesirable 16:01because of that sometimes compose is used, which is more flexible 16:02i.e. instead of face/draw: compose [ pen (face/extra/color) ] you can write face/draw: reduce [ 'pen face/extra/color ] BeardPower 16:05So composebaked the value into pen (face/extra/color), and so there is no variable any more, but only the value in memory. :+1: 16:06Which I can change through a path. 9214 16:07compose evaluated all paren! expressions 16:07face/extra/color evaluated to some value 16:07this value is now in draw block 16:08the fact that it's equal to the value in face/extra/color (and that it "came" from face/extra/color) doesn't mean that they are connected in some way BeardPower 16:09Thanks. Clouds are clearing already :) 16:11Awesome, works! rebolek 16:30@BeardPower sorry, I was offline BeardPower 16:34@rebolek No worries. I solved it with input from @9214 9214 16:35@9214 whispers in @rebolek's year "I'm omnipresent" rebolek 16:36You run in cloud, I knew that 9214 16:36:cloud: DideC 17:14@BeardPower To add to this, it depends of the type of the value. Integer!, float! and char! are direct values, so a word is bound to the value directly. If the value is a serie!, then it's the reference to that serie that is copied, not the serie itself: >> a: [ 1 2 3 4 5] == [1 2 3 4 5] >> a: next a == [2 3 4 5] >> b: reduce [a <hello>] == [[2 3 4 5] <hello>] >> a/2: 'new == new >> b == [[2 new 4 5] <hello>] >> b/1: head b/1 == [1 2 new 4 5] >> b == [[1 2 new 4 5] <hello>] 17:15b/1 and a are bound to a different offset of the same serie. 9214 17:17@BeardPower series! are passed by reference, scalar!s are passed by value DideC 17:18Thanks for the wording I had lost ;-) 9214 17:18@BeardPower and there's a "definitional scoping" thing, but it's not the time to trip you up ;) BeardPower 17:19@DideC Thanks! @9214 I have to read your scoping article again :) 9214 17:19@BeardPower I don't have one 17:20it's in perpetual TBD actually BeardPower 17:20Didn't you write this "rabbit hole" article? 9214 17:21[this one](https://github.com/9214/miscell/blob/master/red/spuny-mortals.red)? 17:21I wouldn't call it an article BeardPower 17:21Yes, the spoon one :) 19:19Widget 2/1000: ![Graph](https://i.imgur.com/Fwa6YDD.gif) 19:19Red is really awesome :+1: toomasv 19:38Implementation of arcs and [sectors](http://vooglaid.ee/red/arcs1.gif) drove me almost crazy: ![arcs](http://vooglaid.ee/red/arcs1.gif) rebolek 19:39@BeardPower very nice! greggirwin 19:55@BeardPower @toomasv, good stuff! toomasv 20:18Thanks! I'd like to challenge anyone to come up with a good algorithm to create arcs and sectors in following manner: 1. Set center 2. Set initial angle 3. Set radius 4. Draw arc/sector in both directions (clockwise or counterclockwise) 5. With any sweep (positive or negative) Something like this: ![arcs2](http://vooglaid.ee/red/arcs2.gif) Wednesday 14th February, 2018 toomasv 20:32[Nostalgic](http://vooglaid.ee/red/clock1.gif) ![clock](http://vooglaid.ee/red/clock1.gif) system/view/auto-sync?: off pos: 145x143 nums: does [collect [ repeat i 12 [keep compose [ text (as-pair (cosine i * 30 - 91) * 50 + (pos/x) (sine i * 30 - 91) * 50 + (pos/y)) (to-string i) ]]]] hyp: func [a b][sqrt add a ** 2 b ** 2] ang: func [a][180 / pi * arctangent2 a/y a/x] fin: func [s l w][compose/deep [shape [ move 150x150 'move (s) 'arc (as-pair 0 0 - s/y * 2) (hyp s/x s/y) (hyp s/x s/y) (ang s) large 'line (as-pair l / 2 w / 2 + s/y) (as-pair l / 2 w / -2) (as-pair l / -2 w / -2) ]]] time: now/time get-hour: does [remainder subtract add multiply time/hour 30 multiply time/minute 0.5 90 360] get-min: does [remainder subtract add multiply time/minute 6 multiply time/second 0.1 90 360] get-sec: does [remainder subtract multiply to-integer time/second 6 90 360] n: 0 view/tight/no-wait compose/deep [b: box 300x600 rate 1 on-time [ n: n + 1 time: now/time probe time/second hours/2: get-hour mins/2: get-min secs/2: get-sec pendulum/2: either odd? n [91][89] show face ] draw [ ;scale 0.5 1 [ fill-pen silver pendulum: rotate 90 150x150 [box 150x148 550x152 fill-pen gold circle 550x150 30] fill-pen brown polygon 50x250 50x80 150x30 250x80 250x250 rotate 152 150x30 [box 150x30 280x35] rotate 28 150x30 [box 145x25 280x30] fill-pen white circle 150x150 60 (nums) pen red line 150x145 150x155 line 145x150 155x150 pen black fill-pen gold hours: rotate (get-hour) 150x150 [(fin 6x-3 30 10)] fill-pen yello mins: rotate (get-min) 150x150 [(fin 4x-2 40 6)] fill-pen red secs: rotate (get-sec) 150x150 [(fin 2x-1 50 3)] ]; ] ] BeardPower 20:45Where is the cocoo? 😎 toomasv 21:02Still coming. As you can see, it's not full hour. greggirwin 21:21You always brighten my day @toomasv. :^) rebolek 21:25@toomasv you must have event recording by now (a.k.a. animation). Don't tell me you don't. greggirwin 21:26The commented scale line, with the semi after the right bracket near the end looked like a typo, but it works fine. 21:27Maybe just Gitter formatting that's off. Thursday 15th February, 2018 toomasv 04:18@greggirwin Yes, a typo. It's still running because the last line (extra bracket) will not be evaluated if you paste it from here. @rebolek So, I don't tell you. :wink: 12:04@BeardPower Mission [accomplished](http://vooglaid.ee/red/clock2.gif): ![cocoo](http://vooglaid.ee/red/clock2.gif) rebolek 12:05:+1: toomasv 12:05:) PeterWAWood 12:05👏👏👏 12:05Encore! Encore! Encore! BeardPower 12:07@toomasv :smile: :+1: Awesome! Now, Red needs sound! 12:10Is the cuckoo also made out of draw commands? 9214 12:11:hatched_chick: it's an emoji pic BeardPower 12:14Ah, I wondered, why it looks more like a chick ;-) toomasv 12:20It's a chicockoo rebolek 14:44Can anybody try this? On Wine, text coordinates aren'ŧ translated, so I wonder if it's Wine related, or Red bug: view [ base 300x100 draw[ push [translate 50x20 fill-pen 230.145.190 circle 10x10 10 text 20x0 "Text" ] ] ] DideC 16:26On Win 10 with system/build/date: 18-Jan-2018/11:35:36+01:00: 16:27[![image.png](https://files.gitter.im/red/red/gui-branch/0977/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/0977/image.png) toomasv 16:28Same here on W10 prapro 16:48Nice! 9214 17:16[![image.png](https://files.gitter.im/red/red/gui-branch/xPOu/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/xPOu/image.png) 17:17wine-1.6.2 17:17 text >> about Red for Windows version 0.6.3 built 25-Jan-2018/23:52:32+05:00 rebolek 17:36@DideC @toomasv @9214 thanks, so it's a Red bug. planetsizecpu 17:38@toomasv oh man this time you did it :+1: 17:41I like the dolor opening :smile: greggirwin 17:42I'm cuckoo for draw commands. Simple pleasures. Really fun @toomasv. planetsizecpu 17:43Door (sorry on phone) rebolek 18:41https://github.com/red/red/issues/3225 toomasv 20:03Some steps to [grouping](http://vooglaid.ee/red/grouping1.gif): ![gouping](http://vooglaid.ee/red/grouping1.gif) greggirwin 20:35Wow. Fantastic @toomasv . toomasv 21:12:) Friday 16th February, 2018 mikeparr 08:36@toomasv Is the link to your GUI code way, way back? Could you repost please? (Great Stuff!) toomasv 08:41@mikeparr It is quickly changing now. I'll post as soon as first round of ideas is implemented. Here are only haphazard glimpses. ldci 17:48redCV can write 24-bit color Tiff images now https://pbs.twimg.com/media/DWLKZb7W0AIZ6M8.png:large greggirwin 18:06Now, all we need to do is connect @toomasv with @ldci and we'll have a 24-bit TIFF paint program. ldci 20:29@greggirwin : with pleasure :) Code is here https://github.com/ldci/redCV toomasv 21:20Here is mine [https://github.com/toomasv/drawing/blob/master/drawing.red](https://github.com/toomasv/drawing/blob/master/drawing.red) Today got further with grouping (group elements are now individually transformable) and window resizing. Many things are not updated (or even implemented, despite appearances) and don't work. Beware! greggirwin 22:35Stars for both, since we don't have tokens ready to use yet. Saturday 17th February, 2018 toomasv 15:44First steps to [programmable figures](http://vooglaid.ee/red/programmable1.gif): ![programmed figures](http://vooglaid.ee/red/programmable1.gif) greggirwin 16:38Holy cow @toomasv! Very cool. toomasv 16:40:) prapro 17:55Nice! BeardPower 18:05@toomasv 😎 compose [Picasso] toomasv 20:14Complex [programmable animations](http://vooglaid.ee/red/animation3.gif): ![complex animations](http://vooglaid.ee/red/animation3.gif) 9214 20:16@9214 lies face down on the floor 20:17[![SlH6ztuW3xY.jpg](https://files.gitter.im/red/red/gui-branch/KNNJ/thumb/SlH6ztuW3xY.jpg)](https://files.gitter.im/red/red/gui-branch/KNNJ/SlH6ztuW3xY.jpg) toomasv 20:17 :cold_sweat: rebolek 20:30Animations. I knew that. :cinema: Sunday 18th February, 2018 greggirwin 01:33@greggirwin is drooling all over his keyboard. ldci 11:36@toomasv : watt's help-string in your drawing.red code? endo64 12:39@toomasv It reminds me the old & great animation program Fantavision on Amiga: https://www.youtube.com/watch?v=HM8Znjir418 toomasv 12:48@endo64 Thanks for inspiration! @ldci Sorry, no help-strings yet. I have to work on that -- after the interface has settled down. ldci 14:03@toomasv Thanks Toomas toomasv 14:43@ldci You are welcome! Just few notes for [current verison](https://github.com/toomasv/drawing/blob/master/drawing.red): To draw simple figures click on canvas and drag. To draw "poly-" figures (polyline and polygone) click and drag first line, then release and click and drag again to add lines. For manipulations (inserts separate translate, scale, skew and rotate) and transformations (inserts single transform) click and drag: * for rotation, click sets the rotation center, drag creates "lever" (preferably drag initially away from center in 0 direction, i.e to right) to rotate the figure * for scaling, click sets the start of scaling, drag scales in relation to 0x0 coordinates (I will implement "local" scaling, i.e. in relation to coordinates set by click) * for skewing, again, click sets start, drag skews in relation to 0x0 (intend to implement "local" skewing) * for translation, click sets start, drag translates. To play with animations, you have to: * first insert transformation(not manipulation!) for the figure, i.e. select figure and from menu select transformation and then click on canvas to set it, * then add animation descriptions to the "Animation" tab (print figure name, slash, number of , i.e number according to transformation syntax (can also use this: set [r-center angle scale-x scale-y translate][2 3 4 5 6] ... square1/:angle: tick, to change angle, tick is preset reserved word counting time ticks, * click "Animate" button on "Drawing" tab, * and (very ugly :flushed:) insert some figure (preferably very little, e.g. tiny line) somewhere on canvas to force animatin to start (for some reason I haven't figured out yet, animation will not start otherwise) Expect lot of errors and crashes :smile: 15:53OK, you can forget about the ugly final step. [Corrected](https://github.com/toomasv/drawing/blob/master/drawing.red). And primitive help added (as above). greggirwin 19:36I was going to add those notes to your gist, but saw you already have them as comments @toomasv. This is really fun stuff, and is something a lot of people will refer to in the future. toomasv 20:49@rebolek Now I can tell you: Yes! [Animations are saved](http://vooglaid.ee/red/animation4.gif). ![saved animation](http://vooglaid.ee/red/animation4.gif) rebolek 21:35@toomasv :clap: :clapper: :camera: greggirwin 21:42@greggirwin thinks @toomasv is somehow slurping up our collective brainpower and is also a time vampire. I seem to have less lately. Monday 19th February, 2018 prapro 04:51@toomasv very nice. Tuesday 20th February, 2018 nedzadarek 15:43Is there a easy way to set offset and size to the percentage of the free space of the window or the parent face? Something like this: https://www.w3schools.com/cSS/tryresponsive_grid.htm DideC 15:53No, actually Red does not handle resizing at all. Be sure this is planned, in the future. Red is still alpha and there is many missing parts. nedzadarek 16:01@DideC I see. Thank you. greggirwin 17:49@nedzadarek, you can use foreach-face to roll your own. There aren't set plans for a declarative wrapper over it yet, but that would be very doable. win: layout [ across style area: area 200x50 button area return button area return button area return ] rows: 3 win/actors: object [ on-resizing: function [face [object!] event [event!]][ w: face foreach-face/with win [face/size/x: w/size/x - face/offset/x - 10] [face/type = 'area] y: w/size/y / rows i: 0 foreach-face win [ if face/type = 'area [face/size/y: y - 10] face/offset/y: y * (i / 2) + 5 i: i + 1 ] ] ] view/flags win [resize] 17:51By adding your own info in extra for a face, you should be able to do quite a bit without too much effort. toomasv 20:34@nedzadarek Or you can make it hard way (but fine-grained), as e.g.: on-resizing: func [face event][ tab-pan/size: win/size - 17 foreach tab tab-pan/pane [ tab/size: tab/parent/size ] drawing-panel-tab/offset: 0x0 drawing-panel-tab/size: drawing-panel-tab/parent/size - 4x20 info-panel/size/y: info-panel/parent/size/y - info-panel/offset/y - 10 options-panel/size/y: options-panel/parent/size/y - options-panel/offset/y - 10 drawing-panel/size: drawing-panel/parent/size - drawing-panel/offset - 120x50 img/size: drawing-panel/size figs-panel/offset/x: figs-panel/parent/size/x - 110 figs-panel/size/y: figs-panel/parent/size/y - figs-panel/offset/y - 15 figs1/size/y: figs-panel/size/y anim-panel/offset/x: anim-panel/parent/offset/x + 100 anim-panel/offset/y: anim-panel/parent/size/y - 38 anim-panel/size/x: drawing-panel/size/x animations/offset: 0x0 animations/size: animations/parent/size - 5x25 show win ] Thursday 22nd February, 2018 nedzadarek 00:54@toomasv @greggirwin thank you for the responses on-resizing + layoutX/actors seem to be better alternative than react. toomasv 10:04Added [ortho-drawing and grid, freehand too]((http://vooglaid.ee/red/gridortho1.gif)) to [drawing](https://github.com/toomasv/drawing/blob/master/drawing.red). ![](http://vooglaid.ee/red/gridortho1.gif) 9214 10:05any plans to sold your paintings for tokens? :) toomasv 10:06Could open a modernist art gallery :wink: 9214 10:48@9214 s/sold/sell/ BeardPower 11:01People will kill for a genuine Vooglaid 😁 11:03Now you only have to come up with your personal "Mona Lisa". toomasv 14:31@BeardPower [Voila](http://vooglaid.ee/red/monalisa1.gif): ![monalisa](http://vooglaid.ee/red/monalisa1.gif) rebolek 14:32:D Garfield100 17:30Hello, there's this annoying thing with windows scaling 17:31Setting the resolution to 1920x1080 on a 2.7k screen more than fills the whole screen 17:32Due to the windows scaling setting being set to 200% 17:32If I set it to 100% it works and has the correct size, but that's not an option for me because it makes everything really really small 17:33So my wish is to add an option to make it independent of scaling dander 18:00@toomasv so genius :joy: toomasv 18:29@dander :) BeardPower 21:42@toomasv :+1: DideC 22:13@Garfield100 Have a look to system/view/metrics, there is the dpivalue there. 100% is 96 dpi. Yours may be 192 for 200%. greggirwin 22:18@toomasv +10 @Garfield100, this is something we should note, because monitors are crazy now. It used to be you had to know if it was CGA, EGA, VGA, or some crazy res like SVGA. Friday 23th February, 2018 viayuve 12:19 @toomasv wow new version is cool can it do 3d like object creation cant cutting it around. toomasv 12:25@viayuve Thanks! Sorry, no 3d-like objects. viayuve 12:28ok cool now you have new idea in your book :smile: @toomasv Garfield100 12:49@DideC slightly embarassing question... where is system/view/metrics? 9214 12:50@Garfield100 >> system/view/metrics == make object! [ screen-size: none dpi: 96 paddings: #( check: [16x0 0x0... Garfield100 12:50oh 12:50thanks :D 12:54@9214 even more embarassing question, how do i change the dpi? 12:54colon doesn't work 9214 12:54:no_mouth: >> system/view/metrics/dpi == 96 12:55what value does it have in your case? ne1uno 13:06DPI may come from your monitor driver or system. mine is 120, that's about what I have it set in custom properties win7 13:17full resolution size window is close in width, height is a little extra, not much DideC 13:40@Garfield100 There was work on DPI awareness in october-2017: #3075. So what Red version do you use? toomasv 13:51@Garfield100 Not sure if this helps in your case: I have a similar problem if my laptop is occasionally connected to bigger monitor with different resolution. I once asked qxtie about this, and he said, he knows of the problem but doesn't have a good solution for now. I can restore the right resolution by restarting (not good, I know). Garfield100 15:08I'm using version 063, downloaded only a few days ago 15:09@9214 it has 96 too 15:10Colon works and it "sets" it too but when I run the program nothing changes and when I restart the console It's back to 96 DideC 16:27Changing it will not have any effect. It's just the copy of the windows settings, so that your program can access it. 16:28Assuming that 96 is 100% zoom. If when it's set to 200% your window appear two time larger than expected, then you have to divide your size by 2. Garfield100 16:40I looked up the ppi and I'ts apparently 267 16:40So what do I do if I can't change it? DideC 16:46ie: scale: system/view/metrics/dpi / 96 ; compute scale factor to apply win-size: system/view/screens/1/size * scale - 100x100 ; size scaled and reduce to if if fit near the screen size view [size win-size text "test" button "Quit" [quit]] greggirwin 17:01@Garfield100, for exploring, https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5 might be of some help, crude though it be. 17:01e.g. Find isn't implemented yet. viayuve 17:03@greggirwin is android target is in working condition greggirwin 17:07I've seen working demos, but haven't played with it myself. viayuve 17:08With GUI or without?? @greggirwin greggirwin 17:10With. 9214 17:13http://static.red-lang.org/droid-eval.png http://static.red-lang.org/hello-arm-android-small.png viayuve 17:20@9214 you are so cool I will put my small sqlite program In android now 9214 17:20wat 17:20I'm not, Red Team is :) rebolek 17:24@9214 deal with it, you are cool too. 9214 17:26@rebolek [Stahp it Ron... Stahp](https://www.youtube.com/watch?v=FWtO0cfgewY) :flushed: ! BeardPower 17:27LOL Garfield100 17:51@greggirwin :O awesome! thank you Saturday 24th February, 2018 toomasv 19:15:tada: Got precise [zooming](http://vooglaid.ee/red/zoom1.gif): ![zoom-example](http://vooglaid.ee/red/zoom1.gif) Phryxe 19:39@toomasv Amazing. You really got the hang of DRAW. BeardPower 19:40Great. Is it possible to draw icons and export it's draw commands? You should add a grid: quadratic and isometric 😎 toomasv 19:43@Phryxe Thanks! To get the zoom was a real headache. :) @BeardPower Exporting draw as image in plans! Have to see about quadratic and isometric grids. BeardPower 19:51Is it already possible to draw something and copy/paste the draw commands behind it into my Red code? 19:52Would be great, as I need to re-create some icons with draw commands. toomasv 20:14You can save your drawing and open it in editing prg, and do whatever you want with it. It s essentially a draw block. BeardPower 20:46Great! Will come in handy for my widgets. A grid would make it even more splendid. toomasv 20:53You mean visible grid? Gridlines or -dots. Because grid is already there in invisible form. BeardPower 21:08Yes, a visible grid. 21:09So it can see the grid/snapping to create icons and isometric art. 21:10It gives me the possibility to re-create my vector drawings with draw commands. 21:13[![grid.gif](https://files.gitter.im/red/red/gui-branch/1O3i/thumb/grid.gif)](https://files.gitter.im/red/red/gui-branch/1O3i/grid.gif) 21:13This is the grid from Affinity Designer. 21:13Make it happen ;-) Please! toomasv 21:14Yes, visible grid should be soon. By now here is invisible isometric grid drawing ![isometric](http://vooglaid.ee/red/isometric.png) BeardPower 21:14@toomasv Damn! You are the man!!! 21:16Your tool is great to design widgets, without the additional step to hand-craft draw code. toomasv 21:16Great! :bath: BeardPower 21:16Do you know Affinity Designer? It has some nice features you could ~~~steal~~~ implement. toomasv 21:17I'll look into it! Good night! BeardPower 21:17Very much appreciated! Good night! greggirwin 21:19It just keeps getting better @toomasv. Fantastic! BeardPower 21:20Absolutely. He should form a company: TooMassive Software ;-) 21:22@toomasv I'm assuming this is "just" a spare time project of yours? 21:23Because the funny thing is, that similar software took years to be released. 21:23Well, surprisingly would be a better wording. 21:24A question to be answered, though: Is it because of the tools or the skills or a combination of it :smile: Sunday 25th February, 2018 dander 00:09@toomasv watching your progress has been impressive and inspiring! BeardPower 00:45@viayuve Another widget: 3/1000 00:46 00:55[![switch.gif](https://files.gitter.im/red/red/gui-branch/XZGz/thumb/switch.gif)](https://files.gitter.im/red/red/gui-branch/XZGz/switch.gif) 00:56There are some drawing artifacts on the right edge of the switches because of the facet is cut off a little bit (1-2 px). Maybe a bug. nedzadarek 00:59> Because the funny thing is, that similar software took years to be released. > A question to be answered, though: Is it because of the tools or the skills or a combination of it :smile: I think tools are better nowadays. I can write a few lines of code instead of a few pages which the same effect. BeardPower 00:59@nedzadarek Sure, but the software was not started in the 80ties but 3 years ago. nedzadarek 01:00? BeardPower 01:01You said, that tools are better nowadays. Sure, but the tools 3 years ago were not THAT bad. 01:02So using tools from 3 years ago took some people 3 years to come up with the same app @toomasv was creating in less than 3 years with actual tools :smile: nedzadarek 01:05What kind of software was created in the last 3 years? Can you give me an example? BeardPower 01:06You mean, which does a similar thing like the Drawing pad? nedzadarek 01:06The Drawing pad? You mean Toomas thing, right? Then yes. BeardPower 01:07Yes. nedzadarek 01:07Ok, so what's the example. BeardPower 01:08Paint 3D :smile: 01:12Or Pencil2D. Well, if @toomasv is developing at this speed... 01:13I'm exaggerating a little ;-) nedzadarek 01:16@BeardPower but his program draw in 2D. Or did I miss something? BeardPower 01:17@nedzadarek Yes, as Pencil2D does. Paint3D evolved into the 3D space. nedzadarek 01:18I mean with Drawing pad you can draw in 2D only. BeardPower 01:18You can also compare it with Affinity Designer. Drawing pad has already a lot of the tools :) 01:19@nedzadarek It's 2.5D 01:21Drawing pad is similar to Apple Flash. nedzadarek 01:22I think Affinity designer is much bigger than Drawing pad - as fair I can see from video. BeardPower 01:23I'm just saying: it's really great, what @toomasv achieved in this short time using Red. 01:24Yes, Affinity Designer is great. Add layers, effects and some positioning tools to Drawing pad -> Affinity Designer light (vector graphics wise) :smile: nedzadarek 01:25> Drawing pad is similar to Apple Flash. That was made in 1996. I hadn't gotten a computer at that time. BeardPower 01:26Sorry, I meant Adobe Flash. 01:28I was referring to the Adobe version, not the Macromedia one from 1996. nedzadarek 01:34> I'm just saying: it's really great, what @toomasv achieved in this short time using Red. I don't mean his program is bad. It's just he is using some features - that's why he can write it faster. I tried writing some 3d stuffs in C/C++ some years ago... I ended with simple lines. Using the Red/Rebol I can just write 1 line of code. > I was referring to the Adobe version, not the Macromedia one from 1996. This one: https://en.wikipedia.org/wiki/Adobe_Flash_Player ? The Adobe bought Macromedia. BeardPower 01:39@nedzadarek Sure. Maybe I just have the "Red fever" ;-) Yes, this one. I was using versions of Macromedia (Flash 3). The newer Adobe versions are not really comparable with the Macromedia software, of course. Flash is EOL in 2020 anyway, so there is room for a "successor". nedzadarek 01:42There are some successors waiting... i guess. BeardPower 01:45Well, SVG is/was awesome. SVG 2.0 is not getting somewhere. Adobe unfortunately also "killed" SVG. html5, canvas, WebGL, you name it, but they are all just rasterizing graphics. I'm not aware of anything related to vector graphics. 01:47OpenVG is also not coming up to speed and broad adoption. 01:48At least they discussed about including Cairo into the C++ standard. rgchris 04:39SVG has much wider support (in browsers at least) than it used to. I like that I can edit SVG in a text editor, copy and paste into Affinity Designer as a graphic and vice versa... 04:41I do have issues with SVG design though—it's a very eclectic format (nominally XML) that has many sub-par ways of doing the same thing. toomasv 05:39@nedzadarek @BeardPower I agree that developing that fast is possible mainly thanks to the great tools like Red (/View/Draw). (And little bit of curiosity). @greggirwin @dander Thanks! @BeardPower Great widget again! I think the "artifact" is caused by the way borders are drawn. Compare [these](http://vooglaid.ee/red/borders2.png): view/no-wait [base 100x100 draw [line-width 5 pen red circle 50x50 50 line-width 1 pen blue circle 50x50 50]] view/no-wait [base 105x105 draw [line-width 5 pen red circle 52x52 50 line-width 1 pen blue circle 52x52 50]] view [base 100x100 draw [line-width 5 pen red circle 50x50 47 line-width 1 pen blue circle 50x50 47]] ![borders](http://vooglaid.ee/red/borders2.png) Also :point_up: [January 22, 2018 6:24 AM](https://gitter.im/red/red/gui-branch?at=5a65677b517037a212d84cb6) viayuve 07:26@toomasv wow may be next Photoshop or AutoCAD in red is coming toomasv 07:27:laughing: 9214 07:27Photooshop and AutooCAD I'd say viayuve 07:28That would be so cool 07:28Or blender who knows 07:29Good morning everyone :wine_glass: toomasv 07:30Reblender would be great! Good morning :tea: viayuve 07:31:+1: toomasv 08:48@BeardPower More-or-less correct proportions for true isometric grid would be 26x15 and 40x23: repeat i 30 [probe reduce [j: i + 10 j * tangent 30] [ ] [11 6.350852961085883] [12 6.928203230275509] [13 7.505553499465135] [14 8.082903768654759] [15 8.660254037844386] [16 9.237604307034012] [17 9.814954576223638] [18 10.39230484541326] [19 10.96965511460289] [20 11.54700538379252] [21 12.12435565298214] [22 12.70170592217177] [23 13.27905619136139] [24 13.85640646055102] [25 14.43375672974064] [26 15.01110699893027] [27 15.58845726811989] [28 16.16580753730952] [29 16.74315780649915] [30 17.32050807568877] [31 17.8978583448784] [32 18.47520861406802] [33 19.05255888325765] [34 19.62990915244728] [35 20.2072594216369] [36 20.78460969082653] [37 21.36195996001615] [38 21.93931022920578] [39 22.5166604983954] [40 23.09401076758503] 12x7, 14x8, 19x11, 33x19, 38x22 are not bad too. BeardPower 11:45@9214 Would be a perfect fit, as AutoCAD has AutoLISP :D 11:50@toomasv Yes, Draw has a shortcoming: It's only supporting mid. Inner and outer is missing, so you have to recalculate positions. There is also an issue with sub-pixel rendering. If you create a line with a line width of 25, it ends up as 12.5x above and below. Does Draw support sub-pixel rendering? Pair takes a float for the first part: 12.5x12 but not 12.5x12.5 and not 12x12.5 -> is this a bug? 11:51Isometric projection has an angle of 120 degrees between two coordinates. 11:53Which is sqrt of 2. 9214 11:54@BeardPower see https://trello.com/c/MR6HCDxV/186-red-core 11:54> Add floats support to pair! (required for Draw) BeardPower 11:55@9214 Thanks! Use the source, Luke! ;-) toomasv 11:55pair! accepts float on first position but turns it to integer!. BeardPower 11:55@toomasv Yes. I just recognized this behavior in the REPL. toomasv 11:56Above series is calculated to have (approximately) 120 deg between grid points. BeardPower 11:58@toomasv Ah, yes, Of course. Need to nip on my N00bsauce :smile: 12:00I'm voting for 26x15 as it would produce a minor error. toomasv 12:01Agreed BeardPower 14:25@toomasv So, let's continue here. After I cleared the canvas, I was not able to draw anything anymore. toomasv 14:26Yes, I saw that. Working on it. BeardPower 14:27Great! So is there a possibility to get to the Draw code, which produced the drawing, though some popup like widget? 14:28Oh! Another issue: I'm not able to read the complete help text, as the text facet is not scrollable. toomasv 14:56@BeardPower Please try [this](https://github.com/toomasv/drawing/blob/master/drawing.red). I weeded out two bugs. Hope you can clean the canvas now. Also zooming was blocked after transformations. Released it too. You can select "Save as .." from "File" menu after drawing, and, well, save it :wink: . I'll look now on help. BeardPower 15:04@toomasv Excellent! Works! toomasv 15:04Halleluya! BeardPower 15:05A visible grid and I'm able to create my fancy expressions :D 15:08Is "Move" and "Clone" not implemented yet? 15:10And is it possible to re-arrange the drawing commands? 15:11The "Move" command is stuttering, when Grid is enabled. toomasv 15:12"Move" should work until you haven't transformed/manipulated anything. "Clone" is not implemented yet. I split "Help" into two parts to accommodate to the text-face's "volume". Will look into Move. BeardPower 15:13Another issue: when I draw a filled circle with a border and move it back (z order), the filling disappears. Moving it forward again, it shows the filling. toomasv 15:14You have to move the fill behind of the figure. ("Move" jumping around with grid is funny) BeardPower 15:14I can't move the filling alone. 15:14I will make a gif toomasv 15:15What does it do? I just tried, and it seemed to work! BeardPower 15:17Ah sorry. It was PEBKAC :) 15:18Z-Order is achieved through moving around the drawing commands. I though you are manipulating the z-Buffer. 15:19But what does "Move Before" do? 15:20It does not seem to do anything. toomasv 15:25Not implemented. It will put the selected figure before the next one you will click on the list. (What is PEBKAC?) BeardPower 15:26Nice! PEBKAC: Problem Exists Between Keyboard and Chair :D toomasv 15:26:) 9214 15:26aaah, the thin layer of meat and bones between PC screen and armchair 15:27causes me so much headaches every debugging session BeardPower 15:27Yep, the first thing to check if something is not working :smile: 9214 15:27any news from Red team on fixing it? BeardPower 15:28No signs of Red/AI. toomasv 16:35@BeardPower I exposed draw-block for direct [editing](https://github.com/toomasv/drawing/blob/master/drawing.red)/copying (center menu). But, there is a little bug - after editing and "Show"ing, you have to "touch" zoom (e.g. scroll wheel 1 forward and back) to continue - otherwise error is generated (don't see yet the cause). BeardPower 16:45Thanks! 16:46I made some first tween/animation tests: 16:46[![tween.gif](https://files.gitter.im/red/red/gui-branch/biS0/thumb/tween.gif)](https://files.gitter.im/red/red/gui-branch/biS0/tween.gif) toomasv 16:50Niiice! BeardPower 16:53It would be smoother, once pair supports float!. greggirwin 19:28:point_up: [February 24, 2018 5:55 PM](https://gitter.im/red/red/gui-branch?at=5a920972c3c5f8b90dff9747) cool toggle style @BeardPower! Is the code somewhere, so others can try to confirm the behavior. If it's a bug, it's worth a ticket. 19:34Great stuff all around! @toomasv, do I need %frame-with-picture_1f5bc.png from somewhere? I just went to run your latest and it seems to need that. 19:35@BeardPower if you process /x /y separately, it's a bit more work, but should let you get around the pair/integer issue. Really nice example, though. 19:37I also had the same thought about AutoLisp, and when we build our IDE, that EMACS is built on Lisp (this is an old idea, and Cate Dixon even wrote a little editor in R2 many years ago), so we have the foundation for all these things already. We'll also want something like AREXX ports for controlling them. So much exciting stuff to build! 19:38I really love seeing all the little experiments pop up, and then grow too-massive proportions. prapro 20:21@BeardPower I've been considering porting my AI stuff to Red. Pattern recognition and genetic algorithm stuff. Need to make a DSL for it. toomasv 20:26@greggirwin Sorry, forgot to load it up. Now it is there. It's a [pic for image button](https://emojipedia-us.s3.amazonaws.com/thumbs/160/emoji-one/44/frame-with-picture_1f5bc.png). Images can be imported, but this work is not completed. greggirwin 22:05Thanks @toomasv ! BeardPower 22:29@greggirwin I need to clean up the code and will upload it to gist later. The issue is not pair, but Draw only taking integer values. E.g. you create a line with line-width 25. The lines are drawn from the middle, there is no option for inner or outer. So the upper and lower half of the line will be 12.5px. To render this, it will need sub-pixel rendering and the possibility for float coordinates. OpenGL/DX does not know of pixels, just coordinates, but Draw is only mapping full pixels. 22:30@prapro Great! greggirwin 22:46Thanks for clarifying @BeardPower. BeardPower 23:45You're welcome. Is Red's Draw dialect/Draw engine an implementation of Rebol2 and will it be re-implemented like Rebol3 did? Monday 26th February, 2018 greggirwin 00:03It's a clean-room implementation, AFAIK, with features included that were needed at the time. Noting what would help going forward is always good. DideC 08:37@BeardPower This remind me the work I have done on an animation dialect for VID. Mostly cloning CSS idea. Just a proof of concept https://gist.github.com/DideC/c9a894fcb01c5b4e2f11706445b50516#file-animate-red rebolek 10:20@DideC very nice! 10:20Here's some experiment with draw block resizing: https://gist.github.com/rebolek/4c12acd869a222ce07022c65f8383ba6 BeardPower 11:04@DideC Nice. I want to separate my animations completely from view, vid or anything else. I will post some more experiments with color and facets. DideC 11:21@BeardPower It is not tied completly to the VID code. You could make the layout first, then use the animate func to add an animation later, but you have to named the faces. The only required thing (actually) is the animation face that handle the timer. But it could be add to the window pane outside of VID too. 11:22@rebolek @BeardPower Thanks. BeardPower 11:28@DideC I need to check your code more deeply. My goal is also to create some DSL. It's using the delta time of whatever timer you feed it. Just like a game loop would do. E.g. feeding the rate of the facet to it. 12:36Do I miss something here, because the box is not scaled by 2.0: scale 'fill-pen 2.0 2.0 fill-pen 0.255.0 box-1: box 0x280 30x310 Zamlox 12:38@BeardPower you are applying scale on fill-pen not on the box: https://doc.red-lang.org/en/draw.html#_scale 12:42if you want on the box, then try: scale 2.0 2.0 fill-pen 0.255.0 box-1: box 0x280 30x310 BeardPower 12:54@Zamlox Thanks. So this is just scaling the line-width? >When the 'pen or 'fill-pen lit-words are used, the scaling is applied respectively to the current pen or current fill-pen. 12:55I made some more tests with color and scaling: 12:55[![tween_2.gif](https://files.gitter.im/red/red/gui-branch/B6CX/thumb/tween_2.gif)](https://files.gitter.im/red/red/gui-branch/B6CX/tween_2.gif) 12:56Works nice already :) rebolek 12:57Yes, nice :) BeardPower 13:02ToDo: adding > 40 easing functions, partial animations and creating a DSL. 13:03Widgets come to live with tweens. The Live coding environment of Red is really awesome to try out stuff. toomasv 13:04@DideC Very nice examples! @BeardPower :clap: BeardPower 13:06The animated gif is a little stuttering, because I recorded it with 15fps. The animations are 60fps. Zamlox 13:09@BeardPower You can apply transformations on pen or fill-pen but you will notice a visual effect only when they use gradient/pattern/bitmap. There is no difference when you apply on solid color. BeardPower 13:10 Zamlox 13:10@BeardPower ;) pekr 13:41Guys, maybe we will replace good old Scala Multimedia :-) BeardPower 13:47@pekr I never used that. Can you post a link with examples? Maybe we can ~~~steal~~~ lend something from it. pekr 13:49I need to find doc for a ScalaScript. When you created a presentation, it generated script. You could adapt it, place variables there, etc., so that content could be really dynamic. rebolek 13:50it was like PowerPoint, only much better pekr 13:51It still has old Amiga like UI :-) https://scala.com/wp-content/themes/scala-child-2/assets/images/design-gallery/6.png 13:52Their animations were super-smooth. I remember old Amiga guys (Dave Haynie) writing about it, when they ported to Windows initially. They had to basically write their own kernel. But, that might be before DirectDraw etc. BeardPower 13:53Crazy! :) 13:55Yeah, thanks we have DX and OpenGL now. Many of the transitions could be implemented as a shader. 13:57We need ReShadertoy ;-) https://www.shadertoy.com/ pekr 13:57Back at some time, I thought about replacing Scala by Rebol :-) The designer is just one part, but then, you pay for a "network". They covered whole Olympic games by that platform. Was it Lillehamer? Don't remember already. You pay for your device, square meters, they can connect to satellite boxes, etc. It is kind of a broadcasting signage platform .... 13:58Nice. @BeardPower Do you know what was the original name of Rebol? BeardPower 13:59@pekr Sounds a lot like http://www.vizrt.com/ 13:59No. I never used Rebol before. Tell me :) pekr 13:59Before Carl decided to go with the REBOL name, the project was called - LAVA (Language for Audio and Video applications). The supposed OS was supposed to be called MagmaOS. Nice names .... BeardPower 14:01Interesting. Coming up with a name for your software or your company is the hardest part ;-) rebolek 14:02Yeah yeah, LAVA and then sound was only in paid version ;) BeardPower 14:02What was the price of it back then? rebolek 14:0350 USD I believe. 14:03There were multiple paid versions. BeardPower 14:03So was it like the Affinity approach? An alternative to the Adobe products, but for a fraction of the costs? pekr 14:04That's what I think kind of killed Rebol mostly. Putting stuff like /sound /call /library into paid versions ... well, maybe /call was free, I don't remember anymore rebolek 14:04Ah, I'm talking about Rebol. I don't know Scala's price. 14:04@pekr I believe that call was in paid version together with sound. pekr 14:05As for Rebol, it never actually proved itself in the multimedia area. The sound support was just basic, and untill Draw was reimplemented using AGG, it was not usable for animations .... 14:05I would like to see Red being successful in that area though! rebolek 14:05So much for the language for audio and video applications ;) pekr 14:06Doc stated they are planning for the equivalent of the gob, in principle, most probably not in implementation, to allow stuff like games, etc. rebolek 14:06That makes sense, gob is great thing. BeardPower 14:06To be Red successful in that area, it needs some "killer apps" :) rebolek 14:06You do remember 1000 cows :) pekr 14:071000 cows is an essential engine performance testing demo :-D rebolek 14:07:) BeardPower 14:07Is this the bunnymark of Red? :D 14:08Actual engines can render 600k bunnies (scaling + transformation) on a 3 year old machine. 14:08@60fps of course. rebolek 14:08@BeardPower something like that, yes. BeardPower 14:09@pekr Gobs would be awesome. It's a must-have for graphics intensive applications. 14:10@StephenStrickland Sorry, but what is LSP? rebolek 14:10language server protocol, I believe BeardPower 14:11Ah. So nothing graphical related. 14:11Maybe there is LSP in that area as well :D 14:11Ah, I just see, he posted in the wrong room. StephenStrickland 14:12yeah, realized I posted in the wrong room.... BeardPower 14:12:+1: 14:13No worries. I'm the master of going OT ;-) rebolek 14:14@pekr so here's a list of paid /Pro features: "encryption, library calls to external DLLs, sound, and shell access." BeardPower 14:18Regarding sound, there are some great positional audio resources to copy from. 14:19The Red baby needs to learn to speak :smile: prapro 15:23I believe a lack of funding 15:24... required them to monetize the it before it made sense to do so. 15:26Ugh... Typos. Good thing I'm not coding this morning. 😀 rebolek 15:26:) BeardPower 15:31At least that part is out of the way. prapro 15:34I always thought implimenting something like scratch would be a good idea. 15:35Question is how to do better. I don't think a cheap copy is the way to go. BeardPower 15:42Right. Why choosing the copy, if you can get the original. But what I meant with copying: get inspiration from. 15:43Another question is: What applications do customers need/want/look for? prapro 15:46Exactly, inspired by, but better. 15:48There's a lot of customers out there. I tend to do a lot of oddball things. Connecting this to that sort of stuff. 15:49POS systems are a big deal. 15:49Accounting 15:50Really all the core products of computing since day 1 are still big deals. 15:51Resource planning 15:52Data mining 15:53Virtual assistant 15:56Open assistant? Sounds disruptive. rebolek 16:02:) BeardPower 16:02What is an "Open assistant"? 16:03Will it assist, before I even know I need assisting? rebolek 16:10Well with machine learning it's possible to a degree BeardPower 16:12So please train me a network, so I can lean back :) 16:12Red/MakeMeMoney prapro 16:18Basically. The rebolek 16:18We need our own virtual assistant with female name and voice, like Siri, Cortana or Alexa. prapro 16:19Exactly. And the thing with pattern recognition is its a problem that divides well. Works great for distribution computing model. 16:22My BeardPower 16:22Red Sonja? ;-) rebolek 16:23Yes. BeardPower 16:25I personally don't like to send data (what I typed, what I spoke etc.) over the ether to some company selling it to some third party. prapro 16:37Your only sending fragments here and there since it's faster that way. You can put all those useless crypto cycles to work. Crosscheck isn't as easy as a hash, but not terrible. BeardPower 16:40Megabytes of data sent over, are not fragments ;-) Cortana and Win10 itself, sends over loads of data. prapro 16:44You just don't send it all to the same miner. But it would be nice if one could process encrypted patterns (while there encrypted). I'll have to think about that. BeardPower 16:49That's correct, but there is a high chance of the same pool mining your data. 16:50I think we are in the wrong room, again ;-) prapro 16:50Yeah BeardPower 16:51But I totally agree with you, that the wasted crypto-cycles could be brought to good use. 16:53@prapro >But it would be nice if one could process encrypted patterns (while there encrypted) You would need homomorphic encryption for this, but unfortunately it's in it's infancy and computational hungry. prapro 17:02Especially when pattern recognition is thrown into the mix. 17:04Consequently it's no good for virtual assistant. Perhaps other uses though. 17:06It's = distributed pattern recognition system greggirwin 18:30@DideC @rebolek @BeardPower nice! RedHotLava sounds great to me. @justjenny isn't around much, but I think she had a Red Sonja reference somewhere. 18:38@BeardPower, coming back to lerp, my original was this: map-range: linear-interpolate: func [ src-min [number! pair!] src-max [number! pair!] dest-min [number! pair!] dest-max [number! pair!] value [number! pair!] ][ add dest-min ((value - src-min) / (src-max - src-min) * (dest-max - dest-min)) ] But you use single values, in a fixed range of 0 to 1 IIRC, as your base model. That is, you don't need the src-* values I have there. We can do it with refinements, which might then look like this: lerp: func [ "Make sure at least one arg is a float if you want float calcs, for now" x [number! pair!] y [number! pair!] val [number! pair!] "Value between 0 and 1, where 0 == x and 1 == y; can be pair! if /with is used" /with "Map val from [x2 y2] instead of [0 1]" x2 [number! pair!] y2 [number! pair!] ][ either with [ add x2 ((val - x2) / (y2 - x2) * (y - x)) ][ add (1 - val * x) (val * y) ] ] lerp 0 10 .5 lerp/with 0 10 50.0 0 100 So the arg order is quite different. We could also use blocks, or even a dialected interface. Thoughts? BeardPower 18:40The issue with refinements is, that these are conditionals, which eat a lot of cycles in a real-time application. greggirwin 18:41I should maybe us m n instead of x y as names. :^\ How fast does it need to be? BeardPower 18:42As fast as possible :) Why do you even need x2 and y2, if you can just use lerp on the value you want to interpolate? rebolek 18:42faster than assembler, I believe 9214 18:42Speedy Gonzales? greggirwin 18:42> As fast as possible That's not an answer. ;^) rebolek 18:42@9214 ! BeardPower 18:42;-) Well, if you don't need conditionals, why use them? rebolek 18:43E = m x Speedy Gonzales^2 BeardPower 18:44What is the probability of having 2 values interpolated instead of 1 or more? greggirwin 18:44> Why do you even need x2 and y2, if you can just use lerp on the value you want to interpolate? Without them, you have to do that mapping yourself, yes? It's about how we express the intent. 9214 18:44$$E=mSG^2$$ BeardPower 18:45Yes. If I want to lerp x an y -> two lerp calls. Yours would only need 1 call, but a conditional. 18:45E.g. lerping color, would need 3 or 4. rebolek 18:46@9214 it's like the Ilsa Gold's song I've posted...getting faster and faster... BeardPower 18:46translate and scale even more. So should your function take addional refinements for 3, 4, 5 and more lerps? greggirwin 18:47It's not about an X and a Y in a Cartesian sense (hence those are bad names), but about mapping a value between two ranges. The basic lerp is just a special case with an implicit range of [0 1] for one of them, yes? BeardPower 18:48Interpolation only needs 2 values: start end endpoint, but these are not pairs, only single values. 18:48E.g. 100 - 450; 0 - 255 -> only two values needed, not 4 18:49The current value (x) is implicit. You only need to calculate y. greggirwin 18:49> 100 - 450; 0 - 255 I see 4 values there. BeardPower 18:50Because these are two lerps. 100 - 450 -> for the position. 0 - 255 for the color. greggirwin 18:51> The current value (x) is implicit. Right, my version makes the implicit explicit. BeardPower 18:51Exactly. greggirwin 18:51OK, we're on track. Whew! BeardPower 18:51Hard to explain in chat :) 18:52And yes, x and y is not an ideal name. greggirwin 18:52Now the question is whether that adds expressive value, and how to weigh that against the extra params and performance overhead. BeardPower 18:52So, do you think we should go implicit or explicit? greggirwin 18:52I didn't use x y in my original, probably for that reason, though it's a really old func. BeardPower 18:52I see. greggirwin 18:53I think we should...experiment. 18:54I have a couple simple wrapper examples, which is how to simplify the calls, but at the cost of performance. map-from-pct: func [dest-min dest-max value][ linear-interpolate 0% 100% dest-min dest-max value ] map-to-pct: func [src-min src-max value][ linear-interpolate src-min src-max 0% 100% value ] BeardPower 18:54The tween is calulated for [0 .. 1] (based on the actual frame and the fps/time of the animation period) and then "lerped" based on the absolut values. greggirwin 18:55And I have an old make-linear-interpolater func that lets you spec the params once, then just call the generated func with your value. rebolek 18:55Guys, you are talking about Red VID code, is one interpreted branch condition really such a problem? ;) BeardPower 18:55 quintIn rate value: lerp rate-19 10.0 450.0 greggirwin 18:55This is getting interesting. Because I never thought in terms of animation, only ranges of values. BeardPower 18:56@rebolek Spectre and Meldown; Remember? ;-) greggirwin 18:56@rebolek, that's why I like hard numbers for "how fast". If we have a hard number, we can decide if we need to optimize. 9214 18:57> hard https://www.youtube.com/watch?v=exbxd-NumqY rebolek 18:57@BeardPower aren't we just doing the design for Mill? ;) BeardPower 18:58@rebolek You got me! :) 18:59The branching would not be an issue, of course. It could suck some frames, it there are 1000s of animations. rebolek 18:59:feelsgood: BeardPower 19:00You can completely code "branch" free, if you are using jump-tables. 19:01A benchmark would be interesting. refinements vs. multiple functions. rebolek 19:02Red is IMO high level enough to do some branches even if you do not expect it. I may be wrong, but checking the output is easy enough, there are no useless megabytes. 9214 19:02vs. Gitter wetware :^) BeardPower 19:02It depends on the branch prediction penalty, cache misses and what not. Hard to tell without some tests. rebolek 19:02right BeardPower 19:03x86 has something about 15 cycles. The Mill only has 5 :D greggirwin 19:03https://gist.github.com/greggirwin/908d44dc069ed84cf69f053e1308390d 19:03Y'all knew that was coming. ;^) 9214 19:04@BeardPower now is the time to say *that* phrase BeardPower 19:05@9214 I'll be back? :D 9214 19:05https://www.youtube.com/watch?v=7SqC_m3yUDU BeardPower 19:05LOL obviously. rebolek 19:06*that* phrase has *certain meaning* here BeardPower 19:08My Kraken: 19:08[![tween_3.gif](https://files.gitter.im/red/red/gui-branch/KTR7/thumb/tween_3.gif)](https://files.gitter.im/red/red/gui-branch/KTR7/tween_3.gif) 9214 19:08indeed looks like walking octopus rebolek 19:09Nice! BeardPower 19:09Yeah, looks like it. viayuve 19:10Or half rotating broken DNA BeardPower 19:10You could fake a rotating DNA with it :+1: 19:11Added to my ToDo list! viayuve 19:12Cool see you guys after lunch BeardPower 19:12It's also possible to create "bullet time" with it. toomasv 19:12@BeardPower Super! greggirwin 19:12https://gist.github.com/greggirwin/c03daa544de2092284a618a899266a23 BeardPower 19:14@toomasv Thanks! I'm sure your Drawing pad has some new stuff!? :) toomasv 19:15@greggirwin Amazing! @BeardPower Doing some houswork: corrected some bugs, implemented some menu items... BeardPower 19:15@greggirwin Awesome! 19:16@toomasv Visible grid? ;-) greggirwin 19:16Doc gets the main credit. 19:16I just ported to Red from his old R2 demo. BeardPower 19:16Now we only need real 3D :) greggirwin 19:17It was one of the first GUI demos I saw for Rebol, and it blew me away. BeardPower 19:17Liquid Pong would also be a nice demo. toomasv 19:17@BeardPower Preparations are done. Tech (grid and stuff) layer first, then drawing layers. greggirwin 19:17@BeardPower, fake it 'til you make it. :^) BeardPower 19:17:+1: 19:18@toomasv Great! Looking forward to break it ;-) greggirwin 19:18Make it 'til you break it. BeardPower 19:19I'm good (well, it that can be called good) in breaking things... 19:21I will do some bench-marking with your code and mine later, after I added the rest of the easing formulas. 23:19Shake it, baby :D 23:20[![tween_4.gif](https://files.gitter.im/red/red/gui-branch/PahT/thumb/tween_4.gif)](https://files.gitter.im/red/red/gui-branch/PahT/tween_4.gif) 23:24[![tween_5.gif](https://files.gitter.im/red/red/gui-branch/KSlX/thumb/tween_5.gif)](https://files.gitter.im/red/red/gui-branch/KSlX/tween_5.gif) greggirwin 23:37It looks so anxious! BeardPower 23:45:) 23:45Some combination with coloring: 23:46[![tween_6.gif](https://files.gitter.im/red/red/gui-branch/dECL/thumb/tween_6.gif)](https://files.gitter.im/red/red/gui-branch/dECL/tween_6.gif) 23:46Need to add other stuff for color banding. 23:49And some more fancy designs/demos. I thought about some experiments with the eve watch from the blog. 23:51It can also be combined with an effects DSL. Interesting results :) Tuesday 27th February, 2018 rgchris 00:20Reduced SVG version of the (now erstwhile) [Red tower logo](http://reb4.me/x/red-simplified.svg). Intended to be easier to translate into DRAW code if anyone has such an inclination. BeardPower 00:22Cool! :+1: greggirwin 00:41Thanks @rgchris! I did that for two of the newer logos recently, but haven't pulled the gradient bits from the svg yet. BeardPower 00:42Did someone designed the logo with Affinity Designer/Adobe Illustrator? rgchris 00:43Was a useful exercise in reacquainting myself with SVG. Such a muddled format. greggirwin 00:43That's why I haven't pulled out the gradients yet. Just finding the coords was enough work for my short stint. rgchris 00:44Should be (relatively) clear in my example—mind that coordinates for gradients are as a percentage of the shape size. 00:55@BeardPower The tower logo was rendered by Petr Stefek (friend of Oldes). I don't think it was released as anything other than a bitmap—my SVG version is entirely recreated (initially in Affinity Designer, then in a punishing exercise in reaffirming an understanding in SVG, reworked by hand). BeardPower 00:57:) rgchris 00:59I originally produced my version to, at first, have the shapes on hand to use in [different styles](https://gist.github.com/rgchris/c3d0cc066dd26663827b7624d257090e), then 'cause someone was asking, I tried adding gradients to get the look of the logo at the top of this page. BeardPower 01:01Perfect. Thanks! I have some ideas for animating it. Maybe I recreate them in AD. 01:07Or Blender? :) rgchris 01:19Quickie [two-colour adaptation](http://reb4.me/x/red-lines.svg) (hand-edited : ). BeardPower 01:24:+1: 01:28Oh, what I forgot to ask. Is someone familiar with Spine or DragonBones? Maybe a Red runtime or even a similar software in Red could be created. Is there an interest in such features/tools? Red would need gobs and shaders for optimal results, though. JacobGood1 03:09Don't know if anyone heard this moltenvulkan is now open source, basically this means that vulkan covers everything now, even apple land: https://www.anandtech.com/show/12465/khronos-group-extends-vulkan-portability-with-opensource prapro 04:05@rgchris 👍 toomasv 04:17@BeardPower Order from chaos! @rgchris Very nice! planetsizecpu 07:56@BeardPower Nice disco-psycho pattern :smile: @rgchris good job! @greggirwin great demo, I inspected the code to learn something, one of the most interesting things I found is the use of collect / keep, which I have never seen before, very useful in database applications from my point of view, It recalls to me the use of Basic's read/data keywords. BeardPower 09:59@planetsizecpu Should have put a seizure warning in there... 10:01@JacobGood1 That's great. We had a discussion a while ago, if Red should go Vulkan. One API to rule them all. Driver adoption should increase until Red 1.0, so maybe it's the way to go? 10:02Vulkan enabled View? Using third party libs? This needs to be discussed 🤔 greggirwin 16:33Very cool 2-color @rgchris. @planetsizecpu, collect is pretty darn handy. rgchris 16:37@greggirwin One more (is perhaps my favourite): [Pinkie](http://reb4.me/x/red-pinkie.svg) greggirwin 16:38Niiiiice. rgchris 16:40Surprise appearance by the *lemonchiffon* keyword. toomasv 16:53@rgchris Redart in its best! Oldes 17:15@JacobGood1 interesting news indeed. Wednesday 28th February, 2018 toomasv 19:34[Mood](http://vooglaid.ee/red/rainbow1.png): ![rainbow](http://vooglaid.ee/red/rainbow1.png) Phryxe 19:55:rainbow: BeardPower 20:15@toomasv No double rainbow? :worried: toomasv 20:15Nay abdllhygt 20:35hi! 20:36@toomasv the app is stable? 20:38![alt](https://i.hizliresim.com/y0jLq7.png) BeardPower 20:38:+1: abdllhygt 20:39red gui on linux 20:41i added height-width and color toomasv 20:51@abdllhygt No :(, too many bugs. But it has [gradients](http://vooglaid.ee/red/gradients1.gif)! :) ![gradients](http://vooglaid.ee/red/gradients1.gif) BeardPower 21:01What is this fancy color selector being called? :) toomasv 21:14Honix&greggirwin 21:15It is distorted on gif :smile: planetsizecpu 21:38Bravo! @toomasv BeardPower 21:42A Howin :D greggirwin 22:36@toomasv, more wonders abound. Rainbows indeed. That color picker in the GIF makes quite the *impression*. ;^) @abdllhygt Nice! Thursday 1st March, 2018 DideC 08:08@toomasv Impressive, yes! abdllhygt 08:45@toomasv it's very good toomasv 20:51Habemus [gridem](https://github.com/toomasv/drawing/blob/master/drawing.red) [visualem](http://vooglaid.ee/red/grid2.gif)! ![grid](http://vooglaid.ee/red/grid2.gif) It doesn't synchronize yet with zooming and other transformations. greggirwin 21:12Yowza! Probably the biggest, most advanced, Red GUI program so far. Fame and tokens for @toomasv ! 21:13Watching this progress has been really fun and inspiring. BeardPower 21:14@toomasv Yeah, visual grid! 😃 toomasv 21:15 :sweat_smile: Friday 2nd March, 2018 qtxie 08:07@toomasv Amazing! :+1: toomasv 08:38@qtxie It is fun, thanks to you! :bow: nedzadarek 14:22@toomasv How long (hours) have you been doing this? toomasv 14:31Aleph-0 nedzadarek 14:32@toomasv Interesting :D 9214 14:33:suspect: >> to time! to integer! to binary! form 'Aleph-0 == 304895:14:56 nedzadarek 14:34@9214 :clap: that's impressive. 35 years....hmmm. BeardPower 14:36@9214 About 34 years? :D toomasv 14:36I started it somewhere in the end of January or beginning of February. It has been quite involved, but after recovering from illness I have to go to work unfortunately. BeardPower 14:37@toomasv Which has nothing in common with Red and/or coding painting programs, I assume. 14:38Give the man some Red coding job ;-) 9214 14:39@BeardPower no, he works at art gallery, obviously toomasv 14:39My first visual program in Red (or something close to it) was graph I think, started somewhere in the end of December '17. BeardPower 14:39Maybe he's to expensive to hire ;-) 14:40@9214 https://www.youtube.com/watch?v=OlLqYBU8qsY toomasv 15:31@BeardPower I think you should love [this](http://vooglaid.ee/red/axionometry1.gif): ![axionometry](http://vooglaid.ee/red/axionometry1.gif) BeardPower 15:32@toomasv Fantastic! Much appreciated! 15:32I checked the Red logo recently. It's not a familiar isometric ratio. 15:34Now your Drawing pad is ready to design some widgets :) 15:35Will there be some little brother in the future? Widget pad? Maybe ;-) 15:37@toomasv What is the 10right of the grid setting of 26x15? I wasn't able to figure out :worried: toomasv 16:00@BeardPower It is "[radial grid](http://vooglaid.ee/red/grid3.gif)" in degrees: ![radial grid](http://vooglaid.ee/red/grid3.gif) BeardPower 16:01Ah! Maybe you could add a ° character to make it more clear? :) 16:02It's really a great addition to my workflow: get the offsets, sizes, colors from Affinity Designer -> recreate it in Drawing pad and copy/paste it to my widget code :+1: 16:03No more hand-crafting for the widget :smile: toomasv 16:44@BeardPower ![degree](http://vooglaid.ee/red/grid4.png) BeardPower 16:44:+1: Great! 16:45Maybe we can steal a little from AD ;-) toomasv 16:45Patience! :) BeardPower 16:45I can make you a long list of features, if you wish ;-) toomasv 16:46Please do, even if I have some in my mind too! BeardPower 16:46Sure thing. 16:47I worked with some CAD tools for a long time, so a lot to steal :) toomasv 16:49Great! Please make a list to ponder about! BeardPower 16:49Once there are gobs for Red and I can figure out an "optimal" way for my animation DSL, it could be very well integrated into Drawing pad. 16:50Will do. toomasv 16:51Is your animation DSL out somewhere? BeardPower 16:53Not yet. It's just some functions right now. Figuring out a way to mold it into a DSL. Params are set as face/extra for now, but it would be cool to have a DSL, which will inject these params into face/extra. 16:54I could come up with a more easier DSL, though. 16:54Will work on it ASAP. toomasv 16:55:+1: greggirwin 17:08That radial gradient bit blows my mind. toomasv 17:15Why? :) greggirwin 17:16Just watching the repeat/resize happen and then align so perfectly. I'm graphically challenged, so this all looks magical to me. 17:16The isometric grid is really cool too. nedzadarek 17:17@BeardPower I have something like this. I have to clean the code, make a github page... add license etc. Well, I'll try to post it tomorrow. toomasv 17:19@greggirwin It was enlightening to me to discover this! BeardPower 18:08@nedzadarek Great! planetsizecpu 18:32@toomasv "someone" wrote: we can't build big things but little things with big love. You did it ;) toomasv 18:54:smile: Saturday 3th March, 2018 nedzadarek 10:44@BeardPower https://github.com/nedzadarek/extra_put_red BeardPower 11:16@nedzadarek Thank you! I will study it. I need a 48h day 😏 nedzadarek 11:34@BeardPower Yes, "Tempus, rerum imperator" (time, commander of all things). It took me few hours to fix a bug, clean the code, write examples,and find the github password. greggirwin 22:28@nedzadarek, thanks for posting that! And for including examples. Very helpful. I don't recall the original chat on this. What is the primary use case? I see how it works, just wondering if you want the extra because you generate more complex layouts, with new info generated as you go. nedzadarek 23:47@greggirwin thank you I wanted to create complex style(s) and let the user pass some values. For example, someone has a style named foo with face/extra: #(a: 1 b: 2 c: 3). When someone want to use it and pass, let's say, c s/he have to do it with with: view [foo with [extra/c: 42]]. This syntax has some "problems": 1) it's too long for a simple variable passing 2) Why the user want to use with when s/he want to pass variable (to edit extra) Sunday 4th March, 2018 greggirwin 01:28Style, excellent use case. I get it now. toomasv 08:32Comparison of [axonometric tools](http://vooglaid.ee/red/axonometry3.gif): ![axonometry](http://vooglaid.ee/red/axonometry3.gif) 9214 08:35@toomasv there're typos, it should be axoonoometric ;) 08:35tooools toomasv 08:38:flushed: Sorry for my poor spelling! 9214 08:38@toomasv poooor! 08:38and soorry 08:39:clap: let's wait for @greggirwin's reaction, I bet he'll start drooooling again 08:40@toomasv can you use textures and patterns for isometric planes? toomasv 08:41You mean fill-pen pattern and fill-pen bitmap? Not yet. 9214 08:43it just reminded me of [this](https://graphicriver.net/item/pablo-the-pixel-art-builder/3008103) PS plugin toomasv 08:46Very cool! prapro 10:00Awesome @toomasv BeardPower 10:41@toomasv 👌🏼 10:41@9214 PixelArt rocks! toomasv 11:13Thanks! :smile: BeardPower 15:08@toomasv @dockimbel I just testes Drawing padon macOS: The UI is shown, but freezes with the following stack-trace: Standard trace level 1: *** Script Error: VIEW - face not linked to a window *** Where: do *** Stack: context layout layout layout layout layout do-safe show cause-error == make object! [ env: make object! [...] step: 0 last-step: >> Trace level of 1000: *** Script Error: VIEW - face not linked to a window *** Where: do *** Stack: launch either run while eval-command if either switch if switch-mode set case do-command unless set try-do set body try either = set catch ctx context make win layout while switch set fetch-options until unless case set switch switch foreach foreach layout while switch set fetch-options until unless case set switch switch layout while switch set fetch-options until unless case set switch switch layout while switch set fetch-options until unless case set switch switch layout while switch do-safe if print = type? try recalc-info show either if if unless cause-error do == make object! [ env: make object! [...] step: 0 last-step: >> toomasv 15:20@BeardPower Thanks, I'll try to hunt this bug down! BeardPower 15:21Good :fishing_pole_and_fish: ! toomasv 16:29@BeardPower Killed the bug :muscle: BeardPower 16:30Toominator! 9214 16:31Toominatoor! BeardPower 16:31Will try ASAP. 16:44So it was recalc-info? toomasv 17:09Yes, tried to show some info before it was set. BeardPower 17:17Sinner! 😁 luce80 18:13recalc-info is shown in second stack-trace but not in the first. This makes me think that it could be useful to have a "compacted" stack-trace form that does not show natives ? BeardPower 18:24Would definitely be useful. Monday 5th March, 2018 gltewalt 05:10http://rebol2.blogspot.it/2012/05/wolfenstein-3d-part-1.html toomasv 07:37@gltewalt Interesting! DideC 09:59@toomasv I started having a look to your Drawing code. Dis not go far, but saw that pallette code generated could be lighter. Just put this modified part in a [gist](https://gist.github.com/DideC/f14dae07b538070e22fd18ebc3b90011) so you can see my proposal. It avoid to generate the actors per each color ==> just on for the syle. BeardPower 11:07@gltewalt Why is there even the question in the article, if it's possible in REBOL? Wolfenstein3D is using a software renderer. Any game, even AAA games would be possible in REBOL/Red 😎🤓 11:08Thanks for the great link! toomasv 12:38@DideC OK, thanks! DideC 13:22@toomasv at [this line](https://github.com/toomasv/drawing/blob/master/drawing.red#L719) there is loading of a .png file, so the script can't be run from my console with do https://github.com/toomasv/drawing/raw/master/drawing.red You may include the compress binary content of the file, instead. 13:28Example: >> img-bin: read/binary %bay.jpg == #{ FFD8FFE000104A46494600010101004800480000FFDB00430008060607060508 0707070909... img: load/as img-bin 'jpeg nedzadarek 16:08@gltewalt Script Error: Cannot use path on none! value ** Near: view/title screen join "Raycaster " system/script/header/version @BeardPower The problem isn't "is it possible". You can anything with turing complete programming language. The problem is "how to make it run reasonably fast". I have seen many "easy" programs that were slow. rebolek 16:10@nedzadarek change it to view screen nedzadarek 16:11@rebolek I realized this too late. Well, thank you. gltewalt 16:42@BeardPower I don’t know - I think it’s an appeal to the folks who will ask “can I write games in redbol”? nedzadarek 17:07Why this: doesn't work but this works:i2: insert-event-func func [face event] [ face/font/size: 10 + random 5 'none] Isn't it because it's the type of 'console? 'console is weird: system/view/vid/styles/c: [template: [type: 'console]] view [c]`. BeardPower 18:22@nedzadarek If it's too slow, buy faster hardware. Wasn't that the optimisation suggestion of some company? 😁 Sure, you can do crappy code on any language. 18:23@gltewalt Absolutely. It just depends on which sort of games. Tuesday 6th March, 2018 greggirwin 03:25[![xmas-drive.gif](https://files.gitter.im/red/red/gui-branch/0LFx/thumb/xmas-drive.gif)](https://files.gitter.im/red/red/gui-branch/0LFx/xmas-drive.gif) 03:25Toominator is da man! Holy cow, Toomas! We should also try to port the old Christmas Drive demo by Anton Rolls. 9214 03:27@greggirwin mmm... the speed of Red roadmap ;) greggirwin 03:27Hah! Yes. 03:29Can't wait for audio and effects pipeline so Bolek can port PitchGreen too. 03:31@toomasv's demo is inspiring on many levels, because he's building a useful tool, and extending it with little "dialects" in the form of features like iso drawing. Very cool stuff. And by having tools like this, that generate Red resources, we can leverage the results completely. toomasv 04:03@DideC Thanks again for both proposals! @greggirwin This drive makes me :dizzy:. Building Drawing pad is real fun, and I am learning a lot while trying to achieve intended behaviour. And that's why I started it in the first place. 20:05POC of selection visualisation, and cloning: [![selection visualisation](http://vooglaid.ee/red/selection1.gif)](http://vooglaid.ee/red/selection1.gif) BeardPower 20:11:+1: greggirwin 21:15There was chat here about https://www.sketchapp.com/ some time ago. I hadn't seen it before, but also watched a great video of the main guy demoing features, which had some cloning bits as well. BeardPower 21:21So hurry up @toomasv ;-) Friday 9th March, 2018 rebolek 08:07@qtxie is number of elements in line limited? >> d: [line] t: 200 repeat i 2000 [append d as-pair to integer! i / 4 t] == [line 0x200 0x200 0x200 1x200 1x200 1x200 1x200 2x200 2x200 2x200 2x200 3x200 3x200 3x200 3x200... >> view layout [base 500x500 draw d] qtxie 08:10@rebolek Yes. 1000 IIRC. 08:10We should remove this limitation. rebolek 08:17Ok, that would be nice. I was wondering what I'm doing wrong :) BeardPower 10:18@rebolek And the master is limited by it's tech, again 😁 rebolek 10:40@BeardPower :D toomasv 15:14Ortho-grid with 2 levels: [![ortho-grid2](http://vooglaid.ee/red/ortho-grid2.gif)](http://vooglaid.ee/red/ortho-grid2.gif) 9214 15:14oorthoo, @toomasv, oorthoo! :clap: 15:16should I consider dropping PS4 for photo editing in some not-so-distant future? :D toomasv 15:17Don't spit into old well before the new one is ready 9214 15:19:thought_balloon: BeardPower 15:21Out with the old, in with the new. greggirwin 19:00> Don't spit into old well before the new one is ready Sage advice. And more coolness to make me drool into my keyboard. Go @toomasv, Go! 9214 19:03Aah, @greggirwin's saliva. A bounty on its own. rebolek 19:06How GIS for one RED? greggirwin 19:09GIS = GreggIrwinSaliva ? Ick. ;^) rebolek 19:20;) 9214 19:21When ISD? (Initial Saliva Drooling) hiiamboris 20:28is VID with keyword not implemented yet? greggirwin 20:30It's there in newer builds. hiiamboris 20:32@greggirwin right, thanks (: BeardPower 20:34Another test, another widget: 4/1000 :) 20:35[![chart_tweened.gif](https://files.gitter.im/red/red/gui-branch/QYMv/thumb/chart_tweened.gif)](https://files.gitter.im/red/red/gui-branch/QYMv/chart_tweened.gif) StephenStrickland 20:47buttery smooth BeardPower 20:49:) rebolek 21:04@BeardPower :+1: 21:05how customizable is it? BeardPower 21:15For now it acts as a testing workbench. How many animations can be run @60fps, memory, timing etc? Besides from that you can change everything: data, colors, animation speed, about 40 different tweening functions etc. rebolek 21:17Input data is what I'm interested in. BeardPower 21:21Barheight, color, tween. I'm thinking of a well suited interface. The bar just render series data. 21:21A normal bar chart. 21:22What exactly do you need/want to customize? 21:23Maybe we can come up with a nice interface together 🤓 rebolek 21:36I'll write you, I don't want to pollute chat. greggirwin 22:41:point_up: [March 9, 2018 1:34 PM](https://gitter.im/red/red/gui-branch?at=5aa2efe8e4d1c63604e07fd4) Nice @BeardPower ! BeardPower 22:44@greggirwin I'm prepared to beef up the Red wallet UI ;-) greggirwin 22:51Woohoo! It is very modern and slick looking. You graphical types amaze me. BeardPower 22:59I have to admit, that I have good sources to ~~~steal~~~ get inspiration from ;-) greggirwin 22:59@BeardPower I liked the typo! Made me think that some kind of inspiring soiree was going on. BeardPower 23:01:) I can of course share them, if someone is interested in. Do you know if there are any designers on the Red "train"? greggirwin 23:03@rgchris is a talented designer and artist. BeardPower 23:03It would be awesome, if we could create some great UI/UX for the wallet. 23:05There are some nice wallets out there, but they all use Electron. 140 MB for a wallet? They are kidding me! The same thing in Red would only need 10-20MB! I bet even lower. 23:06Cool, maybe he has some UI designs to share :) greggirwin 23:25Should be 1.5 MB tops, I think, in Red. Let's shoot for 1.4, so we can be 100x smaller. BeardPower 23:26Using the GC and a more optimized version, of course. The chart widget example uses about 4MB. greggirwin 23:27Ah, you mean memory used, not disk exe size. Got it. BeardPower 23:28I ran an early version of AutoCAD on 4MB RAM, so it should be doable ;-) greggirwin 23:28640K should be enough for anybody. BeardPower 23:29Yes, memory. Sorry, if I wasn't clear about that :) The disk size of the wallet is 70MB, though.... 23:30@greggirwin Hehe, yeah, although Bill never said that ;-) greggirwin 23:31Why does everybody want to give Bill all the credit? *I* just said it. BeardPower 23:33True :) Saturday 10th March, 2018 rgchris 00:23@BeardPower There's some kicking around in this chat history... 00:27Although I'm not sure how one would go about finding them. BeardPower 00:30@rgchris Join the game ;-) Yeah, that's unfortunate. I have plans to setup some wiki page to show them off. rgchris 00:32I'll need to find where I dropped those. BeardPower 00:34Cool. We should collect the user contributions in some central area. 9214 06:59@BeardPower https://github.com/red/community ? nedzadarek 09:36@BeardPower yeah, links to forum/blogs, (github's) code, code snippets etc. lepinekong_twitter 09:55@toomasv do you intend to implement the concept of layers ? BeardPower 11:34@9214 Yeah, but where do I post screenshots/gifs? toomasv 11:34@lepinekong_twitter I do. 9214 11:35@BeardPower I guess you can create separate subfolder for your project and put readme there. BeardPower 11:37I will look into it. 9214 11:38IIRC git also allows submodules. BeardPower 11:43Yes, it does. meijeru 13:20@toomasv I am trying your draw.red and I am quite impressed, but ... (there is always a but :smile:), there may be something wrong with load-file; the name of the chosen file does not appear in the result field, even though it is correctly returned from request-file; secondly it is possible to type in a local file expression in the result field, not going through request-file, and I don't think your program logic anticipates that -- it seems to assume that a typed-in value is always a url!. Have you tested this part? toomasv 13:54@meijeru Thanks! Yes, I have to rethink this. It was a quick try, and I haven't worked on it much. But it did work :), oddly though! Here is a proof: one image from web-address, the other local: [![images](http://vooglaid.ee/red/images1.png)](http://vooglaid.ee/red/images1.png) It needs reworking, though. Thanks for reminder! planetsizecpu 14:56@toomasv good job! Sunday 11st March, 2018 BeardPower 17:06I asked this a while ago, but as Blend2D is getting traction, may things have changed. Wouldn't a collaboration make sense? https://blend2d.com/ lepinekong_twitter 19:14@BeardPower good finding I like that they also have a javascript api :+1: BeardPower 19:19Sinner! 😄 lepinekong_twitter 19:28@BeardPower I'm religiously agnostic :smile: 19:29@BeardPower when Red will be everywhere and have every library then OK I'll exclusively use red ;) toomasv 21:08First sketch of layers: [![layers](http://vooglaid.ee/red/layers1.gif)](http://vooglaid.ee/red/layers1.gif) Buggy still, but works. BeardPower 21:12:+1: greggirwin 21:58:point_up: [March 11, 2018 11:06 AM](https://gitter.im/red/red/gui-branch?at=5aa5622f458cbde557207782) @BeardPower , beautiful stuff. How to collaborate though, as it's C++? We could have a binding to it of course. The Foundation could maybe donate some ETH, but there needs to be Red value for that, even if planned for the future. Would you like to take point on that and contact the author? Maybe some ETH for them in return for support to build a Red binding with you? lepinekong_twitter 22:06@toomasv :clap: BeardPower 22:15@greggirwin I though about using it as a new "AGG" for Red and a collaboration in re-writing it in Red / R/S. The Red value would be in having a successor for AGG, but maybe this is not necessary, if we switch to a hardware accelerated vector drawing engine in the future. They, or rather he, stated, that it's fairly easy to create bindings for it. It's currently in alpha. Yeah, I will contact the author about it, as I need to do that anyway, if I want to access the alpha code. 22:17It depends on the road-map of Red: a vector engine based on software rendering or hardware rendering. 22:19Personally, I think we should go with vector engine based on hardware rendering. greggirwin 22:29Hardware may make things faster, but note how much is now done in software that used to be hardware. Key decision points are things like target platforms. If we go hardware, it will limit where it runs, yes? 22:30@BeardPower, and thanks for the audio wiki updates BTW! BeardPower 22:35You're welcome. Well, the API would not change, only the back-end, so current code would not need to be changed. Font- and vector graphics are moved from software to hardware recently, so what used to be done in software is now done in hardware. The target platforms would not change, as any of it comes with DX or OpenGL support in some form. Yes, it will limit where it runs, if the platform does not support DX or OpenGL in any form, which is only the case for very ancient hardware. 22:37There will also be the fallback to the software-renderer in such cases. greggirwin 22:38So where does Blend2D fit in? BeardPower 22:38Blend2D is a pure software-renderer. greggirwin 22:38Right, so if you think we should go hardware, what's the win? BeardPower 22:41Graphics rendering is completely moved to the GPU. The CPU can be used for non-graphical tasks. It will also open Red for more "serious" games, as it would use the same rendering backend. greggirwin 22:42So we get hardware rendering *via* Blend2D? BeardPower 22:43No, Blend2D would be the software rendering fallback, in case the system does neither support DX or OpenGL. 22:44There are other libs/APIs for hardware rendering. greggirwin 22:46So it's only a fallback, got it. Does your gut say it will be an easy win with an API binding, short term? That gives us a target with which to test dialect design, or options from existing DRAW, where the hardware road may take more time. BeardPower 22:53The Alpha version was announced for April and they have a JS binding as an example. Feature wise it would definitely be a win, but more mid -term. The current drawing dialect is using GDI and GDI+, but it's planned to substitute it with DX. Since Vista, GDI is not hardware accelerated any more, it's only forwarded to the DWM. DX(12) offers a lot of vector drawing functionality, so that would be beneficial. 22:59It opens a lot of possibilities, like shown here: http://tyt2y3.github.io/vaser-web/ greggirwin 23:06Do we have a wiki page for all this? That would be great, as there is a lot of good info here we don't want to lose. BeardPower 23:08No, but I can create one to collect the info. I have plenty of it ;-) 23:15Did I mention, that Direct2D has an effects API? ;-) https://msdn.microsoft.com/en-us/library/windows/desktop/hh973240(v=vs.85).aspx greggirwin 23:20Thanks! I don't know if there's a general doc @qtxiw uses for mapping DRAW to APIs, but that might be nice, too. 23:21Also important when we add the effects pipeline. BeardPower 23:22Yes, this would definitely help. Direct2D offers a really awesome API, we just need to find one for the other platforms. greggirwin 23:22And see what will help keep our code base as small and simple as possible, even if it means conscious performance tradeoffs. BeardPower 23:23The big advantage of D2D is, that it's rendering into a back-buffer. Monday 12nd March, 2018 qtxie 04:19@BeardPower We are going to use D2D to replace the current DRAW backend. 04:20There is a branch on red repo already. Oldes 07:05@BeardPower I'm following Blend2d for a long time. Petr is quite active on Gitter recently but I wonder if he will release it in April. He is perfectionist and always find some places which he wants to rewrite before release. Now he started with font rendering. 07:07He also stated that he will not provide c binding as the project is heavy c++. Don't expect easy binding for Red. 07:07But you may ask. It does not hurt. 07:17Also dx is heavy c++ too so it must be possible. toomasv 15:08Another [color-picker](https://gist.github.com/toomasv/d111c2e2b2d1682bd3a9615a5d66ac0c): [![color-picker](http://vooglaid.ee/red/color-picker1.gif)](http://vooglaid.ee/red/color-picker1.gif) Sorry for ugly gif! dockimbel 15:52@toomasv :+1: Though, the reactions are not happening on my Win7 box, will look into it tomorrow. BeardPower 15:59@qtxie Thanks! I heard about plans to implement a "gob" like type like in Rebol3. Are there any plans or design ideas you could share? I'm very interested in this, because I'm a.) into game development and b.) creating a UI widget library (non native widgets like in REBOL). Using the base facet is nice, but also has limits (minimum size and performance). "gobs" would be great, as they could support software and hardware rendering, specialized treatment and optimizations. I discussed with @greggirwin, if there is a need for hardware rendered curves, which DX supports, but a fallback to a software renderer would also be very beneficial. That's why I looked into Blend2d and AGG (as it's rendering into a buffer, and it's independent to where that buffer lies; memory or on the GPU). Maybe parts can be hardware accelerated as well. DX is doing it's tesselation on the CPU anyway, although higher versions also support hardware tesselators. toomasv 15:59@dockimbel Thanks! Wanted to ask -- is there a way to make/save image with alpha-channel info? draw function seems not to preserve alpha-info. BeardPower 16:01@Oldes Yeah, he mentioned a possibility for a C wrapper, but not with an Alpha or Beta release. I will talk to him about some technical stuff and also GPGPU support. Oldes 16:15@BeardPower Where/when he mentioned it? I found [opposite claim](https://gitter.im/blend2d/b2d?at=58de5baf8bb56c2d116088b0). BeardPower 16:22@Oldes I was not following the gitter room, just the info on his website and some forums. IIRC it was mentioned there somewhere. I will try to find it. Someone also mentioned about GPGPU support in the future, but I was not able to find a statement on this from Petr, 16:23I could be, that I mix some things with Fog. 16:24I appreciate it, if you have more accurate and actual info on that. 16:26@Oldes Do you have access to the Alpha? Oldes 16:27No.. I'm just silently following the project which means reading the gitter and waiting. I don't think there is anybody with access to the Alpha. BeardPower 16:32@Oldes I see. Sorry, if I spread FUD about the C wrapper. I was digging through the old Fog repo/site and forums and it was late in the evening. I keep you updated. Oldes 16:32_Fog_ was previous name of _Blend2D_ btw. BeardPower 16:32Yeah, that's what I found out while digging through the archives :) 16:33@ phoronix. toomasv 17:30Improved [version of color-picker](https://gist.github.com/toomasv/d111c2e2b2d1682bd3a9615a5d66ac0c), with actual alpha information! TimeSlip 18:26I was curious to know about what is really happening with "rotate." rotate <angle> <center> [<commands>] toomasv 18:27It .. hmm, rotates something that comes after it -- if in brackets, then only things in brackets, otherwise everything that follows. TimeSlip 18:28The way I am using it to spin my spinner is to increase the angle. 18:28I mean increment the angle degrees. 18:29Sorry, I'm having a difficult time putting into words what I am referring to. 18:32So, if I use 90, I assume it rotates the object 90 degrees, and using 720 will rotate the object twice, right? BeardPower 18:33@TimeSlip Yes, the angle of rotation is in absolute values. TimeSlip 18:34@BeardPower You would for sure know this. So to increase the spin rate you used increasingly large values, correct? BeardPower 18:36Yes. 18:37My spinner is just a naive one. TimeSlip 18:37And we do this without really knowing if the revolutions are really being completed. 18:39What I did was using the VID example with the "tiger" but I don't really know what is going on behind the scenes. I just shoved in values until it worked. BeardPower 18:42You can track the angle to count the number of revolutions. Rotation just rotates in absolute values, staring from 0 degrees. 9214 18:48@TimeSlip three ticks, enter, code, three ticks TimeSlip 18:50 while [board/state][ rot: rot + 2 ;zoom: zoom + z ;if any [zoom < 0.1 zoom > 1.2][z: negate z] piechart/4: rot texts/4: rot ;piechart/6: zoom ;piechart/7: zoom show [ti ti2] loop 5 [do-events/no-wait] ] 18:50@9214 THX! 9214 18:51@TimeSlip np :) TimeSlip 18:52One of my questions is what does the loop do? 18:52 loop 5 [do-events/no-wait] 18:53Is it performing the rotate? 9214 18:54it processes events in a queue, 5 in a row, as far as I can tell TimeSlip 18:56BTW, I'm on a Chromebook right now and can't test anything but thought I'd ask in case anyone knew. BeardPower 19:03@9214 That's correct. It does not wait/block. 9214 19:03never saw deferred updating in action actually BeardPower 19:04Please give me some time. I'm packed with work, but I will post it on gitter. TimeSlip 19:50I did some checking and the do-events loop causes the rotations to happen. The rotation degrees, however, still are somewhat of a behavioral mystery though as I've been monitoring them. I'll do more testing to see what is actually happening. I need some more predictable results. BeardPower 19:58You can change the rate for the face. E.g. rate 60 will call the on-time function 60 times per second. rotate 50 -> it will rotate by 50 degrees. If you rotate again for 60 -> it will rotate to the absolute value of 60, not 50 + 60 = 110. 19:58Study this example: http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html 19:59If you want to rotate relative to the previous value, you need to get the current rotational value first and add your differential value. 20:00You can also rotate by using the transformation matrices. rotate is just a convenience function. greggirwin 21:34:point_up: [March 12, 2018 9:08 AM](https://gitter.im/red/red/gui-branch?at=5aa697ee53c1dbb743d24c46) Lovely @toomasv ! No reactions here either. Doc may have fixed already. 21:38@TimeSlip, do-events/no-wait allows visible updates to happen, because the event loop is allowed to process messages, like WM_PAINT on Windows. Tuesday 13th March, 2018 qtxie 01:20@BeardPower Not yet. Basically it will be like the one in Rebol. 01:20I think the text-box! can be implemented as a gob!. BeardPower 01:23@qtxie Thanks! >I think the text-box! can be implemented as a gob!. RTF support? :) qtxie 01:24Yes. :-) BeardPower 01:26"Provide a structured way for custom widgets creation." was mentioned on trello. Will they be based on gob!? We are not talking about native widgets here, right? 01:27Or at least it would be advantages if they are based on gob!. 01:29I'm really looking forward to gob! to create my widget library :+1: qtxie 01:33That one on trello is for native custom widgets. gob! is useful when you want to build your own GUI framework. BeardPower 01:34Perfect. I want to build the latter :smile: pekr 06:28I remember some ppl opposing to the gob! name in early R3 times. While it is short, and for a compatibility reasons, it still can be used, or some new name could be used for a basic atomic gfx element. But otoh it might be just a documentation issue gob = graphics object, and your explanation is done. Just curious .... rebolek 06:30I'm fone with gob! name. greggirwin 06:38It's short for thinking, where something like gfxobj will expand in my mind quite a bit. On bit, we all seem OK with that, not thinking about the expansion. We're also OK with blob, and gob is just a bit more specific. I'm justifying because I don't have anything better to suggest. pekr 07:19atom!, base!, gfx!, particle!.... as usual, not a simple naming task, so most probably we will stay with gob!anyway. It is just that I remember some ppl having a problem, due to some word connotations .... dockimbel 07:42@BeardPower What's missing from base face and Draw preventing you from building your own GUI system within a base face? 07:45The main reason gob! was introduced in R3 was to avoid "fat" face objects, which I think could be solved in a different way (like providing less memory-consuming objects). Gobs are much more limited than faces (they don't handle events), so they require more work from the user to construct GUIs. pekr 07:48Yes, there were gobs of several types - draw, image, maybe text or some others. If you wanted to have it tracked, you have to link it to some face anyway. Or something like that. As gobs were really "tiny" objects, it had quite nice impact on performance. Hence @rebolek 's 100 cows demo script .... dockimbel 07:51You can also by-pass the Draw dialect (using Red/System), and call directly the Draw internal API, while walking a tree of gobs (or whatever user front-facing data structure you want to use). The Draw internal API is cross-platform, and it's possible to build for it as many backend as you want. You can also drop Draw totally and build a custom GUI rendering engine that will render into a system window or an image buffer (so that it could still be integrated in View with its default native backend, if required). greggirwin 07:51But do we even need gob! if we have draw and text-box!? 07:52What Doc said. :^) 07:54That is, what if gobs are just blocks that can be composed into draw blocks, and by treating them as data, an event listener could simulate events for them as well. pekr 07:54Also - interesting idea re "less memoryconsuming objects". Red's objects are already a bit different to Red. I mean e.g. on-changestuff. IIRC, there was also planned some other enhancements re objects. Was it an ownership system, whatever it means? dockimbel 07:57@pekr Object events are unfinished, they are still several features that need to be added there. pekr 07:59Yes, what I mean in a context of discussion here, that most probably we should take an oportunity to introduce some functionalities in an innovative manner (like you described re Draw dialect adn R/S) instead of "porting" gobs stricly as they were introduced in R3. I never much liked it. Felt disconnected to the rest of the GUI system imo ... rebolek 08:06@greggirwin yes, we do. gob is more versatile than doing everything in Draw. dockimbel 09:28@rebolek Can you give an example of how it is more versatile? rebolek 09:33@dockimbel I have no hard numbers that support it, I would need to run some tests on R3-alpha that I don't even have installed, but I think that handling 1000 gobs, each doing thing, would be faster than composing one huge Draw block with same 1000 elements. Especially when you need to update just few of those 1000 gobs, but with one monolithic Draw block, everything needs to be updated everytime. maximvl 10:04don't forget you can keep long discussions going on Reddit! :) https://www.reddit.com/r/redlang/ 9214 10:05@maximvl :joy: give up maximvl 10:06lol, there is not a single reason for that 9214 10:14@maximvl maybe others can start discussions with general topic/questions and wait for others to catch up? Personally, I never used reddit, and don't really like it, but don't mind to leave some comments here and there. maximvl 10:15>Personally, I never used reddit, and don't really like it well, it's time to start liking and using it ;) 10:16>others can start discussions with general topic/questions and wait for others There are no others, there are just us pekr 10:25Well, it is going to be a bit tricky, at least with the old-timers, used for a decade to IM nature of Altme, which Gitter kind of brought back to life :-) 9214 10:26I feel like IM person myself maximvl 10:27@pekr it's not about what you used to, you should understand the difference - on Reddit many parallel focused topics can go on for a long time without any problems pekr 10:29Wrong group anyway, to discuss stuff like that. I am with Rebolek on that though. Reddit looks extremely dated (UI wise). I still wonder, how some stuff as that can survive in today's world. Ditto for HackerNews .... maximvl 10:30as here for the last 100 messages there were discussions about c++, direct2d, color picker, events loop and Rebol3 staff rebolek 10:30That UI is actually really great. 10:30No fancy stuff, right to the point. maximvl 10:30@pekr because it's the content, not the design which defines it ;) pekr 10:30@rebolek Is it up to date with tools like Slack or Discourse, UI wise? :-) rebolek 10:31@pekr as AltME person, you should like it ;) 9214 10:31It feels more natural to quickly switch into PM and chat privately instead of setting up thread on reddit and refreshing page every 5 seconds to see if other person responded maximvl 10:32is anything up to date with metro or material design? do you drop all your tools right away once new design hype is out? 9214 10:33@maximvl nononononono this is not how we do it! First you should create a subbredit, then convince @pekr to join reddit, then you both can finally start to argue ;) pekr 10:33@maximvl re your last 100 messages here. Different tools for different needs imo. My feeling is, that when one wants an answer, it is faster to interact in an IM way. Of course depends upon the community, how active the help might be. I am on many forums and unless there are active admins, it can become quite messy, topic wise, too ... maximvl 10:33@9214 you can still do PM on reddit, it's not about waiting for somebody to respond in 5 seconds 10:33it's about starting the discussion and then watching it going somewhere (or nowhere, also happens) rebolek 10:33Joining reddit doesn't even require email. Show me another site that is fine with just name/password. 9214 10:34@rebolek it doesn't..? maximvl 10:34@9214 it already exists.. https://www.reddit.com/r/redlang/ 9214 10:34@maximvl I meant separate thread 10:34or however such thing is called on reddit pekr 10:35I can easily admin, that I know nothing about Reddit in particular. What is the advantage e.g. to Google groups, we are already using? Isn't it threaded/forum like tool too? Well, thinking where we should move the discussion, before gurus object :-) maximvl 10:35it's called *thread* :D 9214 10:35ah, ok, I'm too old for that :older_man: maximvl 10:36@pekr >I know nothing about Reddit in particular well, isn't it exciting to learn? :D rebolek 10:36@9214 it asks you for email when signing up, but you can skip it 9214 10:36dang! 10:36not to mention that 9214 username was already taken by someone :^/ maximvl 10:37>What is the advantage e.g. to Google groups, we are already using? it does not require google account/stuff, and much easier to join pekr 10:37we need marketing or support or anything like that channel, we are heavily off-topic here ... rebolek 10:37chit-chat? 9214 10:37reddit thread? ;) maximvl 10:38@toomasv do you mind posting your tools on Reddit for a wider audience & make it searchable? :) BeardPower 11:17How about grob!;-) 9214 11:18@BeardPower it sounds like "coffin" in Russian ;) BeardPower 11:23@dockimbel Nothing is keeping me from it. My widgets are based on the base face. They just have limitations: - They have a minimum size (an OS limitation) - The OS has problems with a high amount of windows/panels - They have a performance impact Beside that, they are all fine and dandy. And you are right, Draw can use all kinds of back-ends, being it a software renderer or some binding to a 3D engine. If the facet can be improved performance and memory wise, that's great. We would need some benchmarks to see, if they are degrading performance that much. 11:25@9214 Damn it. I guess there always will be some language clashes :smile: toomasv 11:54Is this expected behaviour, that face's color can not be changed into transparent after it has been set to some non-transparent value? On W10: [![color-problem](http://vooglaid.ee/red/color-problem1.gif)](http://vooglaid.ee/red/color-problem1.gif) BeardPower 11:57@toomasv To me, this looks like a bug. toomasv 11:59@BeardPower I think so too, but let's wait, maybe someone of the team will comment also. BeardPower 12:01Yep. toomasv 12:05@qtxie ^? 12:11@maximvl Thanks for suggestion! I have to look into reddit, never used it before. BeardPower 12:12@toomasv reddit is nice, because it's mostly troll-free :) toomasv 12:13:) qtxie 12:59@toomasv It is a bit tricky to support transparent widget on Windows. I think I did that because issue #1677. 13:00I'll check to see if I can improve it. toomasv 13:02@qtxie Thanks! maximvl 13:07@9214 the other day you posted a link to pure data, what is it exactly? 9214 13:08@maximvl it's a dataflow/visual programming language for sound synthesis and various multimedia installations. http://puredata.info/ maximvl 13:08it's quite bad that visual pl doesn't have any screenshots/videos on the website :D 13:09or did I miss them? 9214 13:11@maximvl true, though, I don't think that google banned you ;) 13:11Max/MSP is fancier, but shares the same idea maximvl 13:13https://macprovid.vo.llnwd.net/o43/hub/media/1151/11774/headline-Pure-Data-tutorial.jpg 13:13)) 13:14looks complicated 13:14I'm playing around with this one: http://sonic-pi.net/ 13:14not graphical, but super simple BeardPower 13:15Geez.... :) greggirwin 16:50On Reddit chat, please move to red/chit-chat. Good topic, wrong room. 16:52@rebolek, is there an easy way to test R3 gobs against draw in Red with something like 1000 Cows? rebolek 17:07@greggirwin there is fps meter, so it can do benchmarking, I just need to port it to Red. greggirwin 17:11That's probably the best way to convince Doc gobs would be useful. rebolek 17:14Oh. 17:14Then I must do it, there's no other way. TimeSlip 17:38@BeardPower Can I ask what you wrote to slow down the rotation? 17:47@BeardPower OK, I think I figured it out. If I lessen the increment amount but still continue to add to the rotation degree, it will slow down. rebolek 17:51:+1: BeardPower 18:35@TimeSlip That's what I did. Wednesday 14th March, 2018 qtxie 07:38@toomasv I pushed a fix for that transparency issue. toomasv 07:39Thanks @qtxie ! rebolek 08:30Who's going to do Draw version? :) http://roughjs.com/ lepinekong_twitter 08:50@rebolek like very much :sparkles: 08:51@rebolek maybe @toomasv could even draw his flowchart with ... oops ask too much :smile: DideC 09:33Roughjs: the code is clean. It may be doable in Red. But I wonder about performance as it will generate many many draw code. 09:33...Even if computation are done in R/S. rebolek 09:34You can generate once and make bitmap from it. DideC 09:44Sure. rebolek 12:47How can I change image alpha? >> i: make image! 1x1 == make image! [1x1 #{FFFFFF}] >> i/alpha == #{00} >> i/alpha/1: 255 == 255 >> i/alpha == #{00} 12:54@pekr @greggirwin and anyone else with interest in cows: 100 cows is ~30fps, 1000 cows is ~14fps and 10000 cows is ~1.3 fps. 9214 12:54:cow: :question: :exclamation: rebolek 12:57@9214 I've made some quick hack version of famous Rebol's gfx benchmark for Red Draw, these are the results BeardPower 13:01@rebolek Are your cows rotated, moved and alpha? rebolek 13:01They are not alpha, because ^^ BeardPower 13:01I see. 13:02Could you share the binary/code, so I can compare it with the engines I use? They can do 300k bunnies @ 60fps ;-) rebolek 13:03They are very calm (well, on 30fps they look like on crack, but actually are very calm), watching the scenery and eating invisible grass. They also can explode in original version, but not yet in Red. BeardPower 13:03:D rebolek 13:03@BeardPower even 10 cows can't get more than 30fps, probably some limitation 13:03https://gist.github.com/rebolek/c25f0367f0d4c47561f3f1359752a67a BeardPower 13:05Thx! 13:06Can you please run and report your results: http://pixijs.io/bunny-mark/ rebolek 13:07@BeardPower 7FPS BeardPower 13:07How many bunnies? 13:07100k? rebolek 13:07default 13:07yes BeardPower 13:08So Red definitely needs some work :D rebolek 13:08Hm, I haven't tried 100000 cows... BeardPower 13:08I guess it would be 0.1 fps. rebolek 13:09Right, 0.14 BeardPower 13:10Well. Red is not using shaders and optimal hardware rendering at all. 13:11A factor of 50x. wow. rebolek 13:11Red is still alpha, so it's fine. BeardPower 13:11Sure. It's not an issue with Red, but lack of hardware acceleration. 13:12I'm sure, that if you create a binding to a decent engine, it's roughly the same. 13:13It would be interesting to see the results of the new Direct2d backend. rebolek 13:14I'm testing it on Wine, btw BeardPower 13:14Ah, you don't have any Windows? 13:14So let's give it the benefit of a doubt. 9214 13:15:D rebolek 13:15No, I haven't seen real Windows computer for months. 13:15If you are on Windows, try it. BeardPower 13:16Where can I find kravy.red? rebolek 13:16It's in the gist 13:16there are two files BeardPower 13:17lol Sorry, I must be blind :blush: rebolek 13:19It's easy to overlook it, it has only ~3000 lines ;) BeardPower 13:190.0fps for 100k 1.4 with 10k 13:20@rebolek Pardon the :older_man: rebolek 13:20So it's basically the same speed as here. 13:21@BeardPower No problem, I'm glad it works on different computer :) viayuve 13:21On Xeon phi may be rebolek 13:21do you have one? ;) BeardPower 13:22Xeon phi? Old tech -> Mill ;-) viayuve 13:23One of my client have 6 of them BeardPower 13:23@rebolek Yeah. I have: CPU: i7-3930K RAM 16,0 GB GPU: GTX 660 Ti Resolution: 1920x1200 9214 13:23@BeardPower I beg you to stop 13:24Cows -> Milk -> Millk BeardPower 13:24@9214 :smile: As you wish, sir! viayuve 13:24Okay mill than DideC 13:241000Cows give 2.24fps here / PixiJS give 9fps (default). On Win10/firefox. rebolek 13:25@DideC thanks for report! BeardPower 13:25The PixiJS default is 100k. rebolek 13:25And now the important question. How faster would it be with gob!s? :smile: BeardPower 13:25Yes, thanks for the report. So it's round about 50x. 13:26@rebolek Depends on the backend as well. DideC 13:26But process don't climb above 17% CPU. BeardPower 13:28@rebolek Is there some R3 benchmark with gobs? rebolek 13:29@BeardPower yes, there is R3 version of 1000 cows, let me find it... BeardPower 13:29:+1: DideC 13:29Give the link ;-) rebolek 13:31:) 13:31Hm, this one is not gob only, but testing R3GUI, so is much slower https://github.com/rebolek/1000cows/blob/master/1000cows.r3 13:33So it has to wait until I have access to my disk, sorry. 13:35It was available on AltME, but I think than on some older world than current. @pekr may have backup somewhere. BeardPower 13:35No worries. 13:36I think we should first try and compare it with the D2D backend. DideC 13:36I found it on Altme. BeardPower 13:37Maybe the face is not so much the bottleneck. DideC 13:38Need to found on wich R3 it runs :-) 13:40@rebolek It's in Altme/rebol4 files in %misc/ 13:41...but is R2 version :-( rebolek 13:43oh 13:43then I need to check my disk DideC 13:43Still 8 others versions to test... rebolek 13:43:D 13:44First version was for R2 to check AGG speedup DideC 13:45the one I test use gob!, but complain about "face has no value". rebolek 13:45Hm, hard to say what's causing it... BeardPower 13:46Seems it's the same bug @rebolek had some time ago? 13:47Where I suggested a fix by using (...) for the parameters of a function. rebolek 13:47@DideC can you please make a gist from it? DideC 13:51The script is both R2/r3 version, but the test on version number does not matched the R3 I used. Now the error is about "Script error: cannot access locals in path system/view/event-port/locals/handlers" ! :-/ rebolek 13:53Hm, I think I found ther right version on dropbox, but I don't have R3/View. 13:54@DideC can you check this version, please? https://github.com/rebolek/1000cows/blob/master/1000cows-r3-gob.r DideC 13:55Lol! the cow is biting its tail :-) https://gist.github.com/DideC/735b74fde3e20105dee2b221459f190e#file-1000cows-r 14:00@rebolek Pretty the same than the one I found. "Mine" as fps-meter in the window. rebolek 14:01both have same error? BeardPower 14:01>"Mine" as fps-meter in the window. I can't follow. What do you mean with "Mine"? DideC 14:02Mine=the one I posted above. Did I mispelled? BeardPower 14:03Ah. 14:04I thought there is a mine drawn as fps-meter :blush: DideC 14:04Boum! 14:04@rebolek same error with yours. rebolek 14:05Cows can explode, but you don't need a mine for it, click is enough :bomb: DideC 14:05must go. Bye. rebolek 14:05@DideC Interesting. It probably requires some specific R3 version. 14:05bye and thanks! BeardPower 14:06I guess the coder of the cowmark was a fan of Southpark. rebolek 14:07I am fan of Southpark, but I really can't remember why I drawn exploding cows :) BeardPower 14:08Hehe. Red should take some advice from the "Go Fund Yourself" episode :smile: 9214 14:10@rebolek [aaah](https://www.youtube.com/watch?v=4iXzJPJcpyY) :) ne1uno 14:10064 branch 30% slower? rebolek 14:12@ne1uno how did you test it? BeardPower 14:12@9214 [Wednesday](https://www.youtube.com/watch?v=UhGcG2nijaI) 9214 14:12@ne1uno either prove your numbers with FPS meter or run away from Doc ;) pekr 14:14Will try to find R3 version. However - the discussion about the hw acceleration is a moot point. R2 used AGG library for DRAW, R3 as a whole View replacement engine. And AGG is only a SW renderer imo .... ne1uno 14:14@rebolek your first 1000 cows from gist, same interpreted or compiled v063 but slower interpreted w/v064 redconsole just built rebolek 14:15@ne1uno interesting. dockimbel 14:22@ne1uno I just tried with both the old console and new console (latest commits for both), and I see no difference in the FPS (Win7). ne1uno 14:24I see slower run from both gui and red-console, win7-64 BeardPower 14:27@pekr Yes, AGG is a software renderer. Although I don't know if the buffer it can render into was all in main memory or some newer versions of Rebol used some GPU stuff. 14:31It's just to compare the performance of face and gob, so it does not matter, if it's hardware accelerated or not, as both use the same back-end. ne1uno 14:37it seems that the window is open larger in v064 which could account for the slower speed 14:40v064 may have noticed my higher DPI settings? BeardPower 14:49I will do some comparison with the D2D backend.. Ah, it's not compiling. Compiling to native code... *** Compilation Error: undefined symbol: draw-begin-d2d *** in file: %/E/Development/red/modules/view/backends/windows/draw-gdi.reds *** in function: exec/gui/draw-begin *** at line: 334 *** near: [ draw-begin-d2d ctx hWnd return ctx ] dockimbel 15:03@ne1uno IIRC, yes, the new console has better DPI support. 15:04@BeardPower I'm not sure if the D2D backend is yet usable, @qtxie can tell. qtxie 15:25@BeardPower Are you compiling the Direct2D branch? 15:27It's just a skeleton for now. The only thing you can draw is circle. :sweat_smile: BeardPower 16:25@qtxie Yes. That would suffice. I checked out the Direct2D branch and tried to compile it. I exits with the upper error. pekr 20:13@rebolek hooked-up my old hd, I seem to have R3 a31 to a99, a111, but I can't get it running. It checks for system/version = 99, but since long time, R3 was .100. I do remember it running using some early prototypes, during the Gabriele's GUI times. It would have to be adapted probably .... but - I remember it being much faster (an order of magnitude) than R2 version? Can't really say precisely .... toomasv 21:24Study of quadratic-bezier curve: [![quadratic-bezier curve](http://vooglaid.ee/red/quadratic-bezier.gif)](http://vooglaid.ee/red/quadratic-bezier.gif) Inspired by Wikipedia BeardPower 21:26Awesome! I thought about some math/trigonometry study app recently :) PeterWAWood 22:04@toomasv That's truly "top draw" :-) lepinekong_twitter 22:05@toomasv :+1: BeardPower 22:05It just missing some avatar of yours, who will explain that stuff ;-) 22:12That's exactly the "help content" of the bezier-curve I would expect from a Red IDE. Thursday 15th March, 2018 qtxie 00:23@BeardPower I can compile it with no error. Don't forget to add -r when you compile the gui-console. BeardPower 00:24@qtxie Yes, I ran the following command: do/args %red.r "-r -t Windows %environment/console/gui-console.red" 00:24From the Rebol2 console. qtxie 00:25@toomasv That's a good way to learn quadratic-bezier curve. :+1: BeardPower 00:25The Direct2D branch has the -=== Red Compiler 0.6.2 ===- 00:26 REBOL/View 2.7.8.3.1 1-Jan-2011 Copyright 2000-2011 REBOL Technologies. All rights reserved. REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM >> do/args %red.r "-r -t Windows %environment/console/gui-console.red" -=== Red Compiler 0.6.2 ===- Compiling E:\Development\red\environment\console\gui-console.red ... ...compilation time : 2491 ms Target: Windows Compiling to native code... *** Compilation Error: undefined symbol: draw-begin-d2d *** in file: %/E/Development/red/modules/view/backends/windows/draw-gdi.reds *** in function: exec/gui/draw-begin *** at line: 334 *** near: [ draw-begin-d2d ctx hWnd return ctx ] >> 00:27 E:\Development\red>git branch * Direct2D master E:\Development\red>git pull Already up to date. E:\Development\red> qtxie 00:30Which OS version are you using? 00:30Win 10? BeardPower 00:30Yes. 00:31The console version compiles. qtxie 00:34@BeardPower I think there is a bug in red.r, it cannot recognize Win 10. That's why it compile draw-gdi.reds. 00:34I'll push a fix soon. BeardPower 00:35@qtxie Thanks! Are you on Win7? qtxie 00:36Yes. BeardPower 00:37Ah, good to know :) qtxie 01:09@BeardPower What's the output of this command on your system? C:\> cmd /c ver Microsoft Windows [Version 6.1.7601] toomasv 04:01Thanks everybody! :) greggirwin 07:12@rebolek, I *love* concrete results! Thank you!! What does R2 give for the same number of cows? And do you have an R3+gob version, I can't remember. Desperately trying to catch up here now. pekr 07:15@greggirwin I do remember running 1000cows.r with R3, but some early variant, during the Gabriele's GUI times. The source code is divided by eitherclause, where it checks for the system/version/2being of value 99, whereas all (even really early) R3s I have, are of a value 100. I changed the code and got the script running, something like 352 fs in comparison to 32 of R2, but there was no window, so quite misleading :-) I think that @rebolek might be able to adapt, e.g. to Saphirion or other R3 kernels. It would be curious to see, what AGG was able to do, as an SW renderer ... greggirwin 07:17Thanks @pekr and all who are working on this. I'm caught up in this room now. @toomasv, tokens, tokens, can't wait to give you tokens. So simple. So nice. rebolek 07:26@pekr do you know where to get binaries? I tried to download from rebol.com, but they don't have View. 07:27352fps for how many cows, thousand? Then gob is really faster than draw pekr 09:23@rebolek - it did not show any window actually. Who knows, what it reported. It can't be used as a measure that way .... rebolek 10:22I see, thanks. toomasv 10:30[Study](https://gist.github.com/toomasv/8d297d6b65613c181be41fcf693e3655) of cubic bezier curve: [![cubic bezier curve](http://vooglaid.ee/red/cubic-bezier1.gif)](http://vooglaid.ee/red/cubic-bezier1.gif) 10:47@greggirwin Thanks! Imaginary tokens are lovely too :) lepinekong_twitter 11:05@toomasv impressive !!! I paste code in red console I got 4 points and 3 lines and timer but I can't see any bezier curve ? toomasv 11:18@lepinekong_twitter Any errors? On which machine? qtxie 11:24@toomasv Great! Works fine on Win 7. :smile: toomasv 11:26@qtxie Good! Thanks! BeardPower 12:11@qtxie Sorry for the delay: E:\Development\red>cmd /c ver Microsoft Windows [Version 10.0.16299.309] qtxie 12:12@BeardPower Thanks. I have pushed a fix for it. :smile: BeardPower 12:25@qtxie Wow, great service! Works! Just as a side note/hint: Windows defender reported Trojan:Win32/Dorv.D!rfn. 9214 12:34@BeardPower can you fill a ticket for that? BeardPower 12:37@9214 Sure. It did not report this before. 9214 12:42@BeardPower > I did not report this before. Just imagine, today is the last day when you'll be able to say that! ;) 12:44ah, I misread it :( 12:45welp, anyway, please write an issue so we can document that BeardPower 12:48@9214 Done: https://github.com/red/red/issues/3263 9214 12:48@BeardPower :+1: BeardPower 12:49I hope I will be able to say this in the future: Red runs perfect on RED/OS on the Mill. Threats? Never heard of one. ;-) 12:50There was a Windows update yesterday/some days ago. The heuristics engine was updated to work ~~~better~~~ worse. 13:06I tested it with the master branch as well. Same threat report, so I changed the ticket (I thought it was some Direct2D issue at first). dockimbel 13:45@BeardPower Seems like Windows Defender has started flagging Red since a couple of days, thanks to their new "machine learning" engine! ;-) 9214 13:46:rainbow: innovation and progress :rainbow: BeardPower 13:47@dockimbel Yeah, it's getting more ridiculous with every new update. 13:47We definitely need RED/OS (did I mention the Mill yet?) ;-) viayuve 13:48:+1: dockimbel 13:49@BeardPower Well, that's something we actually discussed with Carl. ;-) DideC 14:00"Windows Defender, Machine learning": Was just about to say that. As Red begin to appears on several machines it has been notice. BeardPower 14:01@dockimbel Really? I new there was some sweet fagrance of "the new Amiga" in the air lately :smile: dockimbel 14:03@BeardPower Yes, working on a small OS is something Carl has on his mind too, it's the logical next step of the Redbol path. ;-) BeardPower 14:04@dockimbel :clap: I don't know how familiar you are with the Mill, but as Carl is a micro-kernel advocate, the Mill would be the perfect architecture for that, as it's designed for micro-kernels ;-) 14:04I'm sold, that's for sure! dockimbel 14:05@BeardPower The question is then: can you build a decent OS on top of that, usable on PC (or at least a RPI) by the masses? The kernel is really a small part of the work in an OS, drivers are the big hard part (unless it's just for research purpose). rebolek 14:06@BeardPower while I like your enthusiasm for Mill, wouldn't some existing architecture be better target? ;) BeardPower 14:10@dockimbel Yes you can. Exokernels are getting a little traction lately, so your OS would be just a lib (libOS). It could run Linux, Windows whatever and simultaneously. It's not decided yet, but plans are, that the Mill will use some standard sockets of Intel/AMD and the standard MoBos. The Mill architecture is a compiler target with a specializer like on the old IBM machines. The first OS they want to port is Linux and (s)el4. 9214 14:10@BeardPower I'm okay as long as it has Badgers screensaver. BeardPower 14:11@rebolek Not really, as the existing architectures are ancient, carry bloat from the 80ties, are all but power efficient, expensive and have a lot of security issues. 14:11@9214 It will be the first one implemented ;-) 14:17@BeardPower But I agree, that existing architectures have a wide reach. The Mill needs some big money and collaborators anyway. It's a few years of to an actual product. Using an Exokernel would be ideal, as the OS is just a lib. The kernel is very small and could be ported fast. The programs for the Mill would just need to be recompiled. 14:18The interesting part of the Mill: you could produce a product tailored to the specific needs of RED ;-) 14:18Or it's market. 9214 14:19red/Mill room, anyone? ;) BeardPower 14:20@9214 :+1: 14:22@dockimbel Sorry, there was a typo: (s)el4 -> (se)L4. DideC 14:40@dockimbel @rebolek @greggirwin I have made some tests with 1000cows.r and the R3 I have in my machines. First the [updated code is here](https://gist.github.com/DideC/735b74fde3e20105dee2b221459f190e) 14:42This 1000cows.r script works on R2/R3 and I have tested it on the following R3 provider/version : - max 31fps on R2 v2.7.8.3.1 - max 28fps on R3 saphirion v2.101.0.3.1 Build: 28-Jun-2013/16:18:18 (no transparency) - max 110fps on R3 Atronix v3.0.99.3.1 (32bits) Build: 22-Oct-2015/14:43:25 (no transparency) - max 143fps on R3 Atronix v3.0.99.3.3 (64bits) Build: 22-Oct-2015/14:44:16 (no transparency) - max 172fps on R3 RMAassets v2.100.111.3.1 Build: 20-Feb-2011/16:24:43 rebolek 14:43@DideC wow, thanks for such thorough testing! DideC 14:46I guess the view engine was very tiny as the oldest one runs the fastest and with transparency. I'm surprised that Saphirion's R3 does not do it anymore. lepinekong_twitter 17:16@toomasv I'm on Windows 10, no error it may just be I don't know how to use it ? I just click on a point and drag it successfully but it didn't draw any red curve. BeardPower 17:25Now the Direct2D backend is working, I also will try to make some benchmarks :) 9214 17:27@9214 1K Badgers BeardPower 17:28If I manage to draw them with circles only ;-) toomasv 17:33@lepinekong_twitter It is supposed to start drawing the red line automatically when opened. ne1uno 17:341000 frisbies BeardPower 17:39Is there a reason for this in the fps-meter function? now/time/precise + negate tim) Why not just: now/time/precise - tim) 17:39Why waste cycles on negate? rebolek 17:46@BeardPower IIRC there was some bug with time math, so I had to do this as a workaround. toomasv 17:47@lepinekong_twitter Please try again, I made some changes. BeardPower 17:48@rebolek I see. Do you know the issue? rebolek 17:49@BeardPower this was in some early version of R3 alpha, it's long gone. I've just haven't touch the original R3 code since then :( BeardPower 17:52@rebolek I see. lepinekong_twitter 18:35@toomasv just tried same. I use 0.6.3 build Oct 17th. toomasv 18:36@lepinekong_twitter Maybe it's too old build? My build at the moment is March 13th. lepinekong_twitter 18:37@toomasv :+1: yeah on red-build works ! toomasv 18:37:+1: I updated [quadratic-bezier](https://gist.github.com/toomasv/6176114cf830390bc46bca29ba2b029f) too. lepinekong_twitter 19:41@toomasv test ok also on my machine :+1: BeardPower 20:01I made some tests with my naive benchmark :) GDI/GDI+: 16fps D2D: 41fps 20:05Happy testing :D https://gist.github.com/BeardPower/15c7b363ff160f21a7a260718abbe0f9 20:07@qtxie D2D is about 2.5x faster than GDI/GDI+. rebolek 20:11:+1: BeardPower 20:13Depending on the amount of items. 1000 circles will have a D2D gain of that factor. A lower amount like 100 has equal fps, but not close to 60fps, just about 42fps on my machine. 20:13So we can gain a very good amount of performance just by switching to a D2D backend. 9214 20:14@9214 circles circles circles circles... beizer curve! beizer curve! circles circles circles circles... AH! square! it's a square! OOOH... BeardPower 20:14[gui-console_d2d.exe](https://files.gitter.im/red/red/gui-branch/wWew/gui-console_d2d.exe) 20:14In case you don't want to compile it yourself. 9214 20:15oh, I didn't know you can send files here! BeardPower 20:15@9214 <- apprentice ;-) 20:15@BeardPower master 9214 20:16oh mighty purple derp face \o/ BeardPower 20:17I read about the drag&drop functionality a few days ago, because I don't wanted to upload pictures to a server :) rebolek 20:17oh mighty dub katz 9214 20:17Nay, I know about drag and drop, I just thought that gitter won't accept executables. 20:17Insecure and all that. BeardPower 20:18Honestly, I just tried it with that file ;-) 20:19@9214 Yeah, funny, isn't it. Security through "benefit of a doubt". 9214 20:20@rebolek [huh?](https://www.youtube.com/watch?v=gX2CQqPvnys) rebolek 20:22@9214 what a ride ne1uno 20:24@BeardPower> where is the fps? I'm seeing only circles 20:29woops, guess it waits for a click or something? BeardPower 20:37@ne1uno Sorry, yes. you need to click on it. It takes a little time to create the circles. It's a really naive benchmark ;-) 20:39You can just comment out the on-up event and add the rate to the base 20:41 Red [] fps-text: "" st: 0 cirlces: 1000 fps-meter: func[/local] [ if not value? 'tim [tim: now/time/precise st: 0] if (now/time/precise - tim) > 00:00:01 [ tim: now/time/precise fps-text: [st " fps"] print fps-text st: 0 ] st: st + 1 ] view [base 400x400 rate 60 on-create [ loop cirlces [append face/draw compose [circle (random 400x400) (random 20)]] ] on-time [ id: (random cirlces) * 3 - 1 face/draw/:id: face/draw/:id + random 10x10 * pick [1 -1] random 2 fps-meter ] on-up [ ;face/rate: 60 ] draw [ ] ] 20:42It prints the fps in the console. ne1uno 20:50bigger question, why am I getting the same fps results on a core2duo? BeardPower 20:53Because it's light on CPU? 20:54What other system did you test on? ne1uno 20:55only against your numbers. you said i7 earlier I think? BeardPower 20:55Yes. 20:55Maybe it's because of the rate of the face. 20:56I don't know what the max rate is. IIRC 60fps is the maximum. 20:58If it is not able to refresh every 60fps, it will show lower fps. It's capped at 60fps. 21:05But I agree with you, it's kind of puzzling. Just showing the circles without moving them around show the same fps. 21:06Can you try another value? Maybe 100circles or 5000? ne1uno 21:075k 11fps 21:07d2d BeardPower 21:085k 32fps 21:10I think it was just a coincidence :) qtxie 23:34@BeardPower Good! Thanks.:-) Friday 16th March, 2018 luis-rj 02:27gui-console_d2d.exe Win 10, Windows Defender detect as Trojan:Win32/Dorv.D!rfn ne1uno 04:15clamwin doesn't flag it. I get a fair amount of false positives with it, but it's ok with red greggirwin 05:10@luis-rj please report to MS. New machine learning seems to be an issue with Defender for us. DideC 09:40@luis-rj see #3263 (please, add your report url as a comment) and #3255. BeardPower 11:35I made some further tests with the Draw/UI rendering. There seems to be some extreme issue/bottleneck. Drawing only 5 circles, performance degrades to 35fps! Based on the rendering work it has to do, it should render it with 1000fps! 11:36I need to make further tests with 0.6.4 and the new console, as it does not buffer the complete output. 11:52Or there is some issue with the time. Just looping through two time calls takes 2 seconds??? t1: now/time/precise loop 10000 [ti: now/time/precise t2: now/time/precise print ["t2:" t2 "t1:" t1 frame-time: t2 - t1 "frame-time:" frame-time "fps:" 1 / (frame-time/second)]] t2: 12:52:33.011 t1: 12:52:30.539 0:00:02.472 frame-time: 0:00:02.472 fps: 0.4045307443363124 t2: 12:52:33.011 t1: 12:52:30.539 0:00:02.472 frame-time: 0:00:02.472 fps: 0.4045307443363124 t2: 12:52:33.011 t1: 12:52:30.539 0:00:02.472 frame-time: 0:00:02.472 fps: 0.4045307443363124 11:53@dockimbel Do you have any clue, why? ne1uno 11:53v064 red-console steals focus from view at the start, then doesn't print till you give it focus. that makes it difficult to use as a debug console rebolek 11:56@BeardPower t1 vs ti? 11:57When I fix it, I get 142 '000 fps 9214 11:59I love it when confusing naming comes into play :) 12:00especially when you use Cyrillic о instead of English o. 12:00Extreme case of evilness. BeardPower 12:01Oops, sorry my fault. 12:01I now get infinite fps.... 12:03@9214 Very strange. t1 and t2 are the same value for me. 12:04142k fps down to 40fps by just drawing 3 circles -> what is going on ;-) rebolek 12:07 @9214 :D 12:07@BeardPower what fps do you get for one and two circles? BeardPower 12:34Infinite rebolek 12:34so it's infinite-infinite-35 ? BeardPower 12:35Hold on. 12:35Testing again, had some issue ;-) 12:36Both about 1k fps. The precision timer does not have enough precision, so it shows the same time ;-) rebolek 12:36so it's 1000 for two circles and then it slows down by factor of 30? BeardPower 12:38Sorry for the confusion: I used auto-sync and deferred mode with various numbers. auto-sync with 1-2 circles: 41fps deferred mode with 1-2 circles: >1000fps auto-sync with 100 circles: 41fps deferred mode with 100 circles: 125fps auto-sync with 5k circles: 4fps deferred mode with 5k circles: 2fps 12:39Then I tested with deferred mode: 1-2 circles render with about 1k fps. 12:40auto-sync with 5k circles: 4fps deferred mode with 5k circles: 2fps DideC 12:42Sorry, your presentation is still confusing. BeardPower 12:42auto-sync with 100 circles: 41fps deferred mode with 100 circles: 125fps 12:42@DideC Sorry, I know. So again and more clear. DideC 12:43Maybe you can still edit the previous post. BeardPower 12:45@DideC Yep! Thanks for the hint :) 12:46So why these huge differences and suddenly deferred is 0.5x of the auto-sync mode with 5k circles. 12:47https://gist.github.com/BeardPower/5725e81e13a2890115362bdf730cbf14 rebolek 12:4963fps with two circles on Wine 9214 12:50same as @rebolek, Wine BeardPower 12:51The 0.5x does not happen with the D2D backend. 12:51@rebolek Is this auto-sync or deferred mode? 12:51And which backend? rebolek 12:53auto-sync? I just copypasted it and added do-events 12:54Backend default BeardPower 12:54Another funny issue. 2 circles and deferred mode: gdi back-end: 1000fps d2d back-end: 100fps 12:55@rebolek Change the following for deferred mode: system/view/auto-sync?: off and un-comment the loop. rebolek 12:56@BeardPower it says 1000fps in the console, but I don't see any animation BeardPower 12:57@rebolek I changed the gist example to deferred mode as default :) 12:58It's because the loop is only doing 10 iterations. DideC 12:58Nos sure that testing with face/rate and draw give you reliable numbers! 1000cows does a loop to test the drawing velocity only. rebolek 12:58@BeardPower that does nothing BeardPower 12:59@rebolek Set the loop to 5000 iterations and 2 circles :) 12:59@DideC The question is why it would not give reliable numbers. rebolek 13:00@BeardPower ok, now it prints 1000fps BeardPower 13:00@rebolek Please refresh the gist from above :) 13:00@rebolek Yeah 1000fps vs. 63fps.... 13:01Now use more circles. 100, 1000 and compare again. 13:02I get about 160fps vs. 41fps @100 circles 13:07I get about 15fps vs. 15fps @1000 circles but with the D2D backend I get about 61fps vs. 41fps @1000 circles 13:101k circles is all but a high load. I should render with 500fps. 13:10There is extreme performance degrading. 13:11I need to make some graph for easier understanding. ne1uno 13:131000 pies rebolek 13:13@BeardPower how much fps do you get @9214 circles? BeardPower 13:16@rebolek gdi: 1.5 D2D: 18 9214 13:17@rebolek wat BeardPower 13:17@9214 9214 circles :smile: rebolek 13:17:) BeardPower 13:18Something is really odd with these numbers. 13:181000fps vs 41fps -> WTF ;-) 13:20@rebolek Please fix it with your red magic ;-) rebolek 13:22@BeardPower that's up to @qtxie I'm afraid :worried: maximvl 13:22this is what I got: >> do %deferred-test.red 0 fps t2: 14:22:31.257 t1: 14:22:31.255 0:00:00.002 frame-time: 0:00:00.002 fps: 499.9999998981366 t2: 14:22:31.258 t1: 14:22:31.257 0:00:00.001 frame-time: 0:00:00.001 fps: 999.9999961582944 t2: 14:22:31.258 t1: 14:22:31.258 0:00:00 frame-time: 0:00:00 fps: 1.#INF t2: 14:22:31.259 t1: 14:22:31.258 0:00:00.001 frame-time: 0:00:00.001 fps: 1000.000003434252 t2: 14:22:31.26 t1: 14:22:31.259 0:00:00.001 frame-time: 0:00:00.001 fps: 999.9999961582944 t2: 14:22:31.261 t1: 14:22:31.26 0:00:00.001 frame-time: 0:00:00.001 fps: 1000.000003434252 t2: 14:22:31.262 t1: 14:22:31.261 0:00:00.001 frame-time: 0:00:00.001 fps: 999.9999961582944 t2: 14:22:31.263 t1: 14:22:31.262 0:00:00.001 frame-time: 0:00:00.001 fps: 1000.000003434252 t2: 14:22:31.264 t1: 14:22:31.263 0:00:00.001 frame-time: 0:00:00.001 fps: 999.9999961582944 t2: 14:22:31.265 t1: 14:22:31.264 0:00:00.001 frame-time: 0:00:00.001 fps: 1000.000003434252 BeardPower 13:22Yeah, maybe he has a clue. maximvl 13:23no animation is visible, I only see two circles on a pane BeardPower 13:24@maximvl To see the animation, you need to set the loop iteration higher. E.g. 5000. I just used 10, because a higher amount of circles degrades performance very fast and is sufficient to calculate the fps. 13:24Thanks everyone for testing! 13:25I just found out some weird thing (I just measured the tick-rate without any drawing at all): face/rate: 60 -> will only give me 41fps face/rate: 120 -> will only give me 65fps 13:30https://gist.github.com/BeardPower/955c682f23359472ab359c95ce671dca 13:31Try with different rates: 60, 120,... None is giving you the rate as expected. DideC 14:55for me, testing face/rate and Draw performance in between can't give reliable results. At t ms you start a modification that ends at t+x ms. You probably missed some timer events and the next can occur just after or 1/60s later. So the question is "what do you want to test exactly?" 14:57[Here is a gist](https://gist.github.com/DideC/1667910f24a4172d706b77d76729e253#file-some-circles-r) based on mix between your idea and 1000cows (no rate, but loop). Wait a bit then click "next test" to add circles. 15:01Red is single threaded so the raw CPU speed is the limitation with basic graphics perf (numbers of core does not account). 15:03Please, let it run a bit with no circles at the end. 15:03My results: Auto-sync is false | 884fps/2circles | 659fps/10circles | 342fps/50circles | 178fps/100circles | 97fps/200circles | 40fps/500circles | 21fps/1000circles | 11fps/2000circles | 5fps/5000circles | 3fps/10000circles | 46982fps/no circles | 46520fps/no circles BeardPower 15:18@DideC Awesome! I will collect some data with the different back-ends and plot the data. 15:20And yes, the rate is not really reliable. Like you said, there could be incoming events, which are missed, but missing 20fps/60fps just by printing out the frame times sounds a little high to me. DideC 15:21Results with Auto-sync on. Look the last: Auto-sync is true | 891fps/2circles | 713fps/10circles | 305fps/50circles | 180fps/100circles | 92fps/200circles | 39fps/500circles | 20fps/1000circles | 83fps/2000circles | 13fps/5000circles | 2fps/10000circles | 199000fps/no circles BeardPower 15:21I will test further without wasting to much cycles. Maybe that gives some insights. 15:21@DideC Could you please provide your specs? So I can add it to a plot. 15:22I will run a similar circle test on a 2D/3D engine later. Interesting results! 15:24Is this with the D2D backend? It would be great if you could provide Auto-syn off/on with both the GDI and the D2D backend! Much appreciated! DideC 15:24Wait a bit! BeardPower 15:25Sure! Take your time. ne1uno 15:25d2d Auto-sync is true | 122fps/2circles | 64fps/10circles | 64fps/50circles | 63fps/100circles | 64fps/200circles | 62fps/500circles | 42fps/1000circles | 31fps/2000circles | 15fps/5000circles | 7fps/10000circles | 92689fps/no circles | 90569fps/no circles 15:25_latest Auto-sync is true | 340fps/2circles | 237fps/10circles | 143fps/50circles | 113fps/100circles | 77fps/200circles | 56fps/500circles | 26fps/1000circles | 14fps/2000circles | 7fps/5000circles | 4fps/10000circles | 90032fps/no circles | 90109fps/no circles DideC 15:25There is a flow in the test: previous fps is not reset when you pick next test so the value is not reliable. BeardPower 15:26OK. DideC 15:30I updated the gist. New: you can test by moving all circles or just one at each loop. Just to see Interpretation influence on the overall speed. 15:31(note: the checkbox is always checked! Bug?) BeardPower 15:34:+1: 15:39I waited 1 minute for the 10k circles, but they do not appear. 15:41Restarted the app -> works. 15:53@DideC Just a personal question: why are you prefixing your variable names with f-? f-fps, f-all? pekr 16:33@BeardPower there are some circles you probably don't want to see anyway :-) 16:33http://img.moviepostershop.com/the-ring-movie-poster-2002-1020189818.jpg DideC 16:44@BeardPower "f-" is a prefix for "face". An old habit I take in my Rebol/view apps to distinguish face objects from other values. With complicated window (lot of named faces), I feel the code is easier to read. BeardPower 18:09@pekr Oh, snap! 😲 18:09@DideC Ah, yep, that makes sense. 20:52@DideC Here is my plot. The test with the 2D/3D engine will follow later. 21:03[![benchmarks_Red.jpg](https://files.gitter.im/red/red/gui-branch/W12m/thumb/benchmarks_Red.jpg)](https://files.gitter.im/red/red/gui-branch/W12m/benchmarks_Red.jpg) qtxie 23:29> I just found out some weird thing (I just measured the tick-rate without any drawing at all): face/rate: 60 -> will only give me 41fps face/rate: 120 -> will only give me 65fps Yes. the rate missing too much. 23:30Just check the SetTimer API, the minimum timeout we can set is 10 ms, so the maximum rate is 100 fps. BeardPower 23:31Ah, the old 10ms Windows issue. 23:32What do you think about the GDI+/D2D discrepancy? 500 circles seems to be the sweet spot. qtxie 23:40I have no idea. From what I read online, in general apps, GDI+ is slower than GDI, D2D is the same or a bit better faster then GDI while with transparency and anti-alias enabled. 23:42Also circle may not be a good test for hardware accelerated renderer. I think D2D use CPU for it. BeardPower 23:43Yeah, I also read the same. 800fps vs 150fps, wow, I did not see that coming. qtxie 23:44Resources (pen, brush, etc) are heavy in D2D, maybe that's why it's slower at the beginning. BeardPower 23:44GDI does not support transparency. qtxie 23:45Yes. That's why it's faster. D2D can have the same speed with transparency support. BeardPower 23:45By a factor of 5-6? I need more bench-marking data :) 23:46What's also interesting is the performance advantage of auto-sync on compared to auto-sync off. 23:47I will code the same example for a 2D/3D engine with various backends, so that we can see Red's status in regard to rendering :) 23:48Is the call to show so much more expensive than the automatic refresh? qtxie 23:48Great! I'll check the D2D code to see if I can improve it. :-) BeardPower 23:48:+1: qtxie 23:49> Is the call to show so much more expensive than the automatic refresh? Should not have a big difference. BeardPower 23:51It's about up to 6% gain for auto-sync on. 23:51But also depends on the number of objects. qtxie 23:51Ok. Noted. Another issue to check. :smile: BeardPower 23:53Super! 23:53I'm really curious about the engine's performance. 23:55>Also circle may not be a good test for hardware accelerated renderer. I think D2D use CPU for it. I will check on that. 23:56But seems plausible. Saturday 17th March, 2018 DideC 13:41Auto-sync? does not account much in this case. AFAIK it triggers a redraw of a face as soon as it is modified. Here, there is few face changed, only the canvas at each cicle and sometimes the fps. Put each circle in its own base face and it will be something else !!! BeardPower 13:57And that's why the 6% difference is even more of concern. 13:59Yes, the redraw is happening as soon as the face is modified. From my point of view it should be in the 1% range. toomasv 20:26Added Bezier curves and splines to drawing-pad. For some reason I haven't discovered yet, alt-down does not register event/offsets outside of panel but left downdoes. I would like both to register these offsets. Any clues? [![mouse/offset registering problem](http://vooglaid.ee/red/cubic-bezier2.gif)](http://vooglaid.ee/red/cubic-bezier2.gif) Also, @qtxie , would it be possible to have panels with transparency? Sunday 18th March, 2018 qtxie 00:57It cannot. Can you use base as a container? 00:59I think it's possible to use base as container if you only put base faces in it. BeardPower 01:50@toomasv :+1: What program do you use for creating the gifs? prapro 04:40And it would be awesome if we could make such gifs in red directly. 04:42You could do some awesome vnc stuff too if that is possible. toomasv 05:15@qtxie Aha! Thank you! @BeardPower I use [ScreenToGif](http://www.screentogif.com/) 06:39@qtxie I tried with base as container, and it works, except that if you set alpha-cannel of the container-base, then children in its pane window is created relative to the screen, not relative to parent window. Compare these: view [base 0.0.0 with [pane: layout/only [base green]]] view [base 0.0.0.0 with [pane: layout/only [base green]]] BeardPower 11:21@toomasv That's what I use too👍🏻 12:14@prapro I have an alternative proposal: just transfer the words on the remote side over a protocol and reproduce the output on the client side. qtxie 12:40@toomasv Yes. Works fine on Win7 but not on Win10. 12:58Ah, it can only contains transparent base faces. 13:04We use layered window on Windows to support alpha-channel enabled window. But layered window is very limited. It cannot be child window before Win8 (we use some tricks to simulate it, but not perfect). It can only has layered window as child, that means you cannot put standard control (e.g. button, field, normal base face) in it. toomasv 13:45@qtxie Thanks! With transparent faces works, and thats what I need! @BeardPower :+1: prapro 16:10@BeardPower 16:24After sleeping on it, I realized its quite easy to save a window as a single gif: save/as bin: #{} to-image view/no-wait [text "Hello World!"] 'gif Could be a nice way to patch HTML client or other unsupported client into red, but when red to red, your right that other ways seem more attractive. 16:26Err... not a nice way... more of a quick and dirty way. toomasv 19:13Added some keybord shotcuts to drawing-pad: [![shortcuts](http://vooglaid.ee/red/shortcuts.gif)](http://vooglaid.ee/red/shortcuts.gif) Here is little demo [![shortcuts demo](http://vooglaid.ee/red/shortcuts2.gif)](http://vooglaid.ee/red/shortcuts2.gif) After drawing, instead of selecting action from text-list's menu, just press a letter on keybord -- in demo "M" to move points, "R" to rotate, "S" to scale... To change selection, use wheel over text-list (ctrl-wheel changes z-order). Also, layer can now be exported to png, jpeg and gif (wo anim). prapro 22:02I have to admit @toomasv, I'm a fan of your work. Very nice. Monday 19th March, 2018 toomasv 03:35@prapro Thanks! rebolek 09:06How is default action in VID implemented? When add default action to some custom style ( my-style [print "hello"] ), it "kills" the style, the print "hello" action is triggered on click, but all other actors are ignored (on-over for example). If I may suggest, this code should be stored to some default location, for example in on-action actor and style author should trigger it from within the style code (on click, on over or on other action, depending on style). dockimbel 10:44@rebolek Custom styles don't support setting a default action currently. The built-in default actions are listed in %view/styles.red, under default-actor property. rebolek 10:45@dockimbel I see. When they will, I hope it will be in way similar to what I've suggested. dockimbel 10:47Just having a quick look at it: it might be enough to change [this line](https://github.com/red/red/blob/v0.6.4/modules/view/VID.red#L359) to: either styling? [style/default-actor: value][make-actor opts style/default-actor value spec] Just a raw guess... rebolek 10:51I will give it a try and share my experience. 11:00I'm asking because I wrote [range style](https://gitlab.com/rebolek/red-styles/blob/master/range-style.red) this morning and now I wonder how to propagate values to some other style directly without some intermediate button or something. dockimbel 12:04That falls under the whole "custom style" framework that is not there yet. We had some early rough ideas with @qtixe about how to support that in powerful ways, though didn't had the time to prototype it so far. rebolek 12:31I see. Such framework could be useful. Maybe should write some document describing my experience with writing custom styles, what should be improved and how. 12:38But it probably would be good to know what the ideas for the framework are. BeardPower 12:39I second that. The issue with a "custom style" framework are the native widget limitations. Apple don't allow certain aspects of widgets to be changed, so customization is limited. dockimbel 12:55@BeardPower @rebolek I'll try to find some time tonight or tomorrow to write down our ideas/directions about that. rebolek 12:55@dockimbel that would be great, thanks! BeardPower 12:56@dockimbel :+1: toomasv 16:52[Digging deeper into curves](https://gist.github.com/toomasv/48174a493212dca35ecf1e9b86fe5da2): [![infinity](http://vooglaid.ee/red/bezier1.gif)](http://vooglaid.ee/red/bezier1.gif) prapro 16:52Is there a way to stretch an image toomasv 16:52Nope. But you can click on it :) 9214 16:53@prapro you mean in Red? rebolek 16:55Of course you can stretch an image: >> image: load %image.jpg == make image! [294x300 #{ 010101010101010101010101010101010101010101010101010101010101 010101010101010101010101010101010101010101010101010101010101 010101010101010101010101010101010101010101 >> view [base 300x200 draw [image image 0x0 300x200]] prapro 16:55Excuse me, I meant is there a way to stretch an image to four arbitrary points? rebolek 16:56So not in rectangle but in any quadrilateral? toomasv 16:57@prapro Oops, thought you asked about included image. :flushed: prapro 16:57Precisely @rebolek 9214 16:57Matrix transformations or something? 16:58It's doable I guess, @toomasv has some gist examples. rebolek 16:58@prapro this should do it, but shows nothing on Wine, so I can't tell for sure: view [base 300x200 draw [image image 0x0 250x50 180x10 300x200]] 16:58see https://doc.red-lang.org/en/draw.html#_image toomasv 16:59> Four points mode is not yet implemented. prapro 16:59Tried that yesterday, doesn't seem supported yet. rebolek 16:59So it's not Wine's fault :) prapro 17:00Perhaps transform? toomasv 17:02[![blob](https://files.gitter.im/red/red/gui-branch/g9W8/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/g9W8/blob) 17:02Not quite arbitrary 17:04You can skew, scale, flip, rotate with matrix (transform too) prapro 17:04It's a critical difference when generating tiles in 3d. toomasv 17:05Well, Draw is currently 2D prapro 17:06It would be 3d if I could do that. :) toomasv 17:06You can, but you have to really know the math behind it 9214 17:07> You can, but you should be me fixed typos ;) toomasv 17:08Naay 9214 17:08> Yiss fixed too prapro 17:08I am generating points for the planes, but can't figure out how to get draw to stuff an image in them correctly. 17:14Seems like filled polygons for the time being. 20:53After some more study of linear algebra, the problem is draw's matrix is 3x3 which can only yield parallel lines. A 4x4 matrix is required for perspective distortion. BeardPower 20:54It seems it was never needed before, as Red is not supporting 3D yet. Tuesday 20th March, 2018 BeardPower 00:30@qtxie I made the 2D/3D engine test with DX11, but draw quads. The numbers with quads is about the same as with circles. Red is way behind a 2D/3D engine ;-) 00:30[![kha.jpg](https://files.gitter.im/red/red/gui-branch/oA8j/thumb/kha.jpg)](https://files.gitter.im/red/red/gui-branch/oA8j/kha.jpg) 00:31It renders 10k quads with 60fps. 00:31Red renders 2000 quads with 60fps. As compared to Red, the 2D/3D engine has a 5x better performance. 00:31[![benchmarks_Red.jpg](https://files.gitter.im/red/red/gui-branch/WpYy/thumb/benchmarks_Red.jpg)](https://files.gitter.im/red/red/gui-branch/WpYy/benchmarks_Red.jpg) 00:39The fastest Red (Async off/D2D) in comparison to Kha: 00:39[![kha_2.jpg](https://files.gitter.im/red/red/gui-branch/ScMR/thumb/kha_2.jpg)](https://files.gitter.im/red/red/gui-branch/ScMR/kha_2.jpg) 00:41Info: I capped Kha to 60fps. prapro 02:57That's alot better than what I was expecting. 02:58But better graphics is always better. dockimbel 03:55@BeardPower Pretty good results for Red given that we have no optimizations yet, while Kha is advertised as "high performance". We have a lot of space to improve performances, so it means we will likely catch up with fast engines. 05:57@BeardPower @prapro > Excuse me, I meant is there a way to stretch an image to four arbitrary points? Planned but not supported yet, as the GDI+ backend we currently use on Windows does not support it. We could implement it as an image effect though, once the image effect pipeline will be integrated. 05:58@BeardPower @rebolek A very short draft about possible approaches for custom styles: https://github.com/red/red/wiki/Red-Custom-Styles rebolek 07:57@dockimbel Thanks, I will try to write some notes re 2) and 3) BeardPower 09:44@prapro @dockimbel Absolutely, considering there are no shader as well. Once all this is done, we need some real world benchmarks instead of such synthetic ones. DideC 09:53Don't know for Kha, but Red is mono threaded and Draw is not hardware accelerated (at this time). So the perf is mainly based on raw CPU frequency I guess. Using Direct2D could change the "not hardware accelerated" claims above (don't know)! BeardPower 09:56Kha is also single threaded. lepinekong_twitter 09:57nice way to demonstrate reactive ;) on http://reactive.how http://reactive.how/img/pipeline-operator/code-with-pipeline-operator.gif BeardPower 09:57@DideC The benchmarks are performed with the D2D backend of Red. 09:59Draw is hardware accelerated, as it's using GDI/GDI+. 09:59So whatever GDI/GDI+/D2D is hardware accelerating, Red is using it. 10:03@lepinekong_twitter Nice. What's going on behind the scenes in Red, could be implemented by hooking into it's memory and visualize it. 10:04Like http://pythontutor.com/ lepinekong_twitter 10:06@BeardPower I'll try to do something similar in Red (when I'll master draw :D) to simulate Deming's "Red Bead Experiment" https://www.youtube.com/watch?v=ckBfbvOXDvU BeardPower 10:11@lepinekong_twitter Do you have a TRUE RNG? ;-) lepinekong_twitter 10:15@BeardPower :smile: https://twitter.com/lepinekong/status/975783811660337158 BeardPower 11:00Hehe. Phryxe 11:22[Magic Leap SDK aka LuminSDK](https://www.magicleap.com/creator?) BeardPower 11:39@Phryxe So they finally managed to have some real product and not some vaporware and CGI fakes? 9214 11:41@BeardPower 11:41[![image.png](https://files.gitter.im/red/red/gui-branch/J2bw/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/J2bw/image.png) 11:41https://www.youtube.com/watch?v=a1Y73sPHKxw BeardPower 11:41LOL I just wanted to take a screenshot of that :+1: Phryxe 12:21@9214 :smile: @BeardPower Don't know anything about it. I think Doc mentioned about Magic Leap a long time ago. BeardPower 12:26@Phryxe They claimed that this was real footage. In the end it was just a CGI fake: https://www.youtube.com/watch?v=kPMHcanq0xM 12:29https://www.youtube.com/watch?v=t_m25k_9yHM 12:29Vaporware ;-) 12:36But it seems, that they now have a product of some sort, but nothing compared to the fake videos. toomasv 15:02 In yesterday's demo there was one more-or-less obvious omission. Now corrected: [![rough ride](http://vooglaid.ee/red/bezier2.gif)](http://vooglaid.ee/red/bezier2.gif) 9214 15:04Programming paintings: "Successful entrepreneur mesmerizes AV vendors into fixing their :shit: heuristics". Vooglaid, 2018, Draw dialect. maximvl 15:08@toomasv do you mind posting the demo on reddit? toomasv 15:09@maximvl OK, will try maximvl 15:10do or do not, there is no try :D toomasv 15:25Tried nevertheless. 15:39There is always a try. If it succeeds you have done it. BeardPower 15:43No retreat, no surrender :smile: dockimbel 15:45@toomasv Love it ;) toomasv 15:48:smile: prapro 18:43I've 19:05... decided to kick the project up a notch and go with opengl or some other 3d library. Any recommendations? BeardPower 19:16@prapro http://kha.tech/ prapro 19:17I was dearly waiting your response @BeardPower 😀 19:20Is Kha practical to interface with red? BeardPower 19:24Kha is similar to SDL/SFML but written in Haxe. For native targets, it's using Kore, which is implemented in C++. So yes. It's not C, but should be doable as well. 19:24If you want to see, what it's capable of: http://armory3d.org/ 19:25armory3d is powered by Kha. armory3d is using Blender for it's interface. Think of UE. Oldes 21:30@prapro I don't know which project you kick, but I like [Sokol](https://github.com/floooh/sokol) (C) and [Oryol](https://github.com/floooh/oryol) (C++) projects for 3D, because I feel a Rebol nature from them. BeardPower 21:40@prapro You don't need any knowledge of OpenGL or DX for using Kha/Kore. It has a great and easy to understand API. It also has it's own shader compiler :) 21:41And it's German engineering ;-) Oldes 22:52For me.. Haxe is somehow heavy. And I'm old Flash user so Haxe should be natural path to go for me. I decided to go the longer path even when it means to learn a lot of things. BeardPower 22:53Heavy in which regards? Oldes 22:56Hm. Hard to say shortly.. it is late and I'm on mobile only. I was simply not satisfied with results. Even simple test for native targets were pretty big in size and zi would not want to debug bigger projects. 22:57But of course.. Haxe has some traction. BeardPower 22:58I see. 22:58Btw. I found a fix for UPX :) 22:58Tested and confirmed working. Oldes 23:00Also Haxe's cross-compatibility is still questionable. BeardPower 23:00Why? Oldes 23:02Haxe's produces native projects and I don't believe that you can easily modify these without ending on the native side completely. 23:02For big projects. 23:04But as I said... I'm still ActionScript user so Haxe's is quite natural for me.. just the native code it produces may be difficult to maintain. BeardPower 23:04Ah. Well, there was no need for me to modify the generated code. I'm developing one big project now with Haxe, so I'm also testing if it's viable. Until Red fits my needs, of course :) 23:06And there is also hashlink. Oldes 23:07You know that we may be banned for such a talks here? ;) BeardPower 23:09:worried: 23:09I hope @dockimbel will give me some credits for finding that UPX fix ;-) 23:10Sharp turn -> maybe we can create a Kha/Kore binding for Red. :sweat: Oldes 23:15You don't have the fix yet.. just found what the problem is.. which is partially good too. BeardPower 23:15@Oldes Huh? I found and already tested the UPX fix :) 23:16See https://github.com/upx/upx/issues/69#issuecomment-325868625 Oldes 23:17Ok.. I have limited view on mobile. BeardPower 23:17 //useless DLL, ignore it if (!*(dlls[ic].lookupt)) { dllnum--; ic--; continue; } 23:17No problem. The gitter app sucks. Oldes 23:17It is not fix in Red. BeardPower 23:18No, but that was not asked in here: https://github.com/upx/upx/issues/168 23:19A fix in Red would be not creating empty names for the IT. Oldes 23:20I have no idea how you imagine the binding to k/k. Must sleep now. But I would personally experiment with the Sokol project mentioned above. BeardPower 23:21Well, trial and error :) See you later. 23:21I will look into it. Thanks for the link! Wednesday 21st March, 2018 dockimbel 02:23 @BeardPower > I hope @dockimbel will give me some credits for finding that UPX fix ;-) For that and the help with bad AVs, you'll get your weight in ~~gold~~ tokens. ;-) BeardPower 02:41:tada: :beers: 02:42The first moment I'm glad, that I have overweight ;-) toomasv 07:31POC of poor-man's 3d in pure Red: [![3d ortho cube](http://vooglaid.ee/red/d3-1.gif)](http://vooglaid.ee/red/d3-1.gif) rebolek 07:33nice, @toomasv 07:33is it 3d, or fake 3d? 9214 07:41@BeardPower [be careful with heavy gold](https://youtu.be/wpSAJOyLfU8?t=1800) ;) dockimbel 07:42[![image.png](https://files.gitter.im/red/red/gui-branch/OmFy/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/OmFy/image.png) 07:42@toomasv Next step. ;-) rebolek 07:43:) toomasv 07:45@rebolek True 3d calculations, but without perspective so far. rebolek 07:47ok, thanks toomasv 07:56@dockimbel What's that? rebolek 07:57Elite, 8-bit space simulator with whole galaxy. 07:58https://en.wikipedia.org/wiki/Elite_(video_game) toomasv 08:39@rebolek OK, thanks! BeardPower 10:51@9214 Thanks for the headsup! This is an oft forgotten fact. Ah, scrap it: more, MORE! :smile: lepinekong_twitter 16:31@rebolek nice https://gitter.im/red/red/gui-branch?at=575024f9a66904962ebbd39d how do you build that kind of component ? 9214 16:32@lepinekong_twitter https://gitlab.com/rebolek/red-styles I believe lepinekong_twitter 16:43@9214 thanks can't find the widget above but found other stuffs ;) As I can read styles are not yet ready. So I'll wait, meanwhile I'll call Powershell GUI from Red. dockimbel 17:19@lepinekong_twitter Not sure what you mean by "As I can read styles are not yet ready.". You can create your own widget right now if you want, you just have to figure out how you want to build it vs having a framework to help you. rebolek 17:22@lepinekong_twitter it's done in Draw. It's not hard, I think anyone can do it. lepinekong_twitter 17:26@dockimbel don't remember where I read it, I think it was an answer to some question but ok thanks. 17:29@rebolek creating component architecture is not trivial whole view frameworks are just made for that like ReactJs ;) Documentation is plenty in react, there's not much in Red yet, so getting started is hard. rebolek 17:36@lepinekong_twitter the only documentation you need is https://doc.red-lang.org/en/gui.html - everything is there. It's build from graphic primitives in Draw, like box, text and image. That's all. Add few actors to the mix, like on-down, on-up, on-over and on-key and that's basically it. on-time, if you want to be fancy and have animated widgets and on-<anything else> for improved support across different devices. 9214 17:36on-demand rebolek 17:36I really should write a guide for style writing, it's certainly no black magic. prapro 18:17@BeardPower Turns out there is already an opengl binding, so I'm probably just going to use that. But one could use the zeromq binding for red to talk to Red. 18:18Talk to Haxe, I mean BeardPower 18:47@prapro And a SDL2 one. I need to make some benchmarks. The recent version also supports Vulkan. prapro 18:56I noticed Francois made a glfw too. 20:09@BeardPower I got errors trying to run the sdl and glfw examples. :( Did you get any of them to work? lepinekong_twitter 20:15@rebolek yeah sure you can read Win32 API and you are supposed to get started. Come on why do you think there are myriads of tutorials in other languages or frameworks :smile: 20:19@rebolek I'm not talking about just learning to create a simple form or draw a basic square but creating a whole complex application. BeardPower 20:22@prapro Are you referring to the Red bindings or the examples in general? 20:23@lepinekong_twitter Because these other languages and frameworks are all complicated and bloat ;-) Red is self-explanatory :smile: prapro 20:24In the bindings themselves BeardPower 20:25@prapro I see. I did not test them yet, as I'm bench-marking the frameworks directly. Trying to find the "best" frameworks, which are also easy to bind. 20:26There are some candidates, which are written in C. Maybe SDL2 is still the fastest one, as it supports some new back-ends. 20:26Still waiting for SDL3 ;-) rebolek 21:18@lepinekong_twitter I don't use Windows at all, so I know nothing about Win32 API. That example was done on macOS. 21:18But works the same on Windows. Thursday 22nd March, 2018 lepinekong_twitter 07:34@BeardPower it's self-explanatory only for small samples, it's not when you have a complex hierarchical components architecture. I can understand the "complicated and bloated" frameworks because they are a huge ecosystem of real world tutorials, on red you have none so beyond the basic toy application, you have to find time to experiment by yourself. When you're a student or spare time that's ok but not for me. 07:38When you try to read some complex code with red you're lost in a labyrinth of chained calls I'm sorry but my brain is not good at following a maze without clues :smile: pekr 07:51You don't have to code in a stricly chained manner, so you can make your own code pretty much readable. Once it ticks with you, you start to like it :-) planetsizecpu 08:46[![test.gif](https://files.gitter.im/red/red/gui-branch/WK7C/thumb/test.gif)](https://files.gitter.im/red/red/gui-branch/WK7C/test.gif) 08:47These days I did some adjustments, lack of time, but I'm willing :) rebolek 08:48:+1: DideC 09:03Nice. Is this bidirectionnal (you can change the codee in the blue box bellow)? planetsizecpu 09:28Thx @Didec No, It's just intended to help coding forms & for me to learn, also there are some kown issues pending. toomasv 11:03@planetsizecpu :+1: BeardPower 11:22@lepinekong_twitter Its the same "until it clicks" as with the RPN calculators. E.g. from HP. They are superior to the infix notation. No brackets needed, as the RPN is stack based. Pure awesomeness. It needs a little time until you get used to it, but once you get It, you never want to go back. planetsizecpu 11:33@toomasv ;) 9214 11:57@lepinekong_twitter so why don't you sit down and learn something instead of waiting to be spoon-fed? dockimbel 12:23@planetsizecpu Great work! I have a few ideas since many years about how to design a minimal GUI builder. I wish I had the time to have fun coding cool apps/demos with Red as you guys do. ;-) rebolek 12:32 @9214 you are getting more and more friendlier. 9214 12:38yes, that's what I do, from time to time. rebolek 12:38:) BeardPower 12:39@rebolek [Do it!](https://www.youtube.com/watch?v=ddsZTFSfXaw) rebolek 12:40Anyway, here's simple guide for absolute beginners interested in writing their own styles http://red.qyz.cz/writing-style.html BeardPower 12:41:+1: rebolek 12:42read this, add 5-10 minutes and you have text-table 9214 12:43> add 5-10 minutes no one have THAT much time! rebolek 12:43ah, so that's why there's only one table style! BeardPower 12:44@9214 @rebolek Is always asking for too much. 9214 12:45Just a slight remark on @rebolek's tutorial - there's nothing in it that isn't covered in VID or View documentation. rebolek 12:46Right, the documentation is good enough already. BeardPower 12:46Another project for my list: implement a spreadsheet based on a DAC. dockimbel 12:46@9214 The current docs we have for View/VID are reference documentation, so they are not adequate for learning (at least not for most people). We need articles and tutorials until we get a proper "User Manual" (something along the lines of Rebol/Core Manual). rebolek 12:46@9214 But absolute beginners may have trouble picking the right parts from docs. BeardPower 12:47@9214 Yeah, but @rebolek 's blog-post has all information packed together. 9214 12:48I don't know, perhaps it's me who get used to experiment by himself with general documentation. It's fun, in explorative way. BeardPower 12:48Has anyone looked into the Nim book? Can we produce something like it? 12:50@rebolek I guess it's because you are willing to spend time on a topic instead of the spoon-feeding approach. rebolek 12:50@BeardPower what Nim book? BeardPower 12:51@rebolek https://book.picheta.me/ 12:52It's written by the author of the Nim language. rebolek 12:52Thanks, I take a look at it. BeardPower 12:52You're welcome. It's really good! planetsizecpu 13:18@dockimbel Thx, one improvement I have in mind is to set a reactor, instead all occurrences of call to Recode func, think on on-face-deep-change as trigger to call, but I'm not sure, could not find example about his behavior. I'll have to investigate deeper when find the time. 9214 14:24@rebolek your favorite typo > Similarily, we can change button'đ collor 14:25I think adding gifs and screenshots would be nice. rebolek 14:25@9214 Thanks, I have slow thumbs. 9214 14:26@rebolek that's not what the fastest mouse in all Mexico should say. rebolek 14:28@9214 fortunately speed is not only about thumbs 9214 14:32[![profile.jpg](https://files.gitter.im/red/red/gui-branch/HcrS/thumb/profile.jpg)](https://files.gitter.im/red/red/gui-branch/HcrS/profile.jpg) rebolek 14:34http://decko.ceskatelevize.cz/cms/porad-krysaci-data/images/gallery/11.jpg BeardPower 14:49@9214 What do you hear? 14:49@rebolek What do you see? 14:50Maybe the incoming of blog-post 4/4? :smile: rebolek 14:52@BeardPower I see that part 4 is certainly not the fastest blogpost in all Mexico 9214 14:53@BeardPower and I hear how bugs are squashed one after another in Red codebase, and think that this is slightly more important than next announcement. BeardPower 15:07@rebolek Maybe because it is so heavy ;-) rebolek 15:08Let's hope we will find out soon :) BeardPower 15:08@9214 Sure thing, just needing food for the telegram group :) 9214 15:10@BeardPower that's happening there? I left it a long time ago. BeardPower 15:12@9214 The usual stuff: Why is Red not doing marketing? Red is dropping to zero. Investing in it was a bad idea. Where are the news? Why is there nothing going on? And more trolling on top. 9214 15:13Kids these days. BeardPower 15:13In for the big and fast ICO buck. 15:14Many "fast buckers" are disappointed, because the Red token is down to $0.07 but they bought it for $0.30. 15:15But that's a talk for chit-chat :) dockimbel 15:54@BeardPower It's amazing to me how some people buying tokens have no grasp of the basics of crypto-currencies. For instance, there is no RED/USD ratio, only RED/ETH (one per exchange), so the price in USD is driven by ETH value, not RED value. But yeah, off-topic here. ;-) 9214 16:46red/rant, anyone? 16:50I think I already proposed that room - everyone speaks in pig Latin and expresses his/her degree of frustration by extending "ay" prefixes ;) lepinekong_twitter 16:58@9214 that's how you welcome people new to red ? 16:59@9214 you don't need to answer any more. 9214 16:59@lepinekong_twitter no, this is a tough love I give to those who are not willing to learn on their own just a little. lepinekong_twitter 17:00@9214 yeah yeah continue ... 9214 17:00teh drama rebolek 17:04Can we all just calm down a bit? Redbol community was always welcoming and non judgemental place, open for everyone willing to learn, no matter what path they choose. 9214 17:04@rebolek I'm okay being a bad seed, if that's how everyone see me :) rebolek 17:05@9214 actions have consequences, young padawan greggirwin 17:38@planetsizecpu Niiice! Between you, @mikeyaunish, and others working on IDE experiments, we're going to have a lot to draw on (no pun intended @toomasv ;^) in the future. In R2 there was a nubs style that we sometimes used to indicate selection and, I think, even doing resizing of faces. Basically, do something like: view [ size 800x600 at 10x10 btn: button 100x50 "Test" at 10x10 nubber: base 0.0.0.250 100x50 loose draw [ line-width 2 pen navy box 1x1 98x48 fill-pen navy box 1x1 8x8 box 46x1 53x8 box 90x1 98x8 box 1x21 8x28 ; more handles... ] on-drag [btn/offset: nubber/offset] ] And when a face on your layout is selected, put the nubber face over it and attach it. Then add handling for the nubs to do resizing. Need to experiment with how loose works there. My old image resizing examples could source some bits perhaps. Other ways to do it as well, of course, like making each nub a separate face that is loose. 17:39:point_up: [March 22, 2018 5:22 AM](https://gitter.im/red/red/gui-branch?at=5ab391e9bb1018b37a11f3e0) @BeardPower, my Dad had an HP-65, with the mag strip reader, and the first computer we had at our house was an HP-85. The original "all in once PC". :^) 17:42:point_up: [March 22, 2018 6:40 AM](https://gitter.im/red/red/gui-branch?at=5ab3a44aa60157d62f1786e1) @rebolek wonderful! I should have read that before posting my nubber code. :^\ 17:56> on red you have none so beyond the basic toy application, you have to find time to experiment by yourself. When you're a student or spare time that's ok but not for me. @lepinekong_twitter, maybe that's the basic issue. Right now Red is Alpha and you *have to* make time to experiment and learn on your own. We hope people will want to do that. It's the best way to learn. > that's how you welcome people new to red ? You've received a lot of help here, which I believe you've appreciated. We want to help everyone we can, but we're all human, with limited time as well. At this point, you're not entirely new to Red, so keep toddling along and know we'll sometimes let you fall before helping you up. :^) prapro 18:11"The three chief virtues of a programmer are: Laziness, Impatience, and Hubris." --Larry Wall BeardPower 18:56@greggirwin Cool. I have a HP48GX inclusive a matrix printer 😎🤓 19:16@dockimbel So true. They just read blockchain and think everything is some cryptocurrency like bitcoin; getting them rich instantly by investing some bucks. Friday 23th March, 2018 mikeyaunish 05:05@planetsizecpu I like what you are doing with Red Forms. Interesting solution to the Font issue. planetsizecpu 07:13@greggirwin Interesting nubs, I know what you meant but not fully follow you, to apply the handles to resize nubber itself would you have the same problem as for resize the main btnwidget? Seems a complex task to me. @mikeyaunish Me too of yours. :) Sorry what Font issue? 09:22@toomasv Nice demos, sure pinball is on your bag :) DideC 09:56@planetsizecpu Basicaly, a global event handler intercept the click event and place the nubber face on top of it and just stored in it's /extra the clicked face. Then, this nubber face has all the actors to handle move and resize, and it just propagate the /offest and /size to the face that is "selected" under . planetsizecpu 10:48@DideC Thx, I understand this behavior, what I don't see is how to activate on-resize event in the nubber. I have modifyed @greggirwin example, as ... on-resize [btn/size: nubber/size] but It does not activate resizing, in fact I have not seen working resizing event at widget level, but at window level it is activated on my script to handle main window resizing (thx to @rebolek), this weekend they gave bad weather, I think will have time to probe. ;) DideC 11:19@planetsizecpu on-resize will have a meaning at face level when a resizing model will be implemented. Actually I suppose it is not trigerred. In the nubber face, you have to put in on-down, on-up, on-over actors the code to manage the resizing of the face itself and its currently attached face. planetsizecpu 11:46@DideC Thx, I though on-resize was already built-in, so better wait to introduce such event in my script. So I will have time to play with other aspects. dockimbel 13:15resize is only triggered for window faces, it's up to the user for now, to implement a dispatching handler for it. Though, using foreach-face (hint hint), it can be done in a one-liner. ;-) IIRC, @greggirwin had some demo code for that. planetsizecpu 13:58ah, so I have the beginning of the skein to stretch the thread, will take a look then, thx :) mikeyaunish 14:10@planetsizecpu I like how you've decided to make the modifications of the font values easy to change. planetsizecpu 14:12@mikeyaunish just as first approach I think ;) greggirwin 16:42We do need to figure out the best eventing approach. In my image resize gists, it's basic mouse tracking, as @DideC says. In the GUI dropper examples I did, it's on-drop, but we can also catch things other ways. I have some foreach-face tests as well. Here's a small one: do-it: does [ foreach-face win [ switch face/type [ button [face/text: rejoin ["I'm a button at " face/offset]] field [face/text: rejoin ["I'm a field of style: " face/options/style]] ] ] ] view win: layout [ style button: button 150 style fld-150: field 150 button button button "Click Me!" [do-it] return fld-150 fld-150 fld-150 ] 16:43What you could do, then, is find the nubber face and set the selected face's facets based on that. Saturday 24th March, 2018 planetsizecpu 09:08@greggirwin THX, and Just aquestion: considering that the on-resize is already activated for main window, on-drop & on-menu activated for the widgets, do not you think it will be a harsh punishment for the runtime, or will not be retained the handling of the mouse? I'm unsure, I thing on do some test mockup to see how goes, maybe starting from your nubber example. There are other questions I have in mind, as for example I have an issue after run the code with do, then the widgets would not belong to the working design panel but to the new window, and no longer we can get their attributes from his old parent. I think to run it in a new red instance, for example. Other question is the source code, it accept keyboard entry, but after every update, the entered data vanish due to recoding, so I would like to change editor area for a **static** section of code in a base widget only accesable by recode func, not by the user, and let's say in light gray color. Then a **dynamic** one in a area widget like now, for user code entry. So static code section may inclue a call to dynamic one, which would became a does block. Apart I have reserved the right area for 0.7 stuff, so much work ahead IMHO :smile: endo64 21:04@greggirwin What do you think about adding a /deep refinement to foreach-face? So we can use it for first level faces only without going inside panel or other containers. BeardPower 21:06@planetsizecpu So the faces are not inside a scene graph? E.g. when moving the parent, every child moves with it? Sunday 25th March, 2018 planetsizecpu 08:39@BeardPower the faces are inside a panel face, but the panel itself is no loose so does not move, it is locked at the side of the toolboxes. It seems an interesting option that I had not thought. The fact is after run the code you can still move the widgets, but does not get updated the source code, they belong to another parent window. As a workaround I thougth run them on a separate Red instance to keep the stuff arranged, next week would seek time to test things . 08:59[![test1.gif](https://files.gitter.im/red/red/gui-branch/vATI/thumb/test1.gif)](https://files.gitter.im/red/red/gui-branch/vATI/test1.gif) toomasv 17:22@planetsizecpu Nice-looking, even if I don't quite understand what you are doing there ;) 18:32Preview of my try on R(GUI)D: [![RGUID](http://vooglaid.ee/red/GUI1.gif)](http://vooglaid.ee/red/GUI1.gif) 9214 18:35@toomasv [oh my...](https://www.youtube.com/watch?v=U6MlaIe1ljs) mikeyaunish 19:11@toomasv very nice work there. I like your attention to the layout details. I am starting to be convinced that lots of different ways to do the same thing may be the way to reveal the full strength of Red. Removing complexity while increasing accessibility. toomasv 19:21Thanks! There certainly are many ways to achive same or similar results. This allows different, more personal styles of coding. With the above app there is still long way to go. Monday 26th March, 2018 planetsizecpu 06:43@toomasv ah great, your always creative mind... :smile: toomasv 06:43:) Phryxe 07:45@toomasv You never stop to impress :clap: toomasv 07:57@Phryxe :wrench: BeardPower 10:01@toomasv I did not know, that your Drawing pad is also a Markdown editor ;-) 10:01:+1: 10:02I think it would be "easy" to create a MD DSL, which your tool could render :) toomasv 10:04@BeardPower No Markdown, it became VID editor in addition to Draw editor :) BeardPower 10:56@toomasv :) It could be used as a MD preview and more. I have some nice ideas for some GUI console plugins :) toomasv 10:57@BeardPower Share! 9214 10:57@BeardPower be careful sharing your project ideas with @toomasv. toomasv 10:58 :smiling_imp: BeardPower 10:58@toomasv Yeah, I think he hired a truckload of code monkeys.... 10:59Toomachine :smile: 9214 11:01Moonkey loord :monkey: lepinekong_twitter 14:55I took the code I found and just put it in a functin then it doesn't work: t cannot be found, why ? test: function[][ view/no-wait [ title "test" t: text "Stop Me! " on-time [move t/text tail t/text] button "Start" [t/rate: 10] button "Stop" [ attempt [ t/rate: none t/text: "Stop Me!" ] ] ] ] rebolek 14:57Because function will make all set-word!s local. dockimbel 15:17@lepinekong_twitter It would have worked if you had used view instead of view/no-wait. BTW, why are you using /no-wait refinement there? rebolek 15:18> code I found and just put it in a function 15:19I guess that's why :) dockimbel 15:25@rebolek That would explain the strange presence of attempt applied on code that should never error out. rebolek 15:26@dockimbel now I wonder where's the code from lepinekong_twitter 16:05@dockimbel I use /no-wait so as to continue to work in red console : I wanted to launch a count-down from console which would alert me in 25 minutes (pomodoro technique) while I continue to do stuffs in console. dockimbel 17:28@lepinekong_twitter In such case, you can't rely on words locally bound to the function context (like t:) if you don't stay in the function. You should rather use test: function [/extern t] as the function definition then. Oldes 17:34@dockimbel should not be wait working if used in this code? Now it crashes. t: none test: does[ view/no-wait [ title "test" t: text "Stop Me! " on-time [move t/text tail t/text] button "Start" [t/rate: 10] button "Stop" [ t/rate: none t/text: "Stop Me!" ] ] ] test forever [ print t/text loop 5 [do-events/no-wait] ; wait 10 ;<- this will crash if used ] 17:36ok... it somehow works when used with time value... like wait 0:0:01, but still behaves strange when used from gui console. 17:37Probably related to not yet present ports, right? greggirwin 18:00@planetsizecpu @toomasv may tokens rain down upon you. Wow. toomasv 18:01@greggirwin :sweat_drops: :) 18:37[Study of ellipse](https://gist.github.com/toomasv/9c7f400a36fecec9e9b2faf567035ea5): [![ellipse1](http://vooglaid.ee/red/ellipse1.gif)](http://vooglaid.ee/red/ellipse1.gif) meijeru 18:59Fantastic! 9214 19:01@toomasv don't forget about reddit ;) toomasv 19:02Oh-ye! :) BeardPower 19:32@toomasv You should sell that to some school :) 9214 19:33Oh! Oh! Cryptoo-tookens? BeardPower 19:34Toomastudies :D 19:46@toomasv I think I have something interesting for you. Check out the drawing mechanisms ;-) [Mechanisms](https://www.youtube.com/watch?v=21ULLBnoWu8&list=PLrIPuZH5a-80vHE76OqxU1T0HiDsO23jl) toomasv 19:47@BeardPower Wow! 9214 19:48@toomasv https://en.wikipedia.org/wiki/Spirograph toomasv 19:49Wohohaw BeardPower 19:51These mechanisms blew my mind... 19:52@9214 Spirograph! I would have killed for that one ;-) 19:53https://en.wikipedia.org/wiki/Etch_A_Sketch :smile: 9214 19:55I had [these](https://en.wikipedia.org/wiki/Magna_Doodle) only 19:55Sweet times :older_man: BeardPower 19:56Yeah, these were also great. There's a lot 2D stuff, which can be simulated :D -> https://kidotoys.com/products/free_play_magnatab 9214 19:57https://en.wikipedia.org/wiki/Neodymium_magnet_toys BeardPower 19:58:+1: 19:59So Red will also revolutionize learning and teaching :smile: 20:00Every kid will have a Toomastudies-Kit ;-) 20:00Powered by the Mill, of course. 9214 20:04Sigh. BeardPower 20:08:smile: toomasv 20:15Spirograph without plotting: [![spirograph1](http://vooglaid.ee/red/spirograph1.gif)](http://vooglaid.ee/red/spirograph1.gif) BeardPower 20:16:+1: Now add the different Spirograph tools ;-) toomasv 20:17Tomorrow! May be :) GN BeardPower 20:17[Whaaat?!](https://www.youtube.com/watch?v=v0245xP_HVk) 20:18Good night :) greggirwin 20:33Very cool stuff all. Is @maximvl in this room? Maybe he can pick some things up to post to reddit, saving @toomav's time for more fun. 20:34I loved both spirograph and etch-a-sketch as a kid. Maybe why I like Logo. :^) 20:36Nenad and I chatted about some fun ideas in SF, with Carl too. Imagine explaining antenna design, and having an actual armature with sensors that show the antenna's characteristics as you play with the physical model. lepinekong_twitter 20:53@dockimbel thanks it works though I don't understand what /extern does exactly :smile: https://i.snag.gy/uFYdr6.jpg Pomodoro: function[/extern t b1 b2 start-time diff rest minutes seconds duration][ View/no-wait [ title "Pomodoro" t: text "25:00" on-time [ diff: difference now start-time rest: 0:25 - diff minutes: rest/minute seconds: round rest/second t/text: rejoin [minutes ":" seconds] if (minutes < 0) [ print "alarm" ] ] b1: button "start" [ t/rate: 10 start-time: now ] b2: button "pause" [ either (b2/text = "pause") [ t/rate: none b2/text: "continue" ][ t/rate: 10 b2/text: "pause" ] ] ] ] BeardPower 21:06@greggirwin >I loved both spirograph and etch-a-sketch as a kid. Maybe why I like Logo. :^) I still do ;-) Lego or Logo? :D 21:08>Nenad and I chatted about some fun ideas in SF, with Carl too. Imagine explaining antenna design, and having an actual armature with sensors that show the antenna's characteristics as you play with the physical model. Like some WiFi-Signal-Strengh-Visualizer? :smile: :+1: 9214 21:18@lepinekong_twitter I don't see the point of using function since you exposed everything in global context. endo64 21:18> I don't understand what /extern does exactly damn, I'm too slow again :'( greggirwin 21:23@BeardPower Logo, the language, since a lot of turtle examples are like spirograph. Not just strength visualizer, but frequency and directionality behavior. BeardPower 21:27@greggirwin Ah, good old turtle graphics :) 9214 21:28hen graphics 21:29on Mill 21:30we need to find investors, quick, before @toomasv read it! BeardPower 21:31@9214 [WE](https://www.youtube.com/watch?v=GkgganUgZEk&t=1) 21:32@greggirwin So it would produce something like this? https://www.e-education.psu.edu/geog862/sites/www.e-education.psu.edu.geog862/files/images/Lesson04/Patch_antenna_pattern.gif 21:33In real-time, of course. 21:33@9214 Maybe we should launch a "Purple Hen ICO" :D 21:34But maybe it would be TooMassive ;-) Tuesday 27th March, 2018 greggirwin 00:40@BeardPower, yeah, maybe. I'm not an antenna guy, but Carl does HAM radio, so he could say. BeardPower 00:50I see. This is WiFi :) 00:50Roger. dockimbel 03:44@lepinekong_twitter Nice work on your Pomodoro script! Good use-case of Red to quickly build a small GUI tool. I made an alternative version to see how it could be reduced and properly wrapped into a context: https://gist.github.com/dockimbel/aa1d5cec15f1eb4b11ece61dcebba22c I think the code could be simplified further, making the code logic in pause button more explicit while keeping the code short. I also think we need a smart way to wrap set-words used in VID in an object context. 03:56@Oldes > @dockimbel should not be wait working if used in this code? Now it crashes. Cannot reproduce any crash on Win7, it works fine here. 04:04@BeardPower > @9214 Spirograph! I would have killed for that one ;-) Happy spirograph user here in the 70's, I know the feeling. ;-) rebolek 06:32@qtxie this seems like a bug to me: 06:32 view [style x: base red 100x100 all-over on-down [print face/offset offset: 50 print face/offset] x] 06:32when you click on the red box, it jumps and face/offset is changed to 50. However I was setting offset, not face/offset. dockimbel 06:50@rebolek Bug yes, please log it in a ticket. rebolek 06:52@dockimbel Will do, thanks for confirmation. 07:07https://github.com/red/red/issues/3289 toomasv 07:22Plotting spirograph: [![Spirograph2](http://vooglaid.ee/red/spirograph2.gif)](http://vooglaid.ee/red/spirograph2.gif) rebolek 07:29:+1: 07:30Would be nice to convert it into sound, it's 2OP FM. toomasv 07:34@rebolek What's that? I have no clue. rebolek 07:362 operator frequency modulation synthesis. Operator is basically sine wave oscillator and you modify frequency of one oscillator with frequency of second. toomasv 07:51Thanks! rebolek 07:562ops are simplest variant, used in YM3812-based sound cards (like AdLib or old Soundblasters), even the most basic FM synths have at least 4, usually 6 or 8 operators. dockimbel 08:15@toomasv Great! Do you plot on an image buffer? toomasv 08:15@dockimbel Thanks! Yes Oldes 08:26@dockimbel right... you are right it not crashes... it just enter into not responding state. At least when used in gui console. Looks like the wait is blocking everything. Event if I just open gui console and enter wait 10, I'm not able to move the window. On Windows 10. 9214 08:27@Oldes https://github.com/red/red/issues/2627 Oldes 08:27It is not just output... the window is frozen completely. 9214 08:28..for ten seconds? Oldes 08:28Yes. 9214 08:28It's the same issue. Oldes 08:30No.. the bug is about console output... but it is not just output. If I do wait 10:0, I wand to be able to move the window, minimize window etc. 08:32Strange is, that when I do it... I can move the window after some time.. still when I want to close the window which is in wait state, it shows system dialog that app is not responding. Wait should always respond to system events. 08:34But I believe, wait will be rewritten with ports implementation. Now it just calls Sleep on Windows, which is not designed for long time waiting. dockimbel 08:44@Oldes Indeed, the proper wait implementation will comme with full I/O support. planetsizecpu 10:58I did some enhancements on weekend related to code entered by user 10:59[![test5.gif](https://files.gitter.im/red/red/gui-branch/KXyG/thumb/test5.gif)](https://files.gitter.im/red/red/gui-branch/KXyG/test5.gif) BeardPower 11:01@toomasv [You clearly missed to watch this](https://www.youtube.com/watch?v=spUNpyF58BY) toomasv 11:02@BeardPower Indeed! planetsizecpu 11:03@toomasv The best, you, no other! ;) BeardPower 11:03I have an excuse: :older_man: 11:03;-) toomasv 11:04@planetsizecpu Very nice work! greggirwin 16:33@toomasv and @planetsizecpu, more great stuff! I love watching the updates. We're going to set up a wiki page where we can pull links to these kinds of things, gifs included, for posting on other Red channels, and so we don't lose them over time. People can, of course, choose to mark their posts or content so they aren't pushed if not wanted, but we're also working on how to reward people with tokens for this kind of stuff. 16:33@BeardPower, just the intro to the video is cool! Thanks! toomasv 16:34@greggirwin Thanks! Great idea! BeardPower 16:52@greggirwin :) Awesome! greggirwin 16:56https://github.com/red/red/wiki/Links-and-things-to-remember-and-share Let's experiment with formatting and see how it works. planetsizecpu 17:24@greggirwin good to share, thx toomasv 17:35@greggirwin Can I put a [link to code](https://gist.github.com/toomasv/b8883f41543c4b54142b4a62a5386797) there? 9214 17:36@toomasv of course, if you don't mind it to be PRed and cross-posted. BeardPower 17:37Don't /. me, bro! ;-) 9214 17:38@BeardPower wat BeardPower 17:38@9214 https://en.wikipedia.org/wiki/Slashdot_effect 9214 17:39@BeardPower we call it Habraeffect ;) toomasv 17:39Let's see, if there'll be effect BeardPower 17:40Didn't know that it was that international! :) It was quite frequent 20 years ago: I got slashdotted! :smile: 9214 17:41I'm full of surprises. BeardPower 17:41You have Cloudflare and co. these days. ne1uno 17:42aws BeardPower 17:42Exactly. ne1uno 17:44reddit and stack* probably gets more traffic now but scattered in various subs BeardPower 17:45Is there someone responsible for "google analytics"? 17:46In The Red team, that is. 9214 17:46Since Google contains double "o", I would suspect... :suspect: 17:47... on the other hand, it also contains 2 "G"s. toomasv 17:47 :hamster: 9214 17:47so it's either @toomasv or @greggirwin BeardPower 17:47Ah, finally that secret pattern got revealed! toomasv 17:48:question: BeardPower 17:50Double letters in Nicknames are part of the "workload of 10 people" conspiracy ;-) greggirwin 17:52For the Googmassv win! We'll look at analytics with the site refresh. lepinekong_twitter 21:35@dockimbel thanks for this version. 21:37@9214 I didn't want to expose everything in global context, it was to be able to use /no-wait for view. 9214 21:38@lepinekong_twitter /no-wait has nothing to do with it. lepinekong_twitter 21:39@9214 it didn't work otherwise since t is not recognized without using /extern. 9214 21:40@lepinekong_twitter whatever, glad it works now. :) lepinekong_twitter 21:41@9214 well it works but I don't really understand why :smile: 9214 21:43@lepinekong_twitter because function "captures" t: (and all other set-word!s) and binds it to its context, because of that your VID description stops to work. What you did with /extern is said "please don't capture this words". You could do the same with just does [...], which, being a wrapper on func, skips all the capturing part. lepinekong_twitter 22:27@9214 ah ok thanks 22:32I compiled the pomodoro code successfully under windows 10 with VSCode but when clicking on the exe it just flashes I can't see any window like when I run it under console ? Red [ Purpose: "Implements a Pomodoro timer" Note: "Original code from https://gitter.im/red/red/gui-branch?at=5ab95dae2b9dfdbc3a25636a" Needs: 'View ] Pomodoro: does [ context [ t: diff: b1: b2: end: none view/no-wait [ title "Pomodoro" t: text "25:00" on-time [ diff: difference end now t/text: rejoin [diff/minute ":" pad/left/with form to-integer diff/second 2 #"0"] if negative? diff/minute [print "alarm"] ] b1: button "start" [ t/rate: 10 end: now + 0:25 ] b2: button "pause" [ end: either t/rate [difference end now][end + now] b2/text: pick ["continue" "pause"] to-logic t/rate t/rate: all [none? t/rate 10] ] ] ] ] pomodoro 9214 22:33@lepinekong_twitter how about removing /no-wait? lepinekong_twitter 22:38@9214 yeah that's it thanks. ne1uno 22:44you can't have output to console when compiled? 22:45ever? Wednesday 28th March, 2018 greggirwin 00:11@qtxie ? I could have sworn that was not the case anymore, but I could very well be wrong. PeterWAWood 00:54Whether a compiled Red program can output to the "console" will depend on which target. For example, when you compile a Red app for darwin, any output will appear in the terminal from which it was launched. If you build an macOS app, the output is not visible as there is no (visible) sysout stream. Thursday 29th March, 2018 meijeru 15:56In the new console, there is a new(?) event ime. I don't think that has already been documented? What is imestanding for -- is it an abbreviation? 9214 15:57@meijeru Input-something-something IIRC. 15:57Input Method Editor ? meijeru 15:58I was hoping to get more than a guess... 9214 15:58@meijeru I recall reporting it (thought it was a typo, time, say), and @rebolek answered that it's a TBD event. 15:59also https://gitter.im/red/bugs?at=591a63aa83cb5db07335abf4 rebolek 16:01@meijeru input method editor meijeru 16:01What does that do, and how does one generate such an event? rebolek 16:01It's basically on screen keyboard 16:03@meijeru I am on phone now, so can't post a link, but take a look at wikipedia, it's nicely explained there meijeru 16:04Thanks gentlemen, I saw the Wikipedia link. Still I suppose that the actual facility has not been implemented yet... 16:05Nor has the View documentation been updated to the level of the current console... rebolek 16:05I believe it will be implemented in Android release, where it makes most sense. dockimbel 17:17@qtxie can explain the ime event in details. We use it already to properly support different IME for Asian/Arabic countries mostly. qtxie 23:01Yes. ime event is for Input Method Editor. The event is only for macOS currently as Windows already handle it for us. When you type using IME, you type a sentence usually. The purpose of this event is to receive the text you type. The text is in event/picked. 23:01[![ime.png](https://files.gitter.im/red/red/gui-branch/odIz/thumb/ime.png)](https://files.gitter.im/red/red/gui-branch/odIz/ime.png) BeardPower 23:041 2 3 4 5 rose. What does that mean? :) qtxie 23:06As the screenshot above, after I press Enter key to finish the typing, ime event will be triggered on macOS. event/picked will contains a string "我喜欢你". 23:07@BeardPower You can use the number to select which sentence you want. BeardPower 23:07Ah! Got it :+1: 23:09@qtxie Which debugger are you using? qtxie 23:31@BeardPower You mean binary code debugger? I use ida pro. BeardPower 23:34@qtxie Yes. Nice. I'm using radare2 :) qtxie 23:36Does it has a GUI? I think I tried radare2 long time ago, it's a command line tool. BeardPower 23:37Yes, they created one in Qt: https://github.com/radareorg/cutter 23:38I'm looking for some "best practices" for Red / R/S debugging :) 9214 23:39@BeardPower everyone just ask me and they're fine with it :) BeardPower 23:40@9214 Yeah, I totally forgot your secondary job as "debugger" ;-) 9214 23:41Yeah, I even have a version number! ;) qtxie 23:41Looks nice. I'll try it. :-) BeardPower 23:41@9214 Still waiting for a new version :smile: You seem to be very stable ;-) 23:41@qtxie Cool. Please let me know what you think of it :+1: 23:42I mainly used the console UI, as it offers all the features. Some seem to be missing in the GUI. Saturday 31st March, 2018 toomasv 07:44Playing with do-actor: view [ a: base on-down [face/text: form event/offset] b: base on-down [do-actor a event 'down] with [ pane: layout/only [ base orange 6x6 loose on-drag [ a/text: form face/offset ] on-down ['done] on-up ['done] ] ] ] [![do-actor](http://vooglaid.ee/red/do-actor.gif)](http://vooglaid.ee/red/do-actor.gif) 10:09First steps into visual editing: [![visual editing](http://vooglaid.ee/red/edit1.gif)](http://vooglaid.ee/red/edit1.gif) pekr 10:12Super! planetsizecpu 10:14@toomasv :+1: dockimbel 10:17https://github.com/red/red/wiki/Rich-Text-support 10:19(Constructive) feedback would be appreciated. nedzadarek 10:34@dockimbel Very interesting! The RTD looks like BBCode.... so 2 question: 1) Would it be possible to support other BBCode elements, like urls: https://en.wikipedia.org? It would simplify creating windows like "about" (like in the Red gui: File > About). 2) Can it be extensible (user can implement his/her own style)? toomasv 10:38@dockimbel [nested blocks in style seem to be open, i.e. w/o closing brackets. @pekr @planetsizecpu Thanks! planetsizecpu 10:51@dockimbel useful RTD, It is already built-in in 0.6.3? I would like to test in my scripts, so I may gave some feedback i it's the case. 9214 11:05@dockimbel slight off-topic: any chance that any-single pseudo keyword will become a real one? Not so recently I faced a need to parse a set of elements, where each element can occur only once, but order of elements is not defined. Usual Parse rules aren't well suited for such task. toomasv 11:14@dockimbel Shouldn't rtd: some [style | string!] on last line of grammar specification be rtd: [some [style | string!]]? 11:27With these two corrections (+ any-single -> some) the grammar works: >> parse [<i> <b> "Hello" </b> <font> 24 red " Red " </font> blue "World!" </i>] rtd == true >> parse [i b "Hello" /b font 24 red " Red " /font blue "World!" /i] rtd == true >> parse [i [b ["Hello"] red font 24 [" Red "] blue "World!"]] rtd == true >> parse [i/b/u/red ["Hello" font 32 " Red " /font blue "World!"]] rtd == true dockimbel 11:51@toomasv Thanks, fixed now. Glad that the rules are already working, I didn't try to run them at all. ;-) 11:55@9214 > @dockimbel slight off-topic: any chance that any-single pseudo keyword will become a real one? Not so recently I faced a need to parse a set of elements, where each element can occur only once, but order of elements is not defined. Usual Parse rules aren't well suited for such task. Yes, that's a feature I want to add since many years, though, it needs design work to define its syntax/semantics accurately. 12:04@planetsizecpu > @dockimbel useful RTD, It is already built-in in 0.6.3? I would like to test in my scripts, so I may gave some feedback i it's the case. There is a rich-text support in current master branch, but it's using an old [API](https://github.com/qtxie/red/wiki/Text-box!-Usage). 12:11@nedzadarek > 1) Would it be possible to support other BBCode elements, like urls: https://en.wikipedia.org? It would simplify creating windows like "about" (like in the Red gui: File > About). No, this is only for rich-text support, not HTML support. Though, you should be able to implement such feature on top of that of it pretty easily. > 2) Can it be extensible (user can implement his/her own style)? No, we rely on the hardware-accelerated OS API for the rendering, so you can't extend it. That said, you can easily build an abstraction layer on top of it to implement whatever features you want. 12:13In theory, using the "multi-box" mode, you could write a decent HTML renderer in Red. It would be interesting to see how far we can go there. ;-) rebolek 12:14@dockimbel will there be offset-to-caret and caret-to-offset functions? dockimbel 12:15@rebolek It's already there, see offset? and index? functions in the doc. rebolek 12:17Ah, cool. Will they support RTF? dockimbel 12:17@rebolek RTF? rebolek 12:17rich text dockimbel 12:17There are part of the rich-text object, see the doc. toomasv 12:17@dockimbel Wrapping and aligning are provided by para facet? dockimbel 12:21@toomasv Not supported yet, only spacing and tabbing. I think we can add more higher-level features in another iteration over that rich-text component, though, as we need this one ready for 0.6.4, we'll stick with the current features. toomasv 12:24I see. Thanks! nedzadarek 12:26@dockimbel "abstraction layer" sounds good. I'll try it when Rich-text is fully implemented. Thank you. dockimbel 12:28@toomasv Quick thought: it should be possible to extend the RTD dialect to support center and right alignment by generating a multi-box face (one text-box per line, then calculating the position depending on the alignement). Should not be that big of a work, though we have already too many features to fit in the time left for 0.6.4. toomasv 12:30@dockimbel No need to force it. Without wrapping the line-count? will return >1 in case of hard linebreaks? Or are these different paragraphs? dockimbel 12:37@toomasv Actually, we might be able to support several paragraphs with one text-box... @qtxie is looking into it. toomasv 13:25Great! Thanks. rgchris 13:49@dockimbel Does a rich text block have to be well-formed or will it resolve incongrous instructions, e.g. per the usual HTML examples: bold "Foo" italic "Bar" /bold "Baz" /italic or /bold "Bold wasn't open" dockimbel 14:16@rgchris Well-formed input only. Though, you can easily provide a mal-formed to well-formed parser if needed. toomasv 15:59One more step: multi-point editing [![multi-point editing](http://vooglaid.ee/red/edit2.gif)](http://vooglaid.ee/red/edit2.gif) BeardPower 16:12You are getting closer to Affinity Designer 👍🏻 toomasv 16:12:) ne1uno 16:20Dr Geo too nedzadarek 19:27@toomasv your Spirograph was great. I have tried to draw many "similar" things (not in the Red). Those "figures" are beautiful! It reminds me of this wonderful project http://nathanfriend.io/inspirograph/ If someone would implement all of this: https://en.wikipedia.org/wiki/Category:Curves I would just waste so many hours playing in it :+1: toomasv 22:45@nedzadarek Thanks for these links! Lot to learn now :) Sunday 1st April, 2018 BeardPower 02:15@toomasv http://wolframalpha.com/ in Red 😲 greggirwin 04:39More great stuff @toomasv! nedzadarek 10:30@BeardPower ok, stop it... we don't want Wolfram's team to sue him. 9214 10:35they won't, Wolfram & Hart will 10:35https://en.m.wikipedia.org/wiki/Wolfram_%26_Hart BeardPower 10:35@nedzadarek Ok, I have a long list of other stuff to ~~~copy~~~ steal. 😎 10:37@9214 No one dares to sue the Purple Hen and RDM! 9214 10:40@BeardPower wrong room, sir. nedzadarek 10:53@9214 At first I thought "Wolfram was language designers (or they used name in honour of someone named Wolfram) AND lawyer... that's too much"... then I read the wiki. @BeardPower it's better to create (give) something ;) planetsizecpu 11:09This sunday I did play a bit with my otp script while wait for android gui :) BeardPower 11:10@9214 Posting in the wrong room: my Kryptonite! @nedzadarek Absolutely. Maker fee: 0% Taker fee 1% ;-) planetsizecpu 11:10[![otptest.gif](https://files.gitter.im/red/red/gui-branch/InlC/thumb/otptest.gif)](https://files.gitter.im/red/red/gui-branch/InlC/otptest.gif) BeardPower 11:14@planetsizecpu Is this the "Red Matrix"? :) planetsizecpu 11:16@BeardPower haha, no, have you seen The Fourth Protocol, from John Mckenzie? I was inspired by ;) I also have the novel from Frederic Forsyth BeardPower 11:16@planetsizecpu Not yet ;-) 11:17But Sneakers :) toomasv 11:29@BeardPower @9214 @nedzadarek Thanks for warning! I've made Drawing pad modular. Besides Draw editor which comes as appetizer, there are VID editor (initial version demod earlier), 3D-pad (have to optimize my matrix, but basically working), graph editor - let's you investigate (browse, collapse, zoom) and edit e.g. View's face-tree, and of course a geometry module to study all kinds of curves. Working also on image module. Modules may be purchased for (lots of) tokens or bucks. So, have to be careful with W&H! :) BeardPower 11:33@toomasv What is W&H again? :) toomasv 11:34@BeardPower Codename for lawyers? BeardPower 11:36Ah, got it. :) 11:37Well, the EU is safe regarding patent trolls for now ;-) toomasv 11:41@planetsizecpu Fascinating! :+1: BeardPower 11:45@planetsizecpu Diceware incoming? ;-) nedzadarek 13:23@BeardPower > @nedzadarek Absolutely. Maker fee: 0% Taker fee 1% ;-) What does it mean? :| 9214 13:27that market is hot and you should invest BeardPower 13:39@nedzadarek It's some buzzwords in crypto trading: If you are taking volume away, you have to pay a fee, but if you are creating volume, you have to pay no fee. 13:40It's about giving and taking. Those who only take, have to pay. Those who give, don't. 13:40@9214 Pump and dump. nedzadarek 13:50@BeardPower nice credo! BeardPower 13:55:+1: planetsizecpu 14:55@toomasv Thx, your draw pad too. @BeardPower, I have been looking for some time lowercase generator, some times found pronounceable words that had 0 hits on google, so new words? intriging to me, may be a new word generator :) BeardPower 15:07Invent a new language ;-) 15:07Redtongue. toomasv 19:12Seems my April Fool's setup was a total failure, as it has usually been :flushed: . Either everyone took it in with a silent disapproval or, what is much more probable, everybody saw stright through the scam. gltewalt 19:13Maybe they think, "Yeah, Toomas should be able to make a little money from his genius"? toomasv 19:15:neckbeard: BeardPower 21:06:moneybag: greggirwin 22:18@toomasv, what?!?! I already sent you all my tokens in advance for those tools! 22:18:point_up: [April 1, 2018 5:10 AM](https://gitter.im/red/red/gui-branch?at=5ac0be4292f5d6205780e609) @planetsizecpu That's fantastic! Monday 2nd April, 2018 toomasv 05:45@greggirwin Aah, lucky me, finally I caught one fat April Fool and got LOT of tokens. Now I start to think, may be it’s not so bad idea after all! 20:15Limited [visual editing version](https://github.com/toomasv/drawing/blob/master/drawing.red) (editing points only, no transformations (e.g. arc), no sizes (e.g. ellipse, circle)) [![visual editing 3](http://vooglaid.ee/red/edit3.gif)](http://vooglaid.ee/red/edit3.gif) Added box-selection and editing on grid. Other things may have been broken and certainly many bugs still there HighTechForms 20:23@toomasv Are you doing that with Red? 20:23Oh, nevermind. I see the icon up there. 20:33Is it possible to set percentage widths of controls? I want to duplicate our company's current customer-facing UI, and it looks like this: 20:33[![fm_ui.png](https://files.gitter.im/red/red/gui-branch/YYog/thumb/fm_ui.png)](https://files.gitter.im/red/red/gui-branch/YYog/fm_ui.png) 20:37I can't do the tree view list with Red (not available?), but I can work around that. It would be nice (from a mainly aesthetics point-of-view, admittedly) to be able to set min/max or % width/height for controls, and have them adjust with the size of the container. Tuesday 3th April, 2018 hiiamboris 02:27@HighTechForms https://doc.red-lang.org/en/vid.html look for "react" there - it makes wonders (: HighTechForms 02:29heh. I was in the process of going thru https://doc.red-lang.org/en/view.html! Thanks for the heads-up! 03:15I'm trying to run the example code for 1.3 Dynamic Relations at this page: https://doc.red-lang.org/en/reactivity.html 03:15It's giving me an error: 03:15C:\red>C:\ProgramData\Red\console-2017-8-3-49893.exe --cli "c:\red\test1.red" *** Syntax Error: invalid value at "]]follow: func [left right][left/offs" *** Where: do *** Stack: load 03:16I'm not sure what the issue is. :-/ 9214 03:25@HighTechForms can't reproduce it. Although, example doesn't work as expected. HighTechForms 03:30dang. ok, thanks. 03:31oh geez! I got it to work... There was no "Red []" at the top. Oopsies! 03:31And it does work as expected for me! 03:32I'm using Red 0.6.3. 9214 03:32Looks like a regression. HighTechForms 03:52In a list view, can I change the background color of a particular item in the list? toomasv 03:53@HighTechForms AFAIK, no 9214 03:56@HighTechForms depends on how you "work around that". HighTechForms 03:57@9214 Well, since I only have a top-level folder and second-level items, I figure I can put two list boxes. A thinner one on the left of "Form Sets," and a one on the right for "Templates." Clicking on the left one gets you the related templates in the right one. 03:58And it looks like reactivity could get me some control-placement management, but I'm hoping someone has already done something like that in a module. :-) 03:58Certainly, this is commonly expected behavior. greggirwin 05:56@greggirwin needs to make time to review all @toomasv's drawing code. 05:58@HighTechForms, you might be able to leverage foreach-face win: layout [ across button field return button field return button field return ] rows: 3 win/actors: object [ on-resizing: function [face [object!] event [event!]][ w: face foreach-face/with win [face/size/x: w/size/x - face/offset/x - 10] [face/type = 'field] y: w/size/y / rows i: 0 foreach-face win [ face/size/y: y - 10 face/offset/y: y * (i / 2) + 5 i: i + 1 ] ] ] view/flags win [resize] You could set a % in face/extra and calc based on that. rebolek 08:03I've updated the tree style demo, so it now asks for starting path, instead of using hardcoded one. Do not pick directory with lots of files and subdirs, because the style is *not* dynamic, it needs to read all subdirs first in order to render them. The demo is available in the tree branch of https://gitlab.com/rebolek/red-styles/ toomasv 12:49It appears, there is no need for a geometry module, Drawing pad is capable enough: [![geometry2](http://vooglaid.ee/red/geometry2.gif)](http://vooglaid.ee/red/geometry2.gif) BeardPower 12:51@toomasv Don't tease me, bro! ;-) :+1: 12:52So do we get a refund on the geometry module? :smile: toomasv 12:52Yeah, but Drawing pad's price just jumped... Oops, it was free 9214 12:53Whenever @toomasv posts something new [this theme](https://www.youtube.com/watch?v=XcNXq5DUZnk) starts to play in my head BeardPower 12:53Ha! I see, that you are using the "Apple" model ;-) 9214 12:53Toom-toom, toom, toom-toom. Toom-toom, toom, toom-toom. 12:53You are... Toominated. :sunglasses: toomasv 12:53Doom-doom... BeardPower 12:55@9214 Well, it reminds me of this: [IB](https://www.youtube.com/watch?v=44gD94kl5CU) planetsizecpu 13:00@rebolek Want to see the changes, could'nt find the tree branch on your repo. @toomasv Superb! @9214 @BeardPower "........@toomas will be back" toomasv 13:08I certainly will ... Unless you guys are fed up... Er ... As you probably are :cry: 9214 13:10We loose him! :scream_cat: toomasv 13:11I'll be back .. After while.. 9214 13:11@9214 throws tokens in @toomasv to sidetrack his attention from dreary thoughts toomasv 13:13@9214 Thanks! These will be most useful in my errand to otherworlds rebolek 14:22@planetsizecpu https://gitlab.com/rebolek/red-styles/tree/tree 14:30It's just oneline change, dir: request-dir instead of dir: %/Z/home/sony/Code, just to make the demo easier to use. toomasv 14:47I'm back. Sorry, couldn't resist [![quadratic-bezier-in-draw](http://vooglaid.ee/red/geometry3.gif)](http://vooglaid.ee/red/geometry3.gif) You can try these out [quadratic-bezier-draw.red](https://github.com/toomasv/drawing/blob/master/quadratic-bezier-draw.red) and [ellipse-draw.red](https://github.com/toomasv/drawing/blob/master/ellipse-draw.red). Just File -> Open in drawing-pad and click Animate. I'm curious, if this actually works out there.. planetsizecpu 14:47@rebolek ah, ok, I remember from a few weeks ago toomasv 14:50First, open drawing.red. From there File->Open.. BeardPower 14:50I downloaded a html page lol Sorry :blush: toomasv 14:50:) BeardPower 14:54Works nice! But there is an error: Script Error: path group1/2/5: is not valid for set-word! type *** Where: set-path *** Stack: launch launch either run while eval-command ask either do-events set do-event-loop awake set do-actor if set do-safe if print = type? try do act set-path 14:55Back to the drawing ~~~board~~~ pad ;-) rebolek 14:55@planetsizecpu I've just did this small change because someone had trouble running it. I'd like to come back to it and do some improvements as time permits. toomasv 14:59@BeardPower Which file? BeardPower 15:00Hold on. testing a fresh console. 15:03Both files are giving errors, when clicking on the right drawing items: *** Script Error: cannot access 4 in path 39x282 *** Where: set-path *** Stack: launch launch either run while eval-command ask either do-events set do-event-loop awake set do-actor if set do-safe if print = type? try do act set-path set-path 15:03It's only reported after closing drawing pad. 15:03I run DP in the REPL. toomasv 15:03Thanks! I'll investigate :neckbeard: BeardPower 15:04You're welcome. 15:15It's also giving these errors, when drawing into the canvas while it's animating. toomasv 15:23@BeardPower Interesting, I get no errors on W10! HighTechForms 15:24@greggirwin Hi, thanks for the code! That's the behavior I'm looking for. There should be some system where size/location of a control can be based on another control. That's how I've seen it done, usually. 16:19@rebolek Where can I get all the supplememental modules for your tree demo.red? do %../red-tools/xml.red do %../red-tools/html-tools.red do %../red-tools/json.red do %scroller.red do %text-table.red do %graph.red 16:20well, just red-tools... 9214 16:21@HighTechForms https://github.com/rebolek/red-tools rebolek 16:27@HighTechForms as @9214 said HighTechForms 16:28@9214 @rebolek Thank you! 9214 16:30@9214 hehe :mouse: Phryxe 17:07@toomasv Works on Win7 x64. Alignment of the canvas maybe a little off. ![Image](http://images.crex.se/2018/red-drawing-pad-2018-04-03a.jpg) toomasv 17:09@Phryxe Thanks! Seems that drawing-layer/canvas is 10x10 to far. (Also fill-pen color markers are misplaced.) Phryxe 17:19@toomasv The other example. ![Image](http://images.crex.se/2018/red-drawing-pad-2018-04-03b.jpg) planetsizecpu 18:19@rebolek thx, I encourage you, it is a useful widget but a complex task toomasv 19:07@Phryxe Thanks for the images! StephaneVeneri 21:31[![01.png](https://files.gitter.im/red/red/gui-branch/LzlG/thumb/01.png)](https://files.gitter.im/red/red/gui-branch/LzlG/01.png) 21:32@toomasv On macOS Sierra (10.12.6), I have to enlarge the window (to trigger the panel refresh) otherwise the display is too small to be correctly visible. But otherwise both scripts work perfectly. But if I want draw a line, there is this issue: *** Script Error: append does not allow none! for its series argument *** Where: append *** Stack: launch either either either either set try-do set body try either = set catch ctx context make view either do-events set do-event-loop awake set do-actor if set do-safe if print = type? try do act if either either append Anyway, it's a great job you're doing. :clap: Wednesday 4th April, 2018 greggirwin 00:17Go @toomasv, Go! 00:20> There should be some system where size/location of a control can be based on another control. :point_up: [April 3, 2018 9:24 AM](https://gitter.im/red/red/gui-branch?at=5ac39c977c3a01610da32472) @HighTechForms can you provide an example of what you're thinking? toomasv 03:00@StephaneVeneri Thank you for the report! I'll try to fix this. Is this the initial view after opening drawing-pad? dockimbel 03:08@toomasv Is your Drawing Pad app using VID for building the GUI layout, or are you constructing and positioning the faces manually? VID integrates some GUI rewriting rules (that we need to extend and fine-tune) to make cross-platform UI work more consistently. It should be also possible to run the GUI rewriting rules on manually constructed UIs by calling system/view/VID/GUI-rules/process passing your window face as argument. toomasv 03:12@dockimbel It's mixed. Some panels in hierarchy relay on VID for layout, others I position manually. And on resizing positions are recalculated. Yes, it seems to be connected to different treatment of automatic layout. Thanks for the hint, I'll try it out! dockimbel 03:14@toomasv Same native widgets on different platforms have different sizes and hard margins, so VID tries to compensate those differences to produce a more similar layout. toomasv 03:16@dockimbel So, if I pass the layout through system/view/VID/GUI-rules/process will it adjust children also? dockimbel 03:17@toomasv Sorry, I changed my comment, as actually the alignment/size compensation are still done by VID for now, the GUI-rules have limited effect on those properties. 03:17@toomasv > @dockimbel So, if I pass the layout through system/view/VID/GUI-rules/process will it adjust children also? Yes, but you need to pass the window face as argument. toomasv 03:18@dockimbel OK, thank you! dockimbel 03:19Maybe some size/position adjustments hard-coded in VID could be copied to GUI-rules, so that you could invoke them when manually constructing GUIs. We'll look into that after 0.6.4 release. toomasv 03:19@toomasv One question more. This needs to be done on initiation only, or on resizing also? dockimbel 03:20@toomasv Depends on what changes you do on resizing. toomasv 03:20@dockimbel Positions and sizes of some panels dockimbel 03:21@toomasv As long as the changes are incremental and relative, it should not be needed. 03:22The difference in layouts you get between Win7 and Win10 is surprising, it looks like a bug in View to me. toomasv 03:27@dockimbel Yes, it's curious, because the central panel, placed 10x10 off on Win7 is initiated with origin 0x0 space 0x0 and the box implementing the drawing-layer is placed in it with at 0x0. 08:34Can we do a comparison of rendering the following layout on different platforms? I am especially interested in (1) how much the initial layout differs from example shown below (W10) and (2) if resizing works as expected. This is without GUI-rules processing. Code is here https://raw.githubusercontent.com/toomasv/drawing/master/layout.red Example on W10: [![layout trial](http://vooglaid.ee/red/layout1.gif)](http://vooglaid.ee/red/layout1.gif) dockimbel 08:37@toomasv Good suggestion. :+1: toomasv 08:39 :bowtie: Phryxe 08:50@toomasv On Win 7 x64 ![Image](http://images.crex.se/2018/red-layout-2018-04-04.jpg) toomasv 08:50@Phryxe Thanks! This is the initial view? Phryxe 08:51Yes. Resizing works, with some flickering. toomasv 08:52OK, good to know that rendering on W7 is close to W10. I made here few changes from previous layout of panels on Drawing Pad. Phryxe 08:53:thumbsup: HighTechForms 13:51> > There should be some system where size/location of a control can be based on another control. > > @HighTechForms can you provide an example of what you're thinking? @greggirwin When creating a control, have some face/size or face/position react call that is based on the size/position of another control. I'll try to work up a pseudo-code example today, but as an example: if I have a text field, I want it to expand to fill the space -or- expand when the parent container expands. I'm not sure how that would be coded in Red. The example above from @toomasv is exactly what it should look like at run-time! Nice! greggirwin 18:25@HighTechForms, a crude example: org: 10x10 spc: 8x8 win: layout [ across origin org b-1: button extra [25%] f-1: field extra [75% b-1] return b-2: button extra [50%] f-2: field extra [50% b-2] return b-3: button extra [75%] f-3: field extra [25% b-3] return ] rows: 3.0 win/actors: object [ on-resizing: function [face [object!] event [event!]][ w: face ; Set widths (have to cast to integer manually right now) foreach-face win [face/size/x: to integer! (w/size/x * face/extra/1 - org/x - spc/x)] ; Set X offsets for faces with an anchor face foreach-face/with win [ prev-face: get face/extra/2 face/offset/x: prev-face/offset/x + prev-face/size/x + spc/x ] [face/extra/2] ; Set heights and Y offsets y: to integer! w/size/y / rows i: 0 foreach-face win [ face/size/y: y - org/y face/offset/y: y * (i / 2) + 5 i: i + 1 ] ] ] view/flags win [resize] 18:28[![resize-face-pct.gif](https://files.gitter.im/red/red/gui-branch/WPkj/thumb/resize-face-pct.gif)](https://files.gitter.im/red/red/gui-branch/WPkj/resize-face-pct.gif) HighTechForms 19:56@greggirwin Whoa! Nice! Thank you! Can you do one other row example, that has a text, field, and button on one row? The text and button should remain static in size and position, and the field should grow along the x-axis when the window is re-sized. I think I might be able to take it from there. :D 19:56@greggirwin What are y'all using to record those animations? Those are GIFs, right? 19:57Oh! And one more question... How to set a min size for the window? StephaneVeneri 20:52@toomasv No, the capture is the first view after launch the application. If I open the script there is no refresh of the drawing area, to refresh it's necessary to enlarge the application. 21:07@toomasv This is the initial view [![04.png](https://files.gitter.im/red/red/gui-branch/mwK5/thumb/04.png)](https://files.gitter.im/red/red/gui-branch/mwK5/04.png) Thursday 5th April, 2018 greggirwin 00:42:point_up: [April 4, 2018 1:56 PM](https://gitter.im/red/red/gui-branch?at=5ac52de0e4ff28713aaa74cc) @HighTechForms, like this? win: layout [ across style text: text 50 button text "Name:" field return button text "Rank:" field return button text "Ser #:" field return ] rows: 3 win/actors: object [ on-resizing: function [face [object!] event [event!]][ w: face ; reference to our window, to use in foreach-face foreach-face/with win [face/size/x: w/size/x - face/offset/x - 10] [face/type = 'field] ] ] view/flags win [resize] 00:45[![resize-face.gif](https://files.gitter.im/red/red/gui-branch/Ltly/thumb/resize-face.gif)](https://files.gitter.im/red/red/gui-branch/Ltly/resize-face.gif) 00:45I use LICEcap for capturing GIFs. toomasv 03:25@StephaneVeneri Thank you very much! May I ask you to make one more try with [adjusted initial positions/sizes](https://raw.githubusercontent.com/toomasv/drawing/master/layout.red)? 03:26@HighTechForms I use [ScreenToGif](http://www.screentogif.com/) HighTechForms 17:27@greggirwin Glorious! Thank you! 17:35@greggirwin I should be able to use your and @toomasv 's code to get resizing windows and controls (faces?) up and running. greggirwin 19:19Great! Let us know how it works out. StephaneVeneri 21:12[![05.png](https://files.gitter.im/red/red/gui-branch/hdyM/thumb/05.png)](https://files.gitter.im/red/red/gui-branch/hdyM/05.png) 21:12@toomasv This last version works perfectly :+1: Friday 6th April, 2018 toomasv 02:59@StephaneVeneri Thank you! Looks better, yes, but still too little room on right side and bottom. OK, I can work on with that. Saturday 7th April, 2018 toomasv 17:58Memory-stable [3Dcube](https://gist.github.com/toomasv/800aaa6ba1a37526993b9f2fce52fd13): [![3Dcube](http://vooglaid.ee/red/3Dcube.gif)](http://vooglaid.ee/red/3Dcube.gif) 9214 17:59@toomasv https://github.com/red/red/wiki/Projects-showcase ;) toomasv 18:20@9214 Yup. 19:42There was a bug in z-axis rotation, now corrected, and [upgraded](https://gist.github.com/toomasv/800aaa6ba1a37526993b9f2fce52fd13): [![3Dcube2](http://vooglaid.ee/red/3Dcube2.gif)](http://vooglaid.ee/red/3Dcube2.gif) greggirwin 23:57Another very nice demo @toomasv ! Sunday 8th April, 2018 toomasv 04:29Thanks @greggirwin ! dockimbel 05:11@toomasv Nice! :+1: toomasv 05:59:) 07:48There is a problem I can't figure out. If rotated on x-axis, the cube rotates always around viewers x-axis, discarding objects' rotation info around other axes. If rotating on z-axis, it is always rotation around objects' z-axis. Rotation around y-axis takes into account rotation info of x-axis, but not that of z-axis. I'd like to make it rotate always around objects' axes. Any advice? [![3Dcube3](http://vooglaid.ee/red/3Dcube3.gif)](http://vooglaid.ee/red/3Dcube3.gif) planetsizecpu 08:11@toomasv :clap: 10:20@toomasv I don't get you right, when you move X slider the cube rotates Y axis, then you move Y slider and the cube rotates X axis, then you move Z slider and the cube rotates Z axis, yes? just swap X & Y sliders label, thought I may have misunderstood you :smile: toomasv 10:33@planetsizecpu Did you try it or do you say it based on the demo above? planetsizecpu 10:57@toomasv I'm on phone now, just see the demo toomasv 11:36I don't see it! :) Culprit found: the order of matrix multiplication. BeardPower 11:44The usual model-view matrix culprit 😉 toomasv 12:09@BeardPower What is the usual way of solving this problem? If I just change the matrices' multiplication order on different sliders, then the outcome will be jumpy - rotation wil jump between differnt results of ordering while changing sliders. BeardPower 12:24It's a issue with Euler angles, because they have [Gimbal Lock](https://www.youtube.com/watch?v=N5PDboNJwks). When two axes line up with each other, you will lose one degree of freedom. You can use [Quaternions](https://en.wikipedia.org/wiki/Quaternion) to overcome this issue. 9214 12:26Gee. BeardPower 12:26You can use: Axis-rotation, Euler angles, Quaternions and internal rotation matrices. 12:29@toomasv You need to follow a ruleset, as the order of the matrix multiplications apply different things to the axis. http://www.opengl-tutorial.org/beginners-tutorials/tutorial-3-matrices/ 12:29You also have an up-vector as a 4th entry in the matrix. 12:31Also make sure, that you are setting/using the identy-matrix, push and pop the matrices accordingly. 12:32 TransformedVector = TranslationMatrix * RotationMatrix * ScaleMatrix * OriginalVector; > !!! BEWARE !!! This lines actually performs the scaling FIRST, and THEN the rotation, and THEN the translation. This is how matrix multiplication works. 12:32:) 12:34When working in 3D space, there is an additional matrix: the projection matrix. 12:34M: model matrix (model space) V: view matrix (camera space) P: projection matrix (screen space) 12:39The combination of the three is the MVP (model-view-projection matrix), but they work like a stack, so to calculate the MVP, you need to multiply it in inverse order: projection * view * model toomasv 12:46@BeardPower Thanks! I'll try to digest this. :cold_sweat: BeardPower 14:36You're welcome. There is a lot to take in for Rendering in the 3D space. 14:37What it sounds more complicated than it is :) greggirwin 20:03@BeardPower ** RED! x8x 21:24@toomasv Here on macOS, 1) when open 2) after resize 21:25[![Screen Shot 2018-04-09 at 04.22.20.png](https://files.gitter.im/red/red/gui-branch/jwyb/thumb/Screen-Shot-2018-04-09-at-04.22.20.png)](https://files.gitter.im/red/red/gui-branch/jwyb/Screen-Shot-2018-04-09-at-04.22.20.png) 21:25[![Screen Shot 2018-04-09 at 04.22.44.png](https://files.gitter.im/red/red/gui-branch/u1xt/thumb/Screen-Shot-2018-04-09-at-04.22.44.png)](https://files.gitter.im/red/red/gui-branch/u1xt/Screen-Shot-2018-04-09-at-04.22.44.png) 21:34Also there is an issue, if I run the same code a couple of times in the same console run, at the second or third run, the beachball shows up and the window gets stuck, have to ctrl-c to force exit Red. StephaneVeneri 22:14@x8x I don't reproduce your problem on macOs 10.12.6 and the latest version of Red (Automated builds). Maybe you use your different version of macOS? x8x 22:15macOS 10.13.4 StephaneVeneri 22:24This may be the explanation but I can't confirm because I don't have a 10.13 BeardPower 23:09@greggirwin Heavy gold 😉 Monday 9th April, 2018 toomasv 03:18@x8x @StephaneVeneri Thanks for testing and info! Wednesday 11st April, 2018 toomasv 15:42Trial image-viewer: [![image-viewer1](http://vooglaid.ee/red/image-viewer1.gif)](http://vooglaid.ee/red/image-viewer1.gif) rebolek 16:05:+1: planetsizecpu 17:00:clap: BeardPower 20:10Scrollicious! toomasv 20:15:) meijeru 20:17Observation: the "not supported yet" facilities of the low-level RTD lead to crashes, e.g. when using underline dash. Not serious enough for an issue, I think, but it would have been better if the parsing was more robust... greggirwin 21:02Works in progress are tough, because you end up adding temporary code that makes doing the real work harder, and more dangerous. I agree it's good not to crash though. Thursday 12nd April, 2018 dockimbel 02:49@qtxie ^--- Thursday 19th April, 2018 DideC 11:16Does one still have a red or Rebol SVG to Draw converter somewhere? rebolek 11:28wasn't it on rebol.org ? 11:29hm, no :( DideC 11:32Already look there ;-) meijeru 11:43I found [shadwolf.free.fr/svg-demo-shad05.r](http://shadwolf.free.fr/svg-demo-shad05.r) REBOL [ Author: "Shadwolf, AShley, Vincent, Gavin F. MacKenzie " purpose: "parser and rendering od SVG files" details: { The goal of this script is to render SVG file content to screen using AGG/draw commands. This script use the xml-to-object to convert xml SVG structure to a object tree. } ] 11:45Admittedly, it is not the same draw dialect... DideC 11:52Thanks. Found it too in between. It is buggy, but a good start. Have it working for my simple need now :-) greggirwin 17:57I answered on AltMe as well @DideC. @zamlox started one for Red, but is waiting for a fast XML parser and floats in pairs to move forward. 9214 18:02@greggirwin is it worth to hang around with druids on AltMe nowadays? :^) luce80 18:09@DideC also this one: http://alain.goye.free.fr/rebol/svg/svgobj.r rgchris 18:27If only SVG was just an XML dialect! It's XML plus five or six sub-formats... DideC 20:47@luce80 thanks, but I need to parse SVG path. The one from Shadwolf site above does this, not this one. greggirwin 23:04@9214, altme is very quiet these days. I'm sentimental about it, because it's so effective, but it's a dark net app. Great for team comm, but not open and visible. So we can't use *just* that. We'll rebuild it though, better, stronger, faster...or maybe just a little different. 23:05@rgchris, good point. BeardPower 23:10@greggirwin Is there a wiki for proposing AltME re-charged features? greggirwin 23:10As soon as you make one. :^) BeardPower 23:11Weekend is coming soon :) Friday 20th April, 2018 rebolek 07:22@qtxie thanks for merging @rcqls's stuff into GTK branch! rcqls 07:57@rebolek Indeed! Many thanks to @qtxie! Hope it could be useful... rebolek 07:58It certainly is, at least for me :) rcqls 08:04Good news then! Thanks also to @honix for his work on draw dialect. BeardPower 11:22@greggirwin Ok folks, I created a wiki entry, which I plan to fill with more thoughts. Feel free to add your ideas, wishes, critics... [AltME - Reloaded wiki](https://github.com/red/red/wiki/AltME---Reloaded) DideC 12:15@dockimbel @qtxie Can rich-text face have other background than white? It seems not :-/ 12:19Forget it. My mistake. pekr 12:27I wish we would get top level face transparent too :-) I do remember Cyphre doing some hack for R2, which allowed that, but it was not possible on XP, or something like that. Semi transparent top windows would be cool marketing trick :-) DideC 12:36I have done this with R2 windows. 12:50@BeardPower Altme Wiki: added a small sentence on Persistance. Could be rephrase if it's not clear/correct. greggirwin 20:09Thanks @BeardPower ! 20:24I will note a couple things, from my perspective. - It's not about matching other chat tools, but about what we need to be more effective. - Some features may be prohibitive to start with, and no offer enough value for their effort. e.g. screen sharing and video/voice chat. So many options exist for those, and if they work for people, making it easy to just launch those may be enough. e.g., what is the benefit of having built in voice chat, since there's no UI element to it? To get a win there, we may need to add speech to text functionality, so you can have a transcript of your meeting automatically created, timed to where notes and tasks were entered, so you have a direct link to the conversation that led to them. I don't know if any tools do that today. - The vision of an app framework, which is *easily* extensible (not Eclipse) has long been a dream of mine. AltMe provides extra tools, and more custom apps you don't see, like a bug tracker, unless they are turned on for the world. If we take that view from the get-go, and step back one more time to the idea of a Red Browser...now we're getting somewhere, and the first apps we build help us learn what we need. - The security aspect is huge, as is the blockchain aspect for us. Being able to pick and choose those pieces, or just saying "Here's how we do security by default, and it's included" will help everyone build better apps. 20:25I also have a *lot* of notes, but it's a big task that will take time and a lot of thought to get right. BeardPower 20:59@DideC Checked :) :+1: 21:07>It's not about matching other chat tools, but about what we need to be more effective. So it's only for "internal" use? It will not match them, but match every single one of them in one package :smile: >So many options exist for those, and if they work for people, making it easy to just launch those may be enough. e.g., what is the benefit of having built in voice chat, since there's no UI element to it? Sure, but you would need 2 different apps, because feature A is missing in app B and feature B is missing in app A. I thought about creating a completely new UI. >The vision of an app framework, which is easily extensible (not Eclipse) has long been a dream of mine. AltMe provides extra tools, and more custom apps you don't see, like a bug tracker, unless they are turned on for the world. If we take that view from the get-go, and step back one more time to the idea of a Red Browser...now we're getting somewhere, and the first apps we build help us learn what we need. Yep, that's the whole picture :+1: A Red browser? You mean a html5 browser with all the bells and whistles? >The security aspect is huge, as is the blockchain aspect for us. Being able to pick and choose those pieces, or just saying "Here's how we do security by default, and it's included" will help everyone build better apps. Absolutely. There are better and faster hashing and crypto algos than SHA or AES which we can take usage of. We just need to do security right! IPFS would be a nice integration. 21:14>I also have a *lot* of notes, but it's a big task that will take time and a lot of thought to get right. Me too. Some of them are too ambitious ;-) greggirwin 21:16"We" <> "Internal". We is the royal we of the world. No HTML in the Red Browser. Don't need it. BeardPower 21:36:) 21:37What't the purpose of the browser? greggirwin 23:33To replace...The Browser. What the web should have been. The executable internet. But also customizable, like REBOL/IOS, so you can take on SharePoint, Groove, etc. and build pre-configured environments of secure app-suites, protocol based frameworks, and *maybe* also offer a converter that lets you browser hypertext as it was meant to be. Sunday 22nd April, 2018 mikeyaunish 05:15Just wondering why the internal representation of button size and offset doesn't match the source code. IE: >> ?? b1/size b1/size: 102x52 >> ?? b1/offset b1/offset: 49x49 05:16Also wondering why I can't ever seem to get markdown to work properly? toomasv 05:40@mikeyaunish > why I can't ever seem to get markdown to work properly? Backticks need to be on separate line: linebreak 3 x backtick linebreak [code] linebreak 3 x backtick linebreak dockimbel 12:54@mikeyaunish VID will adjust size and position according to the native widget margins and paddings. If you use View directly, no adjustments will occur (but then it's up to you to deal with those hardcoded OS constraints). You can access those metrics from system/view/metrics. mikeyaunish 15:18Thanks @toomasv and @dockimbel endo64 21:02I read somewhere that default DPI value is 96 on Windows, what about MacOS and Linux? Is there any default value defined? greggirwin 21:46@endo64 at a glance it looks like it scales based on the default of 96, but on mac it uses dpi: objc_msgSend [dict sel_getUid "objectForKey:" NSDeviceResolution] directly. Out of my normal scope, so someone may correct that statement. Thursday 26th April, 2018 maximvl 13:58hi, can I change z-index of vid-elements? rebolek 13:59@maximvl yes maximvl 13:59how? :) rebolek 13:59:) 13:59z-index is determined by order in pane block 9214 13:59> Order of face objects in a pane matters, it maps to the z-ordering of graphic objects (face at head of pane is displayed behind all other faces, the face at tail is displayed on top of all others). maximvl 14:00yes, but can I change it? also what about dynamically created elements? 9214 14:00https://doc.red-lang.org/en/view.html 14:00@maximvl you just change the order of the elements in a pane block. rebolek 14:00insert head pane take/last pane 9214 14:00say, with swap or move. rebolek 14:00for example maximvl 14:00jeez 9214 14:01We are many. maximvl 14:01so if I change pane's content it's automatically redrawn, right? rebolek 14:02if you have auto-sync? set to true then yes 14:03otherwise you need to call show 9214 14:05system/view/auto-sync?, that is. maximvl 14:08how do I set a loose option for a face? 9214 14:09view [box red loose] maximvl 14:09but in object, not in VID? 9214 14:10look at the face content with layout/only [box red loose] maximvl 14:13good idea, options: [drag-on: 'down] is the one 14:20so z-index thing changes the order in which faces appear in layout as well 14:21so I want faces to appear on the left and being draggable to the right 14:21but currently they have lesser z-index because they appear earlier in a pane 14:21how should I go about it? toomasv 20:20@maximvl See nr 3 in https://github.com/red/red/wiki/Projects-showcase-(links-to-remember) 9214 20:24I *knew* that @toomasv has a z-ordered stack of aces in his sleeve :) toomasv 20:25:) BeardPower 21:06@9214 He is keeping THAT from us? I lost confidence in the group ;-) 9214 21:21@BeardPower tuu nii eee :tulip: BeardPower 21:22@9214 Sorry, I don't speak.... ehhm, yes :smile: Thursday 3th May, 2018 viayuve 06:20Ammm... Where is that GUI designer? BeardPower 09:01@viayuve What are you referring to? viayuve 09:04@BeardPower Found it that app created by @planetsizecpu name "forms" BeardPower 09:05:+1: viayuve 09:06and similar item by Alan too 09:12@toomasv Wow 😮 your Drawing ✍️ Pad app is so cool 😎 does it support like measuring capability, it will say like from point one to two point two is 1.02mm. 09:19like drawing on graph paper and we can measure like its length and angle planetsizecpu 09:49@viayuve my forms app still have some bugs but you can try, it works reasonably :smile: toomasv 11:03@viayuve Thanks! Drawing pad does not currently support measurements besides points viayuve 11:41Now you Have new Idea 💡 @toomasv toomasv 19:36My new toy is [rich-text box](https://gist.github.com/toomasv/8fcd1bbd7de9451e7789dbdf5ae35881). Intermediate result: [![rich-text box](http://vooglaid.ee/red/rich-text2.gif)](http://vooglaid.ee/red/rich-text2.gif) greggirwin 20:08Fan-flippity-tastic @toomasv ! You're going to save everybody a lot of time when IDEs start being built. toomasv 20:18:) BeardPower 20:28:+1: qtxie 22:54@toomasv Nice! :+1: dander 23:11yeah, looks really great! Friday 4th May, 2018 toomasv 00:46Thanks! I focused on caret navigation and it is almost complete. (But looong!) planetsizecpu 06:04@toomasv good job! greggirwin 18:14:point_up: [May 3, 2018 6:46 PM](https://gitter.im/red/red/gui-branch?at=5aebad70f2d2d537045fecdf) First, make it work. :^) toomasv 19:17@greggirwin :question: greggirwin 19:36Because you said "But Looooong!". First versions shouldn't be optimized. :^) Saturday 5th May, 2018 toomasv 03:38@greggirwin True. Any idea how to make to work this one? [![rich-text caret problem](http://vooglaid.ee/red/rich-text3.gif)](http://vooglaid.ee/red/rich-text3.gif) Currently upper end of the caret (while moving with keys) is set by caret-to-offsetand lower end by line-height?, but this method gives inadequate result if font size is changing drastically on same line. Will there be more metric options to use? gltewalt 03:45Can resize cursor by line-height? with a event? 03:45An event 03:49Oh. Recognition problem when on same line greggirwin 04:17Something for @qtxie to answer. qtxie 09:54We need to expose more information. Maybe a caret-height? function returns the height of the caret, or caret-to-offset/lower returns the lower offset of the caret. toomasv 14:18@qtxie Yes, something like this is needed. Sunday 6th May, 2018 toomasv 16:22@qtxie In addition, line? would be nice, i.e. rich-text/line? to return the line number at given offset. greggirwin 21:50For others to test on the REPL crash issue, if I change a desktop setting on Win10, e.g. window accent color, any running instances of the REPL crash. qtxie 23:12@greggirwin Thanks. That's very useful observation. 23:12@toomasv What is it use for? BeardPower 23:13@greggirwin I assume that this is only with the gui-console? greggirwin 23:25@BeardPower, yes, just tested and confirmed BeardPower 23:30Geez, Defender quarantined my executables... False positives are back. Monday 7th May, 2018 toomasv 03:24@qtxie Never mind, I managed to do without it. <end> and <home> are now working correctly, navigating to the end/start of line, also with <shift>; <ctrl>-<down> and <ctrl>-<up> jump the caret now to the end/start of paragraph. Tuesday 8th May, 2018 qtxie 14:56@toomasv I added a /lower refinement in caret-to-offset, it will return the lower end offset of the caret. toomasv 14:58@qtxie Thanks! I'll try it right away. qtxie 14:59For example, there is a string "abc" in rich-text face, using caret-to-offset box 1 and caret-to-offset/lower box 1 will give you the bounding box of character a. toomasv 16:16@qtxie Works well: [![rich-text caret](http://vooglaid.ee/red/rich-text4.gif)](http://vooglaid.ee/red/rich-text4.gif) Now I have another problem. When I change the size of the text big enough (24 in above example), then hopping up and down with arrow keys becomes problematic as you can see. I have to ponder on this. greggirwin 20:41Even with small issues, this is *really* exciting stuff guys. BeardPower 21:21It's hot, will invest :+1: Wednesday 9th May, 2018 gltewalt 01:35Looks like it’s not resizing fast enough from super big ? planetsizecpu 05:52@toomasv keys & event handling looks something complex, but it's almost done, push hard. Thursday 10th May, 2018 toomasv 04:26Got it [working](https://gist.github.com/toomasv/8fcd1bbd7de9451e7789dbdf5ae35881). But it can break on extreme size changes. As there is no way currently to get the offset of actual line, I had to rely on heuristics which works in most "normal" cases: [![rich-text caret](http://vooglaid.ee/red/rich-text5.gif)](http://vooglaid.ee/red/rich-text5.gif) pekr 05:02I wonder how "big editors" do it. What about registering some vectors, chars from-to, to particular line numbers, so that you always know, which line the text belongs to, no matter how big the font is? Of course, if you treat it as a separate object and can eventually drag it, it might be more difficult to handle .... toomasv 06:10Big editors have massive information at hand for every aspect you might want, e.g. in Windows https://msdn.microsoft.com/en-us/library/windows/desktop/dd371552(v=vs.85).aspx dockimbel 06:15@toomasv I think those metrics could be exposed also for our rich-text face content. toomasv 06:19That would make life lot more easier, but to think about heuristical ways to do things with minimal info is fun too. endo64 08:21@toomasv what happens when you select both part of text at the same time? toomasv 08:42@endo64 It's OK. [![rich-text selection](http://vooglaid.ee/red/rich-text6.gif)](http://vooglaid.ee/red/rich-text6.gif) endo64 08:43@toomasv Cool! rebolek 08:46@toomasv nice, so now I don't have to rewrite my Draw rich text editor for text-box ;) toomasv 08:49@rebolek Not sure about that. Look at this: :scream: [![rich-text edit problem](http://vooglaid.ee/red/rich-text7.gif)](http://vooglaid.ee/red/rich-text7.gif) pekr 08:49Hmm, not more difficult task - placing an image there, or having various flow arounds :-) 08:50... and then call Microsoft, suggesting them to replace MS Word in just 2MB executable :-) toomasv 08:50 :joy: rebolek 08:52@toomasv I haven't time to play with new text-box!, but it seems you need to update style information when changing text. That shouldn't be that hard. toomasv 08:54@rebolek Yes, I have to find and update all positional indexes affected on every change... rebolek 09:16@toomasv it's one function... OTOH it would make sense if it was done automatically. Friday 11st May, 2018 DideC 09:40@toomasv Very nice work! Congrats. meijeru 09:45quote OTOH it would make sense if it was done automatically.unquote Is this a candidate for reactive treatment? rebolek 09:45Good question. DideC 09:52@meijeru I wondered that too. It would be simpler to program (maybe?) but would probably make many more code to be run than a simple func that just add the diff to every position marker. Sunday 13th May, 2018 githubnyn 23:08 view [ size 640x480 base 640x480 focus ] 23:10[![border.png](https://files.gitter.im/red/red/gui-branch/d1C2/thumb/border.png)](https://files.gitter.im/red/red/gui-branch/d1C2/border.png) 23:10is there a way to avoid that little border/gap of 10 pixels nedzadarek 23:11@githubnyn view/tight [base red] githubnyn 23:11thanks! @nedzadarek 23:31when the coordinates of an image are outside the 640x480 window size, the window will expand on its own. Is there a way to either prevent the window from expanding or hide the image Monday 14th May, 2018 nedzadarek 00:08@githubnyn just set the size: im: make image! [888x888] ;== make image! [888x888 #{ ; FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF view [image im] view [size 200x200 image im] githubnyn 02:25I didn't have view/tight so when the image was positioned outside the main window expanded by itself 02:26@nedzadarek thank you 02:32 view/tight [ size 400x400 base 400x400 at 220x250 img1: image http://static.red-lang.org/red-logo.png at 210x250 img2: image https://cdn.dribbble.com/assets/dribbble-ball-dnld-35eba27acd4710f90ea9aa7ad8037fbb19ad997078531844fd34456b4c6551e4.png ] 02:32is there a way to switch the Z coordinate in order to dynamically change which image shows on top greggirwin 02:42The Z order is based on the order items appear in the face pane. https://gist.github.com/toomasv/fdac9ae51f60dac58ce69483e4a055c1 toomasv 17:13Interim report of [rtbox](https://gist.github.com/toomasv/8fcd1bbd7de9451e7789dbdf5ae35881). Added scrolling with wheel and arrow keys, adjustment of positional markers on editing. [![rich-text editing](http://vooglaid.ee/red/rich-text8.gif)](http://vooglaid.ee/red/rich-text8.gif) BeardPower 17:35Nice one! toomasv 19:05:smile: greggirwin 19:57Just keeps getting better @toomasv ! Thanks for the update. Tuesday 15th May, 2018 githubnyn 01:48@greggirwin is this the only reference/tutorial on face/pane 01:49I was looking for something simpler to grasp.... toomasv 02:45@githubnyn Here is a basic one: view [ base red 50x50 at 40x40 base blue 50x50 button "Reorder" [swap face/parent/pane at face/parent/pane 2] ] 02:53This is also basic, changing order at click on face: view [ style b: base 50x50 [move find face/parent/pane face tail face/parent/pane] b red at 40x40 b blue ] greggirwin 03:06@githubnyn I couldn't find the simpler one I thought I had laying around. A simple way to visualize it, is as a simple series [a b c d] where each item is a face in the pane. Now, manipulate that series and imagine that you're the view renderer, drawing each face as you iterate over the series. githubnyn 03:36thank you!! @toomasv @greggirwin toomasv 04:15@githubnyn You are welcome! Here is one a litle bit more involved: i: 0 view [ size 180x180 do [ foreach c [red blue green yellow brick] [ append pane layout/only compose [at (20x20 * i: i + 1) box (c) 50x50] ] ] at 100x20 button "Reorder" [random face/parent/pane] ] [![z-ordering example](http://vooglaid.ee/red/z-ordering.gif)](http://vooglaid.ee/red/z-ordering.gif) Wednesday 16th May, 2018 githubnyn 03:38thank you! @toomasv 08:55 counter: 0 view [ base 300x300 focus rate 30 on-time [ counter: counter + 1 txt/text: to-string counter ] at 150x100 txt: text left bold font-color orange font-size 22 "test" ] 08:56when the counter reaches more digits it moves/expand the face to the right. it there a way to make it expand to the left instead? (align to the right) SteeveGit 11:24Hi, Is it possible to draw something inside an area ? Or having a tranparent one to draw behind it at least ? Can't remember how to get around :worried: gurzgri 11:26@githubnyn is TXT: TEXT RIGHT instead of LEFT what you're looking for? nedzadarek 11:26@SteeveGit something like this: view [at 0x0 base 255.2.1.200 at 12x12 base 111.111.1.0 ]? SteeveGit 11:27no problem with base, but area 9214 11:27@SteeveGit you can't draw in area, it's a simple text widget. SteeveGit 11:29hmm.... well, a tranparent area would do the trick, but it's still not done ? nedzadarek 11:29@9214 @SteeveGit but he can draw something (e.g. base) below/above it by positioning it correctly (at) and using alpha (4th *argument* in color). 9214 11:30@SteeveGit you can tweak the alpha channel and use absolute positioning to place base "on top" of area I suppose. nedzadarek 11:30view [at 0x0 area "foo" at 0x0 base disabled 255.0.0.200 ] SteeveGit 11:32Hmm... time to do some tests gurzgri 11:43I'm totally stuck when trying to define a style together with some actors and then reuse those and add or overwrite only selected actors as in view [ style tile: base on-create [print 'created] a-tile: tile "a" b-tile: tile "b" [print 'b] ] A-TILE receives the CREATE event, but B-TILE seems to have lost it's ON-CREATE actor when the default handler ON-DOWN is assigned. Is there a way to make the TILE style keep the styled actors that aren't explicitly specified when using the style? 9214 11:44@gurzgri use code generation instead of styles. gurzgri 11:52Not sure what exactly you're suggesting, sadly. Do you mean to define the TILE style outside of VIEW's layout spec block? But then, how would I do this and let VIEW know about this style? There is no STYLIZE function (yet) as REBOL's VID had it. 9214 11:53@gurzgri >> tile: [base on-create [print 'created]] == [base on-create [print 'created]] >> view compose [(tile) "a" (tile) "b" [print 'b]] 11:55Or use do inside View and extend actors facet manually after everything else is set up. gurzgri 12:00@9214 Thank you for these ideas! Yes indeed, both ways would work, but for complex styles reused often they look a bit cumbersome (not your fault). I guess STYLE then is really only meant for redefining visuals, behaviour not so much ... 9214 12:12@gurzgri yes, style is more for visual looks. You can create your own wrapper on top of VID block I suppose, but let's wait for team members to chime in, maybe there's a better way. 12:12@qtxie @dockimbel :point_up: do you have a moment for that? gurzgri 12:22 @9214 "own wrapper on top of VID" ... Yeah, that's exactly what I already was exploring as in view add-my-custom-style-behaviour layout [style tile: base ... tile tile tile tile ...] but had a gut feeling that this is just hacky and thought that there must me a better way. toomasv 15:32:point_up: [May 16, 2018 2:24 PM](https://gitter.im/red/red/gui-branch?at=5afc14deb84be71db90f3a53) [![drawing-on-area](http://vooglaid.ee/red/drawing-on-area.gif)](http://vooglaid.ee/red/drawing-on-area.gif) view [ area 200x100 focus wrap at 10x10 base 255.255.255.254 200x100 draw [line-width 20 pen 200.50.50.200 fill-pen 200.200.50.200 box 20x20 180x80] ] 16:00[![drawing-on-area2](http://vooglaid.ee/red/drawing-on-area2.gif)](http://vooglaid.ee/red/drawing-on-area2.gif) view [ area 200x100 focus wrap at 10x10 base 255.255.255.254 200x100 draw [line-width 20 pen 200.50.50.200] all-over on-down [append face/draw reduce ['line event/offset event/offset]] on-over [if event/down? [face/draw/(length? face/draw): event/offset]] ] greggirwin 17:26Hello @gurzgri ! So nice to see you. We'll get stylize, but may need to rework @rebolek's PR for it (https://github.com/red/red/pull/2300) as it's a bit out of date. I believe the issue you see is due to styles being "cleaned" when instantiated. Glancing at code and going from memory, which is dangerous. :^\ In Red you can use view directly, but layout has a /styles refinement. I don't think that will help in your case. rebolek 17:37@greggirwin I will take a look at the PR, what's needed to be updated. gurzgri 17:44Thanks for the warm welcome, @greggirwin , good to be here diving into Red. STYLIZE really seems to be what I was missing, I'll just go for some intermediate solution until it's there. greggirwin 17:51I think a key element is understanding Doc's design intent, to make sure we're aligned with that. I used stylize in R2 a lot myself. 17:52@gurzgri you should find your way soon enough, though there are some differences from R2. There are some wiki docs on that, and we mezz in missing things as we port stuff, until their fate is decided. 17:53join is one of the first things you'll miss. :^) 17:53Also, FFI is only in Red/System today, but will make it to Red before too long. SteeveGit 20:48Thanks to @toomasv I made some progress. In this code you'll notice that a drawed text and an area style differ in a strange way, althoug I think they should not. same font in both way, only the font colors are different. This is a problem, because I can't synchronise a drawed area (reconstructed) with a real area (the system widget). I'll probably have to try another style like rich-text in replacement. Red [needs: 'View] src: mold system/view size: 400x400 ft: make font! [name: font-fixed size: 20 ] view compose [ area size focus font ft left black font-color white ;255.255.255.255 on-created [ board/draw: compose [ font (face/font) text 4x3 (src) ] face/text: src face/font: make face/font [color: red] ] on-change [ board/draw/5: board/draw/5 ;dumb set, refresh board ] at 10x10 board: base size 255.255.255.255 ] greggirwin 20:52Native widgets give us some benefits, but also limitations. Thursday 17th May, 2018 githubnyn 06:16@gurzgri where should I add RIGHT ? SteeveGit 08:31To be sure, is the text-box! face still in effect ? I tried example 1 from https://github.com/qtxie/red/wiki/Text-box!-Usage but it failed. toomasv 08:40@SteeveGit Did you want something like this: [![rich-text](http://vooglaid.ee/red/rich-text2.png)](http://vooglaid.ee/red/rich-text2.png) text: mold system/view rft: make font! [color: red size: 14] wft: make rft [color: white] view compose [ backdrop black at 12x10 rich-text glass font rft top left 400x400 (text) rich-text font wft glass top left 400x400 (text) ] See also :point_up: [May 14, 2018 8:13 PM](https://gitter.im/red/red/gui-branch?at=5af9c3d5f04ce53632d80220) SteeveGit 09:26No @toomasv, I need something editable like area or field on the back. I tried this example from qtxie, but text-box! does not exist in my release ft: make font! [name: "Menlo" size: 12] txt-box: make text-box! [ text: "Hello 世界！aBc" font: ft ] view [b: base 300x300 do [b/options: [rich-text?: yes] b/draw: compose [text 60x100 (txt-box)]]] toomasv 09:31@SteeveGit Did you look at the example I referred to above? SteeveGit 09:32yeah it works , but not what i'm looking for I guess toomasv 09:34So, what are you looking for? SteeveGit 09:36I wanted an area with the focus in the back, not 2 superposed rich-text. But was not able to have it working. toomasv 09:47But what exactly is the effect you want to achieve? And why do you try Text-box? The new rich-text support doc is here: https://github.com/red/red/wiki/Rich-Text-support The [example](https://gitter.im/red/red/gui-branch?at=5af9c3d5f04ce53632d80220) I referred to above is editable rich-text box. (Although mold system/view is too big for it to handle) SteeveGit 09:59Thanks for the link, I will look at it but when I go to the wiki by myself I can't find this page in any provided menu. Where did they buried it ? :fire: gurzgri 10:00@githubnyn Not so much *adding*, I suggested *replacing* LEFT with RIGHT in the code sample you've posted. And maybe supply a fixed width for your TEXT face? toomasv 10:05@SteeveGit On wiki page, click on Pages (on right) and type "Rich Text" into "Find a Page..." field SteeveGit 10:13So I'm supposed to know that I'm looking for rich text, not really convenient :smile: 10:14Not what a menu is for :smile: 10:16@toomasv toomasv 10:17That's how wiki works SteeveGit 10:18@toomasv , You undersand the idea of a menu wich links all the existing ressources ? 10:19Yeah, I know you know greggirwin 16:40We are working on the wiki, to add more navigation options, because wikis don't naturally do that. And rich text is new. The best way to find things, sometimes, is to ask here. 16:42@ldci, for your spare time: https://www.youtube.com/watch?v=Zg0Zaiarlpk 16:42Though you may have already seen it. gltewalt 23:53@SteeveGit Added GUI Programming to the Wiki sidebar. Links to the official docs for the GUI System and the Rich Text link are in the new page. Friday 18th May, 2018 SteeveGit 06:34@gltewalt gg :clap: dockimbel 16:17@gurzgri > A-TILE receives the CREATE event, but B-TILE seems to have lost it's ON-CREATE actor when the default handler ON-DOWN is assigned. Please open a ticket about it. At first look, the actors creation code is missing a merging with predefined actors in the style. Saturday 19th May, 2018 SteeveGit 13:54So... seems that the rich-text style has not been turned into a rich-area yet by anyone. I came across Toomas experiment but it's not a full-fledged area project as far as I can see :smile: Anyone has worked on something similar? greggirwin 22:03@toomasv is the lead experimenter in the rich text lab. Coordinate with him. Sunday 20th May, 2018 githubnyn 01:51 view [ base 400x300 focus on-down [ print ["event/type" event/type] print ["event/offset" event/offset] ] at 150x170 img1: image http://static.red-lang.org/red-logo.png ] 01:52is there a way to get the mouse xy of the entire screen regardless how many faces there are around ? when the mouse if over a face it doesn't give back anything 9214 02:00@githubnyn you can get an offset inside window face, but not entire screen (unless your window is fullscreen of course). githubnyn 02:02yes inside the window would be ok 02:02but if there is a face in it will it still work ? 9214 02:05@githubnyn view [size 500x500 on-down [probe event/offset] box red 200x200 return field hint "yes, it will"] githubnyn 02:06thank you!! @9214 02:11so base was preventing the mouse reading ? 9214 02:12@githubnyn no, it's just that you specified event handler only for this face. githubnyn 02:15 view [size 500x500 on-over [probe event/offset] box red 200x200 return field hint "yes, it will"] 02:16why is on-over so slow ? 9214 02:16Though, you can add event handler in system/view/screens/1/actors: object [...], but this doesn't work as expected. 02:17@githubnyn per documentation: > Mouse cursor passing over a face. This event is produced once when the mouse enters the face and once when it exits. 02:21You want this? view/flags [size 500x500 on-over [probe event/offset]] 'all-over githubnyn 02:23yes great thanks! @9214 9214 02:23Np. githubnyn 02:46 view/tight/flags/options [ size 640x480 base 640x480 gray focus on-over [print "over" probe event/offset] on-key [if event/key = escape [unview]] ; escape key quits on-down [print "down" probe event/offset ] on-up [print "up" probe event/offset ] rate 30 on-time [ img1/offset/x: random 10 ] at 150x170 img1: image http://static.red-lang.org/red-logo.png ][all-over][offset: 100x500] > 02:46now on-over is very slow 9214 02:51Uhm, you specified all-over flag for window but put on-over handler on base. githubnyn 02:53if I remove base, focus and gray do not work. actually the entire script will not work 9214 02:53 text view [base gray 100x100 with [flags: 'all-over] on-over [probe event/offset]] githubnyn 03:00thank you!! @9214 04:30 view/tight/options [ base 640x480 focus on-key [if event/key = escape [unview]] ; escape key quits at 100x100 img1: base 81x81 white at 100x200 img2: image https://s31.postimg.cc/l6vzkxm2x/test.png?dl=1 ][offset: 200x1240] I have a base called img1 and an image called img2 how do I copy from img2 to img1 starting at let's say 0x0 to 81x81 in img2 and pasting into img1 at 0x0? toomasv 04:48:point_up: [May 20, 2018 5:53 AM](https://gitter.im/red/red/gui-branch?at=5b00e32fe0b50c2d05d7a892) all-over is a VID keyword too: view [base gray 100x100 all-over on-over [probe event/offset]] 04:58@githubnyn After img2: do [img1/image: copy/part at img2/image 0x0 81x81] 9214 05:26@toomasv I tried flags though. toomasv 06:27@githubnyn One possible application (with some strange behaviour though due to the underlying pic): im: 0x0 view/tight [base 640x480 focus on-key [if event/key = escape [unview]] ; escape key quits at 100x100 img1: base 81x81 white at 100x200 img2: image https://s31.postimg.cc/l6vzkxm2x/test.png?dl=1 all-over on-over [ if event/offset / 81x81 <> im [ im: event/offset / 81x81 img1/image: copy/part at face/image im * 81x81 81x81 ]]] githubnyn 07:49 view/tight/options [ base 640x480 focus on-key-down [ if event/key = #"A" [ do [img1/image: copy/part at img2/image 0x0 81x81] ]] on-key [if event/key = escape [unview]] ; escape key quits at 100x100 img1: base 81x81 white at 100x200 img2: image https://s31.postimg.cc/l6vzkxm2x/test.png?dl=1 ][offset: 200x1240] 07:49thank you. I tried this above and I get <Error>: CGImageCreate: invalid image provider: NULL. @toomasv toomasv 08:06@githubnyn I don't know if this is connected to the error message but you don't need do in this case. On my W10 both versions work though. githubnyn 09:01it works without do! thank you!! @toomasv 09:03it copies the entire big reduced into the little one 09:04if I want to copy only 0x81 from the big pict (basically cutting it) what should I change 09:10it worked once but no longer works 09:12keep getting even after restarting terminal May 20 05:11:47 console-2018-5-12-55219[1931] <Error>: CGImageCreate: invalid image provider: NULL. 9214 09:13Can you use a file rather than a URL? githubnyn 09:13yes. I get the same error message loading a file 9214 09:19@githubnyn and the error still persist on the latest build? If so, could you please file a github ticket with your snippet and error message? githubnyn 09:20yes red-12may18-142bd46d.dms on the mac 09:24I filed a ticket on github 9214 09:26@githubnyn please post your code snippet as a reproducible example. githubnyn 09:30ok 9214 09:32Thanks! githubnyn 09:34 im: 0x0 view/tight [base 640x480 focus on-key [if event/key = escape [unview]] ; escape key quits at 100x100 img1: base 81x81 white at 100x200 img2: image https://s31.postimg.cc/l6vzkxm2x/test.png?dl=1 all-over on-over [ if event/offset / 81x81 <> im [ im: event/offset / 81x81 img1/image: copy/part at face/image im * 81x81 81x81 ]]] 09:34this one above works 09:44 img1/image: copy/part at img2/image 0x0 81x81 09:45this one doesn't work 09:46is there somewhere a general copy and paste code (possibly simple) between 2 faces ? 10:13 view [ img1: base 81x81 img2: image https://s31.postimg.cc/l6vzkxm2x/test.png?dl=1 all-over on-over [ img1/image: copy/part at face/image 0x0 * 81x81 81x81 ] ] 10:13this one above works 10:20 view [ img1: base 81x81 img2: image https://s31.postimg.cc/l6vzkxm2x/test.png?dl=1 on-key-down [ if event/key = escape [ img1/image: copy/part at face/image 0x0 * 81x81 81x81 ]] ] 10:21this above works but with a long delay and you need to click inside the window and press escape multiple times to finally see it working 10:42this is going to be a problem when needing to use a sprite sheet toomasv 15:56@githubnyn Try this: escape: #"^[" view [ img1: base 81x81 img2: image https://s31.postimg.cc/l6vzkxm2x/test.png?dl=1 focus on-key-down [ if event/key = escape [ img1/image: copy/part at face/image 0x0 * 81x81 81x81 ]] ] 16:18@githubnyn And in [this](https://gitter.im/red/red/gui-branch?at=5b014a37d245fe2eb7c52baa) case you don't need all-over. With all-over it will copy the part of img2 on every mouse-move, which makes no sense. It would be enough to copy it once while entering over img2-- and for that on-over is enough without all-over. 9214 19:26@toomasv escape is already predefined. toomasv 19:45 :no_mouth: githubnyn 20:21@toomasv this last one worked once, then crashed. then worked and then stopped working again until I restarted the terminal and over again. clearly there is a bug 20:25[![image.png](https://files.gitter.im/red/red/gui-branch/dJlU/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/dJlU/image.png) 20:26when it works it copies the entire image reduced. how do I copy only a cropped part of the image (actual size)@toomasv Monday 21st May, 2018 toomasv 03:07@githubnyn On W10 it copies correctly one tower. 03:24[![pic-selection](http://vooglaid.ee/red/pic-selection.gif)](http://vooglaid.ee/red/pic-selection.gif) Code is last combined with previous: im: 0x0 view [img1: base 81x81 img2: image https://s31.postimg.cc/l6vzkxm2x/test.png?dl=1 focus all-over on-over [ if event/offset / 81x81 <> im [ im: event/offset / 81x81 img1/image: copy/part at face/image im * 81x81 81x81 ] ] ] githubnyn 10:48this code crashes on the Mac Runtime Error 1: access violation *** at: 0002439Bh@toomasv SteeveGit 15:08When I switch the focus to an area (by clicking in) Then, I can't give it back to another face with set-focus. I can't remember how I solved this problem in the past... 16:01So, when I forcefully doubleclick outside the area, the area accept to lose its focus (pretty weird) Friday 25th May, 2018 toomasv 18:19 @qtxie [Regression?](https://gitter.im/red/bugs?at=5b07f178edd06f7d15e1c21d) qtxie 22:17@toomasv Yes. I think so. Friday 1st June, 2018 Franktic2 02:51I've looked but cannot find how to hide a face. Unview hides a complete layout. I want to hide a specific face in a layout. toomasv 06:04@Franktic2 You can use hidden in VID: view [text "Next is hidden" field hidden] And you can use visible? facet in Red code: view [ button "Hide" [ either f/visible? [ f/visible?: no face/text: "Show" ][ f/visible?: yes face/text: "Hide" ] ] f: field ] greggirwin 06:05It's like magic. I log in, see a question, and an answer from @toomasv appears! :^) toomasv 06:05It IS magic! Franktic2 09:11brilliant, thanks! toomasv 09:34You are welcome! Monday 11st June, 2018 pixel40 12:53Hi just wondering if anybody else has had a problem with set-focus. This code crashes the console in Windows 10 using Version red-07jun18-3f3c037f. Sorry never used GitHub before. Red [ needs: View ] lay1: layout [ panel [ f1: field 200x20 "Hello, I am assisting with crash test" return button "Press Me First" [ view [ button "First step to Crash" [ set-focus f1 unview ] ] ] button "Press Me Second" [ view [ text "Do you think this will cause crash?" return button "Yes" [ unview ] ] ] ] ] view lay1 BeardPower 12:59@greggirwin This example works in the version from January, but not in the current one. 13:00@pixel40 Thanks for reporting. endo64 15:17@pixel40 You can format your codes in gitter by using back ticks: 1 back tick for inline and 3 back ticks for multiline codes. See the markdown help button on bottom right. greggirwin 18:49@pixel40, thanks for the clear example. Please submit a ticket for this. Thanks for checking it @BeardPower. 18:50My guess is that @qtxie can fix it pretty easily, by disallowing setting focus to a face not in the active window. Thursday 21st June, 2018 planetsizecpu 08:43Today I noticed that scrolleris running, I made some hand test with my forms designer, works well but seems a little tricky to move as it is a loosewidget, secondary button helps to stop it from following mouse. 08:44[![test6.gif](https://files.gitter.im/red/red/gui-branch/yUTe/thumb/test6.gif)](https://files.gitter.im/red/red/gui-branch/yUTe/test6.gif) rebolek 08:45:+1: planetsizecpu 08:51@rebolek good job rebolek 08:54@planetsizecpu he? planetsizecpu 10:04@rebolek I thought you were working on scroller no? hiiamboris 10:05Is this just an unexpected feature or a bug? >> view [base 200x200 draw [line-width 20 pen linear blue red line 9x9 190x190 circle 99x99 90 ]] ![](https://i.gyazo.com/9695314671f470921838ddaf8facc526.png) >> view [base 200x200 draw [line-width 20 pen linear blue red circle 99x99 90 line 9x9 190x190 ]] ![](https://i.gyazo.com/e3d0a4eea0319d4d012c5361c8a1a437.png) >> view [base 200x200 draw [line-width 20 pen linear blue red circle 99x99 40 line 9x9 190x190 ]] ![](https://i.gyazo.com/abc9e6636d49fc8149272b0cf87064e7.png) 10:05I mean the fact that: - line doesn't deploy the gradient on itself - and follows the one deployed by the previously drawn shape planetsizecpu 10:21@hiiamboris I'm not familiar with draw dialect by now, may be @qtxie could answer this question. rebolek 10:26@planetsizecpu I wrote custom Draw-based scroller, but that's certainly not part of Red, built-in widgets are native. qtxie 10:381 planetsizecpu 10:38@rebolek ah! I thougth you were in collaboration with the team :smile: rebolek 10:39well... abdllhygt 18:44Hi, i wrote Red-Zenity library. It's for making GTK Dialogbox ![alt](https://image.ibb.co/eVNMZo/10.png) Saturday 23th June, 2018 hiiamboris 19:54me made a tetris demo https://gitlab.com/hiiamboris/retris/tree/master care to play? ☺ gltewalt 19:54Next... netris hiiamboris 19:55I would like to know if there's any bugs you experience ;) 19:56Or if you have ideas how to further minify the -xs version endo64 20:01@hiiamboris Great game! Just window is a bit too big, takes too much time to fill :) hiiamboris 20:03haha! ok when I'm going to make it resizeable I'll make the map size change instead of scaling things greggirwin 20:09Excellent @hiiamboris !! Once you have it nailed, can we add it to the showcase section in the Code repo? 20:10I would have posted sooner, but I was playing. :^) hiiamboris 20:28:D yeah of course you can greggirwin 20:38It's very cool. I thought it was Allen Kamp who did an old one for R2, but it was FrankS, who did so many great demos: http://www.rebol.com/view/demos/rebtris.r toomasv 20:43@hiiamboris Nice! :+1: But it collapsed when I was half way through. hiiamboris 20:44@toomasv W10? any observations? toomasv 20:45Yes, W10. Didn't notice anything strange before it just hanged for ~two secs and then crashed, i.e disappeared. Played about 5 minutes (estimation). gltewalt 20:49Memory leak? greggirwin 20:49Well, we don't have GC yet, so all allocations are leaks. :^) gltewalt 20:49lol, the issue with GUI console growing, remember? 20:51Automagically growing GUI console footprint hiiamboris 21:001.5GB in 10 mins ;) 21:00@toomasv you've a lot of free RAM? is it possible it ran out of it? 21:01I've been intentionally careless about allocations... I know... greggirwin 21:02> I've been intentionally careless about allocations... As it should be, most of the time. :^) toomasv 21:22Second time crash. Played about 20 minutes (checked), difficulty 93%, 6,5 GB were used of 15,9 (41%) when crashing. hiiamboris 22:05> difficulty 93% wow! 22:06I'll add some try [] wrapper tomorrow Sunday 24th June, 2018 hiiamboris 22:24I've got rid of all the allocations under my control, and fine-tuned more things 22:24also added a try/all wrapper, that may hopefully detect the crash 22:26but I'm discovering that on-time events live their own life and are probably outside the try block, so... who knows, might be safer to use the .red version from the cli console Monday 25th June, 2018 qtxie 14:08@hiiamboris Looks like a bug. hiiamboris 14:16@qtxie which one? the crash or the fact that on-time works without do-events? 14:27I can see that on-time is triggered by input or gui-console prompt standby, but not when I call wait or run input from cli console qtxie 14:41@hiiamboris The drawing issue. view [base 200x200 draw [line-width 20 pen linear blue red line 9x9 190x190 circle 99x99 90 ]] hiiamboris 15:28Ah! okay I'll file a ticket Tuesday 26th June, 2018 cryptowyrm 09:34Nice work @hiiamboris! I loved the Rebol Tetris, used to play it for hours while listening to audio books. Good thing you mention the lack-of-GC problem, I'm writing a Match 3 game in Red right now as an example app for my Learning Red guide, just checked and RAM usage seems to grow by 1.1 Mb per second, didn't even think of that, oops! :) ![gif](https://lh3.googleusercontent.com/hpF3IioogCA1MG3sul6CWjwlGAyGqr9tyE0twpqoChyIR0l3pIlVK8k5qUNBODL8ul0qJ88vEkCL) hiiamboris 09:42@cryptowyrm cool :+1: you can optimize it for a reasonable RAM growth, with ease although it seems the team has switched to the master branch so it looks like we're gonna have the GC very soon endo64 09:53@cryptowyrm Looks great! Any repo for the game? cryptowyrm 09:57@hiiamboris Yeah I'll probably wait for that :) But we'll see how far I can get with optimizations. I have to do a lot of refactoring anyhow, it's 250 lines of code right now but it should be easy to get it to less than 200 and I wouldn't be surprised if a Red expert can get it below 100 like your Tetris game. @endo64 https://github.com/cryptowyrm/red-scripts/blob/master/match3.red Haven't implemented rules yet so you can cheat by switching any two gems, score isn't implemented yet and there is one bug where sometimes new gems don't get created, other than that it should work fine using the stable 0.6.3 version of Red. BeardPower 10:12:+1: 10:15You can get rid of any GC/leak issues by reusing the objects instead of destroying them. cryptowyrm 10:18Good tip, I'll try that. 10:21By the way, generally speaking, does it make sense to edit a draw block for performance, only replacing the sections that changed instead of recreating it from scratch in each frame? Or is there no difference because Red has to redraw everything anyhow no matter how little in the draw block changed? hiiamboris 10:24face is a deep-reactor! so it knows what parts of it have been modified. However I wouldn't expect it to be optimized for that right now and just redraw everything. Well, maybe in the future? 10:24someone aware of draw internals might say for sure cryptowyrm 10:29Interesting. I wonder if it's optimized in Rebol if it isn't yet in Red. Never used draw much before. I started writing a graphical Rogue like in Rebol once many years ago, but that's the most I did with it and that's not really graphically intensive :) hiiamboris 10:32I guess it wouldn't even make much sense since you can overlap draw primitives however you like and it might be too cumbersome to keep track of every primitive clipping region rebolek 10:33I believe that in Rebol, AGG took care of that. endo64 10:39Recreating of blocks also use more memory without proper GC, so using same block (with clear, change etc.) for draw and other blocks (generally for all series) could be an optimization too. cryptowyrm 10:44Will try that, thanks endo64! BeardPower 12:00@cryptowyrm Red is using GDI/GDI+ right now, but maybe will use Direct2D or other rendering APIs in the future, so Red will redraw whatever the rendering back-end implemented under the hood. There is no optimization yet and everything is re-drawn every frame, if you tell it to do so. 12:01Rebol used AGG, which is a software renderer. Red is using the rendering APIs of the operating systems. 12:08Red is lacking primitives for game programming. No scene-graph (besides the UI), ECS or the like. Rebol3 switched from faces to the gob!datatype as the base primitive, which maybe used for Red as well in the future: http://www.rebol.com/r3/docs/view/gobs.html 12:10It's much more flexible, has lesser memory footprint and processing overhead. cryptowyrm 12:23Thanks for the info @BeardPower! ECS in Red would be awesome. I don't do much game programming but I played around with CraftyJS a few years ago, an ECS for HTML5 games, that way of programming just felt right to me, fit my way of thinking much better than hierarchies of objects. BeardPower 12:24I made some benchmarks a while ago: 12:24[![benchmarks_Red.jpg](https://files.gitter.im/red/red/gui-branch/yVFn/thumb/benchmarks_Red.jpg)](https://files.gitter.im/red/red/gui-branch/yVFn/benchmarks_Red.jpg) 12:24[![kha.jpg](https://files.gitter.im/red/red/gui-branch/yVFn/thumb/kha.jpg)](https://files.gitter.im/red/red/gui-branch/yVFn/kha.jpg) 12:25Kha was capped at 60fps. 12:28@cryptowyrm I want to implement an ECS in Red / R/S, once I have time. 12:29Yes, I prefer composition over inheritance. I am way more productive with using an ECS and it's a lot easier and natural to use than a scene graph and the former is a lot faster. 12:30You can also use it for apps. http://lighttable.com/ was using an event based ECS. cryptowyrm 12:36Yeah that's the first time I saw an ECS in action I believe (or at least that I was aware of it, I didn't know back then games like GTA use ECS or that Naughty Dogs Uncharted series is written in Scheme Lisp), Chris Granger did some amazing things with ECS in ClojureScript but back then my Clojure-fu was extremely lacking. Probably still is, but much better now that I've used it daily for a few months :) BeardPower 12:38Insomniac Games use a lot of ECS and data-driven designs. 12:39I need to develop my Red-fu ;-) cryptowyrm 12:40Yeah me too. Been using Rebol and Red on and off for at least a decade but never got into it deep because I never wrote a big app in it. But Red is so awesome now I want to do it :) BeardPower 12:40Currently I'm using C/C++ and Haxe, but my goal is to use Red exclusively. It just needs tooling and frameworks. 12:43Red is using the native UI widgets of the operating systems, but it would be nice to have a software renderer (with the option of multi-threading and hardware acceleration) like AGG. I'm looking forward to combine Red with https://blend2d.com/. 12:45Absolutely. Red is really great. It's hard to go back to C/C++. cryptowyrm 12:45Yeah it's weird. When Red didn't exist yet, I always wanted a way to easily create native GUIs. But today, native GUIs are rare, custom stuff with Electron gets ever more popular. Even the snarky comments about it on Hacker News are starting to dwindle, which worries me a bit. One Electron app, fine. But imagine using 10. Need to buy more RAM :) BeardPower 12:45Once Red supports audio, video and graphics to a full extend, things get even more exciting. 12:46Another advantage of the draw dialect in Red: it's vector graphics. 12:47So a non-native UI can be completely vector graphics-based. No scaling issues, no blurring or other issues and quirks. 12:48I hate this Electron stuff. I have enough bloat-ware installed already. cryptowyrm 12:48Which is good for mobile as well. Google is going that direction, Flutter doesn't use native Android or iOS components. And yet it's faster than native. 12:48I used node-webkit for one big project I worked on for two years after seeing it used in Light Table, from a developer perspective it was awesome, but yeah as I user I'd prefer a native Red app anytime. rebolek 12:48@BeardPower "no blurring" I believe @Oldes may want to have a word with you about vector based UI. BeardPower 13:00@rebolek Sure. 13:12@cryptowyrm Yes. Google is pushing Fuchsia, which is finally a system from scratch (Forked LK (little Kernel) used in Haiku). It's using Vulkan and PBR (Physically Based Rendering), which is optimized for the Material design for casting shadows and light. You can implement Flutter modules and create a completely different UI, while still being fully hardware accelerated. Native widgets are slow, as they carry a lot of bloat and state. Most UI frameworks are retained mode, while others are immediate mode. Flutter lets you create state-full and state-less widgets, has a shallow hierarchy and is using composition over inheritance to some extent. 13:15Red is able to implement the very best from these solutions, as it's not bound to old bloat and relics from the decades ago. cryptowyrm 13:32Yeah it's super interesting to see how Red will evolve, so many possibilities and a new Rebol is sorely needed, we need something that's easy to use and doesn't require so much bloat. Really glad Nenad has gotten the funding right, twice now. I did not think the ICO would generate any interest, was really surprised so many people invested at that high cost of entry. Would be a huge bummer if Red had ended up dead after a few years. But that's one thing I've always admired about the old Rebol crew, staying in there for so long. I can't do that, I'm too fickle :) BeardPower 13:49Yes, now funding is out of the way, Red needs to find developers. greggirwin 18:37Nice work @cryptowyrm ! Great to see more people tinkering up fun things in Red. cryptowyrm 18:38Thanks :) 18:39Interesting, just tried out my Match 3 game in the latest automated build of Red but it didn't work until I changed all use of function to func in the gem object. Looks like there was a significant change to how function works since 0.6.3. It now doesn't allow you to set variables outside of the functions scope anymore, because it just creates a new local variable, masking the access to the objects variables. 9214 18:54> Naughty Dogs Uncharted series is written in Scheme Lisp Wasn't it Racket or some of its dialect? cryptowyrm 18:55Yeah an old version, back when it was called MzScheme I believe. There's an article about it on Gamasutra, was a long time ago when I read it so I don't remember all the details. 9214 18:58@cryptowyrm I doubt that function changed significantly. It always was a "smarter" version of func, which makes all set-word!s and words from iterating functions (foreach, repeat) local automatically. >> function [][a: 1 repeat b [] foreach [c d] []] == func [/local a b c d][a: 1 repeat b [] foreach [c d] []] >> func [][a: 1 repeat b [] foreach [c d] []] == func [][a: 1 repeat b [] foreach [c d] []] cryptowyrm 19:03Something changed for sure but it's probably working as it's supposed to now and in 0.6.3 it was a bug. 9214 19:03Well, it's hard to tell without concrete example of problematic code. cryptowyrm 19:07https://github.com/cryptowyrm/red-scripts/blob/master/match3.red Try it in 0.6.3, when you start it blocks will move around like they should. Try it in latest automated build of Red, nothing will move. Change all three methods of the gem object! (fall, animate and destroy) from function to func and it will work in both versions of Red. hiiamboris 20:46@cryptowyrm it seems you're right it was a bug, one of many object! bugs 9214 20:46Here it goes again... hiiamboris 20:47@9214 what? ;) gltewalt 20:51:bear: 20:52MEBIR ...? cryptowyrm 21:14@hiiamboris Ah good to know. I rarely use objects, but made sense in this specific case. I'll be more careful when using them in the future then until a new stable Red version is released. Wednesday 27th June, 2018 cryptowyrm 10:41@endo64 Your tip about reusing draw blocks with clear had a huge impact, thanks again for that! :) I first tried to reuse objects but that barely had any impact on the memory consumption, which makes sense since gem objects aren't created/destroyed in a tight loop. When I made the single line change to clear the draw block which paints the whole game instead of creating a new one with copy [] though, which is done 30 times per second, it saved about 0.6 Mb/s. Memory still grows by about 0.5 Mb/s which are probably other temporary series that don't use clear yet, but it's already a huge improvement :) endo64 16:09@cryptowyrm Great! We can use this optimization even if we had GC, could be useful especially for long running tasks (e.g. in DLLs, server side modules etc.) Friday 29th June, 2018 JacobGood1 04:25 Actually naughty dogs originally used common lisp, they got bought out, had to rewrite their entire system in c++. They wanted to find something that would interop well with their new implementation, so they chose mzscheme. ECS are a design pattern for crappy languages, red can do better. 04:27Light table used mixins for composability, which, in clojure, are just the merging of maps. Chris, later on stated that his system sucked because very few people could understand and extend it. 04:33I forgot to mention that ND used common lisp to write a low level lisp, the low level lisp is what they used for game programming. BeardPower 07:58@JacobGood1 How exactly is an ECS a design pattern for a crappy language? So closure is one of it? How exactly can Red do better? 07:59ECS is not a design pattern, but an architectural pattern. semiherdogan 09:01@cryptowyrm on macosx tetris crashes immediately >> do https://gitlab.com/hiiamboris/retris/raw/master/retris-xs.red *** Runtime Error 1: access violation *** at: 000246E1h rebolek 09:51@semiherdogan what version of Red are you using? semiherdogan 10:22@rebolek 0.6.3 red-26jun18-4d29f994 rebolek 10:24@semiherdogan thanks, I will try tonight on my Mac. JacobGood1 15:40@BeardPower "How exactly is an ECS a design pattern for a crappy language?" Most design patterns are created because of limitations in language flexibility, see Peter Norvig's analysis. "So closure is one of it?" I am not even sure what you mean. Closures or Clojure the language? "How exactly can Red do better?" Red can change its semantics based on context, think about how that allows for extreme composition, which is what an ECS is meant for. ECS was created to reduce the problems in single inheritance languages, it is not needed in more powerful oop languages and definitely not in Red. "ECS is not a design pattern, but an architectural pattern." Semantics. Now, we wait for someone to tell us we are off-topic... 15:44Most people that think they are using ECS are, in fact, using a hybridized form of it but not the original pattern. Unity, for example, was supposedly using an ECS. Recently, however, they are now moving to a "pure" ECS(read, real ECS). Mainly because they want better optimizations and better composition. 15:46If we distill ECS down to what it really is, it is just functions operating on tagged data. The tag in this case is an object which acts as a glorified type. BeardPower 15:52@JacobGood1 Peter just presented an opinion, other's wouldn't agree on. Sorry for the typo. I was referring to the Clojure language. Sure it can change the semantics based on context, but that's not the point of using an ECS. This feature of Red wouldn't help me to create 1000 of instances with different components on the fly. It's possible to switch out/in a component more easily, sure, but this advantage still needs to be discussed. The problem was not with single inheritance, but the bloated class hierarchies with OOP. If you are using an ECS you (may) don't even want to use OOP at all. No, it's not semantics. An architectural pattern can be implemented with various design-pattern. Whatever they call a "real" ECS. I guess they want to go all Stingray like. If they want better optimization and better composition they should not use C# in the first place. 15:53> If we distill ECS down to what it really is, it is just functions operating on tagged data. The tag in this case is an object which acts as a glorified type. Sure, that's why all you need for an entity is an Id/tag. A system is just running functions over a collection of tagged data. 15:55Mike Action from Insomniac Games really loves Data Oriented Design. 15:57I would love to have a built-in functionality to tag my data. 15:59And specify the tag for the function call, so it only executes on the tagged data (like tagging on VLANs), auto sorts on tags, partitioning on tags and a lot more. 16:03>Red can change its semantics based on context, think about how that allows for extreme composition, which is what an ECS is meant for. Can you provide an example? >ECS was created to reduce the problems in single inheritance languages, it is not needed in more powerful oop languages and definitely not in Red. Please explain why that is in your eyes. How would I do composition only with the features of some OOP language? Inheritance is a big thing in OOP and class hierarchies become huge, which is what an ECS tries to solve. JacobGood1 16:10Let me be clear that I do not think that Red is good for game programming in its current state(no optimizations). "Can you provide an example?" Sorry, too lazy to give a specific example. Using the meta-programming features of Red, the only limit are ones imagination. "Please explain why that is in your eyes." See CLOS(common lisp), dynamic multiple dispatch, and the meta object protocol. 16:14http://norvig.com/design-patterns/design-patterns.pdf "This is a little more than an opinion, it is more like a case study." 16:15In his words: "Design patterns are bug reports against your programming language." 16:17"Sorry for the typo. I was referring to the Clojure language." No, I do not think clojure is an ECS pattern. 16:19"this feature of Red wouldn't help me to create 1000 of instances with different components on the fly." True. Not with the current performance of Red. 16:23"If they want better optimization and better composition they should not use C# in the first place." The implementation matters more than the language. Sure, the languages semantics can make optimizations more difficult, but not impossible. That is why they are creating the burst compiler. BeardPower 16:25@JacobGood1 How is the lack of optimizations related to the use of Red for game-programming? Optimization takes place under the hood, so it does not change the tooling or your implementation. It's just not as fast as possible right now. Are you implementing the next "Crysis"? ;-) >Sorry, too lazy to give a specific example. Using the meta-programming features of Red, the only limit is ones imagination. Ah, come one! There must be some better excuse. ;-) >See CLOS(common lisp), dynamic multiple dispatch, and the meta object protocol. Too bad, that literature refers to it as a MOP design-pattern. Thanks for the link. Yes, a case study explaining his point of view. >No, I do not think clojure is an ECS pattern. I was not referring to, if Clojure is an ECS pattern, but a crappy language, because design patterns are "bug reports against your programming language". I just hope that Clojure is not using any design patterns ;-) 16:28>The implementation matters more than the language. Sure, the languages semantics can make optimizations more difficult, but not impossible. That is why they are creating the burst compiler. Sure, but it the foundation is limited itself, you can try as hard as you want and you will never reach the same performance as an alternative method. 16:32And yes, we are getting OT here ;-) If you want to create great tools/an engine for Red and want to share ideas, please do. JacobGood1 16:36"How is the lack of optimizations related to the use of Red for game-programming?" If you want to be able to create any game, then they are definitely related. "Are you implementing the next "Crysis"? ;-)" Maybe...=) "I just hope that Clojure is not using any design patterns ;-)" I am sure that there is a pattern or two in there somewhere =). However, there is currently no language that I know of that can entirely eliminate patterns, but the better ones can seriously reduce/eliminate most of them. The question is, can we abstract the pattern away to the point that one does not think about it. Lets take a super simple pattern like a singleton... if we were to use Java to create a singleton, the ceremony involved in such a pattern would require juggling many things in your head and writing a ton of boilerplate. In clojure; (defonce singleton some-thing). The pattern is eliminated entirely, here we only declare our intent, it is not obscured by pages of a code. 16:37"And yes, we are getting OT here ;-)" we started off-topic ;P BeardPower 16:37:smile: nedzadarek 16:39Have any one done something 3D in the Red? I mean something more "serious", e.g. game or simulation? gltewalt 16:40You want to use prototypal inheritance or ‘differential inheritance’ BeardPower 16:40Regarding optimization: sure, you can never have enough speed. The "defonce singleton some-thing" is just an abstraction. It just hides the implementation from you but it's still a design-pattern under the hood. 16:41@nedzadarek Not that I'm aware of. JacobGood1 16:42sure, that is the point that I am making 16:43design patterns are eliminated by good abstractions BeardPower 16:43Well, that's not my view of "no design-patterns". 16:44So what you want is "design-patterns out of the box". 16:45Instead of using a lib, it should be part of the language. 16:45:+1: 16:46We can surely make that happen. JacobGood1 16:46No, I want a language where I can abstract the pattern, distill it into a syntactic pattern where there is very little repetition needed on my part. I have already found languages like that... lisp and rebol. BeardPower 16:47How is this different to what I just said? 16:49I don't even want to abstract it myself. Why would I want that extra work if the language does it for me? ;-) 16:49Like all the different data-types. JacobGood1 16:50"So what you want is "design-patterns out of the box"." This implies no effort on my part. BeardPower 16:51Yes. That's why it's even superior. 16:51Why would you want to implement it yourself, if it's a language feature? 16:52Because you said: no, I want something different. JacobGood1 16:52I want to be able to subsume any pattern, that means I need to be able to do so. There is no possible way that the language creators could do that in every context for everything. BeardPower 16:53Well, at least no one tried yet. ;-) 17:00@nedzadarek Just some info to add: to add even more flexibility to Red in regards to graphics, it would be great to switch to gobs, like R3 did. 17:01gobs can be backed by different implementations/back-ends: software renderer, hardware renderer etc. nedzadarek 23:29@BeardPower I wonder how good it can be. BeardPower 23:30@nedzadarek For now the basic entity is a face. With gobs, anything can be created including a face. 23:31It's easier and more flexible to create custom Widgets with it and you are not limited in any regards. Gobs is a high performance and lightweight datatype for graphics. nedzadarek 23:36Sounds good on paper. @BeardPower Saturday 30th June, 2018 qtxie 02:08@semiherdogan Seems it's the crop in DRAW causes the issue. Monday 2nd July, 2018 abdllhygt 19:21hi, how can close window in view? gltewalt 23:04view [b: base red button "Close it" [unview b]] greggirwin 23:43Once you realize you're OT, figure out the best place to move the chat. :^) Wednesday 4th July, 2018 hiiamboris 16:05I've implemented teh *Hall of Fame* in https://gitlab.com/hiiamboris/retris we'll be able to wage tetris wars from now on ;) endo64 18:22@hiiamboris Very nice! Quick notes, showing the next item would be a nice feature. Binaries are old. Would be easier to see which place the item will be fall when pressing space, if the background picture has grid. 18:23[![image.png](https://files.gitter.im/red/red/gui-branch/Kkyw/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/Kkyw/image.png) 18:23Something like that. hiiamboris 18:35@endo64 thanks! very nice ideas! 18:38@endo64 you sure binaries are old? to me it shows I've uploaded them 2 hrs ago 18:39should've compiled with -t windows tho endo64 18:40I just downloaded https://gitlab.com/hiiamboris/retris/raw/binary/retris-xs.exe and the window was bigger, no score etc. hiiamboris 18:51Ah, right, -xs version is the skeleton, I only prettified one line in it's source code so far (replaced try/all with attempt), but that doesn't affect the binary so I didn't recompile it. It's also not optimized at all. 18:53I should not that in the readme. greggirwin 20:22Cursed Defender is flagging it for me. <grrrr> hiiamboris 20:25well, it always flags Red for me under Win8 ;) every time I update it cryptowyrm 20:40I used to have that problem with node-webkit, the precursor to Electron, every update of my app would be considered a virus after some time and Chrome wouldn't even download it, would cancel the download with a security warning. Desktop app development has become a really horrible experience. Programmer's tax (code signing), virus false positives, sandboxed store apps that will eventually become mandatory, etc. It's not just small developers that have to deal with this either. One of the earlier Tomb Raider games was considered a virus for more than a year before it got fixed with thousands of people complaining. The big Anti virus companies just don't care. hiiamboris 20:57FUD was a good source of income... Brace yourself for what might come once WebAssembly becomes defacto standard and most of the desktop software becomes server-side, implying total control and surveillance :) cryptowyrm 21:00Ha, didn't even think of that. Now I'm wary of WebAssembly too! :) Although it is pretty cool. hiiamboris 21:04yeah :) btw, @endo64 I've implemented your feature requests and updated the sources/binaries endo64 21:11@hiiamboris Cool! Playing now.. One thing, if I press space 5 times, next five blocks fall immediately. It would be nice clearing the keyboard buffer just before new block appears. hiiamboris 21:22:+1: 21:29marked it in the todo list, although I'm not sure how to make it easily 21:29there's also a way to cheat the timer which I can't get to solve Thursday 5th July, 2018 greggirwin 00:34I'm coming for you Boris! You're still #1...for now. ;^) hiiamboris 05:42:) C'mon it's a low score, you just *have* to beat it cryptowyrm 09:48No need to worry anymore, I beat you both :P My patience gave out after 10 minutes. I think the game board is still too big, makes it too easy. Although I might just be used to Rebtris where the board was much much smaller and I played that daily for a year so I got very used to it. One thing I noticed, when I keep the left key pressed to "slide" along a brick on the ground to get into a narrow empty space, the brick stopped falling until I released the key again. hiiamboris 10:51yeah, that's the cheat I was talking about cryptowyrm 11:06Ah I see, didn't notice the timer stops too when you slide along a brick. Yeah I guess you could abuse that to cheat. It's limited though because the timer and the brick falling seems to continue after 2 seconds, then it stops again, rinse and repeat. So there is a limit and it's a very tedious way to cheat :) gurzgri 11:13@hiiamboris Very nice and very polished looking given the code size, congrats! hiiamboris 11:16thanks :) It'll hopefully look a bit cleaner once the GC is out greggirwin 17:30I think what hurts my scores is that I expect the pieces to rotate the other way. ;^) 17:33Can't see the leader board without playing, and no time right now. I'll just have to trust you @cryptowyrm . gltewalt 17:34leader-board: “Gregg Irwin” 17:35+ 70 hiiamboris 17:39> I think what hurts my scores is that I expect the pieces to rotate the other way. ;^) you know @greggirwin it's strange but I've had the same problem :) Saturday 7th July, 2018 planetsizecpu 11:47Yesterday I made some improvements in my otp script, so I found some difference with the use of read-clipboard and the use of paste doing click with the secondary button. It seems that read-clipboard changes the CR / NL characters or the O.S. he does it himself. The funny thing is that in my script otp for java the same thing happens. 11:48[![paste-test.gif](https://files.gitter.im/red/red/gui-branch/yRyC/thumb/paste-test.gif)](https://files.gitter.im/red/red/gui-branch/yRyC/paste-test.gif) Monday 16th July, 2018 gltewalt 00:22I'd rather not set f/color: white constantly, but I'd like the green to go away if the length changes after it turns green: f: field 200x20 on-change [either validate-entry trim/all copy f/text [f/color: green][f/color: white]] greggirwin 02:18The trouble with programming is that things aren't always how we want them to be. It's an age-old problem. If you need to worry about performance, you can check the color, or set a flag, which is more work. Most of the time, especially in response to user input, you don't need to worry. Consider a system where you define rules, behaviors, and states declaratively. The underlying system will have to choose what to trade off, and you just won't know or care. In this case, I wouldn't worry about it. But you can avoid the dupe f/color: to ease the pain a bit. gltewalt 03:36f/color: either validate-entry trim/all copy f/text [green][white] Friday 20th July, 2018 toomasv 14:06Baking a Red pie: Color experiments (with d3 color-schemes): [![sector-colors](http://vooglaid.ee/red/sector-colors.gif)](http://vooglaid.ee/red/sector-colors.gif) 14:08Some formattings: [![sector-dynamics](http://vooglaid.ee/red/sector-dynamics.gif)](http://vooglaid.ee/red/sector-dynamics.gif) hiiamboris 14:37@toomasv :+1: toomasv 14:49:o) greggirwin 23:06Looks tasty! Saturday 21st July, 2018 BeardPower 06:04Needs to be combined with my tweening. Gobs, I need you ;-) planetsizecpu 09:54@toomasv Sweet!! pekr 09:57@BeardPower Do you really find face type being too heavy? In Red, maybe it is more resource savy than in R2? greggirwin 22:49We can't directly compare Red's native approach with R2's non-native approach. Red faces will be heavier in some ways, as they are full native controls. That should be fine for most purposes, but if you're doing sprites or spreadsheet cells, you can't expect it to scale very far. In the VB1 days, we built tables that way, as we can with Red now, but Excel can't do that and support large sheets. Sunday 22nd July, 2018 BeardPower 11:24@pekr If you want to do high performance graphics, yes. You inherit all the bloat and implementation of the underlying native OS widgets of which some are very slow. You cannot change the implementation or rip-out unnecessary code. A lot, if not all, Widgets are using retained-mode and OO style. It's not ideal for high-performance. pekr 11:35I did not know face is based upon any OS widget? BeardPower 11:49@pekr It's a window widget: https://github.com/red/red/blob/master/modules/view/backends/windows/base.reds ne1uno 11:53probe a map with 144 faces out of memory error BeardPower 12:04The base face is also an image based on the old GDI API, which is not hardware accelerated. 12:07To have high performance gobs, we would need to base it on a rendering context with various backends. 12:14We then are able to switch between native Widgets, software rendered Widgets/graphics and hardware accelerated Widgets/graphics at runtime. Tuesday 24th July, 2018 ingvast 05:10Hi 05:12I'm Johan, a long time reboler that is starting out with red. First thing I try is to translate some code from rebol. I have a problem with VID facet keword "with" that does not seem to be available in my version, yet the documentation says so. 05:13My version is 0.6.3 endo64 05:24Hi Johan! Good to see old rebolers coming to Red! 05:26You can use do instead of with. And please always test your codes with the latest auto build instead of the stable release. toomasv 06:11@ingvast Hello @ingvast! with works fine on my W10. ingvast 06:27W10 on my side as well. I'll try with later build in afternoon. Thx greggirwin 06:50@ingvast welcome! You do need to pull the automated build for with to work. maximvl 15:04a nice and fun challenge for GUI learners: http://www.mandalagaba.com :) toomasv 15:15@maximvl Nice one indeed! maximvl 15:16here some great works created with it: https://www.instagram.com/mandalagaba/ ingvast 15:21Got red July 23. "with" is there but does not work as in rebol/VID. I usually use it to extend the face objects with new variables. That does not seem to be possible here. Do you have any suggestion how to do that in red/VID? 9214 15:21@ingvast use extra facet. pekr 15:21@maximvl I would be more impressed by the ability to get accelerated, smooth, amiga like animations / parallax scrolling, etc :-) ingvast 15:22thx, that will do. maximvl 15:22@pekr well, mandalas supposed to be drawn/put together in real life :) 15:23something like https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Chenrezig_Sand_Mandala.jpg/1280px-Chenrezig_Sand_Mandala.jpg pekr 15:23For animation, I prefer realtime, rather than real life :-) 15:24You are talking to the guy who for 7 years visited buddhistic ashrams, so yes, I know what mandalas are :-) maximvl 15:24ah, okey) BeardPower 17:29@pekr I'm sure it will come to Red. greggirwin 21:55@ingvast, @9214 is spot on. Extra is where you can store extensions, while with takes the block and does it, binding it to the face first. Friday 27th July, 2018 toomasv 13:32Revisiting tweens: [![bezier-tweens](http://vooglaid.ee/red/bezier-tweens.gif)](http://vooglaid.ee/red/bezier-tweens.gif) rebolek 13:33:clap: toomasv 13:34:smile: rebolek 13:46can it output a function or a table for use in animations? toomasv 13:53Currently not, but it includes a function which I think can be adjusted for this purpose. rebolek 15:05Ok, that would be useful. toomasv 15:44Something like this? [![bezier-tweens-data](http://vooglaid.ee/red/bezier-tweens-data.gif)](http://vooglaid.ee/red/bezier-tweens-data.gif) greggirwin 15:53More great stuff @toomasv! toomasv 15:55:mouse: greggirwin 16:00I love the visible aspects of many of your experiments. Very helpful for understanding. 16:06@toomasv, from red/red, check out exercism.io. endo64 16:36Very nice @toomasv I also had many similar (R2) stuff for generating sines tables for coding intro/demo or games. mostly combining two or three sines tables, draws its graph and export as source code format. BeardPower 16:46@toomasv Nice! Reminds me to work on my tweens and tween editor, once I have time :+1: toomasv 17:30Thanks! @endo64 I'll try to add different types of graphs and higher order beziers too. Let's see. @BeardPower Got inspired by looking at your earlier experiments. Started with this: [![tweens](http://vooglaid.ee/red/tweens.gif)](http://vooglaid.ee/red/tweens.gif) 17:55@greggirwin Impressive. Something to get inspired by perhaps. planetsizecpu 18:01@toomasv perfect stuff 👌 BeardPower 18:34@toomasv Keep it coming :smile: 18:35I wrote some audio visualizer down on paper. Once Red has audio, it would be nice to combine it with FFT and tweens for some great effects. greggirwin 19:08Great stuff guys. toomasv 20:54@qtxie There seems to be a bug in smooth cubic bezier curv: [![smooth-cubic-bezier-bug](http://vooglaid.ee/red/smooth-bezier-bug.png)](http://vooglaid.ee/red/smooth-bezier-bug.png) At point 4 smooth curv joins curve correctly. But at point 6, where another smooth curv joins the previous one, smoothness is broken. :( Is it a bug or am I doing something wrongly? I tried equivalent code in svg and there it worked. Here is the code to try: view [ at 0x0 box 500x500 draw [ shape [move 0x250 curve 50x100 100x300 150x250 curv 250x300 300x250 curv 400x300 450x250 move 10x200] text 10x240 "1" circle 0x250 4 text 60x90 "2" circle 50x100 4 text 110x290 "3" circle 100x300 4 text 160x240 "4" circle 150x250 4 text 260x290 "5" circle 250x300 4 text 310x240 "6" circle 300x250 4 text 410x290 "7" circle 400x300 4 text 460x240 "8" circle 450x250 4 ] ] greggirwin 21:10@qtxie ? Saturday 28th July, 2018 qtxie 01:20@toomasv Looks like a bug, please open a ticket. endo64 07:22On R2 it looks as expected. 07:22[![image.png](https://files.gitter.im/red/red/gui-branch/xP8r/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/xP8r/image.png) toomasv 09:01Thanks @endo64! #3486 luce80 14:30@toomasv I also was inspired by previous "tweening" conversations : http://www.rebol.org/view-script.r?script=tweener.r . When you will publish your work I wil surely "grab" some ideas ;) toomasv 16:55@luce80 Very nice! My unfinished experiments are in gists: [bezier](https://gist.github.com/toomasv/3c08a0815f80f2e8e84784fc49e7d5cc) and [pennerian](https://gist.github.com/toomasv/5da7748d6ba23283f7033a8f268b76ed) greggirwin 18:17@luce80, that's fantastic! I got an error trying frames, but the idea is lovely, with the button highlight fades and everything. It would be interesting, as the new profile work continues, to look at real use cases, and see if things like having return in @toomasv's code are nice for being explicit, or if they have enough overhead (should be *very* small) to warrant removing. Unless you have a *lot* of things easing and tweening, I can't imagien it making a difference. I just so rarely use return that I noticed it. 18:18For those who know this area, are their friendlier names that map to the easing algos? Monday 30th July, 2018 toomasv 10:54I'd like to have your thoughts on [gather](https://gist.github.com/toomasv/b0d0ea794b9a4fa5860678a5bba4cb44) function. Instead of calculating points via mathematical formula it reads points directly from the provided graph. Is it usable in real situations? What are cons and pros? What other interesting usages might it have? Below are some examples of easing animations using gather: prg: [view/tight [box 220x40 draw [fill-pen red circle 10x20 5] [tick: 0 face/rate: 32] on-time [either tick < 199 [ face/draw/4: as-pair points/(tick: tick + 1) + 10 20 ][ face/rate: none ]]]] points: gather [200x200 arc 0x199 199x199 -90 90] do copy/deep prg [![gather-easeOutCirc](http://vooglaid.ee/red/gather-easeOutCirc.gif)](http://vooglaid.ee/red/gather-easeOutCirc.gif) points: gather [200x200 arc 199x0 199x199 180 -90] do copy/deep prg [![gather-easeInCirc](http://vooglaid.ee/red/gather-easeInCirc.gif)](http://vooglaid.ee/red/gather-easeInCirc.gif) points: gather [200x200 curve 0x0 150x0 50x199 199x199] do copy/deep prg [![gather-easeInOutCurve](http://vooglaid.ee/red/gather-easeInOutCurve.gif)](http://vooglaid.ee/red/gather-easeInOutCurve.gif) greggirwin 17:57The comments helped me a lot in understanding it @toomasv. Thanks for adding those. I'm anxious to see what others think. toomasv 18:21Thanks for looking into it! Here is another example with multiple easied attributes: do %gather.red x-points: gather [361x361 curve 0x0 0x180 360x180 360x360] r-points: gather [361x361 arc 0x360 360x360 -90 90] c-points: gather [361x256 arc 0x255 360x255 -90 90] view/tight [ box 410x60 draw [fill-pen 255.0.0 translate 10x15 [rotate 0 15x15 box 0x0 30x30]] [tick: 0 face/rate: 64] on-time [ either tick < 361 [ face/draw/4/x: x-points/(tick: tick + 1) + 10 face/draw/5/2: r-points/:tick face/draw/2/1: 255 - c-points/:tick face/draw/2/3: c-points/:tick ][ face/rate: none ] ] ] [![gather-multi](http://vooglaid.ee/red/gather-multi.gif)](http://vooglaid.ee/red/gather-multi.gif) greggirwin 18:28*That* is cool. toomasv 18:28:smile: greggirwin 18:33Now I have to try and visualize the curves the collected points come from. It's like an easing biorhythm. :^) 18:38 x-points: [curve 0x0 0x180 360x180 360x360] r-points: [arc 0x360 360x360 -90 90] c-points: [arc 0x255 360x255 -90 90] view compose/deep [ base 400x400 draw [(x-points)(r-points)(c-points)] ] toomasv 18:39:+1: 18:44[![gather-multi](http://vooglaid.ee/red/gather-multi.png)](http://vooglaid.ee/red/gather-multi.png) greggirwin 19:16 x-points: [pen red text 0x250 "X pos" curve 0x0 0x180 360x180 360x360] r-points: [pen green text 0x275 "Rotation" arc 0x360 360x360 -90 90] c-points: [pen blue text 0x300 "Color" arc 0x255 360x255 -90 90] view compose/deep [ base 360x360 draw [(x-points)(r-points)(c-points)] ] 19:17[![image.png](https://files.gitter.im/red/red/gui-branch/Fkov/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/Fkov/image.png) toomasv 19:26Box size has to be 361 to show entire graph. greggirwin 19:37:+1: Tuesday 31st July, 2018 toomasv 06:36With slight modification the above three-color graph can now also be used by [gather](https://gist.github.com/toomasv/b0d0ea794b9a4fa5860678a5bba4cb44): img: draw 361x361 [ anti-alias off pen red curve 0x0 0x180 360x180 359x360 pen blue arc 0x360 360x359 -90 90 pen green arc 0x255 360x255 -90 90 ] red-points: gather/color img 255.0.0 blue-points: gather/color img 0.0.255 green-points: gather/color img 0.255.0 view/tight [ box 410x60 draw [fill-pen 255.0.0 translate 10x15 [rotate 0 15x15 box 0x0 30x30]] [tick: 0 face/rate: 64] on-time [ either tick < 361 [ if r: red-points/(tick: tick + 1) [face/draw/4/x: r + 10] face/draw/5/2: blue-points/:tick if g: green-points/:tick [face/draw/2/1: 255 - g] face/draw/2/3: green-points/:tick ][ face/rate: none ] ] ] greggirwin 17:46Things move fast around here. :^) BeardPower 18:49Stop him! I need to catch up! Saturday 4th August, 2018 ldci 18:55RedCV: General update wit a lot of new samples here: Github https://github.com/ldci/redCV 18:56RedCV: General update with a lot of new samples here: Github https://github.com/ldci/redCV greggirwin 19:09Thanks @ldci! Sunday 5th August, 2018 meijeru 10:34Bug in /samples/video/cam.red line 12: font-size: 12 the : needs to go. ldci 15:11Thanks Rudolf Monday 6th August, 2018 ldci 05:45@meijeru : bug corrected with a new version of cam.red on Github. Friday 10th August, 2018 endo64 13:54Is there a way to make multiple selection on text-list, by CTRL key: text-list data ["One" "Two" "Three"] toomasv 14:57I think there is, not directly, but in half an hour I can check endo64 15:14Would be great, thanks @toomasv toomasv 15:49@endo64 Try this: do %concat.red ; why-not? key: none view [ below text-list data ["One" "Two" "Three"] [ sel/text: case [ find [left-control right-control] key [ concat/with sel/text pick face/data face/selected newline ] 'else [pick face/data face/selected] ] ] on-key-down [key: event/key] on-key-up [key: none] return text "Selection:" space 0x0 sel: text 80x110 ] 16:56Here is a style with ctrl and shift selections: view [ style multi-selection-text-list: text-list extra object [key: none selected: none selection: copy []] on-select [ face/extra/selected: face/selected ] on-change [ case [ find [left-control right-control] face/extra/key [ append face/extra/selection copy pick face/data face/selected ] find [left-shift right-shift] face/extra/key [ append face/extra/selection copy/part at face/data ( minimum: min face/extra/selected face/selected ) + either face/extra/selected < face/selected [1][0] (max face/extra/selected face/selected) - minimum ] 'else [append clear face/extra/selection copy pick face/data face/selected] ] probe face/extra/selection ] on-key-down [face/extra/key: event/key] on-key-up [face/extra/key: none] multi-selection-text-list data ["One" "Two" "Three" "Four" "Five" "Six" "Seven"] ] 18:34Little correction in center: copy/part at face/data ( min face/extra/selected face/selected ) + either face/extra/selected < face/selected [1][0] absolute face/extra/selected - face/selected Saturday 11st August, 2018 endo64 01:55@toomasv Thanks a lot. But the selected items are not visually selected. toomasv 03:39@endo64 You are welcome! Unfortunately yes, visual clues are missing. I'll try to mend this, but can do this only later today. 15:54@endo64 [Here](https://gist.github.com/toomasv/afa3e5a34edb8c626df5902e0efb78ee) it is: [![multi-selection-text-list](http://vooglaid.ee/red/multi-selection-text-list.gif)](http://vooglaid.ee/red/multi-selection-text-list.gif) I'm sure it can be mutch improved, but it kind of works. A naive imitation of how the real thing would work. Smaller single multi-selects work well it seems. But there are problems with longer lists scrolling and also if several multi-selection-text-lists are created - then events get somehow out of hand. I don't know if anything can be done about the first problem. Second one needs some sorting out. endo64 17:06@toomasv Wow that is a nice solution! You are drawing selection background onto text-list? toomasv 17:07@endo64 Yes, I am drawing box and white selected text upon text-list. Downside is it cannot be scrolled :( (at least I don't know yet how to do this) endo64 17:13Thank you very much for your time and effort. That gives nice ideas. I'll use 2 text-lists and move items between them. Until we have a native multi-text-list. toomasv 17:14Beware - as I said there are problems with multiple text-lists endo64 17:14There is also checkboxed-list on Windows, not sure if other platforms have that component natively. greggirwin 19:24@toomasv, the king of clever workarounds. :^) toomasv 19:32 :neckbeard: Monday 13th August, 2018 Rebol2Red 23:02Rotate a picture using draw. lion: load-thru https://cdn.24.co.za/files/Cms/General/d/5441/9fe05948954c41bfa14866238a46816b.jpg im: make image! 300x300 draw im [translate 300x0 rotate 90.0 image lion] view/tight [image im] If i look through a magnifying glass i can see the picture isn't exactly aligned. There is one white pixelline on the leftside of the picture. Am i doing something wrong? Remark: The size of the lion picture is exactly 300x300 Tuesday 14th August, 2018 greggirwin 02:49Are you sure it's not part of the original image? toomasv 10:27@Rebol2Red For some reason one pixel from top of picture turns white on rotation. :hushed: Maybe bug? If you draw box around the image, it is seen that the pixel is not cut, as black border fills this space: view/tight [box 300x300 draw [translate 299x0 rotate 90 image lion box 0x0 299x299]] If you want to get rid of the white line you can use a smaller box: view/tight [box 299x300 draw [translate 299x0 rotate 90 image lion]] Or view/tight [box 299x300 draw [transform 90 1 1 299x0 image lion]] Rebol2Red 11:50@greggirwin I am sure it happens on all images test300x300: load-thru https://www.silhouette-winkel.com/Files/2/79000/79511/ProductPhotos/300x300/279555421.jpg im: make image! 300x300 draw im [translate 300x0 rotate 90.0 image test300x300] view/tight [image im] @toomasv But that is a workaround which i think should not be necessary toomasv 12:11@Rebol2Red Here is hard proof that color changes: im2: copy/part lion 10x10 probe im2 make image! [10x10 #{ BDB6AEBEB7AFBDB9B0BEBAB1BDB9B0BBB7AEBAB3ABB8B1A9BBB2ABB9B0A9 BEB7AFBFB8B0BEBAB1BEBAB1BDB9B0BBB7AEBAB3ABB9B2AABBB2ABBAB1AA BEB7AFBFB8B0BFBBB2BFBBB2BEBAB1BCB8AFBBB4ACB9B2AABCB3ACBAB1AA BFB8B0C0B9B1BFBBB2C0BCB3BFBBB2BDB9B0BCB5ADBAB3ABBDB4ADBBB2AB C0B9B1C1BAB2C1BDB4C1BDB4C0BCB3BEBAB1BDB6AEBCB5ADBEB5AEBCB3AC C1BAB2C2BBB3C2BEB5C2BEB5C1BDB4BFBBB2BEB7AFBDB6AEBFB6AFBDB4AD C0BCB1C1BDB2C2BEB3C3BFB4C2BEB3C0BCB1BFB8AEBDB6ACC0B7AEBEB5AC C1BDB2C2BEB3C3BFB4C3BFB4C2BEB3C0BCB1C0B9AFBEB7ADC0B7AEBFB6AD C3BFB3C2BEB2C2BEB2C1BDB1C0BCB0BFBBAFC0BAAEC0BAAEBDB5AABDB5AA C3BFB3C3BFB3C2BEB2C1BDB1C0BCB0BFBBAFC1BBAFC0BAAEBDB5AABDB5AA }] im3: draw 10x10 [transform 90 1 1 10x0 image im2] probe im3 make image! [10x10 #{ FFFFFFC3BFB3C3BFB3C1BDB2C0BCB1C1BAB2C0B9B1BFB8B0BEB7AFBEB7AF FFFFFFC3BFB3C2BEB2C2BEB3C1BDB2C2BBB3C1BAB2C0B9B1BFB8B0BFB8B0 FFFFFFC2BEB2C2BEB2C3BFB4C2BEB3C2BEB5C1BDB4BFBBB2BFBBB2BEBAB1 FFFFFFC1BDB1C1BDB1C3BFB4C3BFB4C2BEB5C1BDB4C0BCB3BFBBB2BEBAB1 FFFFFFC0BCB0C0BCB0C2BEB3C2BEB3C1BDB4C0BCB3BFBBB2BEBAB1BDB9B0 FFFFFFBFBBAFBFBBAFC0BCB1C0BCB1BFBBB2BEBAB1BDB9B0BCB8AFBBB7AE FFFFFFC1BBAFC0BAAEC0B9AFBFB8AEBEB7AFBDB6AEBCB5ADBBB4ACBAB3AB FFFFFFC0BAAEC0BAAEBEB7ADBDB6ACBDB6AEBCB5ADBAB3ABB9B2AAB9B2AA FFFFFFBDB5AABDB5AAC0B7AEC0B7AEBFB6AFBEB5AEBDB4ADBCB3ACBBB2AB FFFFFFBDB5AABDB5AABFB6ADBEB5ACBDB4ADBCB3ACBBB2ABBAB1AABAB1AA }] im3: draw 10x10 [transform 90 1 1 9x0 image im2] probe im3 make image! [10x10 #{ C3BFB3C3BFB3C1BDB2C0BCB1C1BAB2C0B9B1BFB8B0BEB7AFBEB7AFFFFFFF C3BFB3C2BEB2C2BEB3C1BDB2C2BBB3C1BAB2C0B9B1BFB8B0BFB8B0FFFFFF C2BEB2C2BEB2C3BFB4C2BEB3C2BEB5C1BDB4BFBBB2BFBBB2BEBAB1FFFFFF C1BDB1C1BDB1C3BFB4C3BFB4C2BEB5C1BDB4C0BCB3BFBBB2BEBAB1FFFFFF C0BCB0C0BCB0C2BEB3C2BEB3C1BDB4C0BCB3BFBBB2BEBAB1BDB9B0FFFFFF BFBBAFBFBBAFC0BCB1C0BCB1BFBBB2BEBAB1BDB9B0BCB8AFBBB7AEFFFFFF C1BBAFC0BAAEC0B9AFBFB8AEBEB7AFBDB6AEBCB5ADBBB4ACBAB3ABFFFFFF C0BAAEC0BAAEBEB7ADBDB6ACBDB6AEBCB5ADBAB3ABB9B2AAB9B2AAFFFFFF BDB5AABDB5AAC0B7AEC0B7AEBFB6AFBEB5AEBDB4ADBCB3ACBBB2ABFFFFFF BDB5AABDB5AABFB6ADBEB5ACBDB4ADBCB3ACBBB2ABBAB1AABAB1AAFFFFFF }] Rebol2Red 12:14@toomasv @greggirwin Should i file an issue? toomasv 12:21I think so. From above it is clear that in first rotation upper row from original is lost and white row is added into bottom. In second rotation upper row is just overwritten with white. Rebol2Red 12:47@toomasv @greggirwin https://github.com/red/red/issues/3504 greggirwin 15:44Thanks to both of you for digging in to get the details! Rebol2Red 17:07 im1: make image! 100x100 im2: make image! 100x100 im1/rgb: red im2/rgb: blue view [ text "I want the text below the pictures" return image im1 text "RED" return image im2 text "BLUE" return ] I am always struggling with across and below to get things right. This time i want the text "RED" below the red picture and the text "BLUE" below the blue picture. Probably a pane or group-box is better suited but even then i can't get it right. greggirwin 17:12 im1: make image! 100x100 im2: make image! 100x100 im1/rgb: red im2/rgb: blue view [ below text "I want the text below the pictures" return image im1 text "RED" return image im2 text "BLUE" return ] Rebol2Red 17:13I forgot to mention that i want the images besides each other. greggirwin 17:14I don't know if guide is planned for VID, but it also helped in R2 VID. Red has better panel support, with options to help in this scenario. https://doc.red-lang.org/en/vid.html#_panels Rebol2Red 17:15Ok, but i have to use across and below in the panel? greggirwin 17:16 im1: make image! 100x100 im2: make image! 100x100 im1/rgb: red im2/rgb: blue view [ text "I want the text below the pictures" return panel 2 [ across image im1 image im2 text "RED" text "BLUE" ] ] 17:18Across is the default, but it's not bad to include it, as it acts like a comment to show intent. Rebol2Red 17:21Thank you. Why didn't i think of using panel 2 for 2 images?! Maybe because it is not mentioned in the documentation. I have used it before but forgotten it after not using it for a while. Got a bit rusty. greggirwin 17:28We all do that. So many great features that we can't remember them all. 17:31I'm sure @mikeparr would be glad for you to write up a couple examples for http://www.red-by-example.org/vid.html or http://www.red-by-example.org/index.html#0panel Wednesday 15th August, 2018 Rebol2Red 06:55If you are struggling with layout commands like across, below etc. than visit this excellent visual explaing site http://helpin.red/Layoutcommands.html 07:34Is with removed from the latest Red? a: 12 b: 13 view/no-wait [ base with [ size: a * 40x40 color: b * 8.20.33 ] ] *** Script Error: VID - invalid syntax at: [with [size: a * 40x40 color: b * 8.20.33]] *** Where: do *** Stack: view layout cause-error endo64 07:56@Rebol2Red Works for me. toomasv 09:00@Rebol2Red Works here too (W10) greggirwin 18:23@Rebol2Red "latest" meaning automated builds or old stable build? gltewalt 19:09It works in simple-gc GUI console. Red 0.6.3 for Windows built 9-Aug-2018/16:14:38-06 Rebol2Red 19:10Can you tell me which Red version i should download, last-stable or automated build? 9214 19:10@Rebol2Red automated. gltewalt 19:11Automated Build is usually best. Rebol2Red 19:22Thanks, with and also write/info (to write http-requests) now works. Great! Always thought stable was the best. endo64 19:28Nope, automated build is usually stable enough and more feature complete and more bug free. Saturday 18th August, 2018 Rebol2Red 11:35 ;----------------------------------------------------------------------- ; INSIDE AREA - CHECKS IF (X,Y) IS WITHIN AREA (X1,Y1) - (X2,Y2) ;----------------------------------------------------------------------- inside-area: func [ x1y1 x2y2 ][ x1: x1y1/1 y1: x1y1/2 x2: x2y2/1 y2: x2y2/2 if all [x >= x1 y >= y1 x <= x2 y <= y2][return true] return false ] ;----------------------------------------------------------------------- compartment1: make image! 300x300 repeat i 300 * 300 [ compartment1/(i): 255.200.200 ] compartment2: make image! 300x300 repeat i 300 * 300 [ compartment2/(i): 200.200.255 ] ;----------------------------------------------------------------------- piece1: make image! 100x100 repeat i 100 * 100 [ piece1/(i): 200.255.200 ] piece2: make image! 100x100 repeat i 100 * 100 [ piece2/(i): 252.252.165 ] ;----------------------------------------------------------------------- view [ size 1350x360 at 030x030 image compartment1 "COMPARTMENT1" at 360x030 image compartment2 "COMPARTMENT2" at 690x030 piece1: image piece1 "PIECE1" loose on-drop [ x: piece1/offset/x y: piece1/offset/y ; put in compartment1 piece1 if inside-area 030x030 360x360 [ piece1/offset/x: 030 piece1/offset/y: 030 ] ; put in compartment2 piece1 if inside-area 360x030 660x360 [ piece1/offset/x: 360 piece1/offset/y: 030 ] ] at 1020x030 piece2: image piece2 "PIECE2" loose on-drop [ x: piece2/offset/x y: piece2/offset/y ; put in compartment1 piece2 if inside-area 030x030 360x360 [ piece2/offset/x: 030 piece2/offset/y: 030 ] ; put in compartment2 piece2 if inside-area 360x030 660x360 [ piece2/offset/x: 360 piece2/offset/y: 030 ] ] ] This is a tough one (at least for me) Start this program You can drag and drop piece1 onto compartment1 or onto compartment2 and drag and drop piece2 onto compartment1 or onto compartment2. After playing around you can see that the program allows for being two pieces on one compartment. (One piece is not visible because it is under the other piece). This is not allowed (by me). So i want to detect if compartment1 already contains a piece and if so do not place a piece over there and also if compartment2 already contains a piece do not place a piece over there. Looks simple to program but it ain't. I have'nt found a solution yet, can you? endo64 13:01@Rebol2Red I think your inside-area function doesn't work correctly. If you replace if inside-area ... parts as below, it works as you expected: on-drop [ x: piece1/offset/x y: piece1/offset/y ; put in compartment1 piece1 if within? piece1/offset 030x030 300x300 [ piece1/offset/x: 030 piece1/offset/y: 030 ] ; put in compartment2 piece1 if within? piece1/offset 360x030 300x300 [ piece1/offset/x: 360 piece1/offset/y: 030 ] ] 13:02I just used within? function and offset & sizes of the images. toomasv 13:03@Rebol2Red Leving aside the question of why not to use faces (e.g. panels and boxes) I think you have to check what color is the compartment at the point you want to drop the piece. On phone now so can’t play with it 9214 13:19@Rebol2Red mark compartments as free / occupied and place piece in the nearest free compartment available. Step aside from VID and View and model this in terms of series and its elements. Rebol2Red 20:10Thanks for all your input! @endo64 Within is a good replacement of inside-area. Thanks for that. Note: Inside-area is a well known function in c and freebasic so i have used it before. Maybe i forgot the exact code especially the >= and <= but then there will only be one pixelline wrong so i think this code is not the reason for this behavior. But i will definately look into your code. @toomasv I think you have a point, so certainly not inside the on-drop event. But i like to keep the on-drop code (there is a good reason, only to explain when you see and dig into the full code ~500 lines, i do not like to bother you with unfinished code). Now the question is where should i put the checking code? @9214 Good point. I have a look into placing a piece in the nearest free compartment. The same question as @toomasv Where to put the checking code? 21:03@endo64 If this is the code as you suggested compartment1: make image! 300x300 repeat i 300 * 300 [ compartment1/(i): 255.200.200 ] compartment2: make image! 300x300 repeat i 300 * 300 [ compartment2/(i): 200.200.255 ] ;----------------------------------------------------------------------- piece1: make image! 100x100 repeat i 100 * 100 [ piece1/(i): 200.255.200 ] piece2: make image! 100x100 repeat i 100 * 100 [ piece2/(i): 252.252.165 ] ;----------------------------------------------------------------------- view [ size 1350x360 at 030x030 image compartment1 "COMPARTMENT1" at 360x030 image compartment2 "COMPARTMENT2" at 690x030 piece1: image piece1 "PIECE1" loose on-drop [ x: piece1/offset/x y: piece1/offset/y ; put in compartment1 piece1 if within? piece1/offset 030x030 300x300 [ piece1/offset/x: 030 piece1/offset/y: 030 ] ; put in compartment2 piece1 if within? piece1/offset 360x030 300x300 [ piece1/offset/x: 360 piece1/offset/y: 030 ] ] at 1020x030 piece2: image piece2 "PIECE2" loose on-drop [ x: piece2/offset/x y: piece2/offset/y ; put in compartment1 piece2 if within? piece2/offset 030x030 300x300 [ piece2/offset/x: 030 piece2/offset/y: 030 ] ; put in compartment2 piece2 if within? piece2/offset 360x030 300x300 [ piece2/offset/x: 360 piece2/offset/y: 030 ] ] ] ;----------------------------------------------------------------------- I get exactly the same behavior. You can drag and drop piece1 onto piece2 in compartment1 or drag and drop piece1 onto piece2 in compartment2. Two pieces in one compartment, which is not allowed. So if piece1 is already in compartment1 then piece2 can't be dropped into compartment1 only into compartment2. greggirwin 21:10Where are you checking if a piece is already in a compartment? Rebol2Red 21:12@greggirwin I check inside the on-drop event which does not work. I think it is because of the event. greggirwin 21:13I see you checking where the drop happens, but not the state of the compartment. Rebol2Red 21:17@greggirwin In my example i did'nt do any checking because i don't know how to do this right. I have tried al kinds of code with switches and so on but none worked. So i asked for help over here. greggirwin 21:18Give me a minute... Rebol2Red 21:22If you can do this in a minute then Wow. I already tried this for hours. :) greggirwin 21:27Almost there. 21:34I have to run, so this is incomplete. Nothing is ever as easy as you think. :^) 21:34 compartments: [compartment1 compartment2] in-compartment?: func [comp piece][ within? piece/offset comp/offset comp/size ] set-piece: func [comp piece][ piece/offset: comp/offset foreach c reduce compartments [ if c/extra = piece [c/extra: none] ] comp/extra: piece ] already-has-piece?: func [comp][ not none? comp/extra ] ok-to-drop?: func [comp piece][ all [ in-compartment? comp piece not already-has-piece? comp ] ] drop-piece: func [piece][ if ok-to-drop? compartment1 piece [set-piece compartment1 piece] if ok-to-drop? compartment2 piece [set-piece compartment2 piece] ] ;----------------------------------------------------------------------- i-compartment1: make image! 300x300 repeat i 300 * 300 [ i-compartment1/(i): 255.200.200 ] i-compartment2: make image! 300x300 repeat i 300 * 300 [ i-compartment2/(i): 200.200.255 ] ;----------------------------------------------------------------------- i-piece1: make image! 100x100 repeat i 100 * 100 [ i-piece1/(i): 200.255.200 ] i-piece2: make image! 100x100 repeat i 100 * 100 [ i-piece2/(i): 252.252.165 ] ;----------------------------------------------------------------------- view [ size 1350x360 at 030x030 compartment1: image i-compartment1 "COMPARTMENT1" at 360x030 compartment2: image i-compartment2 "COMPARTMENT2" at 690x030 piece1: image i-piece1 "PIECE1" loose on-drop [drop-piece face] at 1020x030 piece2: image i-piece2 "PIECE2" loose on-drop [drop-piece face] ] Rebol2Red 21:35Thanks, i examine your code. greggirwin 21:35The main thing I wanted to show here, is a refactoring into pieces, so you can see the steps you need to take. What's missing now is proper state management when pieces are dropped but can't be set. Rebol2Red 21:36Thanks, i examine your code and hopefully can find some clues. greggirwin 21:37I changed the image names, because I was confused by the compartment names not being reused, but piece names were, for the faces. 21:39As you work through problems, talk through it. "When they drop a piece I need to..." and the next thing is likely a candidate for a function. Give it a name and put a placeholder in your code. Keep doing that and you'll find lots of little pieces that eventually solve your problem, and lead to more pieces. 21:41You could also flip it around, so the pieces know their locations. 21:42That's part of the process. Figuring out the best way to express all the things you need to know and manage. If you end up adding more pieces, which seems likely, think about the general data structure that represents the state of things. Rebol2Red 21:52You are right that i use 4 pieces and 4 compartments. But the problem is the same for 2 pieces and 2 compartments. Good point about states maybe a finite-state machine is the right way to takkle this. 22:11@greggirwin I understand your confusion about the compartment names. I did'nt reused the compartment names because the compartments are always at the same place (static) Only the pieces changes from place. 22:54@toomasv Your suggestion about using the color of the compartment does not work in my final program. I only used colors in my example to get a more visual clear picture of what the problem is. Please, do'nt waste your time on this. Sunday 19th August, 2018 planetsizecpu 07:46@greggirwin Thanks, by just reading your code it has helped me to solve a hidden problem in my forms script, where I did wrong using "on-drop" 👍 greggirwin 08:07:+1: toomasv 15:29Surrexit drawing pad: [![constructing a clock](http://vooglaid.ee/red/draw-clock.gif)](http://vooglaid.ee/red/draw-clock.gif) endo64 16:02This is great @toomasv !! toomasv 16:07Thanks! :smile: planetsizecpu 17:37@toomasv good stuff 17:59[![font-test2.gif](https://files.gitter.im/red/red/gui-branch/MIIl/thumb/font-test2.gif)](https://files.gitter.im/red/red/gui-branch/MIIl/font-test2.gif) 17:59This test wast today, just testing with automatic builds of Red. Can't wait for printing capability 😃 toomasv 18:10@planetsizecpu Nice! greggirwin 18:15Great stuff guys! 18:16I want to be able to use the GIF like a video though. I missed the animation dialog and wanted to go back. :^) BeardPower 21:40Awesome. Monday 20th August, 2018 planetsizecpu 11:05Thanks all folks, these days I'm on holiday, to the beach in and out every day due to too hot weather , willing to test but not so much time to code, so let's better to read the blogs and test all is running fine on automated builds. 🛶 rebolek 11:06> too hot weather Are you on holiday in Central Europe? planetsizecpu 11:08In south Europe, Balearic Islands. rebolek 11:10So it's not *that* hot and there's sea also. Nice. greggirwin 18:07Sounds very nice @planetsizecpu . luis-rj 18:52Spain is beatifull !. Yo suelo veranear en la huerta orgánica de un amigo en Javea enfrente de las Baleares (Javea). Tuesday 21st August, 2018 TimeSlip 00:26@toomasv Your drawing pad is incredible! toomasv 04:36@TimeSlip Thanks! I'm trying to weed out many bugs and streamline it a bit. Saturday 25th August, 2018 ericguedespinto 16:28Hi everyone. I am trying to run a GUI script in macos with a menu actor and when I right click on that widget I get an error NSSoftLinking - The SidecarUI framework's library couldn't be loaded from /System/Library/PrivateFrameworks/SidecarUI.framework/Versions/A/SidecarUI. I am running on a beta version of mojave as well. 16:28Are menu actors supported on macos yet ? or could this be a compatibility issue with the beta version of the macos ? greggirwin 20:14@ericguedespinto, menus should work on MacOS. Are you using the stable release (old) or automated build. If stable, try automated. Lots of fixes in there. Sunday 26th August, 2018 Franktic2 03:16I'm a little with the following: 03:16Red [needs: view] view layout:[ ; across button "View" button "Create" button "Delete" button "button 4" button "Quit" ] 03:19Running this code puts the buttons in line but the Quit button to the right of the create button and the delete button ends up to the far right. If I rename all the buttons, button 1 through to 5, they appear in the correct order. It does not matter whether 'across' is commented out or not. I don't understand the buttons swap. greggirwin 03:30@Franktic2, what you discovered is automatic OS GUI metrics kicking in: https://www.red-lang.org/2017/07/063-macos-gui-backend.html You can turn them off with system/view/VID/GUI-rules/active?: no 03:32I hear @gltewalt already making notes for adding that to official docs. Franktic2 06:29@greggirwin Thanks. I have to go back and re-read the 0.6.3 release notes. ericguedespinto 10:58@greggirwin , Thank for your help. I am using the automated builds, and I also tried in other versions of macOS so I know it is not a problem with mojave beta. What I am trying to do is play a bit with the ide script and attach some menu events. While this works well on windows, it doesn't work on macos. Red [ title: "Red IDE" needs: 'view ] tab1: [ below field area 400x400 ] editor: layout compose/deep/only [ title "Red IDE" below t: tab-panel [ "tab" (tab1) "tab2" (tab1)] on-menu [ print "right click" ] ] editor/menu: [ "File" [ "New" newfile ] ] t/menu: [ "Close" closeTab ] editor/actors: make object! [ on-menu: func [face [object!] event [event!]][ switch event/picked [ newfile [ append t/data "tab" append t/pane make face! [type: 'panel pane: layout/only tab1] ] closeTab [ quit ] ] ] ] view/flags editor [resize] 9214 11:00@ericguedespinto a *minimal* reproducible example would be highly appreciated. :wink: ericguedespinto 11:06@9214 yes, of course. Sorry about that. I changed it above 9214 11:06@ericguedespinto no problem, thanks! greggirwin 17:18@ericguedespinto, thanks for confirming. If it works on Windows, but not Mac, that's worth a ticket (if not already reported). ldci 17:38Dynamic Time Warping (DTW) for redCV (https://github.com/ldci/redCV). Very useful to compare sapes. An image herehttps://pbs.twimg.com/media/DlhWbSNX0AAYd4s.png. Docs and samples updated. Monday 27th August, 2018 planetsizecpu 08:38@ldci 👍 go on, much encouragement! greggirwin 15:57Indeed. Thanks for the update @ldci ! Saturday 1st September, 2018 Rebol2Red 04:29 view [ text-list data ["a" "b" "c"] on-select [ view [ ; remove selected listitem button "remove" [ ; put here some code to remove the selected listitem unview ; closes all windows, why not only the last one? ] ; change selected listitem field "" [ ; put here some code to change the selected listitem unview ; closes all windows, why not only the last one? ] ] ] ] unview closes all windows, why not only the last one opened? toomasv 07:27@Rebol2Red Seems like a bug. With button it works: view [ ;text-list data ["a" "b" "c"] on-select [ button [ 07:44I tried with several other faces too, this problem seems to be with lists only (text-list, drop-list, drop-down). Some weird behaviour with radio also. Rebol2Red 07:52So it's a bug. Many thanks for testing. I will file an issue. Can last a while because i like to do it the proper way (expected behavior etc). 08:04https://github.com/red/red/issues/3526 08:06@toomasv Maybe you can think of a better title for the issue? toomasv 08:15@Rebol2Red :+1: Seems OK. I put a comment on radio there also. endo64 09:57I just tested on Win10, it crashes instead of closing all windows. 10:07Commented on the ticket Sunday 2nd September, 2018 Rebol2Red 05:25Can someone verify this wrong behavior of a text-list (and probably all lists): view [tl: text-list data ["a" "b" "c"] [print tl/selected]] if i click on item "b" i get output, but not when i click again on "b" If so i will comment this on my issue #3526 toomasv 06:00@Rebol2Red It is expected. Your code commands printon selection, i.e. on *new* selection, not on any click. Try implementing on-down for printing click on already selected items. Would need using some flags to avoid repetitive printouts. 06:23@Rebol2Red Better yet, use only on-down knowing that height of each item in selection box is 14 px. You have to map event/offset/y to index. rebolek 07:10How can I change font in gui console? ne1uno 07:11edit cfg? rebolek 07:12Ok, where is this cfg? :) ne1uno 07:16%\ProgramData\Red\console-cfg.red I think it updates as soon as you change settings 07:21maybe you can set font directly in gui-console-ctx rebolek 07:27I’m on mac 07:28ok, I try to find it endo64 08:10@rebolek Can't you change from options menu? Rebol2Red 08:15@toomasv I got it. But i wonder if it's related to my filed issue? I mean if i use on-down in my code then unview works fine. Maybe it is bad programming using unview at an **on-select** event. rebolek 08:18@endo64 there’s no option menu on mac toomasv 09:06@Rebol2Red I think it is bug of on-select. Your code works with on-change and I can't see any reason why it souldn't work with on-select. BTW, here is the snippet alluded to above: view [text-list data ["a" "b" "c"] on-down [print min event/offset/y / 15 + 1 length? face/data]] It is good only for text-list though. Rebol2Red 09:21@toomasv Great! I can really use this. Appreciate your help! But i really think there must be some easier way to select an item even when clicking it twice. Everywhere i see lists which can do this. Maybe by implementing a new kind of event. Wish i could do this myself, but i can't :( toomasv 09:24@Rebol2Red You are welcome! endo64 09:44@Rebol2Red As I see in the source codes there is a line to prevent click event triggering for the same item. So it should be easy to change that, but it is a design choice. Rebol2Red 11:10@toomasv myfont: make font! [size: 20 name: "Consolas"] attachments-data: copy [] view [ title "Email with attachments" text font myfont "Attachment: " attachments: field 800x40 font myfont hint "Name of attachment" ;on-key [if event/key = tab [win/selected: body]] ; only in "real" program on-enter [ append attachments-data attachments/text attachments/data: "" ] return text font myfont "Attachment(s): " attachments-list: text-list 800x300 font myfont data attachments-data on-change [ sel: attachments-list/selected view [ title "Change or remove attachment(s)" bs: button 800x40 font myfont "remove" [ remove find attachments-data attachments-data/(sel) unview ] return text font myfont "Change: " return fs: field 800x40 font myfont "" on-enter [ fs/text: attachments-data/(sel) replace attachments-data attachments-data/(sel) fs/text unview ] return do [fs/text: attachments-data/(sel)] do [win: self win/selected: fs] ] attachments-list/selected: 0 ; <------ important, this makes it work! ] return bm: button font myfont "Show attachments list" [probe attachments-list/data] ] I got things working without offset and a visible selection, maybe you can use this too Remember this is just an excerpt from my program In the "real" program there are more fields etc. and the attachments are ofcourse filenames and there is a lot more code. Usage: Enter attachmentnames into the field by clicking in the field followed by enter The attachmentnames will popup into the text-list You can remove or delete them by clicking on them in the text-list Click at any time on button "Show attachments list" to see the resulting list Note : I know there are other ways to do this for ex. attachments separated by ; and use split in the program etc. I just want to do it this way. toomasv 11:54@Rebol2Red Congratulations! :+1: Friday 7th September, 2018 toomasv 14:56Beginnings of [a simple diagramming tool](https://github.com/toomasv/diager) [![diager](http://vooglaid.ee/red/diager1.png)](http://vooglaid.ee/red/diager1.png) endo64 15:29Cool! can't wait to see the final result! greggirwin 16:19:+1: planetsizecpu 16:22@toomasv seems very clean and nite, push hard 👌 greggirwin 16:27What really excites me about a lot of @toomasv's work, is continued refinement and leverage of things he's built in the past, which are *all* going to be useful when we start building more tools, and as examples for others. Also to show us what libs or dialects might help when building things like this. In the bigger picture, because of Red's data-centric nature, attaching metadata to the underlying data structure used for drawing, makes them useful for all kinds of things or, as he's shown, animating them. Also, the ability to use tools to generate drawing commands visually, which you can then put in other apps, like an interactive code generator. planetsizecpu 16:31Yes, he as become a vid master, no doubt. toomasv 16:36Thanks! Saturday 8th September, 2018 rolandhadinger 21:08Hi. Here's something really old (I don't even remember the year, must have been circa 2005): [Imgur](https://i.imgur.com/RWJlSEh.gifv) 9214 21:08That's impressive, @rolandhadinger ! rolandhadinger 21:11Well. No contender to modern WebGL. greggirwin 21:35@rolandhadinger, :+1:! 21:36There is some great old stuff out there. rolandhadinger 22:46@greggirwin For a while, Rebol was pure bliss. Red has come so far already. greggirwin 22:48Indeed. It would be fun if a graphics-oriented person/people wanted to look at old R2 examples and port them. We could have helpers make lists. Sunday 9th September, 2018 toomasv 04:14@rolandhadinger Great labyrinth ride! Reminds me another one - was it Christmas ride? greggirwin 04:29Yes. I think the Christmas drive was by Anton Rolls. planetsizecpu 08:48Great!, it just remembred to me the old Doom's game handling. 👌 Thursday 13th September, 2018 toomasv 10:57Some box-art: [![diager-box](http://vooglaid.ee/red/diager-box.gif)](http://vooglaid.ee/red/diager-box.gif) rebolek 10:59:) BeardPower 11:00I always wanted to own an original Vooglaid! :smile: 11:01Buy now as long as they are cheap. endo64 11:08@toomasv Is it ReDeluxe Paint?! :O toomasv 11:14:smile: planetsizecpu 11:42Wow! fantastic @toomasv have you used "the nubber" from @greggirwin for resizing? I was looking it, but had lack of time to waste at the moment. toomasv 11:44@planetsizecpu Nay, cooked one myself. planetsizecpu 11:45Bravo! then. BeardPower 12:50@endo64 Reluxe paint ;-) endo64 15:20@BeardPower :D greggirwin 20:15@toomasv Wow! That's great. Make sure @lucindamichele knows about it for the next PR report. 20:15Things like this can be great for visualizing how various elements work together. I love it. Saturday 15th September, 2018 linker_storm_twitter 07:09Hi everybody. Someone knows a grid component for Red (ListView in Win) ? Thanks for your feedback. 9214 08:05@rebolek :point_up: I recall you had something in this regard? ne1uno 08:29maybe here https://gitlab.com/rebolek/ rebolek 10:39@9214 right 10:39@linker_storm_twitter see https://gitlab.com/rebolek/red-styles/blob/master/text-table.red 10:39here are docs https://gitlab.com/rebolek/red-styles/wikis/text-table viayuve 11:09@rebolek any new updates I mean features planned on table? rebolek 11:41@viayuve I am waiting for a feature requests from @GiuseppeChillemi and for final release of GC, because the table has some serious problems with memory consumption, so nothing new recently. 11:41I am open to suggestions of course. viayuve 15:27cool I will just wait until 0.7.0 that is the biggest hurdle I am getting with red for my projects @rebolek so do you I guess. about features some basic CRUD directly from table with basic sorting would be nice. 👍 and may be some cell colours. linker_storm_twitter 16:25@rebolek Thanks, tested "text-table", look promising. GiuseppeChillemi 22:32@rebolek Yes, my company has been under great financial trouble because a couple of our customers had financial trouble too (it's a like a domino effect: when the first fall, all the connected bricks will fall). So, the last 4 months have been very difficult. Now, nothing has changed but I have managed to work under this heavy pressure and constant problems so I have found (created) some time to write the specifications. The document is 60% completed. I suppose it will be 100% in a couple of weeks. Sunday 16th September, 2018 viayuve 04:27@GiuseppeChillemi @rebolek I am so sorry, I thought it was open source project sorry 😐 again. I can't suggest feature than. rebolek 06:29@GiuseppeChillemi no rush, I don't have much time right now anyway. I hope your business gets better soon! 06:29@viayuve it is, what makes you think that it isn't? viayuve 06:58I thought @GiuseppeChillemi is paying you to create that widget. So, for me it was obvious that it was closed source project @rebolek or even if its open source than my features won't get any priority because it was paid project. 07:01@rebolek do we have paid services here ? that. just came to my mind 🤔 rebolek 07:08@GiuseppeChillemi he made a bounty for it and I of course encourage anyone to join ;) But the source is available. I should attach some license to it. viayuve 07:12you mean like $1000 will be paid to whosoever will complete table widget @rebolek wow thats nice concept. GiuseppeChillemi 14:25@viayuve , I have started the bounty and Boleslav created an early version . Then another supporter has joined. We raised the bounty for TEXT-TABLE to be a mix of REBOL3 TEXT-TABLE (made from Boleslav itself) and LIST-VIEW from VID Extension Kit on R2. 14:39The bounty is not like old west Bounties "the first one which will complete" but more like "the one who takes the task and complete it". No one could use the code created from @rebolek until he completes it, or he leaves the project. Then source must have a open licence of the kind where (my requirement): 1) Boleslav Name and Credit should always be included in source, documentation and derivative works 2) Source should be provided if a binary/compiled version is generated and be free for any modification for anyone 3) Same as point 1 for backers/patrons of this and derivate works viayuve 16:11@GiuseppeChillemi very nice dear thanks for bounty briefing GiuseppeChillemi 18:03> @GiuseppeChillemi he made a bounty for it and I of course encourage anyone to join ;) _ 18:04Of course , other coders could join you could and share the bounty with them, It's your choice and freedom. But if you choose finalize the project by yourself the bounty will all your ! 18:04@rebolek 18:08@viayuve > @GiuseppeChillemi @rebolek I am so sorry, I thought it was open source project sorry 😐 again. I can't suggest feature than. Yes you can ! rebolek 18:09@GiuseppeChillemi I of course welcome any contributors and I am willing to share the bounty if anyone's interested to help and gets familiar with the code. So if someone is interested, let me know privately. Once the feature set is defined, we can split the work. And money of course :) 18:12@viayuve You were asking about CRUD - it is possible even now, if you know how. I will add a chapter about it to docs soon. I plan to play with text-table soon anyway because of one project, so the timing is right I guess :) viayuve 18:12@GiuseppeChillemi I am not a programmer or developer so @rebolek can have all bounty ;) but I will suggest a lot of features thats for sure. 18:13Cool I will wait for some nice docs rebolek 18:13@viayuve there is a room for text-table, so we should move with discussion there - https://gitter.im/text-table/Lobby Wednesday 19th September, 2018 ericguedespinto 13:02Hi! I see in the source code a Rich Text Dialect. Can we use it directly as a widget? 9214 13:05@ericguedespinto RTD emits a face object, from what I know. See [here](https://github.com/red/red/wiki/%5BDOC%5D-Rich-Text-support). 13:07 text view [rich-text data [b "hello" /b " " i "from" /i " " red "RTD"]] ericguedespinto 13:09Perfect !!! Thanks Respectech 15:48Is it just me, or is the RTD dialect too clunky? Wouldn't this be better? view [rich-text data [b "hello " i "from " red "RTD"]] toomasv 15:56@Respectech view [rich-text data [b ["hello "] i ["from "] red "RTD"]] greggirwin 16:58@Respectech it will be interesting to see if one of the approaches sees much heavier use. There are pros and cons each way. Personally, I'll have to try both (with an open mind if I can) in practice, though I'm a block fan in my heart. 9214 17:01? >> view [rich-text data [b "gradual " i "style " /b "nesting " /i]] *** Script Error: RTD - invalid syntax at: [/b "nesting " /i] *** Where: do *** Stack: view layout rtd-layout cause-error 17:02If such nesting is not supported, then I don't see a need in / closing tags either. Respectech 17:27I'd like to see this instead: >> view [rich-text data [b ["gradual " i "style" "nesting "]] 17:28Each formatting word should allow one series as an argument. That series could either be a string! or a block!, or other valid series. 17:37In my JSID dialect, which emits HTML, it can handle pretty complicated constructs, like this: jsid [b style "margin-left:10px" red "Red and bold text"] I haven't written a dialect for CSS, so the inline CSS is just like you'd expect in HTML Sunday 23th September, 2018 rebolek 08:22What do I need to do to make this work? >> view [t: rich-text "asdf" on-over [t/text: probe pick [["over"]["away"]] event/away? show t]] 9214 11:34@rebolek not sure what you mean, works here on W10. endo64 11:45@rebolek Works for me too, which part doesn't work for you? Or are you on MacOS? toomasv 12:10@rebolek Try this: view [t: rich-text "asdf" on-over [t/text: probe pick ["over" "away"] event/away? t/data: t/data]] 12:19@9214 @endo64 Did you see t/text changing on over event? I didn't (W10). 9214 12:19@toomasv I see with your example. toomasv 12:21Yes, if t/data is touched, it changes. Otherwise it changes in text facet, but doesn't show the change on screen (and original text remains in handles) 9214 12:22@toomasv I believe this is how rich-text behaves. 12:22https://github.com/red/red/wiki/[DOC]-Rich-Text-support#single-box-mode 12:23If you update text, I don't think data will change in sync. rebolek 14:17@toomasv @endo64 @9214 I probably posted wrong example, I want to change rich text on-over, but it doesn't work for me like this: >> view [t: rich-text data ["asdf"] on-over [t/data: pick [["asdf"]["ghjk"]] event/away? show t]] 9214 14:22@rebolek looks like you need to update both data and text facets: view [t: rich-text "asdf" on-over [t/text: first t/data: probe pick [["asdf"] ["ghjk"]] event/away?]] rebolek 14:24@9214 that works for ["asdf"], but what about [b "asdf" /b]? I get empty face in such case. 9214 14:25Yeah, just checked this. 14:25@toomasv probably might suggest something, I haven't played with RTD much. rebolek 14:26or I may use my Draw-based RTD dialect... greggirwin 14:54Maybe @qtxie will chime in with an answer. toomasv 16:53@rebolek I don't see what you want to achieve. data facet of rich-text takes low-level formatting dialect, as here: view [t: rich-text "Simple example here" with [data: compose [1x6 bold 16x7 250.0.0]] on-over [ change/part at face/text 16 pick ["away" "over"] event/away? tail face/text face/data: face/data ]] rebolek 17:05@toomasv I want to change style of some text with on-over. I'm fine with global on-over, I don't need to check for mouse position. Your example changes text, how do I change style? A omg, what is face/data: face/data? that hurts. toomasv 17:16This changes style: view [t: rich-text "Simple example here" with [data: [1x6 bold 16x7 250.0.0]] on-over [change at face/data 4 pick [0.255.0 0.0.255] event/away?] ] As in this case data facet is changed, the odd face/data: face/data is not needed any more. Don't know if this is a bug, but without touching data facet, rich-text doesn't show changes. qtxie 21:17@toomasv I think it's a bug. I opened a ticket for it. https://github.com/red/red/issues/3542 Monday 24th September, 2018 toomasv 06:37Good, thanks! ericguedespinto 12:51Hi guys! I am trying to programmatically change the layout and I want to bring a button in front of another widget. I tried to change the pane facet of the container but it feels messy. Am I missing an easier way to do this? Sorry if it is a daft question but a could not find how to change the z-index of faces in the docs rebolek 12:58Hi @ericguedespinto, z-index is determined by order in pane block. 12:58just move the element towards end to bring it to front. toomasv 13:20@ericguedespinto :point_up: [May 15, 2018 5:45 AM](https://gitter.im/red/red/gui-branch?at=5afa49ddf04ce53632d9b574) This is a basic example. There is more if you scroll forward a bit. And there is [a more complex example](https://gist.github.com/toomasv/fdac9ae51f60dac58ce69483e4a055c1). ericguedespinto 13:26@rebolek Thanks but I tried that before: I am just hitting some unexpected result in my code. This is a cut down version but gets to the point. start: 0x50 win: [ tools: panel [ ] return at :start area: area 200x200 at 150x0 h: button "hide" [ tools/visible?: not tools/visible? (either h/text = "hide" [ area/offset/y: area/offset/y - 50 tools/parent/size/y: tools/parent/size/y - 50 h/text: "show" probe tools/parent/pane ][ h/text: "hide" area/offset/y: area/offset/y + 50 tools/parent/size/y: tools/parent/size/y + 50 ]) ] ] view win If start: 0x50, than the area widget is placed initially bellow the button and when I click the button, the area gets in front of the button. I am also probing the windows pane block and the button is last, but still behind the area widget. If, however, start: 0x0, the button is always in front of the area widget. The pane block is always the same, whatever :start value is, and follows the order the widgets were described in the win layout. Could this be an issue with the layout engine? I am using MacOS with an up-to-date red toomasv 13:39@ericguedespinto In W10, after clicking on button, area will move higher, but remains behind the button as expected. If this is not the case on MacOS, this may be an issue. ericguedespinto 13:42[![Screen Shot 2018-09-24 at 14.40.34.png](https://files.gitter.im/red/red/gui-branch/17l6/thumb/Screen-Shot-2018-09-24-at-14.40.34.png)](https://files.gitter.im/red/red/gui-branch/17l6/Screen-Shot-2018-09-24-at-14.40.34.png) 13:43>> system/build == make object! [ date: 23-Sep-2018/13:24:35+01:00 git: make object! [ 13:57If added an issue on github (#3543) toomasv 14:48@qtxie Would it be possible to make event info available on menu event? Currently e.g. event/offset is not available on right-click if menu is defined on face, and it is impossible to e.g. insert something on the spot where menu is invoked. rebolek 15:09@qtxie this crashes Red view [t: rich-text "Simple example here" with [data: [1x6 bold 16x7 250.0.0]] on-over [change at face/data 4 pick [red blue] event/away?] ] 15:17where are rich text docs? 9214 15:21@rebolek https://github.com/red/red/wiki/[DOC]-Rich-Text-support rebolek 15:21thanks toomasv 15:46@rebolek low level dialect takes tuples not color-words. rebolek 15:46@toomasv I'm fine with that, however it should result in error and not a crash. toomasv 15:47Ah, yes. Wednesday 26th September, 2018 qtxie 03:20@rebolek It throws an error and crashes. :sweat_smile: Very strange. Thursday 27th September, 2018 qtxie 18:50@toomasv I think it's possible. I'll have a look at it today. toomasv 19:26@qtxie Thanks, @qtxie ! qtxie 23:35@toomasv Now you will get event/offset in both alt-down event and menu event. 23:35 view [ base 100x100 on-alt-down [probe reduce ["right-click" event/offset]] on-menu [probe event/offset] with [menu: ["One" grayone "Two" graytwo]] ] Friday 28th September, 2018 toomasv 11:14@qtxie Splendid! Thank you! 15:23All base menu problems resolved. Great! One question more, @qtxie. Currently on W10 group-box's border is not redrawn while it is resized. Is it a bug or just because group-box is temporal any-way? view [ size 200x200 g: group-box 100x120 brick on-down [ mv: either within? event/offset face/size - 10 10x10 [yes][no] ] all-over on-over [if all [event/down? mv][face/size: event/offset]] ] [![group-box](http://vooglaid.ee/red/group-box1.gif)](http://vooglaid.ee/red/group-box1.gif) qtxie 18:58@toomasv Maybe a bug. I'm not sure. toomasv 20:22I uploaded the [layout editor](https://github.com/toomasv/layout-editor). It works with latest build. Earlier ones will rise errors as some functionality appeared only after @qtxie's recent improvements. Many thanks! Main omission at the moment is lack of persistence. Also, no comments on code and no explanations in readme yet, sorry. I will work on it. There are surely many other omissions and bugs. Red is so rich that I have managed to try out only a small set of possibilities, but it has been lot of fun (and some headache too). I would appreciate any suggestions and constructive critique. Monday 1st October, 2018 sylvievathoux 17:06Hi everybody. I guess the following should be for @qtxie, but any help is welcome: I can't clear text-list/data more than once in the script below, the second attempt does not work, and the third crashes the script... cnt: 1 view [ below canvas: base 400x200 on-down [ either empty? tl/data/(cnt) [ append tl/data/(cnt) rejoin [cnt " ->" to-string event/offset " "] ][ append tl/data/(cnt) rejoin [" ->" to-string event/offset " "] ] ] tl: text-list 400x200 data ["" "" "" "" "" "" "" "" "" ""] font-size 9 across button "Clear" [ tl/data: copy ["" "" "" "" "" "" "" "" "" ""] cnt: 1 ] button "Add" [cnt: min 10 cnt + 1] ] I'm working on OSX and W10 (same behavior). 9214 17:13@sylvievathoux can you reproduce it with the latest build? sylvievathoux 17:15I'm going to try right now... 17:24Same behavior with latest build. I'm stuck... 9214 17:25use copy/deep greggirwin 17:25Use copy/deep in Clear. 17:25Bah, too slow. 9214 17:26Crash was probably related to the fact that you used an older build without garbage collector, and that you keep accumulating content in the nested strings, which slowly ate up all memory. greggirwin 17:28This is interesting though, as that wasn't obvious to me at first either. It seems like a bug. Those series should not ref the same strings inside. 9214 17:29@greggirwin it starts to reference them after the first usage of Clear. greggirwin 17:29Oh, yeah, duh. No coffee yet. 9214 17:29Take your time :^) sylvievathoux 17:31copy/deep works fine! For the moment... Love you Vlad :)) 9214 17:53 text list: loop 10 [append [] make string! 0] size: 400x200 view compose/deep/only [ below base size on-down [ append entry: list/data/(list/extra) trim reduce [ if empty? entry [list/extra] space '-> event/offset space ] ] list: text-list size data (list) font-size 9 extra 1 across button "Clear" [list/data: copy/deep (list) list/extra: 1] button "Add" [list/extra: min length? list/data 1 + list/extra] ] sylvievathoux 18:38Clear, neat, concise. So Red! Thanks Vlad qtxie 19:05@sylvievathoux A workaround is to use copy/deep. tl/data: copy/deep ["" "" "" "" "" "" "" "" "" ""] 9214 19:06:smile_cat: qtxie 19:06Ah, I forgot to refresh the page. :sweat_smile: toomasv 20:14A different approach: size: 400x200 view [ below base size on-down [ append row: last tl/data rejoin [ either empty? row [form length? tl/data][] #" " '-> event/offset ] ] tl: text-list size data [""] across button "Clear" [append clear tl/data copy ""] button "Add" [if 10 > length? tl/data [append tl/data copy ""]] ] greggirwin 22:40R2 had a nice array func which, while maybe not a *great* name, was handy. I have a Red port somewhere. Tuesday 2nd October, 2018 rebolek 03:17 >> array: func [size /initial value][head insert/dup make block! size value size] == func [size /initial value][head insert/dup make block! size value size] >> array 10 == [none none none none none none none none none none] >> array/initial 10 'red == [red red red red red red red red red red] toomasv 03:25@rebolek Nice :+1: rebolek 03:26@toomasv insert/dup is nice, I'm just showing it to the world :smiley: 9214 03:33@rebolek why not append/dup? rebolek 03:34@9214 because I was too lazy to check, if it's implemented... gltewalt 03:40The R2 source: >> source array array: func [ "Makes and initializes a series of a given size." size [integer! block!] "Size or block of sizes for each dimension" /initial "Specify an initial value for all elements" value "Initial value" /local block rest ][ if block? size [ rest: next size if tail? rest [rest: none] size: first size if not integer? size [make error! "Integer size required"] ] block: make block! size case [ block? rest [ loop size [block: insert/only block array/initial rest :value] ] series? :value [ loop size [block: insert/only block copy/deep value] ] any-function? :value [ loop size [block: insert/only block value] ] insert/dup block value size ] head block ] >> 03:44It works as is in Red. (based on my rigorous test of two examples) rebolek 03:47:) gltewalt 03:55Yay >> array/initial 3 array/initial 3 'hodl == [[hodl hodl hodl] [hodl hodl hodl] [hodl hodl hodl]] 04:01I know, you can just do array/initial [3 3] 'hodl 9214 04:02https://gitter.im/red/chit-chat gltewalt 04:02Oh yeah, this is /gui-branch toomasv 18:54Greetings [![live-edit](http://vooglaid.ee/red/lay-tree4.gif)](http://vooglaid.ee/red/lay-tree4.gif) rebolek 19:15@toomasv this is really cool. toomasv 19:43Thanks, @rebolek ! rebolek 19:44@toomasv thank you, this is really nice demo. toomasv 19:46:smile: AlexanderBaggett 20:56@toomasv , is that a Red/View editor? greggirwin 21:29@toomasv Waha! I love how you had to dodge the text box, then played with it. And I have a bookshelf wall just like yours. This is so great. 21:30@AlexanderBaggett, yes, it is. He's built a *lot* of great demos and experiments that we're going to learn from, along with everybody else, as we build official Red tooling. AlexanderBaggett 21:35@greggirwin , I would say ask him to make demos and promos for Red and link them to the main website , maybe get their own sub-category under documentation or something. greggirwin 21:36Yes, that's the idea. Where they'll live, we don't know yet. New web sites are coming too. Just too many plates spinning, and they get pushed back. Soon they have to take center stage though. Wednesday 3th October, 2018 dockimbel 04:27@toomasv Haha, great demo! ;-) dander 06:17too massive! :smile: 9214 06:19He came from oouter space :alien: planetsizecpu 07:07@toomasv great!, be careful not to hurt yourself with text1 haha toomasv 07:11 :joy: @AlexanderBaggett It is [there](https://github.com/toomasv/layout-editor), but be warned that it is unstable. Now it has primitive saving/opening too (might crash ;) ) and comments on code. 08:06Some [rich-text examples](https://github.com/toomasv/learning/tree/master/snippets/rich-text). GiuseppeChillemi 22:05@toomasv still a lot to learn 4 me . Nice one! Thursday 4th October, 2018 BeardPower 00:50@toomasv I was not aware of Red being big at AR ;-) 00:50:+1: toomasv 03:06@BeardPower AR :question: greggirwin 03:16Augmented Reality, where people interact with virtual things overlaid on the real world. toomasv 07:33@greggirwin Thanks! BeardPower 08:41@toomasv Sorry, I assumed that you are familiar with the term. Yes, Augmented Reality. toomasv 08:42@BeardPower NP :smiley_cat: BeardPower 08:46@toomasv I'm expecting nothing less from your next demo than this ;-) https://www.youtube.com/watch?v=kPMHcanq0xM toomasv 08:47@BeardPower :joy_cat: endo64 09:35You can also connect a kinect to capture movements and interact with the widgets. 09:36Here my friends Skate and Joker made it with C64, play International Karate: https://youtu.be/iHyKq51NE3s toomasv 09:41Nice! I worked on my own stick-men in spring trying to make them do Russian dance :joy: BeardPower 13:11Fun-stuff! toomasv 13:58@BeardPower Almost there! [![editor1](http://vooglaid.ee/red/editor1.gif)](http://vooglaid.ee/red/editor1.gif) BeardPower 13:59@toomasv You are getting pretty close ;-) 14:00At least your teaser looks like the end-result. toomasv 14:26Ah, [link](https://github.com/toomasv/editor) too. BeardPower 18:39:+1: Sunday 7th October, 2018 AlexanderBaggett 20:09@toomasv , Keep up the awesome work! toomasv 20:11:smile: Tuesday 9th October, 2018 toomasv 09:18[Shrinkable style](https://gist.github.com/toomasv/a0f95d685359247428f47cd10b11a428) without animation: [![shrinkable](http://vooglaid.ee/red/shrinkable1.gif)](http://vooglaid.ee/red/shrinkable1.gif) BeardPower 09:22Is this not implemented yet? Because I can't see any difference using the scale 'pen commands. view [canvas: base 500x500 draw [scale 'pen 2 2 pen yellow line 10x0 160x50 line 10x0 200x200]] toomasv 09:43@BeardPower This is not about draw: ![shrinkable2](http://vooglaid.ee/red/shrinkable2.gif) BeardPower 09:53@toomasv about what then? 09:54What is the purpose of the pen literal commands? toomasv 09:56 @BeardPower Oops! I thought your comment was about the demo. :flushed: rebolek 09:56:) BeardPower 09:56@toomasv Sorry, no. 09:57We are searching for an easy solution to scale draw commands but not scaling the line-width. toomasv 10:07I don't think you can do scale without scaling line-width too. But put scaling factor into field and press enter: view [ canvas: base 500x500 draw [pen yellow line 10x0 160x50 line 10x0 200x200] field 30x25 [parse canvas/draw [any ['line skip p: pair! (change p p/1 * face/data) | skip]]] ] 9214 10:13@BeardPower have you tried to keep one of the scaling factors as 1? toomasv 10:17![scaling](http://vooglaid.ee/red/scaling.gif) BeardPower 10:53@9214 Yes, but scaling is greedy. 10:55@toomasv What is scale 'pen for then? 9214 10:59@BeardPower scale 'pen applies scaling only to currently used pen. toomasv 11:10@BeardPower I don't understand these 'pen and 'fill-pen commands yet. Or may-be they are not implemented. :speak_no_evil: BeardPower 11:10Me neither. 11:10@9214 And what does it mean? toomasv 11:13But if scale 'pen would work, I'd expect it scale line-width anyway, as line-width is property of pen. BeardPower 11:14That's why I would expect the scale 'pen taking over. toomasv 11:16Sorry, I don't copy that. BeardPower 11:17scale 'pen would be used to scale back the line-width. E.g. scale 4 4 -> scale 'pen -4 -4 would scale it back. toomasv 11:24OK, that I copy. 11:35@qtxie Are 'pen and 'fill-pen commands implemented? :point_up: BeardPower 11:36https://github.com/red/red/blob/595d8942f65e99e6762fffaea183ee6e03df7ddc/tests/complexpen-test.red 11:40 fill-pen linear red green blue scale 'fill-pen 2 1 box ( as-pair start-x start-y + (2 * (height + step-y)) ) ( as-pair start-x + width start-y + height +(2 * (height + step-y)) ) 11:40Does not work for me: view [base 500x500 draw [fill-pen linear 0x100 0 400 red green blue scale 'fill-pen 2 1 box 0x100 400x300]] *** Script Error: invalid Draw dialect input at: ['fill-pen 2 1 box 0x100 400x300] *** Script Error 11:46@rebolek @9214 @toomasv I got it. You can use push to achieve it: view [base 500x500 draw [pen yellow scale 2.0 2.0 line-width 10 line 10x0 160x50 push [pen green line-width 1 line 10x0 200x200]]] rebolek 11:46Hm 11:46I will experiment with it when I've got some time. BeardPower 11:47Ah sorry, that was too fast. It will still scale what's inside push.... rebolek 11:48:) BeardPower 11:48Damn it. rebolek 11:49Manual scaling FTW! BeardPower 11:49Based on the values? toomasv 11:49I was just thinking "Where does 'pen come into play?" rebolek 11:49Right, when constructing the Draw block. BeardPower 11:49It seems to be for scaling gradients. 11:50'pen and 'fill-pen seem to be for gradients only. 11:51@rebolek You mentioned a switch for scaling. What did you have in mind? Only draw scale and scale the values by a multiplier? I saw that you can use literals to get the position inside a draw block. 11:53I GOT IT, YEAH! 11:53view [base 500x500 draw [pen yellow scale 5.0 5.0 line-width 10 line 10x0 160x50 pen green line-width -5 line 10x0 200x200]] 11:53Just use a negative scaling factor to scale it back. rebolek 11:53I can't test it unfortunately, so I'm going to believe you :-) toomasv 11:53OK, but what about scale 'pen? BeardPower 11:54[![grafik.png](https://files.gitter.im/red/red/gui-branch/cZjC/thumb/grafik.png)](https://files.gitter.im/red/red/gui-branch/cZjC/grafik.png) 11:54@toomasv It seems to be only usable with the deprecated API for gradients. toomasv 11:55Ah, ok. BeardPower 11:55It does not do anything from what I can tell. toomasv 11:59OK, got it too. 12:00[![image.png](https://files.gitter.im/red/red/gui-branch/9CLY/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/9CLY/image.png) BeardPower 12:05@toomasv view [base 500x500 draw [pen linear red green translate 'pen 100x0 line-width 10 line 0x50 500x50 line 0x100 500x100]] 12:06You can scale, rotate and translate the gradient inside a pen. 12:08 view [base 500x500 draw [pen linear red green rotate 'pen 45 line-width 100 line 0x50 500x50 line 0x300 500x300]] 12:09 view [base 500x500 draw [pen linear red green scale 'pen 2 1 line-width 100 line 0x50 500x50 line 0x300 500x300]] 12:14@9214 was pointing out that it could be only used for gradients, which I stated was not working. It was working and he was right about it. I just did not notice because of my thin lines. 9214 12:15:older_man: :dash: :leaves: toomasv 12:15The sun rotates after all! BeardPower 12:15@9214 Old man farting in the wind? lol 9214 12:16Old man farts on falling leaves = leafblower. BeardPower 12:16Hehe. 12:20The scaling factor to compensate the line-width can be negative (scaling: 10; compensation: -10) or a decimal (.1). 9214 12:20And percent! is yet to be supported. BeardPower 12:21@9214 How does draw now what the percentage should be based of? The last line-width? 9214 12:22@BeardPower I think it just treats them as floats. toomasv 12:30scale 'pen does not work with floats, but transform does. 9214 12:31As I said, it is yet to be supported. https://github.com/red/red/issues/3055 toomasv 12:32OK BeardPower 12:34@9214 Ah, got it. 17:03@toomasv Is there a short command to get centered scaling of objects? As scale is also applied to the coordinates: scale 2.0 2.0 circle 100x100 10 -> will result in a circle at 200x200 and diameter 20. I don't want the position to be changed, only it's size. 17:04Moving the circle to the upper left corner scaling and moving back again does not work, as the circle's coordinates are already changed by the scaling operation. 17:05An option would be to draw every object at 0x0 and translate it to it's end position but I want to use absolute coordinates. toomasv 17:05Use transform or matrix BeardPower 17:05I'm already using the transforms. toomasv 17:06I mean the command transform. BeardPower 17:06Ah sorry, you meant the transform command. 17:06So there is no other way besides that, right? toomasv 17:07Not that I know of. BeardPower 17:07scale, translate and rotate are limited in that regard. toomasv 17:07Of course, combination of translate and scalealo should work. BeardPower 17:08It will apply scale to the coordinates, so it does not work. 17:08I have a base of 500x500. 17:08I want a circle at 250x250 and scale to 2.0 17:09Applying scale 2.0 2.0 to the circle will change the coordinates to 500x500 as well. 17:10I don't want to calculate a negative translation and applying translate -250x-250. toomasv 17:14@BeardPower Thiseo? view [base 500x500 draw [transform 0x0 0 2 2 250x250 circle 0x0 50]] BeardPower 17:17> @BeardPower Thiseo? view [base 500x500 draw [transform 0x0 0 2 2 250x250 circle 0x0 50]] Yes, but I'm searching for a solution without transform and without negative translation. 17:17I'm searching for a solution, which can specify the anchor point ob the drawings. 17:17Maybe this is not implemented. 17:18And it's left to the programmer. toomasv 17:18@BeardPower Sorry, I don't understand the problem :flushed: What about this? view [base 500x500 draw [translate 250x250 scale 2 2 circle 0x0 50]] BeardPower 17:18E.g. scale 2.0 2.0 midpoint circle 250x250 17:19> @BeardPower Sorry, I don't understand the problem :flushed: What about this? view [base 500x500 draw [translate 250x250 scale 2 2 circle 0x0 50]] The "problem" is that I want a more concise command without translations. 17:19I want to specify the anchor point to scale drawings from. 17:19E.g. scale from the left upper corner, midpoint, lower base etc. 9214 17:19@BeardPower slap your own preprocessor on top of Draw block. BeardPower 17:20> @BeardPower slap your own preprocessor on top of Draw block. I hoped that the functionality is already in there ;-) toomasv 17:20Then why not to use translate or transformor matrix??? 9214 17:20@BeardPower it is there, you just don't want to accept it. BeardPower 17:21> Then why not use translate or transformor matrix??? Because existent code would need to be changed. 17:21> @BeardPower it is there, you just don't want to accept it. It's not there out of the box as a simple command: anchor CENTER ;-) toomasv 17:22Do you want to scale it from "outside". This is easy! BeardPower 17:22> Do you want to scale it from "outside". This is easy! Yes, E.g. a center zoom. toomasv 17:22From outside you can manipulate every aspect of draw box BeardPower 17:23The draw block is always scaled from the top left, but I want it from the center. 17:24I want to shift the origin to the center, so to speak. 17:24For scaling. 17:25Without touching the code in a draw block. toomasv 17:26transform is for this. Did you see my "complex" plane example? BeardPower 17:26> transform is for this. Did you see my "complex" plane example? Yes, but can you link it again, please? 17:28Yes, I used transform and matrices (OpenGL etc.) but I questioned myself if there was some functionality for setting the anchor points without using transform or matrices. toomasv 17:28https://gist.github.com/toomasv/4f7a9b969c0aa4f84fa6644cc84e9eb9 BeardPower 17:29Thanks! toomasv 17:30I see that I used translate there :smile: BeardPower 17:30As GDI/GDI+/DX etc. offer anchor-points I asked myself if it's also available in Red. 17:31It spares you from using transform and matrices as it's doing the stuff under the hood and you only specify which anchor-point you want to use. toomasv 17:31Here is translate with matrix https://gist.github.com/toomasv/e77df7ac18beee352f343b0729fb0a7a BeardPower 17:32:+1: 9214 17:34@BeardPower you can always make a wish [here](https://github.com/red/REP) BeardPower 17:34@9214 Yeah, I will think about it. :-) 17:35Just need to write-up what I need (used to have with modern engines/frameworks). qtxie 21:16@toomasv scaling 'pen and 'fill-pen is for gradients only. Wednesday 10th October, 2018 toomasv 03:00Thanks, @qtxie ! Got it. Thursday 11st October, 2018 temperfugit 04:23 view [ canvas: base 400x400 white all-over draw [ transform 200x200 0 1 1 0x0 [line 100x100 200x100] [line-width 2.5 line 0x0 400x400 line 0x400 400x0 line 200x0 0x200]]] The stable 0.63 build only draws the first block for me---the single line. The nightly build draws both blocks---all the lines. The nightly build is the one behaving correctly, right? Red should be drawing everything? toomasv 09:06@temperfugit Yes, nightly is correct. planetsizecpu 10:14@toomasv Today I had time to play a bit with my forms app, now I'm looking to add resizing to widgets, and I need to do so one liner if possible, so I tested a few alone and found suitable this example: view [size 800x800 at 10x10 b: base 200x200 gray loose on-drag [c/offset: b/offset + b/size] at (b/offset + b/size) c: base 5x5 red loose on-drag [b/size: (c/offset - b/offset)]] But is a long line, do you think it can be compacted more? I mean on-drag blocks. toomasv 18:34@planetsizecpu I will chew it a bit, but meanwhile I'll brag with fluid style: fluid with [extra/width: [1 3] extra/height: -50][area wrap] fluid with [extra/width: [1 3] extra/height: 80%][box gold] fluid with [extra/width: [1 3] extra/height: 'auto][ text-list data [ "Lorem" "ipsum" "dolor" "sit" "amet" "consectetur" "adipiscing" "elit" "sed" "do" "eiusmod" "tempor" "incididunt" "ut labore" "et dolore" "magna" "aliqua" ] ] return button "OK" [![fluid1](http://vooglaid.ee/red/fluid1.gif)](http://vooglaid.ee/red/fluid1.gif) fluid with [extra/height: 'fixed][box brick] return fluid with [extra/width: 33% extra/height: -50][box leaf] fluid with [extra/width: 15% extra/height: 50%][box gold] fluid with [extra/width: 'auto extra/height: 'auto][box teal] return button "OK" [![fluid2](http://vooglaid.ee/red/fluid2.gif)](http://vooglaid.ee/red/fluid2.gif) size 300x175 text "Description:" fluid with [extra/height: -120][area wrap] return fluid with [extra/height: 25][panel [text "First name:" fluid with [extra/height: 25 extra/space: 0x0][fn: field]]] return fluid with [extra/height: 25][panel [text "Last name:" fluid with [extra/height: 25 extra/space: 0x0][ln: field]]] return fluid with [extra/height: -10 extra/align: 'right][button "Send"] [![fluid3](http://vooglaid.ee/red/fluid3.gif)](http://vooglaid.ee/red/fluid2.gif) bferris413 18:47very interesting @toomasv planetsizecpu 19:08@toomasv THX I was not aware on fluid, I guess is your own func, so very clean and nite 😉 toomasv 19:48@planetsizecpu Sorry, I don't see ways to make it significantly shorter (few letters at most), unless there will be more boxes - then you can use styles to shorten the code, or generate the code by a func. pekr 19:56Great, so we've got an auto resizing system for View :-) endo64 23:17@toomasv That is great! Friday 12nd October, 2018 Rebolforces 01:21Nice fluid. Do we have any recommended plotting/charting libraries? Recommendations / examples? temperfugit 02:54@toomasv Thanks! rebolek 03:31 @Rebolforces I am working on one, it should be finished soon. toomasv 03:33Thanks folks, yes, I'm trying to make a flowing style that is basically a panel with some extra attributes, and face on its pane, which will be resized on creation, if window is static, and also dynamically if it is resizable. By default fluid faces are resized to fill all available space if they are "two-dimensional" (like area, base, panel, tab-panel) or to stretch out if "on-dimensional". Faces below and right of it will be moved accordingly. Currently I am struggling to include alignment spec too into it. @temperfugit You are welcome! Rebolforces 04:15@rebolek awesome. dockimbel 04:15@toomasv Nice! In case it can be of any use to you, here is my old Rebol2 VID extension for auto-resizing: https://github.com/dockimbel/auto-resize toomasv 04:17@dockimbel Thanks! Will study it. planetsizecpu 08:22@toomasv Thx!, just wanted to know if you had experimented with something simpler in your scripts or had any better idea to do it. pekr 08:48btw - Ladislav has implemented some resizing mechanism ala OS-X(?) for Saphirion R3 GUI? @rebolek might know more ... rebolek 08:49 @pekr right, it's available here https://github.com/saphirion/r3-gui 08:50https://github.com/saphirion/r3-gui/blob/master/source/layout-sizing.r3 toomasv 09:22@pekr @rebolek Thanks! planetsizecpu 09:27@pekr @rebolek Thx, I will save this addr and investigate on proper time, but what I'm looking is something tiny, just to allow resizing on each widget with no more than a block of code for my forms app. It will be a complex task, since instead of inserting a single widget, every time I have to insert another widget -the small red pointing box- and the latter should not appear as a source code for the user, only the first the user selected ... it will be difficult, a matter for doing along the winter I think. Saturday 13th October, 2018 bferris413 22:38 button "Upload Image" [ picture: get-picture if picture = none [ picture: %headshot3.jpg ] sample: load picture sample/size: sample/size * .3 book-image/image: sample ] *** Script Error: cannot access size in path sample/size: *** Where: set-path *** Stack: view do-events do-actor do-safe 22:39What am I missing to resize this picture before displaying it? Sunday 14th October, 2018 dockimbel 00:33@bferris413 /size is read-only for images. For now, you can use a draw [command](https://doc.red-lang.org/en/draw.html#_image) to resize the image until we add image effects support. Maybe @toomasv can show you an example of how to achieve that. bferris413 01:24Ok, thanks @dockimbel toomasv 05:31@bferris413 You can use draw's image until image/sizechange is implemented. E.g.: Red [] get-picture: none ;does [random/only read %pictures-dir/] view lay: layout [ below btn: button "Upload Image" [ picture: get-picture unless picture [ picture: %headshot3.jpg ] sample: load picture book-image/size: sample/size * .3 book-image/draw: compose [image sample 0x0 (book-image/size - 1)] lay/size: as-pair book-image/size/x + 20 btn/size/y + book-image/size/y + 30 ] book-image: box 0x0 draw [] ] [![headshot](http://vooglaid.ee/red/headshot.gif)](https://www.imdb.com/title/tt5147214/) dockimbel 18:58Remember that you can also generate a new image using draw function directly. greggirwin 19:46@toomasv nice! Does fluid using foreach-face under the hood? toomasv 20:24@greggirwin Thanks! Currently it doesn't use foreach-face (although I tried with it too). I put the current code [here](https://github.com/toomasv/learning/blob/master/styles/fluid.red) for inspection. Monday 15th October, 2018 endo64 08:43@toomasv Great work, there is just a small bug on restoring window after maximizing, textarea gets bigger than the window (probably other faces too). toomasv 09:29@endo64 Ah, thanks! I didn't test with maximizing. Will check. 11:27[Corrected](https://github.com/toomasv/learning/blob/master/styles/fluid.red) + added first version of free-size: fluid with [extra/width: [1 3] extra/height: -50][area wrap] fluid with [extra/height: 80% extra/width: 'fixed extra/free-size?: yes][box gold] fluid with [extra/align: 'right][ text-list data [ "Lorem" "ipsum" "dolor" "sit" "amet" "consectetur" "adipiscing" "elit" "sed" "do" "eiusmod" "tempor" "incididunt" "ut labore" "et dolore" "magna" "aliqua" ] ] [![Fluid4](http://vooglaid.ee/red/fluid4.gif)](http://vooglaid.ee/red/fluid4.gif) Wednesday 17th October, 2018 toomasv 16:22Is it correct, that react does not work with style? And if so, is it intentional?. E.g. first does not work, but second works: view/flags [style b: box red react later [face/size: face/parent/size * 1.0 / 3] b] 'resize view/flags [box red react [face/size: face/parent/size * 1.0 / 3]] 'resize greggirwin 16:36I believe that's a known limitation, but I don't see it listed in https://github.com/red/red/wiki/%5BDOC%5D-Reactivity 16:40In the old Worm example, reactions are set dynamically, probably for this reason. It makes sense for it *not* to work, as the reactive relations are created immediately, not stored with the style for later instantiation. That's something that could probably be improved in the future. toomasv 16:55@greggirwin Clear, thanks! 17:25Funny comparison: view/flags [on-created [ foreach bx face/pane [react [bx/size: bx/parent/size * 1.0 / 3]] ] box red box blue] 'resize view/flags [on-created [ pane: face/pane forall pane [react [pane/1/size: pane/1/parent/size * 1.0 / 3]] ] box red box blue] 'resize greggirwin 17:56Yeah... funny = wrong I think. toomasv 17:58Why wrong? It is quite informative IMO about how react deals with paths. greggirwin 18:02I don't mean your comparison is wrong, but that the behavior is not intuitive. 18:07Haven't had my head in that space for a while, so need to think about it. toomasv 18:47:tada: clear-reactions view/no-wait/flags [ on-created [ win: face reacts: copy [] repeat i length? face/pane [ append reacts compose/deep [ react [ (to-set-path compose [win pane (i) offset]) win/size - 10 / 3 * (i - 1) + 10 (to-set-path compose [win pane (i) size]) win/size - 10 * 1.0 / 3 - 10 ] ] ] do reacts ] box red box blue box green ] 'resize greggirwin 20:30Woohoo! Please update the wiki if you get a chance. Thursday 18th October, 2018 toomasv 10:57@greggirwin [Thus?](https://github.com/red/red/wiki/%5BDOC%5D-Reactivity#composing-reactions-in-window-on-created-actor) greggirwin 16:58:+1: :+1: toomasv 19:03Simple flowing layout: lim: func [:z face][face/offset/:z + face/size/:z] view/flags [ on-resizing [ pane: face/pane max-y: max-x: 0 cur-y: 10 forall pane [ if 1 < length? pane [ max-y: max max-y lim y pane/1 max-x: max max-x lim x pane/1 pane/2/offset: either face/size/x - pane/2/size/x - 20 < lim x pane/1 [ max-x: 0 as-pair 10 cur-y: max-y + 10 ][ as-pair max-x + 10 cur-y ] ] ] ] base "base" field "field" area "area" text-list data ["text" "list"] text "Hola!" button "Button" tab-panel ["A" [] "B" []] ] 'resize [![flowing1](http://vooglaid.ee/red/flowing1.gif)](http://vooglaid.ee/red/flowing1.gif) greggirwin 19:11Wow! Responsive design in 10 lines. Woohoo! 19:17@toomasv (and anyone else interested), one of the next things we want to add is tabbing support between faces, as that's needed for keyboard users. The basic trick to catch them is easy (insert-event-func), but what we need to design is the tab flow/ordering. In many systems, you set a tab index for a face, and that controls the order. We can do that too, and it works pretty well for small layouts. It's hard to maintain, though, and can become a pain with more complex layouts. Containers are another issue, and tabbing probably shouldn't automatically exit them. Following the UI layout makes sense, but cultures with right-left standards might lead to something like the OS metrics system we have today. Accessibility is another thing to consider, in how we will eventually display accessible features. @toomasv's experiments always make me bounce in my chair, because they show what Red is *great* for. We can try out ideas with very little code, and see how they work in practice. toomasv 20:13Thanks, @greggirwin! I'll ponder on this. Friday 19th October, 2018 dander 06:16I would be very surprised if accessibility guides don't already have well-defined expectations for tabbing behavior and other keyboard-based navigation. If I have a chance I'll try to look around for some. toomasv 13:20@greggirwin @dander Basic tabbing (first draft): view [ on-key [ if event/key = tab [ unless face/selected [face/selected: face/pane/1] idx: index? find face/pane face/selected step: either find event/flags 'shift [ if idx = 1 [idx: 1 + length? face/pane] -1 ][1] face/selected: face/pane/(idx + step) ] ] base "base" focus field "field" area "area" text-list data ["text" "list"] button "Button" tab-panel ["tab" [] "panel" []] ] area is swallowing the tab though. greggirwin 15:35Research on standards would be great. Thanks! @toomasv, nice. Another wrinkle is faces that can't get focus (text), but can have a hot-key set, so the focus goes to another face. e.g. a label with a field following it. GiuseppeChillemi 15:50As soon I a script which open a window on Windows Server 2012 I get: Firma problema: Nome evento problema: APPCRASH Nome applicazione: gui-console-2018-9-13-9871.exe Versione applicazione: 0.0.1.0 Timestamp applicazione: 5b9bfe2a Nome modulo con errori: MSVCRT.DLL Versione modulo con errori: 7.0.9600.17415 Timestamp modulo con errori: 54504b2e Codice eccezione: c0000005 Offset eccezione: 0001296c Versione SO: 6.3.9600.2.0.0.400.8 ID impostazioni locali: 1040 Informazioni aggiuntive 1: 9a64 Ulteriori informazioni 2: 9a6475384036e35bb5908bf671cf1561 Ulteriori informazioni 3: fd46 Ulteriori informazioni 4: fd46fcf2d239f0e8fdb5cd9820e304a0 But It is not always: 2 times it crashes, one time it run. endo64 20:56@GiuseppeChillemi Any chance to test on another pc? And with latest build? It looks your version is not the latest one. GiuseppeChillemi 21:39@endo64 On my other PC I have no crashes. On Windows Server 2012 (terminal server connection) RED is quite unusable endo64 21:47@GiuseppeChillemi I'll try to find a Windows Server 2012 at work on Monday, so I can test and confirm. Crash happens with any simple script with VID or can you share your script here? GiuseppeChillemi 21:54Crashes at start (one time it starts, another time it crashes) and with simple VID scripts. 21:54@endo64 Sunday 21st October, 2018 dockimbel 00:18@GiuseppeChillemi > @endo64 On my other PC I have no crashes. On Windows Server 2012 (terminal server connection) RED is quite unusable Apps running through Terminal Server require special support that we haven't implemented yet in Red. Though, if someone wants to have a look at it, it should be quite easy to achieve. GiuseppeChillemi 05:42@dockimbel Let's Hope ! It is a common setup in companies Monday 22nd October, 2018 toomasv 12:28@greggirwin Tabbing, second draft: actors: do %tabbing-actors.red style: do %label-style.red view layout/options/styles [ title "Tabbing show" label "First name:" field 150 return label extra 'f2 "Middle name:" f2: field 150 return label extra 'f3 "Family name:" f3: field 150 return label "Description:" area return text "Standalone text" button "Send" ] actors style [![tabbing1](http://vooglaid.ee/red/tabbing1.gif)](http://vooglaid.ee/red/tabbing1.gif) * Labels with hot-keys selected on tabbing and clicking * Standalone text selected on tabbing * No tabs added to area 12:46[tabbing-actors](https://gist.github.com/toomasv/4f08339e854669247d4f34aa7a8c1a3b) and [label-style](https://gist.github.com/toomasv/380ae584be2c46838763ac53c5974f09) endo64 14:45@toomasv Great work as always! toomasv 14:54@endo64 Thanks! greggirwin 22:26I need to make time to check this out. Thanks for doing that @toomasv . Tuesday 23th October, 2018 toomasv 04:53:smile: Saturday 10th November, 2018 lepinekong_twitter 09:46I'd like to see a simple example of canvas scroll: has anybody already done so ? toomasv 11:14@lepinekong_twitter Yep, tinybrowser uses scrolling with rich-text canvas Saturday 17th November, 2018 planetsizecpu 17:38I have paused between several weeks of madness at work, today I had time to play a little with that code that I was saying on Oct 11, I enjoyed Red vid today, programming in Red is fun, I just wanted to show you ; -) So I want to encourage the Red team to push hard. 17:38[![nubtest.gif](https://files.gitter.im/red/red/gui-branch/zh9V/thumb/nubtest.gif)](https://files.gitter.im/red/red/gui-branch/zh9V/nubtest.gif) ldci 18:00Neural network with Red language here: http://redlcv.blogspot.com/2018/ toomasv 18:27@planetsizecpu Great! :+1: @ldci Thanks! Very interesting! For some reason, also the program runs and seems to work correctly, I get series of errors after each run is finished: *** Script Error: invalid Draw dialect input at: [10x228] The green line starts at this point, I think. Maybe I am doing someting wrong? I just select the pattern and let it Run. planetsizecpu 18:43@ldci I read the article, found very interesting scientific divulgation, even though I have no idea of neural networks, it is fun to play with pattern & samples, I get same draw errors than Toomas, seems related to points out of bounds. Surely you had a lot of fun while testing your code :-) 18:45@toomasv Thanks! I keep going. greggirwin 18:49@planetsizecpu and @ldci, nice! @lucindamichele_twitter, let's tweet about @ldci's article. endo64 19:26@planetsizecpu Nice, also check my mockup tool written in Red, it is very similar to yours: https://github.com/endo64/mockup ldci 20:37@planetsizecpu : just compile with -r or -t and script error disappears. I'll test ASAP for the error :) 22:06@toomasv I've found a solution just add if x = 10 [append append plot 'line (p)];' strange just before append plot. Windows users must also add do-events/no-wait after sberr/text: form round/to error 0.001. Best regrads Sunday 18th November, 2018 planetsizecpu 09:16@endo64 It works well, I like the way you switch the grabber between faces, but it need extra coding and time to test. As you said, it's useful for present mockups to customers, I guess you will set a menu or some visual aid further 😉 09:20@ldci Ill test on .exe soon thx. ldci 10:52@everybody: corrections for red neural network are done and code is updated (http://redlcv.blogspot.com/2018/) Monday 19th November, 2018 planetsizecpu 07:31@ldci now I get this error on first run in console, you may want to fix: Script Error: ℗ has no value Where: append Stack: view do-events do-actor do-safe makeTraining trainNetwork ldci 17:01@planetsizecpu oups: replace append plot ℗ append plot ℗. Error in copy from code to blog Tuesday 20th November, 2018 planetsizecpu 07:32@ldci Today I tested and get: Script Error: sbcount has no value Where: set-path Stack: view do-events do-actor do-safe makeTraining trainNetwork I commented on line 155 as: ;sbcount/text: form i and now it run as normal. Also wanted to slow down the speed, for allow making changes in pattern and samples while running (althought I dont know if that makes sense), like this line inserted in trainNetwork func at line 166, before visualization, wtr: 0 while [wtr < 5000] [wtr: add wtr 1] I just enjoyed to see it running. :-) ldci 08:56@planetsizecpu I need to test the code on Windows. There are some differences with macOS in rendering 15:25@planetsizecpu some tests: python bpnn.py : 12 ms vs. red 15 ms planetsizecpu 15:54We are so close, even without optimizing the compiler. Let's give them the time they need. Wednesday 21st November, 2018 gltewalt 02:50Is there a way to get mouse coordinates? Am I missing it in the guides somewhere? greggirwin 03:35event/offset Tuesday 27th November, 2018 meijeru 18:09Re Wiki page "[LINKS] GUI Programming" under "Red IDE projects from the community": should one not add the Rededitor for Windows made by Ungaretti? [This link](http://helpin.red/Rededitor.html) ericguedespinto 18:12@planetsizecpu you can also add sbcount as a field in the view layout. It tells you the current iteration gltewalt 19:30@meijeru Added. meijeru 19:41:+1: Wednesday 28th November, 2018 planetsizecpu 07:15@ericguedespinto You're right, I just commented sbcount/text for allow it to run quickly without much care. Thursday 29th November, 2018 hiiamboris 17:22https://github.com/red/REP/issues/34 > WISH: Image coordinate systems reboot moliad 23:51is it planned to fix the problem where text doesn't follow the transform matrix in Draw dialect... its an annoying problem. 9214 23:52@moliad you should bump the respective issue on Github so it will get a priority before 0.6.4 release. 23:53This one I believe: https://github.com/red/red/issues/3225 Friday 30th November, 2018 moliad 14:32how do I bump the importance on an issue? by posting a metoo comment, or is there a way to vote for them somewhere? 9214 14:32@moliad just leave a comment and escalate teh drama :wink: moliad 14:36:smile: pekr 14:53try to write privately to qtxie. Most probably not a good solution to bother the Team that way, but in the past, it kind of worked and I can imagine few bugs might get fixed that way .... rebolek 14:57that way we will never get 0.6.4 ;-) pekr 15:05We are not hunting for new features, but fixes, or so is my understanding? :-) 15:05But well, I am not pushing for anything, so .... rebolek 15:06:smile: greggirwin 15:560.6.4 is frozen at this point. Just need to get the announcement out. While the team may ask for direct contact at times, we're really overloaded with messages already. That also sometimes means responding on multiple channels, because others don't know what happens in private conversations. If you tag someone in a message, that makes those things more visible to them, which is a balance. It can also help to explain "annoying" vs "affecting real work we're trying to do.", and what that work is, which may lead to a focus on related fixes. 15:58Thanks for doing that in the comments @moliad. Lots of good comments there already, so much R&D has been done. Clearly not a quick and easy fix. moliad 19:26[![graph-text-problem2.gif](https://files.gitter.im/red/red/gui-branch/FjOM/thumb/graph-text-problem2.gif)](https://files.gitter.im/red/red/gui-branch/FjOM/graph-text-problem2.gif) 19:47although a simple problem, it's a show stopper for us right now. we are working on a port of the liquid dataflow architecture for Red (which should become public around next year). For the node graph editor its a problem, as you can see in the following video Saturday 1st December, 2018 greggirwin 01:27Thanks for the example. pekr 05:51I can see some tests being done using Direct 2d. Which Windows versions still require GDI / GDI+? Am I correct, that Red supports Win7 and newer and WinXP legacy support was dropped? 9214 06:07@pekr IIRC XP and Wine are not officially supported. BeardPower 14:46@pekr Yes, there is a D2D branch. rebolek 18:57@moliad It look very nice! (ignoring the bug) Sunday 2nd December, 2018 olivier_lp_twitter 11:06Hi everyone, I'm a new one on red, i'm using to scripting with rebol2, so very ambitious with red (waiting hard for the 0.7x)), i'm testing VID, happily surprising at the moment but hoping some evolutions, I wish rotary and toggle buttons will be added, button appearance (color or image) will be possible, multi-selection option for text-list and transparancy for text by default (it works if bacdrop is set with a color but not with an image which is working as in rebol even it's not documented)! effect option will be nice too as in rebol 11:20it seems not to be possible to desactivate the auto-sync in the 0.6.4 version system/view/auto-sync?: false does nothing, in 0.6.3 it works 9214 11:42@olivier_lp_twitter Red View engine is limited only to native widgets that are supported across platforms, thereas Rebol used custom graphical engine and relied on Antigrain library. 11:42If anyone else can confirm that, you should report auto-sync? issue. hiiamboris 12:07@olivier_lp_twitter autosync works for me in CLI console and when compiled. I gather GUI console relies on the setting and resets it, so it's probably what you experience and will unlikely be changed in near future. olivier_lp_twitter 13:25@9214 thanx for you return, but not sure what i'm whishing is not compatible with your pupose : rotary and toggle are juste declined button. For the rest i think it should be supported. but the idea is quite fair, specially with cross compilation system 9214 13:42@olivier_lp_twitter not sure what you mean by "declined button". And we have [radio buttons](https://doc.red-lang.org/en/view.html#_radio). olivier_lp_twitter 13:52@9214 radio button can replace toggle but it's less nice, toggle button is commonly used on many device as androids one! i mean by declined button the fact that is not very complicated to make a style from button to simulate the rebol toggle and rotary buttons 9214 13:53> is not very complicated to make a style from button to simulate the rebol toggle and rotary buttons So what stops you from creating such style? 13:54By toggle you mean [checkbox](https://doc.red-lang.org/en/view.html#_check)? pekr 13:59Toggle was a special button type in R2. Not sure it came from Amiga, but button was either pressed, or not pressed, like some real-life state buttons on some panels, etc. 14:00Not sure if draw sufficiently supports all possible event types, but I think it does. Should not be difficult to mimic R2 VID like custom buttons / styles. 9214 14:01Draw doesn't support any events, you're confusing it with View. pekr 14:31Yes, my remark was not precisely correct and could confuse others. My idea was - go grab R2 code for a button and port it to View. IIRC, Red was supposed to support custom widget creation with some helpers, but imo it could be done even today. I will see if I find some time next week to experiment a bit. 14:33There are some advantages / disadvantages to both aproaches. With custom styles, you will easily miss on OS metrics, skinning, etc. OTOH with OS only widgets, you will hardly find more complex / comound styles as db grids, with stuff like sortable / resizable / freezable columns and if so, those are not going to be available consistently in a cross-platform manner .... olivier_lp_twitter 14:34@9214 not checkbox but toogle one , as you have for activate/desactivate a service on android phone or others devices, in R2 the design is like a button on/off! I can do it as a style, the only thing is the event gestion which has to be redone for each use (or not maybe with the on-create event) 9214 14:36Checkbox is functionally equivalent to toggle button, so I don't understand what your problem is. pekr 14:36@olivier_lp_twitter Not fluent with Android GUI, so maybe it hase one. But Windows does not. So we will hardly get one in a cross-platform manner anyway. Such missing styles will have to be emulated there. 14:37He has no problem, he just wants a toggle style, not a check-box :-) olivier_lp_twitter 14:43In fact I just have a lot of wished for red, toggle and rotary are not the most important ones i can confess, but as Red is still on creation, it's easier and better to ask now! Rebol was really a revolution (to me) as a program language but it was so a mess how it ends, I would just not want to get the same thing with red which may succes where rebol failed! i guess priority will be on protocol and I/O part pekr 14:47GUI engine has some priority too, as it will be needed for Android. There is still room to improve GUI engine (e.g. switch from GDI to Direct2D rendering), but not necessarily a priority right now. We should experiment with what we've got and provide a feedback. I think that custom styles could be doable even nowadays, I just did not try myself yet. Maybe @rebolek has some experience here? BeardPower 15:10Not to mention that REBOL used a software renderer and Red is using native widgets. Both have their own pros and cons. 15:11@pekr But a toggle, as @9214 was pointing out correctly, it just a checkbox with a different style. 15:12A non exclusive binary value. olivier_lp_twitter 15:13@pekr I agree with you, i think it can be done nowadays, I was just asking! and toggle button will be probably be implemeted, android devices use it a lot! Me not so much, the rotary one a bit more, because it's a bit useful, and specially in rebol because droplist is such a mess, the one on red is pretty well done (scrollable option well thought)! my idea is just to get a full GUI in Red, to make light, quick and a bit pretty apps with no outside libraries. My idea is to migrate, when the I/O is implemented, my scripts from rebol to Red and then leave Rebol to Red 9214 15:17Android backend has a new [switch widget](https://gist.github.com/dockimbel/bf833e5a737f0efe4bfe07a26a528ec4#file-eval2-red-L136), which looks like your precious toggle button... and behaves like a checkbox. olivier_lp_twitter 15:26@9214 ok, i'll take a look even if as I said, the toggle button I don't care so much, the rotary is a bit precious to me or some use 9214 15:27... then go and create a style for it, gee. olivier_lp_twitter 15:29@9214 I will if needed, it's not as i said the most important to me to go through, i have time enough to see things coming BeardPower 15:39@olivier_lp_twitter I started an UI incentive a while ago: creating styles for all king of widgets. It's on hold, as it's not finalized yet if Red will get it's own gob! type or UI renderer. 15:39[![switch.gif](https://files.gitter.im/red/red/gui-branch/LzRw/thumb/switch.gif)](https://files.gitter.im/red/red/gui-branch/LzRw/switch.gif) 15:40You can create everything with styles but they build on top of the native widgets. olivier_lp_twitter 15:42@BeardPower pretty nice :-) BeardPower 15:43[![graph.gif](https://files.gitter.im/red/red/gui-branch/yKoI/thumb/graph.gif)](https://files.gitter.im/red/red/gui-branch/yKoI/graph.gif) 15:43[![pie.gif](https://files.gitter.im/red/red/gui-branch/yKoI/thumb/pie.gif)](https://files.gitter.im/red/red/gui-branch/yKoI/pie.gif) 15:43[![donut.gif](https://files.gitter.im/red/red/gui-branch/yKoI/thumb/donut.gif)](https://files.gitter.im/red/red/gui-branch/yKoI/donut.gif) 15:45The goal was to port every widget from Grade UI to Red: https://www.uichest.com/products/grade-ui-kit 15:46Using the native widgets as a base and the styles are limited in what you can do, as you have to stick within the bounds of the basic widget. 15:47A gob! would offer the ultimate freedom without having to rely on the native widgets. olivier_lp_twitter 15:48@BeardPower nicer and nicer! I'm far away from that 15:48[![image.png](https://files.gitter.im/red/red/gui-branch/URBW/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/URBW/image.png) pekr 15:48That looks really nice .... BeardPower 15:49[![chart_tweened.gif](https://files.gitter.im/red/red/gui-branch/9VSO/thumb/chart_tweened.gif)](https://files.gitter.im/red/red/gui-branch/9VSO/chart_tweened.gif) 15:49Another goal is to have a UI creator with features of Affinity Designer. 15:49[![grid.gif](https://files.gitter.im/red/red/gui-branch/IM65/thumb/grid.gif)](https://files.gitter.im/red/red/gui-branch/IM65/grid.gif) 15:50The Grade UI kit offers about 1000 of various widgets ;-) 15:51> [![image.png](https://files.gitter.im/red/red/gui-branch/URBW/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/URBW/image.png) Keep it up :-) olivier_lp_twitter 16:00pretty awesome! about 100 widgets, In fact the red GUI is pretty good enough to me, some adds to be done (effect [], multiselection, button color, mays be a tree widget) but compared to rebol where there is no menu, tab panel, poor event widget handler, it's already a REDolution nedzadarek 16:18@BeardPower UI Creator will be nice but I would be happy if we just have [the Responsive design](https://en.wikipedia.org/wiki/Responsive_web_design). pekr 16:23@BeardPower so what you are basically saying is, that the lowest level container (a base style?) is built upon the native widget, which imposes some limits in what you can do? 16:23This Grade UI is really modern and nice :-) BeardPower 18:10@nedzadarek It will come sooner or later. 18:11@pekr Yes. The basic widget is just a panel. Depending on the OS it has a minimum size and creating to many widgets can cause issues on Windows. They are also slow compared to a real gob! object. rebolek 18:12Everything is just pixels. BeardPower 20:40@rebolek That's what the illuminati would say! nedzadarek 21:16@BeardPower How many is "too many widgets"? And iI think ts slowness is not a big problem (of course faster is better) for not-game-like projects. 21:22ps. I think it may come sooner. I once have talked with Tomas V. an he gave nice code. So it may not be so hard... at least on the surface level. If someone like him that knows internals of 'the Red exists then it would be matters of days. 9214 21:22@nedzadarek what are you talking about? nedzadarek 21:23@9214 :point_up: [2 grudnia 2018 17:18](https://gitter.im/red/red/gui-branch?at=5c0405e6bc1a693e3a44ec39) 9214 21:28You can do responsive design with reactivity. BeardPower 21:29@nedzadarek You can never have too many widgets ;-) What are "game-like" projects? nedzadarek 21:43@9214 Of course we can, but it is not "out of the box". It is a lot harder than "basic view programming". 22:00@BeardPower I haven't had any problem with "too many widgets" (except positioning). By "game-like" I mean projects that require many changes in the screen per second. Not game example would be computing the Voronoi *on the fly* (you change site(s) and the Voronoi is re-computed). gltewalt 22:12If you're saving images to the computer, should transparancy come into play, or is that just for View/VID? 9214 22:12@gltewalt yes, transparency is preserved in PNG format. gltewalt 22:12Because there is no difference in these images. 22:13 >> j: make image! [400x600 255.0.0.0] == make image! [400x600 #{ FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000 FF0000FF... >> j2: make image! [400x600 255.0.0.255] == make image! [400x600 #{ FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000 FF0000FF... >> save/as %j.jpeg j 'jpeg >> save/as %j2.jpeg j2 'jpeg 22:13oh png 22:13let me try 22:14Ok, it works 22:14:) 22:15Thanks BeardPower 22:25@nedzadarek You would not implement this as a widget. 22:26E.g. the charts of a trading app are not "widgets" because of the limitations of them. 22:27Windows can only create x amount of windows at a time. gltewalt 22:31Is this a bug, or just the way it do? >> img: make image! [1x1 255.210.0 #{2A}] == make image! [1x1 #{FFD200}] >> img/alpha == #{00} >> img2: make image! [1x1 #{FFD200} #{2A}] == make image! [1x1 #{FFD200} #{ 2A}] >> img2/alpha == #{2A} Monday 3th December, 2018 nedzadarek 00:38@BeardPower > You would not implement this as a widget. What I do not want implement as widget? 00:40@gltewalt I think someone posted this. BeardPower 00:47@nedzadarek High performance data visualization. nedzadarek 00:53> If you're saving images to the computer, should transparency come into play, or is that just for View/VID? It depends on what you want to do with an output image. If, for example, you want simple screenshot then you don't need transparency. On the other hand if you are using an output image on top of/under another image(s)/*thing(s)* then you need transparency. For example [this example](https://gist.github.com/dockimbel/2d95c8c85e5bfed71bd1c15294ee77c5) could be implemented using transparent images. moliad 12:32@Oldes thanks, its based on work in progress to rebuild Glass in Red. we use no Red controls in what you see, it is 100% draw, and its much faster than on R2 12:34@BeardPower a few nice styles... maybe you'd be interested in Glass and helping out? if you don't know what glass is, its a 100% dataflow driven gui engine. every property of the display, from layout to styles is managed via a lazy graph and it provides an arbitrarily shaped, multi-layered rendering environment and retargettable multi-level event stream. 12:35The dataflow engine it runs on should be complete by christmas, we are starting serious work on it this week. BeardPower 13:15@moliad Sure. I was reading about the data-flow engine on your website. Seems it can also be accelerated on multi-core. 13:16Is it only for a GUI engine or other purposes as well? Like a nice alternative for an ECS? 13:18Having software and hardware rendering combined (each node could use it's own rendering back-end and composited together). Think "everything nodes" of Blender for Red? :-) moliad 13:31the dataflow engine is an atomic system, its really for data first and foremost... one example is the Integer! pipe, which ensures data is always in integer, to build an integer text field, you connect IT to the integer value, and it will always contain an integer, whatever you type. so it inherits the data property, even if it wasn't designed as such BeardPower 13:32Nice. 13:33Well, an ECS and "everything nodes" is just data :-) 13:33It's just transforming data. moliad 13:36yep. but liquid (used by glass) has multiple processing modes. BeardPower 13:37Examples? moliad 13:37(piping, bridging, dependency, containment, hold and modify, etc) all embeded into the same base class. BeardPower 13:37I think that would fit a rendering engine very well. 13:37Same for AI. 13:38Even trading/charting. moliad 13:38yes, the core rendering engine of glass is based on a layered graphic element scene graph, just like most modern 3D engines. 13:39charting is very easy with glass, and it stays live, everything is live, once connected in liquid. 13:39its very much like the reactive system in Red, but a bit more robust. 13:40(and especially its pull-based, so its much more frugal in cpu, but it means it much harder to implement.) BeardPower 13:40Is it possible to decouple the scene-graph so it's not updating any childs? moliad 13:40we will start work on liquid this week, the first target is to implement glob/gel 13:41its all nodes. you connect like you want. you can even implement cyclic graphs, though its complex to do without implementing an infinite cycle dead-lock BeardPower 13:41Nice. 13:41Scene-graphs can get very slow. 13:42So it's also possible to create a push service like RethinkDB? moliad 13:42not in liquid, they auto optimise since you don't need to render all again, its caching all that hasn't changed. BeardPower 13:42Hmm, sounds all to good to be true ;-) moliad 13:42I don't know about RethinkDB BeardPower 13:42Can't wait to try it. moliad 13:43well, its been working in R2 for 10 years now. BeardPower 13:43RethinkDB is a database for real-time services with a push model. 13:43https://www.rethinkdb.com/ 13:43It can push data to the client. 13:44It would be nice to give it a try for implementing a trading/charting app. moliad 13:44you can implement a pseudo push system if you set all nodes to stainless, in which case they cleanup right away (they don't stay dirty) 13:45but its rarely a good idea since you'll be processing all nodes more times than you will be looking at the results. BeardPower 13:46Do you know Floe? https://arxiv.org/abs/1406.5977 13:47glob/gel -> first I thought it's a typo and you meant gob :-) What does glob/gel do? moliad 13:47glob = graphic layered objects. gel = graphic elements. BeardPower 13:48Alright. moliad 13:48globs can link gels into more complex shapes, globs can also link to other globs. 13:48a gel can have an arbitrary number of layers. each one connects to the same inputs. BeardPower 13:48Were you able to benchmark your system? Compared to some scene-graphs out there? 13:49Very nice. moliad 13:49nope, it was a bit pointless as it was in Rebol. it was still able to beat the native view engine in a few things. using AGG rendering back-end (theoretically, AGG is slower than native view) BeardPower 13:50I assume that there is a rendering-backend node, so we could provide any API we want? 13:50I see. moliad 13:50the fun thing about gel/glob is that even if you have several layers, they are all linked independently, so if you don't look at or need to re-render a layer, it is not processed. BeardPower 13:51Like removing the rendering component of some entity :-) moliad 13:51so the hit location back-plane is rarely re-rendered while the visible ui is refreshed at each user interaction. BeardPower 13:52So in theory you could render gel/gob A through D2D and gel/gob B through a software renderer? moliad 13:53in theory yes, since you get a different processing graph. BeardPower 13:53Yeah, just linking it to a different backend. moliad 13:53but, obviously, you need to have a way to send the drawing instructions to each. 13:54we'd need that level of control in the Red part, (which isn't yet the case) BeardPower 13:54Yeah, it's just one backend for all. moliad 13:54once liquid is functional, implementing glob/gel will be easy in red, especially since we'll be replacing all of our hand-coded graph editor using them. BeardPower 13:55There is also an editor for setting up the pipeline right? 13:55Like Blender nodes. moliad 13:55I expect adding an OpenGL back-end to glob would be pretty easy. 13:56the editor I showed in the gif video will become the core liquid node editor, for those who want to use it. BeardPower 13:56OpenGL is dead. We should use Metal and Vulkan or some media lib. moliad 13:56in general for such low-level things, its much quicker to code directly BeardPower 13:56Depends on the nodes/blueprints provided, I guess. 13:57Sounds really really great! moliad 13:57there is also the fluid dialect which aims to add a direct graph interface in text. 14:05not sure about the latest style of fluid but it would be something like ex: r: fluid [ #add << [ b: 7 c: 8] ] >> print r == 15 >> b: 10 >> print r == 18 this would have creates 3 nodes, and linked them up. pekr 14:22I can smell Fusion, Nuke, Smoke, getting some competition soon :-) moliad 14:23nuke is my target, I hate its node interface. And some of you know I used to work in film visual effects, so its a natural fit to test my graph editor into such a type of project ;-) 14:24some may have recognised the name of some of the nodes as such :-) BeardPower 14:24Do you know Blender? 14:25I really like their node system. moliad 14:26never used it much BeardPower 14:262.8 is the SHIT! ;-) moliad 14:27have you ever used shake (before apple bought and killed it ?) BeardPower 14:27I'm using it with Armory3D to make games. 14:27> have you ever used shake (before apple bought and killed it ?) No, but I'm familiar with the name. moliad 14:29it was the best 2D composition engine. its architecture actually was a JIT C compiler. 14:30its node graph had an inverse transform accumulated, so you edit properties of a node upstream within the applied transform of all nodes between it and the view you are looking at. all in a 2D space. 14:31editing a x or y translation after a 4 point skew and rotation was pretty neat BeardPower 14:44Nice. Why did they axe it? 14:44Wasn't it only for OS 9? moliad 14:45shake was for windows and linux, apple bought them out, ported shake, imported some of the tech in their own apps and killed shake a few years later. BeardPower 14:45How much did they pay? 14:46R-Shake incoming? ;-) moliad 14:46it was THE high-end compositing engine (many studios prefered it over even apps like inferno and other tools from discrete logic (now owned by autodesk)) 14:46shakeR ;-) 14:47> How much did they pay? a lot of $$$ BeardPower 14:47Haha, even better. 14:48Rich and famous, dude! Rich and famous! ;-) moliad 21:33@BeardPower will look into floe, may have some ideas for liquid net which is the network layer we'll embed within liquid for Red 21:34it is going to use ZeroMQ, to allow easy multi-platform & multi-language binding i/o. 21:34(at least that's our plan to begin with) 21:35adding an async & concurrent (no-locking) processing mechanism to liquid will be a complex project, but it should be possible. note that liquid doesn't have a "graph integrator". Each node controls its own messaging in all directions. so it's a bit harder to implement, BeardPower 22:05Why ZeroMQ? 22:05And not Cap'n Proto. moliad 22:05also note that core to liquid's design is the insulation of transport and processing. for a liquid node, connecting to another node in memory or on the network should not incur any additional work a part from being able to identify 22:06never heard of "Cpt'nProto" BeardPower 22:06https://capnproto.org/ 22:06It's from the same guy who created Protocol Buffers while working at Google. 22:07Just faster than anything else ;-) 22:08The Cpt'n was a typo, sorry ;-) moliad 22:08sort of depends. Zmq xfers millions of msgs a second and implements smart connection topologies for almost free. 22:09though I'm never closed to better alternatives, I'll put it on my list of things to evaluate when we actively work on the networked part of liquid. BeardPower 22:09Cap'n Proto will wipe the floow with ZeroMQ :-) 22:10https://capnproto.org/news/2014-06-17-capnproto-flatbuffers-sbe.html moliad 22:12not sure for liquid, but this seems like a really nice solution for another product I work on... yep, worth looking into. BeardPower 22:15Jokes aside. Cap'n Proto is just a serialization lib. You can send Cap'n Proto messages through ZeroMQ. 22:18But I think this should be interesting for you: https://bravenewgeek.com/a-look-at-nanomsg-and-scalability-protocols/ 22:19http://www.inspirel.com/articles/YAMI4_vs_ZeroMQ.html 22:20https://github.com/nanomsg/nng moliad 22:21interesting.. especially since it seems even lower level than Zmq... thx... yet another thing to look at :-) 22:22cya l8tr BeardPower 22:22Cu. Tuesday 4th December, 2018 moliad 04:43looked at nano, it seems like the way to go... I also like the fact its just C (no C++), specifically for the reasons he chose it, and they are the exact same reasons I chose it for my DB... funny how I came to the exact same conclusions. 04:44the fact is supports websockets also makes it a winner for me, since I'll need it for sure at some point. BeardPower 11:31Yes. You should use nng, which is the nano next gen. Wednesday 5th December, 2018 greggirwin 00:42These are tough calls. Unless someone has used the various options, and you trust their opinions about your own use case, it's coin tosses. The use cases are the big thing. I researched a number of options before settling on 0MQ many years back, but it changed over time (a bit) and wraps more things into patterns, which is just different, not better or worse. It takes a little more to get used to the patterns and socket types, and may be overkill, so I hope we find and build a number of things for Red, and see what works where. Monday 10th December, 2018 olivier_lp_twitter 09:01Is it because of native Gui that button, drop-list can't be coloured? rebolek 09:02Yes. pekr 09:21@rebolek You are the skilled one - you can show us a draw based implementation of Button style, ported from R2, right? :-) rebolek 09:35@pekr Actually, [here's a guide](http://red.qyz.cz/writing-style.html) how to write your custom Draw based button style. olivier_lp_twitter 09:56@rebolek thanx, wen drop-down event handler will work, it will be not so hard to have a funny custom gui :d rebolek 10:02@olivier_lp_twitter Is there some problem with drop-down? If you wan tto implement custom GUI, you need to write your own drop-down anyway and on-over is enough for it. olivier_lp_twitter 10:15@rebolek i have no action done with drop-down : view [t: text "--->" drop-down "Choose one" data ["first" "second" "third"] [t/text: pick face/data face/selected]] 10:18but it seems working with view [t: text "--->" drop-down "Choose one" data ["first" "second" "third"] on-over [t/text: pick face/data face/selected]] rebolek 10:40@olivier_lp_twitter I'm not on Windows, so can't help you right now, sorry. endo64 11:58> @pekr Actually, [here's a guide](http://red.qyz.cz/writing-style.html) how to write your custom Draw based button style. @rebolek Very nice guide, added to wiki: https://github.com/red/red/wiki/%5BNOTES%5D-Notes-on-style-writing rebolek 12:08@endo64 thanks! olivier_lp_twitter 17:35I saw once a script where a drop-list is scrollabe, if someone know how to do it ne1uno 17:56@olivier_lp_twitter docs were recently updated, drop-list with [flags: 'scrollable] olivier_lp_twitter 17:56@ne1uno thanx ne1uno 17:57seems to be hardwired after 30 items? rebolek 17:57isn't is possible to set size? toomasv 18:21> Note | number of visible items cannot yet be defined by user. Still there. rebolek 18:26I see. Thursday 20th December, 2018 moliad 22:33@rebolek would be nice if you added pictures of the generated gfx right in the web page (just under the code snippet) Friday 21st December, 2018 rebolek 07:48@moliad good point, I will add them. moliad 15:24btw, I will probably work on the text transforming within draw on windows during the Christmas holidays, I hope I can deliver a christmas gift :wink: ne1uno 17:44I have an image and a button in a group-box. any reason why the image doesn't move if I dynamically change offset/x of the group-box but the button does move with the group-box? greggirwin 18:11@ne1uno works fine for me here in Win10, either with a loose group-box or setting the offset. view [size 640x480 gb: group-box loose [button [gb/offset/x: 200] image fstk-logo]] ne1uno 18:31thanks, didn't think to try loose. win7, image stays even with your example. I can work around it with base for now. greggirwin 18:32Win7 does have some other special handling needed. If there's no ticket for something like this, please open one for @qtxie. meijeru 21:04I discovered there are two functions alert, one in %environment/functions.red, and one in %modules/view/backends/android/gui.red. It looks to me like the latter one is not called from within any source file. Saturday 22nd December, 2018 greggirwin 02:32@meijeru that may be a TBD when the Android branch gets more work done on it. Sunday 30th December, 2018 gltewalt 01:39Why is there focus, set-focus, and selected? endo64 02:08focus is used in VID, set-focus is a function. gltewalt 02:11Ah, it uses selected toomasv 05:46Yes, only selected facet of window face sets focus. set-focus is just short-cut to set this facet. koba-yu 14:20Hi, I'm learning rich-text. Feels it really cool! BTW it seems trimming trailing spaces so can't put underline on the end. is it by design...? view [rich-text data [ u " ^/" /u ; no underline u "a ^/" /u ; only "a" underlined u "a b^/" /u ; all underlined u " a^/" /u ; all underlined ] ] toomasv 15:27@koba-yu But you can do something like this: view [ rt: rich-text data [ u { ^/a ^/a b^/ a^/} /u ] button "probe text" [probe rt/text] ] It doesn't render space-filled line-endings though. They are not trimmed, just not rendered. koba-yu 15:39@toomasv thank you for your reply. 15:40 red view [ rt1: rich-text data [u {a} /u] rt2: rich-text data [u {a } /u] button "probe data" [probe rt1/data] button "probe data" [probe rt2/data] ] toomasv 15:40:smile: koba-yu 15:40it keeps data also as well as text. so yeah, it just not rendered? 15:41I am just wondering it is specifiaction or not, generally applications render underline when the row has only spaces? Though I do not have serious problem for it so far. toomasv 15:43Let's see if some more knowledgeable one has to say something about this. koba-yu 15:44@toomasv I see, thanks. anyway I feel rich-text is very fun feature toomasv 15:45@koba-yu It is indeed! Have you tried also its multi-slot feature? koba-yu 15:51Not yet. To tell the truth, I have just understood what blog's code mean(to some extent it because I am not so good at English...), yesterday. I am not clear for single-box mode and multi-box mode yet. but I keep catching up! toomasv 15:53:+1:``
