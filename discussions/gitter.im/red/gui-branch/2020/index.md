# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2020

## Thursday 2nd January, 2020

liangliangsun

[06:48](#msg5e0d9239d31dba03fde3537e)view \[ button red ] ; color " red " doesn't show correct in win10, is this normal? it work OK in rebol .

greggirwin

[08:25](#msg5e0da901fd580457e7af7375)Red currently uses native widgets, though experimental work has been done to support a Red-native GUI system. Native widgets impose certain limitations, such as color on buttons.

pekr

[08:29](#msg5e0da9dceac8d1511e9af85e)I can imagine there being a mix of native and Red custom widgets. Even R2 had two buttons, button and btn :-)

greggirwin

[08:31](#msg5e0daa480fd3413f4c92d9e3)But neither of those were native. Skinning custom widgets across platforms will be a lot of work, though some things will need to be done, because the differences are too deep across platforms.

GiuseppeChillemi

[09:01](#msg5e0db17ed5a7f357e6bf3bd2)I ask again here: is the new diagrams creation software based on Toomas diagram dialect?

pekr

[09:23](#msg5e0db67b0c3aeb107d903e7c)I would suppose being so, based upon the fact, that Toomas is part of the team?

toomasv

[09:29](#msg5e0db7f8eaa2cd096fdedf5d)@GiuseppeChillemi No, it isn't.

GiuseppeChillemi

[09:59](#msg5e0dbef30c3aeb107d907857)@toomasv I would have liked it a lot !

toomasv

[14:48](#msg5e0e02b1eaa2cd096fe0d683)I hope you'll like it nevertheless :smile:

GiuseppeChillemi

[15:04](#msg5e0e06852d574c7d1efabf3b)It depends: if the creators maintain the quality of your works I will like it.

toomasv

[15:57](#msg5e0e12e96ff7ae03fc8b4f92)You are too generous :blush:

## Friday 3th January, 2020

Rebol2Red

[00:22](#msg5e0e8947016ca663c17e59bf)\[!\[test.jpg](https://files.gitter.im/red/red/gui-branch/sjUy/thumb/test.jpg)](https://files.gitter.im/red/red/gui-branch/sjUy/test.jpg)

[00:22](#msg5e0e894d3062aa3e8de6f5ab)Shouldn't the text "testtext:" and the text "test" be at the same "pixelline"?  
Text "test" is about 2 or 3 pixels lower than text "testtext:"

```
view [
	space -12x0
	t: text 110x38 font-size 20 "testtext:"
	f: field 110x38 font-size 20 "test"
]
```

greggirwin

[00:58](#msg5e0e91a7316c147327070458)Red doesn't have fine-grained control over native OS widgets. Remove your `font-size` setting and see the difference.

Rebol2Red

[01:03](#msg5e0e92e5865af87363abd9a3)I understand it's not to blame Red but is there an easy way to get the alignment right in my example (besides using at)? The font-size 20 i need to keep because my eyes aren't what it used to be :(

toomasv

[04:41](#msg5e0ec60914328863c000c18d)@Rebol2Red One simple way is to use e.g. `pad 0x-3` or similar before field (or before text the other way around).

meijeru

[17:52](#msg5e0f7f636dda2430fec2f7ab)My experience is pad 0x-4

greggirwin

[18:00](#msg5e0f8120a86f9758ccc1cdf7)Something to note in a GUI hints wiki page.

## Saturday 4th January, 2020

henrikmk

[17:07](#msg5e10c65a865af87363ba84a7)One reason I'm not a fan of using native widgets. :-)

## Monday 6th January, 2020

pekr

[18:34](#msg5e137dcca74ac8537763259a)I have just spotted Particles related commit so I gave it a try under a D2D branch. It works and seems to be faster too. Just a note - not trying to compare speeds, just enjoying the amusement when trying new stuff ;-)

[18:34](#msg5e137dd13679536f961cfed4)\[!\[obrazek.png](https://files.gitter.im/red/red/gui-branch/uYPz/thumb/obrazek.png)](https://files.gitter.im/red/red/gui-branch/uYPz/obrazek.png)

henrikmk

[18:44](#msg5e1380149c13050f1f855afe)@pekr that's a pretty good speed increase

pekr

[18:48](#msg5e1380f3a74ac85377633caf)Well, I would not dare to state that ... yet. The D2D port might not be complete and also the script method of fps calculation might be flawed - just lower number of particles under cca 5 particles and you will see the fps to skyrocket. Move it back to a higher number of particles and it stays high, something like thousands of fps ....

henrikmk

[19:01](#msg5e1383fa810a1042cb7618c2)ah, ok

[19:02](#msg5e13843e09534142ca1e67b9)would like to see that demo changed, so that you can full screen it. it's a notorious problem in REBOL that full screen stuff becomes very slow. hopefully Direct2D is almost immune to that.

## Wednesday 8th January, 2020

qtxie

[11:13](#msg5e15b96709534142ca2e17f5)@pekr Good to know. I just tried it on my laptop which has a NVIDIA GeForce MX150 GPU. It's indeed faster. I got \*\*80\** FPS with 100 particles.

pekr

[12:08](#msg5e15c65ac395034902650db5)I wanted toc ompare with R2, but it does not have fps counter. @qtxie - try please following - lower the number of particles down to cca 0-5, then you will see fps to skyrocket and stay there. There might be some weak point in the fps calculation. Also - can View somehow easily maximise window, via some flag?

[12:09](#msg5e15c68804adee486b50a5b4)Anyway - for comparison purposes, it is goog to let it the way it is. Nice to see, that your numbers are higher. I have just a notebook with chipset intel gfx ....

planetsizecpu

[15:52](#msg5e15fad204adee486b52296f)Good stuff, I also noted some enhacement in view speed and gave some advantage to the player by pushing up (down) the game clock from `GameRate: 0:00:00.004` to `GameRate: 0:00:00.003` So the boy management is refreshed more quickly.

[15:55](#msg5e15fb56a1e150490123ee8d)\[!\[cavetest112.gif](https://files.gitter.im/red/red/gui-branch/gqF7/thumb/cavetest112.gif)](https://files.gitter.im/red/red/gui-branch/gqF7/cavetest112.gif)

GiuseppeChillemi

[23:42](#msg5e166900810a1042cb8a259a)Waiting for the OpenGL, DirectX backends and Unity or Unreal engines.

[23:43](#msg5e16691204adee486b5533ef)😉

## Thursday 9th January, 2020

pekr

[08:11](#msg5e16e01ea74ac853777ae597)New calendar widget arrived just on time. I need my user to select a date range and my initial idea was to use just a console and `ask`.... now I might thinkg about a GUI version:

```
pick-a-date: func [target][
   view/options [
      cal: calendar 
      button "OK" [
         target/text: to-string cal/data
         target/data: cal/data
         unview
      ]
   ][text: "Select a date ..."]
]

view [
   text 60 "Date from:" 
   date-from: button 80 "" [pick-a-date date-from]
      
   text 50 "Date to:"
   date-to: button 80 "" [pick-a-date date-to]

   do [
      date-from/text: to-string now/date
      date-to/text: to-string now/date
   ]
]
```

planetsizecpu

[09:11](#msg5e16ee349c13050f1f9d1d12)Well done, but keep in mind that there may be a embedded `request-date` function on the way, who knows. I tested `calendar`this morning and found this issue when big size is used:

[09:11](#msg5e16ee3809534142ca365529)\[!\[cal.png](https://files.gitter.im/red/red/gui-branch/tB3h/thumb/cal.png)](https://files.gitter.im/red/red/gui-branch/tB3h/cal.png)

GiuseppeChillemi

[09:12](#msg5e16ee6a9c13050f1f9d1f18)Great Work !

pekr

[09:13](#msg5e16ee9ce409da486cee0596)What I miss in Redbol, is some `to-local-date`.... I don't like visually `9-Jan-2020`, it is not local to our users .... I might write one, but would prefer an inbuilt variant ....

[09:14](#msg5e16eeee3679536f9634e085)IIRC, there is some locale in the system structure, but Rebol never went so far, that it would allow you to switch locales, as it was with Amiga :-) You can try `help system/locale`

planetsizecpu

[09:47](#msg5e16f6b8e0f13b70c9592e2a)I found there is a `to-local-date` already on Red last build

pekr

[09:56](#msg5e16f8bae52f635378ad645f)But it returns the date with the timezone: `9-Jan-2020/1:00:00+01:00`whereas I would like to get: `9.1.2020`

[09:58](#msg5e16f93e09534142ca36a964)But - it is really a small problem for me recently. I am building local date using: `date: now/date rejoin [date/day "." date/month "." date/year] == "9.1.2020"`

[09:59](#msg5e16f972e52f635378ad6a47)That's where I like redbol - spending time on thinking, if it is worth to write a function for that, when the code is so easy :-)

[10:34](#msg5e1701b0810a1042cb8e01cc)I am outputting text into an `area`. Could it be made to scroll automatically or by setting some parameter? I can see an options blokc `options: [style: area vid-align: top at-offset: none]`, but setting `vid-align: bottom`did not hlep. Maybe an offset? But how to calculate that?

[10:46](#msg5e17046ba74ac853777be0dd)Hmm, replying to myself - consulting docs it states: "A vertical scroll-bar can appear if all lines of text cannot be visible in the area (might be controlled by a flags option in the future).", so most probably not supported yet ....

hiiamboris

[10:53](#msg5e17062a09534142ca36f858)Likely not. I've been writing a log into area and faced the same problem. But dropped the idea and just reversed the log in the end.

pekr

[11:15](#msg5e170b5ee0f13b70c959c96d)Reversing the log would seem a bit weird in my case , but will think about it :-)

[13:44](#msg5e172e2ba1e15049012b950d)\[!\[obrazek.png](https://files.gitter.im/red/red/gui-branch/uubM/thumb/obrazek.png)](https://files.gitter.im/red/red/gui-branch/uubM/obrazek.png)

[13:44](#msg5e172e2ca74ac853777d0d17)@qtxie Just wondering. I am calling a function upon a button press, which is supposed to loop over the range of dates and download CSV files per particular day. Upon each day/iteration, I emit a log line into an area. It has similar symptoms to console = not updated, untill the loop is finished. I thought this symptome is related only to a GUI console, not to a GUI apps? But maybe a console uses just the same area widget? No big deal, if it is the case, I will have to wait till the 0.7 is out and the output fixed ...

[13:52](#msg5e173007c3950349026e256d)What is the best way to align texts to the middle of fields/buttons?

[13:52](#msg5e17300ae52f635378aeea9f)\[!\[obrazek.png](https://files.gitter.im/red/red/gui-branch/wDLO/thumb/obrazek.png)](https://files.gitter.im/red/red/gui-branch/wDLO/obrazek.png)

[13:55](#msg5e1730d8e52f635378aeef21)I don't seem being able to set an offset at VID level, nor there is `with` keyword an `options` one is setting an options block:

```
type: 'text
offset: 10x10
size: 104x25
text: "test the alignment"
image: none
color: none
menu: none
data: [test the alignment]
enabled?: true
visible?: true
selected: none
flags: none
options: [style: text vid-align: top at-offset: none]
```

[13:56](#msg5e1730f8c3950349026e2ca6)Sorry if answers are obvious, just getting into Red GUI internals ....

toomasv

[14:10](#msg5e17346209534142ca3847d9)@pekr

```
view [box 70x50 right middle "centered" field 150x50]
```

[14:11](#msg5e17349a0ba7b60f204d4d81)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/bjx1/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/bjx1/image.png)

hiiamboris

[14:15](#msg5e173597a74ac853777d46d1)`field` however will be aligned to top ;)

pekr

[14:16](#msg5e1735b20ba7b60f204d5716)Can you do the same with just the `text`instead of the `box`? Does not work here. Also - mine does not seem to be correctly centered ...

[14:16](#msg5e1735c2e409da486cf00fac)\[!\[obrazek.png](https://files.gitter.im/red/red/gui-branch/85ai/thumb/obrazek.png)](https://files.gitter.im/red/red/gui-branch/85ai/obrazek.png)

hiiamboris

[14:25](#msg5e1737c0821b826f5a905206)The `text` OS widget doesn't support vertical alignment

pekr

[14:26](#msg5e17381dc3950349026e59ef)I will restyle txt with slightly different offset: `view [txt: text "test the alignment" field do [txt/offset: 10x13]]`

hiiamboris

[14:30](#msg5e173907bdcaea1891232efc)I think vertical alignment for `box` is broken again too ;)

[14:40](#msg5e173b4655975518904a4283)Reported https://github.com/red/red/issues/4229

pekr

[14:40](#msg5e173b6b821b826f5a906bce)Any example of `style`usage with an `options`? How can I override the default `text` offset easily?

hiiamboris

[14:42](#msg5e173bf091129970ca985a81)`pad`

[14:43](#msg5e173c1509534142ca388019)`style x: y pad AxB`

pekr

[15:21](#msg5e1744e1e409da486cf07b45)So no chance of directly setting a facet?

[15:24](#msg5e1745ab55975518904a8d03)btw - pad example does not seem to work properly. it just pads everything following ....

hiiamboris

[15:35](#msg5e174842a1e15049012c20a2)Hmm. True. Bug or feature, I wonder?

dockimbel

[15:38](#msg5e1748f0e0f13b70c95b80cc)In case you've forgot, VID is \[documented](https://doc.red-lang.org/en/vid.html#\_pad):  
&gt; Modifies the layout current position by a relative offset. All the following faces on the same row (or column) are affected.

[15:39](#msg5e17491be52f635378afaad6)`pad` works exactly the same way as in R2/VID.

toomasv

[15:40](#msg5e17495ce0f13b70c95b8316)@pekr Maybe thus:

```
lay: layout [text right "First:" field return text right "Second:" field] 
foreach-face/with lay [face/offset: face/offset + 0x12][face/type = 'text] 
view lay
```

[15:40](#msg5e17496009534142ca38e092)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/dsCY/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/dsCY/image.png)

pekr

[15:42](#msg5e1749f609534142ca38e795)I do vaguely remember the discussion, when RT worked on R3/View. R2 allowed direct modification of facets, which led to many user errors .... R3 tried to introduce accessors. I was briefly looking into docs before, but you know the case - the fun starts once you try to do something in real life. No worry, I enjoy it and my small utility for one departments is functional, including new calendar widget :-)

[15:44](#msg5e174a4ce0f13b70c95b88b1)@toomasv `foreach-face`!!!! :-)

toomasv

[16:11](#msg5e1750a2bdcaea189123e35d)Yeah, what about it?  
Also

```
lay: layout [
    style tx: text right on-created [face/offset: face/offset + 0x12] 
    tx "First:" field 
    return 
    tx "Second:" field
] 
view lay
```

pekr

[16:12](#msg5e1751080ba7b60f204e2955)forgot about the reactors, so thanks a lot ...

[16:15](#msg5e1751920ba7b60f204e2e64)I was looking for some options or "with" (remembered them from past) or some facets being exposed via a keyword, like e.g. font is ....

[16:15](#msg5e1751a104adee486b5b71d2)But on-created is fully sufficient and nice ....

[16:25](#msg5e1753e7e0f13b70c95bcd14)I think that text could have modified offset by 3 pixels on the Y axis. But maybe it is just about adding a new label style, which would be center aligned vertically with fields and buttons .... Looks better now:

[16:26](#msg5e17543c09534142ca3932b5)\[!\[obrazek.png](https://files.gitter.im/red/red/gui-branch/oyQ6/thumb/obrazek.png)](https://files.gitter.im/red/red/gui-branch/oyQ6/obrazek.png)

dockimbel

[18:38](#msg5e177329c3950349026fb52d)The adjustment amount depends on the font size. Though, the widget could do a better job by default to be horizontally aligned with fields. Maybe worth a ticket to see if it's possible to improve that in the widget settings internally.

greggirwin

[22:33](#msg5e17aa55bdcaea1891269345):point\_up: \[January 9, 2020 2:56 AM](https://gitter.im/red/red/gui-branch?at=5e16f8bae52f635378ad645f) @pekr this is what the `format` dialect will be for.

## Friday 10th January, 2020

henrikmk

[15:41](#msg5e189b13e52f635378b911af)I would say that every widget should center text by default. (and of course then do it correctly) there should not ever be any fumbling around with margins, paddings or offsets to produce a correct layout.

## Sunday 12nd January, 2020

pekr

[09:02](#msg5e1ae0a7dbacf55b3df27263)I have roughly adapted my news-scroller to the Red and would like to ask, if I construct the event loop properly? Because - it either flies so fast, you can't even read the text, or whatever the `wait` value is, it seems really slow ....

```
forever [
   wait 0.001
   news/offset: news/offset - 1x0
   if (news/offset/x + (first text-size)) < 0 [news/offset/x: screen-size/x]
   do-events/no-wait
   show win
]
```

You can run the script by: `do http://2zone.cz/pekr/news-scroller-red.red` or alternatively an R2 version: `do http://2zone.cz/pekr/news-scroller-r2.r`

hiiamboris

[10:12](#msg5e1af10c6f6041529928ff35)Use `rate 70 on-time [...]` instead and calculate offset from the time passed.

[10:13](#msg5e1af14fdbacf55b3df2d81a)R2 code works because of optimized rendering engine that makes rendering time either negligible or constant

pekr

[11:22](#msg5e1b018e6f60415299296153)OK, will try, thanks. So we don't have optimized rendering engine (yet) with Red? Or just engine being different, so we need to treat (think about) stuff differently?

[12:03](#msg5e1b0b08cb2aaa2d7825d61f)I have a proposal - playing with VID for last few days, I miss one keyword exposed to the Red level - `offset`. We've got 4 keywords dedicated to fonts, yet I am not able easily shift the certain widget few pixels here or there "easily". I don't want to necessarily interfere with the widget placemen and we've got `pad`element, but I wonder if anyone would find it particularly useful?

[12:37](#msg5e1b12f83254b6754c9606a5)Hmm, I seem to fail with some basic stuff :-(

1\) Why are VID styles listed in the View does, instead of a VID one? I would expect stuff like face composition, events, actors, etc. in View, but rest in VID one.  
2\) Why I am failing to set an offset for a `base`style, whereas e.g. color works? `view [b: base red 300x100 with [color: blue offset: 100x10]]`  
3\) Is a "do" block for a `base` implicit? This works: `view [b: base red 300x100 with [color: blue offset: 100x10] [print face/offset]]`, whereas following does not: `view [b: base red 300x100 with [color: blue offset: 100x10] on-click [print face/offset]]` (can't see `on-click`defined for `base`, but how is that just plain block works?

hiiamboris

[12:47](#msg5e1b1566cb2aaa2d78261d55)

```
>> ? system/view/VID/styles/base
SYSTEM/VIEW/VID/STYLES/BASE is a block! value.  length: 4  [default-actor: on-down
```

note `on-down`

[12:48](#msg5e1b15b2cb2aaa2d78261ff3)I suppose VID overrides `offset` (you can use `at`)

[12:53](#msg5e1b16c53254b6754c961f84)&gt; OK, will try, thanks. So we don't have optimized rendering engine (yet) with Red?

No, not at all. On Windows stuff is drawn using GDI and GDI+ mix (both pretty slow and buggy tech, not optimized for animations). Not to mention time between frames depends on very ancient API and is simply spiky (see https://github.com/red/REP/issues/26). D2D may improve your lag, but it'd really better if you consider lag in your code logic

pekr

[13:02](#msg5e1b18cb6f604152992a0a71)Thanks ... I am watching D2D implementation as well ...

[13:02](#msg5e1b18ecdbacf55b3df3f4ac)Feels really weird that I can overide color with the `with` block, but offset can't be overriden ....

hiiamboris

[13:06](#msg5e1b19dbcb2aaa2d78263fdc)Even D2D draw is no panacea. Ideally for flawless animations we have to consider vsync in View engine itself. Even then, we'll likely have to make sure DDraw operations work on the screen directly, not on some internal buffers, because if we ultimately let Windows update the window contents, we won't achieve vsync on W7 (in classic non-aero mode) and WXP.

[13:12](#msg5e1b1b3d65badf754d75ee54)I got `mpv` player using D3D for output and guess what? Constant screen tearing, because it doesn't work in exclusive (fullscreen) mode.

pekr

[13:25](#msg5e1b1e5e1cf5106b350a6e8a)@qtxie (or whoever working on D2D branch) - there seems to be difference on text positioning on the base - GDI version has it centered, whereas D2D one seems to have it top-left? `view [b1: base 500x500 "Test" at 100x100 b2: base red 200x200 "Test2" rate 10 on-time [face/offset: face/offset - 1x0]]`

[13:27](#msg5e1b1ecc6be93b6b36cc2fee)I thought at least WXP being obsoleted, so expected just some emergency fall-back updates using GDI. with Win7, I am not sure. Would concentrate upon the 8.1 +, but there still might be many Win7 in use, if not the majority ....

[15:01](#msg5e1b34e7cb2aaa2d782703a9)@hiiamboris Does any Win api support vsync though? I remember some discussions with Carl, wherehe stated poor animation support under Win, where even double buffering would not be sufficient and he mentioned Amiga having a vsync support. But maybe D2D supports that already?

[15:04](#msg5e1b357bb720fa5b3c003a6e)The discussion happened a long time ago though ... Back then, also some more sophisticated even loop was under consideration. Dont remember its name, something lomg the kque, libevent, or such ...

hiiamboris

[15:24](#msg5e1b3a1bb720fa5b3c005653)I do not possess enough info, sorry. I vaguely recall in very old builds of `mpv`, there was an OpenGL renderer on which I did not see screen tearing. So there must be some hacks scattered around, but this needs research, and likely amount of research needed is more than it's worth, so.. I would not get my hopes high about W7☻  
On W7/aero and W8+ windows are always vsynced, you just need to time your frames properly. Or use 100+ Hz refresh rates (the eye doesn't see things happening in 10ms time).

## Monday 13th January, 2020

pekr

[06:31](#msg5e1c0ec4b720fa5b3c05d6c9)@qtxie just a question - font size does not work yet in the D2D branch? Or is that bug I found?

qtxie

[07:01](#msg5e1c15e0b990d50d81a40ca0)@pekr No work yet.

## Tuesday 14th January, 2020

toomasv

[15:02](#msg5e1dd80a6f604152993cf3f3)Is it possible to eliminate (or reduce) flickering in the following without eliminating panels? (flickering is gone if boxes are on top level):

```
view [
    space 0x0 
    pb: panel [
        origin 0x0 
        box 300x300 blue react [
            face/size/x: face/parent/size/x
        ]
    ] 
    sp: base 10x300 loose 
        on-down [ofsy: face/offset/y system/view/auto-sync?: off] 
        on-up [system/view/auto-sync?: on] 
        on-drag [
            face/offset/y: ofsy 
            pb/size/x: face/offset/x - 10 
            pr/offset/x: face/offset/x + 10 
            pr/size/x: face/parent/size/x - face/offset/x - 20 
            show [face pb pr]
        ] 
    pr: panel [
        origin 0x0 
        box 300x300 red react [
            face/size/x: face/parent/size/x
        ]
    ]
]
```

[15:03](#msg5e1dd8546f604152993cf6af)Try dragging on middle gray bar.

loziniak

[15:07](#msg5e1dd92365badf754d88863f)Tried on Linux/GTK. No flickering :-)

toomasv

[15:07](#msg5e1dd93843c3b62d79f37965)Poor Windows :(

loziniak

[15:08](#msg5e1dd96a1cf5106b351cbd69)Maybe it will be gone with Direct2D implementaton...

toomasv

[15:09](#msg5e1dd9ac65badf754d8888a7)Hopefully.

hiiamboris

[15:11](#msg5e1dda158d9f831bc528faef)`system/view/auto-sync?: no` reduces it

[15:14](#msg5e1ddac7b990d50d81b044c1)I mean, globally, not during clicks

[15:19](#msg5e1ddc0cdbacf55b3d071121)Better hack: add `with [color: blue]` after 1st panel and `with [color: red]` after 2nd

[15:20](#msg5e1ddc431cf5106b351cd293)Or `color: glass`

[15:23](#msg5e1ddceb65540a529a164d5a)I'm getting crash from calling `do-events/no-wait` from within `on-drag` actor

ne1uno

[15:23](#msg5e1ddcf5b990d50d81b051f4)very smooth in D2D branch, refresh seems slower there too

toomasv

[15:23](#msg5e1ddd016f604152993d1659)Hm, neither moving `auto-sync?: no` before `view` and removing it from `down`/`up` events nor `with` trick seem to help. Unfortunately `color: glass` is out of question.

[15:24](#msg5e1ddd35b990d50d81b05442)Thanks @ne1uno !

hiiamboris

[15:26](#msg5e1ddd9bb720fa5b3c1229be)&gt; color: glass is out of question.

why?

toomasv

[15:29](#msg5e1dde3d3254b6754ca906f2)Different styles with different colors are used.

hiiamboris

[15:30](#msg5e1dde801cf5106b351ce2c2)It's for the panel I mean

[15:30](#msg5e1dde86a859c14fa1e4aa51)

```
Red []
view [
    space 0x0 
    pb: panel [
        origin 0x0 
        box 300x300 blue react [
            face/size/x: face/parent/size/x
        ]
    ] with [color: glass]
    sp: base 10x300 loose 
        on-down [ofsy: face/offset/y system/view/auto-sync?: off] 
        on-up [system/view/auto-sync?: on] 
        on-drag [
            face/offset/y: ofsy 
            pb/size/x: face/offset/x - 10 
            pr/offset/x: face/offset/x + 10 
            pr/size/x: face/parent/size/x - face/offset/x - 20 
            show [pb pr face]
        ] 
    pr: panel [
        origin 0x0 
        box 300x300 red react [
            face/size/x: face/parent/size/x
        ]
    ] with [color: glass]
]
```

[15:30](#msg5e1dde8d6be93b6b36deee73)this works best on W7 for me

[15:31](#msg5e1ddee53254b6754ca90aab)the only glitch is `sp` bar being thrashing a little, and the red base `pr`, when you move it to the right, gets redrawn on a new position (with older bigger size), and gets redrawn again with a new smaller size, which must be a View bug

toomasv

[15:32](#msg5e1ddf110e65654fa0e0fcaf)On panel sill flickering, BUT using alpha on boxes helps!

[15:33](#msg5e1ddf4b65540a529a165c0c)Thanks, @hiiamboris , I will try later again, have to go now.

hiiamboris

[15:34](#msg5e1ddf781cf5106b351ce8cd)In the meantime, I'll report this mess ;)

toomasv

[20:31](#msg5e1e2535dbacf55b3d09235a)After trying again, I see three options: 1) add alpha: 1 to boxes (easiest but it would distort viewing on W7?) 2) lift boxes to top level (more complex code) 3) wait for D2D.

hiiamboris

[20:34](#msg5e1e25d76be93b6b36e100be)don't add alpha to boxes :)

dockimbel

[20:40](#msg5e1e2729a859c14fa1e6a00e)@qtxie ^--- What do you think?

## Thursday 16th January, 2020

planetsizecpu

[11:55](#msg5e204f3c714883789884b7d9)After finishing L11 with @greggirwin 's (thx) suggested teleporter to the sphinx, I did some update on L2 and L3 scenarios as I realised it could be room for more fun, just for those who like play (if there is some).

[11:57](#msg5e204f96a50f33623f481264)\[!\[cavetest113.gif](https://files.gitter.im/red/red/gui-branch/Essq/thumb/cavetest113.gif)](https://files.gitter.im/red/red/gui-branch/Essq/cavetest113.gif)

[12:27](#msg5e20569ead195a0f671a64ad)\[!\[cavetest114.gif](https://files.gitter.im/red/red/gui-branch/prck/thumb/cavetest114.gif)](https://files.gitter.im/red/red/gui-branch/prck/cavetest114.gif)

greggirwin

[18:53](#msg5e20b13f000f4978990a40ae)Ha! I haven't noticed cobwebs before, and the trick of grabbing the bar so the car hits the guard is nice.

## Saturday 18th January, 2020

planetsizecpu

[09:29](#msg5e22cff5ea55e3623e74f006)Yeah, the kart only kill the guards when the boy is inside, but no when unloaded, it also kill the boy if he is not in the handle or not well grabbed. On L2 I decided to put quicksand by adding a bit more RGB intensity to floor colour, so the gravity function works as no floor, so easy. L3 is a bit more refined than the showed here, I will upload to my repo when ready 🙄

luce80

[14:38](#msg5e23185e3ea53f0f66461295)@toomasv on my W7 with december 0.6.4 build things get strange. Adding 0.0.0.0 is enough to avoid flickering but then red box grows and shrinks to the right (out of the right margin of the window !) instead of toward the blue box !

toomasv

[16:29](#msg5e23326a4c1f9679ec0a8d06)@luce80 Thanks for interesting details! W7 is mystery to me :)

pekr

[17:10](#msg5e233beba1dfaa3ba13f70b1)Red box shifted to the right out of the margin too and I have Win10.

toomasv

[18:24](#msg5e234d75dd1429262d49ae89)You mean, it is not like this?:  
\[!\[panels-flicker](https://toomasv.red/images/Varia/color-by-dragging.gif)](https://toomasv.red/images/Varia/color-by-dragging.gif)

hiiamboris

[18:27](#msg5e234dff5b81ab262e4b6817)https://github.com/red/red/issues/4239

toomasv

[18:50](#msg5e23538e0289c83ba2bde53a):+1:

## Monday 20th January, 2020

GalenIvanov

[13:23](#msg5e25a9e23ea53f0f66575fb1)I'm working on a new game in the realm of the Hamiltonian cycles. This time the loop on a `nxn` grid is split into `n` segments. The goal is to form a closed loop in the dotted area by dragging/rotating/flipping the segments.

[13:24](#msg5e25a9f60dbd9379ed6ac4db)\[!\[Looper.png](https://files.gitter.im/red/red/gui-branch/ppqk/thumb/Looper.png)](https://files.gitter.im/red/red/gui-branch/ppqk/Looper.png)

[13:27](#msg5e25aad70289c83ba2ce0c6e)There's much work to be done - now the segments are static, I need to make them draggable and to decide what the interface for rotation/flipping will look like; checking for a valid solution is also waiting to be completed.

[13:30](#msg5e25ab66c7647778a5f6e0b3)I think it will be much harder than my "Island Alleys".

toomasv

[14:03](#msg5e25b322ea55e3623e889716)@GalenIvanov Sounds quite challenging!

GalenIvanov

[14:07](#msg5e25b43b20d0f078a6ae5743)@toomasv We'll see when it's finnished :)

loziniak

[14:30](#msg5e25b96da33d6607d5780fd3)Hi! Are `field` and `area` the only faces that can react to key press?

[14:32](#msg5e25ba170afc1c69cff0f015)I display a `base` and I would like it to be closed by \[ESC].

[14:34](#msg5e25ba830afc1c69cff0f45c)Probably I should `set-focus` to it? If so, it seems like `set-focus` does not work, because `base`'s actors do not fire.

[14:35](#msg5e25bab6e82e610f9c85ccd9)Or perhaps `base` cannot get focus?

hiiamboris

[14:38](#msg5e25bb4c03278907d40a4785)@loziniak `set-focus`, yes. It works on Windows

loziniak

[14:39](#msg5e25bb9c60ffd038abcc7712)checked now, indeed. so, filing a bug for GTK :-) thanks!

hiiamboris

[14:39](#msg5e25bba372359f323dee0a99):+1:

greggirwin

[20:00](#msg5e2606ef1a9c3751d4eae8c5):point\_up: \[January 20, 2020 6:23 AM](https://gitter.im/red/red/gui-branch?at=5e25a9e23ea53f0f66575fb1) Very cool @GalenIvanov.

planetsizecpu

[20:08](#msg5e2608a072359f323df0474c)Push hard @GalenIvanov

GalenIvanov

[20:36](#msg5e260f64c716570f9b86208b)@greggirwin @planetsizecpu Thank you, it's a good exercise!

## Monday 27th January, 2020

planetsizecpu

[08:39](#msg5e2ea1b3cd53a80aac32cc36)\[!\[cavetest115.gif](https://files.gitter.im/red/red/gui-branch/jXyp/thumb/cavetest115.gif)](https://files.gitter.im/red/red/gui-branch/jXyp/cavetest115.gif)

[08:39](#msg5e2ea1c444c076313cf3943d)Here is the definitive L3 level, it has taken a little bit to tune all the alleys. The next job will be to check the levels where there are ice caves, I think they are too difficult to overcome, maybe with some extra stairs &amp; pickaxes, I will know by playing some games, we'll see 🤷‍♂️

GalenIvanov

[09:13](#msg5e2ea9be9ad22d5bd5ea1148)@planetsizecpu It looks very cool! BTW, do you know the work of Joakim Sandberg? He makes great platformers like 'Noitu Love 2: Devolution' and ' Iconoclasts'?

[09:18](#msg5e2eaaf63482927279373f37)I'm approaching the final stages of development of my game "Looper" (working title) . The major unimplemented feature is the check for a valid solution. Despite this the game is completely playable - the lines can be dragged, flipped or rotated.

[09:19](#msg5e2eab0a1a1c2739e309d11b)\[!\[Looper.png](https://files.gitter.im/red/red/gui-branch/15go/thumb/Looper.png)](https://files.gitter.im/red/red/gui-branch/15go/Looper.png)

planetsizecpu

[09:19](#msg5e2eab1044c076313cf3cfe6)I don't know him, it's the first time I hear about him, because I'm not up to date on the world of video games, it seems interesting. Thx anyway.

[09:19](#msg5e2eab31e177666195d814b7)Looks so cool!

GalenIvanov

[09:20](#msg5e2eab479ad22d5bd5ea1b5a)You can try the Looper here: https://github.com/GalenIvanov/Games/blob/master/Looper.red

[09:23](#msg5e2eac2b44c076313cf3d5a5)@planetsizecpu Thanks! About Joakim - I've been playing some minimal logic/puzzle games recently and browsing Steam for inspiration.

[09:26](#msg5e2eacaedc07667042febbf4)If someone tries to play my game, it will help him/her if he/she uncomments the `keep`block after `;if solved [` - this will show the area that is enclosed by the loop.

[09:27](#msg5e2ead19a420263e03a8ffeb)\[!\[Looper\_hint.png](https://files.gitter.im/red/red/gui-branch/jut0/thumb/Looper\_hint.png)](https://files.gitter.im/red/red/gui-branch/jut0/Looper\_hint.png)

loziniak

[09:31](#msg5e2eadff44c076313cf3decf)@GalenIvanov I like the colors you use.

GalenIvanov

[09:34](#msg5e2eae9344c076313cf3e3d9)@loziniak Thank you!

endo64

[11:19](#msg5e2ec74f1a1c2739e30a9076)@GalenIvanov Very nice!  
I can open many About window. Is it Looper (in Github), Loope (in about window) or Loop-it (on window title)?  
Can't flip or rotate the item.  
Could be easier it pieces is in different color, its difficult to pick them after dropping

GalenIvanov

[11:29](#msg5e2ec9891a883c61961998d0)@endo64 My name is Legion :) I'll put the same name everywhere when I chose it. Your're right about `About` window - it's not modal. I'll fix it later. To flip or rotate the pieces you need to start dragging them and hover them over the icons in the central bottom part of the screen. The symbol temporarily disappears - you need to left the area in order to activate it and use it again

toomasv

[15:45](#msg5e2f05b744c076313cf64fbd)Very nice, @GalenIvanov, congratulations!

[15:46](#msg5e2f05bc01914e3e0459f8c5)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/C2zx/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/C2zx/image.png)

[16:00](#msg5e2f091cdc07667042013d42)Some are quite tough.

greggirwin

[17:03](#msg5e2f17fda420263e03ac0c84)@planetsizecpu @GalenIvanov thanks for the updates!

GalenIvanov

[19:34](#msg5e2f3b4bcd53a80aac3731a6)Thank you, @toomasv @greggirwin !

## Wednesday 29th January, 2020

GalenIvanov

[10:04](#msg5e3158b8fe0e6f74e9dd052e)I recorded a video while playing the Looper game: https://www.youtube.com/watch?v=emjGl\_HVc70

rebolek

[10:10](#msg5e315a0740da694c5ee6a670)I love the controls!

GalenIvanov

[10:19](#msg5e315c20ea9ba00b848c9633)@rebolek Thanks! I decided to use this approach instead of displaying the icons next to the selected piece - it would require to release the left mouse button, to move the pointer, to click one or more times on the icon and to click once again the piece itself to drag it.

rebolek

[10:20](#msg5e315c89d9895b17c3aba346)@GalenIvanov Yes, this is really ergonomic solution IMO.

endo64

[10:25](#msg5e315da9594a0517c244d250)Nice play! Hard to guess how to use flip &amp; rotate items, may be a text says "Drag on me" could be make it easier.  
My first try was to rotate via mouse wheel and flip by right click, could be easier.

hiiamboris

[10:46](#msg5e31628e3aca1e4c5f4022ef)&gt; to rotate via mouse wheel and flip by right click, could be easier.

Wow you read my thoughts man ☻

planetsizecpu

[11:07](#msg5e31677f3aca1e4c5f404c9b)Wow! so cool @GalenIvanov +1 to mouse handling

rebolek

[11:17](#msg5e3169c240da694c5ee71f1d)@endo64 @hiiamboris Why not both?

GalenIvanov

[11:17](#msg5e3169d5d9895b17c3ac1802)@endo64 @hiiamboris If I used the method you propose, there would be situations when the flipped/rotated piece will overlap another piece in its vicinity, because I don't handle the collisions. Of course this could occur also when dragging. Right click/wheel is a good for interactions and I'll most probably use it in other projects.

[11:18](#msg5e316a003aca1e4c5f406564)@planetsizecpu Thank you! There will be more games.

greggirwin

[18:48](#msg5e31d38358f02e3497428fb8)That is a really clever UI @GalenIvanov. Very, very nice.

GalenIvanov

[20:12](#msg5e31e71e58f02e3497431ea5)Thank you, @greggirwin ! Apparently it's controversial - that makes it somewhat an "experimental" game :)  
I'll implement the right click/wheel alternative and will asses both options. Thank you guys for your comments!

greggirwin

[20:23](#msg5e31e9ccf301780b8347bce4)The same approach could be used in a color picker, as an artist would with a palette.

## Thursday 30th January, 2020

GalenIvanov

[09:43](#msg5e32a538ea9ba00b8495de89)@endo64 @hiiamboris I've added right click to flip / wheel to rotate the pieces to the controls of my game. I hope it's more handy now when there is a possibility to choose how to interact.

hiiamboris

[09:54](#msg5e32a7c0594a0517c24e14f3):+1:

greggirwin

[19:52](#msg5e33340158f02e34974c483b)Finally trying it. Very nice @GalenIvanov.

\- If I open About, I have to click Close twice to close the dialog.  
\- The dot affordance on hover is nice.  
\- Could mouse wheel and right click work if in the area bounded by a shape, rather than having to be over the white line portion? Hard to stay over it when things move.

[19:58](#msg5e333558ea9ba00b849a2302)One down, with help of the loop hint. :^)

## Friday 31st January, 2020

GalenIvanov

[07:40](#msg5e33d9fb6f9d3d34980d106d)@greggirwin Thank you, I'm glad you like it! I fixed the "About" box. Yes, I think dots add some feedback to the user experience. Honestly I haven't thought about bounding boxes, but it could certainly be done - it's a good idea. In the meantime I expanded the active area around the lines by 5 more pixels - this will help a bit.

hiiamboris

[11:20](#msg5e340d89e8a83835590668eb)@GalenIvanov One note: on a full-HD screen with 125% scaling it's window is bigger than the screen like by 5% :) I can imagine I'll see only a quarter of the window on my tablet where I'm using 200% scaling

[11:23](#msg5e340e17fe0e6f74e9f06758)Also, right-click is working (flips it), but not rotation (I think you have to manually focus the `base` to get wheel events).

GalenIvanov

[12:33](#msg5e341e95f301780b83574bdc)@hiiamboris Thanks for the comments! The scaling is apparently an issue - I haven't thought about it (until now). I don't feel like dealing with it now, just need to remember it for my next projects :). About the rotation with the wheel (it's activated by rotating the wheel, not clicking) - I haven't experienced any problems, it works fine on my machine (Win 10)

hiiamboris

[12:48](#msg5e342230bfe65274eacda089)@GalenIvanov does this code `view [base on-wheel [print event/picked]]` react to wheel events on W10?

GalenIvanov

[12:49](#msg5e342261d9895b17c3bfc4e8)@hiiamboris yes, it does:

hiiamboris

[12:49](#msg5e342273fe0e6f74e9f0fb12)Thanks, I'll report it

GalenIvanov

[12:52](#msg5e342308dc52c34ace3735be)\[!\[on-wheel.png](https://files.gitter.im/red/red/gui-branch/5pxG/thumb/on-wheel.png)](https://files.gitter.im/red/red/gui-branch/5pxG/on-wheel.png)

hiiamboris

[12:53](#msg5e342345d9895b17c3bfce9e)https://github.com/red/red/issues/4275

## Wednesday 5th February, 2020

planetsizecpu

[08:57](#msg5e3a838c6f9d3d34982057b1)Some updates to the ice caves include better loopholes and new stairs and handles for the kart, also new start points for the guards 😁

[09:01](#msg5e3a8483e8a83835591811be)\[!\[cavetest51.gif](https://files.gitter.im/red/red/gui-branch/QRYH/thumb/cavetest51.gif)](https://files.gitter.im/red/red/gui-branch/QRYH/cavetest51.gif)

[09:03](#msg5e3a84f8f301780b8368a6d1)\[!\[cavetest61.gif](https://files.gitter.im/red/red/gui-branch/QvN2/thumb/cavetest61.gif)](https://files.gitter.im/red/red/gui-branch/QvN2/cavetest61.gif)

[09:07](#msg5e3a85b758f02e3497640232)\[!\[cavetest41.gif](https://files.gitter.im/red/red/gui-branch/RxNj/thumb/cavetest41.gif)](https://files.gitter.im/red/red/gui-branch/RxNj/cavetest41.gif)

GalenIvanov

[09:33](#msg5e3a8bde433e1d403998194f)@planetsizecpu Nice!

planetsizecpu

[15:47](#msg5e3ae39658f02e3497651a88)Thx @galenivanov here is another trick really amazing, althought I hate violence, specially against woman.

[15:49](#msg5e3ae404dc52c34ace495b39)\[!\[cavetest71.gif](https://files.gitter.im/red/red/gui-branch/EtwF/thumb/cavetest71.gif)](https://files.gitter.im/red/red/gui-branch/EtwF/cavetest71.gif)

hiiamboris

[15:52](#msg5e3ae4add9895b17c3d22662)that's spawn killing!

greggirwin

[20:15](#msg5e3b2251bfe65274eae0e29a)Fun stuff, except for the spawn killing part. ;^)

## Friday 7th February, 2020

rebolek

[09:26](#msg5e3d2d4ce8a83835591ef333)What is the easiest way to update GUI from running GUI code?  
For example:

```
view [p: progress 0% button "go" [loop 10 [p/data: p/data + 10% wait 0.5]]]
```

Obviously doesn't work. But what is the easiest way to do something like this?

endo64

[09:30](#msg5e3d2e1b3aca1e4c5f6c48f4)`wait 0` seems better.

rebolek

[09:31](#msg5e3d2e6673ddad4acd9a19a9)@endo64 How so? GUI is only updated after the code ends.

endo64

[09:31](#msg5e3d2e6f40da694c5e125085)On R2 we could `wait none` to just process the events in the queue.

[09:32](#msg5e3d2ea940da694c5e12510d)On Win10 I can see the progress updates.

rebolek

[09:32](#msg5e3d2ec2433e1d40399f2714)Ah, I'm on Linux. I try in VM.

[09:37](#msg5e3d2fe2433e1d40399f2b85)@endo64 Right, it works on Windows, so it's GTK problem only. Thanks!

hiiamboris

[12:27](#msg5e3d57bde8a83835591f71fa)@rebolek https://github.com/red/red/issues/4191

[12:28](#msg5e3d57db433e1d40399fabcf)what \*should* by design work is not `wait` but `until [not do-events/no-wait]`

[12:29](#msg5e3d581c1594133558603cdc)but since it's dangerous (may deadlock), I'm using  
`do-queued-events: does [loop 100 [unless do-events/no-wait [break]]]`

[12:34](#msg5e3d595440da694c5e12d96b)https://github.com/red/red/issues/4206 some discussion about making it simpler

rebolek

[12:36](#msg5e3d59c0433e1d40399faf68)@hiiamboris thanks!

## Sunday 9th February, 2020

GiuseppeChillemi

[23:48](#msg5e409a581d23aa47aa049e27)Time ago Toomas has shown me a way to pass parameters to child windows and receiving results using functions and objects. He told me "there are other methods". Are there code samples or documentation about the different techniques for this task?

## Tuesday 11st February, 2020

Rebol2Red

[13:49](#msg5e42b0d61d23aa47aa097a37)\[!\[coord-system.png](https://files.gitter.im/red/red/gui-branch/z23o/thumb/coord-system.png)](https://files.gitter.im/red/red/gui-branch/z23o/coord-system.png)  
I want to use the above coordinate system with the draw DSL but how?

hiiamboris

[14:05](#msg5e42b49b45000661fcb3cfbb)I would recommend this: https://doc.red-lang.org/en/draw.html#\_matrix  
But you can achieve the same with `scale` and `translate` (or single `transform`) commands, although with less precision.

[14:05](#msg5e42b4bb19597421f3c14499)The key here is to use vertical scale of `-1` and origin at the desired 0x0 point

planetsizecpu

[15:38](#msg5e42ca6f55b6b04bf6a694dd)Today I had time to modify the behavior function of the guards, so avoid being repeatedly slammed against the walls when they are on the stairs at the same level as the boy. I am responsible for taking care of the staff :-)

[15:44](#msg5e42cbf819597421f3c18821)\[!\[cavetest22.gif](https://files.gitter.im/red/red/gui-branch/iw7O/thumb/cavetest22.gif)](https://files.gitter.im/red/red/gui-branch/iw7O/cavetest22.gif)

Rebol2Red

[18:38](#msg5e42f4b755b6b04bf6a71e76)Why doesn't a simple statement exists to set the graphics coordinates system to what i've i shown?  
Should'nt there be one because i think it is the most common used system. File a wish for it?

hiiamboris

[18:48](#msg5e42f70263c15921f471e700)It won't be granted IMO, as the matrix in this case will change with the image size

Rebol2Red

[18:50](#msg5e42f78545000661fcb49b59)To be honest i don't understand how to use matrix, translate and scale in this case.  
A simple statement is more convenient for me ;)

hiiamboris

[18:55](#msg5e42f88fc900d747abfb4bdc);)

[18:55](#msg5e42f8bf45000661fcb49e26)@toomasv don't you have any matrix-explorer or something demos?

Rebol2Red

[19:01](#msg5e42fa2037545d247d327bd4)My simple approach to do something like this:

```
line-: func [
	c1 c2
][
	block: copy [line]
	append block as-pair first c1 600 - second c1
	append block as-pair first c2 600 - second c2
	block
]
im: make image! 800x600
d: copy []
append d reduce [line- 0x0 100x100 line- 100x100 400x120 line- 400x120 600x30]
draw im d
view [image im]
```

But this is only for lines. You have to program for the other command too. So this is only for 'simple' graphics.

greggirwin

[19:22](#msg5e42fefedf1153705e2bb89e):point\_up: \[February 11, 2020 11:38 AM](https://gitter.im/red/red/gui-branch?at=5e42f4b755b6b04bf6a71e76) @Rebol2Red

&gt; i think it is the most common used system

What GUI systems use it? Yes, other domains use different coordinate systems, but `draw` and `View/VID` operate in a 2D GUI domain. As noted, you can adjust coordinates with commands, but we don't know what you're trying to do, so general recommendations are all we can offer.

Rebol2Red

[19:25](#msg5e42ffc063c15921f471fdc5)Run my simple approach and you see what i am trying to do. While at school i have learned only this coordinate system.  
And you are right that gui systems use this but i am human so i find "my" coordinate system way more logically.  
I feel like i am forced to use this gui coordinate system. Why do'nt i have a choice in Red to use what is convenient for me?

toomasv

[19:35](#msg5e4301eb63c15921f472013d)May be along these lines:

```
coords: [
    matrix [1 0 0 -1 50 250] 
    line 0x0 0x200 line 0x0 400x0
] 
repeat y 10 [
    append coords compose/deep [
        transform 0 1 -1 (as-pair -30 y: y * 20) [
            text 0x0 (form y)
]]] 
view/tight compose/only [box 500x300 draw (coords)]
```

Rebol2Red

[19:37](#msg5e430282b612cc7bb15f0c1a)@toomasv Just what i need but can you enlighten me on the matrix and transform command or is this easy to follow while looking into the draw commands? Just a look into the draw command will be suffic.

greggirwin

[19:38](#msg5e4302bb19597421f3c23466)&gt; I feel like i am forced to use this gui coordinate system. Why do'nt i have a choice in Red to use what is convenient for me?

You're not forced to do anything, but this is (unless you show me examples) how all GUI coordinate systems work. You do have a choice though: learn how to create other coordinate systems.

AFAIK, you are the first person to ask for this.

Rebol2Red

[19:39](#msg5e430301df1153705e2bc113)Do you really learn at school only the gui coordinate system? I think in europe we all use "my" coordinate system. At least in the netherlands.

toomasv

[19:41](#msg5e43035e55b6b04bf6a744e3)@Rebol2Red About matrix: https://gist.github.com/toomasv/e77df7ac18beee352f343b0729fb0a7a

greggirwin

[19:42](#msg5e4303c3ecfa4461c053e600)I'm not expressing an opinion, or my experience, only how this works, on computers, for GUIs, for quite some time. Though I imagine some early systems used their own approach. This is not unique to Red, and Red gives you the tools to create whatever coordinate system you want, though it isn't as convenient as a "do what I want" switch. :^)

[19:44](#msg5e430407d4daaa26c198fd1d)I am happy, thrilled even, to see examples of systems that do this well, so we can learn from them. Look at game engines, for example, and tell us what you learn.

hiiamboris

[19:47](#msg5e4304b619597421f3c239e9)he's not the first though, another guy recently expected screen to work in typical CS used in geometry too ;)  
funny thing is that BMP format also uses it

Rebol2Red

[19:48](#msg5e43051a37545d247d329c34)@greggirwin I don't want to offend you (allthough i don't know why this should) but i am only curious if you learned this at school as the only coordinate system there is. It is just a simple question with no other meaning.

hiiamboris

[19:52](#msg5e4305f9340a8019bbb7797a)Sounds like "school coordinate system is the only one" ☻ (just kiddin)

[19:59](#msg5e4307a1cd2d737bb07034da)@Rebol2Red Geometric CS is used in mathematics mostly (in 3D editors maybe too). In computing, when working with a display, google for "screen coordinate system" and you'll see our reasons.

Rebol2Red

[20:05](#msg5e4308efdf1153705e2bd16e)Don't threat me like a noob. I know this but i still find it not a valid reason to not have a simple statement to use another screen coordinate system like in other programming languages. I rest my case.

hiiamboris

[20:20](#msg5e430c86df1153705e2bd98c)What's your use case? Why do you want bottom-up vertical?

Rebol2Red

[20:25](#msg5e430db2c900d747abfb85ef)Did you look at my picture?  
The answer to your question is because i am human. After all trees grow from the ground up into the sky or not? :)  
And a program like excel uses the geometric CS to show graphs if i am not mistaken.

hiiamboris

[20:29](#msg5e430e9f63c15921f4722305)Yes, plots are a use case.

greggirwin

[20:31](#msg5e430f3162e9db4bf7911909)No offense taken @Rebol2Red, but remember that we're just like you, each with our own backgrounds. I'm human too, mostly, and have been out of school long enough not to remember exactly what I learned there. As a theatre major, it wasn't on that curriculum. :^) But let's try to agree on things.

1\) All (not QNX Photon perhaps, I don't recall) other GUI systems use this coordinate system.  
2\) `Draw` lives in the domain of GUI systems.

Can we agree on those 2 points?

Rebol2Red

[20:35](#msg5e43100037545d247d32bac2)You are trying to convince me the gui system is the right one but i think every human in his brain uses geometric CS.  
Like i said i have to convert the y coordinates in my mind to visualise it. Things in my mind works that way.  
Do you know the expression we always did it this way so this is the right way? I rather think ouside the box.  
I don't care if the whole world think different. I and you should/could make your own assumptions.

greggirwin

[20:37](#msg5e431075ecfa4461c0540886)If you think outside the box, use polar coordinates. :^)

But I'm not saying right or wrong. If you won't answer the questions, it's hard to make progress.

[20:37](#msg5e43109819597421f3c25eed)I'm just trying to work toward mutual understanding.

[20:38](#msg5e4310de340a8019bbb79731)&gt; I and you should/could make your own assumptions.

Assumptions is not what you mean here, I think. But "draw our own conclusions", yes.

Rebol2Red

[20:41](#msg5e431181c900d747abfb904f)Yes. English is not my nativve language. And yes i agree to your 2 points.

greggirwin

[20:43](#msg5e4311f437545d247d32c076)Great. Thanks. Now that we agree on those 2 points, can we agree that `draw` uses an appropriate coordinate system, based on its domain and the precedent in that domain?

[20:44](#msg5e43121a45000661fcb4dc60)Your English is much better than my Dutch so, again, all working toward understanding.

[20:46](#msg5e43129c63c15921f4722d54)Another point is that the domain of plotting graphs and charts standardizes on 0x0 being bottom-left. Agreed?

Rebol2Red

[20:51](#msg5e4313da1d23aa47aa0a9cd5)I agree to all of what you are saying. That's not the point here. I was only asking for a coordinate system i want to use. Nothing more nothing less. I was/am still curious were the graphics system of gui's came from, and why it is used.  
Is it because everybody use it for gui systems? Is it convenient for operating system to implement?

hiiamboris

[20:51](#msg5e4313dff3718e705df78cb3)I'm thinking implementation-wise (as that could be handy for plots), do we always know in Draw the image/face size? If so, we could introduce `flip` and `mirror` keywords that would \*prepend* corresponding matrices to the current matrix (as the initial one is always known)

Rebol2Red

[20:53](#msg5e43142e62e9db4bf7912508)@hiiamboris Now we are talking

hiiamboris

[20:53](#msg5e43145819597421f3c2686f)&gt; I was/am still curious were the graphics system of gui's came from, and why it is used.

My guess would be because that's how CRT screens (and TVs before that) initially worked. Why did they make it so? Who knows, maybe they thought of paper. When you write you write top-down

[20:57](#msg5e431521c900d747abfb9ac8)Probably dates back to Maurice Leblanc, 1880 ;)

greggirwin

[20:58](#msg5e431568340a8019bbb7a203)Please bear with me @Rebol2Red. There is reason for this discourse, and a method to my madness.

Now that we agree on those points, what we want is a graphing or plotting dialect. And we should probably not think of just one, because of things like polar coordinates and a potential third axis. Agreed?

Rebol2Red

[21:01](#msg5e43163fdf1153705e2bf200)Yes I agree and I like the idea of third axis.

greggirwin

[21:05](#msg5e431734c900d747abfba002)&gt; I was only asking for a coordinate system i want to use. Nothing more nothing less.

And the reason I'm pressing for more thought is that this strikes me as (someone can provide a better term if there is one) a "design local maxima". That is, from where we are, it looks like the best solution, but in language design, we have to be patient, zoom out, and not just code features.

Now, it may be that `mirror/flip` become helpers or `draw` commands to facilitate some of this, or maybe we write dialects that wrap even more functionality, because `draw` is very low level.

At the core, and why we resist and push back on feature requests, is so we can provide the right set of building blocks rather than putting everything into Red itself. Just as D3 is not part of the JS language.

Rebol2Red

[21:08](#msg5e4317dd37545d247d32d001)I get your point. I am NOT asking to implement this into draw. But only an EASY way to use another coordinate system.

greggirwin

[21:09](#msg5e4318201d23aa47aa0aaa0f)As we speak, someone may be writing a `flip: func [draw-cmds /veritcal /horizontal][...]` that does what you want. :^)

hiiamboris

[21:10](#msg5e43183c55b6b04bf6a780d9)I have another question though, @Rebol2Red it looks from your example like you're trying to render an image in your head. Have you considered just painting it in a dedicated paint program and loading from Red?

greggirwin

[21:10](#msg5e43183eecfa4461c0541db6)Or you can take a crack at that, and others here will surely help test the heck out of it.

Rebol2Red

[21:10](#msg5e43184355b6b04bf6a780fe)That would be awesome. I ca'nt write this by myself. I am locked at the graphics system in my head :)

greggirwin

[21:13](#msg5e4318f2cd2d737bb0706574)It will be a great exercise then. :^)

Rebol2Red

[21:14](#msg5e43194362e9db4bf79131d1)@hiiamboris That is exactly the case. But i do'nt think using a paint program is the best option.

greggirwin

[21:15](#msg5e431960c900d747abfba791)I appreciate your time in working through this, and hope re-reading this chat will help us communicate more effectively in the future.

hiiamboris

[21:15](#msg5e4319753716b919ba10e12c)&gt; i do'nt think using a paint program is the best option

Why not? ;)

[21:16](#msg5e4319b5c900d747abfba875)Maybe we need a painting program that generates draw commands block though? :D

greggirwin

[21:17](#msg5e4319ebf3718e705df79a98)https://gist.github.com/greggirwin/989ca6ffcec29f0700f54a0f3331d7eb :^)

hiiamboris

[21:18](#msg5e431a32df1153705e2bfb7e)Fantastic ☻

[21:18](#msg5e431a3b45000661fcb4f469)This is \*the answer*

Rebol2Red

[21:32](#msg5e431d6637545d247d32def9)Not to me. My plotting must change according to the executed code.

## Thursday 13th February, 2020

planetsizecpu

[15:00](#msg5e4564831d23aa47aa1088ac)More fun on L8

[15:00](#msg5e45649819597421f3c85ce8)\[!\[cavetest83.gif](https://files.gitter.im/red/red/gui-branch/XQNd/thumb/cavetest83.gif)](https://files.gitter.im/red/red/gui-branch/XQNd/cavetest83.gif)

greggirwin

[17:09](#msg5e4582d5df1153705e322f3b)Nice. How does the boy magically appear hanging onto the bar?

planetsizecpu

[20:56](#msg5e45b807340a8019bbbe97ba)Ah, so easy in VID just make the `face/visible: false` and make it follow the kart face, then when action key is pressed under some handle just make it visible again but with hanging image. The magic is provided by Red &amp; path access to objects 😉

greggirwin

[21:16](#msg5e45bcc545000661fcbba60e)Ah, so he was hiding in the cart! :^)

## Friday 14th February, 2020

planetsizecpu

[07:16](#msg5e46493518ac9b0fb5bc7347)Here is an example for debugging, where we can see the boy being dragged by the kart, the kart image is switched to the image with/without the boy inside, easy in Red. All is an illussion as in real life 😃

[07:16](#msg5e464946b3023d5025ec7a7d)\[!\[cavetest33.gif](https://files.gitter.im/red/red/gui-branch/GYxy/thumb/cavetest33.gif)](https://files.gitter.im/red/red/gui-branch/GYxy/cavetest33.gif)

rebolek

[07:23](#msg5e464ae5b401eb68a57850dd):-)

## Tuesday 18th February, 2020

planetsizecpu

[09:16](#msg5e4bab6a0ec5ff431e9c38b0)Style, glamour, elegance ... I would like to introduce Rose, the boy's girlfriend, only on difficult levels, do you think she is here only for the gold? no, look well!

[09:17](#msg5e4bab989d4c83598b990e49)\[!\[cavetest66.gif](https://files.gitter.im/red/red/gui-branch/Dk1m/thumb/cavetest66.gif)](https://files.gitter.im/red/red/gui-branch/Dk1m/cavetest66.gif)

toomasv

[11:06](#msg5e4bc51a292ff243d3d44f6b):heart: :collision: :blue\_heart:

GalenIvanov

[14:56](#msg5e4bfb3440ac4a7fb9f1c538)@planetsizecpu Cool!

## Wednesday 19th February, 2020

GiuseppeChillemi

[17:04](#msg5e4d6aaeb662483a8750655a)Has Red team planned a mechanism to mirror Red windows on one or more remote system ?

loziniak

[17:13](#msg5e4d6cb93ca8a67fb805c39d)you mean like \[X11 forwarding](https://kb.iu.edu/d/bdnt)?

GiuseppeChillemi

[18:22](#msg5e4d7cff14b4d670a335a457)Yes

[19:01](#msg5e4d86224880f07ed1e6a9b3)One way is useful for mirroring purposes like teaching lessons, monitoring. A full remote console would be good to have a remote GUI for our apps. I don't know how it would be difficult either the first or the second implementation, just asking if it is planned.

hiiamboris

[19:13](#msg5e4d88bcff00c664eed2488c)what's the advantage over OS-level (or window server-level) mirroring?

dander

[19:28](#msg5e4d8c558e726c7dc5b54244)it seems pretty far outside the scope of the project, especially considering all the other work that is needed

GiuseppeChillemi

[22:19](#msg5e4db478b662483a87513433)It was an idea born to have the same view of an operator window on multiple pc for monitoring, withot having to mirror the full screen. I know therr are other ways to implement it, I was just asking.

## Thursday 20th February, 2020

loziniak

[06:30](#msg5e4e2792ff00c664eed3b2d0)One could send `face!` changes reactively over the network. Perhaps it's doable even without changes in Red?

[06:34](#msg5e4e28863ca8a67fb807867e)Suprisingly, Red's simple networking could be a limitation here, not View :-)

GiuseppeChillemi

[06:53](#msg5e4e2ce24880f07ed1e81169)Actual networking state is not important as the solution is to be seen under the light of the future.

hiiamboris

[09:56](#msg5e4e57c614b4d670a337a5d2)`face!` is close to `port!` in it's interface so I wouldn't be surprised if we'll be able to stream those one day

GalenIvanov

[14:06](#msg5e4e9282d97c107ed264cbbd)Today I played with Truchet tiles - Red makes it easy, maybe easier than Processing :)

[14:07](#msg5e4e928b4609ce3a8814d0ca)\[!\[Truchet.jpg](https://files.gitter.im/red/red/gui-branch/RJDU/thumb/Truchet.jpg)](https://files.gitter.im/red/red/gui-branch/RJDU/Truchet.jpg)

[14:07](#msg5e4e92a14609ce3a8814d10b)

```
Red[
   Title: "Extended Filled Truchet tiles"
   Author: "Galen Ivanov"
   Date: 20-02-2020
   Needs: view
]
random/seed now

img11: make image! bg: [32x32 255.255.255]
img12: make image! bg
img31: make image! bg
img21: make image! bg: [32x32 164.200.255]
img22: make image! bg
img32: make image! bg

big-img: make image! [512x512 255.255.255]

t: [line-width 3 pen navy fill-pen]
draw img11 compose [(t) sky circle 0x0 16 circle 32x32 16]
draw img12 compose [(t) sky circle 32x0 16 circle 0x32 16]
draw img31 compose [(t) sky box -2x-2 16x16 box 16x16 33x33]
draw img21 compose [(t) white circle 32x0 16 circle 0x32 16]
draw img22 compose [(t) white circle 0x0 16 circle 32x32 16]
draw img32 compose [(t) white box -2x-2 16x16 box 16x16 33x33]

draw big-img collect [
    repeat y 16 [
	    repeat x 16 [
			keep compose [
			    image 
				(to word! rejoin['img random 3 x + y % 2 + 1])
				(as-pair x - 1 * 32 y - 1 * 32)]
		]
	]
]
save/as %truchet.jpg big-img 'jpeg

view [ base 512x512 draw [ image big-img ] ]
```

[14:09](#msg5e4e931289f30b12651bc9b6)I uploaded the source to \[my Red-graphics repository](https://github.com/GalenIvanov/Graphics-Red) too.

rebolek

[14:20](#msg5e4e959dc2c73b70a4490ed6)@GalenIvanov that's very nice!

GalenIvanov

[14:21](#msg5e4e95cc3ca8a67fb808ba04)@rebolek Thanks!

rebolek

[14:38](#msg5e4e99f84609ce3a8814e939)Is it possible to add some color variations?

toomasv

[14:39](#msg5e4e9a06d97c107ed264e443)@GalenIvanov Niice!

GalenIvanov

[14:41](#msg5e4e9ab5d97c107ed264e71b)@rebolek I'm not sure what you mean - I think I can make a gradient in x, y or x and y directions, but right now I use fixed sets of tiles.

[14:42](#msg5e4e9ac48e726c7dc5b7d7b8)@toomasv Thanks!

rebolek

[15:15](#msg5e4ea28fb662483a8753717a)@GalenIvanov I mean if it's possible to have more than one fill color - not just blue areas, but red, green, yellow, ... ones too. For continuos shapes.

GalenIvanov

[15:28](#msg5e4ea5884880f07ed1e975f9)@rebolek I suppose the continuous shapes have to be one solid color? I think its possible - I'll have to look at your suggestion, it's a good exercise.

rebolek

[15:29](#msg5e4ea5c5b662483a87537aab)Yes, one color per one continuous shape. I guess it can look nice :smile:

hiiamboris

[15:40](#msg5e4ea882dafa3029f6416361)@rebolek you're evil ;) Each single tile there span 4 shapes at once :)

rebolek

[15:59](#msg5e4eaccf89f30b12651c23e9)@hiiamboris Am I? @GalenIvanov certainly can ignore my requests :-) But don't you think it would look great? :-)

hiiamboris

[16:02](#msg5e4ead873ca8a67fb8090c2a)Sure it would :D

phillvancejr

[16:58](#msg5e4ebabc6053e67dc4d514d7)Hello all. Does Red ui/view have a web-view element yet?

rebolek

[17:05](#msg5e4ebc648e726c7dc5b85175)@phillvancejr Hi! No, and it's not planned, sorry.

[17:06](#msg5e4ebca5c2c73b70a449a3c3)However, if there's someone interested to implement it, this contribution would be of course welcomed, that's how GTK was done.

phillvancejr

[17:08](#msg5e4ebd0aff00c664eed59423)@rebolek thank you. I though it was in the plans because it is mentioned on the March 25, 2016 Red GUI system post. Thanks!

rebolek

[17:14](#msg5e4ebe65a0aa6629f5df5907)@phillvancejr I see. It certainly would be nice to have but given the available manpower, it has very very low priority.

phillvancejr

[17:20](#msg5e4ebff6d97c107ed2656e6f)ok cool, thank you for your time and answer!

GalenIvanov

[19:09](#msg5e4ed9538e726c7dc5b8a42d)@rebolek Yes, it would look great!

greggirwin

[20:59](#msg5e4ef32440ac4a7fb9f978bd)Nice updates everyone!

loziniak

[21:00](#msg5e4ef379a0aa6629f5dff616)web is dead ;-)

## Friday 21st February, 2020

GalenIvanov

[14:42](#msg5e4fec52ff00c664eed8dcea)WIP: \[Animated Truchet](https://github.com/GalenIvanov/Graphics-Red/blob/master/Animated%20Truchet.red)

[14:42](#msg5e4fec664609ce3a8818ca59)(static) screenshot:

[14:42](#msg5e4fec6d8e726c7dc5bbac2d)\[!\[Truchet.jpg](https://files.gitter.im/red/red/gui-branch/Sl6o/thumb/Truchet.jpg)](https://files.gitter.im/red/red/gui-branch/Sl6o/Truchet.jpg)

hiiamboris

[14:46](#msg5e4fed3b4609ce3a8818cce6)cool! :D

[15:06](#msg5e4ff20c14b4d670a33c4369)Why don't we have blur or any other matrix convolution in Draw?

rebolek

[15:13](#msg5e4ff3a68b2d4664ef17c5d5)I guess because no one implemented it yet ;-)

hiiamboris

[15:19](#msg5e4ff4eed97c107ed268cce5)Yes, so I'm forced to reinvent the wheel and try not to waste all the RAM in the system ;)

rebolek

[15:21](#msg5e4ff57614b4d670a33c4f66)That's the price of using alpha version of language :-)

[15:21](#msg5e4ff58789f30b12651fcb77)But thre's also RedCV, so you don't have to reinvent the wheel.

hiiamboris

[15:23](#msg5e4ff60c4880f07ed1ed3d85)I don't want that dependency. I've seen the code of OpenCV once...

rebolek

[15:26](#msg5e4ff6bcc2c73b70a44d2a4f)Don't confuse RedCV with OpenCV!

hiiamboris

[15:27](#msg5e4ff6df4609ce3a8818f0c1)Isn't RedCV just bindings to OpenCV?

rebolek

[15:28](#msg5e4ff70d8e726c7dc5bbd67f)No, it's not related to OpenCV, it's written in Red and Red/System, not relying on any external libs.

hiiamboris

[15:28](#msg5e4ff72c4609ce3a8818f129)I didn't know that

rebolek

[15:29](#msg5e4ff73eff00c664eed900c7)You can check it https://github.com/ldci/redCV

hiiamboris

[15:30](#msg5e4ff7a0c2c73b70a44d2e6e)Thanks

ldci

[16:18](#msg5e5002cba0aa6629f5e3102a)@GalenIvanov Very nice job. Congratulations.

greggirwin

[16:50](#msg5e500a64a0aa6629f5e32994)@GalenIvanov doesn't run for me here. Will try to see why later.

I believe Doc wants to have an effect pipeline like R2 did, and which later added \[convolve](http://www.rebol.com/article/0236.html).

GalenIvanov

[17:19](#msg5e50112fb662483a87579b94)@hiiamboris Thanks!

[17:20](#msg5e501151a0aa6629f5e345ad)@greggirwin Strange - it works on Win 10 and WIn 8.1 for me.

hiiamboris

[17:22](#msg5e5011ce8e726c7dc5bc3723)works on W7 for me too

greggirwin

[17:52](#msg5e5018cb0c451412667f2ef3)Works from CLI but not GUI console.

hiiamboris

[18:02](#msg5e501b4f3ca8a67fb80d39d6)@greggirwin can you pinpoint the error?

toomasv

[21:11](#msg5e504772c2c73b70a44e29ce)It works for me on W10. Very nice!

## Saturday 22nd February, 2020

Phryxe

[08:00](#msg5e50df9b4609ce3a881b1e9b)Looks cool on Win 10. I like the shadows. :thumbsup:

GalenIvanov

[08:18](#msg5e50e3d8ff00c664eedb309a)Thank you, @toomasv and @Phryxe !

[08:44](#msg5e50ea0789f30b12652221f5)\[!\[Animated\_Truchet.gif](https://files.gitter.im/red/red/gui-branch/qYLV/thumb/Animated\_Truchet.gif)](https://files.gitter.im/red/red/gui-branch/qYLV/Animated\_Truchet.gif)

[08:45](#msg5e50ea2f8b2d4664ef1a1280)Too bad the site I used put a logo in the bottom-left corner :)

[09:43](#msg5e50f7ccff00c664eedb5c89)@ldci Thank you!

## Sunday 23th February, 2020

planetsizecpu

[11:35](#msg5e52639aa0aa6629f5e8ab0b)Good job @GalenIvanov interesting.

GalenIvanov

[15:35](#msg5e529baed97c107ed26f1429)@planetsizecpu Thanks!

## Monday 24th February, 2020

GalenIvanov

[13:04](#msg5e53c9e3ed27b13c42f87a09)One of the reasons I started playing with Truchet tiles was to make this:

[13:04](#msg5e53c9ecef8d646099cb4685)\[!\[Optical\_Illusion\_Clock.png](https://files.gitter.im/red/red/gui-branch/opbd/thumb/Optical\_Illusion\_Clock.png)](https://files.gitter.im/red/red/gui-branch/opbd/Optical\_Illusion\_Clock.png)

[13:05](#msg5e53ca1d5cd3836098c68a16)A clock, inspired by TokyoFlash. Here's the source: \[Otpical Illusion Clock](https://github.com/GalenIvanov/Graphics-Red/blob/master/Optical%20Illusion%20Clock.red)

rebolek

[13:06](#msg5e53ca619aeef6523215cc52)Wow that hurts my eyes ;-)

GalenIvanov

[13:07](#msg5e53ca891ec15e021199f165)@rebolek That's why I didn't animate it :)

rebolek

[13:09](#msg5e53cafbef8d646099cb4862)It reminds me of this C64 code:

```
10 t$="NM"
20 x=int(rnd(ti)*2)+1
30 print mid$(t$,x,x);
40 goto 10
```

that produces this:

https://www.flickr.com/photos/rndmcnlly/5058442151

GalenIvanov

[13:16](#msg5e53cc98ed27b13c42f881e8)Yes, exactly!

[13:20](#msg5e53cdb31be0ff01d5a673f0)I have seen this:  
10 PRINT CHR$(205.5+RND(1)); : GOTO 10

rebolek

[13:21](#msg5e53cdd91ec15e021199fa63)Much nicer! I've just copied first example I found.

GalenIvanov

[13:23](#msg5e53ce4ad7bb4e179c9b01e3)This is what the array languages are best at :)

[13:23](#msg5e53ce53fa9f20553b4a2abe)\[echo '/\\'{~?10 20$2](https://tio.run/##y/r/PzU5I19BXT9GvbrO3tBAwchAxej/fwA "J – Try It Online")

[13:24](#msg5e53ce831c4f1707f8c8f19c)This is in J, the APL/K solutions are similar

rebolek

[13:27](#msg5e53cf2e476ff13c43af38d8)That's something my cat would write walking on the keyboard.

GalenIvanov

[13:28](#msg5e53cf969aeef6523215dacb)Haha, unfortunately my Samoyed dog will probably break the entire keyboard if she try to code in J :)

rebolek

[13:30](#msg5e53cfe6e40da4526f102104)Samojeds are very nice dogs, BTW!

GalenIvanov

[13:32](#msg5e53d064901209179b37cd40)Yes, they are! Cute, friendly and stubborn :)

greggirwin

[23:43](#msg5e545fa11ec15e02119bc479)Good stuff. Had a Samoyed briefly. Very high strung.

## Tuesday 25th February, 2020

GalenIvanov

[07:35](#msg5e54ce5ed7bb4e179c9dd3f5)@greggirwin Yes, exactly the same! She's always eager to greet everyone - people, dogs, cats (she has a homeless cat friend) and doesn't always listen to me when outside.

## Thursday 27th February, 2020

planetsizecpu

[08:20](#msg5e577bcafcb6354d55dc545b)Do you like jellyfish? it is at new level 12

[08:21](#msg5e577c055c32162f5b9f2ce6)\[!\[cavetest120.gif](https://files.gitter.im/red/red/gui-branch/o43J/thumb/cavetest120.gif)](https://files.gitter.im/red/red/gui-branch/o43J/cavetest120.gif)

greggirwin

[17:34](#msg5e57fda486e6ec2f5c656953):^)

fergus4

[20:34](#msg5e5827c24eb23e6ae179f2eb)How do you make a text list reactive? I've looked at the reactive examples and I do not see how they apply to text-list data.

hiiamboris

[20:37](#msg5e58287f4eb23e6ae179f475)How is it different from any other face?  
`view [text-list data ["green" "blue" "red"] react [attempt [face/color: do load pick face/data face/selected]]]`

fergus4

[20:41](#msg5e5829813cd19e69808eaa15)Never mind. I see its already linked to the variable used

[20:59](#msg5e582dcad9fb46531ed0e673)Actually, I can append and remove from the list but I do not know how to replace the data block with a new data block. If I have a block of data 'names I can

```
append names "New Name"
```

but I can't seem to

```
names: copy ["new name" "new name"]
```

hiiamboris

[21:08](#msg5e582fb09370fd6658f49e05)@fergus4 that `data` facet of a face is not linked to the \*word* `names` but to the value (block) it points to. So you either have to change the original block, or if you want to replace it - then replace the `face/data` as well.

fergus4

[21:12](#msg5e5830a69e18687f2bb1c782)Yes. I understand I can change the face/data block directly I was just trying to use react . I thought it would be cleaner.

[21:13](#msg5e5830eccb783440fcfd31d2)at least you don't have to "show" the face after changing the block like in rebol

## Friday 28th February, 2020

toomasv

[07:13](#msg5e58bd8153fa513e285aa0bd)A little color-picker from that:

```
colors: next sort extract split replace/all lowercase trim fetch-help tuple! [some [#" " | #"^/"]] #" " #" " 2
get-color: func [face][load pick face/data face/selected]
pick-color: func [/local clr][
    view/tight/flags [
        text-list data colors select 1 focus 
        on-key [switch event/picked [27 [unview] 13 [clr: get-color face unview]]] 
        on-dbl-click [clr: get-color face unview] 
        react [attempt [face/color: do load pick face/data face/selected]]
    ][modal no-border] 
    clr
]
```

`escape` closes, `dbl-click` and `enter` return selected color.

greggirwin

[07:19](#msg5e58bee9ec7f8746aaa04078)Nice. `Glass`. :^)

toomasv

[07:33](#msg5e58c262ec379e558e944a51)Yes, and `transparent`. I wonder, what to do with these? Ignore?

pekr

[07:40](#msg5e58c3dfa157485cb4613faa)I had to cut-off the Red task. After calling the pick-color function, the console was blocked and there was no way to escape the selection window :-)

toomasv

[07:51](#msg5e58c678ff6f6d2e8873ea27)@pekr `escape` didn't close? Which platform? If you remove `no-border` from flags, does it close from cross?

pekr

[08:47](#msg5e58d3a48e04426dd00fcf11)Ah, sorry, escape did close actually .... just tried to click outside of the window and it did not close ....

toomasv

[09:12](#msg5e58d96353fa513e285ae5a3)Yes, it's modal.

[10:55](#msg5e58f189d045e258250299fa)Added \[web-colors](https://gist.github.com/toomasv/d0b934170f73c765f28452ede83b08fb).

GalenIvanov

[11:18](#msg5e58f6ef4eefc06dcf239d55)@toomasv Nice!

toomasv

[11:22](#msg5e58f7efcb91b5224ffd5379)@GalenIvanov Thanks! I like that it retains it's key-navigation properties.

GalenIvanov

[14:25](#msg5e5922d9ec379e558e957ce9)@toomasv Is there an easy way to make the background if each line of the `text-list` the respective color?

toomasv

[14:26](#msg5e59230aca2f5a558d560c79)Only with draw-layer over it I guess.

GalenIvanov

[14:26](#msg5e592318ca2f5a558d560d1a)ok

greggirwin

[20:15](#msg5e5974cd90a8295824f59e19)Good stuff @toomasv. Note that `fetch-help` is deprecated, aliased just for the VSCode plugin. `Help-string` is the new name.

toomasv

[20:38](#msg5e597a2cff6f6d2e88760629)@greggirwin Thanks, corrected, and \[added another twist](https://gist.github.com/toomasv/d0b934170f73c765f28452ede83b08fb) - now both background and font color can be chosen.

## Sunday 1st March, 2020

planetsizecpu

[12:44](#msg5e5bae3f7fef7f2e8993f16e)Useful @toomasv good job!

toomasv

[13:57](#msg5e5bbf36ff6f6d2e887ad827):smile:

greggirwin

[18:04](#msg5e5bf91fcb91b5224f0448bb)The behavior is a little tricky. Check font, font color set, select a new color, all text now matches that. I know it's just an experiment though. :^)

toomasv

[18:14](#msg5e5bfba2cb91b5224f045259)Yes, as long as font is checked, when you move through list, font-color is changed; uncheck font, and background color is changed. So you can select a suitable combination of background and font colors. Of course it would be also good to select other font properties.

## Monday 2nd March, 2020

GaryMiller

[00:52](#msg5e5c58c2a157485cb469ca60)I had to drop back to the Dec 3rd version of Red. When I tried to compile with the version I pulled down the other day 27th Feb I got the following error.

Have I reached the maximum program size for 32 bit? When I drop back to the Dec 3rd version though it compiles ok!

I added the correct compilation with the Dec 3rd version below it!

PS C:\\Red&gt; .\\red-27feb20-bf15211a.exe -r .\\ZandraGUI.red

-=== Red Compiler 0.6.4 ===-

Compiling C:\\Red\\ZandraGUI.red ...  
\*\** Red Compiler Internal Error: Internal Error : No more global variable space  
\*\** Where: duplicate-symbol  
\*\** Near: [forall path [  
append words either integer? item: path/1 \[item] [  
get?: to logic! any \[head? path get-word? item]  
get-path-word item clear blk get?  
]  
]  
emit words  
]

PS C:\\Red&gt; .\\red-03dec19-c0b8ff49.exe -r .\\ZandraGUI.red

-=== Red Compiler 0.6.4 ===-

Compiling C:\\Red\\ZandraGUI.red ...  
...compilation time : 46859 ms

Target: MSDOS

Compiling to native code...  
...compilation time : 751546 ms  
...linking time : 25479 ms  
...output file size : 11930112 bytes  
...output file : C:\\Red\\ZandraGUI.exe

[01:28](#msg5e5c612b7fef7f2e8995c3ac)Just downloaded and tried with Red-Latest too and got the same error.

greggirwin

[03:33](#msg5e5c7e6e376d882250c65ee5)@dockimbel :point\_up:

GaryMiller

[13:43](#msg5e5d0d85ca2f5a558d5ef22e)Is there a way to tell the Red compiler to increase the global variable space from within the program or command line or does that mean I am up against the 32 bit maximum?

rebolek

[13:47](#msg5e5d0e88ec379e558e9e6d37)You're probably hitting Rebol's limit and that's unfortunately not configurable.

[14:00](#msg5e5d117ad045e258250c3421)@GaryMiller the word limit in Rebol is much lower than 32bits, it's more like ~32000. But if you're having so many words it may be a good idea to rethink your code anyway. Values are anonymous, so you don't need a word for every value you've got.

GaryMiller

[16:09](#msg5e5d2fa9cb91b5224f071d45)Don't think I should have anywhere near to 32,000 words them. At least not how I think of words. I have tons of quoted strings that I copy to the same small number of words over and over again if they are a closer match. And I may have around a thousand object attributes for two large objects AI and User. So yeah it does not sound like I should be hitting over 3 or 4 thousand words tops.

hiiamboris

[16:41](#msg5e5d372bcb91b5224f0730d0)If it's Rebol's limit, how would it compile okay on an older version of Red?

rebolek

[17:47](#msg5e5d46c3ec7f8746aaaaf8c8)Good question. It was a guess and I may be wrong here. But that doesn't change anything on my advice to keep the word count low.

greggirwin

[18:55](#msg5e5d568f53fa513e286567a6)We can close this here, or move to Red/bugs, but Doc confirmed that it is an R2 limit being hit.

## Wednesday 4th March, 2020

GiuseppeChillemi

[21:10](#msg5e601930d045e25825144737)I ask here again as I have had no answer on HELP: does the android version support the GUI?

greggirwin

[21:24](#msg5e601c9aca2f5a558d670936)The Android branch is out of date at this time. You have to try it to see if it can do what you want, but it's not production ready yet.

[21:24](#msg5e601ca753fa513e286cc3ae)Other than that, yes, it has VID support.

GiuseppeChillemi

[21:30](#msg5e601df8ec7f8746aab29b11)@greggirwin Is it 6.3 or 6.4 ? Also, compiling with `-t Android` as target will I have the APK ?

[21:36](#msg5e601f4c376d882250d01247)Oh my God, it is 5 to 6 years old. I didn't expect... so hold !

## Monday 9th March, 2020

bferris413

[00:26](#msg5e658d2f95b8ff0bbfa263d5)Do I need to manually calculate offset if I'm appending to a face's pane (created using VID)?

greggirwin

[00:30](#msg5e658e368011bb652aff4ebf)Yes. Once VID has been processed, you're on your own, just as if you used View directly all along. However, depending on your needs, you can keep your VID spec, mod that, and reprocess it. Basically, re-render everything again.

bferris413

[00:39](#msg5e6590538011bb652aff5316)Got it, thanks

henrikmk

[09:36](#msg5e660e2fa2ccef3232dfe261)Sometimes it's cheaper, code wise, to just dump the old face tree and rebuild the layout with VID. (I would argue that having basic face tree manipulation functions should be the basis for VID, rather than hardcode the VID tree layout. Not sure if Red's VID does that.)

Oldes

[11:41](#msg5e662b62a2897318a998abda)@henrikmk that could maybe work in R2, but I don't think that recreating all native widgets will be cheaper.

henrikmk

[12:02](#msg5e66304be203784a5597329c)@Oldes I meant it was easier to do that in code, but it of course is more expensive for Red/REBOL to do on the CPU.

greggirwin

[19:20](#msg5e6696ef5348b33231b25ecd)&gt; I would argue that having basic face tree manipulation functions should be the basis for VID

What does that look like to you @henrikmk? We can have another dialect, but you know as well as anyone that VID is an effective, declarative approach. Every design imposes constraints, which is sometimes a good thing. Depending on what you're thinking, the HOF approach may serve you well. Think jquery/css.

## Tuesday 10th March, 2020

henrikmk

[08:44](#msg5e67535c95b8ff0bbfa72836)We often consider the dialect to be the center piece of REBOL's GUI system, but I think it's the face tree. You can build the dialect on top of functions, or you can build a GUI editor with the functions, or slightly manipulate a large, existing face tree, like in @bferris413's example with greater efficiency.

Using functions as a basis was the idea of VID Junior for the reasons above, and a program could entirely live without the dialect, if needed.

I wrote up a first draft of a function list for VID Junior here: https://github.com/henrikmk/VID-Junior/blob/master/docs/developers/specs/face-functions.md

While a dialect is important, I think also it's important to have each nut and bolt of it exposed for better flexibility.

greggirwin

[20:26](#msg5e67f7e38e423969577e183b)There are many aspects to GUIs, and no system is best for all of them. What helps me most is seeing side by side comparisons of approaches, noting where there is no parallel in some cases.

## Thursday 12nd March, 2020

GiuseppeChillemi

[20:07](#msg5e6a967862a5aa6a2305f9d7)I admit that's not easy to have multiple panels, queries, arguments passing, data input, validation, sync, refresh, data write back, all together working in concert. I am trying to build an unified model but it's more difficult than expected. While simple GUIs are a breeze, more powerful are not straightforward as anything else in the Redbol world. I just want to share my experience, hoping a good model will emerge.

toomasv

[21:03](#msg5e6aa3a506898177494a77e6)You'll surely find some inspiration in \[these models](http://www.dubberly.com/wp-content/uploads/2008/06/ddo\_designprocess.pdf).

greggirwin

[21:22](#msg5e6aa822a936ab24fd68ecf6)Looks like a lot of nice things to compare there @toomasv. Funny to see the 4D model. I have an old 7D (I think it was 7) list somewhere. It takes some creativity to fit alliterative models. :^)

@GiuseppeChillemi concrete, specific information helps here. We don't yet have high level pieces, as we are still at the language level, not tooling.

## Friday 13th March, 2020

mikeparr

[12:11](#msg5e6b788d9f25f2238b7c9dae)Very interesting design link, @toomasv

toomasv

[12:13](#msg5e6b78cdd86c595eb1fe09fb)@mikeparr Yes, nice collection.

rcqls

[17:20](#msg5e6bc0ee391cb312fad833a5)K

[17:20](#msg5e6bc0efd86c595eb1fee67b)K

GiuseppeChillemi

[21:19](#msg5e6bf8f21cf20f12f95c129d)@greggirwin  
&gt; concrete, specific information helps here.  
(Note, I am currently working on Vid Extension Kit on Rebol, code will later be ported on Red)  
Here is what I am facing right now:

I have my company database. I want to populate a listview based on database table data and then edit a data row, validate it and write it back to the corresponding database table; also, some field values come from lookups on other fields/tables.  
As Henrik VEK has no listview row editing I am building a model to do this BUT this model should be able to display the table data in an \*independent* (from table) way.  
This means I select only which columns to show and then the editing fields should auto create, either as child window or as fields at the base of the listview (I repeat: auto create). If the field content should be selected from a row on another table, a lookup model is needed. You have to relate the relate table, auto create the view on it, return the selection as result. Also, as any data you enter must be validated, a validation model is needed.

This is the whole needing. There is the need to abstract it to write as less as possible code and reuse the model everywhere. Example: I have a table columns configuration, there I store the kind of data displayed, the lookup table and data, the connection name. My code will read from this data and build a panel from a model, auto creating the validation code, the edit subpanels and the code to write back the modified rows on the database. All this with just a couple of panel templates and the table columns configuration.

greggirwin

[22:06](#msg5e6c03e29f25f2238b7e47ce)Thanks. Yes, this is something many of us want to see, to fill the gap left by Access, PowerBuilder, etc.

GiuseppeChillemi

[22:29](#msg5e6c09571f0d285eb27984ba)It's not so difficult if you split the whole problem into single tasks but it's gluing together them into a structure, defining naming conventions, rules and data exchange what I am trying to do. Let's see...

## Sunday 15th March, 2020

loziniak

[21:12](#msg5e6e9a52de52695245d6fffa)Hi! What is the reason for `/argb` \*image!* access word? For me `/rgba` would seem more natural, regarding components order in color \*tuple!\*.

hiiamboris

[21:29](#msg5e6e9e331f0d285eb27f7f5b)It's ARGB. See https://en.wikipedia.org/wiki/RGBA\_color\_model#ARGB\_%28word-order%29 ("ARGB (word order)")

[21:29](#msg5e6e9e4ac5c6b744e2146d89)Also

```
>> i: make image! [1x1 1.2.3.4]
>> i/argb
== #{030201FB}       ;)  <- BGRA8888 as in the table above
```

## Monday 16th March, 2020

GiuseppeChillemi

[00:34](#msg5e6ec9a8c8ddaf238c892eed)I am taking notes during the journey to create a standard to build my generic panels. I have written each design question: there are more than 30 ! I promise I will try to share my notes, as far as my limited english, it could be an useful lecture for other new developer facing Red/Rebol GUIs in a reusable, dynamic and generic way. It is a very interesting fight !

greggirwin

[00:42](#msg5e6ecb7a391cb312fadf88ae)Your English is just fine @GiuseppeChillemi. Don't worry about that. We can always clear up confusion when necessary.

GiuseppeChillemi

[01:10](#msg5e6ed1f2391cb312fadf9ad2)Thanks, goodnight.

## Monday 23th March, 2020

ushakovs\_gitlab

[22:31](#msg5e7938c523bb49379819cf93)Hey, guys! What do you think about https://github.com/floooh/sokol to use underlying Red's GUI instead of WinAPI/GTK/OpenGL etc.

9214

[23:28](#msg5e79460b33441567b8a60a7a)@ushakovs\_gitlab View uses native APIs that you listed (Win32, Cocoa, GTK) and is tightly integrated with Red itself. The scope of the project you linked to is to provide cross-platform wrappers around popular libraries (not limited to GUI) for other languages, so it makes no sense to add an extra level of indirection and "use underlying Red's GUI" — one can just use Red (or libRed) directly instead. High-level languages use low-level libraries, not the other way around.

## Tuesday 24th March, 2020

greggirwin

[03:51](#msg5e7983b283292b6042197d30)@9214 +1. @ushakovs\_gitlab others are free to target back ends Team Red doesn't, but always best to ask first about how it will integrate. To be a core, standard back-end will have a very high bar. Modules will be the way to do a lot of things, but integrating with VID and View may not be practical for this case. The current design isn't meant for simple retargeting.

## Wednesday 25th March, 2020

hiiamboris

[18:18](#msg5e7ba08617db205e02bb2937)Should layout automatically merge `with` blocks?  
`view [base with [print 1] with [print 2]]` outputs `2` only

endo64

[20:36](#msg5e7bc0c517db205e02bb84ae)"Should" no, "Could" yes :) But "with" block is evaluated only once during the creation of the face, so merging multiple `with` blocks is easy but probably very rare case.

hiiamboris

[20:39](#msg5e7bc16a3e9803066ff54452)Rare if you write them manually. Very useful if you preprocess the layout block (and insert some).

[20:42](#msg5e7bc23eed84a544a32024e8)The workaround is full layout parsing in 20-30 extra LOC.

greggirwin

[20:55](#msg5e7bc54c0686790f6185721d)Would it then also apply to other facets? `Draw`, `options`, `react`, and `init` for example.

Objects aren't an exact parallel, but their spec is a dialect. There, values are not merged.

What makes it harder to preprocess and add things to a single `with` block, rather than inserting multiples?

hiiamboris

[20:58](#msg5e7bc5e7b25fc07b7cf0ba99)`options` - likely yes. `react` - already chainable (because reactive formula is not a property of the face but just bound to it), `init` - maybe, `draw` - unlikely as it has too much state

[21:00](#msg5e7bc68708f131108fb2dbeb)&gt; What makes it harder to preprocess and add things to a single `with` block, rather than inserting multiples?

There is no easy way I know of, to find out which `with` block corresponds to which face definition. You have to know where each style begins and ends, what keywords define it (including those defined inside a VID block).

[21:01](#msg5e7bc6bfb25fc07b7cf0bc7f)While from `layout` itself it's like 2-3 extra LOC max I think.

greggirwin

[21:04](#msg5e7bc779af5fed774860801c)Making it `with`-state aware should be really easy, yes. The question is whether the different behaviors become harder to reason about.

Not knowing how your code works today, doesn't it also need to know where to insert new `with` blocks, so they are associated with the correct face? I do see this as an important question for tooling, and how it might work.

hiiamboris

[21:05](#msg5e7bc7b73cf9de712dfca89f)Yes, that's part of it.

## Saturday 28th March, 2020

hiiamboris

[19:56](#msg5e7fabfa59057617f04a56a7)@greggirwin here's what I needed it for - an experiment in ridding of the most annoying part of View programming, like `face/size/x: face/parent/size/x - face/offset/x - other-face/size/x - (padding * 3) ...` idiocy.

You can check it here: https://gitlab.com/hiiamboris/red-elastic-ui  
A stress test example:  
!\[](https://i.gyazo.com/51e60f50da56e5fae5db47ac8a025ffa.gif)

## Monday 30th March, 2020

Respectech

[03:53](#msg5e816d342725b83acd5343dd)@hiiamboris That looks fun!

hiiamboris

[08:48](#msg5e81b24f49e7a8130cd99163)It is fun ☻  
Although admittedly 70% of the code is to provide filling strategy, I do not see it without filling capability.  
I already merged some of my visual projects to this model as it performs adequately fast and... just works. It will also play well with all the various layout editors we have, even though they cast geometry in stone.

pekr

[08:49](#msg5e81b2b7a5702b1caa7baf09)Is that the model for the resizing?

hiiamboris

[09:02](#msg5e81b5bc452eb266c89372ff)Yes. You just add anchors to faces you want to move, and it takes care of the rest.  
On the example above there are 5x5 bases, their `text` shows anchors used for each one.

henrikmk

[10:56](#msg5e81d05a9d44573467dcd4df)is this the official plan for resizing in Red?

pekr

[11:02](#msg5e81d1ae922e6e033111144f)IIRC, R3 used some advanced system done by Ladislav ... also remember 2 - 3 engines for R2. One of them being from Doc, another from Romano.

hiiamboris

[11:14](#msg5e81d48c9d63a8535c5ad0bd)@henrikmk no, just mine do-the-simplest-sanest-thing take ;)

henrikmk

[11:33](#msg5e81d8f947c92241cfb536b6)@hiiamboris alright.

## Tuesday 31st March, 2020

planetsizecpu

[14:38](#msg5e8355c8b3ccbc41520588ee)@hiiamboris I like how the widgets slide, well thought!

pekr

[15:24](#msg5e8360989a1e483f3d34a16b)As I remember, Ladislav used some Apple like model, where there could be spanning spacers between the elements. But some ppl found R3 resizing model quite complicated (now as for R3, most probably it was implemented in terms of Saphirion R3 version, which is not more available including its docs)

rebolek

[15:48](#msg5e83664d42f5f64697a87437)Ladislav's resizing model is in R3GUI repo for anyone to take a look

pekr

[16:05](#msg5e836a63e0c6ca4b2e03895d)I looked into development.saphirion.com and it is down. Then I found some Github repo created by Earl, and it is incomplete .... so what you refer to might not be the most popular on Google ...

ne1uno

[16:24](#msg5e836ebc9a1e483f3d34d084)https://github.com/saphirion/saphir found another

[16:26](#msg5e836f35f2c75e2bc1016e18)or maybe this was @earl

[16:35](#msg5e8371588058e148e939ada9)https://github.com/saphirion/r3-gui 2015

Robert-M-Muench

[20:30](#msg5e83a84ff0f4677566d6b106)We still have the stuff but web-sites moved to an other server. I think we didn’t bring development.saphirion.com back online.

GiuseppeChillemi

[21:17](#msg5e83b34cb6d72077bcab8080)@henrikmk knows more about R3gui and Rebgui.

## Friday 3th April, 2020

planetsizecpu

[09:01](#msg5e86fb72b9052f4d9dce54f6)These weeks of confinement and telework allow us to see how small we are, and that any speck of dust can change our existence. There will be a before and after of this pandemic. I have taken advantage of some moments of rest to release the new level 13, as a way to remember these hard days, in memory of those who have paid the highest price.

[09:02](#msg5e86fbb10649fc5f355c8a09)\[!\[cavetest131.gif](https://files.gitter.im/red/red/gui-branch/qNbQ/thumb/cavetest131.gif)](https://files.gitter.im/red/red/gui-branch/qNbQ/cavetest131.gif)

rebolek

[09:04](#msg5e86fc1b21d37f3c4569cc0b)@planetsizecpu thank you for your work. Programming should be fun and the result should be fun also. You are truly an excelent example of both.

planetsizecpu

[09:05](#msg5e86fc6c26dafb36651f05dc)@rebolek Thx stay healthy!

rebolek

[09:11](#msg5e86fdc3d8c05b5c4924cfc2)@planetsizecpu thank you. We are separated in the mountains, going to shop twice a month wearing face mask. We are either in the forest or online. I wish more people could do this.

GalenIvanov

[10:32](#msg5e8710ca5c1dfb3f1d251ffa)@planetsizecpu Nice! Keep coding!

[11:36](#msg5e871fafcc4b7b6f6641ec00)Here is what I'm currently working on:

[11:36](#msg5e871fb7a95bc942564e01ab)\[!\[Tangram\_1.png](https://files.gitter.im/red/red/gui-branch/53Pe/thumb/Tangram\_1.png)](https://files.gitter.im/red/red/gui-branch/53Pe/Tangram\_1.png)

[11:36](#msg5e871fd8c82e2165d62ae4c1)Tangram puzzle

[11:37](#msg5e872016c82e2165d62ae672)The main goal of this project was to implement a point-in-polygon test and some collision detection.

[11:39](#msg5e87206ccdb94807c5757a5f)The collision detection is very inchoate (let me use the word I recently discovered :) ) and maybe I'll change it later.

[11:46](#msg5e87220698959a4d483f6382)Currently the tiles snap only to the near vertices. I plan to add snap to edges to.

[11:50](#msg5e8722eed90e1140882157de)Here's the \[source](https://github.com/GalenIvanov/Games/blob/master/Tangram.red)

rebolek

[12:17](#msg5e8729460649fc5f355d1f30)wow, really nice!

GalenIvanov

[12:24](#msg5e872b164e14eb618b9acbaa)@rebolek Thank you!

toomasv

[14:13](#msg5e8744a2fac8f94c20e222db)@GalenIvanov Great work, as always!

GalenIvanov

[14:22](#msg5e8746b613756133c899af98)@toomasv Thank you! I hope there will be more works to come.

[18:05](#msg5e877b0217a95e30a19a9fbe)Strange, rotation of tiles doesn't work on my WIndows 8 machine. As it seems,`on-wheel` is not processed.

[18:06](#msg5e877b2165be83628f92ac6b)Red 0.6.4 for Windows built 27-Sep-2019/19:46:20+03:00 commit #d0e6692

hiiamboris

[18:23](#msg5e877f05c82e2165d62c4bb5)Try `focus`

[18:23](#msg5e877f07e6b6d3649c6d2e6a)https://github.com/red/red/issues/4275

GalenIvanov

[18:48](#msg5e8784e7ceabcb659d43df54)@hiiamboris Thank you, `focus`fixed the issue!

## Sunday 5th April, 2020

greggirwin

[22:23](#msg5e8a5a799316f34b8d8147aa)@planetsizecpu @GalenIvanov great work, both of you.

[22:25](#msg5e8a5ae31aaf8e4b8e628c49)@planetsizecpu nice positive spin, and @GalenIvanov, fun to spin the tiles with the mouse and play.

[22:26](#msg5e8a5b145d148a0460e87a3d)Even after all these years, I'm still often amazed when I see the code behind some things. Really nice.

## Monday 6th April, 2020

GalenIvanov

[08:30](#msg5e8ae8bd5d148a0460e99a1d)@greggirwin Thank you! Curiosity is one of my main driving forces too.

greggirwin

[17:58](#msg5e8b6db5fea5216d695ff37c)I just read something with a quote attributed to Einstein: Play is the highest form of research. :^)

9214

[18:02](#msg5e8b6ecff87c5956a23ee2a4)@9214 \[Remember kids, the only difference between screwing around and science is writing it down.](https://www.youtube.com/watch?v=BSUMBBFjxrY)

greggirwin

[18:03](#msg5e8b6f01d021c45cc7cad172):^)

TimeSlip

[18:45](#msg5e8b78b26823cb38acb374ce)@greggirwin RE: "the only difference between screwing around and science is writing it down." Glad I've been keeping all notes in Cheyenne then. :&gt;)

greggirwin

[18:47](#msg5e8b792dcc370f0b07c85a9f)That was @9214 who gets credit for the link. Gitter renders differently if you use `/me` for some reason.

TimeSlip

[20:47](#msg5e8b95486823cb38acb3be7f)@greggirwin Then I better "put it in writing". Thanks @9214 !

## Tuesday 7th April, 2020

planetsizecpu

[11:29](#msg5e8c6426cc370f0b07cab5e7)@GalenIvanov good stuff @greggirwin Thx I still playing when I can, so am I doing research? in fact yes, I found a lot of bugs and new ideas by playing the game 😊 while learning Red-lang.

GalenIvanov

[14:29](#msg5e8c8e6316f84f0461612d41)@planetsizecpu :thumbsup:

## Saturday 11st April, 2020

Rebol2Red

[20:56](#msg5e922f08cc370f0b07da559c)Wanted (dead or alive :) fstk-logo (or any other picture for testing purposes which is included inside Red).

```
view [image fstk-logo]
```

\*\** Script Error: VID - invalid syntax at: \[fstk-logo]

If i'm not mistaken this used to work in the past.

hiiamboris

[21:06](#msg5e92316138198d56a1972d10)`? gui-console-ctx/fstk-logo`

## Thursday 16th April, 2020

planetsizecpu

[08:30](#msg5e981796e920022432aa1338)Ah, I never looked at that context!, so I take advantage to set console's std cursor instead of the caret, who seems more familiar to me by:

gui-console-ctx/caret/size/x: 8

Thx @hiiamboris 👍

endo64

[21:30](#msg5e98ce722ff88975b4253c24)That's nice. Especially with `gui-console-ctx/caret-clr: 255.255.255.150`

## Friday 17th April, 2020

planetsizecpu

[07:53](#msg5e9960738e987f3a5e21325a)@endo64 👍 just now I did try to change the console background colour by console settings, I found that if you change the RGB values by writing on the text field, then the console window freezes (but still responding REPL) and you can't drag, resize or even close it, and no menu works, just still working locked on screen. This is on last release on w10, can someone try?

[07:53](#msg5e99607a85b01628f055ca1f)\[!\[console.jpg](https://files.gitter.im/red/red/gui-branch/kwMb/thumb/console.jpg)](https://files.gitter.im/red/red/gui-branch/kwMb/console.jpg)

ne1uno

[08:13](#msg5e99650e8e987f3a5e214788)clicking in latest is wonky win7 too, click some other window then can right click again

endo64

[11:00](#msg5e998c69d240da24337b55d0)I'm on March 11's build and it works normal, will test the latest.

BeardPower

[17:39](#msg5e99e9b5a9ca1862064405a1)What is the better/standard approach for generating faces?

a: mybutton/create

or

a: make face! mybuttonspec

The former would encapsulate the make face inside mywidget itself.

[17:40](#msg5e99ea175706b414e1d5415a)The latter would be more flexible as it can work with any spec which is passed to it.

[17:42](#msg5e99ea7ec7dcfc14e2c7e890)A collection of widget objects vs. a collection of widget specs.

[17:42](#msg5e99ea8ed240da24337ce278)Thoughts?

hiiamboris

[18:00](#msg5e99eed285b01628f058442f)Why not just define your own style and call `make-face`? (I'd stay away from objects as it's a minefield)

BeardPower

[18:57](#msg5e99fc0cc38aa05a1a7e732c)@hiiamboris Because I have a table which consists of multiple faces. By using an object, I could encapsulate those faces in a table object and I can have multiple tables without calling make-face for every single face in the table.

[18:58](#msg5e99fc64a412254f21924d63)I would need to do a: mytable a/facea bla a/faceb blub etc. instead of only doing a: table.

[18:59](#msg5e99fc9a5706b414e1d594c9)A minefield because of the copy issues?

hiiamboris

[19:01](#msg5e99fcf98e987f3a5e23fa46)Because of subtle stuff: https://www.reddit.com/comments/8g7oce

[19:01](#msg5e99fd0447110862053bf889)Mainly it's bind-related

[19:02](#msg5e99fd2b63e7b73a5fe3c398)Your table - it's a panel face?

BeardPower

[19:02](#msg5e99fd4847110862053bfa0a)No, a base face.

[19:02](#msg5e99fd5bd65bcf75b5cc80c7)I will draw the cells on my own.

hiiamboris

[19:02](#msg5e99fd6385b01628f0587d67)So how do you put multiple faces into a base?

BeardPower

[19:03](#msg5e99fd64c7dcfc14e2c83b65)It's a custom widget.

[19:03](#msg5e99fd7b8e987f3a5e23fc4c)The other faces are stored in extra.

greggirwin

[19:03](#msg5e99fd80c38aa05a1a7e78db)`make` is the more idiomatic approach. There is no reason you can't define your specs as data, in a block or map, so they are still "contained".

BeardPower

[19:03](#msg5e99fd93a1284c4f2099c767)And the table is a context, so it can store multiple faces.

hiiamboris

[19:04](#msg5e99fdc18e987f3a5e23fd74)Well, you can use the `init` field of your base style, which would create the needed faces for each `table`

BeardPower

[19:04](#msg5e99fdc947110862053bfc19)Yes, I could store the used specs and make faces out of it.

hiiamboris

[19:05](#msg5e99fde685b01628f0588072)Or even `on-create` actor

BeardPower

[19:05](#msg5e99fe16c38aa05a1a7e7a08)Yes, but the issue is with the copy.

[19:06](#msg5e99fe23a9ca186206445de8)I cannot do this: a: table b: table.

hiiamboris

[19:06](#msg5e99fe290480c128efc6b45b)Why not?

BeardPower

[19:06](#msg5e99fe2d0480c128efc6b46c)The faces in a and b will be references.

[19:06](#msg5e99fe37d65bcf75b5cc8301)See the issue in bugs.

[19:07](#msg5e99fe712ff88975b42a14f0):point\_up: \[17. April 2020 15:14](https://gitter.im/red/bugs?at=5e99abc1a1284c4f209872f6)

hiiamboris

[19:07](#msg5e99fe82d240da24337d377c)Face's style template is just a block, and `init` is also just a block. Simply define the code that would create new faces for each `table` instance in `init` and assign to a specific face's `extra`

BeardPower

[19:08](#msg5e99fea95706b414e1d59d8f)Yes, but I cannot create it automatically like when using a context.

[19:08](#msg5e99febc2ff88975b42a1747)a: table would create the faces automatically.

[19:09](#msg5e99fee0a1284c4f2099cb96)And what init are you referring to?

[19:09](#msg5e99feeba1284c4f2099cbbd)There is no such thing according to the doc.

hiiamboris

[19:09](#msg5e99ff0763e7b73a5fe3caaf)It's not documented. Gimme a sec.

[19:10](#msg5e99ff2d8e987f3a5e240306)

```
>> ?? system/view/VID/styles/image
system/view/VID/styles/image: 
[
    default-actor: on-down 
    template: [type: 'base size: 100x100] 
    init: [unless face/image [face/image: make image! face/size]]]
```

BeardPower

[19:12](#msg5e99ff9785b01628f058883d)Thanks. Why is it not documented?

[19:13](#msg5e99ffdfd240da24337d3ce8)But that will not solve the issue of encapsulation.

[19:13](#msg5e99fff2c38aa05a1a7e8235)a: table should create all the faces.

[19:14](#msg5e9a0003c38aa05a1a7e8352)But I cannot use it because the faces are not copies.

[19:14](#msg5e9a001f63e7b73a5fe3d224)So how to achieve that?

hiiamboris

[19:14](#msg5e9a0022e920022432b1c117)Why are they not copies? `init` will be executed for each `table` instance, so each instance will have it's own faces

BeardPower

[19:14](#msg5e9a002d5706b414e1d5a319)See the link

[19:14](#msg5e9a002e63e7b73a5fe3d232):point\_up: \[17. April 2020 15:14](https://gitter.im/red/bugs?at=5e99abc1a1284c4f209872f6)

[19:15](#msg5e9a004a5706b414e1d5a3c9)Because they are not copied.

hiiamboris

[19:15](#msg5e9a006574bfed5a1b43cafc)So don't copy. Make them inside `init`

BeardPower

[19:16](#msg5e9a0087d240da24337d3f9d)And using make face like in the link?

[19:17](#msg5e9a00b3c7dcfc14e2c84827)I will try it. Thanks!

## Sunday 26th April, 2020

meijeru

[16:07](#msg5ea5b1a711ffed1268372fd9)Is there a way to make a `panel` face scrollable? I have the need to dynamically populate a panel with any number of two-line `area` faces, each one below the other, and when I program this naively, there are of course only so many that will fit, and the rest is invisible. Test program:

```
Red [Needs: View]
win: layout [
	title "test scroll"
	list: panel 300x600 [
	]
	at 10x620 button "Quit" [quit]
]
off-set: 10
repeat i 20 [
	insert tail list/pane make face! [
		type: 'area
		offset: as-pair 10 off-set
		size: as-pair list/size/x - 20 40
		text: rejoin ["area nr " i]
		flags: [no-border]
	]
	off-set: off-set + 50
]
view win
```

toomasv

[16:48](#msg5ea5bb4161a0002f794e2914)@meijeru Some custom scroller-examples \[here](https://github.com/toomasv/learning/tree/master/snippets/scroller).

meijeru

[18:00](#msg5ea5cc295d245d59f31c979d)Thanks! I see it is fully self-made, nothing "built-in". Advantage: you can have it the way you want it. Disadvantage: you have to think of everything :smirk:

greggirwin

[18:14](#msg5ea5cf72e5ed621d4de0e030)@meijeru it will almost certainly be a standard element, and easy to do in the future. The basic idea will likely just be a single virtual face inside a pane. R2 VID had an incredibly flexible `list` style, which had problematic limitations, but was otherwise a fairly elegant approach to virtual sub-faces.

[18:27](#msg5ea5d2a7501f8f72a507280f)If you download the rebol.org desktop librarian, you can see some examples of it being used: http://www.rebol.org/download-librarian.r

## Monday 27th April, 2020

meijeru

[13:28](#msg5ea6de19501f8f72a509d4ff)I took the first example @toomasv gave me and adapted it. It works fine enough. I 'll have some private comments to make, though.

## Wednesday 29th April, 2020

ralfwenske

[08:09](#msg5ea93656347bd616304324c2)None of the `on-close` actors get triggered when closing this view. Should they?

```
Red [Needs: 'view]
v: layout [
       t: area  red       
       on-close [print ["closing t"] ?? face ?? event ]
]
v/actors: make object! [
    on-close: [print ["closing v"] ?? face ?? event ] 
]
print t
view/flags v ['resize]
```

```
.
.
font: none
actors: make object! [
    on-close: func [face [object!] event [event! none!]][Print ["closing v"] ?? face ?? event]
]
extra: none
draw: none
```

planetsizecpu

[08:21](#msg5ea939080b23797ec04e3ca4)That works for me:  
`v: layout [ t: area red on-over [print ["OVER t"] ?? face ?? event ] ] v/actors: make object! [ on-over: [print ["OVER v"] ?? face ?? event ] ]`

Just move the mouse over the red box to see how works

ralfwenske

[08:22](#msg5ea9395aadb0ec5c2bd294e6)@planetsizecpu That works for me too. Does the `on-close` work for you? I want to intercept the closing.

planetsizecpu

[08:23](#msg5ea939979f0c955d7d91f5e2)I think on-close does not apply, as there is no close box for the red `area`

ralfwenske

[08:24](#msg5ea939c531a6d25d7c99491b)Shouldn’t it apply for the view? (window)

planetsizecpu

[08:25](#msg5ea939ea9f0c955d7d91f7d1)But if you do that, by closing the window then you stop all process

ralfwenske

[08:26](#msg5ea93a1d9f0c955d7d91f84c)Exactly - that’s why I wish to intercept eg. if you accidentally close a window.

planetsizecpu

[08:27](#msg5ea93a6f0b23797ec04e3ff6)I thing there is a `view/flag`that prevents closing, but I just don't remember... sorry

ralfwenske

[08:36](#msg5ea93c8131a6d25d7c99521d)@planetsizecpu Here a complete example what I mean : Closing by any means needs to be intercepted (menu, button, window-close)

```
Red [Needs: 'view]
confirm-quit: function [][ 
    res: none
    view/flags [
        title "test-confirm"
        text "Unsaved data somewhere! Really Quit?" return 
        button "OK" [res: true unview] 
        button "Cancel" [res: false unview]
    ][  modal popup]
    res
]
v: layout [
    b: button "Quit" [if confirm-quit [unview]]    
]
v/actors: context [
    on-close: [confirm-quit]
]
view/flags v ['resize]
```

You can run this but closing the window directly is not intercepted

planetsizecpu

[08:51](#msg5ea9402197338850a2d6e83a)Ah, just found it: `view/flags v [no-buttons 'resize]` prevents view show the window drag bar buttons. So we have to close by code.

ralfwenske

[09:09](#msg5ea9444c7975db7ebfd1f845)Cool - that’s an option. Now I have to catch the 'Quit' from a menu...

hiiamboris

[10:09](#msg5ea95265d898fe7a375484e8)@ralfwenske `on-close: func [f e][confirm-quit]`

## Friday 1st May, 2020

ralfwenske

[09:15](#msg5eabe8a3b6dd2306979b97ef)Thanks @hiiamboris - I had a response and thought I had sent it :)…

I have a strange observation with `react` - both on macOS and GTK

```
Red []
f: function [o [object!]][
    o/size: o/parent/size - 20x20
    print ["in f"]
]
v: layout [
    title "TEST" size 800x600
    b: base 
        react [  
;            print ["before " face/parent/size face/size]
            f face
;            print ["after  " face/parent/size face/size newline]
        ]
]
view/flags v ['resize]
```

as it is I have no reaction at all. When I uncomment one or both `print` statements it works as expected. I this a known issue? Same in Windows?

[09:41](#msg5eabeebc14b48f0698a1e2cc)In a more complex app it behaves differently: If I view the `v` layout it works as expected. However viewing `v1` shows no reaction.  
Is calling a function too time costly or is it a bug? (Same in macOS and GTK)

```
Red []
fit: function [face [object!] ][
    fs: face/size ps: face/parent/size - 20x20
    if none? face/extra [
        print ["Creating extra"]
        face/extra: copy context [ratio: none] 
        face/extra/ratio: divide to-float fs/x fs/y
    ]    
    pratio: divide to-float ps/x ps/y
    if ps/x <> ps/y [
        either pratio > face/extra/ratio [    
            face/size: to-pair reduce [(to-integer (ps/y * face/extra/ratio)) ps/y ]
        ][
            face/size: to-pair reduce [ps/x (to-integer (ps/x / face/extra/ratio))] 
        ]
    ]
]

v: layout [ title "TEST" size 800x600
    base 300x200
        react [ 
            fs: face/size ps: face/parent/size - 20x20
            if none? face/extra [
                print ["Creating extra"]
                face/extra: copy context [ratio: none] 
                face/extra/ratio: divide to-float fs/x fs/y
            ]    
            pratio: divide to-float ps/x ps/y
            if ps/x <> ps/y [
                either pratio > face/extra/ratio [    
                    face/size: to-pair reduce [(to-integer (ps/y * face/extra/ratio)) ps/y ]
                ][
                    face/size: to-pair reduce [ps/x (to-integer (ps/x / face/extra/ratio))] 
                ]
            ]
        ]
]  

v1: layout [ title "TEST" size 800x600
    b: base 300x200
        react [ 
            fit face   
            print ["after " face/size] 
            ?? face/extra        
        ]
]

view/flags v ['resize]     ;;; and try with v1
```

toomasv

[10:10](#msg5eabf5825cd4fe50a3e23017)@ralfwenske (This is about your previous message.) It is same on Windows. I think it is because you need to have reactive source (changing element) explicitly in your `react` code. When you uncomment `print` then reactive source is there. You can check this so -- don't uncomment `print`s but write just `face/parent/size`somewhere in the `react` block (just a dummy). It should activate the reaction.

[10:14](#msg5eabf66ca9de3d01b1dfda1d)And same is true for your last message. `b` in `v1` will resize if you just include `face/parent/size` somewhere in `react` block. With `v` it works because you have reactive source explicitly there.

ralfwenske

[21:12](#msg5eac90c8347bd616304cef66)Great explanation, thank you @toomasv !

[22:25](#msg5eaca1eca9de3d01b1e1c738)'The penny has droppend' :)

## Monday 4th May, 2020

planetsizecpu

[17:03](#msg5eb04afff0377f1631681031)This weekend I have been reviewing some functions of the game, and cleaning code. I have found some  
rest of copy &amp; paste out of place, but the most amazing thing has been to improve the game cycle so  
easily. Now the gold bags already collected are removed from the face tree, instead of hiding out of  
sight, so that the cycle of checks is progressively shortened, and handling improves as the barrow  
is loaded. The beauty of the matter is that one-liner was enough, so easy in Red:

`alter GameData/CaveFace/pane (f/extra/getobject)`

[17:04](#msg5eb04b157a24ff01b0ff449e)\[!\[cavetest141.gif](https://files.gitter.im/red/red/gui-branch/zpfD/thumb/cavetest141.gif)](https://files.gitter.im/red/red/gui-branch/zpfD/cavetest141.gif)

hiiamboris

[17:34](#msg5eb052143d58de7a38f4230e)'Barrowplane' :D  
Looks like it allows you to ~fly~ ;)

GalenIvanov

[18:31](#msg5eb05f937a24ff01b0ff874a)@planetsizecpu Nice! Thanks fo sharing your experience!

greggirwin

[20:15](#msg5eb077de22f9c45c2a6c81e6):+1:

## Tuesday 5th May, 2020

GalenIvanov

[12:18](#msg5eb159a25cd4fe50a3ee91f2)I'm almost ready with my next project - \[Izzi puzzle](https://github.com/GalenIvanov/Games/blob/master/Izzi.red)  
It's an attempt to code a simulator for the \[real Izzi puzzle by ThinkFun](https://www.thinkfun.com/products/izzi/) in Red

[12:19](#msg5eb159ef5cd4fe50a3ee92cb)\[!\[Izzi - solving.png](https://files.gitter.im/red/red/gui-branch/ribl/thumb/Izzi---solving.png)](https://files.gitter.im/red/red/gui-branch/ribl/Izzi---solving.png)

[12:20](#msg5eb15a1e347bd616305777f4)You can learn more of the puzzle on \[Jaap's puzzle page](https://www.jaapsch.net/puzzles/izzi.htm)

[12:21](#msg5eb15a3ca9de3d01b1ec19f9)Have fun!

[12:33](#msg5eb15d2797338850a2ead561)Here's short \[video](https://www.youtube.com/watch?v=gMSg6wvGIcw) demostrating the puzzle. I'll upload a better one later.

[12:39](#msg5eb15e6a22f9c45c2a6e9416)My code has some issues, one of which is the border around the tiles - now it's behind the tiles and it's hardly visible. When I bring it to front, it destroys the tiles when I bring each of them to front while dragging.

hiiamboris

[12:49](#msg5eb160d314b48f0698ae7229)It bugged at some point while I was dragging tiles around ;) Now one tile is there and not there at the same time

[12:50](#msg5eb1610114b48f0698ae728f)Oh. It returned to it's place when I dragged the empty field where it was

GalenIvanov

[12:51](#msg5eb16134347bd61630578be0)@hiiamboris Yes, I have seen this, but I don't know when it happens - it certainly needs to be fixed

hiiamboris

[12:52](#msg5eb161975cd4fe50a3eea695)Also `?` window is all black on black for me ;)

GalenIvanov

[12:53](#msg5eb161e17a24ff01b001e6f1)The window and not the "button"?

hiiamboris

[12:54](#msg5eb161e8a9de3d01b1ec3010)No, the window

[12:54](#msg5eb161eb5cd4fe50a3eea841)Is there a reason you do `make object!` for fonts instead of `make font!`?

[12:54](#msg5eb1620a7975db7ebfe61d54)!\[](https://i.gyazo.com/ec1f89616db67c48ba7fc86594d8d412.png)

GalenIvanov

[12:54](#msg5eb1621e9f0c955d7da5f552)I don't know, I've probably copied it from somewhere :)

hiiamboris

[12:57](#msg5eb1629d347bd61630578ef4);)

[12:57](#msg5eb162c197338850a2eae32e)`make font! [name: "Verdana" size: 10 style: 'bold]` should be enough

GalenIvanov

[12:59](#msg5eb1631d5cd4fe50a3eeaaee)Thank you, I'll have it in mind. Maybe the black comes from your custom display settings?

hiiamboris

[13:02](#msg5eb163db7a24ff01b001ecac)You overrode the font color but not window color, so partly yes

GalenIvanov

[13:03](#msg5eb1641e7a24ff01b001eda6)It's hard to see a black text on black backround :)

hiiamboris

[13:04](#msg5eb164530b23797ec062bd5c)That's my point ;)

[13:07](#msg5eb165137975db7ebfe6253c)`min` &amp; `max` work with pairs, so you can do `min 0x0 max 720x360 offs`

GalenIvanov

[13:07](#msg5eb1651514b48f0698ae7e9b)I used your advise and got rid of the unnecessary fields of fonts declarations.Can you try once again?

[13:08](#msg5eb16538f0377f16316abcbd)Oh, that's nice!

hiiamboris

[13:08](#msg5eb16558adb0ec5c2be6e3f4)Good :)  
!\[](https://i.gyazo.com/25faccbeca502cda090383e4c5a182a8.png)  
I see you even filled the title text

GalenIvanov

[13:09](#msg5eb165965cd4fe50a3eeb070)Hmm, There are two more paragraphs

[13:10](#msg5eb165c17975db7ebfe62645)you can see them in the source

[13:11](#msg5eb165ed97338850a2eae9f9)I remember you said you use scale factor x1.5

hiiamboris

[13:13](#msg5eb16688a9de3d01b1ec3ae1)1.25

GalenIvanov

[13:13](#msg5eb1668f7975db7ebfe62874)ok

[13:34](#msg5eb16b5b7a24ff01b00201e1)@hiiamboris Is there a way to query the scale factor within Red? I'll try to make it in Red/System (in Windows)

hiiamboris

[13:41](#msg5eb16d01a9de3d01b1ec4c3a)Yes. But idk if that may help...

[13:41](#msg5eb16d0b31a6d25d7cadb2d2)I wonder why it didn't stretch the window?

GalenIvanov

[13:42](#msg5eb16d5a5cd4fe50a3eec67b)@hiiamboris What is`idk`?

hiiamboris

[13:42](#msg5eb16d6114b48f0698ae962f)\[i don't know](https://www.urbandictionary.com/define.php?term=idk)

GalenIvanov

[13:43](#msg5eb16d96a9de3d01b1ec4d51)I learned something today :)

[13:48](#msg5eb16e9b0b23797ec062da3a)@hiiamboris Can you show me how to obtain the scale factor? (I'll probably use it in other projects to scale graphics according to it)

hiiamboris

[13:54](#msg5eb170003d58de7a38f6cabe)Wow this is so weird...

[13:54](#msg5eb1700f7975db7ebfe6403b)Okay don't bother with the scale factor - Red should bother about it

[13:54](#msg5eb1701aa9de3d01b1ec552f)I'll nail this bug down and report

[13:55](#msg5eb1703b97338850a2eb08b1)So far it seems to work when I launch it from the file, and only half of the text when launched from GitHub

GalenIvanov

[13:55](#msg5eb17064adb0ec5c2be6ffb9)@hiiamboris This is strange... Thank you!

hiiamboris

[13:56](#msg5eb170907a24ff01b0020f3b)It is in `system/view/metrics/dpi`, but like I said, it should scale itself without your efforts

GalenIvanov

[13:58](#msg5eb170f7d898fe7a37689dc1)@hiiamboris Thanks!

hiiamboris

[13:59](#msg5eb171527a24ff01b00210d3)Oh that's it.. `read` from GitHub doubles every new-line...

GalenIvanov

[14:00](#msg5eb1719822f9c45c2a6ec5f2)@hiiamboris I saw the big distance between the lines on your screenshot, but I thought it's something diferent. Blank lines!

hiiamboris

[14:01](#msg5eb171a17a24ff01b0021172)

```
0000000000: 52 65 64 20 5B 0D 0D 0A │ 20 20 20 20 54 69 74 6C  Red [♪♪◙    Titl
0000000010: 65 3A 20 22 49 7A 7A 69 │ 20 70 75 7A 7A 6C 65 20  e: "Izzi puzzle
0000000020: 69 6E 20 52 65 64 22 0D │ 0D 0A 20 20 20 20 41 75  in Red"♪♪◙    Au
0000000030: 74 68 6F 72 3A 20 22 47 │ 61 6C 65 6E 20 49 76 61  thor: "Galen Iva
0000000040: 6E 6F 76 22 0D 0D 0A 20 │ 20 20 20 4D 6F 72 65 2D  nov"♪♪◙    More-
0000000050: 69 6E 66 6F 3A 20 68 74 │ 74 70 73 3A 2F 2F 77 77  info: https://ww
0000000060: 77 2E 74 68 69 6E 6B 66 │ 75 6E 2E 63 6F 6D 2F 70  w.thinkfun.com/p
```

See `0D0D0A` patterns

GalenIvanov

[14:01](#msg5eb171c6d898fe7a37689fb0)Yes, I see

[14:05](#msg5eb172a1adb0ec5c2be70699)@hiiamboris But that doesn't answer the question why did half the text disappear from the about window.

hiiamboris

[14:06](#msg5eb172e23d58de7a38f6d3fe)Yeah right

[14:07](#msg5eb1732f31a6d25d7cadc341)Wild guess: it counts line-feeds (0A) for lines, but Windows renders caret-returns (0D) for lines ;)

[14:08](#msg5eb1735d7975db7ebfe64948)Probably worth a separate issue. We'll see

GalenIvanov

[14:08](#msg5eb17367adb0ec5c2be708fc)ok

hiiamboris

[14:09](#msg5eb173a022f9c45c2a6ecab0)IIRC though, text size is determined by GDI+ functions, while rendering is done by GDI. So probably not gonna be fixed.

planetsizecpu

[14:52](#msg5eb17dae5cd4fe50a3eef23d)@GalenIvanov Good job push hard!

greggirwin

[16:58](#msg5eb19b2b3d58de7a38f7462f):+1: Not sure when I can play, but it looks fun!

GalenIvanov

[18:01](#msg5eb1a9eed898fe7a37693d00)@planetsizecpu @greggirwin Thank you! I think I fixed the visibility order and now the marker indicating the current tile is brougth to front. I hope that this fix also solved the mysterious disappearing of the tiles @hiiamboris reported earlier today.

## Tuesday 19th May, 2020

BeardPower

[11:45](#msg5ec3c6f470f28c384b84b9f7)Is this a bug?

If I do this in the console it works. Both texts are colored by the pen-color not the font-color:

```
view [base 400x400 draw [font tab-font pen 253.101.43 text 15x0 "one" text 73x0 "two"]]
```

But if I do the same inside the event handler on-create, the pen-color is not taken into account. It draws both texts with the font-color:

```
draw: [font tab-font pen 253.101.43 text 15x0 "one" text 73x0 "two"]
```

hiiamboris

[11:47](#msg5ec3c75ab8869e38c499a26b)what's `tab-font`?

BeardPower

[11:48](#msg5ec3c789940fa238d600d218)

```
tab-font: make font! [
            name: "Roboto Condensed"
            size: -14
            style: 'bold
            color: tab-colors/1
        ]

tab-colors: [156.157.165 253.101.43]
```

hiiamboris

[11:50](#msg5ec3c7e8520b7a38fbdda4aa)!\[](https://i.gyazo.com/63612ce1bc0ecbfea2b02982e3d898ad.png)

[11:50](#msg5ec3c805b8869e38c499a429)On W7 in console it uses font

[11:50](#msg5ec3c8196773a13b23ee3a1c)Let me try a recent build

[11:51](#msg5ec3c82f7da13f3a0ac28c7b)Same

[11:51](#msg5ec3c836940fa238d600d322)`Red 0.6.4 for Windows built 13-May-2020/14:18:02+03:00`

BeardPower

[11:52](#msg5ec3c86f0f31e03a3074a3b0)Win10 Red 0.6.4 for Windows built 17-Apr-2020/14:18:08+02:00

It's using the pen.

hiiamboris

[11:52](#msg5ec3c881f7c0af39ee1811df)Great ;) Then definitely a bug

BeardPower

[11:52](#msg5ec3c8886773a13b23ee3abd)Let me get the recent one.

[12:05](#msg5ec3cb71b0256038f9dbf593)The most recent build is not using the pen.

[12:05](#msg5ec3cb9d520b7a38fbddae42)So what is the correct behavior? Using the pen or not?

[12:06](#msg5ec3cbd3940fa238d600db42)

```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 1129 date: 19-May-2020/7:08:02 commit: #cf2a750291801285de93d3313c732ddce5bb8983 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 18363 ]
--------------------------------------------
```

pekr

[12:16](#msg5ec3ce050f31e03a3074b008)Use the pencil :-)

hiiamboris

[13:46](#msg5ec3e3460c32623a4b432f93):D

## Wednesday 20th May, 2020

luce80

[14:29](#msg5ec53ebfa1aa566f0839ecb5)Is there a way to programmatically move the cursor of a field ?

meijeru

[17:13](#msg5ec5654c6e837c7743c23a4c)An excellent question that I would like the answer to also! I played around with the `/selected` facet but that got me nowhere.

toomasv

[17:46](#msg5ec56d116e837c7743c24ec1)I think it is possible with some R/S voodoo but not on high level.

## Thursday 21st May, 2020

temperfugit

[06:18](#msg5ec61d3963c8e90e4300681d)Is it possible to send or simulate keys in Red, say if I wanted to make `area` think the right arrow key was pressed when it wasn't?

endo64

[06:40](#msg5ec6224913b79205dc894426)I don't think it is possible without using R/S with system APIs (https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-sendinput for Windows)

hiiamboris

[07:58](#msg5ec634a0a1aa566f083c4e19)@temperfugit see https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/input.red that uses \[this](https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/sys-input.red) and \[that](https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/sys-input-win32.reds)

[08:01](#msg5ec6353d6e837c7743c41e3d)And I also think that input simulation must be the only way of tricking a native control into displaying a context menu, so no simple task

temperfugit

[13:41](#msg5ec6850df0b8a2053aa51633)Thanks, @endo64 and @hiiamboris. I was trying to think of a workaround to figure out the caret position at any given time. I was thinking maybe I could automatically select a letter by sending shift + right, read the selection position and then clear the selection by sending a left press. Oh well. I could maybe do it by using call and AutoHotKeys somehow but that would be messy and not cross-platform. There are a handful of cool tricks I can think of doing with Red if `area` exposed the caret position even just as read only (though the ability to manually set it would obviously be even better).

[13:49](#msg5ec686cd3ffa6106f1c6358d)Has anybody on team Red ever said anything about plans for adding caret info and possibly caret manipulation features?

hiiamboris

[13:51](#msg5ec6877f7da67d06fac1e7b7)You can control the caret with R/S using WinAPI. Somebody even did it already for a Red project ;)  
I'm sure we'll see that in View in the future, as that is a common need

[13:54](#msg5ec68822549761730b4bca2e)I guess you may make a wish in \[red/REP](https://github.com/red/REP/issues) and bump https://github.com/red/red/issues/2422 along the way (by mentioning it there), to remind everyone about it ;)

[13:56](#msg5ec68898b101510b200b04dc)Funny thing is, OS uses the same mechanism for text selection and caret positioning. But R/S code of View fights it by forbidding the second thing right now and leaving only selection accessible ;)

meijeru

[13:59](#msg5ec689413ffa6106f1c63a00):+1:

temperfugit

[14:44](#msg5ec693e49da05a060a214e55)I will try to remember to post a wish after work today. If we had a bounty system this is definitely something I would throw a few dollars at.

greggirwin

[19:06](#msg5ec6d1462c49c45f5a93c2ee)I did a `send-keys` dialect for R2. It's a handy feature for macro programming other apps.

## Friday 22nd May, 2020

temperfugit

[01:13](#msg5ec7272a27513a72fba5a4f3)I made a wish! ;) https://github.com/red/REP/issues/76

hiiamboris

[09:25](#msg5ec79a713ffa6106f1c8b06b)thanks ;)

[18:01](#msg5ec81396778fad0b131d4463)@qtxie I'm having 37-40 ms lag when simply rendering an image (see \[this script](https://gist.github.com/hiiamboris/6b77a58ae549b6af413b494a416b3b01)).  
Is GDI+ really \*that slow* or we're doing something nasty there in Draw code?

greggirwin

[18:15](#msg5ec816a72c49c45f5a96b9ff)15-17ms here, but my tower machine is pretty fast with a good graphics card.

hiiamboris

[18:17](#msg5ec8172eff7a920a72061ae9)Newer CPU/MB probably ;) Mine are from 2011 I guess

greggirwin

[18:18](#msg5ec8178c4c9b0f060d195695)I still have my 2011 tower running, too, if needed. Now we at least have 2 references though.

toomasv

[19:30](#msg5ec82844ff7a920a72064627)21-23ms (occasionally &gt;30) on 2.7 GHz i7 laptop.

GalenIvanov

[20:21](#msg5ec83431a91f120a6cb853a2)21-23ms on 2.6 GHz i7 / nVidia GeForce 950M laptop

hiiamboris

[20:26](#msg5ec835753ffa6106f1ca4ad9)I'm using W7 in "Classic" mode by the way, so no window composition =&gt; no HW acceleration =&gt; more lag

## Saturday 23th May, 2020

qtxie

[07:56](#msg5ec8d7102c49c45f5a98525e)@hiiamboris Seems it's the best GDI+ can do.

hiiamboris

[08:35](#msg5ec8e0574c9b0f060d1af2cc)):

[08:35](#msg5ec8e05b225dc25f549e26c4)what a piece of..

[08:35](#msg5ec8e06ef0b8a2053aaa8e32)I'm looking forward for D2D draw then!

ralfwenske

[09:24](#msg5ec8ebb5f0b8a2053aaaa7af)Linux Mint on Lenovo Yoga 2 (2006) and Mac Mini (2012) around 1 - 2 ms  
Win 10 in VM on Yoga between around 30 - 60 ms

hiiamboris

[09:27](#msg5ec8ec7db101510b20108a6e)Thanks! That proves the culprit is GDI+ ;)

planetsizecpu

[10:26](#msg5ec8fa45778fad0b131f349a)71-74ms on 4 core Pentium 2.4GHz / intelHD

ne1uno

[17:45](#msg5ec961369da05a060a27bd9b)D2D 30ms vrs 80ms on i5 win7

hiiamboris

[17:49](#msg5ec96238f0b8a2053aabb342)Still not so great for D2D huh. Interesting.

## Saturday 30th May, 2020

ne1uno

[08:32](#msg5ed21a357da67d06fadef91d)@TimeSlip  @greggirwin has this, works in older red, crashes current. may be able to do something similar with base.

[08:32](#msg5ed21a354412600ccd78e1ef)dyn-tab-panel.red https://gist.github.com/greggirwin/c4ba0b07e73b7e050b0f1df6bd80c15a

greggirwin

[19:21](#msg5ed2b223ff7a920a72208f6f)@qtxie that gist crashes for me now too. I can update it if there's a better way now.

## Sunday 31st May, 2020

qtxie

[06:32](#msg5ed34f9527513a72fbc3b507)I'll check it tomorrow.

## Wednesday 3th June, 2020

PierreChTux\_twitter

[13:41](#msg5ed7a898f0b8a2053acfcdb5)0.07-0.12 ms on Dell Latitude (2014) with GNU/Linux Devuan, using Red built from the (relatively) old @rcqls's repository.

## Friday 5th June, 2020

henrikmk

[16:49](#msg5eda7797a3a1b13679cc8a86)Is the Red UI able to produce tool-tips and if so, how are they done?

[16:54](#msg5eda78d089941d051a45d97b)or maybe rather borderless windows that don't take up the taskbar and don't have any window activation. I'm looking for a way to do this in REBOL, so was wondering if Red can already do this.

hiiamboris

[17:06](#msg5eda7b8e778fad0b134bb1c4)&gt; tool-tips

Nope, unfortunately. You can spawn another window or base inside your window though. Latter is very buggy on W7, former may be activated, so no easy way.

[17:07](#msg5eda7bbc9da05a060a53625c)&gt; borderless windows

`no-border` flag and maybe `modal` (also very buggy, but some bugs were fixed recently)

henrikmk

[17:09](#msg5eda7c36ff7a920a72342f61)ok thanks. I'm looking at the Red console and the menus in that window are obviously something drawn from win32 or similar, since they basically seem to be borderless non-activating windows.

hiiamboris

[17:09](#msg5eda7c492c49c45f5ac50efa)Menus are native

henrikmk

[17:10](#msg5eda7c6b7f08394226cb8eb2)could you call up a native menu from Red?

hiiamboris

[17:11](#msg5eda7cba4c9b0f060d47ccf1)You create it by `menu` facet for the window face

## Sunday 7th June, 2020

hiiamboris

[19:18](#msg5edd3d7ef0b8a2053add8a54)I added my thoughts on \*\*table style\** to @henrikmk 's wishes here: https://github.com/red/red/wiki/%5BPROP%5D-GUI-table-grid-design  
@greggirwin @toomasv @rebolek @pekr have anything to add or clarify? ☻

toomasv

[19:48](#msg5edd4474f0b8a2053add9d05)@hiiamboris Whoa! You are a thorough man :+1: I'll try to take time to work through this in coming week.

meijeru

[19:50](#msg5edd45049da05a060a59bc60)If I may react to the proposal as well: there is no explicit requirement for the \_types_ of data that go into the cells, should they comprise \_all_ Red datatypes, or a subset (e.g. scalars)?

hiiamboris

[19:53](#msg5edd45aa22dd44422405262f)A known case of table usage is displaying objects contents (e.g. in object explorer tools). So - no requirement.

[19:55](#msg5edd4614a3a1b13679d2e0d9)In fact, one powerful ability an object explorer must have IMO is to be able to tell and explore the binding of a word (it's context). Definitely not a feature for \*any* table, but something that should be easily doable with a custom renderer.

henrikmk

[19:55](#msg5edd463f4c9b0f060d4e3122)if you can pass a block of objects directly to a Red table without any other information and have that output being usable, that would be a good goal.

hiiamboris

[19:58](#msg5edd46d222dd4442240529e4)@henrikmk Block and object are trivial. But how do you propose laying out a block of objects? Each object is a row and they all have the same 'class' (prototype)?

henrikmk

[20:01](#msg5edd4782778fad0b13522076)@hiiamboris yes, it's a common usage pattern to have a block of identically specced objects, like if you were to pass a face tree to a table, it would be able to display it with each face being a row. you could of course add handling for objects with different specs.

In LIST-VIEW, I just look at the specs for the first object and derive column names from the object words.

hiiamboris

[20:01](#msg5edd47ab89941d051a4c517d)Yes, good idea.

henrikmk

[20:10](#msg5edd49aea3a1b13679d2e8b3)Something I've come to like are picker functions, so you entirely avoid having to present data to a widget in a particular way, and you avoid having to do any data passing beyond what the widget asks for.

The table calls the picker function with a particular cell position, and that one cell would be picked out from the source data.

hiiamboris

[20:18](#msg5edd4ba49da05a060a59ccfd)So the cell still carries around it's color/alignment/other stuff, but data it gets from a function? If so, I guess it's we can just assign a function to cell's `data` facet/field and it will call that function to actually get the data. Although the drawback compared to a centralized picker mechanism will be that if you change the picker you will have to change it for every cell...

henrikmk

[22:10](#msg5edd65da9da05a060a5a0668)you could use the cell face as another argument to the picker function, then you set value and style at the same time.

GiuseppeChillemi

[23:17](#msg5edd759822dd444224058ded)@hiiamboris also you could have a local picker function and a global one. If the local pone. I have adopted this technique recently and it comes very handy

[23:18](#msg5edd75abff7a920a723adb40)Pardon, I am on mobile

[23:18](#msg5edd75e1225dc25f54d17bf9)@hiiamboris also you could have a local picker function and a global one. Use the global picker but if the local one exists, use it. I have adopted this technique recently and it comes very handy

[23:21](#msg5edd765cdaf4cf366eea554d)Also, if you define the specs, the developer could pass to you custom picker for new datatype.

## Monday 8th June, 2020

hiiamboris

[07:56](#msg5eddef36ff7a920a723be781)Thanks for sharing your thoughts ☻

GiuseppeChillemi

[13:46](#msg5ede414c225dc25f54d3709f)I have also other things to share. I couple of weeks ago I have nearly completed specs for text table. I will see in these days if there is anything to add from my side but you have already done a great work!

[13:47](#msg5ede4188225dc25f54d371a2)(however I keep thinking there is an astral connection somewhere. Too many coincidences!)

hiiamboris

[14:18](#msg5ede48a17f08394226d456f0)there is ;)

pekr

[14:38](#msg5ede4d77778fad0b1354ab99)Cool document, food for thought for the evening coffee session :-) In terms of Angular, we use the https://www.ag-grid.com/ , e.g. Microsoft is accelerating their List View usage, making it a separate service (so not only for Sharepoint) - https://techcommunity.microsoft.com/t5/microsoft-365-blog/announcing-microsoft-lists-your-smart-information-tracking-app/ba-p/1372233

hiiamboris

[14:47](#msg5ede4f9d7da67d06fafcf5c8)Funny, ag-grid is slower than a table made of native faces - and they find that acceptable ;) Although it scales nicely to big datasets.  
Interesting features... selectable columns &amp; column groups, whole chains of filters, user-controllable resize/autosize, multi-column/row selection with export capability.

pekr

[14:50](#msg5ede502c7da67d06fafcf701)I do remember, in our DOS era (CA Clipper) we've got a grid, which was able to freeze columns, resort them, save on a per user basis. But - had grown up in the corporate DB area, so grids were really needed for data manipulations. I wonder, why OSs have so weak implementations, so that there is nothing usable to bind to ...

rebolek

[14:52](#msg5ede50b2ff7a920a723cf15a)MS is selling the King of tables, so why would they compete with themselves?

pekr

[14:56](#msg5ede5192a3a1b13679d56433)You mean Excel? Give it to me in an embeddable form to my app then :-)

rebolek

[15:02](#msg5ede53024c9b0f060d50c320)Why would MS do that? :-)

pekr

[15:04](#msg5ede536df0b8a2053ae02990)We should not talk MS only. Give me just the same in terms of OS-X or Linux. Simply put - higher level widgets are not going to be available on multiple platforms, so that you could share just one principle of usage, navigation, etc..

planetsizecpu

[15:19](#msg5ede57042c49c45f5ace0107)And not only tables, think also of a PDF viewer widget, so you can embed it in your VID code, useful too IMO.

pekr

[15:58](#msg5ede60227f08394226d49ecd)Well, many ppl would probably welcome some kind of web-view too. But we still don't have e.g. tree-view too.

rebolek

[15:58](#msg5ede6027778fad0b1354e521)With browser overtaking OSes as UI platform, I don't think we'll see improvements in that area in a short time. Corporate may still use native UI, but that will change in a few years. There's going to be something new by then probably (VR, AR?) and corporate will be few years behind as always but expecting that we'll move back to native widgets is like expecting we'll move back to mainframes.

pekr

[15:59](#msg5ede6054b101510b20461736)Are you stating that it was a wrong aproach for Red to wrap native widgets?

[16:01](#msg5ede60e6f0b8a2053ae05234)I am really torn apart on that. Because with the R2/VID, we have often lamented, that we are not system compliant, especially in areas like - look, typography, inability to reflect system UI settings changes, keyboard navigation, etc. Now we've got a native Widgets and we miss the free form stuff. But I thought, that draw will give us back a freedom.

[16:02](#msg5ede612aff7a920a723d2277)Not sure how efficient is the base, upon which other widgets work, but thought that rendering wise, Direct2D would help and was glad we've seen some GOB experiments too ...

rebolek

[16:03](#msg5ede614d9da05a060a5c6e90)No, I don't think it's wrong, it's more complex. Was it wrong to target 32bit?

pekr

[16:03](#msg5ede61587f08394226d4a1d1)What aproach e.g. Qt takes? It seems to me, that it might be the only cross-platform toolkit, which can still compete in a non-browser world.

[16:06](#msg5ede620f7da67d06fafd2d48)I do also remember some talks to such high level topic of strategies to take, and some ppl here expressing, that it is not a problem of Desktop vs Browser, but mostly about a delivery platform. E.g. the mobile is a proof, that Carl got it mostly right. What else is that, that his IOS on steroids? On mobiles, dedicated apps still rule the game.

[16:07](#msg5ede62247da67d06fafd2d5f)As for MS, they will (again) try to solve the situation with the project Reunion - https://www.theverge.com/2020/5/19/21258697/microsoft-windows-project-reunion-win32-uwp-apps-apis-build

rebolek

[16:07](#msg5ede6225225dc25f54d3cee5)Qt is in an awkward situation. They want to start charging for everything for one year and release free then which of course KDE and others don't like. When I was at CZ.NIC, guy who was doing "Datovka" (@pekr you probably know what it is and it's a cross-platform app for others) told me, that the decision for Qt was a wrong one, that they're being more and more closed.

pekr

[16:08](#msg5ede627a2c49c45f5ace2371)If MS or Apple would allow for easy installation of apps without the admin rights (as e.g. MS Teams), the situation for a Desktop app would not be that bad nowadays ...

rebolek

[16:08](#msg5ede628e89941d051a4f17e8)As for MS, one of their most successful projects recently is Visual Studio Code written in Electron.

[16:09](#msg5ede62c2daf4cf366eec9ff8)&gt; If MS or Apple would allow for easy installation of apps without the admin rights

They won't because of "viruses"!!!

[16:10](#msg5ede62fd778fad0b1354ee07)Just read some articles how hard it is to get your app approved by MS or Apple to not trigger any OS warnings.

dander

[17:37](#msg5ede77624c9b0f060d51361b)It is completely possible to have local user installation and execution of apps without any elevated privileges on Windows (generally under %localappdata%). Even using msi packages. It's just much more common to do system-level installs. The malware warnings are a whole separate issue though

## Tuesday 9th June, 2020

greggirwin

[01:50](#msg5edeeaeab101510b20477573)Thanks for the table research @hiiamboris ! Will get to it as soon as I can.

pekr

[06:12](#msg5edf283e7f08394226d68eb7)I can see some performance notes, and also as a reflection to Rebolek's comments to the native widgets. What I would do first is to consider, where do we go. What I mean is - is the lowest element, a `base`style a good foundation to base other styles upon? I am still for at least some level of native widgets linkage, as I have seen many attempts in the past to create a menu/context menu, and for me, all attempts failed.

On the other hand, based upon the history of usage, there was a reason, why R3 brought a `gob`, as `face`was too heavy structure to allow certain level of setups/performance. The same way Carl thought of the R2 port model - too heavy object, a mixture of TCP kind of ports and serial port items, etc. Once again - if we want thousands of connections, it should be addressed, the same for the tasking model.

GiuseppeChillemi

[06:56](#msg5edf32a9a3a1b13679d79e47)@pekr  
&gt;&gt; On the other hand, based upon the history of usage, there was a reason, why R3 brought a gob, as facewas too heavy structure to allow certain level of setups/performance. The same way Carl thought of the R2 port model - too heavy object, a mixture of TCP kind of ports and serial port items, etc. Once again - if we want thousands of connections, it should be addressed, the same for the tasking model.

Have you links to such discussions? I would like to read the analysis and opinions

pekr

[08:50](#msg5edf4d4fa85de3039400e105)@GiuseppeChillemi There was many related discussions, both public (in terms of Altme) or private, difficult to search and provide something related and useful ....

## Tuesday 16th June, 2020

bkalef88\_gitlab

[02:18](#msg5ee82c0d49260560aa62a6df)Sorry if this has been asked before. What are people doing to work-around not having a data-grid or list-view face in Red?

rebolek

[03:48](#msg5ee84106013105125a39c007)@bkalef88\_gitlab no problem! There are some efforts to write custom table style in Red (I did one some time ago and @hiiamboris is working on another). So there is a way.

hiiamboris

[08:42](#msg5ee885db2cf2f36eae6166e1)@bkalef88\_gitlab what do you want to use it for?

## Wednesday 17th June, 2020

bkalef88\_gitlab

[05:35](#msg5ee9ab99ef5c1c28f029f91a)just simple display of simple csv data... search results.

[18:46](#msg5eea65227c62240ad2ba79ca)rebol view had a stylize option, is this something that is not needed in Red, or is something that has not been built?

hiiamboris

[19:06](#msg5eea699a7ad97a062cab8534)https://github.com/red/red/pull/3825

## Tuesday 23th June, 2020

rsheehan

[08:05](#msg5ef1b7c93a0d3931faab675e)Is there a work around for

```
on-enter
```

not working on macOS? As in `view [ input-field: field on-enter [print ["***" input-field/text "***"]] ]`

hiiamboris

[08:16](#msg5ef1ba5bc4bdd83475fe10f2)You should report that.

[08:40](#msg5ef1bff8e0e5673398cc969e)I mean \[here](https://github.com/red/red/issues/new?template=bug\_report.md)

rsheehan

[22:00](#msg5ef27b9754d7862dc4a4f179)@hiiamboris I reported it on the red/bugs page first.

## Wednesday 24th June, 2020

henrikmk

[15:42](#msg5ef3747247fdfd21ede1e14d)I'm doing some grid performance tests, and noticed that, when updating BG colors, the UI updates slowly upwards, while updating face texts, the UI updates slowly downwards. Would be curious to know why that is:

```
b: [space 0x0 origin 0x0]

repeat i 30 [
	repeat j 20 [
		insert tail b [text 100x24]
	]
	insert tail b 'return
]

insert tail b [
	button "Random BG Colors" [
		foreach fc f/pane [
			fc/color: random 255.255.255
		]
	]
	button "Random Text" [
		foreach fc f/pane [
			if fc/type = 'text [
				fc/text: random copy "1234567890"
			]
		]
	]
]

view f: layout b
```

hiiamboris

[16:11](#msg5ef37b2b3a0d3931faafd4e6)`Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1` nothing moves on W7

greggirwin

[17:41](#msg5ef3903a54d7862dc4a7a26b)Interesting. Would be good to test on other platforms. I see it here, with a small note that when changing the text the first face to change is that very last one. Then the ripple starts.

[17:45](#msg5ef39150d65a3b0292aa127e)For real fun, change the size a few times:

```
b: [space 0x0 origin 0x0]

repeat i 30 [
    repeat j 20 [
        insert tail b [text 100x24]
    ]
    insert tail b 'return
]

insert tail b [
    button "Random BG Colors" [
        foreach fc f/pane [
            fc/color: random 255.255.255
        ]
    ]
    button "Random Text" [
        str: random "1234567890"
        foreach fc f/pane [
            if fc/type = 'text [
                fc/text: str
            ]
        ]
    ]
    button "Random Size" [
        sz: 20x5 + random 80x20
        foreach fc f/pane [
            if fc/type = 'text [
                fc/size: sz
            ]
        ]
    ]
]

view f: layout b
```

hiiamboris

[17:47](#msg5ef391a5c4bdd8347502bc79)I see what you mean now. Text is instantaneous for me though, can't determine the direction.

greggirwin

[17:47](#msg5ef391c6c4bdd8347502bd6c)I think this is the OS doing things out of our control, with potentially many things having an effect. When changing the size, I see a couple different drawing behaviors, with some of them being 2 visible "passes".

[17:51](#msg5ef392bb405be935cdbe03c0)If I turn off `system/view/auto-sync?` while changing the faces, then `show` the window pane after all the updates are done, the visible behavior is the same here.

henrikmk

[19:26](#msg5ef3a8e67ba3965373c87154)@greggirwin I'm also seeing multiple passes in both directions with the Random Size button. In some cases, text rendering becomes very slow.

## Thursday 25th June, 2020

toomasv

[03:05](#msg5ef414703a0d3931fab154ed)Similar draw-based:

```
b: clear []

repeat i 30 [
    repeat j 19 [
        repend b [
			'fill-pen random 255.255.255 
			'clip s: as-pair j - 1 * 100 i - 1 * 24 s + 100x24 
			'box s s + 100x24 
			'text s copy random "1234567890"
		]
    ]
]

fc: [b: box 1920x720 draw (b) return]

insert tail fc [
    button "Random BG Colors" [
		system/view/auto-sync?: off
        parse b/draw [some ['fill-pen change skip (random 255.255.255) | skip]]
		show b
		system/view/auto-sync?: on
    ]
    button "Random Text" [
        system/view/auto-sync?: off
		parse b/draw [some ['text skip change skip (copy random "1234567890") | skip]]
		show b
		system/view/auto-sync?: on
    ]
    button "Random Size" [
        system/view/auto-sync?: off
		sz: 20x5 + random 80x20
		parse b/draw [some ['clip set s skip change skip (s + sz) | skip]]
		show b
		system/view/auto-sync?: on
    ]
]

view layout compose/only fc
```

bkalef88\_gitlab

[03:14](#msg5ef416833a0d3931fab1591d)Nice. No extra passes with this technique in my Win 10 machine which was seeing the extra passes as discussed above.

[03:15](#msg5ef416eaa813c72dcf0abf5e)@toomasv I spent most of my evening looking over your DRAWING.RED 'learning' files, and then played with DRAWING.RED. Amazing what you did there. Did you have intentions on doing more with this, or is it effectively no longer in development?

toomasv

[03:21](#msg5ef418233a0d3931fab15d35)@bkalef88\_gitlab Thanks! I still hope to come back to this at some point and brush it up, as I can't keep it constantly synced with all the developments in Red :). As most of my other projects it was done for learning an aspect of Red.

henrikmk

[11:23](#msg5ef489277ba3965373ca71e0)@toomasv tried your DRAW versoin, and as far as I can tell, there is a very large overhead with drawing many faces. so, not sure where we are in addressing that.

toomasv

[13:16](#msg5ef4a3bbc4bdd83475054a60)Version with simple \[navigation](https://gist.github.com/toomasv/1b008bbff02550cbb821378be73e487f)

pekr

[13:18](#msg5ef4a42cfa0c9221fc5cfffe)Nice ... and what a tiny amount of code!

Respectech

[16:02](#msg5ef4caab7ba3965373cb2bbb)Great job, @toomasv ! It would be interesting to see how smooth it is with a scrollbar. ;-p

toomasv

[16:33](#msg5ef4d1eae0e5673398d45661)I tried with standalone scrollbar, but my data of 100000 rows was too big for it to handle delicately enough. :)

Respectech

[16:50](#msg5ef4d5e3bb149531edce383b)I didn't have a chance to look at the code. Is it using faces or 'draw?

hiiamboris

[17:36](#msg5ef4e0b1fa0c9221fc5da72f)Current scrollbar implementation has only 1000 positions max.

toomasv

[17:48](#msg5ef4e38154d7862dc4aae062)@Respectech One face with pageful of draw.  
@hiiamboris Good to know! I guessed there was some limitation blocking my try.

hiiamboris

[17:58](#msg5ef4e5b47ba3965373cb7639)Sorry, even 100 positions ;)

pekr

[18:22](#msg5ef4eb49bb149531edce7a3d)100 positions means just a granularity of the slider, no? You can recalculate based upon the number of rows?

hiiamboris

[18:23](#msg5ef4ebb23a0d3931fab37ba3)With 100000 rows that's jumps by 1000 lines (while you only see circa 20-30 on the screen at one time).

[18:24](#msg5ef4ebf4bb149531edce7c2e)Although if you're dragging the scrollbar by mouse, you're still limited to the number of pixels per scrollbar ;) But with keys you could (if it was implemented) scroll precisely.

[18:26](#msg5ef4ec5e7ba3965373cb871a)Scrollbar solution should scale good to ~1000 lines, and somewhat usable but awkwardly to ~10000. After that you either need 2 scrollbars or a custom creative interface...

[18:27](#msg5ef4ec9047fdfd21ede59c86)If you've got only ~1000 lines, you can just drop the whole table into a \[scrollpanel](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/scrollpanel.red) and call it a day.

[18:29](#msg5ef4ecf2b8152d348463181d)I need to write a demo for it.

pekr

[18:31](#msg5ef4ed83fa0c9221fc5dc774)I think that for the grid style, unless it is supposed to be just few hundreds of records, we should implement something like a caching engine. Simply a window to data. I remember to use one such professional grid. The config defined the size of the data area. Then there was a size of a visible area. Each move, by mouse, arrows, pgdn/up, recalculated a data window position and filled in the data again ... then it can be scrolled. Once srcrolled close to the data window border, the data was populated again ...

hiiamboris

[18:40](#msg5ef4ef99b8152d3484631eff)I thought about that, but have no experience with such UI. Was it convenient to use like this? And is scrolling thru such huge data really something one wants to do, or should we rather expect filters and paginagion (like in Toomas's example)?

pekr

[18:46](#msg5ef4f10547fdfd21ede5aad7)It was really convenient. But I have worked at the data drive controlling department. There were other countra-opinions stating, that if you need to scroll the infinite amount of data, the design of your apps is wrong. So it really depend. Pagination is a no go for the quick browsing dataset needs - it is an old-school web grids, because - web could not do much better than that back then ;-)

hiiamboris

[18:51](#msg5ef4f22db8152d3484632526)Added a \[scrollpanel demo](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/scrollpanel.md).

[18:53](#msg5ef4f29054d7862dc4ab0940)I hate paginagion myself. Although, if it reacted to mouse wheel and hotkeys - it would be tolerable.

greggirwin

[19:08](#msg5ef4f61ba813c72dcf0cfb14)I did draw based grid and tree experiments in R2, and they can work great for read-only data. It gets trickier when you need to handle events and such. The R2 slider could have tiny values, so worked there. OS scrollers do not, and you really don't want too many items in normal cases. Spreadsheets are a different story, and virtualizing it all is what they have to do. It's all an illusion. That's OK though. What we really want is the data structure and evaluation model that lives behind them, and then be able to map the UI over that dynamically.

pekr

[19:11](#msg5ef4f6d5d65a3b0292ad82a2)In-place editing is overrated. I don't like it for the business data at all - it is not your Excel! We supported just a navigation (including keyboard) and AED (Add, Edit, Delete) actions. In the case of Edit, you were simply brought to editing form ....

greggirwin

[19:15](#msg5ef4f7e9d65a3b0292ad8686)The R2 `list` style was very simple. If we can find a good way around its limitations (related to editing), it's not a bad way to go. The key is that the `pane` facet was a func, not a block. It also had a shortcut feature, so simple data didn't require you to do anything if it mapped directly to faces in the sub-layout.

[19:18](#msg5ef4f86cfa0c9221fc5de162)That is, you could set the `data` facet, and the subfunc mapped it automatically by index. Otherwise you created a `supply` func which was called for each face as it needed data.

pekr

[19:22](#msg5ef4f960613d3b33940aa4c9)Anything is more useful than having nothing :-)

greggirwin

[19:23](#msg5ef4f9bd405be935cdc18541)If @toomasv, @hiiamboris, or @henrikmk want to talk more about this and internal options, we can set up a room for that. Henrik has the most experience with real world list styles, Boris knows the perils of Red internals, and Toomas has done experiments in many areas. For a real style, we also need Nenad or Qingtian to weigh in.

[19:27](#msg5ef4fa853a0d3931fab3a38e)Since Red uses native controls, their creation and destruction is a major issue compared to how R2 did it. \*But\*, we can also look at the primary uses cases and see if a single model works for both. That is, a simple table of data, with a few added things like checkboxes, versus a list/gallery of rich sub items that are best done with a sub-`layout` spec.

hiiamboris

[19:29](#msg5ef4fb0ffa0c9221fc5de6da)I'm in. I think `pane` as a function will destroy Red though.

pekr

[19:29](#msg5ef4fb25a813c72dcf0d05d8)I thought that the draw is a natural addition here. All we need is the base style, which accepts evens adn we can draw upon it, make it transparent to painting and eventually events ...

hiiamboris

[19:31](#msg5ef4fb87a813c72dcf0d0774)So the first thought here: we should have a structure that will work both on a single face using draw, and with a bulk of native controls.

pekr

[19:36](#msg5ef4fcb9613d3b33940aafb4)Can we make a custom style using draw + events already? Is the base style optimal to start with? How far the gob experiment went? I have seen some screenshot so it looked usable .... found this :-) https://github.com/qtxie/notes/issues/6

hiiamboris

[19:38](#msg5ef4fd4d613d3b33940ab185)1-4ms per face draw is very slow if timings are precise.

[19:39](#msg5ef4fd58405be935cdc18e1e)But I guess it'll change.

pekr

[19:39](#msg5ef4fd747ba3965373cbb853)Why is that? Does not even the D2D help the situation?

hiiamboris

[19:40](#msg5ef4fd92fa0c9221fc5deefd)Only Qingtian can tell ;)

[19:40](#msg5ef4fdacfa0c9221fc5def56)Meanwhile, on the limitations of native faces:  
!\[](https://i.gyazo.com/0590fa1126c0e95c1af5210b6981d6de.gif)

[19:41](#msg5ef4fdf06c06cd1bf4546e5e)~150 rows is like a limit of what View is capable of. Although internal sort is not working so I had to make my own, not optimized, and that's part of why sorting is so slow. Another part is that `auto-sync?: off` is crash-prone, so I rarely can use it.

[19:42](#msg5ef4fe29c4bdd83475064844)On the bright side: mixed data &amp; editable cells. Bring the power of GOBs in, and who knows how far it'll scale.

[19:44](#msg5ef4feb5fa0c9221fc5df299)Also, works only on my own reactivity. What's in the master branch just spawns random errors.

toomasv

[19:46](#msg5ef4feffc4bdd83475064ab4):point\_up: \[June 25, 2020 10:23 PM](https://gitter.im/red/red/gui-branch?at=5ef4f9bd405be935cdc18541) @greggirwin Gladly.

## Friday 26th June, 2020

toomasv

[08:59](#msg5ef5b8fb405be935cdc32bf3)@Respectech @hiiamboris Added \[decent scroller](https://gist.github.com/toomasv/1b008bbff02550cbb821378be73e487f)

hiiamboris

[10:00](#msg5ef5c743613d3b33940c770b)Nice! You've hacked it :)

[10:01](#msg5ef5c769bb149531edd08102)Do you know if this /max-size trick works with any scroller or only those obtained with `get-scroller`? (IIRC get-scroller is not working on panel faces, only base and maybe area)

[10:01](#msg5ef5c783c4bdd83475080d08)Wheel doesn't work like that on W7 btw.

[10:05](#msg5ef5c87cd65a3b0292af62dc)Also what does this line do?  
https://gist.github.com/toomasv/1b008bbff02550cbb821378be73e487f#file-draw-table-red-L51

pekr

[10:46](#msg5ef5d21f6c06cd1bf4565df5)Hmm, the decent scroller crashed my red console after few secs of dragging it down.

hiiamboris

[10:53](#msg5ef5d3b8fa0c9221fc5fd2dd)Doesn't crash on W7. Could be luck, GC, or buggy build.

pekr

[10:57](#msg5ef5d4b37ba3965373cda212)Yeah, using Masters, compiled yesterday ....

hiiamboris

[10:59](#msg5ef5d521bb149531edd0a412)Since you compile from sources, can you compile it with `-d` and post the stack trace?

pekr

[11:00](#msg5ef5d543fa0c9221fc5fd62c)@hiiamboris so you find 1-4ms for the face redraw being slow? I wonder, if we can make any measured test, e.g. for a certain size, e.g. HD or FHD and look into the speed of a refresh? Dunno, what is the lowest base style. Is that a base? Because, IIRc, with R2, there were 2 possibilities as how to draw image - using and image facet, and using a draw, which was a separate pipeline. Not sure how Red works in that regard.

[11:01](#msg5ef5d5a147fdfd21ede7b30f)OK, I'll first download latest, there were few commits since yesterday. Will try again, then recompile with -d, if it still crashes ....

[11:02](#msg5ef5d5dc7ba3965373cda47d)My take is - if there are still some defficiencies in the core of View, than providing an upper layers like reactivity, or a complex widgets, will only create a problems imo ....

[11:03](#msg5ef5d61647fdfd21ede7b4a6)We should do some benchmark, using a View, D2D based View branch, compare the basic refresh. I have used Particles demo for some basic comparison, but just simple redraw should do it ...

hiiamboris

[11:06](#msg5ef5d6a947fdfd21ede7b5ff)The deficiencies are seemingly endless :D But prototyping something complex lets them surface.

&gt; so you find 1-4ms for the face redraw being slow?

The eye is able to see things happening within a ~10ms time frame. So we'll see it as sluggish at best. But then, ~10 columns by ~20 rows = 200 cells = 200 ms = far from being realtime. Hopefully, in a batch update it'll be better.

pekr

[11:07](#msg5ef5d70abb149531edd0a91e)No crash with the fresh console, dragging scroller like crazy :-) It seems stable at 76.1MB memory consumption, occupying cca 25-26% of CPU, when I am mad with scroller. But goes down afterwards ....

hiiamboris

[11:08](#msg5ef5d727b8152d3484653896):+1: another magical fix ☻

henrikmk

[11:14](#msg5ef5d899d65a3b0292af8b4e)&gt; so you find 1-4ms for the face redraw being slow? I wonder, if we can make any measured test, e.g. for a certain size, e.g. HD or FHD and look into the speed of a refresh?

A simple grid of 1000 faces or so with texts and colors should suffice as a benchmark. Already easy here to tell that some improvements are needed.

pekr

[11:32](#msg5ef5dcdabb149531edd0b50c)I don't regard it being a benchmark, sorry. Not if you can display the grid in multiple ways. Provide me just one big face, benchmark a redraw, refresh rate, that's the benchmark. Then we can see, how the lowest UI element is fast to refresh. Putting gazzilion of such faces into display is a completly different measure.

[11:34](#msg5ef5dd58c223cc536a385164)Simply put - if someone claims 1-4ms is slow, I would like to know, what is it compared against? C level app, bitmap of the same size? Is that "slowness" expected due to the nature of Red (being 2-5 times slower than C app equivalent)? Or is there anything to fix or do better in the View engine?

toomasv

[11:44](#msg5ef5dfa56c06cd1bf4568159)@hiiamboris There are two scroller types AFAIK, embedded one (used here) and standalone one. They have different facets and working logic. `max-size` works for embedded scroller. It seems to work on panel too on W10 (but horizontal used to be buggy; haven't checked now).  
Thanks for note on `wheel`! It works here but I'll try some other method.

hiiamboris

[11:45](#msg5ef5dfe0c223cc536a385a39)@toomasv https://github.com/red/red/issues/4275

toomasv

[11:46](#msg5ef5dffa54d7862dc4ad3600)Ah, ok, thanks!

hiiamboris

[11:46](#msg5ef5e002fa0c9221fc5feed1)You can probably `set-focus` in `on-down` event, theoretically, but in my experience this may lead to very strange bugs.

henrikmk

[12:19](#msg5ef5e7d9b8152d3484656427)&gt; I don't regard it being a benchmark, sorry. Not if you can display the grid in multiple ways. Provide me just one big face, benchmark a redraw, refresh rate, that's the benchmark.

One big face will always be fairly fast to refresh, because you're putting more stress on fill rate of the draw engine itself than on face rendering pipeline. If you're straight rendering to a bitmap, you're also ignoring compositing overhead. It's better to measure the overhead of drawing many small faces, since this is a much more common scenario, and because there are real bottlenecks here to solve.

Displaying the grid in multiple ways comes down to whether you want to hack your way to speed (using one face and DRAW) and lose flexibility or do it correctly (using many faces and the face tree) and gain flexibility. If you don't do the latter and research optimizations for the latter, then most Red GUIs will just be slow.

&gt; Simply put - if someone claims 1-4ms is slow, I would like to know, what is it compared against? C level app, bitmap of the same size?

It's compared against R2, the earlier test file which displays 600 faces:

```
Random BG Colors 0:00:00.009
Random BG Colors 0:00:00.01
Random Text 0:00:00.013
Random Text 0:00:00.013
Random Size 0:00:00.012
Random Size 0:00:00.011
```

So, 600 faces updated in 0.01 seconds, roughly 0.016 ms per face! And remember: R2/View is supposed to be slow compared to some modern UIs. :-)

Red with auto-sync off is 10-15x slower in the best cases, 60-70x slower in the worst cases:

```
Random BG Colors 0:00:00.121925
Random BG Colors 0:00:00.120924
Random Text 0:00:00.183893
Random Text 0:00:00.19188
Random Size 0:00:00.700569 ; <- argh...
Random Size 0:00:00.671189
```

hiiamboris

[12:42](#msg5ef5ed2fd65a3b0292afc0b5)I don't think you can profile the real lag of native widgets. Red may tell you that it's updated, but OS may take a few seconds more to actually draw those updates ;)

[12:43](#msg5ef5ed78405be935cdc3b18d)Meaning you should expect in reality it will be worse than what the numbers say

toomasv

[12:45](#msg5ef5edf33a0d3931fab5c64b):point\_up: \[June 26, 2020 1:05 PM](https://gitter.im/red/red/gui-branch?at=5ef5c87cd65a3b0292af62dc) @hiiamboris It guarantees that if you drag scroller to the end it shows last page (and doesn't stop on page before the last one).

hiiamboris

[12:45](#msg5ef5ee06405be935cdc3b2bf)Ah! I see. Thanks.

toomasv

[12:47](#msg5ef5ee66b8152d34846574fb):+1:

hiiamboris

[12:48](#msg5ef5ee87ec4a341beeee220a)Will it then have some sort of "jump" in the middle?

[12:50](#msg5ef5ef08c223cc536a388239)I guess with 100k lines nobody will ever notice though ;)

toomasv

[13:20](#msg5ef5f623c223cc536a389444)Yes, it jumps in the middle.

pekr

[14:21](#msg5ef60464405be935cdc3f022)@henrikmk So why is Red so much slower here? Because of the interpreter and going down to metal thru R/S? R2 qctually had two pipelines, original onee and AGG. And R3 got much faster with Gobs and full AGG.

[14:26](#msg5ef60593e0e5673398d73a7c)I try to find out, what R2 rendered to, in comparison to Red, as the bottom layer ...

Respectech

[17:26](#msg5ef62fcefa0c9221fc60da3e)@toomasv Great work! It is quite fast on my workstation with your decent scroller. This would work fine for my office software needs. :-)

toomasv

[17:39](#msg5ef632dec223cc536a395335)@Respectech It's @qtxie's :) I found it used in console.

GaryMiller

[18:07](#msg5ef6396154d7862dc4ae4089)Will that scroller be adapted into the text box control as an option for the next release?

greggirwin

[19:53](#msg5ef6524d7ba3965373cf0696)Nice work as always @toomasv. :+1:

[19:58](#msg5ef65367613d3b33940dff22)Do we have anyone here who uses a .NET lang, Java with a UI kit, or any other GUI building tool? Let's compare against the others out there, both native and non-native.

[19:59](#msg5ef653beec4a341beeef4a50)Start a wiki page, please, using Red and R2 as the first entries. A simple table should be enough, and we can include test code for each platform.

[20:03](#msg5ef6548ba813c72dcf105a9a)I thought I'd install VS to see what it's like now, and offer up quick stats, but the minimal install seems to be 5GB, and if I select a few other options, it's 20GB, so...not going to happen right now. At least the bootstrap installer was only 70M. And the bootstrap for the bootstrap was only 1.3M. ;^)

hiiamboris

[20:05](#msg5ef654f547fdfd21ede91942)&gt; bootstrap for the bootstrap

:D

[20:05](#msg5ef6550ce0e5673398d827b2)I don't believe you can get it in less than 20GB. 5GB must be some lie.

greggirwin

[20:05](#msg5ef65522e0e5673398d82869)WHAT!? ;^)

hiiamboris

[20:06](#msg5ef65528fa0c9221fc614896)Also I don't remember the installer ever finishing successfully on my PC.

[20:07](#msg5ef65585b8152d3484669d3c)Or was it "starting successfully"? Well, anyway, the only thing I've seen after download is some big window that says "something's gone wrong" ;) Without specifics of course. Who needs those details anyway

greggirwin

[20:27](#msg5ef65a14c223cc536a39b86a)Ultimately, if there was a free lunch out there, somebody would know about it and the world would unite behind it. The current Red GUI system is native, so we have to manage expectations about what you can do with it. e.g you can't change button colors, X faces take Y time to update, ...there is no magic. You're not going to create a rich text editor or web browser by using a text face for every word or phrase in a document. You're not going to create a spreadsheet with Excel's limits with an array of fields. Same for non-GUI, massive scale tasks. So don't do that.

On one end, we have a huge number of useful GUIs we can create that won't stress the system at all (WRT number of faces, and with Boris' experiments even reactivity can be pushed quite far). At the other end are the things above, not to do. If we make a graph, with UI "weight" in number of faces, and required performance, where does Red fall. How far can the current system go?

We can brute force a lot, but not everything. This is why the table/grid topic is important. You should never need to put 1'000 buttons, fields, or check boxes on the screen. A user can't make sense of that many discrete elements. OS GUI systems weren't designed for that, so it's a fight all the way down.

Lists and grids are a different story, because the content is repeated and is just that, content. Trees live somewhere in between. We may mostly agree that modeless is better than modal, but here too is where we may be able to create a sufficient illusion and find a balance of user experience without excessive internal complexity.

nedzadarek

[21:01](#msg5ef662173a0d3931fab7120a)@greggirwin IntelliJ from Jetbrains is ~1GB. It has some gui creator but it's slow on my machine so I haven't tried it.

pekr

[21:05](#msg5ef66334d65a3b0292b1124b)What Carl has headed towards with R3 was an ability to display an order of a magnitude more objects, than with R2, not less. And that is the goal I have expected with the Red too. I still like some native UI elements, especially menu, as it was painfull to watch to mimick with older R2 attempts. Then I can of course count for that and lower my expectations. It is that I just thought, that in some way, we might obey such a system and render down to some base ground element, which would be even accelerated by HW and that we would be definitely faster here than R2. Will try to find some time to do some basic testing of the speed of refresh of the FullHD area.

greggirwin

[22:23](#msg5ef6754d613d3b33940e5354)How does "magnitudes more objects" help us? I have thoughts about where they apply, certainly, and gobs are the way to go there. But consider how ubiquitous mobile is now. How many items can you fit on a phone screen? And will any non-native app be accepted on phones? My stance is that we don't need "more" UI, we need "enough" UI, and better UI. We won't get there by chasing speed and optimizing the wrong thing.

I do want to know what's slow right now. I just did an interesting test. Using the above examples, I extracted a small random subset of faces to update. It's \*still* slow using eyeball timing. Better when you reduce the total number of faces to 300, but still artifacts when resizing all faces. Maybe @qtxie can weigh in with thoughts. We should learn a lot from his insight.

## Saturday 27th June, 2020

pekr

[00:13](#msg5ef68f2647fdfd21ede9a45d)Why are you talking about a non-native apps? It does not necessarily has to be a black or white. We can have both and I thought that draw is a legitimate interface for eventual custom widgets construction? All I am trying to point out is - can we somehow check, what do we render to? Can we compare, what does R3 renders to? I mean - do we use an efficient OS element for a base style? As you have pointed out, when dragging stuff, resizing stuff, sometimes we can see artifacts. Chances are, there still might be small bugs to fix and who knows, maybe it even will provide some speed improvements. But really - stating thing like how many items can you fit on your phone screen anyway, is neglecting one of the reasons why Carl has started R3 - to allow order of magnitude more elements on the bigger screens.

greggirwin

[00:26](#msg5ef6924eec4a341beeefddca)I'm talking about non-native GUIs, because native GUIs don't scale to the numbers you're talking about. There is no efficient base style, in that regard. If it's a child window, it's got a minimum weight, which is what we run up against now. 1) Can we agree on that?

2\) To support a huge number of UI elements, we have to do it ourselves. Can we agree on that?

3\) There is a cost to building things ourselves, and we shouldn't pay more of it than necessary. Can we agree on that?

4\) I will absolutely neglect things without a good reason to do otherwise. Give me a reason. More &lt;&gt; better. I asked "How does "magnitudes more objects" help us?" What's your answer?

qtxie

[02:55](#msg5ef6b5116c06cd1bf458b047)I think it's slow because everything is not optimal.  
1\. Native GUIs don't scale well to large numbers.  
2\. Red is not fast.  
3\. GC is not fast. (GC takes 55ms ~ 90ms in the decent scroller demo)

[03:08](#msg5ef6b81ec4bdd834750a6cc1)Using GOBs will make it a little better, not much. The best advantage of GOB is that we have better control with the rendering pipeline, so we can apply fancy visual effects and animations to it.

theSherwood

[03:51](#msg5ef6c2406c06cd1bf458c7e1)Having done a fair bit of GUI stuff but always at a really high level of abstraction (browser), I have loads of very naive questions about this. What prevents Red/System from calling some C for all the low-level GUI stuff?

pekr

[07:13](#msg5ef6f198fa0c9221fc628fc8)@greggirwin No problem with agreeing to 1), 2) and 3). As for 4), it gets tricky. So why Carl wanted GUI engine to handle more stuff? Do you remember Geomol doing a gfx apps? We have one guy here doing a game. My quesiton is - why not to have a solid compositing engine? I do remember from the past, that apart to Draw, Effects, there might even be some 3D pipeline in the future.

My take is - aim high, plan well, even if it would be supposed to come in 3-5 years timeframe. You might also find some donors to sponsor the initiative, the tricky part would be to find free developer to proceed with such a task.

[07:54](#msg5ef6fb4bd65a3b0292b2416a)@qtxie Thanks for the GC numbers, it surely helps to understand another factor in the overal scope of things ....

hiiamboris

[08:03](#msg5ef6fd54bb149531edd3748d)Also after some recent regression, creation of faces started to allocate a lot, triggering GC a lot, being slowed down by ~25%.

[11:26](#msg5ef72cf26c06cd1bf459a3b1)Turns out it became slow even without GC influence: https://github.com/red/red/issues/4554

[11:27](#msg5ef72d2ebb149531edd3e77c)How's 16 seconds to just create 500 (think 10x50) lightest native faces? ;)

pekr

[11:30](#msg5ef72dbc613d3b33940fc058)Thanks for the ticket and all your insights re the View engine, @hiiamboris

hiiamboris

[11:35](#msg5ef72f18b8152d3484686df6)@qtxie I think we should be able to use GOBs to avoid CreateWindowEx completely with all it's events overhead and stuff. Understandably, such GOBs will be only available inside a container window. Let it be a special `gob-panel` (internally base or rich-text). That's the only way we can get \*fast* faces IMO.

henrikmk

[13:22](#msg5ef747f9c223cc536a3bb21b)It seems to me that natives were added to make a short term UI more usable. I still think natives are not a solution. In the long run, a very simple face model will be very beneficial, because you really get a lot of stuff for free. I know there is a lot of talk about GOBs, but it's very important to do things correctly first, before optimizing. A correct face model could be emulated with DRAW, some clipping and simple region/depth management. Any complexity, such as text editing, become isolated problems that can be solved separately. But the core model remains simple.

hiiamboris

[13:38](#msg5ef74bc1c4bdd834750ba73b)Native UI involves not only short term usability. Think about compliance to OS standards: OS-wide hotkeys, drag&amp;drop, UI settings (like how much lines scroll per one wheel event), locale-specific things - writing direction and IME, user-set accessibility features (like screen reader), respect for user-defined theme (colors, fonts).

qtxie

[13:41](#msg5ef74c71e0e5673398da3810)@hiiamboris Yes. We can put the GOBs in a base face or the window face directly.

hiiamboris

[13:41](#msg5ef74c72a813c72dcf126d2c)Although it's tempting from a developer's perspective (as it's simpler), building own UI is like creating an isolated world in which that program will live. And given the multitude of developers out there, by neglecting the standards, we in the end get just a mess. A bazaar.

toomasv

[13:42](#msg5ef74cd86c06cd1bf459f0b5)Added \[sorting](https://gist.github.com/toomasv/1b008bbff02550cbb821378be73e487f), but 100'000 rows are too heavy for my machine. 20'000 is more or less usable. Sorting eats up memory and recycling after that takes aeons. Pretty sure I am making something wrong here...

hiiamboris

[13:47](#msg5ef74df5a813c72dcf127208)@toomasv Sorts momentarily on W7  
!\[](https://i.gyazo.com/f4adfabeab7870d0159a7ba3097ee919.gif)

[13:47](#msg5ef74e0bb8152d348468b3b5)And no memory consumption.

[13:48](#msg5ef74e1054d7862dc4b0a24a)20th june build

qtxie

[13:49](#msg5ef74e6447fdfd21edeb2252)On Windows native UI is used less and less. The only native UI application I'm using is my editor. Even the UI is very simple, the edit control is a totally custom one. My music software, VPN, Git client are all non-Native UI.

hiiamboris

[13:54](#msg5ef74f796c06cd1bf459f6af)It's true. Nobody cares about what user wants, so everyone's migrating to Electron or other junk.

qtxie

[13:54](#msg5ef74f8c405be935cdc6f237)@toomasv I clicked `Recycle` button after playing it a while. It took 16s to finish the GC. 😅

```
root: 5471/7237, runs: 0, mem: 590854640 => 18663712, mark: 8.4ms, sweep: 16844.3ms
```

hiiamboris

[13:54](#msg5ef74fb2e0e5673398da3eda)Looks like a W10-only bug ;)

toomasv

[13:58](#msg5ef7506b7ba3965373d1285d)@hiiamboris

&gt; Sorts momentarily on W7. And no memory consumption.

Nice! Would you try with 1'000'000 data-points (100'000 rows)?

hiiamboris

[14:00](#msg5ef75104405be935cdc6f653)Takes ~4 seconds to sort this much. But RAM still stable.

toomasv

[14:01](#msg5ef75128613d3b33941018c7)@qtxie Yes, I never waited long enough to see it finish. :)

[14:01](#msg5ef7514a54d7862dc4b0ac97)@hiiamboris I envy you ;)

hiiamboris

[14:02](#msg5ef7515f613d3b339410190d)You can sort just one column using native sort function (not your own), then rearrange the other columns based on the new order.

[14:02](#msg5ef75188a813c72dcf127c0b)Still, there's some W10 bug at play ;)

qtxie

[14:11](#msg5ef7538a3a0d3931fab91920)Just ran it on W7 VM, the same issue as on W10.

[14:13](#msg5ef753fc7ba3965373d12fdf)Maybe 20th june build is better. I used the latest one.

hiiamboris

[14:16](#msg5ef754aae0e5673398da4d39)Maybe another regression.

[14:16](#msg5ef754cdbb149531edd43f05)`Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1` where I tested

[14:25](#msg5ef756cd405be935cdc7054f)Just found out that there's a leak in `to image! face`. No end to their insect kind!

pekr

[14:38](#msg5ef759d6c223cc536a3bddb1)@henrikmk I do agree with @hiiamboris on a system compliant stuff. I do remember many atttempts in trying to be system compliant with R2 at least with the basic styles. I have never seen a proper context menu implementation though for e.g., maybe apart from Oliver's initial one. So apart maybe from buttons, the system compliancy was really missing. With no rich-text, we could not even underline the accelerator keys. We also did not have proper tabbing support, etc. But then - I was a heavy DB and keyboard user.

The thing is, that the world is changing imo. I do remember how nice RT's Gateway computer store app was. Carl was simply ahead of just anyone by cca 7-10 years, again. iPhone changed everything again and we can see a free form gfx more and more. It is just the web stuff got MUCH better witht he typography (see the material design as an example).

MS tried to depreciate Win32 by a Metro/Modern apps, but it did not take off properly. Now they have another attempt with the project Reunion and we will see, how it goes (https://www.theverge.com/2020/5/19/21258697/microsoft-windows-project-reunion-win32-uwp-apps-apis-build). Not sure what is the situation in the world of Apple, but Apple is fully switching to ARM, even with their Pro line. Will they unify iOS and OS-X somehow? Who knows ....

henrikmk

[14:38](#msg5ef759e0bb149531edd44c33)&gt; Although it's tempting from a developer's perspective (as it's simpler), building own UI is like creating an isolated world in which that program will live. And given the multitude of developers out there, by neglecting the standards, we in the end get just a mess. A bazaar.

I don't agree. Maybe there is concern about be that there are some tough problems to solve that the OS might have solved, but you are then relinquishing control of the GUI engine design, and you will be forced to use workarounds to make a lot of things work, like inline editing in tables, and you will lose all the flexibility that made R2/View great and quick to use in the first place.

&gt; And given the multitude of developers out there

So, if you provide a complete UI experience, developers will surely embrace them. The fragmentation that might have been under R2 was due to VID being incomplete, but once you specify the difficult parts, text editing, rich text, focusing policy, key navigation, it will be used. even if it doesn't match completely up with the OS.

[14:41](#msg5ef75a94ec4a341beef18be3)&gt; I have never seen a proper context menu implementation, maybe apart from Oliver's initial one. So apart maybe from buttons, the system compliancy was really missing. With no rich-text, we could not even underline the accelerator keys.

Any of those features are about getting some fundamentals right: You need non-focus-stealing windowing areas and make the right OS calls for that. Then you build a menu system on top of it, and that isn't hard to make look and feel like it's OS native. Rich text, again, getting the fundamentals right. If R2/View supported Rich text in generic form, then anything that required it, would be able to use it without issue, and none of that would be OS native.

pekr

[14:42](#msg5ef75abe7ba3965373d13de4)I start to think, that the cross platform UI using a native widgets is a myth. Might work for buttons, areas, checkboxes, etc., but anything more complex is not awailable in a cross platform manner anyway ....

henrikmk

[14:42](#msg5ef75aeec4bdd834750bcd40)Cyphre built a menu system for RebGUI in R2 for Saphirion, and it's fairly good. It hits the R2/View limits by requiring each menu to be an active window.

hiiamboris

[14:48](#msg5ef75c4fd65a3b0292b3178b)Of course, there's no native table ;) We'll have to find the best mix of native/non-native items to implement it.

[14:51](#msg5ef75cffc223cc536a3be610)But also there are no 2 100% compatible in behavior and look non-native implementations of the same UI element ;) That's the mess we're already in. Even MS spawned so many different incompatible technologies inside Windows that it's just epic ☻

GiuseppeChillemi

[16:51](#msg5ef7791bc4bdd834750c1a71)@henrikmk

[16:51](#msg5ef7792cfa0c9221fc63d42b)Do you have the latest version of Saphirion RebGUI?

greggirwin

[17:06](#msg5ef77ca2b8152d34846924c0)It may not look like it, but I think we're all \*mostly* in agreement.

@pekr :+1: On 4) I distinguish between a GUI interface which, to me, means specific controls used to accomplish a task that might otherwise be done with a textual interface; contrasted with environments like games. I'm all for a compositing pipeline, and I do think R2 hit a sweet spot with its `effect` approach, rather than using separate images for disabled states and such.

@qtxie et al, thanks for weighing in, and for test numbers. :+1:

I love R2, to this day. And VID too. But we all have to admit that it has its issues. I believe most of those were due to conscious design choices, and we could do something like that, sure. But then we will face the same issues it did. If you think selling customers on the original VID look and feel was hard in the early 2000s, try doing it now. So we add skinning, and other things, and it gets slower and more complicated. Eventually, we either solve all the same problems OS GUI systems do, or we impose constraints and accept tradeoffs in ease of use, flexibility, performance, appearance, and features. Then you have to consider expertise and resources.

For my part, and I think this is in line with Carl's original design as well, which Red follows, we have `view` and we have `VID`, but we don't have to have \*only* those. There is no universal UI, so that's not a goal IMO. And who among us can guess what UI trends will be in even 3 years? One disruption, one company with a hot product, one new web framework, and the winds will change.

I absolutely love that @hiiamboris' experimental reactivity work is sooooo much faster than what we have now. But I'm also totally OK with what we have now. It's small, elegant, and naturally imperfect. With it, I built some cool little apps of my own. It worked great there. Why I want to see Boris' work reviewed and considered is not for scalability, but for a better, smoother user experience for the average app.

Rich Harris(?), the Svelte guy, has a video where he shows a "lag meter" while working in a UI, which I thought was one of the best UI tools I had ever seen. We should have one.

As always, let's not solve problems we don't have. We \*must* look ahead, based on our past experiences, of course. So let's start with lists, tables, and grids. As we work on those, we'll \*find* the slow and problematic bits, as Boris and Toomas have shown with all their experiments and tests.

Performance limits will force us to be creative and conservative, which is fantastic (if painful at times), but if we generalize too much, then find that our list/grid work was good enough, we won't have wasted time and effort optimizing things that didn't need it.

Who's going to start that wiki page with other GUI systems and do some let work on the average number of controls per screen?

GiuseppeChillemi

[17:38](#msg5ef78402fa0c9221fc63f323)Using the target system native GUI elements with the option to render custom Red controls where needed should be the way to go! It is good (in available resources perspective) to use others' work until we are big enough to recreate them.  
Also, a question always popped up in my mind: is it more time consuming to code a your own widgets on a custom library like AGG and then let it render and process input on all platforms, or it is more tie comsuming and bug prone to create the bindings and all you need to use native platform elements for many targets? Which one does scale better? Here are some to best Redbol GUI experts and I would like to have their experience and opinions.

henrikmk

[19:01](#msg5ef797a3c223cc536a3c7529)@GiuseppeChillemi I don't have permission to share it, sorry.

[19:06](#msg5ef798cfc223cc536a3c770a)&gt; I love R2, to this day. And VID too. But we all have to admit that it has its issues. I believe most of those were due to conscious design choices, and we could do something like that, sure. But then we will face the same issues it did.

I always felt that we know R2/View and VID best and know exactly what problems they have, so it shouldn't be a big problem to simply clone View and rewrite VID. Plainly use those parts as specs. Many issues are tied to the C parts of View or to AGG, and would be quite solvable problems.

GiuseppeChillemi

[20:10](#msg5ef7a79b6c06cd1bf45acdb9)@henrikmk Ok, I have supposed it was open source.

greggirwin

[20:11](#msg5ef7a80547fdfd21edebf631)@theSherwood I missed your message because...no avatar. :^)

It calls C now. The OS provides APIs for all this. Beyond that, you're rolling your own from `bitblt`, `invalidate-rectangle`, Z-ordering your own scene graphs, and raw event handling. The catch is that it's not pure C for any OS, it's their APIs. You can never be more efficient than that when going native.

[20:13](#msg5ef7a857bb149531edd5080e)QNX had a very lightweight system called Photon, which handled only the lowest levels of stuff for you, and you had to do the rest. When we build our own system, I think that's a good model, because it minimizes the OS interface for the higher level aspects.

## Sunday 28th June, 2020

theSherwood

[02:43](#msg5ef803b9fa0c9221fc64fca3)Interesting. So the OS supplies something like hooks for a widgets or a toolkit for widgets, and the alternative to that is using shaders and your own event system to fake it all?

toomasv

[04:56](#msg5ef823116c06cd1bf45bc67b)Added \[editing](https://gist.github.com/toomasv/1b008bbff02550cbb821378be73e487f) (on mouse down). BTW, 20th June build works the same on W10 (i.e. eating memory and loooong recycling).

hiiamboris

[07:24](#msg5ef8459ebb149531edd65389)@toomasv what commit?

toomasv

[07:25](#msg5ef845d4613d3b3394123a3a)

```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```

hiiamboris

[07:26](#msg5ef8461bc4bdd834750dc53a)Interesting.

toomasv

[07:27](#msg5ef8464c3a0d3931fabb244d)Yeah, same as yours.

hiiamboris

[07:27](#msg5ef84650c4bdd834750dc5fe)I however can confirm infinitely long recycle on 27th June build. Will see if I can find the regression.

pekr

[07:27](#msg5ef8465c3a0d3931fabb2532)How do you get the commit id?

toomasv

[07:27](#msg5ef8466bfa0c9221fc658a50)`about`

pekr

[07:27](#msg5ef8467954d7862dc4b2bdc4)it does not show here such info

hiiamboris

[07:28](#msg5ef846827ba3965373d32811)@pekr it's only in the factory builds, not when built from sources

pekr

[07:28](#msg5ef8469247fdfd21eded3396)ah, that has to be the reason then ....

hiiamboris

[10:35](#msg5ef8725a405be935cdc961ec)@toomasv @qtxie I have found a solution for memory growth in the draw-based table, but you will hate me for this ☻

[10:35](#msg5ef87282c223cc536a3e3905)You have to input `1 % 2 - 3` in the console before executing \[the script](https://gist.githubusercontent.com/toomasv/1b008bbff02550cbb821378be73e487f/raw/f80863f8e8aab43b25abe16e736709d44aec50aa/draw-table.red).

toomasv

[10:41](#msg5ef873c0ec4a341beef3e55b)@hiiamboris :) Nothing changes here.

hiiamboris

[10:41](#msg5ef873d054d7862dc4b32034);)

[10:41](#msg5ef873e1bb149531edd6b387)I thought the spell might fizzle ;)

[10:41](#msg5ef873ecec4a341beef3e5a1)Works for me on different builds though

[10:43](#msg5ef874353a0d3931fabb83ac)

```
Red []
1 % 2 - 3
do https://gist.githubusercontent.com/toomasv/1b008bbff02550cbb821378be73e487f/raw/f80863f8e8aab43b25abe16e736709d44aec50aa/draw-table.red
quit
```

Full script I'm using

[10:44](#msg5ef8749d7ba3965373d386c0)May builds don't have the issue, only those of June.

[10:47](#msg5ef8752ce0e5673398dcbf40)I wonder if it depends on spellpower or available mana...

toomasv

[11:19](#msg5ef87cb1a813c72dcf15028d)Wow. Indeed, e.g. May 29 build works fine!!

hiiamboris

[11:20](#msg5ef87d0cd65a3b0292b57fd6)I tracked it to the sort function.. If I have operators inside the sort functions, e.g. `1 - 1`, each such operator consumes some memory ;)

toomasv

[11:23](#msg5ef87dc954d7862dc4b335c3)But how was it stable earlier?

hiiamboris

[11:25](#msg5ef87e297ba3965373d3993b)I suspect it's a remnant of https://github.com/red/red/issues/4505

[11:28](#msg5ef87ed83a0d3931fabb9cbd)What are there other cases where Red function is provided to an R/S native?

[11:28](#msg5ef87ef2b8152d34846b390e)`parse/trace` comes to mind.

toomasv

[11:29](#msg5ef87f0954d7862dc4b337eb)I see. Thanks! Even 100'000 rows is sorted easily now with older builds :)

hiiamboris

[11:29](#msg5ef87f12405be935cdc97a98):+1:

toomasv

[11:30](#msg5ef87f4f613d3b339412b3a4)(And no need for your magic spell!)

pekr

[12:31](#msg5ef88d91fa0c9221fc661f39)Complicated - so is there going to be a fix and a speedup, or just a workaround? :-p

hiiamboris

[12:32](#msg5ef88dde3a0d3931fabbbda5)Let's keep the hope up ;)

[13:12](#msg5ef8973da813c72dcf153d37)OK I reported it, again ;)

[20:43](#msg5ef900fec4bdd834750f7504)Rejoice ;) It should be fixed now

greggirwin

[21:59](#msg5ef912cf6c06cd1bf45de16a)@theSherwood yes, except shaders really have nothing to do with it. you use \[CreateWindow](https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-createwindowexa) to create each "face", then have a winproc to handle messages it receives. Just learn everything \[here](https://docs.microsoft.com/en-us/windows/win32/api/\_winmsg/) and in the pages it links to. That's all there is to it. Well, that's not entirely true, because everything doesn't work as documented, and has changed over many versions of Windows. For Mac, there was old MacOS, then Carbon, then Cocoa. Maybe something new coming now, with their ARM effort.

Shaders and UI models in an interesting topic, because you'd \*think* it makes sense. We have all this GPU power now, but our UIs are 2D and...well, let's not start in on 3D UIs. It's been tried, and some systems will use VR/AR effectively, but a lot of the world is fine when thought of as flat. Just like the real world. :^) Flat UIs are just another cycle, but they were studied and shown to be more efficient on mobile. Too bad they're harder on users.

[22:05](#msg5ef91446405be935cdcacfa9)An interesting bit of history. We have high-res displays now, and raster assets are more painful with a zillion resolutions to support. When NeXT and NeXTStep came out, they used Display PostScript, which I thought was just the coolest thing ever when I learned about it. Mainly, I was blown away the first time I saw it in action, where text flowed around images in documents (WordPerfect then), and looked exactly the same when printed on a PostScript printer.

## Monday 29th June, 2020

theSherwood

[00:12](#msg5ef931da3a0d3931fabd3cf5)@greggirwin Thanks for the resources! Lots to look into!

henrikmk

[09:01](#msg5ef9adf8a813c72dcf17bb2a)Is there a STYLIZE equivalent for Red/View?

rebolek

[09:06](#msg5ef9aefae0e5673398df881c)I wrote STYLIZE, but it wasn't merged yet and probably needs to updated for latest versions.

[09:06](#msg5ef9af1e47fdfd21edf064f6)I plan to get back to it, but it's not high priority right now.

henrikmk

[09:07](#msg5ef9af676c06cd1bf45f32d0)So, there's no "correct" way to add a new style?

rebolek

[09:12](#msg5ef9b07e47fdfd21edf068ff)Right now no. I am writing my custom styles with `[my-style: style ...]` so they can be inserted at the beginning of any `layout` block. Others may prefer different way. But eventually `stylize` will find it's way into Red.

henrikmk

[09:14](#msg5ef9b0e77ba3965373d64eef)I see, ok. I was looking for the exact syntax for the STYLE keyword, but the keyword isn't functioning for me.

rebolek

[09:22](#msg5ef9b2c7bb149531edd9968c)Isn't working? Can I see the code you are trying?

[09:30](#msg5ef9b4ae405be935cdcc26ae)I got the syntax wrong, sorry, it's `[style my-style: ...]`

henrikmk

[09:31](#msg5ef9b505d65a3b0292b82f5f)I see, thanks, that works.

pekr

[09:37](#msg5ef9b650a813c72dcf17cd3d)@greggirwin The CreateWindows face related stuff - is that the same for R3, or just Red, because we need it to link to native widgets? Just curious ....

hiiamboris

[09:57](#msg5ef9bb1b405be935cdcc34cb)@henrikmk I'm using View for styles: `extend system/view/VID/styles [my-style: [template: [...]]]`. That is, when I need them globally available.

nedzadarek

[10:13](#msg5ef9beae47fdfd21edf08cc0)@hiiamboris @rebolek could you write working examples in the wiki? I mean how do you save state (e.g. extending extra), read/output that state etc.

hiiamboris

[10:18](#msg5ef9bff9e0e5673398dface9)I'm not using `extra` at all. Let it be reserved for the user and I can do with my own fields.  
Examples see \[here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/scrollpanel.red#L161) and \[here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/table.red#L336) and \[here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/table.red#L438) and \[here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/table.red#L756)  
\[And these are the smallest examples](https://github.com/red/red/blob/master/tests/source/view/base-self-test.red#L69)

rebolek

[10:18](#msg5ef9c009bb149531edd9b439)My `extra` is usually an `object!` so I have plenty of space for custom stuff.

henrikmk

[10:24](#msg5ef9c150613d3b339415804f)@hiiamboris seems that might be a decent version of STYLIZE?

hiiamboris

[10:28](#msg5ef9c24d6c06cd1bf45f5c14)I guess `stylize` should use VID, to be concise.

[10:29](#msg5ef9c288c4bdd83475110f6c)Plus, I guess the idea is to have named \*sets of styles\*, and be able to mix them in when needed.

rebolek

[12:00](#msg5ef9d7ebe0e5673398dfec81)yes, that's how it works

planetsizecpu

[12:57](#msg5ef9e52bec4a341beef735c5)Just testing last updates I did on core i5, seems to work a lot faster than my usual old machine, one have to keep an eye on kart trajectory to not be run over haha.

hiiamboris

[12:57](#msg5ef9e53fc4bdd83475116cf2):D

planetsizecpu

[12:57](#msg5ef9e54cc223cc536a417e1e)\[!\[cavetest121.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/1mDf/thumb/cavetest121.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/1mDf/cavetest121.gif)

wallysilva

[17:24](#msg5efa23c4a813c72dcf190c88)It looks really cool!

GalenIvanov

[17:54](#msg5efa2ad73a0d3931fabfb0f9)@planetsizecpu Cool, looks much faster!

planetsizecpu

[18:37](#msg5efa34cec223cc536a42714f)Thx all guys!

greggirwin

[19:09](#msg5efa3c4e405be935cdcd954e)@planetsizecpu :^) Always fun to watch it run.

[19:21](#msg5efa3f3aec4a341beef842a2)@pekr the OS APIs are only for native widgets. Of course, you always need a main window. Beyond that, I believe Atronix carried the R2 model forward, with AGG.

[19:23](#msg5efa3f99fa0c9221fc6a34ab)&gt; the idea is to have named sets of styles, and be able to mix them in when needed.

Yes.

## Tuesday 30th June, 2020

greggirwin

[02:30](#msg5efaa3a9fa0c9221fc6b2025)I'll add another quick note on the different GUI approaches, based on different domains and needs.

A line of business app is an almost entirely static UI. I say almost, but many are completely static. If nothing changes, you don't need to redraw anything. A game, OTOH, has a timer triggering scene redraws, with FPS goals and hard and soft real-time constraints. A hardware interface is more like a game. Imagine a piece of monitoring equipment in a hospital. An e-reader, or something e-ink based only changes when the content changes, is \*really* static (and slow to refresh).

None of these systems have exactly the same requirements. Run flat out for max FPS, when your content is static, and there goes your mobile battery life. Sadly, we can't yet say "Let the OS deal with all that and do the optimal thing for my app based on a header field like "type: puzzle-game.".

What we can do, while imperfect, is think in domains, because that's where we live. This is hard design work, because having different GUI systems with completely different APIs will drive us all mad. But if we can identify the key domains, and figure out how to make them all feel compatible, you need never know that `basic-grid` uses OS windows, and is heavy and slow, while `gridtastic` does more than you can imagine, faster than you can think. All you know is their API and documented constraints.

henrikmk

[09:10](#msg5efb018bfa0c9221fc6bfc95)&gt; None of these systems have exactly the same requirements.

There are likely similar root requirements, like needing to open a window or accepting keyboard and mouse events. If you create a minimum core system for generating bitmap graphics, sound and reacting to it with input events, then you can build your way towards specific domains, as branches of a tree. For example, 2D widget region management or form submission management is useless in a first person shooter, and Z-buffering, PBR shaders and collision detection are useless in a 2D GUI program.

The cases, where you mix, like 3D game level editors, you allow the domains to interplay without specifically crossing over. The 2D GUI domain can assign a face as a viewport for 3D work that is managed with the other domain. The 3D viewport can accept a 2D GUI that is rendered as a texture (not very common though). In common, each interact with data controllers that let you fill the 3D area with objects and the 2D parts with information, and the 3D area can affect the 2D information and vice versa.

There has to be specific domains that are optimized for each kind of task, and IMHO, the 3D domain is way, way more complex than the 2D one, which is why modern game engines are very large pieces of software.

It's important also to not conflate high and low-level design problems, like whether a developer making a spreadsheet should care about screen update frequencies. If the API is designed correctly, such things will solve themselves at the appropriate level.

DideC

[09:34](#msg5efb072dd65a3b0292bb73b5)`layout` is a DSL. So we can imagine having one that plug to current 'view engine (static UI ?) and a `layout-whatever` that plug to another engine (ie: game one). The DSL would have to be common for the most part, with specific command for the specific part. Then you can also imagine a `layout-html` that just build html/javascript code to interface your Red program with the browser display in a client/server mode (think X server).  
The work that has already been done to found the common parts between different OS GUI (Windows, Mac, GTK, Android...) already show what have to be build for each engine. The root requirements.

GaryMiller

[10:46](#msg5efb181c7ba3965373d9ec18)@greggirwin  
I would say that businesses are getting away from static UIs also. They've always had the need to hide or disable certain controls based on business rules.

Then Tab controls entered the scene due to limited screen real estate.

And today we see a lot of dynamic grids based on what columns are stored in the database and can vary from day to day without requiring code changes.

Different subforms can appear under the same parent form representing a parent table in the database.

Your point is still well taken though that they generally are much less dynamic than games.

And the only place I have seen 3D used in business, is for display of business graphs where one axis is usually time.

And the only place in business I have seen textures used in on the shading of bar charts where regular colors are too close to distinguish given the number of bars.

I agree that it is a cleaner and more efficient design not too intermix GameDev functionality with Business GUI functionality but there is a bit of overlap.

And that it not to say that some of their functionality could not be based on the same low-level graphic primitives for efficiency so long as the code sharing does not detract from their performance.

greggirwin

[18:35](#msg5efb85dac223cc536a45f7bf)Good input. Thanks all.

GiuseppeChillemi

[21:25](#msg5efbadcb613d3b33941ab052)GUIs are built on abstracted and generic parts to have a common set of characteristics and different specializations for different contexts.

## Friday 3th July, 2020

vazub

[20:09](#msg5eff9076fa0c9221fc786c4a)The latest build for the GTK branch seems to be broken after camera device introduction - `http://static.red-lang.org/dl/branch/GTK/linux/`

```
Compiling compression library...
Compiling Red console...
*** Loading Error: file access error: %camera.reds 
*** in file: %/root/macHome/modules/view/backends/gtk3/text-list.reds 
*** at line: 28
```

hiiamboris

[20:10](#msg5eff90b5c223cc536a510cd2)@bitbegin ^

## Saturday 4th July, 2020

bitbegin

[03:16](#msg5efff478ec4a341bee074d3a)@hiiamboris fixed

vazub

[13:05](#msg5f007eb4ec4a341bee088cb5)confirmed. thanks!

## Wednesday 8th July, 2020

rebolek

[07:59](#msg5f057cd7a9378637e8b4cdd8)some inspiration for Vid console https://withfig.com/

hiiamboris

[08:43](#msg5f058727c7d15f7d0f7b4b3d)&gt; The terminal is the fastest ways of interfacing with a computer.

...

[08:49](#msg5f0588ad7455046699e59e89)&gt; fig.reposition("3")

Window position determined by a magic number, passed as a string.

[08:53](#msg5f05897f8b72655b555ab3e9)So, the main page didn't tell me the answer to the only question I've had: "what does this thing do?". And was designed for a mobile obviously, not for a PC (who the hell reads dev docs on mobile?). Docs are not clear on that too but after connecting the dots I think that this is a JS wrapper to unix shells, with an embedded search window (unsure what it actually does). @rebolek am I right?

rebolek

[09:20](#msg5f058fdfbd3edf666fb7daf9)@hiiamboris As I understand it, it's a collection of GUI wrappers for CLI functions (like `curl` shown in the video), so instead of using \*the fastest way of interfacing with a computer\*, you need to grab your mouse and use the slowest way. And it's written in Electron, of course.  
Anyway, it looks nice and VID can do things like this in 1/100 size, so it's probably a good showcase ( @toomasv has some similar tools for console).

hiiamboris

[09:28](#msg5f0591db3c217837fd85199a)@rebolek I see, thanks. So there's also a video on that page that my browser doesn't show. Let's see... ;)

rebolek

[09:32](#msg5f0592b0f6b74162841e2ef1)Ah, you haven't seen the video :) The rest of the page total marketing gibberish, but the video is what I meant as an inspiration.

[09:32](#msg5f0592c27455046699e5bb04)https://withfig.com/video/final.mp4

hiiamboris

[09:35](#msg5f0593573e4a827d19b03b30)Unfortunately, Palemoon, Waterfox and Firefox won't show me any video. Only a couple empty zsh windows. And your link leads to !\[](https://i.gyazo.com/b8a711741486d68e9251e23c55858f1d.png)

rebolek

[09:36](#msg5f0593a9a5ab931e4f718f01)Interesting, I'm viewing the video on Firefox.

hiiamboris

[09:37](#msg5f0593e28342f46274ffce0f)Okay, I used `wget` in the fastest way of interfacing. Thanks ;)

rebolek

[09:37](#msg5f0593f17455046699e5be8e):D

[09:38](#msg5f059410a9378637e8b515ba)Not only fastest, but also the most useful :)

hiiamboris

[09:39](#msg5f05945ef6b74162841e3486)Interesting how they were able to modify the shell command right on the webpage before running it.

toomasv

[11:42](#msg5f05b1348342f46274003974)@rebolek Nice thingy!

planetsizecpu

[14:33](#msg5f05d9256e1b8050c3df43f0)Sometimes you find yourself with difficult decisions to make. In the lava levels you can lose items when they fall, so what to do? I have decided that by not being able to complete the level you have to restart :^)

[14:33](#msg5f05d93a64ef9d04b29d9c0c)\[!\[cavetest180.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/iDTZ/thumb/cavetest180.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/iDTZ/cavetest180.gif)

[14:37](#msg5f05da0da5ab931e4f729c5d)@rebolek interesting

hiiamboris

[15:12](#msg5f05e2798342f4627400face)nice steam generator ;)

greggirwin

[21:06](#msg5f06354046c75b1e5e31a2e6)@planetsizecpu :^)

[21:32](#msg5f063b74a5ab931e4f73c216)On Fig, the first thing I noticed is that the fake terminal in the page wiggles with my mouse, but not in a controlled way. ...why? But OK. This is an interrogative interface of sorts, and I've proposed that as a good thing. Can anybody else actually follow what is being done in that video? This, that, here, there, output, inputs. Where am I supposed to look? `ncurses`, shells, and "The terminal is the fastest ways of interfacing with a computer." Really? No caveats?

This aligns with chit-chat, where @baronRK noted \[this](https://gitter.im/red/chit-chat?at=5f06303e86ccb45b5993077d), which I will extrapolate to "Focus on the big problems and pain points."

We have extremes, where much time is spent on detailed spacing, squircle radii, colors, and such, all while we suffer not being able to type data in without doing it exactly how the regex author made us do it, because they gave up trying to get it right. It's a hard problem, to be sure, with no single best answer. But we should be able to do better. So, yes, I will press for masked fields and more than one way to handle it, per Postel's Law.

Back to shells, and even old-school editors like vim and emacs; even prog langs. :^) I'm as guilty as any dev of inertia ruling my life, finding a setup that works for me, and not giving new ideas their due. I solve most of my problems with Red(bol), old apps I've used for years, and new things as necessary or where I want to see us all go in the future.

My first Fig question, maybe my only one depending on the answer, is "Does it remember what I did?" Because I don't know about you, but I repeat myself a lot. Shells let me up-arrow and run a command again, and Red nicely remembers history across sessions, but what did I do yesterday when I worked on `X`? I was just in %/d/red/parse/ tinkering and forgot to copy things out into a script; damn! It was just a few lines I cared about. If only I could have marked and tagged them somehow. And why isn't my whole session auto-saved, at least for a while?

I don't mean to demean Fig. But if someone is punching you in the face, is it enough to say "Hey, put this boxing glove on, but go ahead and keep hitting me."

[21:34](#msg5f063c00f6b7416284206201)&gt; Fig's API allows you to run shell commands from simple javascript. Build wrappers around CLIs, custom workflows, or configurations.

Correct me if I'm wrong, but isn't this "scripting"?

[21:44](#msg5f063e3c3e4a827d19b267b0)&gt; build terminal apps with modern web technologies

This is like a logical inconsistency in a movie that destroys my ability to suspend disbelief.

They say they spent a lot of time on their API, and the string-numbers (are they nummings or strimbers?) for window positions are evidence, along with function names like `fread/fwrite`. I'm fwritened indeed.

Forgive my sarcasm. They're trying to do a good thing, and I applaud and respect that. I just don't think we should emulate Fig in any way.

&lt;/rant&gt;

hiiamboris

[21:47](#msg5f063f0df6b7416284206cc1)They triggered about the same inner response in me ;)

greggirwin

[21:48](#msg5f063f2da5ab931e4f73cd26)You have more self control than I do at the moment. :^)

hiiamboris

[21:51](#msg5f063fc96e1b8050c3e07727)I guess we're just not their target audience of believers ;)

greggirwin

[21:51](#msg5f063fee6e1b8050c3e07754)P. T. Barnum would have loved developers.

hiiamboris

[21:52](#msg5f06402b6e1b8050c3e07809):D

## Friday 10th July, 2020

JacobGood1

[04:05](#msg5f07e8ee46c75b1e5e3645a9)maybe you will find this more inspirational: https://blog.feenk.com/glamorous-toolkit-and-pharo-5aufgcequ38az2s0dj0t1nu0f/

greggirwin

[04:33](#msg5f07ef8264ef9d04b2a37591)Clearly a lot of work has gone into that. Thanks for the link @JacobGood1.

JacobGood1

[04:34](#msg5f07efe9a9378637e8bbd8ac)just interjecting myself randomly like I usually do

greggirwin

[04:39](#msg5f07f0fbdbf01050ab65ce58):^)

## Wednesday 15th July, 2020

planetsizecpu

[14:56](#msg5f0f19259c75aa256b40e3f3)Today's commit included guards stop&amp;go on elevators, a long awaited feature, I had to make little adjustments on some cave scenarios to adapt well to his new behavior.

[14:57](#msg5f0f1964ff29b7773203ade2)\[!\[cavetest190.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/z9nO/thumb/cavetest190.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/z9nO/cavetest190.gif)

TimeSlip

[15:58](#msg5f0f279126b226497221366d)@planetsizecpu Great. How many levels are there now?

planetsizecpu

[17:51](#msg5f0f421149fe21279498bb58)Thx! There are 13 levels by now

greggirwin

[21:18](#msg5f0f72959c75aa256b41ff24):+1: :^)

## Thursday 16th July, 2020

TimeSlip

[01:40](#msg5f0fb01849fe21279499f56f)@planetsizecpu I've been watching you from when you first began and your project is really a great way to learn Red. Thanks for sharing. Bien hecho.

planetsizecpu

[06:10](#msg5f0fef4549fe2127949a8cd0)Thx for your support, it would be great if someone enjoys playing, let's give time to the team to arrange sound support, after 38 years I still remember the game melody and some action sounds, I will have to write the partiture also!

[08:42](#msg5f10131154d58c013a470df6)This cartoon was on the machine side panels, so fun if you look well at it

[08:43](#msg5f10131b9c75aa256b4393ac)\[!\[bgm-l1600.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/NAQ5/thumb/bgm-l1600.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/NAQ5/bgm-l1600.png)

GalenIvanov

[08:43](#msg5f101341f253d22569db7a03)@planetsizecpu :thumbsup:

## Sunday 19th July, 2020

BeardPower

[04:50](#msg5f13d115f8b05b39f954c54f)Is this some bug?  
size-text reports 24x18 but I measure 37x20!

[04:50](#msg5f13d129fd3832489b1a898e)\[!\[grafik.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/vDqA/thumb/grafik.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/vDqA/grafik.png)

[04:52](#msg5f13d19e4a9e2578a0a9d85d)This is the text and font spec:

```
text: "0%"
font: [
    name: "Open Sans"
    size: -24
    style: 'regular
    color: 203.204.211
]
```

pekr

[06:43](#msg5f13eb8ff8b05b39f9550061)Do you use some OS level scaling?

hiiamboris

[09:14](#msg5f140ee0564e6b39f5671550)Apparently he uses 150% scaling.

[09:14](#msg5f140f024a9e2578a0aa6213)And is not aware that all coordinates in Red are scaled by DPI ;)

[09:16](#msg5f140f578e9a3a6ef09fb0df)@BeardPower https://github.com/red/red/issues/3336#issuecomment-443427188

BeardPower

[12:34](#msg5f143de718ddba6ef5e34772)@pekr @hiiamboris No, I'm not using OS level scaling. I'm just on 2k resolution, 100% scaling. I thought it was some scaling, but why is it scaling down?

[12:35](#msg5f143e21775d59377c0168a1)\[!\[grafik.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/tM2h/thumb/grafik.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/tM2h/grafik.png)

[12:37](#msg5f143e8c00ae3b3d99fd618e)

```
>> probe system/view/metrics/dpi
96
== 96
```

[12:37](#msg5f143ea200ae3b3d99fd61bd)It seems that the size-text is using 72dpi and not the setting in metrics.

hiiamboris

[12:38](#msg5f143ea9f8b05b39f955bc58)Aha. Interesting.

[12:38](#msg5f143eb88e9a3a6ef0a01db2)Can you measure a long string?

[12:38](#msg5f143ebd64b6213da14998f8)Like 10+ chars?

[12:38](#msg5f143ee2a28d973192e477db)GDI+'s MeasureText measures text with face's inner paddings, so I wonder if that's what you're getting.

BeardPower

[12:39](#msg5f143eec724012319bb74889)

```
>> 72.0 / 96.0 * 37x20
== 27x15
```

The numbers kind of match up.

Hold on, will do.

[12:39](#msg5f143f1e4a9e2578a0aacf66)Yes, the returned size is adding the invisivle pixels of the font chars instead of only the visible texture.

[12:42](#msg5f143fcd4a9e2578a0aad161)returned size is 71x18  
measured size is 147x20

[12:42](#msg5f143fd05ed1d537746d6ac8)\[!\[grafik.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/97T9/thumb/grafik.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/97T9/grafik.png)

hiiamboris

[12:43](#msg5f143ff6f8b05b39f955bf38)Do you draw this text on a `base` or where?

BeardPower

[12:44](#msg5f14401c18ddba6ef5e34c88)Yes, on base.

hiiamboris

[12:44](#msg5f144025f8b05b39f955bfac)And what OS?

BeardPower

[12:44](#msg5f144041724012319bb74bc9)

```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 2082 date: 26-Jun-2020/3:00:58 commit: #21e6d37bb4ae37600fb88efd25a9cc80daab2be9 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 18363 ]
--------------------------------------------
```

hiiamboris

[12:44](#msg5f1440474a9e2578a0aad235)I see.

BeardPower

[12:45](#msg5f14405e724012319bb74c0f)It's not the dpi difference either.

[12:45](#msg5f1440765ed1d537746d6c46)

```
>> 71 / 147
== 0.4829931972789116
>> 18 / 20
== 0.9
```

hiiamboris

[12:46](#msg5f144094724012319bb74c5e)Vertical size you won't know until you measure 10+ lines.

BeardPower

[12:46](#msg5f1440ae8e9a3a6ef0a021a3)Why is that?

hiiamboris

[12:46](#msg5f1440b2fd3832489b1b7c57)But it looks like it uses 200% scaling in Red.

BeardPower

[12:46](#msg5f1440be00ae3b3d99fd66b9)Doesn't it measure the texture?

hiiamboris

[12:47](#msg5f1440c9564e6b39f5678a94)&gt; Why is that?

because you don't know how many empty pixels does the size include

[12:47](#msg5f1440e200ae3b3d99fd670c)it should include the biggest letters you can possibly draw in that font

[12:48](#msg5f1441018a9a0a08cbaa335b)like see examples here https://github.com/red/red/issues/1875#issuecomment-216699648

BeardPower

[12:48](#msg5f144118fd3832489b1b7d73)Yes, it's measuring based on the font specs. I did some test with a self-made font, which consisted of filled blocks.

hiiamboris

[12:49](#msg5f14414d564e6b39f5678c7f)like █? ;)

BeardPower

[12:49](#msg5f14415f82ccdc78add2dc4f)So currently there is no way of getting the real output size (visible text)?

[12:50](#msg5f14417e5ed1d537746d6ed6)Yes, I edited the font I wanted to measure and drew bounding-boxes around each char.

hiiamboris

[12:50](#msg5f14417e564e6b39f5678d8d)yes, but in your case I presume also a bug

BeardPower

[12:50](#msg5f144190a28d973192e47e52)The screenshot is somewhere in this room.

[12:51](#msg5f1441b718ddba6ef5e35050)Yes, the measured size is really not following any logic which could be explained by the DPI or scaling.

hiiamboris

[12:51](#msg5f1441d664b6213da149a096)it should be: size-text * dpi / 96 = size-in-pixels

[12:51](#msg5f1441e418ddba6ef5e350ee)plus minus some padding &amp; rounding error

BeardPower

[12:52](#msg5f1441f4fd3832489b1b80b1)And the DPI is fetched from?

hiiamboris

[12:52](#msg5f1441f4564e6b39f5678e77)if your dpi is 96, that's a bug

BeardPower

[12:52](#msg5f1442028a9a0a08cbaa3637)system/view/metrics/dpi?

hiiamboris

[12:52](#msg5f144206724012319bb74ef6)yes

[12:54](#msg5f14427600ae3b3d99fd6bd7)https://github.com/red/red/blob/master/modules/view/backends/windows/gui.reds#L748 is the source of that

[12:55](#msg5f1442b28a9a0a08cbaa37ac)but dpi itself seems correct as 96 corresponds to 100% scaling

BeardPower

[12:55](#msg5f1442cab2dad248b6c6bf71)Yes.

[12:56](#msg5f1442f0a28d973192e48175)I have 100% scaling and 96dpi as shown in system/view/metrics/dpi.

hiiamboris

[12:56](#msg5f14430b64b6213da149a356)If you change scaling to 200%, does it draw 400% scaled text on bases?

[12:57](#msg5f144330775d59377c0174b2)294x40 something?

[12:58](#msg5f144379775d59377c0175f9)I also wonder if some other driver/program can zoom the actual windows without affecting the system dpi setting?

BeardPower

[12:58](#msg5f14438af8b05b39f955c913)Let me see.

[13:04](#msg5f1444daf8b05b39f955cd2a)No, it still shows 71x18.

[13:05](#msg5f1444fff8b05b39f955cd79)It draws it bigger but the returned size is still the same.

hiiamboris

[13:05](#msg5f1445054a9e2578a0aadcf7)It should be so

BeardPower

[13:05](#msg5f14451064b6213da149a78b)Despite the dpi being 144 (150%).

hiiamboris

[13:05](#msg5f144523f8b05b39f955cdc0)so the scaling is working, but some other factor scales it independently of Red it seems?

BeardPower

[13:06](#msg5f144541a874ff08d2863469)Yes.

[13:08](#msg5f1445b5fd3832489b1b8993)The measured size is 295x41

hiiamboris

[13:09](#msg5f14461aa28d973192e489f3)great :)

BeardPower

[13:09](#msg5f144620f8b05b39f955d059)200% measured:

```
>> 172 / 295
== 0.5830508474576271
>> 295 / 172
== 1.715116279069767
>> 41 / 23
== 1.782608695652174
```

[13:10](#msg5f14462f00ae3b3d99fd74d3)It's only 78% but I only measured the visible pixels.

hiiamboris

[13:10](#msg5f14463a8a9a0a08cbaa4072)but that's with dpi = 144 you say? not 192?

BeardPower

[13:10](#msg5f14464d00ae3b3d99fd74f4)That current measurement was with 200%

hiiamboris

[13:10](#msg5f144653724012319bb759f8)i see

[13:11](#msg5f14466ff8b05b39f955d0f7)so for some reason you got 400% scaling: 295 / reported 71

BeardPower

[13:11](#msg5f144675775d59377c017e03)So measuring the bounding box would be 200%.

[13:11](#msg5f14468264b6213da149ad2b)Yes,

hiiamboris

[13:12](#msg5f1446b264b6213da149ad5c)must something you installed

BeardPower

[13:12](#msg5f1446c5a874ff08d286392e)But only 200% in height.

hiiamboris

[13:12](#msg5f1446d900ae3b3d99fd76c4)measure 10 lines to be sure

BeardPower

[13:12](#msg5f1446dbf8b05b39f955d29a)You don't have the same issue?

hiiamboris

[13:13](#msg5f1446e818ddba6ef5e360f2)no I never heard of anyone having this issue

BeardPower

[13:13](#msg5f144713fd3832489b1b8d59)I guess I have to bring up my block font haha

hiiamboris

[13:14](#msg5f14473000ae3b3d99fd77bf)or use Alt+219 symbol

BeardPower

[13:19](#msg5f1448765ed1d537746d828e)Well, I cannot generate those chars despiting holding the alt key.

[13:23](#msg5f14493cfd3832489b1b933d)I did it with copy&amp;paste. 10 chars of that:  
size-text: 101x18  
measured: 191x33

[13:23](#msg5f14496664b6213da149b4bc)

```
>> 191 / 101
== 1.891089108910891
>> 33 / 18
== 1.833333333333333
```

[13:25](#msg5f1449aefd3832489b1b9497)So what is the issue here?

hiiamboris

[13:26](#msg5f144a074a9e2578a0aaeb21)Hm. This is your font, right?

[13:26](#msg5f144a14b2dad248b6c6d654)Can you test with other fonts?

[13:27](#msg5f144a30564e6b39f567a3ad)Could be a glitch in Open Sans.

[13:27](#msg5f144a5ea874ff08d2864362)And `191 / 101` with 200% scaling or 100%?

BeardPower

[13:31](#msg5f144b305ed1d537746d8b37) No, only the blocked one was. It's with every font.

[13:33](#msg5f144bc0a874ff08d2864854)Arial: 101x18 vs. 192x35

hiiamboris

[13:34](#msg5f144bf28a9a0a08cbaa4f3a)With what scaling?

BeardPower

[13:35](#msg5f144c1400ae3b3d99fd85c0)200%: 101x18 vs. 381x70

[13:35](#msg5f144c21775d59377c018e8a)The first was 100% scaling.

hiiamboris

[13:36](#msg5f144c4d64b6213da149bc14)So it's not Red, not a font, then must be some driver or smth

BeardPower

[13:36](#msg5f144c5764b6213da149bc2a)So yes, it's doubling the scaling factor.

hiiamboris

[13:36](#msg5f144c608e9a3a6ef0a04127)I haven't found any scaling in my Nvidia driver though

BeardPower

[13:36](#msg5f144c79724012319bb76b16)Why is Red reporting 101x18? Is the 72 dpi?

hiiamboris

[13:37](#msg5f144c90775d59377c018fe8)96 dpi + padding

BeardPower

[13:37](#msg5f144ca38a9a0a08cbaa5225)But that is not the real dimension.

hiiamboris

[13:37](#msg5f144cac18ddba6ef5e374e7)381 / 4 = 95.25

BeardPower

[13:37](#msg5f144cad8a9a0a08cbaa5263)The real one is about 2x.

hiiamboris

[13:37](#msg5f144cb7f8b05b39f955e2fb)95 - 101 = 6px of padding

[13:38](#msg5f144cd68a9a0a08cbaa52dd)It's up to you now to find who scales everything up ;)

BeardPower

[13:39](#msg5f144cf718ddba6ef5e37596)It's the same output in Affinity and PS.

[13:39](#msg5f144cfffd3832489b1ba4b2)So Red shows me the wrong size.

[13:41](#msg5f144d7a8a9a0a08cbaa5578)██████████ in PS and Affinity is 170.6x29.1

hiiamboris

[13:42](#msg5f144dca18ddba6ef5e37872)How are you calling size-text?

BeardPower

[13:45](#msg5f144e8f8e9a3a6ef0a04774)The first bar is Arial 24 pt in Affinity Desginer  
the second is rendered with Red  
the third is rendered with Red but 24px

[13:45](#msg5f144e92a874ff08d28650f4)\[!\[grafik.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/lJKK/thumb/grafik.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/lJKK/grafik.png)

[13:47](#msg5f144edda28d973192e4a537)

```
text: "██████████"
            font: [
                name: "Arial"
                ;name: "Open Sans"
                size: -24
                style: 'regular
                color: 203.204.211
            ]

extra/circle/face: make face! compose [
                text: (extra/circle/text)
                font: (extra/circle/font)
            ]

            text-size: (size-text extra/circle/face)
```

[13:47](#msg5f144efe8e9a3a6ef0a048bd)The text, font etc. is in extra/circle

hiiamboris

[13:49](#msg5f144f8418ddba6ef5e37ce6)can you post a snippet I can paste into console? ;)

BeardPower

[13:51](#msg5f144fc8a874ff08d28653f6)Sure, hold on,

[13:51](#msg5f144ff5564e6b39f567b37a)I made another bar:

Affinity Designer 24px  
Affinity Designer 24pt  
Red 24px  
Red 24pt

[13:51](#msg5f144ffa00ae3b3d99fd9181)\[!\[grafik.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/TQ49/thumb/grafik.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/TQ49/grafik.png)

[13:52](#msg5f14501cf8b05b39f955ec44)10 Alt 219 chars.

hiiamboris

[13:53](#msg5f14506eb2dad248b6c6e9d3)This is what I'm getting on my PC:  
!\[](https://i.gyazo.com/2ef3600de38543102dc2e11c03af3a6c.png)

```
>> size-text b
== 176x37
```

176x37 reported (with paddings) vs ~171x31 measured (pixel size = 214x39 with 125% scaling)

[13:54](#msg5f1450aef8b05b39f955ee5a)with the exception of ~10x6 padding it's correct

[13:55](#msg5f1450d18a9a0a08cbaa5e09)Arial 24px

BeardPower

[13:56](#msg5f1450f1775d59377c019bf8)

```
mytext: "██████████"
myfont: [
    name: "Arial"
    size: -24
    style: 'regular
    color: 203.204.211
]

face: make face! compose [
    text: (mytext)
    font: (myfont)
]

text-size: size-text face

print text-size
```

hiiamboris

[13:56](#msg5f14511dfd3832489b1bb180):D

BeardPower

[13:56](#msg5f14512682ccdc78add30704)Can you post your code as well, please?

hiiamboris

[13:57](#msg5f14512d64b6213da149cb50)`face: make face! probe compose [` shows you what? ;)

[13:57](#msg5f14514982ccdc78add307b3)1) you haven't set the font size  
2\) you haven't set the face type

BeardPower

[13:58](#msg5f145192724012319bb779a2)

```
>> face: make face! probe compose [
[        text: (mytext)
[        font: (myfont)
[    ]
[
    text: "██████████" 
    font: 
    name: "Arial" 
    size: -24 
    style: 'regular 
    color: 203.204.211
]
== make object! [
    type: 'face
    offset: none
    size: -24
    text: "██████████"
    image: none
    color: 203.204.211
    menu: none
    data:...
>>
```

[13:59](#msg5f1451b382ccdc78add308e3)I did set the size in myfont, no?

hiiamboris

[13:59](#msg5f1451be18ddba6ef5e382c0)as you can see, no

BeardPower

[13:59](#msg5f1451cfb2dad248b6c6edc6)It says size: -24

hiiamboris

[13:59](#msg5f1451d6724012319bb77a98)yes, face size

[13:59](#msg5f1451dd82ccdc78add3097e)font must have been an object

[14:00](#msg5f1451e88e9a3a6ef0a05130)and without face type idk what it measures at all

BeardPower

[14:04](#msg5f1452e1724012319bb77d31)All I had to do is this and now it returns 134x24:

```
face: make face! probe compose [
    text: (mytext)
    font: make face! myfont
]
```

[14:04](#msg5f1452f78a9a0a08cbaa63a0)Thanks a ton!

[14:04](#msg5f14530a775d59377c01a25c)I assumed that making that face with the font spec will create a font object automatically.

hiiamboris

[14:06](#msg5f14534d724012319bb77ecc)you made a mess with compose

[14:06](#msg5f145350fd3832489b1bb757)just look at it

BeardPower

[14:06](#msg5f14535600ae3b3d99fd9c48)Compose is not needed so:

```
face: make face! [
    text: mytext
    font: make face! myfont
]
```

hiiamboris

[14:06](#msg5f1453614a9e2578a0ab03de)compose doesn't default to `/only` so your block got inlined

BeardPower

[14:06](#msg5f1453644a9e2578a0ab03e1)No, compose works fine.

hiiamboris

[14:06](#msg5f145381564e6b39f567bc2f)it's still fishy

[14:07](#msg5f14538b775d59377c01a4ac)your code, fixed, returns 214x35

[14:07](#msg5f1453955ed1d537746da6d0)while the whole base is only 210px wide or so

[14:07](#msg5f1453bc64b6213da149d17d)some rounding problem perhaps

BeardPower

[14:08](#msg5f1453c064b6213da149d180)Yes, it returns 134x24 here which is correct, I assume. Affinity says it is 127.9x21.8.

[14:08](#msg5f1453eb724012319bb780f2)But Affinity show the bounding box of the visible pixels so it's smaller.

[14:09](#msg5f14541018ddba6ef5e388be)Compose was more of oversight as I did some tests inside on-create.

[14:12](#msg5f1454cdb2dad248b6c6f570)I'm getting the text and font from the extra section of the face, so I used composed. If I just do text: extra/circle/text it returns:

```
*** Script Error: path extra/circle/text is not valid for none type
*** Where: text
*** Stack: view show show do-safe on-create
```

[14:17](#msg5f1455f4775d59377c01ab26)I added the explicit path to it so everything is fine now:

```
extra/circle/face: make face! [
    text: face/extra/circle/text
    font: make face! face/extra/circle/font
]
```

hiiamboris

[14:31](#msg5f14593864b6213da149dec1):+1:

BeardPower

[14:44](#msg5f145c624a9e2578a0ab199d)I also added this to get the real size:

```
text-size: size-text extra/circle/face
text-size: text-size * system/view/metrics/dpi / 72
```

hiiamboris

[14:49](#msg5f145d97724012319bb797d5)where 72 comes from?

BeardPower

[14:51](#msg5f145dd4a28d973192e4caf0)It's the minimum DPI.

[14:51](#msg5f145deb82ccdc78add32926)size-text returns 72dpi despite me having 96dpi.

[14:51](#msg5f145df68e9a3a6ef0a07305)So I need to calulate the difference myself.

hiiamboris

[14:52](#msg5f145e3f8e9a3a6ef0a07403)i haven't seen that in your examples

[14:52](#msg5f145e4b64b6213da149eabb)looks like an arbitrary constant to me

BeardPower

[14:56](#msg5f145f1dfd3832489b1bd704)I ran some further tests and just noticed that it still has the difference. It's not DPI aware.

[15:04](#msg5f14610e775d59377c01c654)I need to do that math to get the real size. size-text returns 28x24 but Affinity says it is 32.2x18.1.

[15:04](#msg5f146111fd3832489b1bdb91)\[!\[grafik.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/UlQo/thumb/grafik.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/UlQo/grafik.png)

[15:04](#msg5f14611b18ddba6ef5e3a8e2)Red still renders it a little bigger.

[15:05](#msg5f14613b775d59377c01c684)The one with the handles is Affinity.

[15:07](#msg5f1461955ed1d537746dcb8f)I may write a bug report, providing those images etc.

hiiamboris

[15:30](#msg5f14672f18ddba6ef5e3b7de)you are doing something wrong again

[15:31](#msg5f1467418a9a0a08cbaa990d)I counted pixels, it's 37x20 on your image

[15:31](#msg5f14676600ae3b3d99fdcd48)size-text can't return size less than rendered

[15:32](#msg5f146775724012319bb7afb7)it always returns \*bigger* size

BeardPower

[16:15](#msg5f147190a28d973192e5010e)Yes it is 37x20 but size-text returns 28x24.

[16:17](#msg5f14720d18ddba6ef5e3d3b8)It's not taking the DPI into account.

[16:25](#msg5f14740ca28d973192e50639)Geez, I hade make face! instead of make font! lol

[16:26](#msg5f1474314a9e2578a0ab53bf)It returns 50x34 compared to Affinity's 32.2x18.1.

[16:30](#msg5f1475205ed1d537746dfa6e)It's not the correct output either.

[16:30](#msg5f147529f8b05b39f9564c45)

```
mytext: "0%"
myfont: [
    name: "Arial"
    size: -24
    style: 'regular
    color: 203.204.211
]

face: make face! [
    text: mytext
    font: make font! myfont
]

text-size: size-text face

print text-size
```

[16:32](#msg5f14759f4a9e2578a0ab576c)It returns 28x24 which is incorrect. It is 32.2x18.1

[16:33](#msg5f1475ce4a9e2578a0ab5883)Can you please post the output on your machine?

[16:35](#msg5f14765b64b6213da14a207a)Even this returns 28x24:

```
mytext: "0%"
myfont: [
    name: "Arial"
    size: 48
    style: 'regular
    color: 203.204.211
]

face: make face! [
    text: mytext
    font: make font! myfont
]

text-size: size-text face

print text-size
```

[16:36](#msg5f14767818ddba6ef5e3df57)A 48px font is 24 pixels in height?

[16:36](#msg5f1476968e9a3a6ef0a0af69)

```
>> text-size: size-text face
== 28x24
```

[16:38](#msg5f14771418ddba6ef5e3e12b)Very strange things happen when I use the console which ran a program.

[16:38](#msg5f14771c18ddba6ef5e3e142)It fucks up the size-text.

[16:41](#msg5f1477baa874ff08d286b601)I git it to output 50x34. But the thing is only 32.2x18.1 lol

[16:41](#msg5f1477c1b2dad248b6c7488e)So WTF is going on.

hiiamboris

[16:42](#msg5f1477dc64b6213da14a2375)`30x21`

BeardPower

[16:42](#msg5f1477f2fd3832489b1c1178)Is this your output?

[16:42](#msg5f1477fa8e9a3a6ef0a0b345)Mine is 50x34.

[16:43](#msg5f14783018ddba6ef5e3e348)I have 100% scaling and system/view/metrics/dpi is 96.

hiiamboris

[16:46](#msg5f1478d282ccdc78add36f6c)`== 117x80`

BeardPower

[16:46](#msg5f147903f8b05b39f95655a5)How do you get that number?

hiiamboris

[16:47](#msg5f14790db2dad248b6c74cf1)Repeated the last snippet

BeardPower

[16:48](#msg5f147973b2dad248b6c74dc4)Alright. At least I get the same number now.

[16:49](#msg5f147984f8b05b39f95656dd)But the screenshot measure tells me it is 87x49.

hiiamboris

[16:49](#msg5f14799e5ed1d537746e0841)Because you're not measuring paddings

BeardPower

[16:49](#msg5f1479b75ed1d537746e085f)Yes, but do you think those paddings are really THAT big?

[16:51](#msg5f147a0918ddba6ef5e3e83f)And there is no way of calculating those paddings/or get them somehow?

hiiamboris

[16:53](#msg5f147a7d564e6b39f5681e96)Here's a way to tell:

```
>> a: size-text/with face "0%+^/+"
== 156x156
>> b: size-text/with face "+"
== 60x80
>> a - b
== 96x76    ;) this is real text without padding
>> (size-text/with face "0%") - (a - b)
== 21x4     ;) this is padding
```

[16:54](#msg5f147aa9fd3832489b1c1950)Of course it's not measuring the outline of "0%" but of "██"

[16:56](#msg5f147b3464b6213da14a2ab5)So other 76-49=27px is line spacing, which is needed to render big chars

BeardPower

[16:57](#msg5f147b60f8b05b39f9565b33)Thanks!

## Friday 24th July, 2020

planetsizecpu

[14:26](#msg5f1aef9bd50f2b289a9173cb)Today I released new level L14, the boy in the end has gone to jail haha.

[14:27](#msg5f1aefb6d7efe5438f1c4907)\[!\[cavetest142.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/I5WN/thumb/cavetest142.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/I5WN/cavetest142.gif)

rebolek

[14:42](#msg5f1af34ecd7bed0e378a7e46)Can he get out? Can he enjoy all the bags of gold in the end? I hope he can!

planetsizecpu

[14:47](#msg5f1af48b2779966801fbae3f)Yes he can, in fact there is at least a fun solution for this level but I have missed one more life, this weekend I will try again (for debug) haha.

greggirwin

[15:01](#msg5f1af7af3eef7e1ffe2f4c32):^) I like the superhero guard flying in from off screen.

wallysilva

[15:31](#msg5f1afed9c1c0090e649e06c5)@planetsizecpu It looks really cool, congratulations!

## Saturday 25th July, 2020

planetsizecpu

[08:54](#msg5f1bf3512779966801fe2647)@wallysilva Thx  
@greggirwin It is a side effect; while the gravitational function is receiving clock ticks for all falling faces, also the homing function of the guard is receiving ticks, thus the planing effect occurs. It can be removed with a flag on the guard object indicating that it is going down, but this would affect homing performance a bit, and I'm not looking for it to be perfect, just that we can enjoy playing it. Anyway I like the superhero effect too :-)

[09:33](#msg5f1bfc653eef7e1ffe31e632)Last week I had a few hours to design the new L14 level, but before that I have been testing at my favorite level, the L8, which is both fun and challenging. Here we can see the superhero effect clearly. I have discovered a trick on this level that in the end is essential to collect all the gold, but I'm not willing to disclose it. 😉

[09:33](#msg5f1bfc76c1c0090e64a075bb)\[!\[cavetest081.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/TM4t/thumb/cavetest081.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/TM4t/cavetest081.gif)

## Monday 27th July, 2020

Yamoon2018

[03:52](#msg5f1e4f78277996680103ab88)I don't know if it's the correct room to discuss graphics issues, I'm trying find a way to load an image into canvas/draw so any idea about that.

wallysilva

[04:34](#msg5f1e596177eccd0e1479369f)Hi @Yamoon2018,  
You can see an example \[here](https://www.red-by-example.org/draw.html#4)  
And you can find the help room \[here](https://gitter.im/red/help)

toomasv

[05:05](#msg5f1e60a8bc41f3681728d6aa)@Yamoon2018 See also docs:  
\[Image style in VID](https://github.com/red/docs/blob/master/en/draw.adoc#image)  
\[Image in Draw](https://github.com/red/docs/blob/master/en/draw.adoc#image)  
Or use \[image facet, e.g. with base face](https://github.com/red/docs/blob/master/en/view.adoc#61-base)

## Saturday 8th August, 2020

cloutiy

[17:02](#msg5f2edaa7dca038052a578209)Forgive me if this has already been answered, but can I use the GTK branch on linux? How do I "build" it? Seeing all these threads related to `view` and feeling kind of left out ;)

9214

[17:08](#msg5f2edc1251bb7d3380daf45b) @cloutiy you can pick \[automated build](https://static.red-lang.org/dl/branch/GTK/linux/red-latest) of a toolchain, \[unofficial console binaries](https://rebolek.com/builds/) or \[build from sources](https://github.com/red/red#running-red-from-the-sources-for-contributors) yourself.

[17:09](#msg5f2edc5379da21426f20c92d)@rebolek ↑ BTW, your website has an expired cert.

cloutiy

[17:10](#msg5f2edc8bd28b99685e4f2ecc)@9214 Thanks Vladimir. Trying the automated build now.

[17:21](#msg5f2edf134c89605c7f82c86e)Damn...I know the file exists, but getting a msg that it can't find it

```
/home/drifter/.red/console-2020-8-4-8532: error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory
```

And I know it exists in

```
/usr/lib/libgtk-3.so.0
```

9214

[17:28](#msg5f2ee0ab811d3571b3b4890f)@cloutiy is it a 32-bit or 64-bit library?

cloutiy

[17:30](#msg5f2ee124dca038052a57939d)Aahh. My Manjaro is 64 bit, so I'm thinking that by default it's 64 bit. I'll see if I can install 32bit.

9214

[17:33](#msg5f2ee1e4d4bc1a71bc89ea2c)@cloutiy you can check the examples for Debian-based and RHEL-based distros \[here](https://github.com/rcqls/reds/blob/master/README-RedGTK.md). Might be a good idea to add an entry for Arch-based ones too, once you've figured it out.

cloutiy

[17:36](#msg5f2ee28edca038052a57964c)I downloaded the 32 bit and seems to be a success. Although I do get the following after starting the interpreter:

```
Gtk-Message: 13:35:47.262: Failed to load module "colorreload-gtk-module"
```

I am still able make a dialog with a button and some text!

[17:41](#msg5f2ee3b79b76045d5b87d410)I've looked at the examples for the other distros and the only thing I had to install was dbus. Everything else was already installed. Just needed to install the 32 bit gtk lib.

[17:41](#msg5f2ee3d465e829425e6e356b)@9214 Thanks for your help troubleshooting

9214

[17:43](#msg5f2ee434d4bc1a71bc89ef14)@cloutiy you're welcome :smile\_cat:

## Sunday 9th August, 2020

guaracy

[18:29](#msg5f304087b103e45c8307d988)Is there any way that a program can access some functions from gui console?  
I need:  
1\. clear screen (like ^L -&gt; clean)  
2\. set cursor at some line and column

TIA

toomasv

[20:22](#msg5f305aefdca038052a5b0df7)@guaracy You can clean console from program opened in this console with `gui-console-ctx/terminal/clean`.  
As about setting cursor, can you explain the use-case closer?

guaracy

[22:00](#msg5f30720ee20413052e787a7c)Something like this @toomasv

```
; print-at line x column string

print-at 5x1 "Progress:"
repeat i 10 [
  print-at 5x10 rejoin [i * 10 "%"]
  wait 1
]
```

GiuseppeChillemi

[22:56](#msg5f307f3388719865d94e2b53)Coul I ask why using paths on style value has not been implemented?

```
>> a: [b "print" c "Delete"]
== [b "print" c "Delete"]
>> view [button a/b [probe "print"]]

*** Script Error: VID - invalid syntax at: [a/b [probe "print"]]
*** Where: do
*** Stack: view layout cause-error
```

I am forced to add a temporary word for each data I want to use

```
a: [b "print" c "Delete"]
btnsrt: a/b
view [button btnstr [probe "print"]]
```

or compose:

```
a: [b "print" c "Delete"]
view compose [button (a/b) [probe "print"]]
```

With all complications if the actors' code contains parens.

It is really useful to be free from temporary words or composing when the style you display depends on data stored on blocks/objects.

## Monday 10th August, 2020

greggirwin

[01:17](#msg5f30a029dca038052a5ba9c7)@GiuseppeChillemi you can certainly experiment with it. Simply modify %VID.red `@pre-load`. It hasn't been requested that I recall. A data binding aspect has not yet been added to View, which will help a lot when it comes.

endo64

[06:24](#msg5f30e807dca038052a5c4daf)I remember I already asked for too, R2 allows it and it is useful.  
Here is a wish ticket for it opened by @GiuseppeChillemi https://github.com/red/REP/issues/65

[06:25](#msg5f30e84d9231d665df6999d3)IIRC it is not yet implemented because the path access is a slow operation.

toomasv

[08:09](#msg5f3100c9b103e45c83098f59)@guaracy Sorry, I am traveling, can't play now. Later...

[11:43](#msg5f3132ddfe39ca5d6591f4fd)@guaracy This is what I came up with after some playing:

```
Red []
gui-console-ctx/terminal/clean
console: gui-console-ctx/console
oldfn: copy body-of :console/actors/on-time
oldrate: console/rate
i: 0
console/rate: none
console/actors/on-time: func [face event] bind [
	i: i + 1
	if i = 1 [prin "Progress: "]
	change/part at l: last terminal/lines 11 rejoin [i * 10 "%"] tail l
	terminal/pos: index? tail l
	terminal/refresh
	if i = 10 [
		console/rate: none
		console/actors/on-time: func [face event] bind oldfn :gui-console-ctx
		console/rate: oldrate
	]
] gui-console-ctx
console/rate: 1
()
```

It works on W10, not sure about other platforms.

GiuseppeChillemi

[11:47](#msg5f3133b4811d3571b3ba0d15)@endo64 Thanks Edo, I have forgotten I have already asked for it. I was working on a configuration file and I have had to add a word for each data contained in the cfg block that I want to edit in the gui. Direct path access would be a great time saver and also avoids polluting system/words.

[11:48](#msg5f31341fe20413052e7a56ad)@greggirwin %vid.red is the vid source and `@pre-load`is a section in it, isn't it?

[11:52](#msg5f3134ebe20413052e7a5810)@endo64 I suppose that if the developer chooses to use words instead of paths when building the gui then the should be no speed loss. It is my guess but maybe the type checking phase could be the source of slowness.

[11:52](#msg5f31351379da21426f2660c2)\*then there should be..

toomasv

[13:07](#msg5f3146a4dca038052a5d56d7)@GiuseppeChillemi Where does `condition` land after first test fails? What happens to it there?

GiuseppeChillemi

[13:26](#msg5f314aeefe39ca5d65923bcd)@toomasv moving to red/help. 😉

guaracy

[14:15](#msg5f31567c4c89605c7f88b962)&gt; @guaracy This is what I came up with after some playing:  
...  
&gt; It works on W10, not sure about other platforms.

Thanks @toomasv

Works on GTK too.

I looked into console's code and will try some alternatives like:

After terminal/clean, i will recreate terminal/lines based on system/console/size so i can immediately access all lines and column and can used a function like

```
print-at: func[l c s][
  l: gui-console-ctx/terminal/top + l - 1
  change skip gui-console-ctx/terminal/lines/:l (c - 1) s
]
```

toomasv

[14:21](#msg5f3157eab103e45c830a7bd5):+1:

greggirwin

[18:39](#msg5f319444b103e45c830b2c5e)@guaracy `pre-load` is a function. Playing with chat notation using `ref!` format rather than "The `pre-load` function in %VID.red"

## Wednesday 12nd August, 2020

guaracy

[14:27](#msg5f33fc5458afd2462604d3bf)Tanks @greggirwin but i will wait for GUI console plug-in public API

[14:28](#msg5f33fc89f3d6d26b0d8f4127)Just for fun.  
GUI code to fit in one tweet.

```
Red [Needs: 'view]
view [
  title "QR-Code"
  below 
  a: area 300x300 font-name system/view/fonts/fixed
  s: field 300
  button "QR-code" [
    p: read rejoin [http://qrenco.de/ s/text]
    parse p [remove thru "pre>" to "</pre" remove to end]
    a/text: p
  ]
]
```

[14:29](#msg5f33fcd81f13b45edb71b789)\[!\[qrcode.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/CJ1V/thumb/qrcode.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/CJ1V/qrcode.gif)

toomasv

[16:07](#msg5f3413c75b08104532f1e487)@guaracy Very nice!

wallysilva

[17:16](#msg5f34240b79659c5fbfec5c7a)@guaracy That looks cool!

greggirwin

[18:12](#msg5f34310058afd246260575fe)@guaracy nice!

planetsizecpu

[18:17](#msg5f343246a350275ece0f1805)Good job @guaracy

## Thursday 13th August, 2020

TimeSlip

[14:41](#msg5f35512117acb15fdf1b4123)@guaracy Sweet.

## Friday 14th August, 2020

guaracy

[13:45](#msg5f36958fce98da26ecc8a42d)Microblog, microservices and Red

The goal is not only to write small programs (to fit in one tweet), but also to get some usefulness and readability. I like it.

```
Red [needs: 'view]

view[
  title "Date calculator"
  a: calendar 
  b: calendar 
  return
  f: field 100
  button "Add" [b/data: now/date + to-integer f/text show b]
  button "Diff" [f/text: rejoin [(any [b/data now/date]) - any [a/data now/date] " days"]]
]
```

[13:47](#msg5f3695d9367ff60c32b1e4a1)\[!\[datecalc.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/spSM/thumb/datecalc.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/spSM/datecalc.gif)

toomasv

[14:12](#msg5f369be4ce98da26ecc8b717)@guaracy Good idea!

Respectech

[16:06](#msg5f36b67787848e2119e673dd)@guaracy Nice calendar! Do you have a `request-date` function made off that calendar yet?

greggirwin

[16:27](#msg5f36bb805ccdf30c5846bf78)@guaracy very nice indeed! You should put your examples someplace so others can see them and they don't get lost.

[16:31](#msg5f36bc5560892e0c69702fb0)I don't think we have a wiki page for small examples, but we could add a dir in https://github.com/red/community for small examples.

planetsizecpu

[19:58](#msg5f36ecf64d3fd87ee7d51e88)Useful @guaracy Push hard!

dsunanda

[20:56](#msg5f36fa71d9f6f17bb6cccda8)Cool idea @guaracy - and a worthy successor to the ancient Rebol one-liners showcase:  
http://www.rebol.com/oneliners.html  
Sadly, I don't think any of the VIEW one-liners there will work in Red without some tweaks - still, might inspire someone to port them to even more compact Red code :)

guaracy

[22:08](#msg5f370b5bc7637c2700058050)\[!\[timer.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/3Ptk/thumb/timer.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/3Ptk/timer.gif)

[22:08](#msg5f370b6f87848e2119e762b1)&gt; @guaracy very nice indeed! You should put your examples someplace so others can see them and they don't get lost.

Thanks @greggirwin . I will do it when i have timer. Oh, no. I already have a timer. So, when i have time. :D

```
Red [needs: 'view]
t: 0
view [ 
  title "Timer"
  below
  c: h1 bold 200 rate 1 
  on-time [
    c/text: form now/time
    c/color: if all [t > 0 c/data > t][red][white]
  ]
  f: field hint "Secs"
  button "Start" [c/color: white t: now/time + to-integer f/text]
]
```

greggirwin

[22:17](#msg5f370d6787848e2119e76893):^)

## Saturday 22nd August, 2020

Rebol2Red

[14:33](#msg5f412caf482378093736c082)Is'nt it supposed to give the same text when using text inside a view and text inside draw dialect when using the same font? (If not it would be nice though)

```
fnt: make font! [
	name: "Consolas"
	size: 16
	color: black
]

view [text font fnt "abcd"]  ; close this window to see the text in draw dialect

im: make image! 50x50
draw im [font fnt text 0x0 "abcd"]
view [image im]
```

## Sunday 23th August, 2020

greggirwin

[17:32](#msg5f42a84a48237809373a504a)I see the same text here, using the same font, on Win10.

```
fnt: make font! [
    name: "Consolas"
    size: 16
    color: black
]

im: make image! 50x50
draw im [fill-pen glass font fnt text 0x0 "abcd"]

view [
	below
	text font fnt "abcd"
	image im
]
```

[17:33](#msg5f42a86a49a1df0a12a03fdb)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/vcOg/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/vcOg/image.png)

[17:33](#msg5f42a880ec534f584fb81524)Using my eyeball comparison anyway.

## Monday 24th August, 2020

PeterWAWood

[03:50](#msg5f4338ea49148b41c96ae39f)The strength of the text looks a little different under macOS:

[03:50](#msg5f43390ec3aa024ef9984c23)\[!\[macOS Font Comparison.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/B1D6/thumb/macOS-Font-Comparison.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/B1D6/macOS-Font-Comparison.png)

GiuseppeChillemi

[22:19](#msg5f443ced59ac794e02c38bb5) @hiiamboris @toomasv @rebolek @henrikmk @qtxie  
I have finally completed my \[List-View specifications document](https://github.com/GiuseppeChillemi/programming.red/blob/master/projects/red-list-view.adoc). It is the first creation of this kind, please pardon me any error, I am in my infancy as technical writer.

Hiiamboris, this complements your document. It has been created (as described) from my experience with Vid Extension Kit and R3 Text Table.

Please remember there is a bounty associated to it. Half of the original amount has been given to @rebolek. Do not consider this, I offer again the whole bounty and I have increased it!  
Also @viayuve expressed he still has the willingness to increase the bounty, he will write here by which amount.

[22:20](#msg5f443d1a49148b41c96dc799)All opinions are welcome.

[22:24](#msg5f443e119bad075eacd4cbc6)Bounty from my side has been increased to: 500USD.

## Tuesday 25th August, 2020

pekr

[05:46](#msg5f44a5baa5788a3c29aed4ec)I can easily add 100 USD.

vazub\_gitlab

[06:07](#msg5f44aaabd4f0f55ebbdc027a)@GiuseppeChillemi I gave the spec just a cursory glance, but from the looks of it is seems to be something similar to "dataframe" object in some analysis-oriented languages, although without specific bells and whistles a dataframe would provide. So the question is, why not actually implement a dataframe object or even a DSL to manupulate dataframes instead?

GiuseppeChillemi

[06:55](#msg5f44b5fcdfaaed4ef50a480b)@vazub\_gitlab I do not know about dataframe objects. This List-View component is derived from known Rebol widgets created during that language life and they work in a familiar way.

[06:59](#msg5f44b6ce48237809373fa166)@pekr Thanks Petr, I think you will like the "virtual columns" requirement, I have read about that this was a needing you have had and I have added it specifically for you.

pekr

[07:01](#msg5f44b759ec534f584fbd7bb4)@vazub\_gitlab for the reference, the original document / proposal is here - https://github.com/red/red/wiki/%5BPROP%5D-GUI-table-grid-design

GiuseppeChillemi

[10:42](#msg5f44eb00a5788a3c29af871a)Note : the bounty if for an open source List-View component. People should be able to use, distribute and modify it at no cost.

rebolek

[10:45](#msg5f44ebd55580fa092b2126cf)@GiuseppeChillemi You probably should add list of expected licences to the document.

GiuseppeChillemi

[10:47](#msg5f44ec2989cf2d584b752d3f)I'll do it.

[10:49](#msg5f44ec9f89cf2d584b752e45)@pekr This is a great document from Hiiamboris.

[10:51](#msg5f44ed325580fa092b212904)@rebolek Which ones would you suggest?

rebolek

[11:05](#msg5f44f07c5580fa092b2135a0)@GiuseppeChillemi I'm not an expert, but something like MIT, BSD or Apache seems to fit your description. Others probably may have better understanding and give you better suggestions.

GiuseppeChillemi

[12:08](#msg5f44ff3359ac794e02c577a8)To me, it is important the customers receive the list-view in the source format but also that companies could embed it without giving the full source of their application.

[12:20](#msg5f45021c89cf2d584b7567c6)... and any improvement of list-view should be public!

rebolek

[12:34](#msg5f450559dfaaed4ef50b2939)If any improvements should be public, then LGPL is probably better.

endo64

[13:03](#msg5f450c0f49148b41c96fdd89)I'm definitely not an expert on this but MIT is more permissive I think.

rebolek

[13:03](#msg5f450c31ddc2d041c0c73cef)MIT is certainly more permissive, but doesn't require you to publish your improvements.

pekr

[13:40](#msg5f4514d3a5788a3c29affbfa)Nor BSD? Isn't recent Red licence just good enough? I am not sure I want LGPL.

GiuseppeChillemi

[14:52](#msg5f452590a5788a3c29b02fbf)It is ok what implies giving back to the Red community the improvement on the specific component but also permitting the end developer to keep closed the remaining part of his product.

rebolek

[16:15](#msg5f4539385580fa092b220cfc)@pekr LGPL let's use the library in a commercial product without releasing your proprietary code but requires releasing enhancements to the LGPL licensed library, therefore probably the best fit for what @GiuseppeChillemi wants.  
If he's fine with people not giving their enhancements back to community, then MIT or BSD is fine.

vazub\_gitlab

[16:35](#msg5f453deedfaaed4ef50bd460)I personally don't feel like contributing to anything tainted with (L)GPL

dander

[16:45](#msg5f454012c3aa024ef99dcba0)I generally think that if someone is making significant improvements to an open source project, they will be encouraged to contribute their work back so that they don't have to continually merge changes back from the public sources. It's not guaranteed that those folks will do that, but on the other hand, copy-left licenses discourage participation to some extent as well, so it's sort of a trade off. I wonder if there have been any studies about the most effective way to encourage contributions

GiuseppeChillemi

[17:03](#msg5f454464a5788a3c29b097f0)&gt; If he's fine with people not giving their enhancements back to community

I do not want commercial entities to take from our community with greediness. It is fair to ask \*just* the enhancements to the \_list-view\_. This bounty is not for creating a Style for Giuseppe's company use but it is my gift to the whole Red community. (Let's continue in chit-chat).

hiiamboris

[20:32](#msg5f457575dfaaed4ef50c6f74)Thanks, @GiuseppeChillemi

[20:33](#msg5f45757f5580fa092b22bff0)This is helpful

[20:33](#msg5f4575a9d4f0f55ebbde46f4)I'm loitering right now ;) But I started work on the design and expect to finish it during this year.

GiuseppeChillemi

[20:40](#msg5f45775189cf2d584b76c4a2)Thanks, your document is really a great one. If the list view will be able to do everything specified in both documents it will be an unique and powerful tool. My specification is a subset of your with 20% of other elements (and even less) so, we are both describing the same thing.

## Thursday 27th August, 2020

GiuseppeChillemi

[12:31](#msg5f47a7b036e6f709fd06d4f5)@hiiamboris, @toomasv, @rebolek, @henrikmk, @qtxie, @dockimbel  
Hi my friends, I am here to inform everyone interested that @viayuve has made an unexpected increase to the \_List-View_ bounty. It is now \*600USD* from me (Paypal) + \*3000USD* from him (in ETH).  
While 80% of the design is the same as the documents written from hiiamboris and me, @viayuve is asking for \_\*datagrid\*_ functionality (other than database access). The requested additional features (like grouping, calculations, lookups) are those of \[Telerik Gridview](https://www.telerik.com/products/winforms/gridview.aspx) and \[DevExpress Winform Grid](https://www.devexpress.com/products/net/controls/winforms/grid/) which are not in our documents. The bounty will be paid in 3 steps: at 33% of the work, at 66% and the remaining part at completion.  
I give my great thank you to him for his generosity, I think it is a unique opportunity for all of us to have such an important Style component for our products.

[12:43](#msg5f47aa5ba5788a3c29b70d0c)There is another requirement I have forgotten: documentation and examples should be written for all functionalities of the Style (examples are really important here).

toomasv

[17:19](#msg5f47eb2336e6f709fd07a09c)Great news indeed! (But high above my head :flushed: )

GiuseppeChillemi

[18:17](#msg5f47f8bf49a1df0a12aec26b)@toomasv I don't think so

[18:17](#msg5f47f8cf49a1df0a12aec2a1)😉

9214

[18:23](#msg5f47fa3b5580fa092b298021)&gt; 3000USD from him (in ETH)

Does that mean "1000 USD worth of ETH for each of the 3 payments"? That presupposes that bounty hunter is comfortable with accepting crypto over fiat.

GiuseppeChillemi

[18:30](#msg5f47fbdb9566774dfe3813fb)Yes and also 200USD via PayPal from me. 1200USD worth each payment

9214

[18:33](#msg5f47fc6ba5788a3c29b7f48e)&gt; 1200USD worth each payment

A very dubious claim, given that ETH is a highly volatile asset. Sounds more like "200 USD and a cat in the bag".

GiuseppeChillemi

[18:37](#msg5f47fd71ddc2d041c0cf1d94)Vladimir, you know cryptocurrencies a 1000 times more than me. I suppose that if the receivers gets 1000USD equivalent ETHs, he will able to get them, because it is the value in USD at exchange time and not a number you fix now and that could be less at the time of the exchange.

## Friday 28th August, 2020

hiiamboris

[19:12](#msg5f495704765d633c54bc2700)The loss due to crypto/fiat exchange is around 3.5%

[19:13](#msg5f495748a5788a3c29bb79c1)Volatility is no problem usually

[19:17](#msg5f495851d4f0f55ebbe89cc5)You guys should also understand that we will not create a super complex component with thousands of features and a book to document it. We will create an easy to understand and predictable basis which you will be able to twist with Red to fit your needs. It will take much less time to extend a core with Red code than to learn all the quirks of a huge code beast, not to mention debug it or keep up to date.

GiuseppeChillemi

[23:00](#msg5f498c7a36e6f709fd0bda5e)I don't know those components. I agree with you when you write that we need a predictable basis. We need database bindings, the navigation features; a model to create/replace faces/subfaces; virtual data; a way to make calculations, render this result and navigate further from it; and also some nice elements to use to display data. You should not create EVERY aspect of a data grid but all the needed ones to have the roots elements, and a set of visualization elements. Then the small variations and every little aspect of those datagrids will come in the future. (I have not talked with @viayuve but I suppose will agree on my interpretation).

[23:01](#msg5f498cd436e6f709fd0bdb7b)Also, I will partecipate in building examples to help and just because I like doing this. So, the burden will be split and not all over you!

## Saturday 29th August, 2020

GiuseppeChillemi

[09:33](#msg5f4a20d548237809374dce09)@9214 @hiiamboris

This should eliminate any doubt:

From @viayuve  
"instead of ETH, if developer wants USDT or PAX or any other stable coins i will happily send it to them transaction fees on me. Stable coins are not volatile as ETH and is backed by real Fiat currency.  
Also,with every $1000 worth Stable Coin I will send $30 extra to cover developer side network+transaction+conversion or any other fees"

So it is not only 1200USD each round but 1200USD+$30 for expenses.

hiiamboris

[14:17](#msg5f4a639759ac794e02d3ee37):+1:

## Sunday 30th August, 2020

GiuseppeChillemi

[11:27](#msg5f4b8d2ba5788a3c29c0ac36)@viayuve is preparing some videos and screenshots to show company real-world usage scenarios of datagrid, either from user side and programmers side.

guaracy

[23:40](#msg5f4c39039bad075eace9a9b6)some mazes for fun  
\- recursive-backtracker uses recursion, so it is not suitable for large mazes  
\- the weight is used only for the sidewinder algorithm (value ​​&gt;= 0)

sources  
https://github.com/guaracy/Red/tree/master/maze

sorry readme only in portuguese

[23:41](#msg5f4c392149148b41c982d50b)\[!\[maze1.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/L88t/thumb/maze1.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/L88t/maze1.png)

[23:41](#msg5f4c392b9566774dfe42ced4)\[!\[maze.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/2HxS/thumb/maze.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/2HxS/maze.png)

## Monday 31st August, 2020

wallysilva

[01:51](#msg5f4c57afc3aa024ef9aff636)It looks pretty cool!  
But I guess it's not playable yet, right?

GalenIvanov

[07:06](#msg5f4ca15ddfaaed4ef51eecbe)@guaracy it looks nice!

[07:06](#msg5f4ca17d49148b41c983efc7)I played a little with mazes year and a half ago:

[07:06](#msg5f4ca180d4f0f55ebbf0f933)https://github.com/GalenIvanov/Games/blob/master/Mazes.red

[07:07](#msg5f4ca1cb9bad075eaceac3b8)The code is abandoned - it is ugly and repetitive. The good thing is that is playable :)

[07:08](#msg5f4ca1d3765d633c54c47381)\[!\[Mazes-Red.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/Li2Q/thumb/Mazes-Red.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/Li2Q/Mazes-Red.png)

planetsizecpu

[07:57](#msg5f4cad5048237809375465aa)Interesting @guaracy I like it can use different algorithms

guaracy

[13:35](#msg5f4cfc9949148b41c98514a2)@wallysilva , sorry if i made you think your keyboard was broken. :grin:  
today or tomorrow i will upload a playable version  
Nice @GalenIvanov

GalenIvanov

[13:47](#msg5f4cff619bad075eacebd83b)@guaracy Thanks! Your maze-gen could inspire me to continue the work on mine :) Have you tought about other geometires (like hex or triangle)?

## Tuesday 1st September, 2020

guaracy

[04:13](#msg5f4dca549bad075eacee1feb)No @GalenIvanov. This was my first try with mazes. But it is an interessanting subject.

[04:14](#msg5f4dca9bd4f0f55ebbf4560f)Now you can move the character thru the maze.

[04:14](#msg5f4dcaa4765d633c54c7f3c3)\[maze.mp4](https://files.gitter.im/55b1d8290fc9f982beaacceb/AWVa/maze.mp4)

[04:15](#msg5f4dcaca49a1df0a12be2bd8)\[!\[maze.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/h0Ec/thumb/maze.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/h0Ec/maze.gif)

GalenIvanov

[06:21](#msg5f4de8879bad075eacee6c3f)@guaracy Very cool, it's now complete! I like the character animation too - are you the artist?

guaracy

[13:20](#msg5f4e4a93a5788a3c29c86b1c)@GalenIvanov The author is Cough-E  
https://opengameart.org/content/base-character-spritesheet-16x16

GalenIvanov

[14:28](#msg5f4e5a9bd4f0f55ebbf5f02d)@guaracy Thanks, I didn't know that such a website ever existed :)

wallysilva

[17:24](#msg5f4e83d7dfaaed4ef52489e8)@guaracy It's really cool!

## Saturday 5th September, 2020

luce80

[17:54](#msg5f53d0c7482378093767c7c6)@GiuseppeChillemi I think your "list-view requested features" could easily become the list-view documentation when the widget will be available.

GiuseppeChillemi

[18:56](#msg5f53df619bad075eacfe4378)It is a starting point. Part of it is based on real documentation from Vid Extension Kit List-View component and R3 Text-Table.

## Monday 7th September, 2020

planetsizecpu

[15:38](#msg5f5653f4765d633c54ddfb88)Just testing a bit on L14, I'm not working on it by now while wait for official sound support :^)

[15:39](#msg5f5654339bad075eac04203c)\[!\[cavetest146.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/sKfT/thumb/cavetest146.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/sKfT/cavetest146.gif)

rebolek

[15:40](#msg5f565485ddc2d041c0f46da9)nice :)

## Tuesday 8th September, 2020

GalenIvanov

[08:15](#msg5f573db849a1df0a12d6af06)@planetsizecpu Cool!

guaracy

[14:09](#msg5f57908b49148b41c9a0b6de)Nice @planetsizecpu

On Linux, the filenames are case sentitive, so i get the following error:

```
*** Access Error: cannot open: DATA/Kart-tl1.png
*** Where: decode
*** Stack: LoadDfltImages load
```

Just change "K" by lowercase in

```
Kart-tl1.png
```

and

```
Kart-tr1.png
```

in

```
loadlevel.red
```

TIA

planetsizecpu

[14:25](#msg5f57946ed4f0f55ebb0d50d5)Ah ok, I usually test on w10 thx

melcepstrum

[16:21](#msg5f57af8036e6f709fd30cd62)`on-wheel`does not work on W7. Is this known issue?

ne1uno

[16:34](#msg5f57b2a236e6f709fd30d6e1)@melcepstrum what code? simple `view [button on-wheel []]` seems to work

[16:35](#msg5f57b2c9dfaaed4ef53bdf67)what version red?

[16:38](#msg5f57b36b48237809377132e3)try update to latest?

[16:41](#msg5f57b4385580fa092b523cd6)works in 064 too

melcepstrum

[16:57](#msg5f57b7f7ec534f584fef31f7)Red 0.6.4 for Windows built 28-Aug-2020/13:24:38+02:00 commit #586f267

[16:59](#msg5f57b856c3aa024ef9cdf96d)`view [base on-wheel []]` not working in W7. works in W10

## Tuesday 22nd September, 2020

melcepstrum

[13:50](#msg5f6a01341c5b0d210ac40763)ok, found that it's known issue #4275  
anyway, i finally managed to get some soundout of red:  
https://gist.github.com/melcepstrum/ba9b8c92bec3d61d7e27dfd6dcfc455c

toomasv

[18:12](#msg5f6a3e96f41f4105e4ce91bf)Can't access `portaudio/portaudio.reds`?

melcepstrum

[19:36](#msg5f6a525a6e85e0058c4b77dd)https://github.com/red/code/tree/master/Library/Portaudio

toomasv

[19:45](#msg5f6a546db39cb873c0783c5a)Ah, thanks!

## Wednesday 23th September, 2020

greggirwin

[02:40](#msg5f6ab5a35efe9467b10da716)Thanks for the updates and cool projects everyone! A grid is high on our Most Wanted list.

toomasv

[18:38](#msg5f6b963eaaff36059b50eeaa)`fill-pattern` on `box` used to be transparent. Not so any more:

```
view [
    base 100x100 draw [fill-pen red circle 50x50 25] 
    at 10x10 box 100x100 loose draw [
        fill-pen pattern 100x20 [transform 5 1 1 10x0 text 0x0 "Transparent?"] 
        box 0x0 99x99
]]
```

Change occurred somwhere between May 8 and May 26. Below is comparison of renderings of the above code on builds of these dates.  
Regression?

[18:38](#msg5f6b9642b39cb873c07b8b95)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/a0OU/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/a0OU/image.png) \[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/2wXV/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/2wXV/image.png)

greggirwin

[21:09](#msg5f6bb9706e85e0058c4f2687)@qtxie :point\_up:

## Thursday 24th September, 2020

Oldes

[10:57](#msg5f6c7b855efe9467b1122c29)I'm having this one:

[10:57](#msg5f6c7b885efe9467b1122c2f)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/DygV/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/DygV/image.png)

[10:58](#msg5f6c7be1aaff36059b5328fd)I'm having display's scale setting `150%`

## Saturday 26th September, 2020

rsheehan

[23:13](#msg5f6fcb1cefefe620f24f4563)Drawing isn't working properly in the current Mac version - red-26sep20-2623cbcbd. e.g.

```
Red [Title: "A drawing program"
	needs view]

add-line: function [] [
	loop 100 [
		append/only canvas/draw compose [pen (random white) line (random 400x300) (random 400x300)]
	]
]

view [
	canvas: 
		base 400x300 white
		on-down [add-line]
		draw [
			box 0x0 399x299
			line-width 2
		]
]
```

## Sunday 27th September, 2020

rsheehan

[01:14](#msg5f6fe783e1dd7c195499fda8)It appears to be the lack of a refresh in the Mac version causing the problem.

endo64

[07:28](#msg5f703f334002c640b5ecf3d2)Doesn't it draw anything? Works on Win10. Can you check value of `system/view/auto-sync?`.  
Also `needs view` should be `Needs: View` if you are compiling.

ldci

[08:13](#msg5f7049a3aaff36059b5cb865)works on macOS: Red 0.6.4 for macOS built 17-Sep-2020/1:38:28+02:00 commit #ec1a426

[08:30](#msg5f704d896a6e094525bc648e)@rsheehan : a slight modified code.

```
#!/usr/local/bin/red
Red [
	Title: "A drawing program"
    Needs: view
]

add-line: does [
	clear canvas/draw
	canvas/draw: compose [pen black line-width 1 box 0x0 399x299]
    loop 100 [
        append canvas/draw compose [
        	pen (random white) line (random 400x300) (random 400x300)
        ]
    ]
]
random/seed now/time
view [
	title "Drawing Test"
	canvas: base 400x300 white
        	on-down [add-line]
]
```

rsheehan

[08:45](#msg5f7051378fe6f11963644bb3)@ldci Yes, my code used to work. Many of my other programs are no longer working as well, so something has changed in the recent build.

ldci

[10:36](#msg5f706b2aaaff36059b5d0347)@rsheehan You're right. There is a problem with the last build. Contact @qtxie

endo64

[10:39](#msg5f706bf75a56b467a5f26ace)Last week many PRs get merged into the master branch so something might be broken. if you can describe the issue it would be good to raise a ticket on GitHub.

planetsizecpu

[11:08](#msg5f7072b1b8a99f4519adcc97)Me too the kart &amp; elevators don't work

qtxie

[13:52](#msg5f709905e1dd7c19549b90b5)@rsheehan @planetsizecpu Sorry for the regression. Pushed a fix.

GiuseppeChillemi

[17:29](#msg5f70cbfb8fe6f11963658069)@qtxie it's normal to make some errors on huge amount of works you do every day. You do not have to excuse, but such kindness is much appreciated.

greggirwin

[17:31](#msg5f70cc7f1c5b0d210ad545a4)It's great to have people using features and reporting problems. :+1:

planetsizecpu

[19:21](#msg5f70e62d5b75b305ddcbe679)Thx a lot @qtxie as I said many times this is 1st class support &amp; development 😉

rsheehan

[22:19](#msg5f710ff04002c640b5eeed1f)@qtxie Thanks so much. Amazing support.

## Monday 28th September, 2020

ldci

[14:22](#msg5f71f1a55b75b305ddce76fd)@qtxie Thanks! All is perfect now with macOS built 28-Sep-2020/16:15:52+02:00 commit #8559857

## Wednesday 30th September, 2020

maggiben\_gitlab

[00:50](#msg5f73d65a2604c20256c484d1)In ubuntu 18.04 im getting this message: `Gtk-Message: 21:48:51.847: Failed to load module "canberra-gtk-module" Gtk-Message: 21:48:51.848: Failed to load module "canberra-gtk-module"`

[00:51](#msg5f73d67bebcae565816e4572)I've installed `libgtk-3-bin:i386`

9214

[08:09](#msg5f743d2f7004ab397df09ec6)@maggiben\_gitlab

```
sudo apt-get install libcanberra-gtk-module:i386
```

maggiben\_gitlab

[13:21](#msg5f74863eea54403cf86a81dd)@9214 yes I tried that didn't work :(

[13:22](#msg5f74869f5bb3a772f692e55e)||/ Name Version Architecture Description  
+++-=============================-===================-===================-================================================================  
ii libcanberra-gtk-module:i386 0.30-5ubuntu1 i386 translates GTK+ widgets signals to event sounds

9214

[13:30](#msg5f748885b53fb86851f983ee)@maggiben\_gitlab please specify what Red version are you using (custom build or nightly, which commit) and what is the error message you see. Otherwise we are shooting in the dark.

maggiben\_gitlab

[13:34](#msg5f74894f08d87f3d06f0c18c)I downloaded the latest build from master just now: `red-30sep20-713dd614d`

9214

[13:35](#msg5f7489b261970e64acac3211)@maggiben\_gitlab try to install \[all the dependencies](https://github.com/rcqls/reds/blob/master/README-RedGTK.md#ubuntu-64-bits).

maggiben\_gitlab

[13:39](#msg5f748a7deb55e623330e8b57)that did the trick thanks !

9214

[13:42](#msg5f748b2a2aabe82f0287b16e)@qtxie @bitbegin :point\_up: what do you think about adding that list to readme / official wiki / installation instructions on the website?

greggirwin

[16:22](#msg5f74b0aecfe2f9049a147ac4)A short link to that info seems like a good idea to me.

## Friday 2nd October, 2020

blkstph\_gitlab

[05:16](#msg5f76b7c0aa7388396e8c71ba)Thank you for the "all the dependencies" link. More than a good idea; pretty much essential.

[18:52](#msg5f7776da1bb53378feae5311)Perhaps you can make that link prominent on the downloads page? You might also put it in a general FAQ, but I would make it more explicit: "List of required dependencies for various Linux distros" and put it right above the download link. Downloading without that is going to frustrate pretty much everyone, I expect.

## Tuesday 6th October, 2020

9214

[12:38](#msg5f7c655117377c6b5de02e88)I've created a \[dedicate page](https://github.com/red/red/wiki/%5BNOTE%5D-Linux-GTK-dependencies) for GTK dependencies (the initial content was copy-pasted with slight modifications from @rcqls' development notes). Feel free to extend it and update the existing entries.

rcqls

[12:47](#msg5f7c67776e0eb844696b7a6e)@9214 Great!

## Tuesday 13th October, 2020

toomasv

[14:59](#msg5f85c0dfa605930a78a87abe)Somwhere between May 8 and May 26 text face lost its data:  
May 8 build:

```
>> view [tx: text "foo" on-down [probe tx/data]]
foo
```

May 26 build:

```
>> view [tx: text "foo" on-down [probe tx/data]]
none
```

Intentional or regression?

9214

[15:22](#msg5f85c64724a20801a8e4b5fd)@toomasv intentional, see https://github.com/red/red/issues/3606.

toomasv

[15:33](#msg5f85c8b71cbba72b63da29ef)OK, thanks!

## Monday 19th October, 2020

henrikmk

[19:36](#msg5f8deab4c990bb1c391b44d9)Reading the source for modules/view/draw.red. It certainly is an interesting read.

GiuseppeChillemi

[20:31](#msg5f8df7a7955f6d78a93c9c5c)@henrikmk why are you liking it?

henrikmk

[21:06](#msg5f8dffdbc7ef520fffb002fa)@GiuseppeChillemi didn't say I liked it. but it's interesting.

## Tuesday 20th October, 2020

GiuseppeChillemi

[22:09](#msg5f8f6030631a250ab2801e21)@henrikmk I would like to have your eyes to look at it as you do ;-)

## Friday 23th October, 2020

planetsizecpu

[11:35](#msg5f92bffbbbffc02b5834d67b)Today released new level \[L15](https://github.com/planetsizecpu/Cave-In) I have to test a bit to see if find some flawn, but it is ready to play.

[11:35](#msg5f92c00c98a7774f1b5fbdb4)\[!\[cavetest151.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/mnAP/thumb/cavetest151.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/mnAP/cavetest151.gif)

greggirwin

[18:18](#msg5f931e887be0d67d27911d02):clap: Looks great.

## Saturday 24th October, 2020

ne1uno

[19:20](#msg5f947e63270d004bcfea44d0)`load/as pict 'png ;help load`

[19:23](#msg5f947f4f631a250ab28d5749)`? a`

rebred

[19:39](#msg5f9482ffc990bb1c392c338a)

```
pict: #{89504E470D0A1A0A0000000D4948445200000002000000020802000000FDD49A730000001549444154780163D0FD5FF593613F8347F47F2002002D3B06A3BF564A520000000049454E44AE4260820D0A2D2D2D2D2D2D5765624B6974466F726D426F756E646172794D744A4C5530794F31466E73426242780D0A436F6E74656E742D446973706F736974696F6E3A20666F726D2D646174613B206E616D653D2274657374223B2066696C656E616D653D22696D6167653378332E706E67220D0A436F6E74656E742D547970653A20696D6167652F706E670D0A0D0A89504E470D0A1A0A0000000D49484452000000030000000308060000005628B5BF0000001E49444154780163D2FD5FF57F15C3FBFFAC52FFFF33DEFDCFFC9F011B0000317E0A3C25ED4E0F0000000049454E44AE4260820D0A2D2D2D2D2D2D5765624B6974466F726D426F756E646172794D744A4C5530794F31466E73426242780D0A436F6E74656E742D446973706F736974696F6E3A20666F726D2D646174613B206E616D653D22656D61696C31220D0A0D0A796F75406D652E636F6D0D0A2D2D2D2D2D2D5765624B6974466F726D426F756E646172794D744A4C5530794F31466E73426242780D0A436F6E74656E742D446973706F736974696F6E3A20666F726D2D646174613B206E616D653D22656D61696C32220D0A0D0A796F7532406D652E636F6D0D0A2D2D2D2D2D2D5765624B6974466F726D426F756E646172794D744A4C5530794F31466E73426242782D2D0D0A}
```

```
test: load/as pict 'png
== make image! [2x2 #{2DFF7AF900BF485BFF485BFF}]
```

@ne1uno thank you !! is there a way to do it without knowing if it is a .png a .gif or jpeg ?

ne1uno

[20:14](#msg5f948b2ba0a3072b43a1d0d0)https://en.wikipedia.org/wiki/Magic\_number\_%28programming%29 not sure, but not that complicated

rebred

[20:41](#msg5f949185ea6bfb0a9a573802)@ne1uno I noticed when I load a file from the HD, red recognizes what king of image it is

ne1uno

[21:15](#msg5f94998257fe0a4f30301bdf)@rebred probably from file extension? 

greggirwin

[23:57](#msg5f94bf7cea6bfb0a9a57aa42)For files it uses the extension, for URLs it uses the MIME-type. For binary values you need to use `/as`; it doesn't sniff for formatting hints.

## Sunday 25th October, 2020

GalenIvanov

[08:36](#msg5f95391a6c8d484be2a843c0)@planetsizecpu Nice!

## Monday 26th October, 2020

rebred

[03:02](#msg5f963c5ca0a3072b43a5cc57)is there a way to read an image file dimensions (x and y pixels) without loading it into memory ?

planetsizecpu

[07:49](#msg5f967f9e3d172d78b39b95b2)@rebred as far as I know, there is no means other than sniff into the file header as for example `sz: read/part/binary %file.bmp 26` and calculating the size by the allocated bytes, I think 18,19,20,21 for `x` and 22,23,24,25 for `y` (just looked at wiki).

ldci

[11:11](#msg5f96aee061007f7d1b96636d)@rebred . This can be simply done with redCV:

```
rcvGetImageFileSize: function [
"Gets Image File Size as a pair!"
	fileName 	[file!] 
][
	tmp: load fileName
	isize: tmp/size
	rcvReleaseImage tmp
	isize
]
```

Oldes

[13:58](#msg5f96d623a0a3072b43a74f1f)@rebred for png files you can use something like:

```
png-size: func[bin [binary! file! url!]][
	unless binary? bin [ bin: read/binary/part bin 1000 ]
	if bin: find/tail bin "IHDR" [
		as-pair
			to integer! copy/part bin 4
			to integer! copy/part skip bin 4 4
	]
]
```

```
>> png-size %/r/icon4.png
== 16x16
```

[14:01](#msg5f96d6aca7e77a0ff16fef25)It would be nice to have some systematic way... maybe using `query` on `binary!`?

pekr

[14:36](#msg5f96df0098a7774f1b69e826)Amiga datatypes system? :-)

Oldes

[14:59](#msg5f96e45b7be0d67d279a82e6)Hm.. now I see, that I should not use `url!` as a valid input above as `read/part` on `url!` is not yet supported in Red.

[15:01](#msg5f96e4c1c990bb1c39320054)Still can be used as:

```
>> png-size read/binary https://avatars-04.gitter.im/gh/uv/4/rebred
== 420x420
```

greggirwin

[17:46](#msg5f970b7dbbffc02b583f911e)I vote for a simple mezz that knows how to sniff the size from image data. Just add JPG and BMP to @Oldes' example.

Oldes

[20:11](#msg5f972d56a7e77a0ff170e72a)I think it would be better to extend codecs with `query` function as there is more info in raw image data, not just size. The `query` function could than use it after file type identification.

greggirwin

[20:25](#msg5f9730a0631a250ab2941efd)How do you see it working @Oldes? If given a file, you get information about the file, not its contents, correct? Binary doesn't support query, and would have to either check all codecs or be told which one to use. Now, we can extend what `query` does, but then we need to think about all the file types out there and what it should return, whether they require a codec or not. If we do a mezz now, the logic in it can later be used in other places if desired, but at least we have it for now, without big design discussions.

Oldes

[20:26](#msg5f9731036c8d484be2ad3590)`query` now only returns modification date of file, so I expect it must be extended.

[20:28](#msg5f973186bbffc02b583ffc32)I don't say it should not be a mezz function... the question is where it should live and if there is:

```
>> ? system/codecs/png
SYSTEM/CODECS/PNG is an object! with the following words and values:
     title      string!       ""
     name       word!         PNG
     mime-type  block!        length: 1  [image/png]
     suffixes   block!        length: 1  [%.png]
     encode     routine!      [img [image!] where [any-type!]]
     decode     routine!      [data [any-type!]]
```

I can imagine, there could be also `query` in such an object returning for example size.. or other info, if supported.

[20:31](#msg5f97322757fe0a4f3036923d)There could be also `identify`:

```
png-identify: func[data [binary!]][to logic! find/match data #{89504E47}]
```

```
>> png-identify read/binary http://avatars-04.gitter.im/gh/uv/4/oldes
== true
```

greggirwin

[20:33](#msg5f97328a57fe0a4f303692ff)Ah, I see what you mean now, so not the `query` action for datatypes. Codec metadata/reflection info. Good for a general thought.

Oldes

[20:38](#msg5f9733cebbffc02b58400330)`query` on `binary!` could do all the things like a file type detection and so on, using the `query` workers in each possible codec.. but yes.. that is just me thinking aloud.

greggirwin

[20:41](#msg5f973477955f6d78a9540bed)Trying to think of use cases where you have binary data but no idea what it is.

Oldes

[20:44](#msg5f973542a7e77a0ff170fdee)I don't know.. I just like to hack with file formats occasionally.

## Tuesday 27th October, 2020

rebolek

[06:03](#msg5f97b830270d004bcff21f6d)I like the idea.

planetsizecpu

[07:39](#msg5f97ceb6631a250ab295975d)+1 to extend `query`

rebolek

[07:40](#msg5f97ced3955f6d78a9556f1d)first step is to make query do more than just return modification date :-)

planetsizecpu

[07:40](#msg5f97cefd61007f7d1b9968a3)I see it useful for game makers and CV stuff :^)

[07:49](#msg5f97d12561007f7d1b996c8e)Think of a program for restaurants, where each menu option has a photo of the food, you want the photos to fit a certain size, and you will check the size before uploading the file. The same in a human resources program, the photos of the employees will want to have them in a specific size. And so on ...

pekr

[07:55](#msg5f97d27fc990bb1c39345177)I don't remember how codecs and datatypes worked in Amiga days, but I imagine being it similar. You could have image.bmp in fact being a jpeg image. Each format has its decoder and it either loads the whole file, or has to find some header info in the beginning of file. The question is, if you can't make it part of Red system, somehow, e.g. via a `query`

GiuseppeChillemi

[09:22](#msg5f97e6d0c990bb1c3934860a)On Amiga we had "WhatIs" utility capable of giving you information about the file you provide or foreach file of a whole directory.

[12:11](#msg5f980e5c7be0d67d279d6fa5)@greggirwin Could I open a ticked on these "leaks"?

## Wednesday 28th October, 2020

greggirwin

[02:52](#msg5f98dce7d37a1a13d66e9eb3)First we should make sure they \*are* leaks.

## Monday 23th November, 2020

nwtgthb

[12:05](#msg5fbba583b03a464f08292e1d)

```
main: layout [
		pict: image %image.jpg
		ship: image %iss.png
		do [      ;-- centre the button relative to the text face
			rnx: (pict/size/x / 2) - (ship/size/x / 2)
			rny: (pict/size/y / 2) - (ship/size/y / 2)
			irnx: to-integer rnx
			irny: to-integer rny
			ship/offset/x: pict/offset/x + irnx
			ship/offset/y: pict/offset/y + irny
		    main/size:  pict/size
		  ]
    ]

    view main
```

hi I am trying to resize the view after I have moved one of the images to the center of the other image. THe problem is that the view has allocated space for the second image. I keep getting an error main has no value. Thanks.

bkalef88\_gitlab

[12:50](#msg5fbbb027771c185e0ec08026)I haven't tested, but I believe your main/size: should be outside of the layout block.

nwtgthb

[13:03](#msg5fbbb31cb03a464f082954fa)

```
view main [ main/size:  pict/size]
```

Commented line in layout and added it to the view still no success.

toomasv

[13:45](#msg5fbbbcff33d7764bde882a1b)@nwtgthb I also can't test now, but I think you can remove `ship` from layout flow by adding `at 0x0` before `ship: ...` so that space will not be reserved for it. Then you don't need to resize the window.

nwtgthb

[14:06](#msg5fbbc1df33d7764bde883919)

```
ship: image 0x0  %iss.png
```

this resulted in a non visible ship. in the do block I added

```
ship/size: 75x45
```

This seems to have dixed the problem. THanks.

[14:52](#msg5fbbcca12cb422778f321a93)I am rewriting some of my ruby qml apps, Red is impressive. Qml has a window property

```
flags: Qt.SplashScreen
```

which removed the app from the application list. Is there anything like it in Red. I have tried the no-border option but it is not the same.

pekr

[15:12](#msg5fbbd14a33d7764bde885e7a)I am not sure where to get the list of possible `flags`, but here is some example:

```
view/flags [
    text "Type something: " 
    f: field 100x22 
    button "print" [print f/text] 
    button "unview" [unview]
][no-title no-border]
```

bkalef88\_gitlab

[15:24](#msg5fbbd436fe857d71dc8dd912)window-flags: [  
resize no-title no-border no-min no-max no-buttons modal popup  
]

[15:26](#msg5fbbd4bf6a738b71d35b7429)From Greg Irwinn back in July...  
:point\_up: \[July 10, 2020 5:44 PM](https://gitter.im/red/red/welcome?at=5f08e145a9378637e8beb8ea)

toomasv

[15:57](#msg5fbbdbfeba69631c74968497)@nwtgthb Here is what I meant:

```
im1: draw 200x200 [fill-pen red box 0x0 199x199]
im2: draw 100x100 [fill-pen blue box 0x0 99x99]
main: layout [
   pict: image im1 
   at 0x0 ship: image im2 
   do [
      rnx: (pict/size/x / 2) - (ship/size/x / 2) 
      rny: (pict/size/y / 2) - (ship/size/y / 2) 
      irnx: to-integer rnx 
      irny: to-integer rny 
      ship/offset/x: pict/offset/x + irnx 
      ship/offset/y: pict/offset/y + irny
   ]
] 
view main
```

[15:57](#msg5fbbdc0229cc4d734827fc22)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/mFqI/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/mFqI/image.png)

[16:00](#msg5fbbdcaaf5849839adebd047)About window flags see https://github.com/red/docs/blob/master/en/view.adoc#window

[16:03](#msg5fbbdd6c477a8b480c11bbb4)Does `modal` take it out of the application list?

nwtgthb

[16:48](#msg5fbbe7f6771c185e0ec1171a)modal windows demand a response

greggirwin

[21:09](#msg5fbc250fb03a464f082a80c8)@nwtgthb `center-face` may work for you. It's a func you call, not a window facet.

GiuseppeChillemi

[22:01](#msg5fbc31430451324f152fdccf)&gt; About window flags see https://github.com/red/docs/blob/master/en/view.adoc#window

I can't find a flag to have a window "always on top"

greggirwin

[22:08](#msg5fbc32c02a6c794bd8023a95)You can open a request ticket for that. In the meantime, you need to use a routine to set that window flag.

GiuseppeChillemi

[23:10](#msg5fbc415733d7764bde898d8c)Other 2 questions:

[23:10](#msg5fbc416733d7764bde898da2)Is there a way to set transparency?

[23:11](#msg5fbc41a0b03a464f082ac9a6)Can we intercept hotkeys and combinations when window has not focus?

[23:12](#msg5fbc41f629cc4d734829095e)Ops, another two: is there a way to bring to front/back and show/minimize?

## Tuesday 24th November, 2020

greggirwin

[00:27](#msg5fbc5385e6f2b51c68b21198)All have to be done with API calls currently. I believe someone has done transparency, maybe @rebolek or @hiiamboris. Global keyboard hooks...I don't recall seeing. Don't think I ever did them in R2. Z order and window state aren't hard, but you also need to be able to find the window you want in order to get its handle and send it messages. I have R2 code for all that, but not ported.

[00:29](#msg5fbc53cd33d7764bde89b72e)Finding windows is probably in my send-keys work. @toomasv may have posted his ported version somewhere.

[00:30](#msg5fbc54256697c7481f226d98)\[win-shell.r](https://files.gitter.im/55b1d8290fc9f982beaacceb/zuGX/win-shell.r)

[00:30](#msg5fbc54296697c7481f226da2)Old stuff.

GiuseppeChillemi

[06:38](#msg5fbcaa4af5849839adedc687)Old but gold

## Saturday 5th December, 2020

planetsizecpu

[10:17](#msg5fcb5e4ec980287e36782ab4)Today I discovered a flawn in the new level 15, when the boy drives the wheelbarrow, due to the larger size of the widget  
he can access the quicksand river, I have enjoyed walking around there and I think I will leave it as a trick as the guards  
cannot enter.

[10:18](#msg5fcb5e624b6e8f2d3c7e44f6)\[!\[cavetest153.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/CkDP/thumb/cavetest153.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/CkDP/cavetest153.gif)

greggirwin

[16:24](#msg5fcbb442e979833582f138f9)Nice trick indeed. :+1:

## Sunday 6th December, 2020

nwtgthb

[15:58](#msg5fccffbfc980287e367bf261)@greggirwin How do I open a request ticket? Thanks.

hiiamboris

[16:06](#msg5fcd019b5f4d634d9dcddad9)@nwtgthb https://github.com/red/REP/issues

nwtgthb

[16:15](#msg5fcd03b3fb7f155587aa7554)thanks

## Thursday 10th December, 2020

planetsizecpu

[15:21](#msg5fd23d071f36292125e23c23)I'm thinking of modifying the code so that the spiders die by being crushed by the wheelbarrow when the boy drives them, instead of the boy being the one who dies. This xmas will have time to get tangled up a bit. In fact the spider crush can be seen quickly at the end of the upper gif motion, just avoid killing the boy.

greggirwin

[18:58](#msg5fd26ff203da931ac2441ee2)Crushing the spider makes sense. That's what happens in real life. :^)

## Friday 11st December, 2020

GalenIvanov

[08:07](#msg5fd328a7b6b8f41abb8552fd)@planetsizecpu I'm glad you're still working on your game! I bought a good tablet and started drawing - I hope I'm finally going to start working on my point and click puzzle adventure game.

planetsizecpu

[08:26](#msg5fd32d2928a57c581b07b5bc)@GalenIvanov well I do work on it when find spare time, but "work" means testing as much as I can, and have to be cautious so that my wife does not catch me playing 😉,thus I prefer to do it out of home when I can. But these days I received a new computers shipment and time is out again.

[08:35](#msg5fd32f613dd3b251a4fc595c)\[!\[equipmnt.jpg](https://files.gitter.im/55b1d8290fc9f982beaacceb/15G7/thumb/equipmnt.jpg)](https://files.gitter.im/55b1d8290fc9f982beaacceb/15G7/equipmnt.jpg)

GalenIvanov

[09:31](#msg5fd33c715a63c561052318b0)@planetsizecpu Haha, be cautious then! It seems you are going to be busy with those computers.

## Sunday 13th December, 2020

pekr

[06:31](#msg5fd5b54e5a63c5610528c1cb)Hello guys, would like to learn few bits about Red / Rebol GUI lower level architecture and am not able to depict it from looking into sources, so here goes my questions:

1\) I can see some activity in the Direct2D backend branch. What exactly is going to be accelerated? Is that some lower level elements as drawing images, windows, or is that the whole backend, including text and some other widgets?

2\) Is Direct2D backend going to work on all supported Win versions? Or is there any split, e.g. Win7 using GDI or a mix, and Win8.1+ using D2D, etc.?

3\) Thinking about GOBs, as there is a dedicated branch for them too, I am curious about the Text element support. In R2, there were 2 separate text engines, View's one, and Draw level one. R3 has added GOB's one. Red hase rich-text too. What is the situation with text support in Red? I mean - if I want nice big scrolling non-jerky text, should I use Draw, or ... will D2D backend help here having stuff faster/smoother?

hiiamboris

[11:20](#msg5fd5f91a82222960e4e1a2d3)1) Speed is probably of lesser concern here. Current situation is: you can work with text only on `rich-text` face, not on a `base` face, and you can use draw commands on `base` face but not on `rich-text` face. So how do you combine text and shapes? Not possible.

`base` uses GDI and GDI+ mix on Windows. GDI is just very limited and GDI+ is just very very buggy, and they also mix badly. `rich-text` is using DirectWrite engine, in which it is possible to render to a GDI surface, or to a D2D surface.

I do not know the core team's reasons for D2D migration, but as far as I can see it's a (logical) escape from complexity and bugs of the GDI\\* technologies. Faster rendering speed of all Draw commands should come as a bonus probably.

2\) D2D and DWrite both work down to Vista. Hopefully there'll be no split once the work gets finished.

3\) Can't comment on GOBs, but D2D will only affect `draw` block. Maybe some other `base`-related code (e.g. how `base` renders it's `text` facet?) as well.

pekr

[14:26](#msg5fd624ae5a63c5610529aeda)Great answers as always, thanks for that. As I said - in R2, we've got face/text and that was our very basic text mode. Later on, Cyphre has added AGG support and Draw was able to draw text too. Some nice demos appeared. Later on, R3 added Gob and its text element. I got somehow lost, what could/should be used in what situation :-)

[14:28](#msg5fd625010697c1210dbbc53b)Vista should be pre Win7 period, IIRC, so we should be all good set with D2D then and no split. Not sure, if the WinXP compatible mode is still there, but from what I remember, it was abandoned?

[14:30](#msg5fd6256a55c9c37b3062638f)Sometimes I though, if there should be just a draw mode and nothing else? Imagine - you can do some effects and text in a Draw mode, but then we've got a face level text and face level effect pipeline (not yet with Red). To effectively combine them might be cumbersome. But then there might be some speed Draw mode related worries/impacts?

Oldes

[14:31](#msg5fd625ab0697c1210dbbc6ad)R3's text gob was using the same rendering as draw for text (AGG)

[14:32](#msg5fd625ec03da931ac24cc334)I think that going D2D only makes sense... no need to support XP.

[14:32](#msg5fd626149700c07b17e9e581)Btw... for smooth animations you would need multimedia timers. And separate threads for rendering would also help a lot ;-)

hiiamboris

[15:38](#msg5fd635785a63c5610529da66)True about timers. If you have the expertise @Oldes maybe you can share some of it here: https://github.com/red/REP/issues/26

Oldes

[17:21](#msg5fd64d9767034a3e9006f08e)I wish I had.

[18:22](#msg5fd65bd70697c1210dbc4b21)According this \[old article](https://www.codeproject.com/Articles/1236/Timers-Tutorial)... \[MM timers](https://www.codeproject.com/Articles/1236/Timers-Tutorial#MMTimers) were deprecated years ago in favor of \[queue timers](https://www.codeproject.com/Articles/1236/Timers-Tutorial#QueueTimers).

hiiamboris

[18:28](#msg5fd65d4c82222960e4e28b9f)That's useful. Though we're gonna need some info on their real world resolution.

Oldes

[18:37](#msg5fd65f5767034a3e90071724)I think that problem will be (as you already mentioned in your post), that the callback solution will cause problem because it will interfere with normal code execution. It's more suited for game, video &amp; audio.

greggirwin

[22:54](#msg5fd69bc02a954a51a9cc6703)Great link @Oldes. It would be instructive for someone to do some research and see how others do it. We have UI related issues, for games and playing media, and we also have profiling and sampling situations. @giesse and Nenad, I think, both worked on a timer queue system for R2. I'll have to dig out the code for proper attribution, but it worked well at the mezz level. Then it's a question of whether timer ports work like they did there, or if another mechanism is used.

## Monday 14th December, 2020

pekr

[05:58](#msg5fd6feeb3646a85814e9f4e3)I thought that such things are eventually solved by k queue or libevent, etc. kind of event loops, but maybe this is unrelated to UI flow, dunno ...

[06:01](#msg5fd6ff9d55c9c37b30644ab2)What Gabriele has used, IIRC was some trick of how to "eat" the non useful events, so that Rebol could get faster processing of event queue?

giesse

[10:53](#msg5fd7443b28a57c581b111206)Right, the problem with R2 was that events were queued and if you were not processing them as fast as they were generated a very noticeable lag would ensue. I just did some simple event compression (ie. if you had 10 mouse move events in the queue, just process the most recent one, not all of them). That got rid of the lag almost all the time (ie. unless the user was clicking stuff very quickly). I think Romano had a more sophisticated approach but I don't recall the details right now...  
Either way, this seems more like an optimization problem, and should be rather orthogonal to how events etc. are processed.

hiiamboris

[13:32](#msg5fd769690697c1210dbf00d0)Draw battle using https://gist.github.com/hiiamboris/f6da528f95aafee0b2ff831a365079da :

GDI:  
!\[](https://i.gyazo.com/3352dba9d2a7808e700fc99827679b98.png)

D2D:  
!\[](https://i.gyazo.com/3a894115156f873cd7b3796ec12ddd46.png)

[13:33](#msg5fd7699c03da931ac24fe174)I think D2D needs a better resampling algorithm though. This one has too much aliasing.

[13:34](#msg5fd769d75a63c561052ce3ee)BTW, on GDI (master branch) this script produces very weird glitches - image jumping up and down. Anyone can confirm?

pekr

[17:02](#msg5fd79abe0697c1210dbf8dd5)Just tested `particles.red`demo, which I really like :-), and with 200 particles it is some 17-18 fps vs 25-28 fps using D2D backend test version ...

greggirwin

[23:40](#msg5fd7f7dab6b8f41abb90bb9b)I love the lagometer @hiiamboris. :+1: Is flickering expected when it runs? I get a gray rectangle at the top periodically.

## Tuesday 15th December, 2020

qtxie

[00:22](#msg5fd801b9b6b8f41abb90d2f6)&gt; BTW, on GDI (master branch) this script produces very weird glitches - image jumping up and down. Anyone can confirm?

Confirmed.

greggirwin

[00:23](#msg5fd801e5c829e14ef295621d)Ah, maybe that's what @hiiamboris described.

qtxie

[00:24](#msg5fd802501f36292125f01f4a)@greggirwin Yes. I saw a gray rectangle periodically also.

[00:25](#msg5fd8026a2a954a51a9d00139)\[!\[gdi.PNG](https://files.gitter.im/55b1d8290fc9f982beaacceb/EVk2/thumb/gdi.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/EVk2/gdi.PNG)

[00:25](#msg5fd8027082222960e4e6e77e)\[!\[d2d.PNG](https://files.gitter.im/55b1d8290fc9f982beaacceb/axSi/thumb/d2d.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/axSi/d2d.PNG)

[00:26](#msg5fd8029b3dd3b251a407fbd6)GDI performs better on my system. ;-)

[00:26](#msg5fd802b067034a3e900b6fce)BTW, I changed the resampling algorithm on D2D.

planetsizecpu

[06:48](#msg5fd85c51c614d23c2e0c3d8c)Me too, I got lag of 151 for D2D vs 94 for GDI on latest automatic build.

toomasv

[14:10](#msg5fd8c3e7b685314fe780d786)GDI+: (With gray rectangle jumping up)  
\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/nLYv/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/nLYv/image.png)

[14:11](#msg5fd8c42a3a35fc2758e940e5)D2D:  
\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/70HF/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/70HF/image.png)

hiiamboris

[15:36](#msg5fd8d7fcc614d23c2e0d726c)New interpolation algorithm is ~15-20% slower than GDI for me as well, though still less spiky. (I have no dedicated GPU)

[15:37](#msg5fd8d8513f9a136cf2b55b1d)@qtxie your D2D plot looks strange though. Looks like every 2nd draw returns immediately. Worth investigating ;)

## Wednesday 16th December, 2020

qtxie

[09:13](#msg5fd9cfbee83452230f613d47)@hiiamboris I created two back buffers in the swapchain. Maybe it's full after 2 draws, then the 3rd draw just returns immediately.

hiiamboris

[10:42](#msg5fd9e4a13f9a136cf2b7fabe)But why the same doesn't happen on my laptop?

qtxie

[11:05](#msg5fd9e9ec1a5c0e6cec07c96b)Maybe the GPU and the driver are different. My CPU is Core i7-8565U, I use the integrated GPU and a 2K 24' monitor.

[11:10](#msg5fd9eb3f47d84c6e69f88f8f)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/y1vU/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/y1vU/image.png)

[11:12](#msg5fd9eb836ce29906f537735b)It's much better if I switch to the NVIDIA GeForce MX250.

hiiamboris

[11:18](#msg5fd9eced47d84c6e69f89403)i7-10510U here, integrated intel UHD graphics

[11:18](#msg5fd9ed0e7beb2f6e63b5f213)maybe driver settings indeed

qtxie

[11:21](#msg5fd9edd57beb2f6e63b5f6c5)So seems the integrated GPU in 10th generation is more stable.

## Monday 21st December, 2020

planetsizecpu

[17:07](#msg5fe0d665aa6bb528c3630d59)Just now pushed the update for kill the spiders by driving the barrow, so easy as it only needed to append a `if any ...` condition.

[17:08](#msg5fe0d6728bb7347469481692)\[!\[cavetest155.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/uQT0/thumb/cavetest155.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/uQT0/cavetest155.gif)

greggirwin

[17:40](#msg5fe0de0fac9d8e7463c2fc88):+1:

## Saturday 26th December, 2020

toomasv

[09:41](#msg5fe7055a97312f4b6beecb45)Yuhuu! @qtxie, @bitbegin Congratulations and thanks for D2D!

greggirwin

[19:59](#msg5fe7961163fe0344961e36ae)Indeed!

## Sunday 27th December, 2020

pekr

[17:19](#msg5fe8c232de60814315482609)I did some small comparison using my all-times favourite demo - Particles. D2D version is definitely faster, with 200 particles it is 26 vs 11 fps, but otoh the memory consumption is 66 vs 12MB in favor of GDI+ version:

!\[alt](http://2zone.cz/pekr/red-particles-d2d.jpg)

hiiamboris

[17:41](#msg5fe8c760aa6bb528c3754d49)Funny. This demo is broken on D2D for me (tried different builds):  
!\[](https://i.gyazo.com/e40dc5d29aca88fe70fb69bde2892ecb.png)

[18:24](#msg5fe8d14dc746c6431cdd0567)Test code:

```
view [
	base 200x200 draw [
		pen off
		fill-pen radial 40x40   0 40 white black white
		circle 50x50 50
		fill-pen radial 160x160 0 40 white black white
		circle 150x150 50
	]
]
```

pekr

[18:28](#msg5fe8d242acd1e516f8b9a525)Well, I had similar experience and Qtxie pointed me out to the updated source of particles. The link is somewhere here maybe, or just lives in terms of one ticket.

[18:30](#msg5fe8d2d8de60814315484cd6)https://github.com/red/code/blob/D2D/Scripts/particles.red

hiiamboris

[18:32](#msg5fe8d34fce40bd3cdb0696a7)If it's an unsupported anymore syntax it should raise an error. Besides, it works without `pen off` so...

[18:33](#msg5fe8d35cc746c6431cdd0b4c)I say we fix bugs instead of hiding them under the carpet ;)

[18:34](#msg5fe8d3c222f12e449b162dbf)That this syntax is undocumented is another issue though.

pekr

[18:39](#msg5fe8d4dec746c6431cdd0dbf)I did not compare both versions, so not sure what has Qtxie actually changes. But truth is, that on your above image, it looks suspicious, as one particle is being drawn correctly and the rest are just gradient balls ....

greggirwin

[21:10](#msg5fe8f82ae7f693041f35e298)Let's document the syntax. We even have a tool to help now. :^)

## Monday 28th December, 2020

GiuseppeChillemi

[01:41](#msg5fe937e469ee7f0422c953a0)@greggirwin Which tool?

[01:46](#msg5fe938e24eba353cdf01f3e5)Question: how do I select with RMB on a `TEXT-LIST` and get the selected index? `on-change` triggers on LMB selection but not on RMB.

greggirwin

[06:10](#msg5fe976bfaa6bb528c376ca40)@GiuseppeChillemi DiaGrammar. :^)

[06:12](#msg5fe9774dde6081431549aa23)Have you tried `alt-down`?

GiuseppeChillemi

[08:04](#msg5fe991952084ee4b78785c86)@greggirwin yes, it does not set `face/selected`

hiiamboris

[09:47](#msg5fe9a9b4e7f693041f375d67)sounds like a bug

toomasv

[10:27](#msg5fe9b2f7acd1e516f8bb84cf)@GiuseppeChillemi  
Works without scrolling only :)

```
view [text-list data ["one" "two" "three" "four" "five" "six" "seven" "eight" "nine"] 
on-alt-down [probe face/selected: 1 + to-integer event/offset/y / 15]]
```

GiuseppeChillemi

[11:48](#msg5fe9c5f697312f4b6bf4b1f9)Thanks, I will try it later

hiiamboris

[15:43](#msg5fe9fd1bac9d8e7463d7c211):D

[15:43](#msg5fe9fd2edbb17f28c5a56e49)funny solution ;)

GiuseppeChillemi

[16:55](#msg5fea0de769ee7f0422cb4908)@toomasv I have tried, funny! So you are dividing by line length! Interesting but we need an `on-change` which works on `alt-down` and companions ;-)

[16:56](#msg5fea0e36dbb17f28c5a597ca)Another question: why `probe event` (which I have added to the block) does not return anything?

[16:58](#msg5fea0eba2084ee4b78797e85)And a final one: is there a way to sync 2 or more `text-list` so when you scroll one, all the othera will scroll, and when you get one selected, all the other will?

hiiamboris

[17:03](#msg5fea0fd54eba353cdf03de19)`event` is an opaque thing for now

toomasv

[17:03](#msg5fea0fe6acd1e516f8bc624f)Selection yes, scrolling no (in Red proper).

[17:11](#msg5fea11b88bb73474695d60e3)@GiuseppeChillemi You can try something like this:

```
event-info: func [e [event!]][
    foreach attr exclude system/catalog/accessors/event! [face window][
        print [attr ": " e/:attr]
    ] 
    print newline
]
```

[17:17](#msg5fea1341ac9d8e7463d7f89b)&gt; And a final one: is there a way to sync ...

You can build a custom text-list with rich-text and scroller to implement this.

greggirwin

[18:23](#msg5fea2296dbb17f28c5a5c8e8)&gt; Question: how do I select with RMB on a `TEXT-LIST` and get the selected index? `on-change` triggers on LMB selection but not on RMB.

On Windows this is not native functionality AFAIK, but I can't swear to it.

[18:24](#msg5fea22c38bb73474695d8c01)If it's not standard, then it's not a bug for us not to do it. We should also look at what other OSs support.

hiiamboris

[18:29](#msg5fea23f38bb73474695d8ee1)GTK does not select on RMB either. But `event` should hold the item-under-cursor index anyway (just not implemented).

GiuseppeChillemi

[18:43](#msg5fea275bc746c6431cdffa40)Should I write a request?

greggirwin

[18:51](#msg5fea2922acd1e516f8bca0d5)@hiiamboris you mean that event/picked should contain it, correct? @qtxie, what do you think?

hiiamboris

[18:53](#msg5fea29a0ac9d8e7463d8338a)yes that's the best candidate to hold it

[18:54](#msg5fea29cb63fe03449623db08)`on-over` and all button events should support it

GiuseppeChillemi

[19:03](#msg5fea2be5de608143154b5224)@toomasv

&gt; &gt; And a final one: is there a way to sync ...  
&gt;  
&gt; You can build a custom text-list with rich-text and scroller to implement this.

Toomas the Red, it is easy for you but I am already having nightmares thinking about it!

[19:03](#msg5fea2bebc746c6431ce00779):-D

## Tuesday 29th December, 2020

qtxie

[03:37](#msg5feaa474acd1e516f8bdc577)&gt; That this syntax is undocumented is another issue though.

The new syntax for gradient has been in the docs for years. https://github.com/red/docs/blob/master/en/draw.adoc#radial-gradient-fill

[03:40](#msg5feaa512aa6bb528c3799e7b)&gt; @hiiamboris you mean that event/picked should contain it, correct? @qtxie, what do you think?

I don't know whether the OS support it or not.

GiuseppeChillemi

[19:02](#msg5feb7d37acd1e516f8bfd474)Which is the correct way to calculate how many items will fit orizontally or vertically? Example, if X is 400 pixels and I my button is 40 pixels wide, will they fit 10 buttons or should I add other elements like di s Yangon spaces, borders? Where do I get these informations?

[19:02](#msg5feb7d60ce40bd3cdb0ccdb3)S Yangon &gt; distancing spaces

hiiamboris

[19:04](#msg5feb7dcadbb17f28c5a90575)`origin` and `spacing` are 10px by default

[19:06](#msg5feb7e3ac746c6431ce32c00)I think there's also OS margin around buttons, about 2px or so...

[19:09](#msg5feb7ed597312f4b6bf8df19)try `n-buttons * (40 + 10) - 10 + (2 * 2)` if you need tight fit

[19:10](#msg5feb7f1693af5216fc6dd586)or `n-buttons * (40 + 10) - 10 + (10 * 2)` for normal fit
