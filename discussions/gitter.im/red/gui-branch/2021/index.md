# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2021

## Friday 15th January, 2021

planetsizecpu

[17:00](#msg6001ca2803529b296bf0f635)Level L12 is so difficult, IIRC I only collected all the gold in one game.

[17:01](#msg6001ca4f99549911fc2419e3)\[!\[cavetest122.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/yKp7/thumb/cavetest122.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/yKp7/cavetest122.gif)

greggirwin

[17:53](#msg6001d69b81c55b09c70da04e)Gameplay and level design is as hard as the rest, but so important. It's nice that it can challenge its creator. :^)

## Sunday 17th January, 2021

GiuseppeChillemi

[03:19](#msg6003aca6e578cf1e95f219b6)Do we have a tree navigation Face to display nested data?

greggirwin

[03:20](#msg6003acf9d5f4bf2965ef6acf)Not yet. It's generally called a tree view but, like table/grid, it's very hard to do cross platform.

## Tuesday 19th January, 2021

GiuseppeChillemi

[22:36](#msg60075eefa2354e44ac956255)Wrong object paths used in VID don't cause an error. Is it a bug or a feature?:

```
o: make object! [
	f: func [arg] [print arg]

]

view [
	button "Test" [o/f "xxx"]
]
```

Prints `xxx`

```
o: make object! [
	f: func [arg] [print arg]

]

view [
	button "Test" [o/zzzzzzzzzzzzzzzzzzzzzzzzzzz "xxx"]
]
```

No error!

[22:38](#msg60075f6ecae490555f55b131)Also, providing no args for a function with args causes NO ERROR.

```
view [
	button "Test" [o/f]
]
```

## Wednesday 20th January, 2021

hiiamboris

[08:40](#msg6007ec66004fab4741527200)https://github.com/red/red/issues/4784

GiuseppeChillemi

[09:19](#msg6007f5aa8816425540dac1e5)I have also a code that open a sub window after a `on-change` on a `text list`, and when when I unview it, the window reopens. Are you aware if there is any double fire bug in the event system?

hiiamboris

[10:25](#msg6008050436db01248a8d7e2a)yes, in the same ticket

GiuseppeChillemi

[11:53](#msg600819aecf8b827734417c50)I have seen. In the same code I have also a text-list that does not updates on data change. I have to `SHOW face`. Are there other reasons other than a bug that requires a "forced" redraw?

hiiamboris

[12:03](#msg60081bfe410c2214400f4451)try to isolate the bug

toomasv

[13:31](#msg600830bc6244ee14509ea58b)Couldn't find in issues: `toggle` style does not honor initial `true` state on W10:

```
view [toggle "true" true [face/text: form face/data]]
```

Seems that data facet is not checked on creation. Initial recognition can be forced with

```
view [toggle "true" on-created [face/data: true] [face/text: form face/data]]
```

ldci

[14:26](#msg60083d99a2354e44ac9786a1)@toomasv : no problem under macOS. Correct behaviour.

hiiamboris

[14:49](#msg600842efa2354e44ac97961e)Confirmed. Switches from true to true on the 1st click.

toomasv

[15:57](#msg600852cfdfdbc1437f9f2d04)@ldci @hiiamboris Thanks! https://github.com/red/red/issues/4806

greggirwin

[19:26](#msg60088402ac653a0802cf3f5b)I haven't used `toggle`, and now I see why (on Win10). It looks \*exactly* like a button. Whose great idea was \*that\*?

[19:27](#msg60088432a2354e44ac985bbb)All the money MS has put into user testing...

## Thursday 21st January, 2021

mikeyaunish

[14:54](#msg600995ab753011449b09762a)I have run into a crash scenario running this code:

```
lay2: [
    text "window2" 
    drop-down "<select>" data [ "close-window" ] on-select [ unview/only win2 ] return
    button "close window" [ unview/only win2 ]
]
lay1: [
    text "window1" 
    drop-down "<select>" data [ "close-window" ] on-select [ unview/only win1 ] return
    button "close window" [ unview/only win1 ]
] 
view [
    button "window1" [
        view/no-wait/options win1: layout lay1
        [ offset: 200x612 ]    
    ]        
    button "window2" [
        view/no-wait/options win2: layout lay2
        [ offset: 405x612 ]
    ]
]
```

If

```
window1
```

is closed using the dropdown the whole  
program crashes.

hiiamboris

[15:09](#msg60099926d8bdab47394e097d)confirmed on W10, please make a ticket

[15:11](#msg600999af2cb18a437c31b15e)funny it didn't crash but quitted silently the 1st time I tried, but crashed all the time after that

GiuseppeChillemi

[19:30](#msg6009d66836db01248a927736)@hiiamboris yes, on computers, if you repeat the same actions, you get the same results, until they want to show you they have opinions too.

hiiamboris

[19:32](#msg6009d6b92cb18a437c327592)..Until they evolve into SkyNet and wipe us all :D

GiuseppeChillemi

[19:37](#msg6009d811a2354e44ac9bfd33)Maybe we should change Red license, prohibiting the use of it to build skynet.

hiiamboris

[20:01](#msg6009dda3cae490555f5c585a)Hmm.. Or prohibiting SkyNet to use Red...

pekr

[20:05](#msg6009de96dfdbc1437fa38172)SkyNet is red .... and will transform in RedSky :-)

hiiamboris

[20:06](#msg6009ded98816425540e00432)\[Humans are dead](https://youtu.be/QWDjLrIDLx4) ):

ne1uno

[20:18](#msg6009e1a497132e2480f61e0c)https://miami.cbslocal.com/2021/01/20/arnold-schwarzenegger-urges-seniors-join-him-getting-vaccinated-come-with-me-if-you-want-to-live/

Oldes

[22:21](#msg6009fe6b2cb18a437c32ea01)@hiiamboris funny... I'm just reading \[Sea of Rust](https://www.tor.com/2017/09/07/no-thinking-thing-sea-of-rust-by-c-robert-cargill/) book. A very good one btw.

greggirwin

[22:35](#msg600a01b3410c22144014a5fc)@hiiamboris I hadn't seen that. Just, wow, LOL. Thanks. I needed that.

[22:36](#msg600a01dfd8bdab47394f46c1)Thanks for that link as well @Oldes. Sounds interesting.

## Friday 22nd January, 2021

mikeyaunish

[04:10](#msg600a50182cb18a437c33b714)@hiiamboris Thanks for confirming. I have entered a ticket.

planetsizecpu

[11:58](#msg600abdf1410c221440167581)@mikeyaunish I'm using `Red 0.6.4 for Windows built 18-Jan-2021/10:06:33+01:00 commit #de5c05e`and does not crash, but have strange behaviour on close, see this gif...

[11:59](#msg600abe05dfdbc1437fa5c22b)\[!\[MikeCode.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/uYls/thumb/MikeCode.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/uYls/MikeCode.gif)

greggirwin

[17:20](#msg600b09793855dd07fd700037)@planetsizecpu would you please post the code so we can paste and play on our own systems? That often helps quite a lot, because then we can tweak it too, and see what changes.

planetsizecpu

[17:23](#msg600b0a193855dd07fd70023e)@greggirwin I pasted the upper code from @mikeyaunish

greggirwin

[17:25](#msg600b0a8f6244ee1450a67806)Oh, thanks. I remember seeing that @hiiamboris responded to that so I didn't look closely.

planetsizecpu

[17:38](#msg600b0daad8bdab4739520d88)Just tested by repeteadly pressing buttons and found this, but you have to move te new windows to see as the are created in the same point

## Saturday 23th January, 2021

GiuseppeChillemi

[18:46](#msg600c6f0c2cb18a437c38eecc)If I want to simulate user interaction, is there a way to insert events in the event flow?

hiiamboris

[19:06](#msg600c739ecf8b8277344ccf58)like `my-face/actors/on-click my-face object [offset: my-offset]`?

[19:14](#msg600c757eac653a0802d9a690)or low level? on Windows you can use my https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/input.red

GiuseppeChillemi

[19:35](#msg600c7a69ac653a0802d9b28c)Or passing the key or key combination pressed, yes, it is the idea.

hiiamboris

[19:39](#msg600c7b7fdfdbc1437fa9fc7e)key combos you can carve out of here: https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/testing.red#L478

[19:41](#msg600c7bd697132e2480fcadf2)you will need to strip it of `offload` calls (it was designed to control another Red process, won't be needed in your case)

[19:42](#msg600c7c416b20cf7730d2f4d1)some minimal working examples can be found in https://github.com/red/red/issues/4380 and https://github.com/red/red/issues/4338

## Thursday 4th February, 2021

GalenIvanov

[09:23](#msg601bbd119fa6765ef8f8e26e)Hi! I was browsing a text file in which I gather links to webpages I found interesting and rediscovered \[Langton's ant](https://en.wikipedia.org/wiki/Langton%27s\_ant). I decided it was a nice topic for a short Red demonstration, so I coded it.

[09:23](#msg601bbd23063b6c68d53a5750)\[!\[Langton's ant.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/Dh5I/thumb/Langton-s-ant.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/Dh5I/Langton-s-ant.png)

[09:24](#msg601bbd4e9d5c644f664cacb8)Here's a link to the source: \[Langton's ant in Red](https://github.com/GalenIvanov/Graphics-Red/blob/master/Langton's%20ant.red)

[09:25](#msg601bbd8455359c58bf1ee140)The ant leaves the 20x20 grid after 901 steps :)

hiiamboris

[09:25](#msg601bbd96aa6a6f319d03987c)(:

rebolek

[09:26](#msg601bbde1063b6c68d53a5a71)`%Ant_32.png` is missing :)

GalenIvanov

[09:27](#msg601bbde85500a97f82e5fdbe)just added it

[09:27](#msg601bbdf19fa6765ef8f8e420)sorry

rebolek

[09:27](#msg601bbdf9aa6a6f319d03993f)No problem :)

[09:30](#msg601bbea9063b6c68d53a5c2b)Works fine on Linux. Nice work!

GalenIvanov

[09:36](#msg601bc035a0246860dc2e7323)@rebolek Thank you! It's nothing special, It's just me showing signs of life :wink:

rebolek

[09:53](#msg601bc40a063b6c68d53a698c):)

planetsizecpu

[10:34](#msg601bcdc655359c58bf1f0e96)Well done @GalenIvanov

GalenIvanov

[11:20](#msg601bd895ae4b9b27c19b4f06)Thank you @planetsizecpu !

[11:54](#msg601be05d0eed905f188fc48d)I adjusted the strarting position to 12x12 (for a grid 20x20) and it now takes 1287 steps for the ant to leave the area.

toomasv

[13:21](#msg601bf4d2aa6a6f319d043078)Nice work, @GalenIvanov !  
It reminded me of an old Red dragon:  
\[!\[red-dragon](https://toomasv.red/images/Animations/dragon.gif)](https://toomasv.red/images/Animations/dragon.gif)  
Unfortunately this doesn't run anymore

GalenIvanov

[13:23](#msg601bf5559238c531ad2388c4)@toomasv Thanks! Wow, that Dragon curve is nice! It is L-systems based, isn't it? Did you render it within an image that can be scaled?

toomasv

[13:24](#msg601bf5ab428d9727dd54e89d)It scales the draw with `matrix`. \[See](https://gist.github.com/toomasv/373703d4e4a828f857838fae86d07ee5)

GalenIvanov

[13:29](#msg601bf6d024cd6b60d81a1626)@toomasv I see. Why it doesn't work anymore?

[13:30](#msg601bf70932e01b4f7174406a)I got "Script Error: invalid Draw dialect input at: \[100% 0 0 100% 350 450]"

toomasv

[13:31](#msg601bf719428d9727dd54ec39)I haven't investigated yet. Just discovered.

GalenIvanov

[13:32](#msg601bf75b84e66b7f7ecfa6e8)@toomasv You've been asked many times already, but: How do you record these GIFs?

toomasv

[13:33](#msg601bf78c9238c531ad238f3b)https://www.screentogif.com/

GalenIvanov

[13:33](#msg601bf7af1ed88c58d81dacb1)Thank you!

toomasv

[13:33](#msg601bf7b7a0246860dc2f11ae):+1:

[13:35](#msg601bf82d84e66b7f7ecfa8cb)Ok, corrected and \[flies again](https://gist.github.com/toomasv/373703d4e4a828f857838fae86d07ee5)

GalenIvanov

[13:37](#msg601bf88ea0246860dc2f14c1)Great!

[13:38](#msg601bf8eb9fa6765ef8f98840)I found a minor bug:

[13:39](#msg601bf8f884e66b7f7ecfaada)\[!\[Toomas-dragon-curve.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/qNlw/thumb/Toomas-dragon-curve.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/qNlw/Toomas-dragon-curve.png)

[13:40](#msg601bf9581ed88c58d81db080)When I adjusted the slider to the far left, the image didn't disappear, but appeared in the top-left corner

toomasv

[13:46](#msg601bfaa81ed88c58d81db49c)Oops! Thanks! Will look.

[13:48](#msg601bfb3424cd6b60d81a2438)Hmm, none of my several versions does this. On what platform do you run it?

GalenIvanov

[13:49](#msg601bfb5332e01b4f71744cbd)Windows 10, Red 0.6.4 for Windows built 14-Oct-2020/7:15:08+02:00 commit #052377f

toomasv

[13:50](#msg601bfbc155359c58bf1f8f53)Ha, yes, the older build does it. New one doesn't.

GalenIvanov

[13:51](#msg601bfbd64f7d1b68e52e49e2)Then I need to upgrade :)

toomasv

[13:52](#msg601bfc094f7d1b68e52e4a63):smile:

greggirwin

[17:14](#msg601c2b851ed88c58d81e5c35)Very nice @GalenIvanov ! Thanks for posting.

[17:15](#msg601c2bad84e66b7f7ed060fa)I admit I upped the speed to 30, being impatient. :^)

GalenIvanov

[17:33](#msg601c2fe59238c531ad245170)@greggirwin Thanks! Same with me :smile:

greggirwin

[17:39](#msg601c316baa6a6f319d0502ef)Faster Ant! Faster! &lt;whip crack&gt;

GalenIvanov

[18:59](#msg601c441baa6a6f319d055797):smiley:

GiuseppeChillemi

[21:28](#msg601c67019d5c644f664ef0bd)Do we have charts styles in Red?

hiiamboris

[21:35](#msg601c68a9aa6a6f319d05e3aa)@rebolek has one I think

## Tuesday 9th February, 2021

mikeyaunish

[04:38](#msg602211c4063b6c68d54ab0fa)Have released \[V2.0-beta of Direct Code](https://github.com/mikeyaunish/direct-code)  
!\[alt](https://raw.githubusercontent.com/mikeyaunish/direct-code/master/direct-code-demo1.gif)  
\[Link to demo](https://raw.githubusercontent.com/mikeyaunish/direct-code/master/direct-code-demo1.gif)  
. Hope to get some feedback.

pekr

[05:36](#msg60221f4d32e01b4f71842862)Nice!

planetsizecpu

[07:38](#msg60223bf7ae4b9b27c1abffef)It looks so cool @mikeyaunish I like the objects editor and colour selector. Just find the form area a bit small but I guess it is resizeable. Push hard! 👌. I think @YKprog is also working in its own gui editor.

GalenIvanov

[08:00](#msg6022410824cd6b60d82a5b87)@mikeyaunish Very nice!

GiuseppeChillemi

[08:21](#msg60224605aa6a6f319d14970f)Wow! Great!

ldci

[09:47](#msg60225a1532e01b4f7184bbd8)Nice but with some pbs with macOS

hiiamboris

[10:13](#msg6022606724cd6b60d82aa697)Why do you escape the slash? `/` -&gt; `^/`

mikeyaunish

[14:17](#msg6022997c0eed905f18a1198c)@ldci - What happens on macOS?

[14:39](#msg60229ead55359c58bf30df0e)@hiiamboris if you look at any multiline string object the text field will use ^/ to denote a newline. I have imbedded Gregg's object browser under the menu: Object/Object Browser. It is a great way to see the inner workings of Red.

[14:47](#msg6022a094aa6a6f319d15948c)@planetsizecpu you are right the form area may need to be resizable in the future. I have found adding a 'input assist' button beside each field usually allows for the greatest ease of use but this is still evolving. I want to incorporate more 'direct manipulation' elements into the environment but had to take a side trip with the 'Object Editor' first.

hiiamboris

[15:35](#msg6022abbda0246860dc40885f)right, my glitch

TimeSlip

[17:02](#msg6022c01c84e66b7f7ee13fad)@mikeyaunish That's really cool. Good job.

ldci

[17:02](#msg6022c03d84e66b7f7ee13fe5)@mikeyaunish .Tests with macOS. Compilation error

```
*** Compilation Error: undefined word close-it 
*** in file: /Users/fjouen/Programmation/Red/direct-code-master/direct-code.red
*** near: [
    close-it 
    exit
]
```

[17:05](#msg6022c0ea9fa6765ef80aedab)@mikeyaunish : middle click unsupported .Under macOS only Right or Left click events. Some windows close all the interface. May be you have to check unview/only. I’ll try a complete check during the week-end :)

mikeyaunish

[17:17](#msg6022c3b7ae4b9b27c1ad780d)@ldci I haven't really set it up yet for compiling. I am spending all of my time on the interpreted side. Does macOS support the "control key + tilde" key stroke?

greggirwin

[18:18](#msg6022d1e04f7d1b68e540186c)@mikeyaunish wow! Very cool. The bidirectional editing aspect looks slick, and the way you handle moving and resizing in the object editor windows is clever as well. I will try to run it later.

[18:24](#msg6022d356428d9727dd66bd5f)Runs fine on Win10, but haven't played for real yet. The help intro and quick start are a \*great* idea.

mikeyaunish

[19:35](#msg6022e3f30eed905f18a1f2d9)Thanks @greggirwin. I was finally able to overpower the tricky "parse most possible text strings" issue. Not all - just most. I am sure it will reappear as it is used in different scenarios.

## Wednesday 10th February, 2021

toomasv

[12:06](#msg6023cc4a84e66b7f7ee3f755)I noticed interesting thing on W10, may be bug. With following setup in console:

```
reposition: does [other/offset: main/offset + as-pair main/size/x + 7 0] 
view/no-wait other: layout/flags [title "Other" box] [no-min no-max]
view/no-wait main: layout/flags [
    title "Main" 
    on-resize [reposition print "Resized"] 
    on-resizing [reposition] 
    on-close [unview/all] 
    button "Other" [view other]
][resize no-min no-max]
```

If you resize "main" window from right or upper border, no `resize` event is firing (i.e. event after you release mouse after dragging).  
After closing "other" window, `resize` event on these borders is firing.  
After reopening "other" window, no `resize` event again.

Now, modify code by setting it e.g. `on-resizing [other/offset: face/offset + 200x0]`. Now resizing from top and left border will not fire `resize` event.  
I.e. those borders that affected repositioning of the "other" window during `resizing` events will not fire `resize` event.  
Is it expected?

[12:33](#msg6023d28732e01b4f71888b8e)@hiiamboris @qtxie ^

hiiamboris

[12:42](#msg6023d49f32e01b4f71889134)With the initial setup I'm always getting "resize" from the bottom border and arbitrary events from the other three.

[12:42](#msg6023d4cc0eed905f18a4486e)And a crash when I close it

[12:43](#msg6023d4e324cd6b60d82e72b2)

```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds
*** at line: 103
***
***   stack: red/object/get-values 028892E4h
***   stack: red/error/form 028892E4h 028892F4h 028892D4h 0
***   stack: red/actions/form 028892E4h 028892F4h 028892D4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: ctx||568~launch 026F1D68h
***   stack: ctx||587~launch 026F1804h
```

[12:43](#msg6023d4fdaa6a6f319d18ad3c)That alone warrants a ticket ;)

[12:46](#msg6023d595aa6a6f319d18af21)Also if I activate "other window" then "main window" a few times, the arrows cursor doesn't show up anymore. Though I can still resize it ;)

[12:49](#msg6023d660ae4b9b27c1b01deb)Second setup seems to be stably giving "resize" from the right border.

toomasv

[13:19](#msg6023dd75aa6a6f319d18c562)Ok, thanks, I'll report it.

GiuseppeChillemi

[21:11](#msg60244bf89238c531ad391956)@mikeyaunish where is published this object browser?

greggirwin

[21:13](#msg60244c7755359c58bf355580)\[here](https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5)

## Thursday 11st February, 2021

DideC

[11:26](#msg602514715500a97f82fe4714)@mikeyaunish Very nice Direct Code Mike !  
I'm very pleased to see Nenad's Livecode and my Livecode-enhanced continue to grow up ;--)

[11:27](#msg602514914f7d1b68e545eab0)You have made a very strong work on it.

## Friday 12nd February, 2021

mikeyaunish

[06:04](#msg60261a5f9d5c644f6667762a)Thanks @DideC . Both of your works have been a great inspiration to me. I really want to push the envelope of what can be expected of a program creation environment.

## Sunday 14th February, 2021

wallysilva

[07:35](#msg6028d2cda8c6a778480b22b6)  
@mikeyaunish that's really cool!

## Friday 19th February, 2021

Respectech

[01:24](#msg602f13368621811d5887324c)I've started basic work on my knowledge base program in Red. It starts out by allowing the user to search for one or more words. I want the results to display below the search bar in a scrollable area. Looking through the docs, I can't find that scrolling within panels is supported yet. Is there a way to do this?

greggirwin

[01:50](#msg602f1963a8c6a778481b55a6)Native panels don't support it. You have to roll your own. @toomasv may have some suggestions.

Respectech

[01:56](#msg602f1ad79ba13e72e43ba1fd)It would be really cool if native panels could support it. :-)

[01:59](#msg602f1b7d726a881d4f836680)

```
view [
    f: field on-enter [
        p/pane: layout new-layout
        show p
    ]
    p: panel 640x480 white
]
```

&gt;

[01:59](#msg602f1b9f9403f11bb5910e72)`new-layout` is a block that contains VID code

greggirwin

[02:13](#msg602f1ebce634904e60abe345)It would be. All you have to do is convince the OS makers. :^\\

[02:15](#msg602f1f397ba8124e54749a8d)Use `layout/only`.

Respectech

[02:15](#msg602f1f3d93539e234384ecca)It seems that I would have to convince the VID makers, right?

greggirwin

[02:16](#msg602f1f80a7fc4b573be34aba)Sadly, it's out of our control. This is the downside to native widgets. Things are already complicated enough without trying to hack around all the different ways it might need to be done, while keeping things stable.

[02:17](#msg602f1fb8dc108172e7874fa6)What we \*can* do is add higher level compound styles, that wrap multiple native widgets.

toomasv

[04:25](#msg602f3dcfdc108172e7879567)@Respectech There are some scroller examples \[here](https://github.com/toomasv/learning/tree/master/snippets/scroller). I discovered now that some of these work with pre D2D builds only. I haven't yet looked where exactly the problem is.

hiiamboris

[08:25](#msg602f75f4a8c6a778481c32bf)@Respectech https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/scrollpanel.md

toomasv

[09:55](#msg602f8af69403f11bb5921cb4)@hiiamboris Wow! :+1:

hiiamboris

[10:00](#msg602f8c338621811d58885568)based on your discoveries ;)

toomasv

[10:33](#msg602f93fedc108172e788712c):smile:

Respectech

[15:36](#msg602fdb1a7ba8124e54767d48)Thanks guys!

greggirwin

[17:41](#msg602ff8659337c51bc6991dba)Thanks @hiiamboris!

## Saturday 20th February, 2021

Respectech

[00:25](#msg603056e9e634904e60af1509)@hiiamboris Thanks! Question: If I want to change the value of the pane of `s: scrollpanel []`, I can't change `s/pane` because that will overwrite the scrollbars and cause scrollpanel to error.

[00:25](#msg603056f67ba8124e5477daab)What's the proper way to do it?

hiiamboris

[08:11](#msg6030c42ae634904e60b001ea)You can remove and insert items into the pane as you wish, just don't remove the scrollbars themselves (they will automatically jump to the end of the pane though).

[08:14](#msg6030c4e0a37fc1784c32fb1e)found a minor bug

[08:26](#msg6030c7cb4c79215749fa9a93)Fastest route would be:

```
end: skip tail face/pane -2       ;) skip 2 scrollbars at the tail
change/part face/pane new-contents end
```

As this would only trigger a single `pane` reaction.

Respectech

[22:04](#msg60318766a8c6a77848218fcc)@hiiamboris Thanks. I'll give that a try when I get back to my computer on Monday.

## Sunday 21st February, 2021

gltewalt

[03:10](#msg6031cf1a93539e23438ba7fe)Can you write `text data` from `field on-change []`? Where text is the value of the field as it changes?

[03:52](#msg6031d8e09337c51bc69db78c)And where do i stick do-events if im using compose?

greggirwin

[20:57](#msg6032c950dc108172e7906aba)@gltewalt not sure of the the context for your question. A face's `data` facet automatically stays in sync, so you shouldn't have to change it. `view [field on-change [print mold face/data]]`

[21:01](#msg6032ca167ba8124e547dd174)@hiiamboris, @dockimbel look at `scroll-panel` and noted that some \[code patterns e.g.]( https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/relativity.red#L78) aren't supported by the compiler. Can always wrap it in `do`, but my 2 cents on that func is that the op param makes the meaning a bit cryptic. Doesn't seem to be used in `scroll-panel`. Where is a good place to read it in action?

hiiamboris

[21:16](#msg6032cdc793539e23438e0cb4)@greggirwin `scrollpanel` uses `face-to-screen` and `face-to-face` (based on `face-to-screen`)

[21:18](#msg6032ce0ea37fc1784c37fedb)Keeping the `mezz-warehouse` compileable is not the goal for me, too much effort and the code will become ugly.

[21:18](#msg6032ce35726a881d4f8c9854)`op` meaning should be obvious from lines 112 and 123, but `translate` not an exported function, just one used internally.

[21:19](#msg6032ce58726a881d4f8c98bc)Think `fold` ;)

greggirwin

[21:52](#msg6032d6319ba13e72e444e0ad)&gt; Think `fold` ;)

Got it. So not for humans. ;^)

[21:53](#msg6032d677e634904e60b51456)Thanks for the pointers too. Skimming and didn't go down there.

[21:59](#msg6032d7caa8c6a7784824ade8)I get it. Have to think about it a) because the get-ops look like emoticons ;^) and b) the very nature of this (clever in a good way) code is that going down and right (into faces) means smaller offsets.

@dockimbel often prioritizes code size and compilability, though takes it all in, when reviewing.

[22:00](#msg6032d7e14c79215749ff9d38)As is the case here, sometimes the two are in conflict.

## Monday 22nd February, 2021

hiiamboris

[07:25](#msg60335c668621811d5891af8a)Worth saying that this translation model is an artifact of View design. Technically, the OS (at least Windows) knows absolute screen pixel offsets and sizes of each face, so with routines no loop is required (and this is how it works in the view test system).

greggirwin

[17:01](#msg6033e3729337c51bc6a2db0f)Good note. When we do a non-native GUI system, the OS won't know about all the faces. An interesting bit of history to go with this. In VB1, maybe even 2, the `label` control was a regular face/window. But people used them so heavily that MS redesigned them so they were a special, lightweight non-window- based control.

hiiamboris

[17:42](#msg6033ed084c79215749027b55)wow that must mean really a lot of labels..

greggirwin

[17:57](#msg6033f0788031c8234bfa1d04)Well, it was 1991 and having an extra 50-100 controls on the screen could make a speed difference when loading.

pekr

[18:06](#msg6033f293e634904e60b80458)btw - I have heard that MS is replacing VB with Python. Guido works for MS nowadays ....

hiiamboris

[18:06](#msg6033f2b36825b964d6274495)scary...

pekr

[18:16](#msg6033f5048031c8234bfa29a5)Not scary. Python just won one of the scripting langs races. MS first used it for PowerBI (apart from R lang). Even Amiga OS 4 uses it for scripting :-) That does not meen though, that there is no place for other langs :-)

hiiamboris

[18:38](#msg6033fa20a37fc1784c3b0b99)From my experience I can't recall a single software product written in python (even partly) that was not painfully buggy.

[18:39](#msg6033fa5347585464db95d7da)So with the amount of complexity MS deals with nowadays I can imagine what their software will look like in a few years from now. That's what I meant by "scary" :D

rebolek

[19:07](#msg603400e06825b964d62772bb)to be fair, esptool.py works fine.I haven't tried anything crazy with it though.

gltewalt

[19:10](#msg603401bb93539e2343912ac1)Not really understanding why position of `input` from `on-parse-event` doesn't update until... after

[19:10](#msg603401bea7fc4b573bef9343)https://imgur.com/N16khCO

planetsizecpu

[19:13](#msg60340246dc108172e7938f02)I know a lot ppl using py for research, even my daugther at the university is learning it. They 're coming from Statistica, Matlab &amp; R. I wonder what they will think of Red, I did personally advised my daughther not to learn Red before the clasic langs or will find these too complex after human oriented langs 😀

gltewalt

[19:19](#msg603403d0a8c6a7784827bc4f)Missing a push or pop... maybe

## Tuesday 23th February, 2021

dsunanda

[11:45](#msg6034eadc9337c51bc6a59e3c)Red does not directly provide the ability to arbitrarily resize layouts - especially complex ones with nested panes of VID elements. But you can do quite a lot with some simple code:

This is an under 3 minute screen capture of a rescaling mezzanine I've been playing with over the past couple of days:  
https://we.tl/t-d6DJGDke4L

These are some notes about it:  
https://we.tl/t-eJD1XIRZT6

(Links above expire in seven days)

Comments wlecome!

[11:45](#msg6034eae0e634904e60baa1e1)I hope this could be the start of a project that leads to proper system-level resizing. Or at least some help in exposing currently missing data (eg for example currently we have to guess the font size of the "A" here:)

```
rich-text data ["A" font 20 "B" /font]
```

hiiamboris

[12:05](#msg6034efa193539e234393aee0)Looks great ;)  
See also https://gitlab.com/hiiamboris/red-elastic-ui

[12:06](#msg6034efb99403f11bb59fe00a)I didn't think anyone would want to scale fonts though... Is this really useful?

[12:10](#msg6034f0b7a37fc1784c3db090)An example: in a spreadsheet tool, when I create a plot and then resize it bigger to include more data, it automatically makes label fonts so \*\*huge\** that labels actually take more space than the plot itself, so I have to manually edit it's properties and set all fonts to reasonable fixed sizes. Every time.

[12:11](#msg6034f0f1a37fc1784c3db0e3)I find that very annoying..

dsunanda

[14:26](#msg603510899ba13e72e44abab5)@hiiamboris Thanks! Font scaling is just to prove it can be done...Not that it should. The full API (no where near to completion) allows any element of a face to opt-out of being rescaled, eg:

```
ignore: ['font 'offset 'pane ' draw 'size]
```

eg You might want to not rescale DRAW because it's a fixed-size icon.

Font-scaling is difficult....If a parent face grows by (say) 20% x 45% then it is obvious how to rescale a child face's size. But what does that mean for a font!? The demo code has some heuristics, but they are not ideal.

hiiamboris

[14:35](#msg603512b1dc108172e7966db8)Indeed it's quite a problem. Another tricky thing is how rescaling system should handle scenarios when user changes `face/size: ...` manually at some points. Especially how to minimize eventually accumulating size rounding error.

dsunanda

[14:42](#msg6035145d47585464db98d48d)@hiiamboris &gt;user changes face/size: ... manually at some points

Yes. In the current design, they have to call the API to let us know.  
It would be nice to be able to pick that up from a reactor (The API kinda does that for offset changes now - eg with LOOSE). But the API is also changing the size, and so don't want that to also trigger the reactor.

hiiamboris

[14:46](#msg6035153cdc108172e79675d1)Good, thought-provoking points. Thanks for sharing your attempt (;

dsunanda

[14:46](#msg6035153fa8c6a778482aa990)@hiiamboris &gt; to minimize eventually accumulating size rounding error

Should be no rounding errors in current design - it captures the state of the parent (eg size etc), so we exactly know the % change in each case.

hiiamboris

[14:48](#msg603515a54c7921574905abd7)Yes, that was my approach too. But when the size changes (by user's intervention), you have to recapture it. And if it changes often, and the system resizes it often between it's changes, it accumulates.

dsunanda

[14:56](#msg60351784726a881d4f92a1b2)@hiiamboris We may be talkimg about slightly different things. But I am confident the design I have is pretty much immune to accumulated errors.

Part of the API's state of a child face is that it is (eg) 8.6882% x 30.7780% of its parent's size. No change to the parent's size will affect that scaling factor. If the child's size changes, we recalculate that scaling factor from the exact new parent size.

pekr

[15:09](#msg60351aad7ba8124e5483fd77)In the past, I do remember Rebol GUI resizing subsystems being done by multiple developers - Romano Paolo Tenca, Dockimbel, Carl himself, and for the R3, Ladislav Mecir. Some systems tried to be inspired by some know aproaches, using spacers, etc. IIRC, the Saphirion R3's was supposed to be quite superior, but that branch of R3 kind of died off. Maybe @henrikmk remembers something around that, working for Saphirion too, IIRC.

hiiamboris

[15:12](#msg60351b46e634904e60bb2ace)OK here's a silly scenario: let's say we have a base of size `200x50` initially. Then it's size begins oscillating between `100x50` and `300x50` on timer:  
`inc: 2 view [size 400x100 base cyan 200x50 rate 50 on-time [x: face/size/x: face/size/x + inc if x = 300 [inc: -2] if x = 100 [inc: 2]]]`  
!\[](https://i.gyazo.com/fb463c27fa61def42a1d172d6f00bdde.gif)  
And then we say: we want this base to scale with the window. And user starts dragging the window corner and we get a lot of resize events. I don't have to tell you that this ends badly ;)

pekr

[15:14](#msg60351bd5e634904e60bb2d00)Luke, use the force then! Gabriele created some event eating function, which allowed to process more events :-)

hiiamboris

[15:17](#msg60351ca19ba13e72e44adee1)Eating function solves other issues :/

[15:19](#msg60351ced7ba8124e54840396)Anyway, the problem here is that both algorithms assume little external intervention, and base may end up having negative size I think.

dsunanda

[15:35](#msg603520c48621811d58967e7f)Part of the issue with your oscillator is that it assumes a fixed size - it has hard-coded sizes.

That type of case is (partially) handled correctly with the one-hand clock in the demo - the hand can be rescaled between ticks, and appears to work correctly because the tick-code works on percentages from the current location of the clock's shaft, - not on absolute values.

Still, I am sure there are plenty of edge cases that can break the demo. More, please!

And it points to the need for carefully designed code for any layout that could be resized by an API.

hiiamboris

[15:37](#msg60352120a7fc4b573bf2a609)Precisely. And for the need of clear understanding of what to expect from such automatic resizer. (read: it should be dumb enough that you can explain how it works to almost anyone)

[15:38](#msg6035217da7fc4b573bf2a6de)Now if we finally had floating point pairs... ;)

Respectech

[16:37](#msg60352f448031c8234bfd79da)A Red browser will probably need to be able to scale fonts. Open any browser and try CTRL + and CTRL - to see that current web browsers do scale fonts.

hiiamboris

[16:47](#msg60353193e634904e60bb67a9)True, though only inside pages (not in the chrome area), and unrelated to resizing of the window or particular frames.

dsunanda

[16:57](#msg603533f07ba8124e54844107)@hiiamboris Yes! Floating point pairs would have made my life in the last couple of days much better :)

I think the main difference between your oscillator and my clock is that the STATE of the clock is held in an object - the clock itself is just a drawing. That's why it can be resized too small to be of use - even to 0x0 - and then brought back.

If the oscillator had the same MVC design, then it \*probably* (I'm wary of claiming things untested) would resize rationally/

pekr

[17:08](#msg60353672dc108172e796db17)We need double bufferimg to keep scrolling smooth anyway, no? 🙂

dsunanda

[17:50](#msg60354070726a881d4f931b30)@hiiamboris inevitable drift due to accumulated errors. \*\*You are absolutely right\** it's an insoluable problem....Sorry for being slow in realizing what you already discovered :)

Actually, it is maybe solvable if you allow "application hinting" - ie if an app knows that two fields are meant to be abutting, it can use a callback to correct any drift.

Or change the whole method of LAYOUT to specify boxes relative to each other, rather than independently placed on a pane. Like CSS does.

greggirwin

[18:38](#msg60354b998621811d58970423)Nice work @dsunanda! Thanks for posting. This is a great area for people to collaborate on.

dsunanda

[19:59](#msg60355eb98031c8234bfe0af7)@greggirwin Thanks. Sounds like several people have tackled this sort of problem before - so maybe if we pool ideas we can make something work.

Hiiamboris has pointed out it is not possible to be pixel perfect as continual resizing of independent faces will create drift.

But we can do something that works for most "static" layouts.

And a "hinting" DSL might help with the drift problem (fonts in the real world come with sizing hints for similar reasons - so no reason why we should let that problem stop us).

Respectech

[20:34](#msg603566c58031c8234bfe2716)A way that might help to avoid drift is to record the original position as part of each face. Then, when resizing, always use the original position as the base of the calculation.

dsunanda

[20:55](#msg60356bc89337c51bc6a71c35)@Respectech That's what I said too :)

I'm already doing something like that. But hiiamboris has found ways to break it when a user manually resizes (or repositions) a single face in a tree of resizable faces.

I've got some ideas to retain a higher degree of accuracy .... But I think he's right, and those ideas only delay the inevitable.

We need more ideas - and more ways to break them - that way lies progress :)

greggirwin

[21:02](#msg60356d61e634904e60bc1a19)And also weigh what we can fix with language. If we can handle the normal cases well and say "Don't do that!" for the worst problems, along with "If you do X, call Y to reset things." we can reduce effort.

dsunanda

[21:27](#msg603573319337c51bc6a7337e)@greggirwin Agreed! Lets do what we can do. And avoid reinventing a wheel made entirely of edge-cases.

greggirwin

[21:35](#msg6035751aa37fc1784c3f4096):^)

## Wednesday 24th February, 2021

gltewalt

[18:06](#msg603695c2b13524529aaaac7d)Can a person refer to all `text` faces at once?

[18:19](#msg603698cd4821572018fa9366)If you have a block of words that match your face names, and use foreach to set a bunch of values at once, it doesn't wan't to work. For me :-)

[18:20](#msg603698fc2a9d4f27f12f630c)No work:

```
view compose [x: text "O" y: text "K" button "Change them" [(foreach val [x y][val/data: ""])]
```

[18:21](#msg603699146c077b203573a128)Work:

```
change-val: func [val][val/data: ""]
view compose [x: text "O!" button "Change it" [(change-val x)]
```

hiiamboris

[18:42](#msg60369df827f8804c6bb1905a)Use `?` and `??` to inspect things ;)

luis-rj

[19:20](#msg6036a710b13524529aaaddbb)@dsunanda Is the code of rescale public ?

gltewalt

[19:30](#msg6036a96d48e4d527e8069700)Oh...  
`view compose [x: text "o" y: text "k" button "Change" [(foreach s stuff [set s ""])]]`

[19:31](#msg6036a99c11ef2d2e9c24ddcd)where stuff is `[x/data: y/data:]`

hiiamboris

[19:38](#msg6036ab386c077b203573d5da):+1:

greggirwin

[19:55](#msg6036af334821572018fad47e)@gltewalt you can do it the other way as well. It's just understanding what your block refers to:

```
view compose [
	x: text "O" y: text "K" button "Change them" [
		foreach val [x y][ face: get val   face/data: ""]
	]
]
```

henrikmk

[21:22](#msg6036c3a5e0d7284c7357bbbd)&gt; In the past, I do remember Rebol GUI resizing subsystems being done by multiple developers - Romano Paolo Tenca, Dockimbel, Carl himself, and for the R3, Ladislav Mecir. Some systems tried to be inspired by some know aproaches, using spacers, etc. IIRC, the Saphirion R3's was supposed to be quite superior, but that branch of R3 kind of died off. Maybe @henrikmk remembers something around that, working for Saphirion too, IIRC.

I remember it took way longer to develop than it should have, but it gave some experience. I'm also inclined to think that the best resize model is one that learns from past mistakes. Don't try to make one ultimate model after months and months of thinking, but rather 4-5 different ones (and make them quickly) and see which one works best.

hiiamboris

[21:28](#msg6036c4eab183705405152086)what was your approach @henrikmk ?

dsunanda

[21:58](#msg6036cc1cb13524529aab417e)@luis-rj &gt; Is the code of rescale public ?  
Not yet! I'm tinkering with the mechanics of it and trying to write some documentation. Couple of weeks time there may be something worth showing.  
Right now, the code is intertwined with another system (i was trying to make a specific system rescalable). So I have some fiddling to do to make it stand-alone.

rgchris

[22:04](#msg6036cd55739b422ea7555db1)@gltewalt You can also take a data-driven approach if your faces have the same parent:

```
sib: none

view compose [
    text "O!"
    button "Change it" [
        foreach sib face/parent/pane [
            if sib/type = 'text [
                sib/data: copy ""
            ]
        ]
    ]
]
```

greggirwin

[22:24](#msg6036d219b1837054051545f7)And if you go the way @rgchris mentions, look into `foreach-face`.

rgchris

[22:44](#msg6036d6b711ef2d2e9c255825)Is a bit neater 👍

```
view compose [
    text "O"
    text "K"
    button "Change it" [
        foreach-face face/parent [
            if face/type = 'text [
                face/data: copy ""
            ]
        ]
    ]
]
```

[22:45](#msg6036d6f9b13524529aab5f54)You may want to explain if I'm missing other facets of `foreach-face`

greggirwin

[22:47](#msg6036d77e6eb766540c207595)You can use `/with` which is neater in some cases.

```
view compose [
    text "O"
    text "K"
    button "Change it" [
        foreach-face/with face/parent [
            face/data: copy ""
        ][face/type = 'text]
    ]
]
```

[22:48](#msg6036d7a548e4d527e807138c)\[Some examples](https://gist.github.com/greggirwin/01bd4ea16fcc9458f531352cfdf6100f)

ldci

[23:44](#msg6036e4ce4821572018fb662e)Very elegant ways to update faces. Greatly appreciated:)

rgchris

[23:57](#msg6036e7f16c077b2035748064)Just realized, there's no reason to still have `compose` there. Oh well.

## Thursday 25th February, 2021

greggirwin

[00:03](#msg6036e96bcfd9b375cd53696f)Good catch @rgchris.

[00:04](#msg6036e9a7cdbfc0620c27d291)@ldci I still think `foreach-face` is pretty low level. We can easily wrap it in something more declarative.

gltewalt

[00:08](#msg6036ea6227f8804c6bb264ea)Like `with/all 'text`do something?

[00:10](#msg6036eae6b183705405158b27)Thanks, foreach-face was kind of what i was thinking about when i asked about referring to all `text` at once

greggirwin

[00:11](#msg6036eb4b2a9d4f27f1304acb)In my gist link above, `foreach-pane` gives you more control over what to apply it to, but it's a matter of how to make it much cleaner than a `case` construct in the body. Also, note that there are ad hoc resizing experiments in there.

gltewalt

[00:12](#msg6036eb68004546620950a3bc)`with//all [magic]`

greggirwin

[00:14](#msg6036ec0142f30f75c7c64bc9)This aligns with a couple other features: XML and HOFs. XML, think DOM. HOF, think CSS. That is, given a tree structure (e.g. a tree of faces), how do you apply actions to selected elements. This also roughly aligns with the very general pattern-action model (think AWK), and we want them all to unify as much as possible.

gltewalt

[00:22](#msg6036edb4e0d7284c73582eb8)xml makes my skin itchy

greggirwin

[00:22](#msg6036eddbcfd9b375cd53758c)Like everybody else. So we need to be the itch reliever.

gltewalt

[00:29](#msg6036ef8442f30f75c7c65534)Look what happens when `to-string` is thrown in, here:

```
view [f: field 100 on-change [g/data: to-string f/data] g: field: 100]
```

[00:30](#msg6036efbd4821572018fb8211)type two or more words in the first field - it results in no spaces in the second field

[00:32](#msg6036f02f2a9d4f27f13057c3)Of course it's unneeded in this example, but it's something I stumbled across

greggirwin

[00:44](#msg6036f2e2004546620950b61b)Because multiple values become a block in `data`, but values are then formed and don't have the concept of space around them, so it's like `rejoin`ing them. Unless your data looks like `1 ". 2 ." 3` in the field.

gltewalt

[02:31](#msg60370c1242f30f75c7c6974a)forming values in the block?

greggirwin

[02:33](#msg60370c8c42f30f75c7c69836)It's like `to string! [1 2 3]` Each value has to become part of the resulting string, so must be formed.

gltewalt

[02:34](#msg60370cb3cdbfc0620c2823f9)Oh yeah

[02:37](#msg60370d4e2a9d4f27f1309e21):laughing: that was silly

pekr

[04:59](#msg60372ea1739b422ea7565094)Be wise with using `with`.... it is too good to not be general. IIRC, it is/was used in VID too?

rgchris

[05:10](#msg6037314c6eb766540c215206)Primarily as a means to access the face object in creation from within VID

pekr

[05:12](#msg603731a1e820835296afde09)YEs

henrikmk

[12:11](#msg6037940442f30f75c7c809a5)@hiiamboris I'll try to get back to you on that. Saw your question.

greggirwin

[15:55](#msg6037c88b27f8804c6bb4d1a7)If we add `with`, it will likely be a general, more user-friendly approach to `bind`+`R2-use`.

temperfugit

[16:31](#msg6037d0cc48e4d527e809ca48)\`Has shape in Draw changed? It doesn't seem to auto close paths anymore.

[16:31](#msg6037d0d248e4d527e809ca68)

[16:31](#msg6037d0e16eb766540c234130)`view compose [base draw [ pen yellow shape [move 10x70 curve 30x20 50x20 70x70]]]`

9214

[16:32](#msg6037d11d6eb766540c2341f5)@temperfugit see \[here](https://github.com/red/red/issues/3089#issuecomment-539148096).

temperfugit

[16:36](#msg6037d2104821572018fdef88)Okay, thank you. The draw documentation lists "closed" as a keyword outside of shape, I did not know there was a "close" keyword inside shape.

greggirwin

[17:02](#msg6037d81b4821572018fe04b5)@temperfugit would you please file a ticket on the docs repo for that? Thanks.

temperfugit

[17:24](#msg6037dd61b13524529aae3d1f)Done, https://github.com/red/docs/issues/263

## Friday 26th February, 2021

henrikmk

[00:19](#msg60383e9f2a9d4f27f1344d57)@hiiamboris My approach was at first to borrow from other tool-kits.

For the \*\*VID Extension Kit\*\*, it was the spring based system in MacOSX/NextSTEP, because it was simple and produces predictable results, because there is no weighting, but provides full pixel accuracy. If you play around with old versions of XCode or the GUI builder in GNUstep, you can quickly see how it works.

It's one that can be implemented fairly easily, though it was not fully implemented in VID Extension Kit.

It was done by doing traversal through the face tree inward, calculate the size of each face and then faces inside it, and using initial positions of all faces during first layout to move and resize faces, when the outer window changed size. If the face becomes too small for anything inside it to fit, that's too bad. Whenever a face provided a custom resize function, it would use that one instead.

Second, I worked a bit on the resizing model in Saphirion's \*\*RebGUI \*\*(I was not part of the R3 effort, but I provided some consultancy). It's similar to VID Extension Kit, but does not provide a good initial setup option. This means that horizontally stretching faces placed on top of each other will not share the same size, if the bottom one happens to be wider. Furthermore, having a unit system instead of pixel based system requires a lot of extra custom resize calculations for faces that might be placed in opposite corners to place them with pixel accuracy. Furthermore, it resizes using size differences from previous sizes. This leads to problems, when the window size change event cannot be captured by R2, such as during minimize, leading to a destruction of the layout and a blank window.

\*I don't think the RebGUI system is very good, overall.*

[00:21](#msg60383f14cfd9b375cd577316)@hiiamboris For the \*\*R3\** effort, the system was weighted, and my only real contribution there was to offer ideas on pixel accurate resizing of weighted faces. I did not like this system either, as I found weighted layout systems hard to produce good layouts in.

[00:24](#msg60383fbc93cc841b2005422d)@hiiamboris As part of a recent non-REBOL UI effort at Saphirion, I did two studies on resizing.

For the \*\*first\*\*, I made a prototype, which used a number of extremely simple face distribution and resize models. This basically was a system, of about 10 different, very small, resize algorithms, which are only capable of distributing and resizing the faces in the current pane.

That means, each pane in a face can have its own resizing model.

Each resizing model would simply be described with one word, such as V-BALANCE, H-BALANCE, V-SPLIT, H-SPLIT, FLOW, SPRING, GRID, ABSOLUTE, DISTRIBUTE, CENTROID, etc. You would extend the number of methods as you needed them.

Some models have very specific restrictions, such as only being able to handle one face in a pane. CENTROID will for example, place the one child face directly in the center of itself, if there is a child face.

I realized then also that instead of creating face styles, the resizing model itself became the face word, which made the layout dialect very simple, such as:

```
spec-layout [
	win: h-balance color red [ ; red window with H-BALANCE resizer
		centroid color green style button
		centroid color yellow text "Boo"
		centroid color blue [
			absolute size 10x10 color black
		]
	]
]
```

In that way, the face style becomes a secondary word rather than the primary word.

And so, it became very easy to make fairly complex resizing schemes using just these words, and I think it could solve the problem of mixing weighted and non-weighted resizing, because it could do that with little effort.

To further manage size relationships, I created a system called Channel Links, a concept directly borrowed from MODO. In the layout dialect, you would use the DRIVE word to specify one dimension in one face (height) to drive a dimension in another face (width). Further relationship descriptions would be possible with the MOVE-SNAP and RESIZE-SNAP words, to create self-driving move and resize relationships between faces.

I did not manage to solve whether the resize model should be bidirectional (outward, then inward) or unidirectional (only inward).

I did also not manage to solve a lot of bugs in this prototype, as time ran out, so the prototype was stored in the archive. It needs a couple of do-overs to become viable.

[00:25](#msg6038400b4821572018ff6e4a)@hiiamboris For the \*\*second\*\*, I created a prototype for a vertex based constraint model.

I copied ideas from 3D modelers like Blender, MODO and Maya, particularly rigging of rigid bodies, which is plainly algebraic relationships between different shapes. Each face has 9 vertices distributed over it, and you would specify the position of corner vertices to resize and move the face. Individual vertices of other faces could be constrained to positions on the face and have them follow each other, or resize dependently.

The vertices follow a rectangular resize rule, so in order to resize a face, you'd constrain the top left vertex and move the bottom right vertex, and the other 7 vertices follow.

The idea was then that vertices in one face could be linked to vertices in any other faces to develop a size relationship.

Furthermore, separate sets of individual custom vertices covering a face or the window area can be used as constraints to produce margins and guides.

This prototype has been shelved due to some difficulty in managing hundreds or thousands of vertices as words. I later resurrected it again for a new resizing DRAW dialect, which I will work on again soon. This one uses enumerated vertices in a path system.

I personally think a hybrid model with many small resize models, along with a vertex constraint model is the way to go.

pekr

[05:54](#msg60388d2dcfd9b375cd585118)All that info should be somehow recorded :-) Henrik - what did Saphirion moved to? I do remember Robert talking about Lua ...

hiiamboris

[09:52](#msg6038c4db823b6654d26c32dd)@henrikmk thanks for the detailed response! :+1:  
That all is bit too complex to my taste, but I guess tastes vary. Still, it's interesting to see such different approaches. Custom resize functions is a great idea.  
It would be nice to know the meaning of the terms you use, as google is of no help. E.g. does 'spring' model mean smth like `(size-change-1 / size-1 ** 2) = (size-change-2 / size-2 ** 2)`? Does 'weighting' mean that we distribute only freed space (that is `size - initial-size`) according to given weights, or we also initially size faces according to given weights? Do we split the space linearly? What do 'balance', 'split', 'distribute' models do?  
I also guess that in 9-vertices model some conflict resolution algorithm is required, right?

rgchris

[14:48](#msg60390a4b22a5ce4a911d0fa5)Would like to throw in my own suggestion wrt. resizing (have mentioned similar before): I'd shoot for some blend of \[Bootstrap terminology](https://getbootstrap.com/docs/5.0/layout/containers/) (\[grid](https://getbootstrap.com/docs/5.0/layout/grid/), \[columns](https://getbootstrap.com/docs/5.0/layout/columns/))/\[Skeleton terminology](http://getskeleton.com/#grid) (Skeleton being lighter in scope), \[CSS Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) and possibly even \[CSS Grid](https://css-tricks.com/snippets/css/complete-guide-grid/) (sanitized, obviously). You get great leverage from concepts that are in common use and reasonably well thought out.

[14:50](#msg60390ac85d0bfb4e58727125)They are also (and I've used this phrasing elsewhere) largely data-driven.

hiiamboris

[16:24](#msg603920af823b6654d26d424c)Thanks for the links

gltewalt

[16:50](#msg603926bf5d0bfb4e5872cc0b)Flexbox :thumbsup:

toomasv

[19:20](#msg60394a18d2619a4f2e0c7eb8)Yet another \[Tic-Tac-Toe](https://gist.github.com/toomasv/db152840afa1d7639975c24f0ed2996c)

greggirwin

[19:29](#msg60394c3722a5ce4a911dd602)Great info and thoughts all. Thanks! :+1:

[19:32](#msg60394ccd5d0bfb4e587340da)@toomasv nice!

## Saturday 27th February, 2021

wallysilva

[02:48](#msg6039b2e5e8267a46f2dc8c0b)@toomasv Really cool!

toomasv

[04:11](#msg6039c686d74bbe49e0bf8e68)Thanks @greggirwin, @wallysilva!

planetsizecpu

[06:37](#msg6039e8ae457d6b4a948ecf36)Good job @toomasv

ldci

[09:56](#msg603a175eb5131f4f28dddddc)@toomasv Elegant as usual :)

toomasv

[11:13](#msg603a2945a3a2f04f1fbff6c9)Thanks @planetsizecpu , @ldci !

planetsizecpu

[11:35](#msg603a2e8322a5ce4a9120137f)It would be interesting to see him play alone, I mean for demo in a infinite loop @toomasv I imagine the fuses burning 😃

toomasv

[14:29](#msg603a5753457d6b4a948fe8ab) :pouting\_cat: :hash: :eyes: :repeat:

henrikmk

[16:41](#msg603a764be8267a46f2de779b)@pekr Nothing is completely settled yet, but right now, the new GUI prototype runs on Go and uses Yoga for layout and resizing. In other words, this new UI is not going to be very interesting for REBOL users.

[17:41](#msg603a844bd74bbe49e0c18119)@hiiamboris &gt; E.g. does 'spring' model mean smth like (size-change-1 / size-1 \** 2) = (size-change-2 / size-2 \** 2)?

The spring model places 6 springs for each face. Outside the face: top, left, bottom, and right. Inside the face: horizontally and vertically.

If you want to right/bottom align a button in a panel, you would give it a top and left spring. Then it sticks to the right/bottom side of the panel.

If you want the button to follow the width of the panel, then do not place any outer springs, but one horizontal spring inside the button face.

For initialization (alignment phase), you give it an initial size and optionally any pixel position. Then for the resize phase, springs take over 100%.

This method provides no weighting, but provides very stable, pixel accurate GUI layouts.

&gt; Does 'weighting' mean that we distribute only freed space (that is size - initial-size) according to given weights, or we also initially size faces according to given weights? Do we split the space linearly?

I think in the R3 GUI, you can do both. If you specify a size for a panel, then it won't grow, when you add more widgets inside it, and the widgets will shrink, otherwise it will just grow.

In the R3 GUI, you specify a min-size and max-size for that panel and for every widget which may not resize beyond certain restrictions.

The problem with this approach is that you need to provide a lot of extra restriction information to produce a reasonably consistent UI that doesn't scale like a fun-house mirror.

&gt; What do 'balance', 'split', 'distribute' models do?

SPLIT - Takes two faces and divides the parent space vertically or horizontally. A value between 0 and 1 determines where the split position exists. Useful for user adjustable panel splitters.

BALANCE - Takes N faces and divides the parent space vertically or horizontally according to a set of weight values. Useful for tables.

DISTRIBUTE - Takes N faces and distributes them evenly along the width or height of the parent face in a grid. Then the faces are placed in the centroids for each grid cell. Useful for icon panels, where each icon can have different sizes.

&gt; I also guess that in 9-vertices model some conflict resolution algorithm is required, right?

The only conflicts you might have would be circular references, and it might be possible to build very strange behaviors between faces, if you link dimensions between them inappropriately, such as face A's height becomes face B's width.

I admit this is not fully explored yet, but some way of figuring out calculation order is needed, but it should not require any solvers. It might be so that describing calculation order directly is necessary.

hiiamboris

[17:49](#msg603a8647e5f1d949d46a4d54)What would happen if I tie top-left corner (of some face D) to face A, top-center point to face B, and top-right corner to face C, and then randomly position those A, B and C?

henrikmk

[17:50](#msg603a8649e5f1d949d46a4d58)(I realize all these explanations would benefit from illustrations)

[17:52](#msg603a86c6d74bbe49e0c189d7)@hiiamboris you'd need to specify a target vertex on faces A, B and C.

hiiamboris

[17:55](#msg603a87a1120cd84f78e1ad87)Yes. I mean that's 3 different vertices, so how can we align to all three? Just choose one that leads to minimum face D size?

greggirwin

[19:15](#msg603a9a4cd2619a4f2e0ff183)Thanks for more great info @henrikmk. :+1:

[19:18](#msg603a9b1a457d6b4a9490b46c)I appreciate the notes about where different models are best applied.

gltewalt

[19:56](#msg603aa3ec457d6b4a9490cc6f)@toomasv tictactoe playable? Nothing happens if I click around on linux

[19:57](#msg603aa42a95e23446e4ff9d26)Circle shows up, then No

toomasv

[20:09](#msg603aa6f0e5f1d949d46aa687)@gltewalt Yes, playable.

&gt; Nothing happens

Interesting, what breaks it?

gltewalt

[21:17](#msg603ab6d144f5a454a4432023)Maybe I just don't know what to press?

[21:18](#msg603ab73ed1aee44e2db2b235)https://imgur.com/a/xrpCtd6

[21:30](#msg603ab9d922a5ce4a91218df2)Click on it and circle appears. Then nothing.

[21:31](#msg603aba2ee5f1d949d46ad48d)X key O ket, aroow keys - nothing. If i click a bunch of times then it wont close via the close window button - "no responding" message

[21:31](#msg603aba48d71b6554cd0e9dea)Dang, i really cant type on the phone

[21:45](#msg603abd64d1aee44e2db2c09f)For windows users, paste it in the CLI console (Not GUI console) and see what happens?

hiiamboris

[21:58](#msg603ac094d71b6554cd0ead1d)works fine

gltewalt

[21:59](#msg603ac0a8e562cf54ac89fa5b)ok

[23:19](#msg603ad394d1aee44e2db2f444)can we change the selection color when selecting text?

## Sunday 28th February, 2021

GalenIvanov

[09:56](#msg603b68e5e562cf54ac8b81f1)@toomasv Nice and elegant, as always!

toomasv

[12:55](#msg603b92ddb5131f4f28e1ae69)Thanks, @GalenIvanov !

[13:00](#msg603b93ecd71b6554cd10ac7c)@gltewalt With rich-text you can, not with other OS widgets.

[13:14](#msg603b9734b5131f4f28e1ba02)Adapted example from rich-text doc:  
\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/tyl4/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/tyl4/image.png)

henrikmk

[13:15](#msg603b9777e5f1d949d46cec8b)@hiiamboris I think I understand what you mean. you don't move multiple faces at the same time. if you were to randomly position A, B and C, you would do so, one at a time. the end result of D's size and position is the result of moving first A, then B and then C.

hiiamboris

[13:26](#msg603b99f7457d6b4a949327b3)I'm just unfamiliar with Web layouts and trying to picture the mechanics in my head ;)

henrikmk

[14:04](#msg603ba2d1b5131f4f28e1dc62)@hiiamboris I think this lies far away from weblayouts, IMHO, given that you have no control over the calculation order in weblayouts and weblayouts aren't really self reflective unless you use javascript.

hiiamboris

[14:05](#msg603ba31522a5ce4a9123ccf9)I thought this 9-point idea was borrowed from some web solutions. I don't know, so nevermind ;)

[14:07](#msg603ba392e8267a46f2e181eb)So. Let A B and C be just points, to which 3 top points of face D are tied. How does the upper margin of D move if we move A then B then C?

henrikmk

[14:09](#msg603ba3ffd1aee44e2db4f53c)It will be moving in accordance with the position of A. Then it will move in accordance with position of B. Then it will move in accordance with position of C. Note that when moving B, A and C also may move.

[14:18](#msg603ba622d71b6554cd10db64)It might make better sense to talk about calculation order in terms of parent/child relationship. Parent affects the child, but not the other way around.

hiiamboris

[14:23](#msg603ba77ca3a2f04f1fc3e36a)&gt; Note that when moving B, A and C also may move.

How so?

henrikmk

[14:25](#msg603ba7edd74bbe49e0c45869)The link could be bidirectional, but perhaps it shouldn't be, for simplicity.

hiiamboris

[14:27](#msg603ba85e44f5a454a4457656)OK so the way I picture it right now is that the vertical position of top margin of D moves as the average of (Ay, By, Cy)

henrikmk

[14:30](#msg603ba8f3d71b6554cd10e308)No, it would not. It would move distinctively as 100% relative to the vertex A, B or C that is currently moving. If evaluation is bidirectional, D is holding all vertices, A, B and C in fixed positions relative to each other.

[14:30](#msg603ba91cb5131f4f28e1ee06)If you draw 3 X's on a piece of paper, then place your finger on one X and move the paper, the other two X's will also move.

hiiamboris

[14:32](#msg603ba96a44f5a454a4457994)If evaluation is bidirectional, then I can't move A B and C relative to each other (long as D holds them)?

henrikmk

[14:35](#msg603baa22d1aee44e2db50562)You could move two at a time, but not three. If you move two, you scale D, similarly to pinch to zoom on a tablet.

[14:35](#msg603baa405d0bfb4e58794580)And you would have to specify both of them as pins.

hiiamboris

[14:51](#msg603bade55d0bfb4e5879517d)I scale D even if I move the two only vertically? Weird..

henrikmk

[15:54](#msg603bbc9fd2619a4f2e12c0f3)That depends on how much you move each one. If you move them equally much, then D will also just move.

[15:54](#msg603bbcacd1aee44e2db54134)I think I'm completely failing to explain this properly. Maybe I'll make a demo some day.

hiiamboris

[15:56](#msg603bbd41a3a2f04f1fc42696)OK ;) Thanks anyway

gltewalt

[21:33](#msg603c0c1795e23446e4034299)@toomasv Thanks.  
And, was I using your tictactoe wrong, or are there issues?

## Monday 1st March, 2021

toomasv

[04:12](#msg603c69a222a5ce4a9125d23f)Seem to be issues, but I have no clue what these are.

gltewalt

[22:53](#msg603d7059d2619a4f2e17aa4f)@toomasv I suspect this section of code, based on inserting `probe` in places

```
append face/draw either cross?: not cross? [
                        (probe cross?)
						[line 35x35 155x155 line 155x35 35x155]
					][
						[circle 95x95 60]
					]
```

[22:55](#msg603d70ed22a5ce4a9128e3a6)Best that I can tell right now, `face/data` remains `none`

## Thursday 4th March, 2021

gltewalt

[05:44](#msg604073b9d1aee44e2dc2576d)Can rich-text be used in fields and areas?

rebolek

[06:20](#msg60407c48d74bbe49e0d10ddd)in native ones no, you would need to make your own

hiiamboris

[09:02](#msg6040a237e8267a46f2ef52bc)No.

justinthesmith

[20:51](#msg60414843823b6654d2838bad)Hey folks. fill-pen bitmap seems broken on macos, can anyone confirm? This code works on Windows but shows an empty circle on macos.

```
picture: load https://homepages.cae.wisc.edu/~ece533/images/baboon.png
radius: divide min picture/size/x picture/size/y 2
view/tight compose/deep [
	base (to-pair reduce [2 * radius 2 * radius]) black draw [
;		image picture	;-- this works!
		pen white
		fill-pen bitmap picture
		circle (to-pair reduce [radius radius]) (radius)
	]
]
```

hiiamboris

[21:29](#msg6041514ee562cf54ac9bf38c)I can confirm that it works on W10 and GTK.

## Sunday 7th March, 2021

luce80

[09:40](#msg60449fa75d0bfb4e58916b86)About the recent discussion between @henrikmk and @hiiamboris I have made a \[quick sketch](https://i.postimg.cc/tRnmRHQN/resizing-rect.png) for possible reference and discussions . Obviously there are infinite possibilities and combinations, but I've tried to summarize the most used and useful ones. Also the HTML pages about tables and the various CSS layouting and positioning modes could be useful.

hiiamboris

[10:42](#msg6044ae095d0bfb4e58918c24)Thanks. Good reference.

[11:31](#msg6044b99f457d6b4a94ab8df0)For most of that to be possible with faces, VID has to transform from a \*lay out once* approach into \*re-lay out on demand using initial spec and preserving current faces objects intact* approach.

rgchris

[15:00](#msg6044ea92d74bbe49e0db7e1a)@hiiamboris Something for consideration—Rebol 2 allowed for this but didn't use it: having non-faces in the PANE block. I've considered the possibility of taking advantage of that to include some of the non-face keywords to retain that information. For example, if you say: \*\*at 50x40 some-face\*\*, to retain the \*\*at\** command (however it is to be reinterpreted), it'd be better to store that separately than tie it to \*\*some-face\*\*. My primary thought is to store them in blocks to avoid clutter and ignore keywords that are not recognised (for forward compatibility). Thus such a pane might appear thus:

```
...
[at 50x40]
#[some-face]
...
```

[15:03](#msg6044eb3695e23446e41b0a3f)It's still possible to get a cluttered pane this way, but you can remove \*\*some-face\** and still have subsequent siblings adhere to the positioning command in the way they do in the original \*\*layout\**

[15:05](#msg6044ebadd71b6554cd29b806)As to what would happen to \*\*at\** on resize? I don't know—it's kind of an awkward command to use in a dynamic layout.

gltewalt

[15:19](#msg6044eef0457d6b4a94ac1329)If you could use percentages of size? `at 5%x4%`

hiiamboris

[15:37](#msg6044f355823b6654d28ce1d3)@rgchris thanks, good thought to consider.  
However I should ask, why not just stash the original `layout` block and bind it's words to created faces. And then reparse it ignoring co.lo.rs, "text", but using geometric hints and values of words.

[15:39](#msg6044f3bfd74bbe49e0db9666)&gt; As to what would happen to \*\*at\** on resize? I don't know—it's kind of an awkward command to use in a dynamic layout.

`at` means location is fixed, so not for moving. Size on the other hand.. VID doesn't have enough info to deal with it yet, so it's up for extension dialect.

rgchris

[15:40](#msg6044f3ec95e23446e41b233f)You could—seems a lot more convoluted.

hiiamboris

[15:41](#msg6044f41ed2619a4f2e2bc0b3)Hmm. To me it looks simpler (:

rgchris

[15:41](#msg6044f41fd1aee44e2dce0a03)I'm not that much a fan of the layout block anyway, so perhaps a little biased against that

hiiamboris

[15:42](#msg6044f450a3a2f04f1fdcfb2b)Interesting. You prefer to manually lay out faces?

rgchris

[15:42](#msg6044f478d71b6554cd29d05d)I'd lean in that direction

hiiamboris

[15:43](#msg6044f49444f5a454a45e5b78)Any reason?

rgchris

[15:44](#msg6044f4e0d2619a4f2e2bc2e9)I don't think layout best reflects what the layout becomes or how it is used

[15:44](#msg6044f4fbd2619a4f2e2bc337)It's been a source of misconception since forever

hiiamboris

[15:46](#msg6044f5435d0bfb4e58924000)I've never felt this way. Can you recall an example?

rgchris

[15:46](#msg6044f551d74bbe49e0db99c9)Yes, everything!

hiiamboris

[15:49](#msg6044f5fc823b6654d28ce8b3)If you explained it, we would have a chance to make it better ;)

rgchris

[15:50](#msg6044f62ee5f1d949d4844327)I don't think it can be better—I think it's a flawed concept whose only virtue is quick construction of a layout

hiiamboris

[15:57](#msg6044f7cfe8267a46f2fa92ee)I prefer it to bare View every time I can.

rgchris

[16:00](#msg6044f88ab5131f4f28fb176c)I'd put more weight on getting the data structures in line with these considerations (such as my keyword suggestion) and build up vocabulary around that. Trying to filter everything through layout has been a mammoth amount of effort and it's still ongoing

toomasv

[17:29](#msg60450d8c95e23446e41b68af)\[!\[shadow](https://toomasv.red/images/Misc/shadow.gif)](https://toomasv.red/images/Misc/shadow.gif)

hiiamboris

[17:33](#msg60450e5fe5f1d949d4847c2a)Cool!

[17:34](#msg60450e9a823b6654d28d2f08)Since Draw doesn't have blur, do you apply 8 gradients?

toomasv

[17:35](#msg60450ed0b5131f4f28fb565f)Genuine shadows!!

hiiamboris

[17:42](#msg6045106fe5f1d949d4847fcb)What happens when blur radius becomes much bigger than shape size?

toomasv

[17:45](#msg60451141823b6654d28d35bb)It disappears, blends into background.

hiiamboris

[17:48](#msg604511d4b5131f4f28fb5ef4)If so, tricky work ;)

toomasv

[18:13](#msg604517c6120cd84f78fdfeb3)\[Here](https://toomasv.red/images/Misc/shadow2.gif)  
\[!\[shadow](https://toomasv.red/images/Misc/shadow2.gif)](https://toomasv.red/images/Misc/shadow2.gif)

greggirwin

[18:15](#msg60451843d74bbe49e0dbeefa)@toomasv Wow! Very cool. Nice work.

hiiamboris

[18:16](#msg60451866d71b6554cd2a31bb)Big spread + zero blur shows some glitch ;) But still great.

planetsizecpu

[18:27](#msg60451b20d2619a4f2e2c2d73)It is a good research @toomasv. Push hard!

hiiamboris

[18:36](#msg60451d38e5f1d949d484a125)I just realized we could simulate fast big radius blur of random shape by downscaling the image and upscaling back. A little pixelated, but if we make 2-4 copies offset by 0.5x0.5 px one from the other and then down&amp;upscale and combine back, pixelation goes away.

pekr

[18:38](#msg60451dbd5d0bfb4e5892aade)I know that Layout is not reentrant and there were some efforts with IDEs, modifying back original layout, but not having layout at all means that Redbol dialects fail a big way ....

toomasv

[19:02](#msg6045235295e23446e41ba55a)Try it out:

```
view [title "Did you know?" 
    box white 400x300 all-over draw [
        fill-pen silver 
        s: shadow 0x0 5 0 255.0.0 
        b: box 120x120 270x170 10 
        text 170x135 "Shadows!!!"
    ] 
    on-down [bc: b/2 + (b/3 - b/2 / 2)] 
    on-over [
        if event/down? [
            s/2: bc - (e: event/offset) * 30%         ;center
            s/3: 5 + round/to (sqrt (s/2/x ** 2) + (s/2/y ** 2)) * 20% 1   ;blur radius
            s/4: to-integer 160 - e/y * 10%           ;spread radius
]]]
```

greggirwin

[19:10](#msg60452537e8267a46f2fb0c88)On layouts and resizing. There is a central tension we may not be able to resolve. In one scenario VID is great, because you don't need anything more. In another scenario you have a complex resizable layout with multiple areas, user controlled splitters, and a mix of styles that may have different internal sizing constraints or connections (absolute, relative, anchors, transitions, padding/edges/margins). And let's add one more little feature into the mix: semantic layouts, a.k.a. responsive design.

Between those two extremes lie most software. The world has changed and people want shiny, they want transitions, they are on phones (which rotate their view) more than desktops, single-purpose UIs are wildly popular. Complex UIs UIs follow patterns, almost like everyone is using the same template. Chat App? 2-4 columns `[opt meta-nav | nav | content | opt details]` Mail client? \[5-pane layout](https://gist.github.com/greggirwin/b34b082ecdf17589a6f82ac4e23fff65).

Fixed layouts have a shortcoming in a phone context, where every app runs full screen. Atronix had a really cool "semantic zoom" feature in their ZOE system, where each UI element had attributes related to the current zoom level, so it could render itself appropriately. Their take on responsive design in an infinitely scalable world where a single UI might have 60K elements in it. That's right. 60'000.

A UI has to make the best use of the space available, which may be an 80" 8K display, HD desktop monitor, retina-based tablet, phone, watch, or even a single pixel. The latter sounds ridiculous, I know, but it isn't (think minimap). It also has to consider that a human is on the receiving end, otherwise it's an API, and that single pixel is an aggregate summary of state which may be further aggregated. :^)

Zooming back to a 1:1 view, the most basic apps (which are legion in number) need to be as easy to write as VID is now, resize enabled by default, and smart(ish) when not given any other clues. To me this says that styles each have standard resizing rules, they don't all have the same behavior by default. Buttons should not grow and shrink but content fields like areas should. And when one item is the primary content area, it becomes greedy about using space. That's not a percentage or size, just a facet. It may not be a logical one. Maybe `primary` and `secondary` map to weights but you could specify weights (importance to user) directly as well.

Under the hood, there may be simple and complex engines used to create the layout. We do need to normalize on what facets faces need, but that extra weight can just be ignore by the simple engine. The complex engine by it's very nature will have a lot more than can go wrong, and a lot more knobs and levers to twiddle. The idea then is to hide as many of them as possible behind templates and specialized layout wrappers. When you need fully custom control of every detail, you can look at what those tools generate to learn and write a lot of tedious code; but that should be 0.05% of apps (not an evidence-based estimate, but 0.01% sounded extreme). The rest of the time you find a close template to what you want, and when there isn't one, somebody builds it. And because of who we are ("we" being Red), those templates can be living, breathing things.

hiiamboris

[19:13](#msg604525c322a5ce4a913d50d7)@toomasv it works only for boxes currently? I'd love to make neon text and shapes with it ;)

greggirwin

[19:13](#msg604525cb22a5ce4a913d50e8)Holy cow @toomasv! It's `shadow-lab`. Does anyone know of paint programs that use this direct manipulation model for shadows?

[19:14](#msg6045261b823b6654d28d6d73)You don't ask for much, do you @hiiamboris. ;^)

hiiamboris

[19:14](#msg60452628120cd84f78fe2677):D

greggirwin

[19:16](#msg6045268bd71b6554cd2a55da)He gave you the source, the rest is an exercise for the reader.

[19:21](#msg604527bd95e23446e41bb073)I'm thinking there's a game here. There's a light source (the sun) and you have objects in the sky you position. The sun moves across the sky, and the shadows are cast like in @toomasv's raycasting demo. Your job is to have shadows hit or miss things on the ground as the sun arcs. Maybe you have fixed shapes to work with, or can create your own. Higher scores for the least number of shapes or their area used. Start with easy "total coverage" levels using different shapes. Then have plants that need sun, maybe they even grow and are worth more the bigger (more sun) they get. What if there are 2 suns or objects with different opacity?

hiiamboris

[19:22](#msg604527dad74bbe49e0dc152f)&gt; He gave you the source, the rest is an exercise for the reader.

Ellipse/circle works, triangle/line doesn't ;)  
Looks like WIP

toomasv

[19:22](#msg604527e022a5ce4a913d5675)Seems to work with boxes, ellipses and circles, yes

greggirwin

[19:29](#msg60452986e562cf54aca5b9c3)The game idea could even be done just like @toomasv's demo as a different kind of game, maybe as heist context. The source is the security scanner, and you have a limited number of items to use to conceal yourself in shadow. It could be interactive or turn based, where you plot your path then watch it play out. Interactively, you have to run from left to right, placing items as you go. Different scanner speeds, spreads, cycles, and styles come into play. Maybe at first you can just run, later you might have something you use to knock out the scanner, but need to be within range.

## Saturday 13th March, 2021

gltewalt

[17:35](#msg604cf7c744f5a454a4747ff7)Are conditional actors possible?

[17:35](#msg604cf7d222a5ce4a9152ed0d)`at 50x200 rule-field: my-field 700x40 pick [on-enter on-change] manual-check/data [check]`

[17:35](#msg604cf7e3d74bbe49e0f00d6d)Of course, can't in-line it like that

hiiamboris

[17:42](#msg604cf97fd71b6554cd40331d)`compose` is your friend

gltewalt

[17:55](#msg604cfc96e5f1d949d498bb9b)Yes, but I can't quite figure it out yet. It will run, but behaves as if the check is always true

[17:56](#msg604cfcbbe5f1d949d498bbd4)If I just compose a block.

hiiamboris

[18:25](#msg604d03aa457d6b4a94c2a1a9)`probe` can tell if it's true or not

gltewalt

[18:34](#msg604d05ca5d0bfb4e58a8d0c9)Is on-enter the default for a field?

[18:34](#msg604d05d1d71b6554cd4053ac)That would make sense

hiiamboris

[18:43](#msg604d07b5d74bbe49e0f03954)`?? system/view/VID/styles/field`

gltewalt

[18:44](#msg604d081ad1aee44e2de48b3e)Yup :)

## Monday 15th March, 2021

dsunanda

[21:44](#msg604fd52744f5a454a47c8355)Thanks to everyone a few weeks back for the feedback on the first demo of Rescaler - a VIEW reszing and rescaling utility.

There's another demo video here of the latest version (7 mins): https://we.tl/t-x5QlJvxev0

And an alpha release of the application here if you want to play with it: https://we.tl/t-0Jx0gNxuC4

If you do have a play, please let me know what you break - or what bits you want finished.

Thanks - and have fun!

hiiamboris

[22:09](#msg604fdb14457d6b4a94caa50c)You're bringing in too much complexity IMO (:

GiuseppeChillemi

[22:20](#msg604fdd90457d6b4a94caad50)@dsunanda wow, amazing work!

## Tuesday 16th March, 2021

greggirwin

[00:36](#msg604ffd89e8267a46f2195745)\*Very* cool @dsunanda!

pekr

[06:47](#msg6050549ed71b6554cd497a1b)A bit late to the discussion, but back to layouts. I would like to publicly thank to @hiiamboris , as he is doing excellent work with tickets and PRs! I liked the following discussion re layouts - https://github.com/red/red/pull/4734

The discussion about the layout being just a one way ticket is as old as Rebdbol (View) probably is :-) I do remember some discussions about re-layouts, being a two-way things. Those attemps usually ended with some models of resizing. I do remember ones from Romano Paolo Tenca, Dockimbel, Cyphre, Ladislav, sorry if I forgot others. Saphirion's R3 GUI had different models for various panel types.

I found it quite interesting, because - what I have also ALWAYS missed, was a Redbol GUI higher order concepts - the whole GUI is just basic widgets, which end-up with GUI organisation in tabs, which is fine for dialog boxes, but then? Shouldn't we start with just wired models of screens, panels, splits? Those being resizable, rescallable, with at least a bit predictable behaviour of not messing the elements around your screens?

I would even dare to call such new GUI system just Panels, Boxes, Rebox (which is close to popular Roblox :-) ), but the name surely does not matter much. Hence I am fully after Docs ideas in the above PR. I think, that Redbol GUIs really deserve an up-to-date aproach. The compatibility, and I REALLY mean it, is the last thing I would care for nowadays ...

toomasv

[07:58](#msg60506543b5131f4f281b1d7e)@dsunanda Great work! :+1:

dsunanda

[10:07](#msg6050837995e23446e43b46df)@hiiamboris @GiuseppeChillemi @greggirwin @toomasv  
Thanks for the comments guys - together we can turn it into somethig useful -)

hiiamboris

[10:24](#msg6050875495e23446e43b51a3)I like the custom resizing func idea, and I think I will add it to my resizing system, but I plan to reuse the `on-resize` actor instead of spawning a new thing. Have you considered/tried it?

ldci

[12:51](#msg6050a9cce562cf54acc5b206)Some very interesting way for GUI with Rebol by Ashley G Truter. Have a look here: http://www.dobeash.com/rebgui.html

dsunanda

[13:54](#msg6050b878d74bbe49e0fa91c5)@hiiamboris The core of Rescaler \*\*is\** the two actors ON-RESIZE and ON-RESIZING (one triggers when user drags the window; the other on Max/Min keys). We also may need to consider ON-ZOOM (I haven't looked at that yet).

Most of the Rescaler API is settings to control what happens the those actors trigger.

Steal as many ideas as you like from Rescaler :-) - The end goal is for there to be a good API for fluid and responsive LAYOUTs - I don't care whose API it is :)

hiiamboris

[15:00](#msg6050c7f7457d6b4a94cd55c2)&gt; The core of Rescaler is the two actors ON-RESIZE and ON-RESIZING (one triggers when user drags the window; the other on Max/Min keys).

That's not what I meant. Faces except `window` do not get this event, so why not use it in place of custom hinting function or how you call it.

[15:00](#msg6050c815d71b6554cd4acc66)`on-zoom` will work on Android only I think, so not quite useful yet.

dsunanda

[17:03](#msg6050e4e1120cd84f781eba82)@hiiamboris I think we may be talking at slightly cross-purposes here. The custom hinting is for cases like this:

```
view/no-wait [a: area 100x30 "I'm an Area" font [size: 10]
     b: button 50x50 "I'm a button" font [size: 11]
]
```

Whether by ON-RESIZING or API, swap the sizes of the faces. It is not entirely obvious (at least not to me) what the font sizes of the two faces should rescale to.

[17:05](#msg6050e554d2619a4f2e4d14f0)And hinting is made a bit more challenging as SIZE-TEXT is inaccurate - it claims that both of these fit their margins, but they don't - and by different amounts (at least not on my machine):

```
view/no-wait [a: text 50x50 "01234567" yellow font [size: 10]
     return
     b: button 50x50 "01234567" blue font [size: 10]
]
print size-text a
print size-text b
```

hiiamboris

[17:09](#msg6050e65b457d6b4a94cdbabe)`size-text` returns proper result: it tells you how big is the text that \*you see* inside \*that particular face*

[17:10](#msg6050e66ee562cf54acc67137)the text is clipped so it returns clipped result

[17:10](#msg6050e68bd71b6554cd4b3217)I'm not saying we don't need unbound size-text version. It just hasn't been designed.

[17:11](#msg6050e6d722a5ce4a915dec2b)I used the screen face for this btw.

[17:12](#msg6050e6fc44f5a454a47f8c53)But the idea of using size-text here is great :+1:

[17:23](#msg6050e9a9120cd84f781ece8c)I still don't see any practical use for changing font size though :D

[17:24](#msg6050e9d5b5131f4f281cb59c)When you resize a window, you do that to show more content, not because you're unable to read it.

GiuseppeChillemi

[17:48](#msg6050ef67e8267a46f21c1b6e)We are far from smoothly resizing/zooming 30.000 objects on the screen as does R3/Atronix GUI but it's a start!

dsunanda

[17:48](#msg6050ef8544f5a454a47fa568)@hiiamboris I suspect you have better eyesight than I do :)  
There are different usage cases....I can see usage cases when a user needs fonts resizing, and usage when they don't.  
The freeze.red script in the Rescaler demo is one example where font resizing may be useful :)

[17:52](#msg6050f06444f5a454a47fa93b)@GiuseppeChillemi :) Optimization comes after making things work (at least in my dictionary) - we're still experimenting with data structures (and debating priorities and needs). When they are settled. then we'll paint the go-faster stripes :)

hiiamboris

[17:53](#msg6050f083e8267a46f21c1f48)@dsunanda you actually reading EULAs? ;)

[17:55](#msg6050f113d74bbe49e0fb50b4)in any case, if you're the author of the scammy app, and you're deliberately making the font tiny, you're not going to let user increase it, otherwise what's the point ;)

dsunanda

[17:56](#msg6050f14be562cf54acc69492)@hiiamboris I read one once ....  
Zooming font sizes is a useful capability - whether or not it is coupled (loosely or otherwise) with resizing its container.

hiiamboris

[17:56](#msg6050f153e5f1d949d4a3f4f1)(that's probably why only button font scales for me)

[17:56](#msg6050f15ad1aee44e2def8dbf)(or I'm misusing it)

greggirwin

[20:42](#msg6051181ce562cf54acc7137c)Zooming and resizing are two different things IMO. However, testing in Gitter just now, zooming in the browser, because of the way rendering works there, the size of panels and such do change. So it's an interesting mix.

Jef Raskin's ZoomWorld was perhaps an inspiration for Atronix's ZOE, and aligns with a project I hope we can build with Red.

dsunanda

[21:00](#msg60511c70a3a2f04f1fff5527)There's deep rabbit holes all around with automated font sizing. Here's just the very start of a similar set of issues in CSS - trying to match an "ideal" default font size with the viewport - which is kinda important when a website designed for a desktop is viewed on a phone:  
https://css-tricks.com/simplified-fluid-typography/

hiiamboris

[21:24](#msg60512216457d6b4a94ce7a31)@ldci thanks for the link btw. Ashley's code is usually very pragmatic. I'll take a look later.

## Wednesday 17th March, 2021

ldci

[03:21](#msg605175a788edaa1eb8bf94f9)@hiiamboris. A sample of RebGui use for production apps.

[03:21](#msg605175b2bc554b42d6052fb0)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/TmAX/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/TmAX/image.png)

Respectech

[16:29](#msg60522e5388edaa1eb8c1af0c)Nice production app!

greggirwin

[17:33](#msg60523d8333346c16275ae1bd)\*Really* nice @ldci.

planetsizecpu

[18:37](#msg60524c64a7dfe1372edd2682)Looks well @ldci good job

## Thursday 18th March, 2021

ldci

[03:12](#msg6052c53628e6153d72279ecf)Thanks a lot. Now a pure red/redCV application.

[03:13](#msg6052c542f07ffa1eb54b2c9c)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/g4R7/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/g4R7/image.png)

[03:38](#msg6052cb29ac0fd631ca752f86)Red is sufficiently mature for daily use. Another sample of what we are doing at R2P2 platforrn (https://r2p2.tech)

[03:38](#msg6052cb3588edaa1eb8c36b91)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/kedW/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/kedW/image.png)

[03:51](#msg6052ce3028e6153d7227b4cb)in R2P2 we are involved in taking care of very immature patients with a lot of complications.

greggirwin

[04:25](#msg6052d63f563232374c28ab69)Wow! Wow! Wow! Go @ldci, Go! This is the kind of thing that keeps me fired up. We can make software better, and help people do good in the world.

toomasv

[05:00](#msg6052de629ebdfd16407fc365)@ldci Fantastic!

pekr

[05:26](#msg6052e4743b9278255bb81cc1)@ldci looks really nice. What are those apps doing? Watching the temperature? Would like to create a news on FB group.

GalenIvanov

[08:58](#msg605316373a9448256c132014)@ldci Amazing!

ldci

[09:03](#msg605317683a9448256c13229d)@pekr At R2P2 we are developing a lot of contactless systems for monitoring vital signs in premature, neonates and children Thanks everybody for your comments. I’m not a FB user.

TimeSlip

[16:10](#msg60537b923a9448256c14519d)@ldci Very cool!

## Saturday 20th March, 2021

wallysilva

[00:54](#msg605547c628e6153d722f3154)@ldci Amazing job!

rcqls

[12:15](#msg6055e77233346c16276542e8)@ldci :thumbsup:

## Sunday 21st March, 2021

ldci

[11:55](#msg6057343b3b9278255bc366f5)I don’t understand

[11:58](#msg605734f93a9448256c1dcdda)@ldci 2 facets: ar: area and hs2: h2. ar/font/color: red is OK. hs2/font/color: blue raises an error. Any idea?

hiiamboris

[12:34](#msg60573d46a7dfe1372eea35fe)forgot to define the font?

## Monday 22nd March, 2021

ldci

[01:41](#msg6057f5b3a7dfe1372eebe9f3)@hiiamboris Thanks:)

[02:29](#msg605801009ebdfd16408d1fbe)@hiiamboris. Problem is specific to macOS

```
*** Stack: view do-events do-actor do-safe update-font-faces 
*** Script Error: cannot access state in path none
```

No problem with windows

GalenIvanov

[11:41](#msg6058825868921b62f47b279e)Some WIP on generalization of regular and semiregular tesselations of the plane - only screenshots for now, I'll post the code when it's finished:

[11:41](#msg6058826c68921b62f47b27fe)\[!\[Tessel-Square.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/glGi/thumb/Tessel-Square.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/glGi/Tessel-Square.png)

[11:41](#msg605882762beb1e1da3c21a8a)\[!\[Tessel-Tri.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/aBM7/thumb/Tessel-Tri.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/aBM7/Tessel-Tri.png)

[11:41](#msg60588280c1e10242c5b67469)\[!\[Tessel-Hex.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/6tdj/thumb/Tessel-Hex.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/6tdj/Tessel-Hex.png)

[11:41](#msg605882868478e061b9513b62)\[!\[Tessel-Hex-Tri.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/yT4w/thumb/Tessel-Hex-Tri.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/yT4w/Tessel-Hex-Tri.png)

ldci

[12:23](#msg60588c3f3b9278255bc6b301)@GalenIvanov Really interesting :)

GalenIvanov

[12:25](#msg60588cb7563232374c3777da)@ldci Thank you!

greggirwin

[18:11](#msg6058ddc42beb1e1da3c33e97)Very nice! Do you give it the bounded region and it tesselates within that automatically?

[18:13](#msg6058de4ca7dfe1372eee6753)With what @ldci does on the imaging side, do either of you know if there is overlap in something like this? e.g., mapping data to tessellated tiles, maybe using different shapes, and comparing that against information from a mapped image.

ldci

[18:32](#msg6058e2c9c1e10242c5b7a961)@greggirwin Yes! Have a look here: https://cybertron.cg.tu-berlin.de/~philipp/EG2017/

GalenIvanov

[18:34](#msg6058e3522beb1e1da3c34ee3)@greggirwin Thank you! Right now I use a block with rules like `[x > 40 x < 460 y > 40 y < 460]`(for a simple square/rectangular area) or `[200 > sqrt (x - 250 * (x - 250) + (y - 250 * ( y - 250)))]` (for a circular region) as a boundary of the region of the plane to be tesselated. I use the center of gravity at the moment, but might switch to test of all points of the polygon.

greggirwin

[18:46](#msg6058e60588edaa1eb8d359ef)Wow! Thanks for that link @ldci and the info @GalenIvanov. I love how playing in Red produces things that complement each other from different areas. And now when I build my geodesic dome home it will be easy to see how good the insulation is. ;^)

[18:49](#msg6058e6a6a7dfe1372eee7fc7)@GalenIvanov if @ldci wants you to do R&amp;D on this, that aligns with what he's working on, we will sponsor it.

GalenIvanov

[18:58](#msg6058e8d5bc554b42d619061a)Thank you! I need to clarify that, when finished, my code will be capable of generating \[regular](https://mathworld.wolfram.com/RegularTessellation.html) and \[semiregular](https://mathworld.wolfram.com/SemiregularTessellation.html) tesselations of a region of the plane, represented as a doubly linked structure - each cell is connected to its neighbors.

greggirwin

[19:00](#msg6058e939ac0fd631ca85249e)\*Very* cool. We should talk about this more.

ldci

[19:00](#msg6058e945f07ffa1eb55b1ebd)@GalenIvanov That would be wonderful to coordinate our approaches :)

greggirwin

[19:01](#msg6058e99d9ebdfd16408faa44)I can feel @toomasv being tempted as well. He can consult in his spare time. :^)

GalenIvanov

[19:02](#msg6058e9c488edaa1eb8d3653a)@ldci Yes, it would be great! You'll see my approach here.

[19:02](#msg6058e9e2563232374c38a038)@greggirwin :smiley:

ldci

[19:04](#msg6058ea253a9448256c222d75)@GalenIvanov I also appreciate tout code for L-System. Very nice.

toomasv

[19:14](#msg6058eca968921b62f47c7150)Nice work, @GalenIvanov! Waiting to see it flourishing.

GalenIvanov

[19:48](#msg6058f49fac0fd631ca8546fd)@ldci @toomasv Thank you!

## Tuesday 23th March, 2021

planetsizecpu

[06:50](#msg60598f9e3a9448256c23e9b2)Good job Galen, amazing :-)

GalenIvanov

[08:11](#msg6059a2963b9278255bc9aad2)@planetsizecpu Thank you!

## Wednesday 24th March, 2021

gltewalt

[01:44](#msg605a9983c1e10242c5bc4ed5)Before combing through GUI console source - is there a painless way to redirect Red output to a face?

greggirwin

[02:13](#msg605aa05e3b9278255bcc6ac0)No. Hack at `do-command` in the console object.

[02:17](#msg605aa1313b9278255bcc6ca5)Somebody did some experiments a long time ago, popping up a Help GUI from the console, IIRC.

[02:17](#msg605aa1433b9278255bcc6cd9)Maybe @toomasv or @maximvl.

toomasv

[06:39](#msg605ade9a28e6153d723d117e)@gltewalt D'ya mean something like that :point\_up: \[June 11, 2020 4:36 PM](https://gitter.im/red/sandbox?at=5ee2335e7a7f8d2d632baf71)?  
(Series of posts on this starts on June 3, 2020 and ends on June 19, 2020.)

gltewalt

[06:46](#msg605ae05788edaa1eb8d8bab0)May not need to be as advanced. I want to "redirect" the output of any code that can be used in parse to the tool. For example if probe is used in the rule, the output goes to a text area. Of coursw and Red code can be used within ( ), so im not sure.

[06:49](#msg605ae1013a9448256c27700e)Another unrelated thing... what size do you generally make your windows? Space is going to get tight with 800x600

[06:52](#msg605ae1a53b9278255bcd0d75)Note: I haven't had a chance yet to look at do-command or work on the idea

toomasv

[06:53](#msg605ae1dac1e10242c5bd06f5)Generally I make windows resizable, changing faces sizes/offsets on resizing event.

hiiamboris

[08:15](#msg605af53d3a9448256c27a5ea)Just redefine prin, print?

gltewalt

[11:09](#msg605b1e0068921b62f4823ace)That's the first stop

GalenIvanov

[14:29](#msg605b4cd9f07ffa1eb5618bc0)Software bugs are the key to the modern art:

[14:30](#msg605b4ce8563232374c3f09bb)\[!\[Tessel-Square-Tri-buggy.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/1i6U/thumb/Tessel-Square-Tri-buggy.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/1i6U/Tessel-Square-Tri-buggy.png)

planetsizecpu

[14:30](#msg605b4d129ebdfd1640962c3c)😀

hiiamboris

[14:36](#msg605b4e539ebdfd1640962f60):D

GalenIvanov

[14:48](#msg605b512cc1e10242c5be50c3)Btw, I made some progress:

[14:48](#msg605b51413a9448256c28a7e1)\[!\[Tessel-Octa-Square.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/oUo1/thumb/Tessel-Octa-Square.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/oUo1/Tessel-Octa-Square.png)

[14:48](#msg605b5150ad83ec3d7d4ee8ef)\[!\[Tessel-Hex-Square-Tri.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/6ktI/thumb/Tessel-Hex-Square-Tri.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/6ktI/Tessel-Hex-Square-Tri.png)

dsunanda

[14:53](#msg605b526828e6153d723e5865)@GalenIvanov Fantastic stuff - you may be on the way to creating the killer Red app :)

GalenIvanov

[14:56](#msg605b531f28e6153d723e5ae8)@dsunanda Thank you! Red makes it possible!

[14:58](#msg605b539633346c162772ed75)Hmm, I think there wasn't a bug in the program, but in the rules I gave it - apparently the symmetry of this particular tiling is more complex that I thought.

hiiamboris

[15:13](#msg605b5700a7dfe1372ef5001e)Next step: tile rooms of user-provided geometry ;)

GalenIvanov

[15:13](#msg605b571ac1e10242c5be62c4):smile:

hiiamboris

[15:14](#msg605b57583a9448256c28bac0)And step 3: let user provide own tile photos :)

greggirwin

[16:09](#msg605b64313b9278255bce858c)The images are hypnotic. Nice work @GalenIvanov.

[16:15](#msg605b658e8478e061b95956b8)In the vein of Go (the game), you could have a tessellation based board game, where your goal is to use the shapes you have to maximize coverage. Your opponent may have the same or different pieces, and the board may be different shapes. The AI opponent is already almost done, except for strategy. :^)

## Thursday 25th March, 2021

GalenIvanov

[09:13](#msg605c542d88edaa1eb8dcc490)@greggirwin That's an interesting idea, well worth exploring. I'll certainlt make mazes using these tilings.

[15:07](#msg605ca71af07ffa1eb56550bc)Today's update:

[15:07](#msg605ca72428e6153d72420c5c)\[!\[Tessel-Hex-Tri-Tri-color.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/qduQ/thumb/Tessel-Hex-Tri-Tri-color.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/qduQ/Tessel-Hex-Tri-Tri-color.png)

[15:07](#msg605ca743ad83ec3d7d52a30e)

```
rules: [hex:  [120 tri1 120 tri1 120 tri1 120 tri1 120 tri1 120 tri1]
        tri1: [60 hex 60 tri2 60 tri1]
        tri2: [60 tri1 60 tri1 60 tri1]]
```

[15:09](#msg605ca7a1bc554b42d6232b7b)And color according to the cell type (not the polygon type) - there are two types of triangles according to their connectivity.

[15:10](#msg605ca7e33b9278255bd20aa7)

```
append grid pick [pink olive sky] index? find ["hex" "tri1" "tri2"] cell-type
```

Respectech

[17:43](#msg605ccbc1a7dfe1372ef91603)Mesmerizing...

greggirwin

[18:05](#msg605cd0ef9ebdfd16409a87cd)Beautiful. That kind of pattern as a maze would be \*really hard.

[18:14](#msg605cd2ebbc554b42d623b742)Another fun one for mazes would be writing Turtle code to solve them. Get your turtle through the maze with code. That could be \*really* interesting in a number of ways. If your turtle \*can't* complete a command. e.g. you said `forward 10` but there are only 8 spaces, does it hit the wall and bounce? Is it a syntax error? Do you have to write the whole program at once, or can you go step by step, then mark points in your script to branch from if you get stuck? Can you write a generic right-turning solver or is that cheating? Has anyone done anything like this?

I never played Code Wars, but \*loved* RoboSport. These are the kinds of games we can build with Red, as well as physics-based puzzle games.

[18:19](#msg605cd44d3a9448256c2ce5b5)Everyone should look at https://github.com/GalenIvanov/Games if you haven't already. Great stuff. And @planetsizecpu has shown what can be done in the old arcade style as well. He's done it the hard way, because he was the first. What we need is a core engine to help make things easier. We'll get there.

GalenIvanov

[19:02](#msg605cde4668921b62f48740fc)@Respectech @greggirwin Thank you!

[19:03](#msg605cde98f07ffa1eb565faf4)The Turtle is an interesting idea.

planetsizecpu

[19:05](#msg605cdee333346c1627774a46)Thx @greggirwin being the first is like an honour for me. I did it for learning Red and also learned about making games, but it wasn't too hard at all because I had a lot of fun. As you know, I'm not so much experience in graphics programming, because I did my job in old character mode for unix systems, so the game was a unvaluable experience also for this reason. I wonder that some day would be able to design business apps as I did before 😀

GalenIvanov

[19:06](#msg605cdf2228e6153d7242bfc1)A core engine would be great. I also like to try to make a 2D vector animation editor.

## Saturday 27th March, 2021

wallysilva

[06:37](#msg605ed296a7dfe1372efeb197)@GalenIvanov Great work with the games and Wiki!

GalenIvanov

[09:10](#msg605ef6902beb1e1da3d3d047)@wallysilva Thank you! There will be more.

hiiamboris

[09:39](#msg605efd3abc554b42d6299160)@GalenIvanov you should add the rest of your works to the showcase https://github.com/red/red/wiki/\[LINKS]-Projects-showcase-(links-to-remember)

GalenIvanov

[10:11](#msg605f04b5ad83ec3d7d591ee6)@hiiamboris Thanks for reminding me! I'll add them.

## Sunday 28th March, 2021

qtxie

[02:49](#msg605feeac3a9448256c34fca7)&gt; @hiiamboris. Problem is specific to macOS  
&gt;

```
> *** Stack: view do-events do-actor do-safe update-font-faces 
> *** Script Error: cannot access state in path none
>
```

&gt; No problem with windows

@ldci Pushed a fix. :-)

ldci

[07:11](#msg60602c1e8478e061b9661c80)@qtxie Thanks a lot.

## Monday 29th March, 2021

planetsizecpu

[08:32](#msg60619098eb800601df070420)I'm used to test as much as Red automatic builds as I can, so today I had a bit of fun while testing on L3 😄

[08:33](#msg606190d46831fa2647d14f0c)\[!\[cavetest33.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/vopj/thumb/cavetest33.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/vopj/cavetest33.gif)

[08:34](#msg606190f8679f465566aaf15b)It seems everything works well

GalenIvanov

[10:14](#msg6061a887eb800601df0748c3)@planetsizecpu Great!

greggirwin

[16:06](#msg6061fb1b14188a5edfd180d6)That's great @planetsizecpu. I don't remember seeing the output console before. Is that new?

planetsizecpu

[17:09](#msg606209b3940f1d555e27141b)Thx guys. Not new @greggirwin I just leave it on background to show debug info. One thing I can't show here, that is fun, is closing the view game window, so you can manipulate objects as for example lives attibute and restore the window again to play 😁

[17:12](#msg60620a8447b0403241a80f75)But to show here then the GIF file turns too heavy for upload

## Friday 2nd April, 2021

planetsizecpu

[11:08](#msg6066fb130508990a25ccf94f)This is all that is needed to build a new level, this Easter holidays I start the new level 16 😃

[11:08](#msg6066fb24db595f5599ce9e68)\[!\[cavetest161.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/xVVu/thumb/cavetest161.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/xVVu/cavetest161.gif)

[11:10](#msg6066fb9856ddab18d72532eb)I am wanting to enable a lot of agents and test how it goes.

greggirwin

[19:39](#msg606772eb89446618e981109f)Nice! Templates and "level" editors are powerful aides in applications.

## Sunday 4th April, 2021

GiuseppeChillemi

[09:23](#msg606985a6657d022d5a5f80a0)If anyone is interested, there is a lot of material linked here, covering any type of rendering engine:  
https://github.com/davidgm94/engine-resources

planetsizecpu

[11:29](#msg6069a335ed315705c298ce0f)Now testing this scenario with eight agents, somewhat difficult IMO

[11:30](#msg6069a35a92a3431fd6746ec9)\[!\[cavetest162.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/CGRv/thumb/cavetest162.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/CGRv/cavetest162.gif)

[11:31](#msg6069a3901dbd860a232ebe82)I would have to place some pickaxes 😌

greggirwin

[18:54](#msg606a0b4c458fc52d5f2db670)Playability and game design are where the magic lies.

[18:54](#msg606a0b5d156d1f51d8cf3a7c)Nice find @GiuseppeChillemi. Thanks!

[19:02](#msg606a0d5d63fb5651c1edea76)Lots of low level stuff. Wish there was more on high level engine design. But when we go there with Red, we'll be able to rethink old ideas anyway.

GalenIvanov

[19:09](#msg606a0ee4ed315705c299c329)@planetsizecpu Looks nice!

## Monday 5th April, 2021

ingvast

[14:01](#msg606b182b1dbd860a2332065f)Hi  
In rebol draw I have often used the design pattern

```
view/new layout [ bx: box 300x300 effect[ draw[  push a push b ]]]
```

and then have something change the blocks `a` and `b` and `show bx`  
In red, the blocks needs to be put there explicitly so I thought something like

```
view layout compose/deep [ bx: box 300x300 draw [ push  ( reduce [ a ] ) push (reduce [b] ) ] ]
```

would work. However, when changing `a` or `b` and `show bx` the content does not update.  
It seem I need to change something directly in the block bx/draw for any changes would take effekt.  
Therefore I believe there must be a way to force the reparsing of the draw.  
How can I force the reparse of the draw block?

henrikmk

[14:23](#msg606b1d520508990a25d64806)@ingvast Red doesn't bind draw blocks, while REBOL does. This is really a limitation, unfortunately. AFAIK, you will have to re-assign the draw block in order to have it reparsed, or poke new values directly into the block.

ingvast

[14:28](#msg606b1e9bed315705c29c228e)@henrikmk But if I change the blocks included like `a` and also changes anything else in the draw block of the first level then also the changes in `a` appears.  
I agree that it is unfortunate that one cannot include variables into draw, but can understand it can slow it down considerably. So I have some understanding for the design choice.

hiiamboris

[14:33](#msg606b1fae15cd52559d7f24d6)@ingvast a few tips:  
1\. use `compose/only/deep` to put blocks into your draw block  
2\. use set-words to mark positions in the draw block (between draw commands), e.g. `a-anchor: push (a) ...` then you would change it like `a-anchor/2: new-a`  
3\. for better performance do bulk changes on an external block, then assign it to `draw:` just once (saves you from extra `on-deep-change*` calls and redraws if you haven't disabled them)

ingvast

[14:58](#msg606b2593458fc52d5f30267c)@hiiamboris I did not know about set-words. I'll try that pattern

greggirwin

[15:03](#msg606b26c6d765936399d631c5)https://github.com/red/docs/blob/master/en/draw.adoc#source-position

henrikmk

[15:15](#msg606b29a189446618e9895307)&gt; I agree that it is unfortunate that one cannot include variables into draw, but can understand it can slow it down considerably. So I have some understanding for the design choice.

It should not cause slowdowns, since the parser should convert the draw dialect into draw instructions once. When that is done, values should be directly accessible for the draw engine, and the user should be able to change those values without having to reparse anything. In Red, this parsing is constantly done on the fly, building draw instructions, one instruction at a time. This is really slow.

In REBOL, AFAIK, the block is only parsed, when needed. REBOL draw is fairly quick, if you treat a draw block as a fixed structure with bound values. It also allows draw blocks of much, much greater complexity, since you can bind thousands of values in a draw block to values in another block.

However, neither of them posses a controllable draw queue, and if they had that, draw would be even faster, since things could truly be drawn at Red/System or C speeds.

hiiamboris

[15:49](#msg606b3181156d1f51d8d1ccd9)"controllable draw queue" what's that and how can it speed draw up?

henrikmk

[16:15](#msg606b37b10147fb05c5daa33e)The draw engine should focus on simply traversing a list of draw instructions as quickly as possible with pointers to coordinates and color values. Shapes are more constant. That's the draw queue. If you change a single value (red box instead of blue), you simply execute the draw queue again. Having multiple draw queues allows instancing and generating primitives.

hiiamboris

[16:23](#msg606b399aed315705c29c69b6)you mean instead of Red block it would just use some intermediate lower-level list? unlikely that will be noticeably faster than block

henrikmk

[16:26](#msg606b3a2f92a3431fd677fcbc)This would not be on the Red level, but on Red/System level. This would be extremely much faster than a block. Probably 10-100x faster.

hiiamboris

[16:26](#msg606b3a4656ddab18d72ee24f)but Draw is written in R/S

[16:28](#msg606b3ac89ecc541fc8dae836)https://github.com/red/red/blob/9d91cdd273a9c9f7851d7a3a70750a3b77b22f71/modules/view/draw.red#L572

henrikmk

[16:28](#msg606b3ac992a3431fd677ffb8)Draw in R/S interfaces with the underlying draw engine very poorly, since you are forcing PARSE to perform draw calls instead of using PARSE to build a draw queue and then passing that to the draw engine.

hiiamboris

[16:30](#msg606b3b090508990a25d69ad8)No, Draw isn't using Parse at all.

henrikmk

[16:30](#msg606b3b323153ce63a3be94d4)It parses the draw block.

hiiamboris

[16:30](#msg606b3b330508990a25d69b09)Look at the link above. It's a simple R/S `while` loop across the block.

henrikmk

[16:31](#msg606b3b45d765936399d668f9)Yes, I have already studied the code extensively.

hiiamboris

[16:31](#msg606b3b539ecc541fc8dae925)So where is a call to Parse?

henrikmk

[16:31](#msg606b3b5c56ddab18d72ee493)Correction, not PARSE, but parsing happens.

hiiamboris

[16:32](#msg606b3ba5ed315705c29c7165)I think it's efficient. Switch on a command word followed by bulk fetching of pairs.

henrikmk

[16:33](#msg606b3bc1d765936399d66a61)There is no efficiency in repeatedly reparsing the same block over and over. Sorry.

hiiamboris

[16:36](#msg606b3c9063fb5651c1f090c1)Not true. I would agree that \*building OS structures* out of Draw pair list every time is inefficient. But then, holding those resources in case they would be needed again is one level up in complexity and smells of premature optimization.

[16:37](#msg606b3ccd15cd52559d7f78e9)No one would stop you from profiling &amp; enhancing it though ;)

henrikmk

[16:41](#msg606b3daa458fc52d5f3076e6)"But then, holding those resources in case they would be needed again is one level up in complexity and smells of premature optimization." - or you can use draw queues.

pekr

[16:41](#msg606b3dbd63fb5651c1f0938f)-pekr- smells some gfx enhancements possibilities making Draw faster than Chuck Norris, then hiiamboris says Chuck Norris is already involved :-)

hiiamboris

[16:42](#msg606b3deb156d1f51d8d1ebdd):D

[16:47](#msg606b3f0bd765936399d672da)@henrikmk it doesn't matter how you call it, it's a memory arrays with coordinates in OS-accepted format, and images in native OS form. Those, if cached, would make it faster. Though with a cost of RAM, and effort to write and test that on all platforms.

henrikmk

[16:48](#msg606b3f673153ce63a3be9f0e)@hiiamboris the RAM cost would be very negligeble. it very much matters how you call it. testing it should be fairly simple, since it's only a direct interface to the underlying draw engine.

hiiamboris

[16:50](#msg606b3fb80508990a25d6a8dc)Depends ;) Images for example can be huge (and they are the slowest Draw operation so far)

henrikmk

[16:51](#msg606b3ff492a3431fd6780aff)isn't that a limitation of the compositor? how do you point bitmaps to the draw engine?

hiiamboris

[16:51](#msg606b4027ed315705c29c7ff9)not sure what you mean

henrikmk

[16:53](#msg606b408d15cd52559d7f83e3)"images" do you mean images that you draw on, or images that are used to draw with?

hiiamboris

[16:54](#msg606b40a992a3431fd6780cc0)the latter

[16:59](#msg606b41ebdb595f5599d83a21)I can't say actually whether current version does any conversion of images during draw or not, without jumping thru all the loopholes in the code.. IIRC previously there were multiple ways to render an image - GDI or GDI+. Now maybe it's all in D2D format.

henrikmk

[16:59](#msg606b41f79ecc541fc8dafc33)ok

hiiamboris

[17:00](#msg606b42181dbd860a23327d29)So yeah after that it would make sense to use simpler than block structures. And then JIT compilation (to minimize the number of conditions). But then idk if it's worth it at all.

henrikmk

[17:05](#msg606b437589446618e9899d97)Having done experiments with my own C based draw library in REBOL tells me there are huge performance gains to be had, particularly, when you're drawing thousands of primitives and the thing that is only happening, is that those primitives transform or change color.

hiiamboris

[17:09](#msg606b444d15cd52559d7f9177)In REBOL there was no `on-deep-change*` or anything that would tell you that only N1 to N2 positions in the Draw block were changed, so you could rebuild only some of the cached internal structures. Or was there?

henrikmk

[17:11](#msg606b44be15cd52559d7f9319)I don't think there is one, but simply changing bound values is clearly, absolutely much faster than reparsing the draw block, so there is some form of caching happening.

hiiamboris

[17:12](#msg606b44e163fb5651c1f0a72b)Ah I see.

[17:12](#msg606b450563fb5651c1f0a768)Maybe we should REP all these ideas..

## Saturday 10th April, 2021

luce80

[09:23](#msg60716e7897cf506746530591)I hope that @henrikmk will translate his experiments from C and REBOL to R/S and Red and then let us (non Red Team members) use those "creatures".

planetsizecpu

[10:54](#msg607183fe55d78266a6372c78)Today pushed online the new level L16, but maybe it needs some changes as it must be full tested. 😄 My home PC need to be updated too, as it can be seen on the slow objects movement, it is related to the high number of objects affected by the gravity function.

[10:55](#msg6071841881866c680c1507eb)\[!\[cavetest165.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/cQeq/thumb/cavetest165.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/cQeq/cavetest165.gif)

GalenIvanov

[14:04](#msg6071b05697cf5067465399e4)@planetsizecpu :+1:

greggirwin

[21:43](#msg60721c0b06e2e024e84645f4)Very cool. Are you still drawing the levels by hand @planetsizecpu ? The more complex they get, the harder that must be.

## Sunday 11st April, 2021

planetsizecpu

[07:48](#msg6072a9c755d78266a6399feb)Thx @GalenIvanov

@greggirwin Yes, all is hand made, I mainly use paintbrush for the background design and also pixelformer if there are transparencies. For the configuration file I always use notepad. I like simple things without dependencies.  
After months without touching it, it is difficult to remember some rules to design the framework of the stage so that the guards can move freely. For example, the ceiling over stairs must be at the right pixels distance, so they stop climbing. Or the walls on the stairs side, must have a minimum tickness, so they not fall down. It is a matter of play and test. This is how the config file looks:

[07:48](#msg6072a9ccd7953918614ecb43)\[!\[Conffile.jpg](https://files.gitter.im/55b1d8290fc9f982beaacceb/o5Ti/thumb/Conffile.jpg)](https://files.gitter.im/55b1d8290fc9f982beaacceb/o5Ti/Conffile.jpg)

[07:49](#msg6072aa17a9dd556843cf3686)In the end I have left five guards, so don't stress the CPU.

[08:08](#msg6072ae801f84d71853ad8de1)If you look at the tenth field, a one indicates that the object is affected by the gravity function, that large number of objects slows the main cicle, but I decided to shorten the guards number instead of deleting gold bags. 😁

[08:26](#msg6072b2a7b6a4714a29b94d82)\[!\[cavetest166.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/GPbS/thumb/cavetest166.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/GPbS/cavetest166.gif)

ldci

[09:03](#msg6072bb5eae90f36840739c06)@planetsizecpu Thanks it’s running perfect with macOS :)

planetsizecpu

[09:13](#msg6072bdca81866c680c17a9d7)Oh thx François happy to hear that

[09:36](#msg6072c31655d78266a639d878)There is also the gold question. The collected bags are deleted from the face tree, so the gravity loop is shorter and faster along the game, it may seem an issue but is not. That allows the guards to go smarter because they know the gold is vanishing. 😆

## Saturday 8th May, 2021

planetsizecpu

[18:16](#msg6096d5790845c416dcd0400c)Just to show how the climbing function on the guards stops, here is the ceiling check func, I deleted intentionally the upper ceiling on the stage:

[18:16](#msg6096d57e75aeb43be73540dc)\[!\[CheckCeiling.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/qtga/thumb/CheckCeiling.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/qtga/CheckCeiling.png)

[18:17](#msg6096d5a5d5e2793379fd4e88)\[!\[cavetest156.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/jfKb/thumb/cavetest156.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/jfKb/cavetest156.gif)

hiiamboris

[18:18](#msg6096d5f2f7e4221825c5b54d)`CheckPointR: CheckPointL + FSize/x`

[18:20](#msg6096d67d4d0065337e5f0181)I guess your code is huge :)

planetsizecpu

[18:21](#msg6096d6a0963923553aefbe2f)It is 😆

[18:22](#msg6096d6e2d964ec55389964ba)The mezzanines file is 1550 LOC

hiiamboris

[18:22](#msg6096d6f331d2306a0e9b7878)wow ☻

planetsizecpu

[18:24](#msg6096d74698ee821821b8c938)I loved

```
if any ...
```

as there are a lot of things to check

[18:26](#msg6096d7d22cc8c84d851a6007)See this

```
if any [face/extra/type = "G" face/extra/type = "T" face/extra/type = "W" face/extra/type = "D"]
```

hiiamboris

[18:26](#msg6096d7db0056b2262c384200):D

planetsizecpu

[18:26](#msg6096d7e8c651cb6a001d743d)🙄

hiiamboris

[18:26](#msg6096d7ed31d2306a0e9b7aa4)why not just `if find "GTWD" face/extra/type`

planetsizecpu

[18:27](#msg6096d82220d4f02631ad9d95)mmm good catch, but take in mind I'm learning and not so used to

```
find
```

[18:28](#msg6096d83dd964ec553899677f)I guess that would speed the game

hiiamboris

[18:28](#msg6096d85093ac573bba907f75)you must probably come from some object-oriented lang, like C++ or Objective-C or Java ;)

[18:29](#msg6096d87275aeb43be73546ce)that's what this coding style reminds me of ☺

planetsizecpu

[18:29](#msg6096d8740056b2262c3843c3)Well, more from COBOL or BASIC

hiiamboris

[18:29](#msg6096d8964d0065337e5f05a1)The old BASIC wasn't that verbose, but VB surely is

planetsizecpu

[18:30](#msg6096d8ca0845c416dcd04663)And I also used some other dead lang :-)

## Sunday 9th May, 2021

GaryMiller

[13:03](#msg6097dd920845c416dcd27e93)  
The thing I miss about VB was it was so popular that you could find a control to do anything you wanted.&gt;

## Monday 17th May, 2021

planetsizecpu

[14:48](#msg60a28233b10fc85b569fb1b6)Just curious, should `below` set the blue box under the green?

[14:48](#msg60a282359f2c352db11561bd)\[!\[below.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/RbHx/thumb/below.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/RbHx/below.png)

hiiamboris

[15:19](#msg60a2898517d35f3d9fd112f9)that's the thing, you should put below \*before* the other face

[15:20](#msg60a289a4e263442db8329dc2)see https://github.com/red/red/issues/4733 for more info

planetsizecpu

[16:19](#msg60a2979cd523ee3d3e3aa89f)Ah it is reported, THX.

## Tuesday 18th May, 2021

GiuseppeChillemi

[08:40](#msg60a37d795ca66330b04d507a)Do we have an `ID` face word to assign a face identificator at creation? (I would like to not `face/extra` to not complicate the structure I am going to store there and it should be independent from the`set-word` I have used at face creation).

[09:03](#msg60a382e401edef5b505062cd)\*to not use

hiiamboris

[09:20](#msg60a386fb5fff1f4a98e36150)

```
>> system/view/VID/styles/my-face: [template: [type: 'base id: 'my-id my-facet: [my-data]]]
== [template: [type: 'base id: 'my-id my-facet: [my-data]]]
>> ? (make-face 'my-face)
     type             word!         base
     offset           none!         none
     size             pair!         0x0
     text             none!         none
     image            none!         none
     color            none!         none
     menu             none!         none
     data             none!         none
     enabled?         logic!        true
     visible?         logic!        true
     selected         none!         none
     flags            none!         none
     options          none!         none
     parent           none!         none
     pane             none!         none
     state            none!         none
     rate             none!         none
     edge             none!         none
     para             none!         none
     font             none!         none
     actors           none!         none
     extra            none!         none
     draw             none!         none
     on-change*       function!     [word old new /local srs same-pane? f...
     on-deep-change*  function!     [owner word target action new index p...
     id               word!         my-id
     my-facet         block!        length: 1  [my-data]
```

GiuseppeChillemi

[12:53](#msg60a3b8d917d35f3d9fd423ac)I didn't know about this feature. I have taken a look at the source of make-face, it seems the base face if extended via models, doesn't it?

[12:54](#msg60a3b915233397424dcd581f)So your are adding `type`, `id` and my-`facet`

[12:57](#msg60a3b9a3c12aec4aa2d18654)But how do you tell VID that all faces shoudl have `ID` too? Because you can use the template only on `make-face`

[12:59](#msg60a3ba3ac12aec4aa2d187a8)

```
view [button "Hello" with [id: 'iamid] [probe words-of face]]
```

[12:59](#msg60a3ba4601edef5b5050f349)Hit "hello"

hiiamboris

[13:00](#msg60a3ba629f2c352db1187d0a)`view [my-face "hello" ...]`

GiuseppeChillemi

[13:03](#msg60a3bb0f6a950f3d46f13d5e)`My-face` is not a button, so you have to redo the button template?

hiiamboris

[13:04](#msg60a3bb5e233397424dcd5f88)yep

GiuseppeChillemi

[13:19](#msg60a3bef65ca66330b04df9d1)It would be nice if there is a way to patch the base face template, could it be possible?

hiiamboris

[13:24](#msg60a3c003c60a604255c8257a)System/view/vid/styles

GiuseppeChillemi

[14:07](#msg60a3ca07c12aec4aa2d1b65b)I have taken a look at `system/view/VID`, it seems there is no `FACE` prototype but it is build procedurally with `system/view/VID/styles` being only a container with just a little part of the whole `FACE` prototype.

hiiamboris

[14:26](#msg60a3ce9d17d35f3d9fd46695)And?

GiuseppeChillemi

[17:35](#msg60a3fad96a950f3d46f1ec81)@hiiamboris  
I expected "yes, your are right!". :-)  
So you modifiy the template for a particular style and you have the `ID` for that style but I ask to myself, why not having a base starter style or a face proto to have the change inherited to all faces and styles at creation?

hiiamboris

[18:16](#msg60a4046c01edef5b5051c840)I agree with you, but that's not the way it is

[18:16](#msg60a40487416d8734b95320ed)in fact, changing face! datatype will lead to problems and maybe crashes

GiuseppeChillemi

[19:06](#msg60a4101ad523ee3d3e3e7e72)I am far from my PC but I remember having seen a `ops-proto` or something like it in `system/view/VID`and it contains most of face's attributes it would be interesting poking into it.

## Wednesday 19th May, 2021

GalenIvanov

[13:30](#msg60a512e011fe9c1aa471ad1b)Some new work - \[Slime mold simulation](https://github.com/GalenIvanov/Graphics-Red/blob/master/Slime%20mold%20simulation.red)

[13:30](#msg60a5131011fe9c1aa471ad8e)Here's a downscaled GIF from it working:

[13:31](#msg60a5134aaefc5d044af8635f)\[!\[Slime\_mold.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/xSKx/thumb/Slime\_mold.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/xSKx/Slime\_mold.gif)

[13:42](#msg60a515c45623c55ed4131f70)Please note that it consumes the RAM quickly

[13:42](#msg60a515dc11fe9c1aa471b4b3)\[!\[Slime\_mold\_simlation.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/aGMR/thumb/Slime\_mold\_simlation.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/aGMR/Slime\_mold\_simlation.png)

hiiamboris

[13:48](#msg60a517455fcfdb5ebd75c31b)be careful, it killed my windows ☺

[13:49](#msg60a51759ee77a74d685eea2e)which is worth investigating but I'm not gonna do that :)

[13:49](#msg60a5176440194369b6de11c4)great work nonetheless, @GalenIvanov

GalenIvanov

[13:51](#msg60a517d3c180a769be74bd9f)@hiiamboris Thank you! I'm sorry for your Windows! Btw qtxie marked \[#4905](https://github.com/red/red/issues/4905) as closed - so let's hope that the memory leaks are gone.

toomasv

[14:01](#msg60a51a3c0b07f074d095f0be)@GalenIvanov Slimy! :) err.. I mean, smooth!

GalenIvanov

[14:02](#msg60a51a8a86a4ae5efea97a33)I knew I needed to render it green :smile:

planetsizecpu

[15:52](#msg60a5344747884a0443f2717d)Looks well @GalenIvanov it denotes a lot of work. Good job.

GalenIvanov

[16:12](#msg60a538d9e7faf945c854ae54)@planetsizecpu Thanks!

greggirwin

[18:22](#msg60a55771e7faf945c85506da)With the fix from @qtxie it is memory stable for me here. Great work @GalenIvanov and thanks for that quick fix @qtxie !

GalenIvanov

[20:04](#msg60a56f53aefc5d044af96813)Thanks @greggirwin and @qtxie!

GiuseppeChillemi

[23:09](#msg60a59ab40b07f074d0973fd0)I need to attach an object to face/extra of a face and I need to bind the FACE word of its function to the face. This should happen at gui creation. How should I do?

## Thursday 20th May, 2021

greggirwin

[02:12](#msg60a5c598ee77a74d6860b120)Probably in the `do` part of your `view` spec.

hiiamboris

[06:19](#msg60a5ff7a71431f7a08ce21e3)Or on-create actor.

GiuseppeChillemi

[06:52](#msg60a60738e2f43259f6627a23)@gregg The tricky part is that I don't want to use `set-words` because I create generic gui elements throught a function. Using the `do`approach, I have to search the face tree for an ID in `face/extra` and then do the binding. I have still not tried but I suppose the FACE word is already available in some way.

[06:54](#msg60a6079c30651c67e81b43f5)@hiiamboris thanks! So, at `on-create`the FACE object is already available!

[07:21](#msg60a60e0e82b87324a0d8dc85)About VID and faces, I have not fully understood the logic behind the availability of `face` object: when does it starts to be available? And the `face` WORD how it is made available to the `on-` code block? Is it reassigned to the current `face` object at each face event? Is there a VID context? How does the `DO` can bind a code to the `face` WORD as there is no face currently active? (Only a binding to a VID context of the `face` word could justify it). Could someone please explain me these mechanism or point to some documentation?

hiiamboris

[08:04](#msg60a6180e19c86162394a71fa)actor is a function and `face` is it's argument

[08:05](#msg60a6182e77c281623c6869c1)you're always overcomplicating things

GiuseppeChillemi

[09:17](#msg60a629470bc2c759f4cdfa02)(The complication comes before simplification. When you learn something new you create many interconnected hypothesis, then you cut then you start a process which cuts the wrong ones and the right ones emerges, and I like doing this ;)

If an actor is function and `face` is its argument, that `face` word will be bound only to that function. So If I bind code at `on-creation` it will bound to the actor context and another actor will be unable to see it! The resulting is that I can't create an object with a `face` word in its code, as it would be bound to an unavailable context. My object's functions body would need continuous rebinding to be shared from all actors. The only solution is to structure the code as a function with `face` as argument and not as function with no arguments and the `face` bound at creation.

[09:20](#msg60a629cf0bc2c759f4cdfaa1)Check to see if I have understood correctly: the `face` word exist only inside an actor, something (VID?) call those functions passing the anonymous `face object` of the current face.

hiiamboris

[09:27](#msg60a62b7530651c67e81b9f4a)&gt; The only solution is to structure the code as a function with face as argument and not as function with no arguments and the face bound at creation.

Now you know why View is designed like this ☺

[09:28](#msg60a62bbe0bc2c759f4cdffb4)&gt; something (VID?) call those functions

View event system does

GiuseppeChillemi

[10:16](#msg60a6370fe2f43259f662f637)My view on VID was this:

```
make object! [
    face: <object>
    on-<actor>: does [some-function face another-function face]
    on-<actor>: does [some-function face another-function face]
    on-<actor>: does [some-function face another-function face]
]
```

Then the view-event system would run an event this way:

```
object/face: <face-object> ;The current face
object/(on-<actor>)
```

[10:29](#msg60a639f082b87324a0d955ee)Where one instance of the first object exists for each face on screen or `type` of face.

hiiamboris

[10:32](#msg60a63aa90b9bbf5b32efbef7)That's Bolek's style (:

rebolek

[10:41](#msg60a63cd519c86162394ad0d5):)

[10:45](#msg60a63de019c86162394ad26a)Actually, I haven’t touched View for such a long time that I don’t know what my style is anymore :)

hiiamboris

[10:50](#msg60a63f0c02556214c0d9e284)Well, your send-request gave me some headaches recently because some words it uses locally and some other words it fetches from global contexts and go figure the whole web of connections :)

rebolek

[10:52](#msg60a63f7930651c67e81bd895)@hiiamboris do you have any example?

[10:54](#msg60a63fdc0b9bbf5b32efcbdd)It’s actually ripe for a rewrite, it started as a simple tool for one thing and then I added tons of other functionality without any master plan, so it’s very spaghetti-like currently.

[10:55](#msg60a6400c6fe44c28cf23b3d0)And then there’s still stuff that needs to be added like cookies and proper HTTP caching instead of that excuse for caching that’s in Red.

hiiamboris

[10:56](#msg60a6404024587f67f88637c5)Well, it was setting Content-Type to application/json even when I gave it the binary /data. Turned out it also ignored Content-Type that I specifically set in the headers block. Then I tried to figure out how it works. It sets it for a few types (map, string), but for binary there was no clause. So then I found that Content-Type is in some global context, and after that I lost the track how it is modified and when.

[10:59](#msg60a6410d0b9bbf5b32efceb4)I just added a reset of the global value to `none` in every request and that seems to work :)

rebolek

[11:03](#msg60a6420130651c67e81bdde3):)

[11:04](#msg60a6424f24587f67f8863c51)I remember you had some problems with binary but I never got to investigate them. Now that I have Red HTTP server running I can take a look back at the send-request client and improve it. There’s a lot of shared code, so it can be simplified certainly.

GiuseppeChillemi

[11:20](#msg60a646076fe44c28cf23c104)I have experienced on myself that while you code in Redbol languages you change your style over time. This happens because you learn the many ways you can express your code and start using them. This led to a period of code with mixed styles until you find the definitive one. I have literally tens of notebooks pages full of expressions, objects and mechanism formed with different syles. Each one has his pros and cons.

[11:42](#msg60a64b1627b35e5b426b866d)@rebolek  
&gt;&gt; It’s actually ripe for a rewrite, it started as a simple tool for one thing and then I added tons of other functionality without any master plan, so it’s very spaghetti-like currently.

I have done the same until the last 6 months I have felt the needing to express the same thing in different ways. It has been like being at nursery and then at primary school. Differently from other languages, Redbol ones have a huge number of combinations for doing the same thing. While in others, strong rails trace your coding round, Redbol let you be free to develop your own style.  
This comes with a price and risk of spreading the data and functions over multiple places, losing control and knowledge of it. After this phase, you usually start writing a new one concentrating the information and restructuring the old one, or you die!

hiiamboris

[11:43](#msg60a64b6a0bc2c759f4ce53f2)True :) Number of combinations is limitless. And everyone's approach is usually different too.

## Monday 24th May, 2021

greggirwin

[20:18](#msg60ac0a1343fc4a24c5c2ec35)&gt; This led to a period of code with mixed styles until you find the definitive one.

For me there is no definitive style. The style should align with the domain and the problem being solved. Naturally we have a bag of tricks, or a toolbox, we draw on as we look for a good stylistic fit.

Or maybe my code is just inconsistent.

GiuseppeChillemi

[20:25](#msg60ac0b9edf5c362d4bebb791)I agree, "definitive one" is for me a set of styles I use with higher frequency.

greggirwin

[20:26](#msg60ac0c003d43a15a65c3c58f)Agreed.

## Thursday 27th May, 2021

planetsizecpu

[07:37](#msg60af4c26801b07264e7044e2)I was hacking on L5 yesterday. Not fully comfortable with the stage design I made some changes on the ice elevators. The ice stages are the most difficult due to slippery, I realized that it was almost impossible to beat the level with only three lives, so added a wall on the basement to avoid the guards having full clearance, and a teleporter to allow the boy to travel the wheelbarrow from one side to the other, but be careful, the guards also use them 😆

[07:37](#msg60af4c56688a2624b8b4c736)\[!\[Cavetest56.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/tI3X/thumb/Cavetest56.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/tI3X/Cavetest56.gif)

hiiamboris

[08:27](#msg60af5800a10461235da06d98)Fugitive hero, prison world, agents everywhere, woman in red dress, Red language (pill)... hmm.. rings some bell.. ;)

GiuseppeChillemi

[14:17](#msg60afa9ef78e1d6477d6aa51f)@hiiamboris about actors: as they are functions, their body is the code block after the `on-` word. So their body is bound to the function and you can't change it when running, isnt'it? Is there a way to change actor's body?

hiiamboris

[14:37](#msg60afaeab9d18fe19982c24ea)Have you tried it?

[14:41](#msg60afaf8884a2f633a77676fa)Red allows you to change function body at any time.

greggirwin

[17:00](#msg60afd0393d43a15a65ccf9aa)Very \*cool* @planetsizecpu.

planetsizecpu

[18:01](#msg60afde94df5c362d4bf4ac6e)Thx guys, I'm taking a general review on all levels trying to improve playability and fun. Today was the turn for L12, where I found it was too lasting, encouraging the player to give up.

[18:02](#msg60afdeb29d18fe19982ca223)\[!\[cavetest126.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/EJC2/thumb/cavetest126.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/EJC2/cavetest126.gif)

[18:03](#msg60afdef043fc4a24c5cc42d7)These ramps on the basement are new features giving some playing choices.

GalenIvanov

[18:10](#msg60afe09b801b07264e71bdd6)@planetsizecpu I like your dedication to this game project - respect!

GiuseppeChillemi

[23:12](#msg60b0276145c2185a5ef3a124)&gt; Have you tried it?

No, I am in from on my PC right now. I will try in the weekend

## Friday 28th May, 2021

GiuseppeChillemi

[19:05](#msg60b13efbfec22b4786e7dec6)I have tried to set the background color of a button but `button "hello" 200x80 red font-size 40 font-color white' doe not work.`

greggirwin

[19:08](#msg60b13fa543fc4a24c5cf856e)Native control limitation.

GiuseppeChillemi

[19:10](#msg60b1402414d9cd234a63e05c)I am doing a small `POS system` for an eleder, this limits a lot as I can't differentiate button by their function.

greggirwin

[19:40](#msg60b14749df5c362d4bf7fdcf)Until the non-native GUI system is in place, you'll need to use `base` for more control.

GiuseppeChillemi

[19:43](#msg60b147e2fec22b4786e7f358)Is a non native GUI system bein worked?

greggirwin

[19:45](#msg60b1484c801b07264e74f484)Yes. @hiiamboris can say more. It's in early development, but quite advanced.

hiiamboris

[20:02](#msg60b14c6f688a2624b8b97eb9):point\_up: \[May 14, 2021 4:21 PM](https://gitter.im/red/red?at=609e79745ca66330b0419ebc)

GiuseppeChillemi

[20:35](#msg60b1541445c2185a5ef6618a)I have followed the thread. I have thought Hiiamboris one was an personal project and not an official one. I am very happy to read this.

## Saturday 29th May, 2021

planetsizecpu

[06:14](#msg60b1dbc5d0f55b33ba1559f5)Thx @GalenIvanov Making games is not my role but while wait for IO it is a good training. Anyway I do it afterhours on my systems job. @hiiamboris much encouragement push hard.

pekr

[11:58](#msg60b22c4f688a2624b8bb4779)Interesting. Thought that is an experiment too :-) I have noticed a PR proposing some layout changes. Wonder if that is going to be a parallel system to VID, or it is going to replace VID. Or put it another way - will we be able to combine native and draw widgets?

GiuseppeChillemi

[12:53](#msg60b23966688a2624b8bb67c5)&gt; will we be able to combine native and draw widgets?

I hope this last one.

pekr

[13:46](#msg60b24599bdecf719a087bf0b)Reading more docs, it seems to be possible. Highere level DSL might not be fully defined yet. @hiiamboris So far, I am kind of versed on a naming convention. E.g. code like for `button`beginning with `function [btn]`, `define-handlers`should be just `handlers`.

I do remember, when Carl was working on his R3 VID version. Most of the time was spent on its design, purity, smoothness. Maybe @henrikmk will not agree the design was sufficient, as Saphirion's version removed reactors IIRC, but really - the disign of styles, actors, reactors, needs to be mostly a declarative structure.

I don't even want to see some object hierarchy being exposed to the TLD (top level dialect, if possible). IIRc `options`defined, what parameters can be used for TLD , `faced`kept instance level facet modifications, all actors could be used in TLD too.

I also loved (in comparison to VID2) the ability to set/get facets via e.g. `get-facet face 'size` or `do-style face 'on-click true`

Not sure how flexible the GUI was, but Carl tried to aproach it with the following point of view - users have to love to use it. Please let's keep some of those principles in mind http://www.rebol.com/r3/docs/gui/gui.html

hiiamboris

[14:45](#msg60b25396a10461235da74d3b)&gt; Highere level DSL might not be fully defined yet.

Not even sketched :)

[14:48](#msg60b2544ddf5c362d4bfa3b51)&gt; E.g. code like for `button`beginning with `function [btn]`

Feel free to propose a working alternative :)

&gt; `define-handlers`should be just `handlers`.

In VID yes, outside of it - no.

[15:35](#msg60b25f2bdf5c362d4bfa54f0)But then again, in VID even the word `handlers` will not be needed..

GiuseppeChillemi

[20:19](#msg60b2a1df688a2624b8bc4f68)As curiosity, why GOB system has not been replicated in Red?

[23:20](#msg60b2cc359d18fe1998331386)I have tried reaction for the first time and I think I have found a problem. Please, take the example contained here:

https://github.com/red/docs/blob/master/en/reactivity.adoc#13-dynamic-relations

..and run it in the console. Now drag the red ball for about 15 seconds, then stops and try to close the gui. The system will take a lot of time.

## Sunday 30th May, 2021

toomasv

[04:29](#msg60b314c7bdecf719a0895c0d)@GiuseppeChillemi Here it closes instantly (latest on W10).

ldci

[06:18](#msg60b32e3afec22b4786ebc426)@GiuseppeChillemi No problem on macOS.

GiuseppeChillemi

[08:56](#msg60b3533d850bfa2d3bf03e82)I have just downloaded the latest version. Let's see what happens with it. The one I have used was from May 14th

[09:27](#msg60b35a6e0ff6de262b388290)I have tried to record the screen activity with ScreenToGif but something strange has happened: when it is running, the movement in the Red screen application is not fluid as without it (expected) and the window has closed without the delay! (unexpected!) I have then used ShareX, another capture program, and the problem was still there.  
As I move the mouse very rapidly up/down/left/right, and screen recorders use a low frame rate, I can't show it happening but I confirm it happens even with the latest version.

hiiamboris

[09:39](#msg60b35d5e9d18fe1998342c0f)I downloaded this super bloated ShareX but still can't reproduce the issue

GiuseppeChillemi

[10:07](#msg60b363fa14d9cd234a68477a)@hiiamboris the problem is here without ShareX. ScreenToGif has the side effect of removing it.

## Friday 4th June, 2021

planetsizecpu

[07:57](#msg60b9dcd2c66e562e9b1f44e3)I'm testing with `camera` face type today, but does not display anything, the camera is detected in `data` as "GENERAL WEBCAM" and `selected` initially set to none, so I use a `button` to set the `selected` facet integer to 1, but remains in black. I know the device works because the OS (w10) display well so... maybe I'm doing something wrong.

```
view [c: camera 800x600 b: button "ON/OFF" [either c/selected = none [c/selected: 1 ][c/selected: none ]]]
```

hiiamboris

[08:07](#msg60b9df51b772022e937b77f1)that works for me

planetsizecpu

[08:11](#msg60b9e021bbcdca5603e3cf62)So it maybe some incompatibility?

hiiamboris

[08:12](#msg60b9e0683c544b55fd912829)one thing I would try is run W10 in safe mode then test it  
if still doesn't work, maybe your drivers have a glitch that is exposed in Red  
if works, then it's some software that messes it

planetsizecpu

[08:23](#msg60b9e2ff3c544b55fd912da7)Ok, I will test. Thx Boris.

toomasv

[09:43](#msg60b9f5cdd42bbf67bbb2bcb7)Regression?

[09:43](#msg60b9f5d1a557f76fa77a74e3)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/ukpX/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/ukpX/image.png)

[09:47](#msg60b9f69821d6d00b1fb38951)May 26 build still as it upside-down.

planetsizecpu

[09:49](#msg60b9f715a557f76fa77a76fb)&gt; one thing I would try is run W10 in safe mode then test it  
&gt; if still doesn't work, maybe your drivers have a glitch that is exposed in Red  
&gt; if works, then it's some software that messes it

It was Kaspersky that stopped Red, all right now!

[10:31](#msg60ba0113c66e562e9b1f9591)The docs say that is possible to capture the content of a camera face using to-image on the face. But there is `none` on the camera face/image so where to get the data ?

GiuseppeChillemi

[15:44](#msg60ba4a44b772022e937c7c46)@toomasv No, Earth Poles have just changed.

toomasv

[16:23](#msg60ba537137c03a7833208da0)Ah, of course, silly me!

hiiamboris

[17:31](#msg60ba637ed42bbf67bbb3d50b)&gt; It was Kaspersky that stopped Red, all right now!

That was my guess. Didn't know for sure if AVs can do that. So is there some setting that controls which programs can access camera?

planetsizecpu

[17:52](#msg60ba685f87c5ed783b754286)It is but I had no time to investigate, just stopped the shields for a while.

GiuseppeChillemi

[20:07](#msg60ba87f43c544b55fd92bf97)@hiiamboris Kaspersky does it, I confirm

## Saturday 5th June, 2021

hiiamboris

[10:10](#msg60bb4da83908f10174341077)Thanks!

GiuseppeChillemi

[19:00](#msg60bbc9df36d58642c5442c81)In VID i can use a word at the end of an actor's body and use its contained block as body. In @henrikmk VID-Extension-Kit I can use a path in place of a a word, VEK will take the block at the end of the path as BODY. This is very useful when you want to avoid creating different words for each code block, why not having it in RED VID.

[21:43](#msg60bbf00481b45810b8889213)I mean this: (now allowed)

```
code: [print "Hello"]
view [
   button "Print" code
]
```

Could also be written as (Not allowed in Red but in VEK)

```
segments: [
   print-hello [print "hello"]
   print-world [print "world"]
]
view [
   button "Print hello" segments/print-hello
   button "Print world" segments/print-world
]
```

## Sunday 6th June, 2021

hiiamboris

[08:37](#msg60bc895081b45810b889b79a)Tried get-path?

GiuseppeChillemi

[14:41](#msg60bcde929cc69444a02328b5)No, didn't think it could work. I'll try.

[21:21](#msg60bd3c3c20e86942d2491438)@hiiamboris  
No, it doesn't work:

```
>> view [button "Print world" :segments/print-world]
*** Script Error: VID - invalid syntax at: [:segments/print-world]
*** Where: do
*** Stack: view layout cause-error
```

## Monday 7th June, 2021

toomasv

[06:49](#msg60bdc17202f6ee5b91db637e)

```
view reduce ['button "Print world" segments/print-world]
```

hiiamboris

[08:23](#msg60bdd76f19b46c60b172a9a8)Well, I see you have a wish open for that already. So just wait a few years before someone implements it.

planetsizecpu

[09:46](#msg60bdeb019cc69444a025555d)Today released the new level L17, I called "Devil's Hole", you can imagine why, does anyone dare? 😅

[09:47](#msg60bdeb2693dd264ef4c15522)\[!\[Cavetest171.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/TP00/thumb/Cavetest171.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/TP00/Cavetest171.gif)

[09:47](#msg60bdeb3f5f235f695077aeb8)Now I'm testing for flawns

GalenIvanov

[11:06](#msg60bdfdca1477ff6954a62983)@planetsizecpu :+1:

GiuseppeChillemi

[22:30](#msg60be9df519b46c60b174900f)@toomasv Yes Toomas, but `reduce` needs to alter each element of the block, while using a get-path it is not needed.

PeterWAWood

[23:01](#msg60bea55820e86942d24c40e9)Then use `compose`

greggirwin

[23:12](#msg60bea7f49cc69444a02721dc)Camera is black for me, but no Kasperskey here.

[23:17](#msg60bea9139cc69444a0272428)Looks like there may be registry hacks to do it, but we should find out if Red apps can ask for camera permission.

## Tuesday 8th June, 2021

toomasv

[03:08](#msg60bedf1e5f235f695079f496)@GiuseppeChillemi Then while waiting for get-path syntax may be use something like preparator

```
prepare: func [blk] [parse blk [any [s: change word! (to-lit-word s/1) | skip]] reduce blk]
view prepare [button "Print world" :segments/print-world]
```

GiuseppeChillemi

[06:41](#msg60bf11293908f101743c1ea3)I like the word "preparator" you have used. I would prefer converting `:segments/print-world` to its code block before passing it to view.

toomasv

[06:46](#msg60bf12335bf7ed10d3eabaa6)In `prepare` it \*\*is\** converted before passing to `view`

```
>> prepare [button "Print world" :segments/print-world]
== [button "Print world" [print "world"]]
```

GiuseppeChillemi

[10:23](#msg60bf453593dd264ef4c48a43)I haven't seen the last reduce, and I have tought it was doing the opposite: changing lit-word to word.

## Wednesday 9th June, 2021

planetsizecpu

[14:54](#msg60c0d61c5bf7ed10d3eee34f)Sometimes with little effort a laborious job can be carried out. This is the new L18 level "Devil's Cave", with just a couple of hours it has been enough.

[14:55](#msg60c0d6553908f10174404d15)\[!\[Cavetest181.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/WyFK/thumb/Cavetest181.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/WyFK/Cavetest181.gif)

[14:55](#msg60c0d673ae78084ee73030f0)It has been a near copy &amp; paste job 😏

GalenIvanov

[16:15](#msg60c0e93802f6ee5b91e2dd5e)@planetsizecpu symmetry :smile:

## Friday 11st June, 2021

pekr

[11:02](#msg60c342e15e8dfc4f117637ba)My FireFox was updated cca 1 week ago to the latest version 89. Amongst many new things, I have noticed (if I got it right), that FF dropped native UI elements, as buttons, etc. and replaced them with their own elements. @hiiamboris - maybe we are on the right track with your Spaces project :-)

hiiamboris

[11:07](#msg60c343f48681550d4ee45563)☻

## Sunday 13th June, 2021

planetsizecpu

[08:13](#msg60c5be3cbed13a2dba7f3839)This week I'm going to make a major change to the design of the game. With only a handful of LOC now the caves can be double height and we can also scroll the screen vertically. To achieve this, it was necessary to remove the scoring / difficulty control area to a new window. In a few days I will be able to upload the final code. This is a mockup.  
Now, the design of the caves will be more laborious, but it will provide much more entertainment time 😄

[08:13](#msg60c5be468681550d4ee97f29)\[!\[cavetest191.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/ldb0/thumb/cavetest191.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/ldb0/cavetest191.gif)

GalenIvanov

[08:17](#msg60c5bf36d855766185d51cec)@planetsizecpu That's great! I'm curious - do you sketch the levels on sheets of paper, or everything is transferred directly from your head into Red code? I'm a big fan of concept design, sketching and sketchbooks :smiley:

planetsizecpu

[08:19](#msg60c5bf79bed13a2dba7f3aba)@GalenIvanov It's my boiling head! it is direct interface from my brain to paintbrush 🤣

GalenIvanov

[08:20](#msg60c5bfe7d161a54f05121218)@planetsizecpu Elon Musk would be happy to have you as a tester for his Neuralink :smirk:

planetsizecpu

[08:23](#msg60c5c0784fc7ad136aca68ff)Musk wouldn't be disappointed, sure.

[08:27](#msg60c5c15d8681550d4ee98583)\[!\[Roll.jpg](https://files.gitter.im/55b1d8290fc9f982beaacceb/niNi/thumb/Roll.jpg)](https://files.gitter.im/55b1d8290fc9f982beaacceb/niNi/Roll.jpg)

[08:28](#msg60c5c19c8681550d4ee9863d)These last five LOCs are the heart of the matter.

GalenIvanov

[08:34](#msg60c5c308d161a54f051218ae)You can shorten it a bit by rearranging:

[08:34](#msg60c5c30aa5d5740d612146d3)

```
GameData/CaveFace/offset/x: either GameData/PlayerFace/offset/x > GameData/CaveFaceHalfSizeX [
    GameData/CaveFaceRollOffsetX
][
    0
]
```

planetsizecpu

[08:37](#msg60c5c3d787848634af19cf25)Of course there are a lot of things that can be improved, as the guards homing func, it only needs time! thx Galen

GalenIvanov

[08:38](#msg60c5c3fdc705e53c1c8c3c41):+1:

greggirwin

[18:45](#msg60c6524f4fc7ad136acb8a43)That's a big feature @planetsizecpu. Nice.

## Monday 14th June, 2021

planetsizecpu

[10:31](#msg60c7301d3169e23498658a61)It is @greggirwin and done with just a bit of coding.

[10:32](#msg60c73045d161a54f0514f424)\[!\[Cavetest192.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/YSbh/thumb/Cavetest192.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/YSbh/Cavetest192.gif)

[10:33](#msg60c730698681550d4eec6861)I uploaded the code this morning, that's how looks.

[10:35](#msg60c730dca5d5740d61241bc5)There are four guards on this level, as we have more game area my testing shows it is the correct balance.

GalenIvanov

[13:05](#msg60c75409c705e53c1c8f629f)@planetsizecpu Nice!

greggirwin

[16:40](#msg60c78665d855766185d8c9f6):+1:

## Tuesday 15th June, 2021

toomasv

[09:09](#msg60c86e54b346e9618bd14e12)@GalenIvanov Probably you have seen it, but anyway, some interesting slime-work \[here](https://www.youtube.com/watch?v=X-iSQQgOd1A).

GalenIvanov

[09:18](#msg60c870624fc7ad136ad039c7)@toomasv Thanks for sharing - this was exactly what inspired me to try to code it myself. Sebastian Lague has some very nice videos with great explanations and good self-mocking humor.

toomasv

[09:19](#msg60c870bbbed13a2dba85088a)Indeed!

## Tuesday 22nd June, 2021

GiuseppeChillemi

[08:48](#msg60d1a3f9258ebf6d92e1668e)I want to store some elements in `face/extra`, I want to later search the whole face tree for a value stored there or just a pane. Is there any function? Could you point to some code?

rebolek

[08:51](#msg60d1a4a2258ebf6d92e167d1)@GiuseppeChillemi there is `foreach-face` which should work for you just fine

toomasv

[10:05](#msg60d1b5dfbef0c66d9d19ed2f)@GiuseppeChillemi Example:

```
l: layout [base red extra 'red with [pane: layout/only [base green extra 'green with [pane: layout/only [base blue extra 'blue]]]]]
foreach-face l [if face/extra = 'red [probe face/color]]
;255.0.0
foreach-face l [if face/extra = 'blue [probe face/color]]
;0.0.255
```

planetsizecpu

[14:40](#msg60d1f64a8c12474d8cc7ee6b)This is the new L20 level. I have introduced new items and more difficulty. It has been laborious to find the timing so as not to kill yourself when falling from elevators, I must check on modern machines if it is some flawn, if they go too fast we may loose synchronism and the ability to jump on the right time. 😣

[14:41](#msg60d1f67c24f0ae2a2420039a)\[!\[Cavetest201.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/olgJ/thumb/Cavetest201.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/olgJ/Cavetest201.gif)

toomasv

[15:30](#msg60d202074e325e61329a15f2):+1: high tech.

greggirwin

[16:19](#msg60d20d7c4e325e61329a343d)Nice level @planetsizecpu. I remember an old PC game (The Ancient Art of War), which was loads of fun on my Dad's 8086. When I got a 386 I remember trying to play it and the game lasted about 5 seconds. :^)

GalenIvanov

[16:19](#msg60d20da5effd491d8c7ba361)@planetsizecpu Nice! :+1:

planetsizecpu

[17:09](#msg60d21957368d0e1d9a1e3e26)Thx guys 😉

gltewalt

[23:00](#msg60d26ba5bef0c66d9d1b9ee4)Can you add an executable for Linux?

[23:11](#msg60d26e2824f0ae2a24211181)@planetsizecpu How is the bagman guy navigated? So far it runs ok on Linux, but can't figure out how to make him move.

[23:18](#msg60d26fcd457e19611a1300d5)Also prints to console "John is dead". I'm not sure if it is supposed to do that, or print to the game window

## Wednesday 23th June, 2021

gltewalt

[00:39](#msg60d282d49cf3171730ec2d35)No keyboard response

planetsizecpu

[06:19](#msg60d2d28af862a72a30caf8e9)@gltewalt I have uploaded a Linux executable just now, but I'm unable to test on other OSs than w10 for now. Arrow keys control the boy, space for action, in w10 they work ok, and yes, it display a lot of messages on console as a debug method. I would like to know it the elevators and kart run at correct speeds.  
Btw, thanks for testing.

## Thursday 24th June, 2021

gltewalt

[00:38](#msg60d3d400bef0c66d9d1ec091)@planetsizecpu the linux executable

```
gt@lappy:~$ ./cave
*** Access Error: cannot open: %DATA/cave-in.jpg
*** Where: decode
*** Stack: layout load
```

[01:01](#msg60d3d952110daa37b1011859)This doesn't work on my linux setup. Example from https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips

[01:01](#msg60d3d9654e325e61329e405a)

```
view [
    size 300x300
    base red on-created [set-focus face] on-key [
        switch event/key [
            up    [face/offset/y: face/offset/y - 5]
            down  [face/offset/y: face/offset/y + 5]
            left  [face/offset/x: face/offset/x - 5]
            right [face/offset/x: face/offset/x + 5]
        ]
    ]
]
```

[04:34](#msg60d40b429cf3171730ef9a17)Ah, but it does work with a field, using `focus`. You can move the field around.

[04:34](#msg60d40b50f862a72a30cdcc59)

```
view [
    size 300x300
    base red
    field
    focus
    on-key [
        switch event/key [
            up    [face/offset/y: face/offset/y - 5]
            down  [face/offset/y: face/offset/y + 5]
            left  [face/offset/x: face/offset/x - 5]
            right [face/offset/x: face/offset/x + 5]
        ]
    ]
]
```

[04:34](#msg60d40b64457e19611a169fce)`base` no respond

[04:36](#msg60d40bb39cf3171730ef9ad8)Is gtk only up to full `VID` capabilities, and not `View`?

[04:48](#msg60d40ea78a40b1172825eaa3)Works with:

```
button
toggle
check
radio
field
area
calendar
slider
tab-panel
```

planetsizecpu

[08:48](#msg60d446e3258ebf6d92e75d27)&gt; @planetsizecpu the linux executable  
&gt;

```
> gt@lappy:~$ ./cave
> *** Access Error: cannot open: %DATA/cave-in.jpg
> *** Where: decode
> *** Stack: layout load 
>
```

@gltewalt `Access Error` maybe you don't have access permission to the file, or maybe some case mismatch in the path.

hiiamboris

[09:04](#msg60d44a8a110daa37b102079b)`base` seems to have huge issues on GTK. `view [base focus on-key [probe event/key]]` works only once for me right after the fresh start of X server: I type `a s d f left right up down` it prints `asdf^[[D^[[C^[[A^[[B`. All subsequent attempts to focus base fail, and keys printed should be `asdf left right up down`

[09:44](#msg60d453f5110daa37b1021f13)seems like initially even focus to the window itself fails, and keys get into the terminal instead, that's why it prints that

gltewalt

[15:33](#msg60d4a5ddf862a72a30cf3850)Nothing is ever printed to my terminal, but I suspect focus is failing. `set-focus` doesn't seem to be correct.

[17:54](#msg60d4c6e0258ebf6d92e89768)Change `base` in this line to `field` or any of my above list, and it functions. `base` doesn't gain focus.

[17:54](#msg60d4c6e48c12474d8cce4f45)`view [base red on-focus [print "I'm focused"]]`

## Friday 25th June, 2021

Respectech

[20:04](#msg60d636d4457e19611a1baa5f)Should I be concerned about these error messages when I load `red-latest` on Garuda Linux (Arch)?

```
Gtk-Message: 13:03:38.861: Failed to load module "xapp-gtk3-module"
Gtk-Message: 13:03:38.863: Failed to load module "appmenu-gtk-module"

(console-2021-6-25-57821:3629617): Gtk-WARNING **: 13:03:38.883: Theme parsing error: gtk-dark.css:6342:10: 'height' is not a valid property name
Gtk-Message: 13:03:38.900: Failed to load module "colorreload-gtk-module"
Gtk-Message: 13:03:38.900: Failed to load module "appmenu-gtk-module"
```

[20:05](#msg60d63711bef0c66d9d24402d)I'm able to open a GUI window with `view [text "Test"]` so it doesn't seem to be keeping the graphics from working.

[20:07](#msg60d6379d65513b4d91305c1b)But `view/no-wait` doesn't work. It opens the window frame but the contents are only the background of what was behind the window before the window was opened, not the contents of the layout block.

[20:08](#msg60d637a69cf3171730f4ad9f)But I think that is a different issue.

[20:09](#msg60d637e8457e19611a1bad4c)

```
>> about
Red 0.6.4 for Linux built 25-Jun-2021/9:03:33-07:00  commit #fe27c1d
```

hiiamboris

[20:21](#msg60d63ae2110daa37b106a16c)Something with GTK install?

greggirwin

[20:57](#msg60d64328368d0e1d9a27c630)@qtxie? :point\_up:

## Saturday 26th June, 2021

qtxie

[02:08](#msg60d68c079cf3171730f558c1)@Respectech Seems those modules are missing on your system, you can try to install them. But it should be fine as we don't use those modules.  
https://github.com/red/red/wiki/%5BNOTE%5D-Linux-GTK-dependencies

[02:13](#msg60d68d2cb60c3137c391ba06)&gt; But `view/no-wait` doesn't work. It opens the window frame but the contents are only the background of what was behind the window before the window was opened, not the contents of the layout block.

It's normal as you are using the CLI console. There is no default event loop running in the CLI console. `view/no-wait` cannot process any event, that's why it doesn't work. Please use the gui-console in this case.

gltewalt

[15:39](#msg60d74a4eb60c3137c3932cfc)So... `focus` on `base` isn't functioning at all for me with GTK, and incorrectly for Boris.  
Is it in this code area?

https://github.com/red/red/blob/42d9d6a76bc48c204b00faf40ef9a769f0fb4a0d/modules/view/backends/gtk3/events.reds#L1038

hiiamboris

[18:25](#msg60d77129b60c3137c3937f75)I think it's not working for everyone

gltewalt

[22:23](#msg60d7a8d98a40b117282dba9d)I believe it's here.  
https://github.com/red/red/blob/42d9d6a76bc48c204b00faf40ef9a769f0fb4a0d/modules/view/backends/gtk3/events.reds#L987

[22:24](#msg60d7a905effd491d8c880b06)I added `base` to my fork and built a console from source. It prints "Im focused" now with `base`

## Sunday 27th June, 2021

gltewalt

[03:47](#msg60d7f4df457e19611a1f1afe)@hiiamboris Does your Retris run correctly on your system?

[03:47](#msg60d7f4e56c992105fda04c72)https://imgur.com/a/UtBv6Un

[03:59](#msg60d7f7b1110daa37b10a19ba)@planetsizecpu The lifts and the cart move really fast on GTK

hiiamboris

[08:03](#msg60d830c6bef0c66d9d2811c0)Retris spams error messages on some draw operation, but that's separate issue:

```
(console-view:142): GdkPixbuf-CRITICAL **: 11:01:22.111: gdk_pixbuf_get_n_channels: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(console-view:142): GdkPixbuf-CRITICAL **: 11:01:22.111: gdk_pixbuf_get_height: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(console-view:142): GdkPixbuf-CRITICAL **: 11:01:22.111: gdk_pixbuf_get_width: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(console-view:142): GLib-GObject-CRITICAL **: 11:01:22.111: g_object_unref: assertion 'G_IS_OBJECT (object)' failed

(console-view:142): GLib-GObject-CRITICAL **: 11:01:22.112: g_object_unref: assertion 'G_IS_OBJECT (object)' failed

(console-view:142): GdkPixbuf-CRITICAL **: 11:01:22.366: gdk_pixbuf_new_subpixbuf: assertion 'src_y >= 0 && src_y + height <= src_pixbuf->height' failed

(console-view:142): GdkPixbuf-CRITICAL **: 11:01:22.366: gdk_pixbuf_scale_simple: assertion 'GDK_IS_PIXBUF (src)' failed

(console-view:142): GdkPixbuf-CRITICAL **: 11:01:22.366: gdk_pixbuf_get_n_channels: assertion 'GDK_IS_PIXBUF (pixbuf)' failed
```

gltewalt

[15:03](#msg60d8934065513b4d9134f952)@hiiamboris Look at the imgur link. Retris is bugging out on me.

hiiamboris

[15:41](#msg60d89c24110daa37b10b6ad1)It's GTK bug not mine :)

gltewalt

[16:10](#msg60d8a303457e19611a207a85)Oh, I misunderstood

hiiamboris

[16:12](#msg60d8a350f862a72a30d7b098)Can you paste the log that it prints?

planetsizecpu

[16:13](#msg60d8a3a28a40b117282fa6c8)Ah, I have seen that issue before @gltewalt I must trim the timer values in order to work as expected on all supported OSs.

hiiamboris

[16:14](#msg60d8a3d14e325e6132a88054)GTK timer is faster than Windows' 16ms.

[16:14](#msg60d8a3e5457e19611a207c8a)Surprisingly, even in WSL2 running on top of that Windows :D

planetsizecpu

[16:21](#msg60d8a59b4e325e6132a88570)Yes, is a known issue, the timers must be slowed on Linux and maybe on MacOS, I know the way and it is some code on the game to do that, but I must be able to test on that OSs before touching anything 🙄

[16:23](#msg60d8a61a4e325e6132a886c2)By now all I can do is give more wait time to elevators and kart to wait for the boy to jump.

gltewalt

[16:24](#msg60d8a6519cf3171730f98b8b)@hiiamboris Do you mean all the error messages that are sent to console?

hiiamboris

[16:25](#msg60d8a68e110daa37b10b7fa9)@planetsizecpu If your timer routines do not exceed their 16ms time slice, you can set rate to 67 on all platforms and it'll be cross platform

[16:26](#msg60d8a6a3457e19611a2081a1)@gltewalt just the sample should be enough :) it's repeating, right?

gltewalt

[16:27](#msg60d8a6e0bcb3e8060ee94774)Yeah

[16:27](#msg60d8a6f1368d0e1d9a2c9e61)

```
(gui-console:8866): GdkPixbuf-CRITICAL **: 10:21:07.319: gdk_pixbuf_new_subpixbuf: assertion 'src_y >= 0 && src_y + height <= src_pixbuf->height' failed

(gui-console:8866): GdkPixbuf-CRITICAL **: 10:21:07.319: gdk_pixbuf_scale_simple: assertion 'GDK_IS_PIXBUF (src)' failed

(gui-console:8866): GdkPixbuf-CRITICAL **: 10:21:07.319: gdk_pixbuf_get_n_channels: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(gui-console:8866): GdkPixbuf-CRITICAL **: 10:21:07.320: gdk_pixbuf_get_height: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(gui-console:8866): GdkPixbuf-CRITICAL **: 10:21:07.320: gdk_pixbuf_get_width: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(gui-console:8866): GLib-GObject-CRITICAL **: 10:21:07.320: g_object_unref: assertion 'G_IS_OBJECT (object)' failed
```

[16:28](#msg60d8a719b60c3137c395de56)And theres this after pasting the red file in:

```
*** Script Error: VID - invalid syntax at: [none react [user: replace/all face/text make bitset! #{FFFFFFFF2000000000000008} "_"]]
*** Where: =
*** Stack: view do-events do-actor do-safe advance summon-pc game-over view layout cause-error 
*** Script Error: VID - invalid syntax at: [none react [user: replace/all face/text make bitset! #{FFFFFFFF2000000000000008} "_"]]
*** Where: do
*** Stack: view do-events do-actor do-safe keys advance summon-pc game-over view layout cause-error
```

hiiamboris

[16:31](#msg60d8a7c424f0ae2a242e92bf)ok latter I can fix

[16:33](#msg60d8a8529cf3171730f98f54)pushed a fix

gltewalt

[17:20](#msg60d8b36465513b4d9135402e)It doesn't throw lots of errors anymore, or have the script errors, but the lines still flash and do not disappear, and the score increments forever

[17:23](#msg60d8b408258ebf6d92f0ccb5)https://imgur.com/a/wIEtnPd

hiiamboris

[17:27](#msg60d8b5079cf3171730f9a92c)I know. I think I reported that. When you select some region outside of the image and impose it upon region inside the image, in GTK you get different results (should be just white pixels, but IIRC GTK draws them as transparent)

[17:27](#msg60d8b51d9cf3171730f9a93a)Effectively, bricks don't get cleared.

gltewalt

[18:35](#msg60d8c50fbcb3e8060ee986c4):-/

[18:40](#msg60d8c602f862a72a30d7f99b)Fix that.  
And if you make a version that doesn't use abbreviations in the source (for clarity), it would make a great showcase piece. 200 line tetris

hiiamboris

[18:59](#msg60d8ca9d24f0ae2a242edefd)no, you GTK guys fix your GTK backend :)

gltewalt

[19:00](#msg60d8cac9effd491d8c8a565b)I'm not a GTK guy :-)

hiiamboris

[19:03](#msg60d8cb949cf3171730f9de0b)you've fixed an issue the others couldn't in 1.5 years https://github.com/red/red/issues/4251  
consider yourself a GTK ninja :)

gltewalt

[19:05](#msg60d8cbebeffd491d8c8a595d)I think that's probably because they've been swamped

[19:05](#msg60d8cc0c258ebf6d92f0ffb4)Trying to find if you did make an issue...

## Monday 28th June, 2021

gltewalt

[02:05](#msg60d92e6d65513b4d91363c66)Puppy Finder is strangely pleasing

planetsizecpu

[11:43](#msg60d9b5fcb60c3137c3981542)&gt; @planetsizecpu If your timer routines do not exceed their 16ms time slice, you can set rate to 67 on all platforms and it'll be cross platform

@hiiamboris I'm testing 67 right now and works similar than old values on w10. I will update all the config files today. THX for your help.

hiiamboris

[12:12](#msg60d9bcb6f862a72a30d9f196):+1:

planetsizecpu

[14:01](#msg60d9d64a6c992105fda435f8)Update done!, if some one else wants to try how it goes on GTK any clue would be welcome. 😏

[14:02](#msg60d9d691bef0c66d9d2b8ddc)I Need to know if elevators &amp; kart run at acceptable speeds and if it is enough time to jump over.

[14:03](#msg60d9d6b0b60c3137c39860f8)Same for MacOS

[14:04](#msg60d9d6d4b60c3137c3986136)Thx in advance!

gltewalt

[23:27](#msg60da5aff65513b4d9138e143)@planetsizecpu elevator and kart run at what looks like appropriate speeds now on Linux / GTK

## Tuesday 29th June, 2021

planetsizecpu

[06:00](#msg60dab6e04e325e6132ad09af)Thx for testing @gltewalt and good investigation job @hiiamboris 😀

[06:09](#msg60dab9148c12474d8cdafc5e)I still testing for flawns on L20, the design still needs some touch up on walls.

[06:20](#msg60dabba2110daa37b11003b4)As my brain does not stop boiling, I am now thinking about a new L21 level. I am "phan" from Don Coscarelli's horror series "Phantasm", and I want to do this new level in memory of \[The Tall Man](https://www.phantasm.com/the-secrets-of-phantasm) actor, Angus Scrimm, who passed away in 2016, and gave me some bad nights sleep when I was young. So the new level I want to be a graveyard with catacombs. We'll see what comes out of this, I'm thinking of designing new hardware for the boy 😁

greggirwin

[17:00](#msg60db51ad65513b4d913b1dfa)The 67 note might be good to put somewhere. I don't know the best place, but that's a non-obvious trick.

[17:08](#msg60db538bb60c3137c39be143)@planetsizecpu fun memories or horror movies from our youth are great. :^)

## Wednesday 30th June, 2021

ldci

[10:25](#msg60dc4687bcb3e8060ef13773)For fun: IOS button

[10:25](#msg60dc468d457e19611a288a8d)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/7KUh/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/7KUh/image.png)

rebolek

[14:20](#msg60dc7dc6bcb3e8060ef1b362):+1:

[14:21](#msg60dc7dd824f0ae2a2437059a)let’s hope we’ll see Red for iOS someday ;)

ldci

[15:19](#msg60dc8b938a40b117283855dd)@rebolek Yes ASAP:)

planetsizecpu

[17:55](#msg60dcb000258ebf6d92f9bb56)It is a cool mockup @ldci good job!

greggirwin

[22:20](#msg60dcee466c992105fdab3b8a)@qtxie should we be able to change the `hint` for a field at runtime? Doesn't work on Win10 for me.

```
view [f: field hint "Pssst." button "Change Hint" [f/options/hint: "Nevermind"]]
```

[22:21](#msg60dcee6e6c992105fdab3bd1)The value itself updates in `options`, but the field does not show it.

## Thursday 1st July, 2021

qtxie

[03:59](#msg60dd3da7b60c3137c3a00df2)Yes. We can change it at runtime. IIRC, items in `options` are supposed to be fixed. We need to put `hint` in another facet.

ldci

[04:33](#msg60dd4590effd491d8c9430d8)@planetsizecpu Thanks :)

greggirwin

[05:36](#msg60dd546f4e325e6132b2de33)Thanks @qtxie.

planetsizecpu

[09:32](#msg60dd8ba49cf3171730045ed2)L21 new guards will be a bit creepy, some extra coding has been enough to fit on the game, this is a testing bed for start drawing.

[09:32](#msg60dd8bbbbcb3e8060ef40e72)\[!\[Cavetest210.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/KJEI/thumb/Cavetest210.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/KJEI/Cavetest210.gif)

[09:39](#msg60dd8d5c368d0e1d9a376b76)Some non-game artifacts have been sneaked in the GIF 😆

GalenIvanov

[10:53](#msg60dd9e91bcb3e8060ef43753)@planetsizecpu :+1:

greggirwin

[17:12](#msg60ddf76deffd491d8c95db57):^)

gltewalt

[22:16](#msg60de3eceeffd491d8c968280)Throw in a mostly transparent floating head of Gregg Irwin

greggirwin

[23:00](#msg60de4924110daa37b1183423)If you said "mostly empty" it would be my normal state.

## Friday 2nd July, 2021

planetsizecpu

[05:56](#msg60deaa98bef0c66d9d363da1)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/q5M9/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/q5M9/image.png)

[05:56](#msg60deaaa6f862a72a30e50c21)Hahaha, It was already designed that face! It is a new collectable item.

## Monday 5th July, 2021

gltewalt

[04:08](#msg60e285b1368d0e1d9a41cd22)Anyone know how to use the web cam in linux? The docs tell you the facets, but not how to use camera.

ldci

[06:26](#msg60e2a618effd491d8c9f4dab)@gltewalt See in redCV/samples/video. Runs with macOS.

[06:41](#msg60e2a98224f0ae2a2443ecab)@gltewalt . An example:

```
#!/usr/local/bin/red
Red [
	Title:   "Test camera Red VID "
	Author:  "Francois Jouen"
	File: 	 %camera.red
	Needs:	 'View
]

iSize: 320x240
margins: 10x10
cam: none ; for camera object

view win: layout [
		title "Red Camera"
		origin margins space margins
		tF: field 100 on-time [face/text: form now/time ] 		
		pad 160x0 btnQuit: button "Quit" 50 on-click [quit]
		return
		cam: camera iSize  black 
		return
		cam-list: drop-list 220 on-create [face/data: cam/data]
		toggle 90 "Start" false [	
			either cam/selected [
					cam/selected: none
					tF/rate: none
					face/text: "Start"
				][
					cam/selected: cam-list/selected
					tF/rate: 0:0:0.04;  max 1/25 fps in ms
					face/text: "Stop"
					]	
		]
		do [cam-list/selected: 1 tF/rate: none]
]
```

planetsizecpu

[14:56](#msg60e31daf368d0e1d9a431c09)Today I'm testing hard on new L21, a bit scary 😏

[14:57](#msg60e31dcf65513b4d914bbf10)\[!\[Cavetest212.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/hUlz/thumb/Cavetest212.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/hUlz/Cavetest212.gif)

hiiamboris

[17:41](#msg60e3442fb60c3137c3acc1c6)zombie guards :)

[17:41](#msg60e34435effd491d8ca0bae0)what's the skull for?

pekr

[17:46](#msg60e345868a40b11728467af3)If you click the skull, it installs Red 2.0 for you!

hiiamboris

[17:48](#msg60e346066c992105fdb87f6c):D

greggirwin

[19:47](#msg60e361bc457e19611a37b71e)I like the "hidden" skulls. Took me a minute to catch those. No flying sphere yet, so more scares yet to come I'm sure.

## Tuesday 6th July, 2021

planetsizecpu

[06:13](#msg60e3f47765513b4d914d6cca)The skulls are collectable items, I found the earlier face item was not up to the task of The Tall Man and I'm putting a lot of effort on this stage to honor him.  
The Battle Sphere is not designed yet, as they have horizontal flying pattern I think I will to clone the kart function with the needed code adaptation. But it is The Tall Man who manages spheres, so first I have to design it as a guards master, so that will need a new L22 level😁

[06:16](#msg60e3f529110daa37b1239160)But this days I'm thinking on how to save the game so will not lose the gold, and preserve the score. I want to do it before going on L22 and probably will save a txt file with the needed data.

[06:39](#msg60e3fabf9cf317173011c01c)&gt; If you click the skull, it installs Red 2.0 for you!

@pekr This feature is up to the Tall Man 😆

[10:56](#msg60e436f2457e19611a396ad5)Well, a bit of code has been enough to fit the sphere after clone the kart function, the pull to see it in action as been too much for me!

[10:57](#msg60e437048c12474d8cef50d8)\[!\[Cavetest213.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/FjNT/thumb/Cavetest213.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/FjNT/Cavetest213.gif)

[10:58](#msg60e43744bef0c66d9d41ada0)It has random vertical movement , it is also a rolling ball 😃

greggirwin

[16:43](#msg60e4884b457e19611a3a34cc)Wow, that was a fast feature! Brutal the way it kills him on the ladder.

planetsizecpu

[17:14](#msg60e48f8824f0ae2a244820fa)Yes it is, and the finished stage has two spheres. I like the way the function change the Y axis on every 60 cycles for a new random one, it resembles the films balls motion.

[17:20](#msg60e490d024f0ae2a2448249b)In the films, at end of the sphere travel it describes a round turn, but I found it would be too difficult to code, so in the game they make a small stop and turn back, as the karts do.

## Friday 9th July, 2021

planetsizecpu

[07:22](#msg60e7f952951c58084ecbbac8)This is how it looks finished, also the bottom stage of catacombs 😑

[07:23](#msg60e7f96f38da567d828e0961)\[!\[Cavetest214.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/t69g/thumb/Cavetest214.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/t69g/Cavetest214.gif)

[07:24](#msg60e7f9967473bf3d781634b6)\[!\[Cavetest215.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/71Cz/thumb/Cavetest215.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/71Cz/Cavetest215.gif)

hiiamboris

[07:38](#msg60e7fcedf1274d5e503b4a0f)The hero slipped and died of accident? ;)

planetsizecpu

[10:14](#msg60e821930853e41c0d4a1623)😄 There is another goblin on the right side, he was just coming @hiiamboris

[10:19](#msg60e822aa0853e41c0d4a18b3)Don't you think the catacombs is suitable to add a spider? mmm maybe I will put it.

GalenIvanov

[11:08](#msg60e82e1c0853e41c0d4a31dd)@ldci Yes, of course! :smile:

greggirwin

[17:29](#msg60e88774f2b4077d6bb9f0e5)@planetsizecpu the slope to the floors makes me think you could do a Donkey Kong level, if you haven't already. :^)

## Saturday 10th July, 2021

planetsizecpu

[08:57](#msg60e960e7f2b4077d6bbbb2b6)mmm yes @greggirwin the slopes and the fireballs fit well with the game, but the rolling barrels... would need a lot of code, I see it possible so maybe after the Tall Man series will try. 😉

## Wednesday 14th July, 2021

GalenIvanov

[08:17](#msg60ee9da1d2556414f562fd0a)More fun with Truchet-like tiles today:

[08:17](#msg60ee9db07473bf3d7824c95e)\[!\[Leaf-Truchet.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/wwRN/thumb/Leaf-Truchet.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/wwRN/Leaf-Truchet.png)

[08:18](#msg60ee9dde17929c14e687c3ff)The inspiration came from \[Normform](https://normform.art/)

[08:19](#msg60ee9e2338da567d829cae51)I wonder what does theit software look like :smile:

[08:20](#msg60ee9e3167b72e1bfe0ec20f)Here's my code:

[08:20](#msg60ee9e4538da567d829caead)

```
W: 800
H: 600
d: 50

random/seed now

tile1: make image! compose [(as-pair d d) (sky)]
tile2: copy tile1

draw tile1 compose/deep [
    fill-pen white pen sky
    shape [arc (as-pair d d) (d) (d) 90 arc 0x0 (d) (d) 90]
]

draw tile2 compose/deep [
    fill-pen white pen sky
    shape [move (as-pair d 0) arc (as-pair 0 d) (d) (d) 90 arc (as-pair d 0) (d) (d) 90]
]

truchet: collect [
    repeat y H / d [
	    repeat x W / d [
		    t: rejoin ['tile random 2]
		    keep compose [image (to-word t) (as-pair x - 1 * d y - 1 * d)]
		]
	]
]

view compose [title "Leaf Truchet" base (as-pair W H) sky draw truchet]
```

hiiamboris

[08:34](#msg60eea1a8ec10653d5a3ce97d):clap:

[08:35](#msg60eea1cbf1274d5e5049f1d8)Here's a trick for you: `as-pair d d` -&gt; `1x1 * d`, `as-pair d 0` -&gt; `1x0 * d`

planetsizecpu

[08:37](#msg60eea2337473bf3d7824d5d0)Interesting @GalenIvanov I been playing the code a bit, good job!

GalenIvanov

[08:37](#msg60eea255049a0c3e5371bec0)@hiiamboris Thanks! I'm aware of these conversions: \[Tips for golfing in Red](https://codegolf.stackexchange.com/a/226826/75681)

hiiamboris

[08:38](#msg60eea28917929c14e687cf6e)wow!

[08:39](#msg60eea2b8515cab3e4fb87fa7)what I'm also using is `by: make op! :as-pair` then it becomes just `W by H` or something :)

GalenIvanov

[08:39](#msg60eea2d47b5a415e65e5a7e5)Oh yes, that's cool!

[08:43](#msg60eea3c023fd26511daf2c64)Thank you @planetsizecpu !

planetsizecpu

[08:43](#msg60eea3c3515cab3e4fb882ba)@hiiamboris Is there some speed difference on execution of `as-pair 5 5` and `1x1 * 5` what is more efficient?

hiiamboris

[08:50](#msg60eea56f82dd9050f5ee0ee3)Ops are faster in interpreter. In compiler, no difference usually.

```
>> clock/times [as-pair 5 5] 10'000'000
0.23 μs	[as-pair 5 5]
== 5x5
>> clock/times [1x1 * 5] 10'000'000
0.16 μs	[1x1 * 5]
== 5x5
```

[08:52](#msg60eea5caf2b4077d6bc754a7)Even this trick speeds it up:

```
>> by: make op! :as-pair
>> clock/times [5 by 5] 10'000'000
0.14 μs	[5 by 5]
== 5x5
```

GalenIvanov

[08:53](#msg60eea61282dd9050f5ee0fc1):+1:

planetsizecpu

[09:00](#msg60eea7c47b5a415e65e5b208)Thx @hiiamboris useful.

GalenIvanov

[11:14](#msg60eec70b48f9b1084a2c9d04)Sausages anyone? :smiley:

[11:14](#msg60eec7177473bf3d782536ce)\[!\[Leaf-Truchet-A sausage dream.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/RVI4/thumb/Leaf-Truchet-A-sausage-dream.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/RVI4/Leaf-Truchet-A-sausage-dream.png)

[11:17](#msg60eec7bb951c58084edab7ca)\[!\[Leaf-Truchet-A sausage dream 2.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/njOO/thumb/Leaf-Truchet-A-sausage-dream-2.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/njOO/Leaf-Truchet-A-sausage-dream-2.png)

henrikmk

[11:44](#msg60eece2748f9b1084a2cad8f)A case where it might be OK to learn how the sausage is made.

GalenIvanov

[12:26](#msg60eed7fa515cab3e4fb906ed)@henrikmk Yes, indeed :smile: No animals were harmed during the making of the images above.

greggirwin

[17:31](#msg60ef1f67d2556414f56442fa)So fun! NormForm is a nice find. And I can see puzzle games coming out of this. Generate tiles, keep their order, then randomize and players recreate them. Not a new idea by any means. Very likely someone has already done it with NormForm. This kind of thing will also be great, muted, for backgrounds.

GalenIvanov

[20:18](#msg60ef469667b72e1bfe10667c)@greggirwin Yes, I also find their tiles useful for tiled backgrounds - that's why I tried to recreate on of them. What's interesting is how does their software work, and more specific, what's the interface? I found (by experimenting) that snub square and Cairo patterns (which are duals of each other) are separated by just one argument value. How we can communicate this to designers? They say their tool is grid-based. Looking at the examples, they are only using square grid. What about the other (semi)regular tilings?

greggirwin

[20:26](#msg60ef488148f9b1084a2ddcf4)That's the interesting question for me too, but from the perspective of how a subset of network graphs could be tesselated, how to know which can't be, identifying those mappings (as there may be more than one for a given tesselation), and what benefits this kind of visualization provides. For example, do we find that things which \*can be* tesselated aligns with ease of understanding or efficiency? And what about sub-tesselations that might give us the lattice, or layers of spaces Gelernter talks about in Mirror Worlds?

[20:27](#msg60ef48b8ec10653d5a3e87bc)Not to mention 3D tesselations, but those will be hard to visualize beyond tetrahedrons and cubes.

[20:29](#msg60ef4916f2b4077d6bc8ebbf)Also what kind of play toys we can make, like with Logo Turtles. The exploration of that one extra argument that leads to new patterns.

## Thursday 15th July, 2021

GalenIvanov

[11:45](#msg60f01fda951c58084eddcab5)Some of today's experiments with Truchet tiles and similar, on different grids:

[11:46](#msg60f0200238da567d82a038a7)\[!\[Truchet-4-3.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/VIzE/thumb/Truchet-4-3.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/VIzE/Truchet-4-3.png)

[11:46](#msg60f0201e82dd9050f5f16f3d)\[!\[Truchet-6-3.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/dSqj/thumb/Truchet-6-3.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/dSqj/Truchet-6-3.png)

[11:47](#msg60f0203882dd9050f5f16fa1)\[!\[Truchet-12-3.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/w3ld/thumb/Truchet-12-3.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/w3ld/Truchet-12-3.png)

[11:47](#msg60f02058ec10653d5a4059ab)\[!\[Truchet+Dual-6.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/9W3T/thumb/Truchet-Dual-6.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/9W3T/Truchet-Dual-6.png)

[11:48](#msg60f020837473bf3d7828506c)\[!\[Truchet+Dual-6-3.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/IlFY/thumb/Truchet-Dual-6-3.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/IlFY/Truchet-Dual-6-3.png)

[11:48](#msg60f0208e7473bf3d78285077)\[!\[Truchet+Dual-8-4.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/WP4s/thumb/Truchet-Dual-8-4.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/WP4s/Truchet-Dual-8-4.png)

[11:48](#msg60f020a7515cab3e4fbbf51a)\[!\[Truchet-3\_02.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/fSrN/thumb/Truchet-3\_02.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/fSrN/Truchet-3\_02.png)

[11:49](#msg60f020cd38da567d82a03b80)\[!\[Dual2-12-3.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/b5tR/thumb/Dual2-12-3.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/b5tR/Dual2-12-3.png)

greggirwin

[16:15](#msg60f05f0c23fd26511db33850)Wow! So cool.

Respectech

[16:51](#msg60f0678f48f9b1084a304c27)Fun stuff!

planetsizecpu

[17:18](#msg60f06dda67b72e1bfe12f286)👍

TimeSlip

[17:28](#msg60f0702a48f9b1084a30645f)@GalenIvanov Sweet!

GalenIvanov

[19:08](#msg60f087c2ec10653d5a415b25)Thank you all!

## Friday 16th July, 2021

toomasv

[04:34](#msg60f10c5f82dd9050f5f379f8)Beautiful!

ldci

[07:11](#msg60f131080853e41c0d5e1baf)@GalenIvanov Geat job

GalenIvanov

[08:05](#msg60f13ddf7b5a415e65eb9a5d)Thanks @toomasv and @ldci !

planetsizecpu

[09:56](#msg60f157d1ec10653d5a43067a)Today released L22 The Goblins Planet, it has very simple layout but is a lot of difficult as there are few loopholes and a lot of collectable items, this time I put four goblins, and two wheelbarrows to help a bit.

[09:57](#msg60f157f823fd26511db54ca9)\[!\[Cavetest222.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/hJQu/thumb/Cavetest222.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/hJQu/Cavetest222.gif)

GalenIvanov

[10:40](#msg60f1623223fd26511db56620)@planetsizecpu :+1:

greggirwin

[18:43](#msg60f1d33ef1274d5e50515337)Very cool, with the background. I haven't played in so long, need to find time to catch up.

## Sunday 18th July, 2021

cloutiy

[13:56](#msg60f432f167b72e1bfe1acb5c)Please do a remake of jumpman jr that was on the commodore 64.

[13:56](#msg60f4331a049a0c3e537db05f)Or aztec warrior. Lol brings back memories of growing up with a commodore 64

## Monday 19th July, 2021

GalenIvanov

[12:12](#msg60f56c4b049a0c3e53802a8a)More of my designs:

[12:13](#msg60f56c53049a0c3e53802aac)\[!\[TruTiles-Square-Orig+dual.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/WbIH/thumb/TruTiles-Square-Orig-dual.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/WbIH/TruTiles-Square-Orig-dual.png)

[12:13](#msg60f56c5f82dd9050f5fc96d5)\[!\[TruTiles-Tri-Dual+Diag.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/qqIi/thumb/TruTiles-Tri-Dual-Diag.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/qqIi/TruTiles-Tri-Dual-Diag.png)

rebolek

[12:39](#msg60f57278515cab3e4fc739e3)@GalenIvanov very nice! Have you seen TextureLab? It may be interesting for you. http://www.rebol.org/view-script.r?script=texture-lab.r (unfortunately Rebol only)

GalenIvanov

[12:42](#msg60f5732bec10653d5a4b8a6f)@rebolek Thanks! No, I don't remember seeing it. I'll need to try it, since I'm interested in textures.

rebolek

[12:45](#msg60f573e182dd9050f5fca619)It generates some noise and abuses it with built-in Rebol's filters until something lookable comes out. It was fun :)

GalenIvanov

[12:54](#msg60f5760e951c58084ee90a58)Sounds interesting! Kind of evolutionary algorithm?

rebolek

[12:55](#msg60f5765238da567d82ab6cea)If applying convolution matrix multiple times can be described as evolutionary alogithm, then yes :)

GalenIvanov

[12:57](#msg60f576a97b5a415e65f45c82):smile:

[13:05](#msg60f57885d2556414f571c947)The blind watchmaker

planetsizecpu

[13:05](#msg60f57895049a0c3e538049b1)Bravo! Galen, push hard 😃

GalenIvanov

[13:07](#msg60f5791582dd9050f5fcb250)Thanks, @planetsizecpu I decided to provide this project with a decent GUI, so that non-programmers can experiment with these tiles. It already has a name: "TruTiles" (for Truchet Tiles)

greggirwin

[18:35](#msg60f5c5f3049a0c3e53810a0b)More beautiful patterns. The second one almost looks like a notation. Something Feynman might have come up with.

[18:37](#msg60f5c66b951c58084ee9c9ca)I love the "shading" that appears in the second as well. And the first looks like a city from above.

GalenIvanov

[19:09](#msg60f5cdf5f1274d5e5059a3d4)Thank you, @greggirwin!

toomasv

[20:06](#msg60f5db40ec10653d5a4c913d)Very nice work, @GalenIvanov ! :+1:

GalenIvanov

[20:08](#msg60f5dbd70853e41c0d67dfa3)Thank you, @toomasv !

## Tuesday 20th July, 2021

TimeSlip

[04:35](#msg60f652aa72c37b6f4562ceb9)@GalenIvanov Excellent.

GalenIvanov

[06:24](#msg60f66c0f1a1db149e9cf79b6)@TimeSlip Thank you!

## Wednesday 21st July, 2021

planetsizecpu

[11:33](#msg60f806109e84ba381e307c11)Today released L23 The Tall Man Mausoleum, it has been a lot of work to make the creature and to design a stage suitable for their rank, see is his open coffin in the interlude room 😄

[11:34](#msg60f806376ccf813819cd2837)\[!\[Cavetest232.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/nVby/thumb/Cavetest232.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/nVby/Cavetest232.gif)

GalenIvanov

[11:51](#msg60f80a4f6ccf813819cd3288)@planetsizecpu :+1:

greggirwin

[17:36](#msg60f85b12d8381a2a838500f9)Nice. People, I think, tend not to realize how much work level design is.

planetsizecpu

[19:38](#msg60f877a7b8422d6f4ffb4cdd)Well this L23 wasted ~ 8-9h, and I have to test with all the guards for hidden flawns. Maybe I will draw some tombs.

## Thursday 22nd July, 2021

planetsizecpu

[09:59](#msg60f941863a178069da7dc0a5)Today fine tuned the L23 level, finally I have chosen to put an inter-dimensional door (a.k.a. teleporter) in the interlude room, so the game turns more challenging by permit The Tall Man to quickly travel to the upper screen, also the boy can make fast carry on the wheelbarrow 😁

[10:00](#msg60f941bf6ccf813819cff475)\[!\[Cavetest233.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/eBMw/thumb/Cavetest233.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/eBMw/Cavetest233.gif)

GalenIvanov

[10:15](#msg60f9454a72c37b6f456985f5)@planetsizecpu Great!

greggirwin

[17:00](#msg60f9a416c9f8852a9700dd69)The quick screen change reminds me again of the importance of transition events. To me they're overdone much of the time, but can offer very useful feedback when used appropriately.

[17:42](#msg60f9adfb8587b302bfbc0bdf)I didn't know about viewports at all (https://www.bram.us/2021/07/08/the-large-small-and-dynamic-viewports/), except that it's a codename for a very old project of mine.

## Friday 23th July, 2021

planetsizecpu

[06:17](#msg60fa5f0436b0b97fa2c30593)&gt; The quick screen change reminds me again of the importance of transition events. To me they're overdone much of the time, but can offer very useful feedback when used appropriately.

Ah, I hadn't thought about it. Perhaps the game will be more enjoyable, I think I'm going to try a scene where the boy vanishes when passing through the teleporter. It's a good note Gregg, THX!

[14:14](#msg60facedc926ce249e57ef19c)I found transitions are complex to code, depending on where you place them, they produce unwanted effects, even slowing down the game, because you don't control when View does the screen refresh and in the meantime some movements occur on the screen. So I have managed to make the flash effect as a transition between screens, but only for the boy. For guards, it causes the game to pause for an instant when a guard crosses the teleporter, which is not feasible while playing. Also from this release the game saves the progress made and each time it starts at the last level reached.

[14:15](#msg60facf01e9aaeb7fbe19a710)\[!\[Cavetest234.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/kRx2/thumb/Cavetest234.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/kRx2/Cavetest234.gif)

GalenIvanov

[14:27](#msg60fad1bd926ce249e57ef8dc)@planetsizecpu Nice!

planetsizecpu

[14:28](#msg60fad1fe58232d5ab4dec367)Thx Galen, I am happy with the result, and I have also learned!

greggirwin

[15:47](#msg60fae498b8422d6f4f00bc04)Certainly tricky. You'll notice a lot of UIs become non-responsive when changing screens. e.g. books that turn pages. In some virtual worlds, some render continuously no matter what, so every surface can respond to events, even if it's a rotating cube or you're flying over a landscape. This kind of transition, where you go from one world to another effectively, has no continuity which means there's a point where events \*have to* be directed to one or the other, so you you either don't accept events for a period of time, or you risk them going to the wrong target if the UI doesn't make it clear.

In a non-UI context, this also applies to distributed systems. An event may travel through servers and brokers to reach a receiver, but that receiver may not be there anymore when it arrives or, depending on how addressing is done, a different receiver may get it.

[15:48](#msg60fae4d458232d5ab4deee25)An obvious example is failover or upgrade scenarios.

planetsizecpu

[17:38](#msg60fafe7bf4d1dc69f3ff2b49)Agreed, I see that behavior on a daily basis on some apps at work, as for example mail exchange.

## Tuesday 27th July, 2021

greggirwin

[21:04](#msg610074ee1a1db149e9e553d8)Fun stuff: http://tobyschachman.com/

## Wednesday 28th July, 2021

planetsizecpu

[08:04](#msg61010f7c926ce249e58c0a42)And this is L24 "Phantasm Lair", a remake of L17 in double heigth with more stuff and more dangers 😁

[08:05](#msg61010fc5c9f8852a9710a28d)\[!\[Cavetest241.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/mhMk/thumb/Cavetest241.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/mhMk/Cavetest241.gif)

[11:37](#msg6101416923956a5aa45e1c75)&gt; Fun stuff: http://tobyschachman.com/

Yes, so cool.

GalenIvanov

[12:35](#msg61014f109e84ba381e4475ef)@planetsizecpu Nice, again!

[12:40](#msg610150248587b302bfcc3072)I think I'm ready to share with you guys a working application of my Tesselations project - \[TruTiles](github.com/GalenIvanov/Graphics-Red/blob/master/TruTiles.red). It's a program that generates patterns. Every pattern starts as one of the 3 regular or another 6 semiregular tesselations of the plane. Then I apply to each tile a combination of rules that define what is rendered.

[12:40](#msg6101502d58232d5ab4ec5a1e)\[!\[TruTiles.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/bAOZ/thumb/TruTiles.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/bAOZ/TruTiles.png)

[12:40](#msg6101503b3a178069da8ed89e)\[!\[TruTiles\_2.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/VKKd/thumb/TruTiles\_2.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/VKKd/TruTiles\_2.png)

[12:40](#msg6101504536b0b97fa2d1844f)\[!\[TruTiles\_3.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/eWFy/thumb/TruTiles\_3.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/eWFy/TruTiles\_3.png)

[12:41](#msg6101507836b0b97fa2d1847e)The result can be saved as 1920x1080 pixels .png.

hiiamboris

[12:46](#msg6101518c7331d202b5d55084)wow amazing!

[12:46](#msg6101519c58232d5ab4ec5cbb)care to add it to https://github.com/red/red/wiki/\[LINKS]-Projects-showcase-(links-to-remember) ?

GalenIvanov

[12:47](#msg610151ce7331d202b5d5511d)Please note that the rendering of cells smaller than 20 takes much time. The amount of "effects" is normalized - you can have only one effect with value 1 and all others - 0, and it's scaled to 100%.  
There might be problems with code, but I'm happy to share it here. There are no comments at all :( Please play with it and share your creations :smile:

hiiamboris

[12:47](#msg610151fa36b0b97fa2d188af)&gt; Please play with it and share your creations

I will when I have moar time :)

GalenIvanov

[12:48](#msg6101521223956a5aa45e4163)@hiiamboris Thank you! Yes, I'll add it there.

planetsizecpu

[13:13](#msg6101580323956a5aa45e4f47)Superb @GalenIvanov

GalenIvanov

[13:15](#msg6101586e9e84ba381e448ba5)@planetsizecpu Thank you!

[13:24](#msg61015a76e9aaeb7fbe275612)@greggirwin I remember I have seen Toby Schachman's Recursive drawing demo before. It's great; reminds me of some of Bret Victor's works.

toomasv

[13:52](#msg6101612de9aaeb7fbe27670f)@GalenIvanov Magnificent! Thanks!

GalenIvanov

[14:04](#msg610163e13a178069da8f087b) @toomasv Thanks! :smile:

greggirwin

[18:33](#msg6101a3071a1db149e9e7f1b8)@GalenIvanov WOW! WOW! WOW! TilesAsAService will be our next product. :^)

Thoughts:  
\- Show something while it's rendering, so the user knows it's working hard on their behalf.  
\- If the default tile is the grid, put it first (top) in the list of tiles.  
\- The shadow feature is \*very* cool, but (Windows' fault) the toggle button looks like a command button. Maybe make it a check box?  
\- Add a feature to save settings as well as PNGs. Make it \*really* easy, maybe even with a list of them available, to easily load them again.  
\- This is absolutely \*wild\*.

[18:34](#msg6101a31f36b0b97fa2d24a22)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/g0y1/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/g0y1/image.png)

[18:37](#msg6101a3e572c37b6f457b6a09)This could be a mesmerizing animation.

[18:37](#msg6101a3f11a1db149e9e7f3e1)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/YWoq/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/YWoq/image.png)

[18:43](#msg6101a55db8422d6f4f0f0ac8)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/xsPE/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/xsPE/image.png)

[18:44](#msg6101a5a0f4d1dc69f30d4c3a)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/fM5M/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/fM5M/image.png)

[18:50](#msg6101a6dd9e84ba381e4554b0)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/Rrqb/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/Rrqb/image.png)

[18:51](#msg6101a747d8381a2a8398f110)Really nice UI.

GalenIvanov

[19:32](#msg6101b0b372c37b6f457b893c)@greggirwin Thank you! The features you mentioned are must-have - I'll try to implement them. You are right about the square grid - I think it's the most natural and convenient for the human beings, so I'll put it first.

ldci

[22:22](#msg6101d8b558232d5ab4ed942a)@GalenIvanov Congratulations. Wonderful app :)

TimeSlip

[23:32](#msg6101e903d8381a2a83998a2c)@GalenIvanov Galen, what a fabulous invention!

## Thursday 29th July, 2021

GalenIvanov

[06:13](#msg610246eeb8422d6f4f1069fc)Thank you, @ldci and @TimeSlip !

planetsizecpu

[08:13](#msg6102633523956a5aa4609750)I'm starting a new level today, the L25, and that's how it all starts, with a lot of love 😃

[08:14](#msg6102635058232d5ab4eeb86a)\[!\[Cavetest250.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/vpaS/thumb/Cavetest250.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/vpaS/Cavetest250.gif)

[08:15](#msg610263b1926ce249e58ef7e6)The background image will be a @GalenIvanov app a tile sample, if he agree of course.

GalenIvanov

[08:16](#msg610263edb8422d6f4f10af1d)@planetsizecpu Of course, I'll be glad if you use it!

[08:16](#msg610263f27331d202b5d7a73e)Thanks!

greggirwin

[16:25](#msg6102d666b8422d6f4f11bc95)Very cool to see the process at a different stage. I don't remember the hearts either. :^) Can't wait to see the collaborative result.

hiiamboris

[18:49](#msg6102f84f23956a5aa461f4ee)cheese exploration  
!\[](https://i.gyazo.com/b11c23ba0171349c5cf8c4d3992e431b.png)

cube field  
!\[](https://i.gyazo.com/491f636d6101dfbff4723ab855f5be86.png)

weird cube field  
!\[](https://i.gyazo.com/26048f4a629fbd650e5ab8446ad105a0.png)

GalenIvanov

[18:56](#msg6102f9e7d8381a2a839be62f)@hiiamboris Great, thanks for sharing!

greggirwin

[19:41](#msg610304606ccf813819e4e897)Eschers and Eyes

[19:41](#msg61030467926ce249e5907128)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/OQW9/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/OQW9/image.png)

[19:42](#msg610304b2c9f8852a9715140a)Playful

[19:42](#msg610304b66ccf813819e4e960)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/cYZ9/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/cYZ9/image.png)

## Friday 30th July, 2021

hiiamboris

[06:50](#msg6103a1517331d202b5da6ec1)@GalenIvanov  
\- save/load doesn't seem to work on W10  
\- tabbing support would be great to have (you can probably extract it from \[here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/table.red#L794) )  
\- I think colors dialog is not two-way reactive: when I change the numbers color stays

GalenIvanov

[06:51](#msg6103a17de9aaeb7fbe2c6748)@hiiamboris Thank you for the feedback!

[06:56](#msg6103a2bae9aaeb7fbe2c6a40)- save/load controls are not connencted to any code at the moment. I'll work on this in the coming days. I intended to have multi-preset files and that's why there is a drop-list to select the loaded preset. I'm not sure if I'll make like that, since it opens the question of removing existing presets from the file and so on. Btw, I'll add save/load for a single preset in a file as a start.

hiiamboris

[06:57](#msg6103a2f2c9f8852a97165824):+1:

GalenIvanov

[06:58](#msg6103a2fe3a178069da940706)- tabbing - it would be great to add it - I'll examine your code

[06:58](#msg6103a32d1a1db149e9ec4eb2)- colors dialog - I definitely must make it two-way reactive. It's not at the moment.

hiiamboris

[07:02](#msg6103a4153a178069da940936)`f-blue/text: to-string to-integer 255 * sl-blue/data` can be just  
`f-blue/data: to-integer 255 * sl-blue/data`

GalenIvanov

[07:03](#msg6103a44fe9aaeb7fbe2c6d96)Oh, thanks - I didn't know that.

hiiamboris

[07:05](#msg6103a4ac6ccf813819e63476)also I think grid coordinates can be multiplied by 2-10, and then zoomed out accordingly, to get subpixel precision

GalenIvanov

[07:17](#msg6103a77658232d5ab4f18b9a)I'm not sure how to do it. Can you explain it in more details (when you have time)?

hiiamboris

[07:50](#msg6103af5e3a178069da94256a)`draw [line 10x10 20x20]` -&gt; `draw [scale 0.1 0.1 line 100x100 200x200]`

GalenIvanov

[07:54](#msg6103b01bf4d1dc69f311d27b)OK, thanks! Looks reasonable - I'll try it.

[10:41](#msg6103d7471a1db149e9ecc97a)@hiiamboris I added two-way reactivity to the colors dialogue; I also implemented your tip for subpixel precision - it looks better now. Thank you once again!

hiiamboris

[10:41](#msg6103d75b1a1db149e9ecc99b):+1:

planetsizecpu

[11:32](#msg6103e351b8422d6f4f140ac3)Well, here is the new L25, with the @GalenIvanov Truchet in the background, I did it in soft tones to not disturb the player. I think that with this I end the summer onslaught and I will take a well-deserved vacation 😄

[11:32](#msg6103e35e926ce249e5924e30)\[!\[Cavetest251.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/DJyE/thumb/Cavetest251.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/DJyE/Cavetest251.gif)

GalenIvanov

[11:34](#msg6103e3b2e9aaeb7fbe2cfa70)@planetsizecpu Nice!

planetsizecpu

[11:41](#msg6103e554b8422d6f4f140f9e)Thx @GalenIvanov this level name is "Vertical Garden", I credited you on the level config file for the background help. 😉

GalenIvanov

[11:41](#msg6103e57f23956a5aa463f424)@planetsizecpu Thank you! I appreciate it!

greggirwin

[17:40](#msg61043993926ce249e5931938)Great to see collaboration and feedback in the community. The new level is great @planetsizecpu. Like glowing fungus on the walls.

[17:46](#msg61043b00f4d1dc69f31311dc)@GalenIvanov I see you changed shadow from pair to integer on the display. Makes sense if X and Y are always the same. But...you know me...\*could* they be different? That is, can it render shadows with different X/Y values, or will that whack calcs?

gltewalt

[17:47](#msg61043b1af4d1dc69f31311f3)@planetsizecpu Just imagine how much fun you're going to have when ports for sound comes

greggirwin

[17:52](#msg61043c633a178069da956b22)Right now, I have no hope of predicting what a pattern will look like, or where changes kick in that break shapes, etc. It's fun, but also makes me want a TruchetTurtle, where I can watch it walk around to generate a pattern, maybe highlighting tiles or rules as they are applied to its current state. I don't know if that's remotely possible, as I haven't looked at the engine, but I think a number of us here like Logo and L-Systems for those reasons; seeing how a pattern emerges, and how we interpret it, like cloud-gazing.

GalenIvanov

[19:30](#msg61045347c9f8852a9717ebc5)@greggirwin Regarding shadow - you are right, the reason I changed the indicator to an integer was that X an Y of the pair were equal. There is no problem at all for the calculations to use different values for X and Y for the shadow pair, I need just one more slider in the interface. Alternatively, I was thinking (before your note :smile: ) about a graphical control, something like this (a quick test):

[19:30](#msg61045364e9aaeb7fbe2df8db)\[!\[Shadow-offset.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/TNuW/thumb/Shadow-offset.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/TNuW/Shadow-offset.gif)

hiiamboris

[19:31](#msg6104539d23956a5aa464eb6d)Can't you make shadow reactively update image in real time?

greggirwin

[19:32](#msg610453b723956a5aa464eb94)That's a \*very nice* direct interface for it. Now, .... (@!#$%&amp;* @hiiamboris beat me )

GalenIvanov

[19:32](#msg610453b96ccf813819e7c3a5)I can try

hiiamboris

[19:32](#msg610453c2f4d1dc69f31348f1):D

greggirwin

[19:33](#msg610453f08587b302bfd2db2c)I was going to propose doing it in a preview, so your grid in the shadow selector is actually a subset of the full canvas, so it can be fast.

GalenIvanov

[19:34](#msg610454471a1db149e9edea05)I'll see what I can do.

[19:37](#msg610455128587b302bfd2ddac)About predicting the pattern - well, I'll write an explanation / manual. I can visualize the tiles one after another and not at once.

[19:38](#msg610455449e84ba381e4b3b5b)The order will follow the order in which the tiles are generated - and it's random :smile:

greggirwin

[19:40](#msg610455c01a1db149e9ededcd):^)

GalenIvanov

[19:41](#msg610455e136b0b97fa2d839c9)And regarding the shadow preview - I think what a human being will imagine is placing a light source, so the shadow will be opposite the marker across the center.

greggirwin

[19:42](#msg6104563858232d5ab4f32c18)There's an interesting aspect to the direct selection approach for pairs, aligned with @toomasv's recent report on shape clipping. By providing a shape in a direct selector like this you automatically constrain the possible values a user can select, which would be very hard to do beyond simple shapes.

[19:43](#msg6104564f23956a5aa464f105)@GalenIvanov agreed.

planetsizecpu

[19:53](#msg610458ac72c37b6f45816c63)@gltewalt It's in my mind the places of the main code where I want to set sound effects, can' t wait to play with sound and test 😀 and It would be fantastic to have a `play` dialect to test on console, it would save a lot of time.

## Saturday 7th August, 2021

cloutiy

[16:44](#msg610eb86ff31bc0605a4dd4e7)Hi what is the best documentation to learn how to GUI with red?

gtzip

[18:45](#msg610ed4c569ca4d0a51397719)Play with this first

[18:45](#msg610ed4d9933ee46b7545bbb1)http://redprogramming.com/Short%20Red%20Code%20Examples.html

[18:48](#msg610ed56b69ca4d0a5139783f)Then go here: https://github.com/red/docs/blob/master/en/vid.adoc

cloutiy

[22:36](#msg610f0ae7025d436054ba9301)Thanks gtzip👍

## Monday 9th August, 2021

gltewalt

[22:48](#msg6111b0a7f31bc0605a53eb3b)@GalenIvanov Can you make an animated GIF for Trutiles of about the size `width: 984 pixels height: 780 pixels` ?

[22:54](#msg6111b21209a1c273826aff03)Also, I get this error when trying it

```
*** Script Error: float! type is not allowed here
*** Where: eval-set-path
*** Stack: view layout eval-set-path
```

## Tuesday 10th August, 2021

gltewalt

[02:55](#msg6111eaa37bc44d0a47134da1)@hiiamboris There is nothing in `colors` on my linux.

https://gitlab.com/hiiamboris/red-codex/-/blob/master/redcodex.red#L66

[02:56](#msg6111eac769ca4d0a513fc783)

```
*** Script Error: color-mix/pure does not allow none! for its c0 argument
*** Where: either
*** Stack: main object object object object color-mix
```

[02:57](#msg6111eb0329b165332e6ae45f)

```
>> system/view/metrics/colors
== #()
```

ne1uno

[02:59](#msg6111eba57bc44d0a47134f3d)anyone try `tiger.red` with recent version? something changed in `draw`? getting blank screen

gltewalt

[03:06](#msg6111ed3f09a1c273826b7679)works for me

[03:07](#msg6111ed6969ca4d0a513fcd61)well, august 4

GalenIvanov

[03:50](#msg6111f7713eec6d41d14aab3a)@gltewalt I'll try to make an animated GIF of TruTiles and will inspect the error.

[07:07](#msg611225bb8fc359158c619b18)@gltewalt Here's a GIF (4 MB. 985x560 pixels)

[07:14](#msg61122740025d436054c0fb51)\[!\[TruTiles.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/Pl7h/thumb/TruTiles.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/Pl7h/TruTiles.gif)

hiiamboris

[07:18](#msg611228463eec6d41d14b112e)@gltewalt it's a known issue, about colors.

gtzip

[07:49](#msg61122f9d8fc359158c61b0e8)Make it work

hiiamboris

[09:25](#msg611245f669ca4d0a514085c9)not a priority for me

[09:43](#msg61124a4e9484630efa2e481c)just populate `colors` with what you want

[09:49](#msg61124b8d949a3d73862b6064)Code Explorer awaits for a full rewrite using Spaces, but also not a priority

gltewalt

[17:18](#msg6112b4f44b7707158f75c868)Well, if you'd like it to be part of a showcase..

[17:26](#msg6112b6da69ca4d0a51418373)  
&gt;

hiiamboris

[17:49](#msg6112bc2909a1c273826d2ad8)GUI app that has to reinvent scrollbar and text list controls is probably the worst showcase item ever ☻

GiuseppeChillemi

[18:22](#msg6112c3f72453386b6c44bdfe)@hiiamboris  
&gt; Code Explorer awaits for a full rewrite using Spaces, but also not a priority

What is this?

hiiamboris

[18:37](#msg6112c74d7555e333510415d5)https://gitlab.com/hiiamboris/red-codex

GalenIvanov

[18:54](#msg6112cb667555e33351041ffc)@gltewalt You are welcome! On what platform you get the `Script Error: float! type is not allowed here` error and which Red build?

gtzip

[22:29](#msg6112fdd58fc359158c637599)Linux. August 4th. I need to try a new build but im afk for the evening

[22:30](#msg6112fdec4bfde341d952e7fd)This is the other me on mobile

[22:31](#msg6112fe2d69ca4d0a514227ed)Well red spaces, or red codex done in red spaces, should be a showcase item

## Wednesday 11st August, 2021

gltewalt

[02:23](#msg611334953eec6d41d14d5d56)@GalenIvanov `Red 0.6.4 for Linux built 10-Aug-2021/16:56:38-06:00 commit #3124920`

TimeSlip

[02:53](#msg61133bbd2453386b6c45c051)@GalenIvanov Awesome. I love that "rendering" gadget.

## Friday 13th August, 2021

GalenIvanov

[19:16](#msg6116c50b025d436054cb3df3)@TimeSlip Thank you!

## Saturday 14th August, 2021

GiuseppeChillemi

[14:19](#msg6117d10b7555e333510eeb3b)Do we have a "last focused" face in VID?

hiiamboris

[14:27](#msg6117d2b829b165332e779b21)no

GiuseppeChillemi

[16:24](#msg6117ee477bc44d0a472026a8)Thanks, so I need to implement it manually. It is needed to have buttons that could be used with multiple gui elements like lists.

## Sunday 15th August, 2021

GalenIvanov

[08:04](#msg6118ca7d3eec6d41d1591dfa)@gltewalt Sorry for the delayed answer - I upgraded Red to Red 0.6.4 for Windows built 12-Aug-2021/4:26:03+03:00 commit #5398bf0 and TruTiles is working fine - no errors at all. Maybe the issue manifests itself only on Linux?

## Friday 20th August, 2021

gltewalt

[04:20](#msg611f2d74e8de9946b42e977e)Could be, since it's gtk backend

## Saturday 28th August, 2021

toomasv

[14:15](#msg612a44e84c7be06b7989347c)On Windows there seems to have been regression somewhere around July 29th. On July 29th build `fill-pen` in following code still works, on July 31st and later builds it doesn't any more:

```
view [box 100x100 draw [fill-pen red line-width 3 pen blue shape [move 2x2 line 97x2 97x97 2x97 close]]]
```

`fill-pen` works in this case only if inserted in the end of shape:

```
view [box 100x100 draw [line-width 3 pen blue shape [move 2x2 line 97x2 97x97 2x97 close fill-pen red]]]
```

@qtxie

planetsizecpu

[17:27](#msg612a721cf428f97a9f56da8c)Oh. Despite I don't use `draw` today tested my game on latest build available, nothing to report but a lot of fun on L24.

[17:28](#msg612a723f67e789189cc995df)\[!\[cavetest242.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/bPa8/thumb/cavetest242.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/bPa8/cavetest242.gif)

## Sunday 29th August, 2021

qtxie

[02:47](#msg612af5294c7be06b798a94a3)@toomasv Thanks. Pushed a fix.

toomasv

[05:24](#msg612b1a17d9a141754dbf76bb):+1: Thanks!

## Thursday 16th September, 2021

GalenIvanov

[11:19](#msg61432852f3449e13a4771bb1)I added two more tesselations to \[TruTiles](https://github.com/GalenIvanov/Graphics-Red/blob/master/TruTiles.red):

[11:20](#msg6143286ff3449e13a4771be7)\[!\[TruTiles-6-3-3.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/R7Zp/thumb/TruTiles-6-3-3.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/R7Zp/TruTiles-6-3-3.png)

[11:20](#msg61432879d9a141754df38cb0)\[!\[TruTiles-12-6-4.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/1Rzm/thumb/TruTiles-12-6-4.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/1Rzm/TruTiles-12-6-4.png)

[11:23](#msg61432949d206b85e4f9f6dad)The interface will be substantially changed, that's why I haven't rearranged it at all. (Load and Save are still only UI elements not connected to actual code)

hiiamboris

[11:29](#msg61432a8111793469661da449):clap:

toomasv

[12:27](#msg61433849f3449e13a477431b)Very nice, @GalenIvanov !

GalenIvanov

[12:44](#msg61433c2a5cfd665e522af51c)Thank you, @hiiamboris and @toomasv !

planetsizecpu

[14:50](#msg614359c9d206b85e4f9fdec0)Great job @GalenIvanov

greggirwin

[15:55](#msg6143690111793469661e38c0):+1:

GalenIvanov

[17:50](#msg61438401fd7409696e154871)Thanks, @planetsizecpu and @greggirwin !

greggirwin

[20:57](#msg6143afc25b92082de1a661ee)This is interesting, and a quick read. It is something we want to consider for Red apps with shiny UIs, but also kind of ties to the recent notes on `compress` since so many formats use it internally.

https://www.zachleat.com/web/vector-raster-split/

## Friday 17th September, 2021

GalenIvanov

[07:06](#msg61443e7213ac9b6b83d3dbc9)@greggirwin Nice read! With hindsight, it's a logical step to split the image into vector and raster layers.

planetsizecpu

[10:56](#msg61447467f3449e13a479ff1c)Very interesting Gregg thx

greggirwin

[17:02](#msg6144ca0ef3449e13a47ac5d5)I don't know what SVG or other vector formats support, but since `draw` allows us to specify raster image elements, we can do this easily. This is just brainstorming, but we should be able to have a standalone "format" which is a combination of embedded raster image data, vector commands, and a `draw` spec which generates a complete image.

How this should work exactly, I don't know. :^) But just as Postscript required an embedded interpreter, this could be a use for libRed in other contexts. The main possibility it opens up, though, is a programmable mixed mode editor. We're not going to compete with Photoshop, but it's another example where a basic core and plugin model could work well.

And because it's all Red, not only can you do the obvious things like write fast plugins in R/S for image processing, including RedCV, (and we do still want an internal effect pipeline and a `convolve` kernel), but extensions that programmatically identify all the lines, boxes, circles, etc. and apply effects to them. Plugins to optimize raster elements. Or go one step further and think about the `animation` R&amp;D @GalenIvanov is doing. Not only can you can vector and raster data, but code that operates on it. Not just animations, but potentially an API for each image, which may include standard code that comes from the LiveImageIDE. e.g. blur, go gray, alter transparency, parameterized badge. Now you're not including dozens of variations of each image for different states or uses, just one that can adapt as needed.

Respectech

[20:27](#msg6144fa2813ac9b6b83d58bfc)ImageMagick, GraphicsMagick, FFMPEG and GStreamer are all packages that come to mind that \*could* be replaced by a single tool based on a Red draw format.

## Saturday 18th September, 2021

GalenIvanov

[07:36](#msg614596f4f3449e13a47c71c5)@greggirwin All this looks like a good match for Red and is an interesting field for research. We don't need to reinvent PDF though (btw a nice project would be a Draw to PDF converter, like Processing has render to PDF mode)

pekr

[07:58](#msg61459c1399b7d975281748dc)Images are different to video imo. You need to do decoding the format, frames, sync audio for the playback and keep your CPU as calm as possible :-) I do agree with the PDF area - it is an industry standard, even for a long term archiving of documents. The ability to work with PDF forms is a big corporate win.

ldci

[09:49](#msg6145b6194c7be06b79c46771)For PDF:have a look here to Gabriele Santilli’s rebol code : http://www.rebol.org/view-script.r?script=pdf-maker.r

greggirwin

[18:02](#msg614629b3f428f97a9f9275c8)PDF is Postscript (plus compression, embedded fonts, and other features), and Postscript is Forth at its heart; also a great example of a DSL. Being a Forth descendent, Red is a great fit. Automatic processing of PDF docs has many uses, but I remember @giesse saying the pain is in all the other embedded bits if you want to render it. If we only care about the data, it may be a different story.

giesse

[18:36](#msg614631c167e789189c05e6a8)there's a lot of complexity if you want to read/render PDF. generating PDF though is much easier so long as you don't need to support all the features of the spec.

## Sunday 19th September, 2021

henrikmk

[12:07](#msg614727ff5739ab2df8ffc468)PDF or PS is surprisingly easy to generate from a VID layout. Treat your PDF as a face tree, emulate faces, and you can basically use your VID dialect directly to generate PDFs, just by parsing the face tree, like View would.

pekr

[16:38](#msg6147679c99b7d975281ae6f5)I don't want to generate PDF. I want to open PDF, read its content, read/write form fields, etc.

giesse

[17:53](#msg6147790713ac9b6b83da949d)@pekr that's A LOT of code to write. Who's gonna pay to write it? I don't see it happening. Use an existing solution.

GalenIvanov

[18:02](#msg61477b537cd57813a8d393be)I mostly need to generate PDFs like these: \[113 Small Serpentonimo Puzzles](https://krazydad.com/serpentominos\_small.pdf) and \[60 Medium Serpentonimo Puzzles](https://krazydad.com/serpentominos\_medium.pdf). I used Processing and Python (Processing.Py) then.

## Tuesday 21st September, 2021

JacobGood1

[13:17](#msg6149db5199b7d9752820692e)@pekr you could use another language lib to read from pdf then spit out some IL that you could further read from red

## Saturday 9th October, 2021

cloutiy

[20:30](#msg6161fbcacd4972068b3a9e04)Hi is there a way to make faces "draggable"?

[20:30](#msg6161fbfaf2cedf67f9770025)For example if one wanted to make a form designer?

greggirwin

[20:32](#msg6161fc5da41fd20699d459ef)`view [size 800x600 button loose "Drag me"]`

[20:32](#msg6161fc6829ddcd0293131c4a)The `loose` facet is the key.

cloutiy

[20:35](#msg6161fd25d3ae402e473c3990)Wow. So simple. Speechless lol.

[20:39](#msg6161fdf2fb8ca0572bb1ef8b)And i can then get each face's x and y and a couple more parameters to somehow translate this into an html document. Well at least this is what id like to try working on...cause who likes to code in html...

[20:46](#msg6161ffbb9d20982e4faf0a72)Programming in red is the funnest. So much fun exploring. And the language i feel most productive in.

## Sunday 10th October, 2021

planetsizecpu

[07:04](#msg61629064ee6c260cf70dedbf)This oneliner may help you @cloutiy `view [size 800x800 at 10x10 b: base 200x200 gray loose on-drag [c/offset: b/offset + b/size] at (b/offset + b/size) c: base 5x5 red loose on-drag [b/size: (c/offset - b/offset)]]`

cloutiy

[15:24](#msg616305bba41fd20699d6787d)@planetsizecpu thank you!

mikeyaunish

[19:19](#msg61633ccff2cedf67f9799f19)I know built in styles are kept in system/view/VID/styles. Is there a place I can see all of my custom styles?

hiiamboris

[20:03](#msg616346f6fb8ca0572bb49f68)No, they only exist during View layout creation, \[inside `layout` func](https://github.com/red/red/blob/7218fb408d65d5ee05d4271a5ff8445c66c231d2/modules/view/VID.red#L527).

## Monday 11st October, 2021

mikeyaunish

[05:11](#msg6163c765fb3dcd4e881d63f8)@hiiamboris - Thanks - I'll work with that.

## Wednesday 13th October, 2021

cloutiy

[00:37](#msg61662a613f09d857360dbc5e)How can i create a new face at runtime. For example in response to a button click event i want to create a new button and put in on the canvas aka base

Respectech

[01:54](#msg61663c5e38377967f44bc5d0)I haven't done it in Red, but in Rebol I created the face and then appended it onto the parent-face/pane block, and then did a `show` on the parent-face.

cloutiy

[02:11](#msg6166405198c13e7550d08ffc)Ok i will try this approach.

ldci

[08:15](#msg6166958dfb3dcd4e8823d224)@cloutiy You can also use visible? facet (true or false) of the face

planetsizecpu

[08:22](#msg616697323f09d857360eaab6)@cloutiy you can create the new face with `f: make face! [type: 'base size: ...` and later `append` it to the main face with `append (your main face)/pane get(f)`

cloutiy

[16:27](#msg616708f538377967f44d8bb6)`append face/parent/pane f` did the job! Inside of `make face! [...]` with which property do i specify the `loose` if i want the new face im creating to be draggable?

[16:28](#msg61670931d78911028ad8160d)I did a `probe` and wrote the object to file to see all the properties available but didnt find `loose`

[16:46](#msg61670d4cf2cedf67f9823b4a)Mmm could it be `options: [drag-on: 'down]`

[16:47](#msg61670db3ee6c260cf717fa42)Ya baby that it is. Now i can click a button to add new buttons that i can drag around lol

planetsizecpu

[16:50](#msg61670e4898c13e7550d2635f)IIRC you must add `'loose` after `make face...` but not sure and I'm on phone now 😐

greggirwin

[18:46](#msg616729907db1e3753e3bc07a)@cloutiy you figured it out. You can see in %VID.red (line 306) that `loose` maps to that option.

## Friday 29th October, 2021

planetsizecpu

[13:33](#msg617bf841a41fd20699110741)Just preparing for halloween, good time to remember L21 🙂 🎃

[13:34](#msg617bf873ee6c260cf749bb1f)\[!\[cavetestHW.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/BT4L/thumb/cavetestHW.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/BT4L/cavetestHW.gif)

greggirwin

[18:00](#msg617c36befb3dcd4e8856eef0):^)

## Monday 1st November, 2021

zentrog:matrix.org

[01:01](#msg617f3c7038377967f48691e5)R.I.P. wheelbarrow 😆

greggirwin

[18:27](#msg618031983f09d857364aebd0)It got its revenge via the flying sphere.

planetsizecpu

[18:40](#msg61803494f2cedf67f9bd5223)On the bottom screen there are more goblins and another battle sphere 😅

## Friday 5th November, 2021

planetsizecpu

[15:32](#msg61854e88f2cedf67f9c9407f)Today realised L8 stage had some room for upgrade, so covered the lava river on the center with a new floor and a kart handle, of course a few more gold was necessary 😁

[15:32](#msg61854e91d78911028a1f2fd5)\[!\[cavetest86.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/gbaP/thumb/cavetest86.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/gbaP/cavetest86.gif)

GalenIvanov

[18:03](#msg6185720a29ddcd02936590e5):+1:

greggirwin

[20:36](#msg618595e2a41fd206992723d1)Nice. :^)

## Saturday 6th November, 2021

planetsizecpu

[11:13](#msg6186636bfb8ca0572b070eac)Thx guys, this level has some hidden tricks, I played for hours and never get enough, same on L3 and L19. I can't figure if is playable on linux due to the elevator high speeds.

## Sunday 7th November, 2021

gltewalt

[18:50](#msg61881ffc3f09d857365d30af)@planetsizecpu This is wrong in your README  
`red -r -t [target OS] cave.red`

`cave.red` is in `src` directory

[18:56](#msg61882149a41fd206992d140f)And...

[18:57](#msg6188218efb8ca0572b0b1c22)

```
*** Access Error: cannot open: %DATA/cave-in.jpg
*** Where: decode
*** Stack: layout load
```

## Monday 8th November, 2021

planetsizecpu

[07:44](#msg6188d57a38377967f49d043e)Ah my mistake, Thx @gltewalt I amended the text early this morning 😉

## Friday 12nd November, 2021

gchiu

[00:53](#msg618dbafcfb8ca0572b18386a)@pekr I used to emulate filling in pdf forms by using ghostscript to turn PDFs to postscript, and inserting postscript into this to get that effect. All from R2/Vid. I did a video on this once.

[00:54](#msg618dbb2ffb8ca0572b1838aa)Surprised that the VID editor isn't in Red. Since a handy little thing.

greggirwin

[08:36](#msg618e2787d78911028a33af24)Which VID editor @gchiu?

gchiu

[08:54](#msg618e2bdc8c019f0d0b8e3530)@greggirwin the one that comes up when you type "editor" ;)

[09:06](#msg618e2e9e29ddcd029379d776)Admittedly it's only a few buttons and an area field

[09:23](#msg618e3285fb3dcd4e88806bd5)Is a table face/widget in the works?

hiiamboris

[09:23](#msg618e32ab3f09d857366b2140)https://gitlab.com/hiiamboris/red-spaces/

pekr

[09:53](#msg618e3981cd4972068ba1bda3)Does not a grid-view in terms of red-spaces require the whole red-spaces infrastructure?

hiiamboris

[10:16](#msg618e3f1afb3dcd4e8880891e)Of course it does ;)

greggirwin

[18:05](#msg618ead0598c13e75502f2949)Ah, the text editor built in, yes. I thought you meant an editor \*for* VID, like a GUI IDE.

[18:06](#msg618ead3f3f09d857366c35a1)@toomasv did a Notepad clone some time back.

gchiu

[18:09](#msg618eadddfb8ca0572b1a3874)@hiiamboris list-test3.red causes a stack overflow for me

[18:11](#msg618eae3a9d20982e4f16d2f4)web-test.red locks up

greggirwin

[18:12](#msg618eae75d78911028a34e1f3)@hiiamboris noted recently that some changes in Red broke `red-spaces`.

gchiu

[18:12](#msg618eae7fd78911028a34e1fd)@greggirwin I tried your requestors ... is there tabbing enabled between widgets?

[18:12](#msg618eae8e9d20982e4f16d466)I just tried to tab out of the field in the request-text

[18:12](#msg618eae91ee6c260cf7750c56)to the button

hiiamboris

[18:12](#msg618eaea23f09d857366c38ce)@gchiu you have to use Red build of early september or before, because Nenad broke `forall` in recent builds

gchiu

[18:12](#msg618eaea4cd4972068ba2c5b6)&gt; @hiiamboris noted recently that some changes in Red broke `red-spaces`.

Oh, didn't see that report

greggirwin

[18:13](#msg618eaed938377967f4aa7df6)Not in VID. I'm 90% sure Boris included tabbing in red-spaces. I really want it, but it hasn't made it to the priority list. I think it's even more important than a grid.

hiiamboris

[18:14](#msg618eaefb98c13e75502f2dc7)tabbing is there ☻ be 100% sure

gchiu

[18:14](#msg618eaf01a41fd206993c1fed)So, you'd have to do an on-enter or whatever and then set-focus?

[18:14](#msg618eaf237db1e3753e98297b)&gt; @gchiu you have to use Red build of early september or before, because Nenad broke `forall` in recent builds

And there's no IO for those ones though?

hiiamboris

[18:15](#msg618eaf369d20982e4f16d5bd)no IO for any `master` builds

[18:16](#msg618eaf7ad3ae402e47a47064)and I haven't tested with IO branch because it's too crash-happy

gchiu

[18:16](#msg618eaf883f09d857366c3ab2)It's a little painful but I am using call on view.exe to get my data from my odbc source

[18:17](#msg618eaf9f9d20982e4f16d6b8)I do have r2/encap somewhere ...just need to find it on an old laptop

[18:18](#msg618eafdc38377967f4aa80e2)Maybe, if munge is still working on red, I can format the data as excel and just display my data that way

[18:23](#msg618eb10b98c13e75502f329b)Maybe one can simulate a table view by sticking a bunch of text-lists together, and when you click on an item, it selects the same selected in each of the adjacent text-list??

[18:28](#msg618eb25cfb3dcd4e88818aec)Am I wrong but is RebGUI the best rebol solution still for doing CRUD?

greggirwin

[18:40](#msg618eb517fb8ca0572b1a4938)It would be interesting to see someone try that approach, but it would be very limited in functionality, and probably a real pain because every list's data would be separate. Unless you already have data in a column-store model (which the CSV codec does support natively), you'd have to break it up manually.

No comment on RebGUI as I never used it.

pekr

[18:47](#msg618eb6a998c13e75502f3eef)RebGUI is so far the only kind of complete GUI for Redbol, though with its limitattions too. Gregg, is there more the the Picosheet, than just the code in this blog article? https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html

[18:47](#msg618eb6bfcd4972068ba2d8e4)I do remember @rebolek working on grid a long time ago. Not sure how it ended up ....

ne1uno

[18:53](#msg618eb83698c13e75502f43d0)https://gitlab.com/rebolek/red-styles/wikis/text-table

greggirwin

[18:53](#msg618eb847a41fd206993c344c)@ne1uno thanks. Beat me. :^)

[18:58](#msg618eb93c9d20982e4f16ecb1)@pekr there is no new spreadsheet that comes to mind, but lately my brain is like confetti...in an empty snow globe...with a fan inside. And I'm the snowman.

rebolek

[19:01](#msg618eba11a41fd206993c3920)@ne1uno thanks

[19:02](#msg618eba3fcd4972068ba2e2ab)@pekr it’s working (at least was working with the latest version back when I was working on it)

[19:03](#msg618eba66cd4972068ba2e2fe)The problem is that people got confused and were calling it a "grid" style

[19:04](#msg618ebaa49d20982e4f16f12d)However, it’s called a "text-table" for a reason. It’s a text table, it’s not a grid. It’s a virtual view of text cells. Not a view of a grid of different styles.

[19:05](#msg618ebaddfb8ca0572b1a573b)It means there are some limitations like all rows have the same height and the content of the cell is in Draw only.

ldci

[19:05](#msg618ebb0fd78911028a34fdc0)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/uHy3/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/uHy3/image.png)

[19:05](#msg618ebb139d20982e4f16f1ee)Developped by Ashley G. Truter, RedGui is a fabulous GUI for Rebol

rebolek

[19:07](#msg618ebb598c019f0d0b8f7472)Right, I was working on a few styles for RebGUI. However, Rebol’s VID and Red’s VID are highly incompatible.

greggirwin

[19:07](#msg618ebb5dfb8ca0572b1a587f)All of Ashley's work is great, and used in the real world. He built things because he needed them for his work.

ldci

[19:08](#msg618ebbc6fb8ca0572b1a5945)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/Qwon/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/Qwon/image.png)

[19:08](#msg618ebbc78c019f0d0b8f7524)@greggirwin I agree: an example from the real word made with. RedGui

gchiu

[19:11](#msg618ebc5629ddcd02937b1801)@rebolek so can't select cell contents?

[19:12](#msg618ebc9ca41fd206993c3e2d)@ldci I'm doing pandemic work trying to find out which of our patients requires a 3rd COVID-19 vaccination.

greggirwin

[19:12](#msg618ebcb0ee6c260cf7752ed2)@ldci, +10 as always. :^)

gchiu

[19:12](#msg618ebcb438377967f4aa9dba)So I'm looking at tables and tables of data

[19:15](#msg618ebd522197144e84bffadf)Perhaps what would be great is a container face that can hold a spreadsheet like open Office or whatever

ldci

[19:16](#msg618ebd8a98c13e75502f4f1a)@gchiu Very interested. We’re making similar work : https://www.insight-signals.com

gchiu

[19:19](#msg618ebe4efb3dcd4e8881a633)Well we started in a very bad way. Thousands of patients on immunosuppressive drugs and no database

[19:23](#msg618ebf1efb8ca0572b1a6018)So I've scanned over 5000 letters to pull out the clinical details using parse and placed them into rdbms. Instant database. Apart from several days writing parse rules. Just had to convert docx into text first so i could read them. Luckily we dictate our letters in a semi structured format otherwise i would have to send the data to China for their ai systems to work on it for me.

ne1uno

[19:27](#msg618ec02a98c13e75502f5445)MTurk, crowd source. but again, days to setup and unique verify challenges

ldci

[19:30](#msg618ec0eef2cedf67f9df2832)@gchiu If we can help you, reach me by.$ email

gchiu

[23:53](#msg618efe8c2197144e84c082e2)&gt; @pekr it’s working (at least was working with the latest version back when I was working on it)

Possibly not now. Just tried a demo

[23:54](#msg618efeb4d78911028a3588a7)\*\** Stack: do-events do-actor do-safe offset-to-index  
\*\** Script Error: float! type is not allowed here  
\*\** Where: set-path

[23:55](#msg618efef198c13e75502fe05c)@rebolek I just used the code from here https://gitlab.com/rebolek/red-styles/-/wikis/text-table

## Saturday 13th November, 2021

rebolek

[07:21](#msg618f6791fb8ca0572b1ba3d3)@gchiu Thanks, I’ll check it, I haven’t used the code in a while and probably needs to be fixed to support newer versions of Red.

pekr

[08:23](#msg618f76127db1e3753e99a735)Forgot, so asking - what is actually being hw accelerated via a D2D? Is that drawing, or generally View rendering / refresh?

hiiamboris

[08:40](#msg618f79eed3ae402e47a5fda0)Draw

pekr

[08:54](#msg618f7d56cd4972068ba45b49)\*\*rebgui grid prototype\** Hi all. Digged something out of my old harddrives. Back at the time, I have asked Cyphre to create a better grid for the RebGUI. It was supposed to be open-source and I have paid for the development. The bad thing was, that at exactly the time of release, Ashley changed RebGUI API significantly. It was close to his abandoning of RebGUI, and hence I can't find an R2 + rebGUI release, it would work with ....

http://www.2zone.cz/pekr/rebgui-grid.zip

\- It is face based, but according to doc it supported up to 10K rows before the slow-down.  
\- As a face based, it allowed to have anything as a cell content  
\- Allowed to have hilited row or a cell  
\- Supported keyboard navigation  
\- Supported programatic navigation  
\- Last but not least - virtual data system. The idea was to work directly upon the data block you've received e.g. from a DB query. The grid created virtual column system, so even if you have swapped the columns, it just remapped to the original block and no data shuffling was needed in the original data block.

It might server as an inspiration to get similar design into Red VID. Even if it would be simpler.

hiiamboris

[09:01](#msg618f7f022197144e84c17216)Spaces already support all that and more. Even in this half baked state.

pekr

[09:03](#msg618f7f7cd3ae402e47a60949)Yes, but what will actually happen with Spaces? It can't be blended with VID, or can it? Is that supposed to replace VID one day? That would be radical, as it would probably mean stripping all the native OS mappings out of View, as not needed anymore?

hiiamboris

[09:04](#msg618f7fb77db1e3753e99ba9f)How do you think it works today if not using VID?

pekr

[09:07](#msg618f804229ddcd02937c9024)OK, will have to try that finally. Does it work with latest Main branch?

hiiamboris

[09:08](#msg618f809d7db1e3753e99bca0)@gchiu I just tested Spaces with the IO branch and it works perfectly, at least on W10. You just have to use the CLI console.

[09:09](#msg618f80b3d3ae402e47a60b74)@pekr No, as I told before, master branch has broken `forall` loop.

[09:10](#msg618f8112d3ae402e47a60bd3)I mean you can manually replace every `forall` with `repeat` if you have nothing better to do :)

pekr

[09:10](#msg618f8113d78911028a367b67)Thought it might be a simple fix, but in Red it is a native.

[09:11](#msg618f813d29ddcd02937c91aa)In R2, forall calls forskip and even that is not native :-)

hiiamboris

[09:11](#msg618f8145d78911028a367c21):D

[09:11](#msg618f8153fb8ca0572b1bd4d8)must have been real slow

pekr

[09:14](#msg618f81e0a41fd206993dbb15)btw, sorry for being off-topic in the GUI branch. But I watched your reactive framework improvements PR. When I looked lats time, lot's of text is striked-through, so your improvements do not apply anymore, or were they already (at least partially) accepted?

hiiamboris

[09:15](#msg618f8247f2cedf67f9e0994a)some of my previous thoughts do not apply anymore with latest hash implementations, that's all  
in latest state it has more improved improvements than before ;)

[09:16](#msg618f828598c13e755030cd18)not that there's hope of getting it merged ;)

pekr

[09:17](#msg618f82a2fb3dcd4e88831a89)why it was not accepted then? I can see X there, so maybe not compatible? Those are exactly the improvements we need. Like you did with the JSON coded!

hiiamboris

[09:18](#msg618f82ee7db1e3753e99c10b)X there is because at the time those tests were running, there was a crash in hashtable that Qingtian fixed later

[09:19](#msg618f8320cd4972068ba467f9)and later.. I don't remember, maybe Travis was in a complete failure state back then

pekr

[09:19](#msg618f8327ee6c260cf776bf7d)OK, thanks. If it improves things significantly, and it does seem to, it NEEDs to be merged :-) @greggirwin

gchiu

[16:57](#msg618fee8398c13e7550319f0f)&gt; @gchiu I just tested Spaces with the IO branch and it works perfectly, at least on W10. You just have to use the CLI console.

I just did this - D:\\&gt;red red-spaces\\tests\\list-test3.red and get screen filled with error messages after some ipsum lorem appears in a window

[16:59](#msg618feed629ddcd02937d670e)list-test2.red gives an internal stackoverflow

[17:01](#msg618fef557db1e3753e9a923d)stack overflow on grid-test3.red

hiiamboris

[17:05](#msg618ff06a2197144e84c25229)I don't think you're using IO branch at all.

gchiu

[17:11](#msg618ff1adee6c260cf7779654)Ok, misunderstood you

[17:15](#msg618ff29d3f09d857366ebf02)So, what I need is something like grid-test4 to display table data

hiiamboris

[17:15](#msg618ff2b1d78911028a375a00)do you need IO too?

gchiu

[17:17](#msg618ff334cd4972068ba542da)Ideally yes, otherwise I'd just use http read/write

hiiamboris

[17:18](#msg618ff367fb3dcd4e8883f072)you figured how to build the IO branch console?

[17:18](#msg618ff379ee6c260cf77799a5)you'll have to add `needs: view` to the `environment/console/CLI/console.red` header

[17:18](#msg618ff382fb3dcd4e8883f0c5)to include View module into CLI console

gchiu

[17:28](#msg618ff5c8ee6c260cf7779ec7)Ok, finished the build

[17:33](#msg618ff6ead78911028a3761e5)In VID one could write `clear [ list of faces]` - is there an equivalent here?

[17:34](#msg618ff72129ddcd02937d7807)or, do I have to iterate over all the faces separately and write `clear face/text` or something?

hiiamboris

[17:41](#msg618ff8d1d3ae402e47a6facd)using `foreach-face` is your best bet for faces  
in spaces there's also `foreach-space` and `foreach-*ace` (latter iterates along both)

gchiu

[17:42](#msg618ff8ec9d20982e4f195c25)Hmm. `rename` isn't working in gui-console

[17:42](#msg618ff8edfb8ca0572b1cbf53)&gt;&gt; rename %history.red %history.old  
\*\** Script Error: rename does not allow file! for its from argument  
\*\** Where: rename  
\*\** Stack:

hiiamboris

[17:42](#msg618ff8f929ddcd02937d7b8f)try string

[17:42](#msg618ff903f2cedf67f9e18155)IIRC a known bug

[17:42](#msg618ff91ed3ae402e47a6fb19)hmm no it's probably not working at all

gchiu

[17:43](#msg618ff9497db1e3753e9aa326)cli is okay for rename

hiiamboris

[17:43](#msg618ff94f38377967f4ad0217)https://github.com/red/red/issues/4307

gchiu

[17:45](#msg618ff9b7d78911028a376725)So, it was fixed for the cli, but not for the gui-console.

hiiamboris

[17:45](#msg618ff9c33f09d857366ecc12)it was recently implemented in the master branch, should work on both consoles

gchiu

[17:45](#msg618ff9cdf2cedf67f9e183a1)doesn't

hiiamboris

[17:46](#msg618ff9d938377967f4ad0312)does for me

[17:46](#msg618ff9de98c13e755031b6de)`Red 0.6.4 for Windows built 6-Nov-2021/19:36:18+03:00 commit #30e5312`

[17:46](#msg618ff9f298c13e755031b70a)it should work since July

gchiu

[17:48](#msg618ffa5f98c13e755031b7c8)&gt;&gt; about  
Red 0.6.4 for Windows built 13-Nov-2021/2:50:23  
doesn't using io branch

hiiamboris

[17:48](#msg618ffa6ffb8ca0572b1cc278)because IO branch was forked years ago

gchiu

[17:48](#msg618ffa74d78911028a37690c)oh

[17:48](#msg618ffa852197144e84c2658a)how do I get the commit?

hiiamboris

[17:48](#msg618ffa87ee6c260cf777a7cb)that's why it still works with spaces lol ;)

gchiu

[17:49](#msg618ffa9d2197144e84c265b3)I see. This is very confusing

hiiamboris

[17:49](#msg618ffaa338377967f4ad049d)try `git cherry-pick d45034d`

gchiu

[17:50](#msg618ffad8fb3dcd4e8883fe62)sorry, I mean how do I display the commit information for a build?

hiiamboris

[17:50](#msg618ffaeaa41fd206993ea9cc)custom-built consoles don't show commit

[17:50](#msg618ffaf529ddcd02937d7fc2)only those pre-packaged with `red.exe`

gchiu

[17:52](#msg618ffb6898c13e755031b9ec)looks like things are in a state of flux!

hiiamboris

[17:56](#msg618ffc467db1e3753e9aa885)aren't they always ;)

gchiu

[17:56](#msg618ffc607db1e3753e9aa8d0)R2 isn't!

hiiamboris

[17:58](#msg618ffcac29ddcd02937d8257)but that's where we pick it up! ☻

## Sunday 14th November, 2021

gchiu

[06:46](#msg6190b0bff2cedf67f9e2e339)I want to set a text field to a status message, do a HTTP request and then update the tex field with the result. But it waits until the HTTP request is finished. Is there a way to know when a field has been updated so I can then make my request? eg. a callback?

[08:36](#msg6190ca9ecd4972068ba6df76)Well, I got my app working. GUI is in Red, and using r3 webserver with odbc to provide the data. Going to have to use excel to display the data as I don't have the time to investigate how to implement the grid views available.

hiiamboris

[08:41](#msg6190cb9dfb8ca0572b1e48ed)https://gitter.im/red/red/code?at=61815440ee6c260cf7562a4c

pekr

[08:47](#msg6190cd2c3f09d85736705d3a)@hiiamboris How difficult is it to restyle the table? Thinner lines, different colors, etc.

hiiamboris

[08:55](#msg6190cf05d78911028a390182)change https://gitlab.com/hiiamboris/red-spaces/-/blob/master/styles.red#L89-105

pekr

[08:56](#msg6190cf342197144e84c3fbc3)thanks ....

hiiamboris

[08:56](#msg6190cf433f09d85736706106)or `set-style 'cell [style]`

[08:57](#msg6190cf8a3f09d857367061b2)there's documentation you know ;) https://gitlab.com/hiiamboris/red-spaces/-/blob/master/quickstart.md#styling

gchiu

[09:45](#msg6190daa9f2cedf67f9e32dea)Well it turns out i don't need io as i can use http read write so I'll try an older red to see if i can use this grid view.

[09:48](#msg6190db867db1e3753e9c4b59)Munge3.r still works for writing excel spreadsheets though.

pekr

[15:44](#msg61912eebee6c260cf779f252)@hiiamboris Looked briefly into Red Spaces docs and the system imo needs simplification and / or abstraction. For me, it is hardly acceptable, during sty style definition, to see the stuff like `function`. User of the system or style creator, should not eventually be exposed to unnecessary internals of the language.

On the other hand, I like flexibility and I do remember being a bit nervous about declarative nature of R3 GUI, where it met the R3 code - it used comments to describe args, and without that, I was nervous about where those arguments are coming from.

Let me compare the descriptive nature of R3 GUI to Red Spaces:

```
clicker: [

	about: "Single-action button without text. Basis of other styles."

	facets: [
		size: 28x28
		area-color: 60.70.150
		edge-color: 96.96.96
	]

	options: [
		size: [pair!]
		area-color: [tuple!]
	]

	faced: [
		area-size: ; set by resize
		pen-color: ; set by on-draw
		area-fill: ; set by on-draw
	]

	draw: [
		pen pen-color
		line-width 1.5
		grad-pen cubic 1x1 0 40 area-fill
		box 1x1 area-size 3
	]

	actors: [
		on-draw: [
			face/facets/area-fill: make-fill face/facets/area-color face/state/mode
			color: get-facet face 'edge-color
			if face/state/mode = 'over [color: color / 2]
			face/facets/pen-color: color
			arg ; return draw block
		]

		on-click: [ ; arg: event
			face/state/mode: arg/type
			draw-face face
			if arg/type = 'up [do-face face]
			none
		]
	]
]
```

vs stuff like:

```
;--  I am not sure I want to see this stuff in a user space:

button [
	function [btn] [

;-- Why double blocks? Paths in GUI dialect (list/item) make me a bit nervous, not used to them, but let's see

list/item [[pen cyan]]

paragraph [[
	(self/font: serif-12 ())
	pen blue
]]

;-- would change following, into ..... 

define-handlers [	
	inf-scrollable: extends 'scrollable [			

handlers: [
         inf-scrollable: scrollable [

;-- you've made 'with almost redundant. Can Spaces have something like Options in VID or do we have use with all the time?

field with [size: 100x30 text: "edit me"] ;--Spaces
field 100x20 "edit me" ;-- VID
```

When ppl were working on VID 1.3 and later 2.0 for R3, there were several attempts. The general agreement though was, that styling has a different target than programmers. Any language constructs should be hidden in lower layers, if possible, not being exposed to style makers, etc.

hiiamboris

[16:08](#msg6191346ffb8ca0572b1f11d3)Thanks for the feedback @pekr.

```
button [
    function [btn] [
```

You don't have to use functions in styles. They are only for advanced use cases.

\---  
&gt; Why double blocks?

I guess you're right, I could do away with single blocks, just checking if the first word is `func` or `function`... I'll add that into my todo list. This will forbid one from adding any setup code to the styles though.

\---  
&gt; Paths in GUI dialect (list/item) make me a bit nervous

Without paths how would you style a specific widget differently than a generic one?

\---  
&gt; would change following, into .....

You can do that: `handlers: :define-handlers`. This goes against Redbol function naming rules though. `extends` also adds meaning IMO. I disagree with you here ;)

\---  
&gt; you've made 'with almost redundant. Can Spaces have something like Options in VID

High level dialect for Spaces is not designed yet. `with` is just there as a PoC and so you wouldn't have to work at View level (e.g. `make face! [...]` etc).

[16:18](#msg619136cdee6c260cf77a00bf)Also you must be confusing event handlers with actors. Every space supports almost the same set of actors as any View face, defined currently thru `with` only.

`handlers` are meant for widget builders, to define spaces inner logic that cannot be overridden with an actor. You take it for granted in View because you don't see what the OS and all the huge amount of R/S code in the View module are doing for you. Spaces do not have any low-level backup. They're using handlers for that.

[16:26](#msg619138992197144e84c4cb0e)It's all in the docs btw ;)  
!\[](https://i.gyazo.com/a02bebbeb73f5d70bfa366f8d798bdf0.png)

[16:28](#msg619139488c019f0d0b945160)I'll rephrase that part.

greggirwin

[16:31](#msg619139e29d20982e4f1bc52b)`Extends` raises and old OOP naming question of mine. Sometimes you constrain aspects, or override them, in an inheritance model. "Extend" implies additions. Options might be `[modifies customizes adapts]`

hiiamboris

[16:33](#msg61913a69fb3dcd4e88865dbf)hmm.. but it \*\*is\** addition

[16:35](#msg61913ac8a41fd20699410baf)it's not override

[16:38](#msg61913b9bee6c260cf77a0acb)@pekr looks like I haven't gotten to the part of actually triggering any actors or letting one define them ;) it's still in the todo-list...

[16:39](#msg61913ba7fb3dcd4e88866019)that's why I haven't documented it  
anyway it's only good for static spaces...  
you still need to use `handlers` for many dynamically generated spaces, so I don't know how to make that any simpler

greggirwin

[16:40](#msg61913c152197144e84c4d246)My comment was not about Red Spaces, but a general naming issue, as it may be used in dialects.

## Tuesday 16th November, 2021

gchiu

[04:28](#msg6193338498c13e7550386477)Is it the expected behavior for a text-list .. in VID the action repeats if you click a selected text-list item, but Red doesn't fire.

`cnt: 0 view layout [text-list data ["A" "B" "C"] [cnt: cnt + 1 print cnt]]`

[05:15](#msg61933e78f2cedf67f9e82643)Ok, I see the default actor is on-change

## Wednesday 17th November, 2021

planetsizecpu

[20:51](#msg61956b61b480cc50de5b67c8)This week some breaks allowed me to push ahead a new L26 level, the stage has volcano theme and I mixed new design with elements from old lava levels. The new caves showed hidden flawns in the gravity func that needed update. Hope to have it ready on friday, so we can play this weekend. 😃

greggirwin

[21:32](#msg619574d14e750b10a2c878a6):+1:

## Thursday 18th November, 2021

GalenIvanov

[04:49](#msg6195db4963c1e83c95154372):+1:

## Friday 19th November, 2021

planetsizecpu

[15:52](#msg6197c84e8853d3164004574a)I released L26 this afternoon, hope to upload some demo gif next week!

## Saturday 20th November, 2021

GiuseppeChillemi

[12:16](#msg6198e70c026dc63ca6083d17)FYI: I have cancelled the 3000USD @viayuve bounty for the Telerik UI like DATAGRID functionality request he has added to my DATAGRID bounty. He seems not anymore in the Red world and I suppose he has lost interest. It remains just mine https://github.com/red/red/wiki/Bountieshttps://github.com/red/red/wiki/Bounties

## Sunday 21st November, 2021

rebolek

[19:55](#msg619aa43375fa481649498cb9)@gchiu I fixed `text-table` so the example works again. It was possible to pass `float!` to `pair!`, Red is more strict now in this regard, so conversion to `integer!` is needed first.

## Monday 22nd November, 2021

gchiu

[01:14](#msg619aeeed8f98cb081183005b)Thanks. I'll give it a go.

planetsizecpu

[08:58](#msg619b5bcc42fc2863b21fa1c5)Testing new L26, the stage seems ready to be the final version.

[08:59](#msg619b5be5c2cc0e5343c27c49)\[!\[cavetest261.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/J1xB/thumb/cavetest261.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/J1xB/cavetest261.gif)

rebolek

[09:19](#msg619b6090a9c8eb44c4f07b8d)cool :-)

GalenIvanov

[11:15](#msg619b7be1197fa95a1c85614b)@planetsizecpu Nice!

planetsizecpu

[13:51](#msg619ba05ba9c8eb44c4f108fd)Thx guys, I had to remove some elevator and lava flux, so the action goes finest on slow computers.

greggirwin

[18:30](#msg619be1dec6149e53494436b7)I love the layout of this one, and the shower by the crane. :+1:.

planetsizecpu

[18:52](#msg619be6e742fc2863b220e0c3)Ah yes, there was a lava river in motion on the upper stage, but now there is static water and the lava, not visible here, is at the bottom. I had to cut a bit the gif because the moving flow rised the size to 2Mb 😬 so the static water seems to fall down.

## Wednesday 24th November, 2021

gltewalt

[04:23](#msg619dbe5d42fc2863b224e10a)@planetsizecpu Couple things about cave-in, as a Linux user...

If the cave binary isn't in the root directory, trying to open `%DATA/cave-in.jpg` will fail.  
This is the `relative path vs. absolute path`issue that I came up against when I did `Parse Caddy`. You can't know where a user is going to stick the executable.  
I ended up having a include file that has a giant wall of image data, but if I remember correctly - boris made a macro

\*nix cares about capitalization for directory name, so trying to open`%data/agent-l1.png`, or anything in the `data` directory will fail, because the folder name is `DATA`

[04:27](#msg619dbf1942fc2863b224e20a)To be portable - gonna need to be consistent in the capitalization for directory names

gchiu

[04:32](#msg619dc06f76e3791755011e88)&gt; @gchiu I fixed `text-table` so the example works again. It was possible to pass `float!` to `pair!`, Red is more strict now in this regard, so conversion to `integer!` is needed first.

Where's the link? I can't find it again. Thanks

rebolek

[07:24](#msg619de8978853d316401150f7)@gchiu https://gitlab.com/rebolek/red-styles/-/blob/master/text-table.red

planetsizecpu

[09:20](#msg619e03c076e379175501aef7)@gltewalt Thx for testing! you may be the only one that play my game 😁, it is a good idea to check the directory where the user is, in a next release I will include it. Meanwhile, the README file already included a warning to put the desired executable in the main directory. About the case on `%data` I'm looking at github to modify the folder to lowercase but the only option found is for delete file, as there are a lot of files I am a bit lazy to have to upload everything again on a new folder we will see, I don't promise anything ;-)

[09:23](#msg619e047f75fa48164950e260)@gltewalt If you have time, I would like to see some gif animation with the guards up on elevators, just to see if speed and stop wait time are affordable to play.

[09:24](#msg619e04c18853d31640118b9f)I'm affraid that there are no time for the guards to jump out.

giesse

[18:42](#msg619e87adcdb5c1081a2c7943)@planetsizecpu `git help mv`

gltewalt

[20:12](#msg619e9c9fcdb5c1081a2ca4ec)You could change all instances of `data` in your code to `DATA`, then you wouldn't have to alter the folder name

[20:25](#msg619e9fb06104ea63b6b2fb8a)As soon as it runs again, we can test if the guards have time to jump out

## Thursday 25th November, 2021

gltewalt

[02:20](#msg619ef2f963c1e83c9528c76b)@planetsizecpu Cloned your repository and made changes. Fixed for linux and unix.  
Made a Pull Request that you can look over

[02:27](#msg619ef47cabdd6644e3a33fe2)(grabbing the wheelbarrow allows the guy to walk over the elevator shaft without falling)

planetsizecpu

[07:25](#msg619f3a8475fa481649536da9)Merged, thx @gltewalt

Some elevator holes are designed to allow the boy to cross when grab the wheelbarrow, it is a useful trick. Also note that the elevators don't carry the boy to travel when it has the wheelbarrow on hands, also intentioned, in that case, you'll see the wheelbarrow traveling across the walls.

These days I am trying to fix a bug that occurs when the boy jumps out of the kart and grabs the handle just as the elevator passes over them, I think only occurs in levels L8 and L26. It is a collateral effect that occurs when coinciding the second event while the first is being processed for his service routine, you see the boy in the kart and also holding the handle at the same time grabbed by the kart, but I think he has a simple solution.

[07:57](#msg619f41e8abdd6644e3a3da87)Thx for help @giesse

[15:34](#msg619fad1863c1e83c952a4e1c)Just pushed a fix for the kart issue, seems ok now but I'm testing 😀

gltewalt

[19:25](#msg619fe34776e379175505b637) didnt change the linux binary, so youll need to regenerate the binaries in your repo

planetsizecpu

[21:36](#msg61a001d376e379175505f96f)I'll check it tomorrow thx Greg

## Friday 26th November, 2021

gltewalt

[21:46](#msg61a155cf8853d31640187600)Are there keys to press to access any of the levels for testing?  
I notice in the first level that there's just enough time to get off the lift, but the guards can't seem to get off in time.

## Saturday 27th November, 2021

planetsizecpu

[07:38](#msg61a1e092cd3f06175dd9bb67)Yes @gltewalt `%` Select level, `@` Demo mode. I suggest L26 as it has a platform elevator. Thx for testing 😃

gchiu

[07:40](#msg61a1e104c6149e534950a479)https://youtu.be/4d4uhR-hbr8

[07:41](#msg61a1e12542fc2863b22d5b7a)Demonstration of my fuzzy patient database with data pulled out of 5300 clinical letters using parse

GalenIvanov

[08:59](#msg61a1f36c42fc2863b22d7ff1)@gchiu That's great!

ldci

[10:20](#msg61a20650cd3f06175dda02ca)@gchiu Congratulations.

planetsizecpu

[11:13](#msg61a212c2b5ba9e5a11da6284)Great job @gchiu

[11:14](#msg61a2131fcd3f06175dda195c)@gltewalt I will update the waiting time for elevators on monday, could you please tell what number appear on the big boy mouth when start the game? I use that index trying to adapt the game to the computer speed.

gchiu

[18:54](#msg61a27efcc6149e534951e007)Thanks guys. In the end I couldn't use the IO branch because it was too divergent from main, and I used HTTP read to query the web server to get the data.

pekr

[19:01](#msg61a28096c2cc0e5343d19072)Well, last two weeks, IO seems to be getting IPV6. Nice that it is going to be more complete, but not sure we need IPV6 right ahead from the start.

gchiu

[19:12](#msg61a2831576e37917550aef18)Must be extra work maintaining so many different branches

## Sunday 28th November, 2021

Boum69

[20:53](#msg61a3ec3fabdd6644e3ad16ce)Hello everybody. I'm very proud to announce to you that I've just put on github my first project in Red. It is only a small game I've made a few months ago. It's a brick breaker game (only two levels for the moment: so it s mostly a demo). I have tested it only on Win10. It is possible to play it with sounds thanks to @Oldes sound's library (Bass). Just follow this link, if you want to try it https://github.com/Boum69/Boum-Breaker.git .

[21:00](#msg61a3edd16104ea63b6bd8740)I'm aware that my code could be optmized :)

gchiu

[21:33](#msg61a3f5b8026dc63ca61efde6)@ldci can cv be used for facial recognition to log in instead of using password?

## Monday 29th November, 2021

ldci

[00:54](#msg61a424d3cdb5c1081a37ac56)@gchiu Have a look here: https://ieeexplore.ieee.org/abstract/document/9614281

[01:17](#msg61a42a2ea9c8eb44c4029d5c)@gchiu a lot of code samples with OpenCV and AI: https://github.com/spmallick/learnopencv

gltewalt

[02:49](#msg61a43fa1abdd6644e3adbf38)@planetsizecpu You mean the initial screen before I click Play? I don;t see a number

[02:53](#msg61a44090cdb5c1081a37e0f4)L26 platform elevator speed is fine

gchiu

[04:46](#msg61a45b24b5ba9e5a11ded7e4)&gt; @gchiu Have a look here: https://ieeexplore.ieee.org/abstract/document/9614281

Cool. AWS Facial rekognition

Oldes

[07:27](#msg61a480f463c1e83c9533d00d)@Boum69 nice... when I'm mentioned, I should note, that you should not use `bass/do compose/deep [sound: load (media/1) play sound]` but instead, load all the sounds just once and then use these (not loading them each time, when you want to play them)

planetsizecpu

[08:04](#msg61a4899563c1e83c9533e356)Yes @gltewalt the number appears just after click on the Play button for a second then the game start. On my W10 i5 system it is a `0`. The narrow elevators are trimmed for the boy and the guards to have enough time to jump out. On platform elevators there is less time, so the guards some times will not reach the ground if interpreted, more if the system is doing some heavy task, but I haven't seen that behaviour on compiled mode. I think it is necessary to better adjust these waiting times. I will do it as soon as possible.

[08:05](#msg61a489afcdb5c1081a387e05)Fun @Boum69

GalenIvanov

[08:17](#msg61a48c8b63c1e83c9533e96c)@Boum69 It's nice to see a finished project, congratulations! On my machine the ball pauses when I move the mouse more actively.

pekr

[09:28](#msg61a49d35c2cc0e5343d5b9b6)@planetsizecpu Is your game able to utilise Red's HW D2D acceleration?

planetsizecpu

[09:40](#msg61a4a01b42fc2863b232cbce)Not sure @pekr, it uses view std widgets, mostly `base`

pekr

[09:48](#msg61a4a1de6104ea63b6bf07b6)hmm, not sure with base, AFAIK D2D is used for Draw, but can be wrong. @hiiamboris will surely know :-)

hiiamboris

[10:10](#msg61a4a71276e37917550f31fd)yes

[10:12](#msg61a4a791abdd6644e3aea01d)a game like this though should work on a 8086 ;)

pekr

[10:15](#msg61a4a843cdb5c1081a38c257)So why it might be slow in Red then? ;-)

planetsizecpu

[11:50](#msg61a4be7263c1e83c953452eb)It is no slow @pekr I just adjust the moving objects number to the limit of playability on my computer, some times have to redesign the stage to save some elvator or kart to avoid overload, so in the hope the users may have better machines than me 😄 note that is a W10 related issue, in GTK the problem is just the inverse, things move too fast for the settings I wrote, so ... we have to adjust.

ldci

[13:27](#msg61a4d54fc6149e5349568d4e)@gchiu For facial recognition with redCV: http://redlcv.blogspot.com/2020/07/face-detection-with-redcv-and-haar.html

greggirwin

[18:29](#msg61a51c1b42fc2863b233e936)Thanks for posting @Boum69! I will try to check it out soon.

Boum69

[20:29](#msg61a53828a9c8eb44c404f5ec)\[!\[Boum-Breaker.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/u6vD/thumb/Boum-Breaker.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/u6vD/Boum-Breaker.gif)

[20:31](#msg61a5388b8f98cb08119874c5)Your very welcome @greggirwin I've made a brick breaker game a long time ago with Rebol and thanks to Red langage the gameplay is more instinctive now. I post a gif in order to give you a picture of the game.

Respectech

[20:58](#msg61a53eedc6149e534957891a)@Boum69 Nice job on the game! Thanks for posting the gif. It helps to understand the features of the game.

greggirwin

[21:05](#msg61a5409776e3791755109e2b)Great gif! Very cool.

Boum69

[23:11](#msg61a55e0a8f98cb081198c9a9)Thanks all of you. m very glad if it could helps. ; )

## Monday 6th December, 2021

gchiu

[21:32](#msg61ae8166a9c8eb44c418270f)I'm seeing something odd. I have a text-list with data, and usually it works. But then some hours later, without altering any of the data, it starts to return the results for the element above the one I click on.

[21:32](#msg61ae81798f98cb0811ab9f60)Is this known anomalous behaviour?

[21:33](#msg61ae81b1026dc63ca634ecac)I have to restart my app and it then starts to work normally again

[21:34](#msg61ae81e642fc2863b247510f)Hmm. Maybe I have added data. Do I need to reset any pointers in the text-list after loading a new set of data?

rebolek

[21:40](#msg61ae8349c2cc0e5343ea71bc)@gchiu AFAIK no. I’ve just tried `text-list` on Linux and it seems that after adding an element it has troubles with registering clicks on the first element.

[21:45](#msg61ae848d75fa48164972b22a)But I don’t use View and my system is not very GUI oriented, so it may be a problem on my side.

gchiu

[21:46](#msg61ae84bf6104ea63b6d39ae7)&gt; @gchiu AFAIK no. I’ve just tried `text-list` on Linux and it seems that after adding an element it has troubles with registering clicks on the first element.

So, it's probably linked to the same problem

[21:47](#msg61ae84f78f98cb0811aba72f)the link index is confused

rebolek

[21:53](#msg61ae866442fc2863b2475a60)I’m not sure, it seems like a different problem. It stops registering click for some time, it doesn’t point to a different element.

Here’s the code I tried:

```
view [t: text-list data ["a" "b" "c"] [probe face/selected] button "add" [append t/data "d"]]
```

The `add` button is probably not needed as I can get the same behaviour when clicking on "a" without adding other elements. It doesn’t happen when clicking on "b" or "c". So it’s probably unrelated.

gchiu

[22:31](#msg61ae8f268f98cb0811abbfed)works for me on windows

[22:31](#msg61ae8f2dcdb5c1081a4d4d43)must be a different issue as you say

## Tuesday 7th December, 2021

planetsizecpu

[09:48](#msg61af2deacd3f06175df4f7ea)I released L27 just now, now testing if it is some issue, it is a very complex stage that has 26 gold bags to collect and two karts as only playing aids.

[09:48](#msg61af2e046104ea63b6d4fa44)\[!\[cavetest270.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/cHXa/thumb/cavetest270.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/cHXa/cavetest270.gif)

hiiamboris

[09:55](#msg61af2f78026dc63ca636667b)shiny neon ladders :)

[09:55](#msg61af2f8a8f98cb0811ad06ac)vaporwave-ish

GalenIvanov

[10:01](#msg61af30e863c1e83c954a013a)@planetsizecpu Nice, neon punk :smile:

planetsizecpu

[10:32](#msg61af382cc6149e53496c387e)Thx guys 😉

greggirwin

[22:58](#msg61afe730026dc63ca638055e)@gchiu @rebolek if you can nail it down, @qtxie can probably fix quickly.

[22:59](#msg61afe73bcdb5c1081a502a8a)@planetsizecpu, nice. :^)

## Friday 10th December, 2021

toomasv

[11:16](#msg61b33716cd3f06175dfe05b1)Seems regression occurred somewhere between Apr 12 and May 17.  
On Apr 12 build this still worked: `view [drop-down focus on-key [probe face/text]]`. On May 17 build not any more. (W10)  
@qtxie

hiiamboris

[11:18](#msg61b337a376e37917552e3ffb)please file an issue

[11:19](#msg61b337dc026dc63ca63f4c90)so next time I work on View tests, I can add tests for it

toomasv

[11:20](#msg61b337f642fc2863b251d2d1)Ok

[11:32](#msg61b33ae76104ea63b6ddfd06)#5008

hiiamboris

[11:45](#msg61b33dd8026dc63ca63f5ba2)thanks

## Sunday 12nd December, 2021

qtxie

[08:39](#msg61b5b558c2cc0e5343fa670d)@toomasv Pushed a fix.

toomasv

[09:48](#msg61b5c57cabdd6644e3d33862)Thanks!

## Tuesday 14th December, 2021

lylgithub2021

[02:52](#msg61b806f542fc2863b25c49e8)Many repeats of `return` have to be done to arrange the vertical position of a widget in `view`. Is there a better way to envoide such repeats?

greggirwin

[02:55](#msg61b8079763c1e83c955d90eb)Have you tried using `below` or \[panels](https://github.com/red/docs/blob/master/en/vid.adoc#panel)?

lylgithub2021

[03:00](#msg61b808bda9c8eb44c42cf991)panel used. Then how to do if I want to put a widget in a vertical position(no other widgets over or below it)?

greggirwin

[03:00](#msg61b808ea63c1e83c955d9394)I don't understand the question.

[03:01](#msg61b809048853d31640486c4c)If there is only one widget, there's no layout orientation.

[03:02](#msg61b809378853d31640486cbd)Or maybe you're looking for `at` or `pad`.

lylgithub2021

[03:03](#msg61b80975a9c8eb44c42cfb13)In a certain column, only one widget has to be put near the central vetical position.

[03:08](#msg61b80ab6cd3f06175d08b4d8)view \[return return return return text "text"] A simple example

greggirwin

[03:09](#msg61b80b0763c1e83c955d97ba)You can use `pad` for that, but maybe this old example will also help.

```
view [
        style chk: check "Option" data yes
        style vline: base 2x60 red
        across top    vline button "Ok" text "Text" field chk return
        across middle vline button "Ok" text "Text" field chk return
        across bottom vline button "Ok" text "Text" field chk
]
```

I think we need to update VID docs for that feature.

lylgithub2021

[03:11](#msg61b80b78a9c8eb44c42cff47)`view [return return return return text "text"]` You can see that so many 'return's have to be written to adjust the vertical position. I tried `do [loop 4 [return]]` but failed.

greggirwin

[03:14](#msg61b80bfecd3f06175d08b78f)You could also put an empty face there. Many ways to attack this problem.

toomasv

[04:39](#msg61b81fe88f98cb0811c0b893)@lylgithub2021 E.g.

```
view [size 100x200 at 10x170 text "text"]
```

Or, if you want to be adventurous:

```
view [size 100x200 text "text" on-created [face/offset/y: face/parent/size/y - 30]]
```

Or with dummy face:

```
view [below box 180x160 text "text"]
```

lylgithub2021

[13:10](#msg61b897b5197fa95a1cc30470)Thank you @toomasv so much for these samples!

toomasv

[13:13](#msg61b89874c6149e534980d8c9)You are welcome! One more:

```
view [box 80x180 bottom left "text"]
```

## Wednesday 15th December, 2021

toomasv

[10:46](#msg61b9c77cfd9244223e470602)@lylgithub2021 And the shortest, easiest, nicest way :)

```
view [pad 0x160 text "text"]
```

ne1uno

[10:48](#msg61b9c8123c203022426a4dbd)`view [origin 160x10 text "text"]`

toomasv

[10:49](#msg61b9c81eb6d55b5adceace4a):+1: `10x160`?

ne1uno

[10:49](#msg61b9c84cfd9244223e470766)xy

toomasv

[10:51](#msg61b9c8a69a9ec834fbcdf87c)Only this adds same space after the text too :(

## Friday 17th December, 2021

lylgithub2021

[07:36](#msg61bc3e0af20ff23319c5a3d5)How to set the foreground/background color of a button? I tried with "view \[button red "button"] and failed.

gchiu

[07:57](#msg61bc42de0c681346aeed7b60)resulttl: text-list 220x500 on-select [  
probe face/selected  
probe face/data  
]

Why does a click on the first member of the list give a -1 for face/selected ?

GalenIvanov

[08:06](#msg61bc4521b6d55b5adcf0616b)@lylgithub2021 I don't know, I've tried too without success. Maybe the color of buttons is managed by the OS? I tried setting the button's bitmap to a color of my choice but then the states of the button (on-over, on-down...) are not visible, since the drawing takes place on the layer below the bitmap.

toomasv

[08:15](#msg61bc470e3c203022426fec8f)@gchiu `on-select` returns old index, new index is returned by `on-change`. `on-change [probe pick face/data face/selected]`. -1 is returned when there is no current selection.

greggirwin

[17:18](#msg61bcc67d3c2030224271112f)There are certain facets we can't control on native widgets, like colors on buttons. It's a downside to using native controls.

## Sunday 19th December, 2021

lylgithub2021

[01:50](#msg61be8fdab6d55b5adcf55609)

```
view [t: text "note" button "From file" button "From clipboard" [t/text: "" a/text: read-clipboard] return a: area on-change [t/text: "input changed"]]
```

I want to do something with the actor `on-change` when the text of `area` is changed. But it seems only to responds to key input. I wonder if there is a method to respond to any change to the text of 'area', that is to say, by keyboard input, by clipboard, by reading a file.. etc.

hiiamboris

[09:05](#msg61bef5dae002586c753412bb)use `react`

lylgithub2021

[13:15](#msg61bf307ac642515af340f9c6)Would you please give an example?

hiiamboris

[13:31](#msg61bf3449e002586c75347e69)https://w.red-lang.org/en/reactivity/

toomasv

[13:48](#msg61bf383ae002586c753484bc)@lylgithub2021 Maybe @hiiamboris has something better in mind but this works too:

```
txt: "" 
view [
   t: text "note" 
   button "From file" [t/text: "file" if file: request-file [a/text: read file]] 
   button "From clipboard" [t/text: "clipboard" wait 1 a/text: read-clipboard] 
   return 
   a: area react later [if face/text <> txt [txt: a/text t/text: "input changed"]]
]
```

## Monday 20th December, 2021

lylgithub2021

[01:08](#msg61bfd77e9a9ec834fbdad792)Thank you @toomasv so much for your help!! And I like the idea of using `wait`. I modified the last lind of code with the following code to flash the `t/text` three times, but failed. What's wrong with this? `a: area react later [if face/text <> txt [txt: a/text t/text: "input changed" loop 6 [either t/text = "" [t/text: "input changed"][t/text: ""]]wait 0.5]]`

gurzgri

[01:54](#msg61bfe26b62f3a56c818e00c5)@lylgithub2021 You're just `wait`ing one closing bracket `]` too late, it belongs inside the loop.

lylgithub2021

[02:19](#msg61bfe8434ec0c071b7a4e296)Thank you@ @gurzgri . Could you give more info about your suggestion?

gurzgri

[23:07](#msg61c10cb7d40eb146b0e1f745)@lylgithub2021 Just count your opening and closing brackets and, by that, realize that you're `wait`ing outside of the loop. For now, you're changing from empty text to "input changed" message and vice versa six times in a row in an instant. Only after that you're `wait`ing only once for 0.5sec.

## Thursday 23th December, 2021

lylgithub2021

[05:49](#msg61c40e026d9ba2332888fb5b)I have a `text-list` with three items "r" "g" "b". Is it possible to make them different colors - "r" red, "g" green and "b" blue, for example? `view [text-list data ["r" "g" "b"]]`

planetsizecpu

[07:28](#msg61c42516d143b14f83e1f9c9)It is possible to change the whole list defalult colours @lylgithub2021

```
view [text-list red green data ["r" "g" "b"]]
```

About the individual items I don't know 😑

greggirwin

[07:30](#msg61c42586742c3d4b21624a34)@lylgithub2021 no, not with the native OS widget.

lylgithub2021

[14:24](#msg61c486a92a210c38c19492cb)Many thanks @greggirwin @planetsizecpu . Then is there a way to change the color of items `dynamically`. For example, I tried with `view [t: text-list data ["r" "g" "b"] button [t/font/color: blue]]`, but received a wrong message "Script Error: path t/font/color is not valid for none! type".

hiiamboris

[14:43](#msg61c48b2fd143b14f83e2b1c7)`view [t: text-list white black data ["red" "green" "blue"] on-change [t/font/color: do t/data/(t/selected)]]`

planetsizecpu

[14:45](#msg61c48b8a742c3d4b21630ba1)Also

```
view [t: text-list blue green data ["r" "g" "b"] button "COLOR" [t/font/color: yellow]]
```

lylgithub2021

[14:50](#msg61c48cc39a33545406eb9aa0)Why is it wrong with `t/font/color: red`? Why must `do` be used to change the color?

hiiamboris

[14:51](#msg61c48cf69b470f389731f3e8)it's not wrong, you just haven't defined `font`

[14:51](#msg61c48d072a210c38c1949c50)specifying text color is a trick that does that

[14:52](#msg61c48d25d41a5853f91846f5)you can specify `font-size` instead or anything

planetsizecpu

[14:52](#msg61c48d3f5dc6213cd4aa8ed3)... and you wrote `view [t: text-list data ["r" "g" "b"]`without colors

lylgithub2021

[14:55](#msg61c48dd6d41a5853f918481e)I still do not quite understand "haven't defined font". Would you explain more?

planetsizecpu

[14:58](#msg61c48e9bbfe2f54b2ee4a803)When you assign colors to text-list Red creates a font for you, don't have to specify. If not, it defaults to OS settings.

lylgithub2021

[15:08](#msg61c490ea46529077f54ee9e8)So, an initial color has to be assigned to define the `font`. Then, for the face `text`, how to assign a foreground color without changing the original background color?

planetsizecpu

[15:12](#msg61c491e4f5a3947800cfbd6f)`view [t: text 200x200 "PLAIN TEXT" font [size: 15 color: green]]`

hiiamboris

[15:13](#msg61c491fce1a1264f0a219681)`view [text font-color green "abc"]`

[15:13](#msg61c4922a7842bd3ca91152a7)https://w.red-lang.org/en/vid

lylgithub2021

[15:32](#msg61c4968c2a210c38c194acf5)Thank you all!!

[15:39](#msg61c4981d6d9ba2332889fc83)`view [t: text "text" button [print t/color]]` When click the button, I get `none`. How to get the "default" background color of a `face`?

hiiamboris

[15:39](#msg61c4983b82a4667b2541173a)`? system/view/metrics/colors`

lylgithub2021

[15:45](#msg61c4999682a4667b25411982)What is the help document in which I can find the description of this command `system/view/metrics/colors`?

hiiamboris

[15:46](#msg61c499f0d143b14f83e2ca5c)sometimes you just have to explore :)

greggirwin

[19:06](#msg61c4c8982a210c38c1950dfc)Red \[Object Browser](https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5)

## Friday 24th December, 2021

lylgithub2021

[01:29](#msg61c5228f2a210c38c195a6b2)Thank you@ @greggirwin

[01:44](#msg61c52611d143b14f83e3c0ad)For the face `text-list`, when a item is selected by mouse, it is unable to deselect any item by mouse(and highlight of the last selection is still on). Is there a solution to deselect any item of a `text-list` by mouse or any other? `view [t: text-list data ["a" "b"]]` How to deselect "a" and "b"?

toomasv

[06:51](#msg61c56dfe5dc6213cd4ac0489)@lylgithub2021

```
view [
    t: text-list data ["a" "b" "c"] 
    on-alt-up [face/selected: none]
]
```

Down-side is that alt-up deselects unconditionally (i.e. not necessary to press upon selected).

lylgithub2021

[07:46](#msg61c57acb9a33545406ed2b08)Oh! By the right mouse button! Many thanks!!

toomasv

[07:55](#msg61c57cde9a33545406ed2e5d)You are welcome!

pekr

[11:33](#msg61c5b01f46529077f550ca37)Is there an easy was of to align row elements to the right? Simple example - text, field, return and OK button, which would alight to the right? I know I can use trial and error and use pad.

hiiamboris

[12:35](#msg61c5be7682a4667b2542fddc)`view [below right button area text 40 "abcd" field]`

pekr

[12:48](#msg61c5c18b742c3d4b216517a9)Is that a bug, or my wrong perception of how `below`works?

```
view [
   backdrop silver
   text right "Text to greet:"
   wish: field 100x20 below
   button "Greet" [
       print ["Wishing you a" wish/text]
   ]
]
```

The button is placed at the right side of the field ....

hiiamboris

[12:51](#msg61c5c26a46529077f550eb13)you can see the explanation here https://github.com/red/red/issues/4733

[12:52](#msg61c5c271d41a5853f91a56c6)it's not a bug

[12:53](#msg61c5c2b59a33545406eda217)basically you write `below a b` instead of `a below b`

pekr

[13:06](#msg61c5c5c7e1a1264f0a23a061)I can read Gregg pointed out some consequences, but your suggestion is exactly what I would expect. This late switching, especially when combined with multiple direction switched, is a complete mess :-)

mikeyaunish

[16:13](#msg61c5f1c79a33545406edf4da)@pekr - I think of below and across as just flags that are set until you change them. In practice I haven't found myself changing the direction much. It is a bit to get use to.

pekr

[17:04](#msg61c5fd869b470f3897346a99)That's not the problem. The problem is, that it changes direction on step later than most ppl expect imo.

hiiamboris

[17:11](#msg61c5ff4a46529077f5514d0a)but the alternative has a drawback too: `below a b` (at block's head) either should become invalid or the same as `a below b`

[17:13](#msg61c5ffcc5ee4df335ab146af)in any case docs could do better to explain how to read this `below a across b c`, e.g. "below face A place face B, but to the right of B place C"

[17:17](#msg61c600a8526fb77b31490490)also `below right a b` aligns both `a` and `b` to the right, but alternative `a below right b` looks like it aligns only `b`, while it is really a column `a b` and both `a` and `b` will be aligned

[17:18](#msg61c600c85dc6213cd4acf872)so it's trickier than it looks

pekr

[18:43](#msg61c614d8526fb77b314922f0)I always thought about below and across as just a state/direction switchers ....

## Saturday 25th December, 2021

toomasv

[05:59](#msg61c6b329742c3d4b21669212)You can think of `below` and `across` as adding a new block with different direction into current flow, not as instruction to change direction at once.

pekr

[06:47](#msg61c6be9bd143b14f83e65396)Toomas, not sure I understand. `below a b`will switch state for `b` and how should I imagine having a block there? `below [a b]`still visually signals even `a`goes below ... would have to be something like `below a [ b c d]`

[06:48](#msg61c6bece742c3d4b2166a60d)In such case, it should be subblock, like panel. Maybe we should / could work with rows / columns. We describe them anyway, we just don't singal them in a code.

## Sunday 26th December, 2021

GiuseppeChillemi

[13:38](#msg61c8704f2a210c38c19afd3f)And, how do you change the flow instead of working "at once"?

[13:39](#msg61c87086742c3d4b21695f06)I admit I have thought `below` and `across` as flow switchers too.

mikeyaunish

[16:23](#msg61c8971ed143b14f83e9323d)In VID when using 'focus' on a field IE:

```
field1: field focus
```

Where is this flag kept? I can't seem to find it within the 'field1' object anywhere?

hiiamboris

[16:59](#msg61c89f70526fb77b314d11fe)it's in `window/selected`

[17:00](#msg61c89fa15ee4df335ab55ee3)

```
>> ?? set-focus
set-focus: func [
    "Sets the focus on the argument face" 
    face [object!] 
    /local p
][
    p: face/parent 
    while [p/type <> 'window] [p: p/parent] 
    p/selected: face
]
```

ldci

[21:17](#msg61c8dbd2526fb77b314d715b)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/XBVK/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/XBVK/image.png)

[21:17](#msg61c8dbd35ee4df335ab5c3e8)Just. for fun: an unicode reader forRed

GiuseppeChillemi

[21:31](#msg61c8df3cbfe2f54b2eeb8abd)I like it!

gchiu

[21:58](#msg61c8e5732a210c38c19bc2f8)@ldci unicode has the Chinese hexagram symbols from the I Ching??

ldci

[22:03](#msg61c8e6a7bfe2f54b2eeb95a3)@GiuseppeChillemi. I'll add Emoji:) @gchiu : have a look here: https://www.ssec.wisc.edu/~tomw/java/unicode.html#x25A0

gchiu

[22:10](#msg61c8e865bfe2f54b2eeb991f)So, 0x2630 - 0x2637 are the 8 trigrams. Cool. now to convert the JS https://github.com/Brianfit/I-Ching/blob/master/README.md

ldci

[23:25](#msg61c8f9d05ee4df335ab5f354)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/INnC/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/INnC/image.png)

[23:25](#msg61c8f9e1526fb77b314da28f)@GiuseppeChillemi : emoticones added

## Monday 27th December, 2021

greggirwin

[19:13](#msg61ca104bd41a5853f9212f76)@ldci, very nice! Is the code available?

[19:14](#msg61ca10a67842bd3ca91a2a58)Could be added to red/code/apps or red/community/apps.

ldci

[19:20](#msg61ca1212d41a5853f92132ca)@greggirwin I'm polishing the code and then I'll update my red/redSystem repository on GitHub. Regards from Paris :)

[19:22](#msg61ca125ff5a3947800d8b679)see also here: https://gitter.im/red/red/France

[19:30](#msg61ca1438f5a3947800d8b9e2)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/s7vG/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/s7vG/image.png)

[19:30](#msg61ca1456742c3d4b216c2986)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/yJjm/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/yJjm/image.png)

[19:30](#msg61ca145e5ee4df335ab7d037)@greggirwin 2 improved versions :)

[19:31](#msg61ca149bd41a5853f9213793)and we're politically correct for skin color :)

[19:38](#msg61ca16515ee4df335ab7d395)and the last. Sorry I'd to parse a french site:)

[19:39](#msg61ca1656d143b14f83ebb2ce)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/EKk4/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/EKk4/image.png)

greggirwin

[19:41](#msg61ca16f5f5a3947800d8bec6)Fantastic! I can imagine a really fun generator competition, maybe dialect based, where you write some text and it replaces some or all of it with emojis.

[19:42](#msg61ca1719e1a1264f0a2a9b36)I'd say we could write children's books with it, but I'm a fan of literacy more than hieroglyphics.

planetsizecpu

[20:09](#msg61ca1d8382a4667b2549f497)Useful @ldci good job!

## Tuesday 28th December, 2021

cloutiy

[16:01](#msg61cb34eef5a3947800dab174)In the web world, there is a lot of emphasis on responsive UI design. The UI needs to adapt to the size, layout and orientation of the device viewing the page. How would something similar be applied to Red GUI apps? Having fixed sizes for faces wouldn't work very well, especially one intends to have their app be used across multiple devices with the same code. In the web world we can scan media size and use different sizes for UI elements, or change the flow or layout accordingly. Likewise if changing the orientation of the device from portrait to landscape. What approaches could be used with Red View to achieve responsive UI design?

hiiamboris

[16:06](#msg61cb3605f5a3947800dab3ae)On the very basic level: by defining \[reactions](https://w.red-lang.org/en/reactivity/).  
For minimum effort: I have \[Elastic UI project](https://gitlab.com/hiiamboris/red-elastic-ui)  
For truly dynamic UI without the OS or VID limitations: I have \[Red Spaces project](https://gitlab.com/hiiamboris/red-spaces/)

cloutiy

[16:58](#msg61cb42435ee4df335ab9edd9)@hiiamboris Thanks for the reply. Nice work. Especially like the Spaces DSL. Also thanks for the link to the `reactions` documentation. Is this documentation available from the main website? Am reading through it and has a lot of answers to some of the questions I been asking myself...or is it still a work in progress?

hiiamboris

[17:12](#msg61cb45785ee4df335ab9f237)No, it's an old doc.

[17:12](#msg61cb459b742c3d4b216e4420)Main site links to Github, where all these docs are mirrored:  
!\[](https://i.gyazo.com/67c41d64c1d6434f408c266e4bf11058.png)  
!\[](https://i.gyazo.com/82b0ac19940f18c266677484d7e9915d.png)

ldci

[18:29](#msg61cb578c6d9ba23328952cb9)@greggirwin @planetsizecpu : code is updated here: https://github.com/ldci/Red-System.

[18:30](#msg61cb57ade1a1264f0a2cd70f)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/gTXn/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/gTXn/image.png)

[20:33](#msg61cb747de1a1264f0a2d0afd)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/koPJ/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/koPJ/image.png)

[20:33](#msg61cb747f46529077f55a3fe3)Red is ready for smartphones :)

greggirwin

[22:20](#msg61cb8da67842bd3ca91cd3d6):^)

ldci

[22:29](#msg61cb8fc62a210c38c1a06138)@greggirwin. I'm compiling a lot of tests I did with Red. Red-System GitHub repository updated ASAP.

## Wednesday 29th December, 2021

ldci

[12:17](#msg61cc51d8f5a3947800dcbdc5)\[!\[image.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/Pxtn/thumb/image.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/Pxtn/image.png)

[12:17](#msg61cc51dc6d9ba2332896e405)With unicode, it' possible to make. test-list with images :)

greggirwin

[20:51](#msg61ccca3cbfe2f54b2ef26977)Very clever. :^)

## Thursday 30th December, 2021

ldci

[09:20](#msg61cd79d32a210c38c1a3bd69)@greggirwin Not easy since face depends on OS. The trick is to use the face/extra facet to store the colors.

```
on-change [ 
		face/font/color: do face/extra/(face/selected)
		update face				;--update color viewer
		face/font/color: black	;--restore default font color 
	]
```

[10:21](#msg61cd8838742c3d4b21723f02)@greggirwin Of course this works also for drop-list and drop-down objects. :)

planetsizecpu

[10:42](#msg61cd8d29526fb77b31559524)Ah yes, face / extra gives a lot of chances, I use it in the game to point objects. This is how L28 looks finally, already updated on github.

[10:43](#msg61cd8d649a33545406fabd2e)\[!\[cavetest280.gif](https://files.gitter.im/55b1d8290fc9f982beaacceb/JIp5/thumb/cavetest280.gif)](https://files.gitter.im/55b1d8290fc9f982beaacceb/JIp5/cavetest280.gif)

ldci

[10:46](#msg61cd8def2a210c38c1a3e4e4)@planetsizecpu I have to test your code on macOS :)

planetsizecpu

[10:48](#msg61cd8e72f5a3947800def382)If any issue plz tell me, there maybe overspeed on elevators.

ldci

[10:51](#msg61cd8f175ee4df335abde999)@planetsizecpu BTW your GitHub?

planetsizecpu

[10:51](#msg61cd8f4bd143b14f83f1cc57)https://github.com/planetsizecpu/Cave-In

ldci

[10:52](#msg61cd8f5982a4667b2550031b)Thanks :)

planetsizecpu

[10:52](#msg61cd8f6fd143b14f83f1cc9e)Have fun 😃

[10:57](#msg61cd90882a210c38c1a3e9b2)There is a mistake on the main file, gimme ten minutes to upload &amp; compile please... 😬 it's the demo effect.

ldci

[11:01](#msg61cd91995ee4df335abdef50)@planetsizecpu macOS does not work. And compilation returns error `Access Error: cannot open: %data/cave-in.jpg`

[11:02](#msg61cd91bd2a210c38c1a3ec69)I'll have a look to your code

planetsizecpu

[11:04](#msg61cd924982a4667b2550082e)Now ready.

ldci

[11:27](#msg61cd97ab6d9ba23328992384)OK: I had to copy your src code into the main directory. Compilation is OK. We'll test in detail tomorrow with my son :)

planetsizecpu

[11:28](#msg61cd97f95ee4df335abdfa9a)🍻

guaracy

[13:48](#msg61cdb8905ee4df335abe37c7)\[!\[wc-red.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/NGj7/thumb/wc-red.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/NGj7/wc-red.png)

[13:49](#msg61cdb8d32a210c38c1a436fc)@ldci  
i tested with a short text and get an incorrect result

i changed line: https://github.com/ldci/Red-System/blob/f3de36e1cbde8394cba83024bf9384ca5dadcf87/Words\_Counter/wcount.red#L51  
by  
n: (length? wordBlock)

and removed line: https://github.com/ldci/Red-System/blob/f3de36e1cbde8394cba83024bf9384ca5dadcf87/Words\_Counter/wcount.red#L58

ldci

[15:37](#msg61cdd22ed41a5853f927d1c3)@guaracy Thanks! I'll make the. changes :)

[18:10](#msg61cdf610526fb77b31565b09)@guaracy Updated :)

greggirwin

[19:06](#msg61ce03265dc6213cd4ba57c1)`face/extra` is great. VB had something similar, called `tag`, for controls.

## Friday 31st December, 2021

mikeyaunish

[19:27](#msg61cf59b9e1a1264f0a33e50f)Is there a way to save layout images using to-image like in Rebol?

hiiamboris

[19:30](#msg61cf5a70526fb77b3158c6f4)only after it's shown

mikeyaunish

[19:41](#msg61cf5d065dc6213cd4bcad35)I am trying:

```
>> out: layout [ button "Hello" ] 
== make object! [
    type: 'window
    offset: none
    size: 82x47
    text: none
    image: none...
>> view out
>> image: to-image out
== none
```

Obviously don't have it correct.

dsunanda

[20:03](#msg61cf622bf5a3947800e22100) Try view/NO-WAIT out

greggirwin

[20:13](#msg61cf646b5dc6213cd4bcb9d5)I could have sworn we had an example in the wiki, but can't find it.

```
w: view/no-wait layout [ button "Hello" ] 
img: to-image w
unview
```

`>> ? img`

Would someone like to add it to the GUI hints wiki page?

mikeyaunish

[20:35](#msg61cf69afd143b14f83f5126e)Thanks @greggirwin. I am finding it difficult to find random samples of code. Searching has become an unrealiable way to do so. Is there any thought about some consolidated way to search for red stuff?

greggirwin

[20:40](#msg61cf6ad5f5a3947800e22f7f)No great suggestions here. :^\\

mikeyaunish

[20:42](#msg61cf6b259b470f389744800d)It looks like it might be a: my neccesity/ my invention scenario?

greggirwin

[21:15](#msg61cf72fa9b470f3897448e1d):^) We can try to help, once we sort some things out in January.
