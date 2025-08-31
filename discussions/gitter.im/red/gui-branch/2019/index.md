# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2019

## Wednesday 2nd January, 2019

qtxie

[06:47](#msg5c2c5e9c8dafa715c72bfc87)@toomasv @koba-yu We haven't decided it yet. The native text rendering API on different platforms has some subtle differences.

[06:48](#msg5c2c5ed592cf4d22422efdfe)\[!\[e6166a3060076ef07674bdffe64d6e2.png](https://files.gitter.im/red/red/gui-branch/rijp/thumb/e6166a3060076ef07674bdffe64d6e2.png)](https://files.gitter.im/red/red/gui-branch/rijp/e6166a3060076ef07674bdffe64d6e2.png)

koba-yu

[07:26](#msg5c2c679592cf4d22422f3258)@qtxie Thank you for your comment. So it based on OS native rendering(at least so far)  
I am trying to understand multi-box mode and I have just understood how to use 'draw' with rich-text. I guess I can use draw for put a row lined, instead of spaces with underline

pekr

[09:33](#msg5c2c857ababbc178b2158320)"OS native rendering" - you mean - OS native widgets? In that sense, was it ever confirmed, that Red might one day fully switch to HW accelerated backends (if technically possible) and provide R3 gob! like functionality?

rebolek

[10:20](#msg5c2c906b8dafa715c72d4816)Isn't it switching to HW acceleration already with Direct2D?

pekr

[10:34](#msg5c2c93cf93cce97d3bd50326)I think it is, but for the text rendering only? But maybe I do remember it incorrectly ....

BeardPower

[10:39](#msg5c2c94dfd945b9688231be3c)It's currently using GDI/GDI+ with is only partially hardware-accelerated. An experimental D2D backend exists in the Direct2D branch.

[10:46](#msg5c2c9674f6166a3027a8d21e)Fully HW accelerated backends are of course possible and a gob! type is also considered. The problem is the API. Each platform supports various graphic APIs which the team needs yet to decide on. New macOS apps need to use Metal so OpenGL on that platform is out of question. Vulkan would we a future-proof choice and it's also cross-platform (Metal can be run on top of Vulkan). Linux has an additional issue: multiple Graphics servers, Window Managers and Desktop Environments (KDE, GNOME, X, Wayland...).

Phryxe

[13:20](#msg5c2cbaa62863d8612bc83ec9)Is it possible to run powershell commands from a Red GUI and handle the response into same GUI? If yes, is there an example?

mikeparr

[13:34](#msg5c2cbdfdf6166a3027a9ed3a)@Phryxe - You could try creating .bat files in your program, and executing them with call/output, as shown in http://www.red-by-example.org/#call

Phryxe

[13:38](#msg5c2cbec237975e7ca960b7ba)@mikeparr Thnx, will look into `call` ...

[15:51](#msg5c2cddfa37975e7ca961a7a3)@mikeparr I got the powershell response back into a `string!` with `call/putput`. Now I need to parse the resulting string ...

```
x: ""
call/output "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe Get-Service | Get-Member" x
probe x
```

toomasv

[16:04](#msg5c2ce0faf6166a3027aaeaed)@Phryxe try `print x` to get nice output.

Phryxe

[16:36](#msg5c2ce882db5b5c6883463bb9)@toomasv Yes, but my thought was to present it in a GUI.

toomasv

[16:36](#msg5c2ce8a637975e7ca961fc89):+1:

Phryxe

[17:18](#msg5c2cf25493cce97d3bd7a7ed)`call/putput` = FFF (Fat Finger Failure)

greggirwin

[20:57](#msg5c2d25aa09b8066849a521e0)&gt; was it ever confirmed, that Red might one day fully switch to HW accelerated backends (if technically possible) and provide R3 gob! like functionality?

@pekr, we want to do that. Just convince Cyphre to join us and build it. :^)

pekr

[22:01](#msg5c2d34c02863d8612bcb8c4e)Wasn't Cyphre present at Devcon? Meeting you guys should be enough to convince him, no? :-)

greggirwin

[22:26](#msg5c2d3a88f6166a3027ad7288)Yes, he was. We'll work on that.

## Thursday 3th January, 2019

planetsizecpu

[11:23](#msg5c2df0ad5a0a8058be2059e0)Today I had some time to enjoy playing with Red, I added font selection on this app, easy tools like `request-font` help a lot, I wonder what new tools will come out with full I/O.

[11:24](#msg5c2df0de33e089363b39fca6)\[!\[test7.gif](https://files.gitter.im/red/red/gui-branch/vj8l/thumb/test7.gif)](https://files.gitter.im/red/red/gui-branch/vj8l/test7.gif)

toomasv

[13:16](#msg5c2e0b2df6166a3027b249e5)@planetsizecpu :clap:

planetsizecpu

[13:58](#msg5c2e150f0b7fc97caae155e2)😃

BeardPower

[16:53](#msg5c2e3e010b7fc97caae272ee)@planetsizecpu Nice.

## Friday 4th January, 2019

Franktic2

[00:19](#msg5c2ea67ad945b968823ed5fa)In almost all GUI apps, the tab key moves the focus to the next 'face'. This does not seem to be the case with Red GUI's without additional programming. Am I correct and therefore have to check for tab key presses?

toomasv

[05:18](#msg5c2eecb9db5b5c688352b2d4)@Franktic2 Tabbing is not implemented yet. I experimented with \[tabbing actors](https://gist.github.com/toomasv/4f08339e854669247d4f34aa7a8c1a3b) and \[label style](https://gist.github.com/toomasv/380ae584be2c46838763ac53c5974f09) few months ago. Would be interesting to know if it works for you.

These can be used e.g. as here:

```
view layout/options/styles [
    label "Header:" field return 
    label "Text:" below area 
    button "OK"
] do %tabbing-actors.red do %label-style.red
```

Franktic2

[12:44](#msg5c2f55238dafa715c73ea855)@toomasv thanks for your code. Unfortunately it does not run. It throws up an error:

[12:44](#msg5c2f5527ab910e7d3a1e63c5)\*\** Runtime Error 1: access violation  
\*\** at: 004C9F4Eh

toomasv

[12:49](#msg5c2f564ab8d2227918afe494)@Franktic2 Which platform? Works on W10.

Franktic2

[12:57](#msg5c2f585133e089363b42c7ef)@toomasv Windows 10 and Red 0.6.4. I've checked permissions and to the red files and all looks in order. I've used the following:  
Red [  
Needs: 'View  
]

print get-current-dir

view layout/options/styles [  
label "Header:" field return  
label "Text:" below area  
button "OK"  
] do %tabbing-actors.red do %label-style.red

9214

[13:01](#msg5c2f592409b8066849b28b80)@Franktic2 update to the latest automatic build.

Franktic2

[13:20](#msg5c2f5da537975e7ca9715f1f)@9214 I tried the latest build and got the same result \*\** Runtime Error 1: access violation  
\*\** at: 004CB436h - I can wait as I'm only doing hobby programming. Thanks for your help.

9214

[13:22](#msg5c2f5e0c93cce97d3be688af)@Franktic2 can you check it once more with `recycle/off` inserted before the main script?

Franktic2

[13:49](#msg5c2f647237975e7ca9718c2a)@9214 straight after the Red \[] header gives the same error. Don't waste any time on this. I am only mucking about and can wait for tabbing to be implemented.

toomasv

[14:58](#msg5c2f7485ab910e7d3a1f2b28)@Franktic2 I'll bother you more :). Did you compile it or ran in graphic console?

ne1uno

[16:20](#msg5c2f87be09b8066849b3d459)@toomasv -r w/stable compiles without error using `#include`, but doesn't run

[16:22](#msg5c2f883c0b7fc97caaea7829)works ok as script or from recent build interpreted as well ok interpreted w/stable on win7

toomasv

[16:23](#msg5c2f88936649aa1f821d1500)@ne1uno Thanks! I noticed difference in behaviour between compiled and interpreted.

ne1uno

[16:39](#msg5c2f8c2c2863d8612bd9de63)it does generate some unexpected event sound effect most of the time and has to be `tab twice to reverse direction, same if`shift tab\`

[16:40](#msg5c2f8c82d945b96882448185)\_latest -r same thing. compile w/o error won't run

[16:46](#msg5c2f8dcc93cce97d3be7c190)also `-e` fails the same way

toomasv

[17:44](#msg5c2f9b882863d8612bda4097)@ne1uno Thank you!. For me compiled version works but does not interpret label style correctly.

ne1uno

[17:46](#msg5c2f9be88d31aa78b148b1a1)other compiled gui programs work, both versions.

## Saturday 5th January, 2019

ne1uno

[02:29](#msg5c30168e1948ad07e8ee16e5)one more try, include inline both gist after view. interpreted/compiled work

toomasv

[04:45](#msg5c30367b1948ad07e8eecab7)Thanks!

[16:38](#msg5c30dd6b6370df0b9194cf94)`rich-text` can now take quite sophisticated specs:

```
view [rich-text data [
    red i "Red italic" u [
        " underlined" b/blue [
            " bold blue" s/gold [
                " strike gold"
            ] " bold blue"
        ] " underlined red"
    ] /i " just red" leaf " leaf"
]]
```

\[!\[rt-colors5](http://vooglaid.ee/red/rt-colors5.png)](http://vooglaid.ee/red/rt-colors5.png)

bferris413

[21:51](#msg5c3126f26370df0b91969c24)I'm having some issues setting `selected` in a panel. From the red docs at https://doc.red-lang.org/en/view.html#\_panel I don't see the `selected` facet mentioned, but if I print a panel object it's seems like it's definitely being used. The basic code I'm using is this:

[21:52](#msg5c31270982a6c30b908e2b9e)

```
controls: [ f1 f2 f3 ]

selected-tab: 1

update-focus: function [ index [integer!] /extern selected-tab ][ selected-tab: index ]

update-tab: function [face event /extern selected-tab controls] [
    if event/key = tab [
        either selected-tab < length? controls [
            selected-tab: selected-tab + 1
        ][
            selected-tab: 1
        ]
        face/parent/selected: get pick controls selected-tab 
    ]
]

gui: [
    panel [
        f1: field "f1" on-focus [ update-focus 1 ] on-key [ update-tab face event ] return
        f2: field "f2" on-focus [ update-focus 2 ] on-key [ update-tab face event ] return
        f3: field "f3" on-focus [ update-focus 3 ] on-key [ update-tab face event ] return
    ]
]
```

[21:52](#msg5c31272126d86e4d562f825f)If I remove the panel from `gui`, setting `selected` works as expected

[21:53](#msg5c31274b26d86e4d562f834f)(I mean removing `panel [ ]`, but keeping the actual contents of the block)

[21:53](#msg5c31277673360b4d55c39443)disclaimer: new, fighting the learning battle, probably haven't read all the docs =) but I'm working on it...

## Sunday 6th January, 2019

bferris413

[00:17](#msg5c31491857c6883f9b6c5b89)as an update, I can see that selected is working, but focus isn't hitting the field that gets tabbed to

[00:17](#msg5c31491d26d86e4d5630549a)

```
controls: [ f1 f2 f3 ]

selected-tab: 1

update-focus: function [ index [integer!] /extern selected-tab ][ 
    selected-tab: index 
    print rejoin [ "Got focus at index: " index ]
]

update-tab: function [face event /extern selected-tab controls] [
    if event/key = tab [
        either selected-tab < length? controls [
            selected-tab: selected-tab + 1
        ][
            selected-tab: 1
        ]
        face/parent/selected: get pick controls selected-tab 
        face/parent/selected/selected: 1x2 ; debug to see that selection is working, but the field isn't getting focused
        print face/parent/selected
    ]
]

gui: [
    p: panel [
        f1: field "f1" on-focus [ update-focus 1 ] on-key [ update-tab face event ] return
        f2: field "f2" on-focus [ update-focus 2 ] on-key [ update-tab face event ] return
        f3: field "f3" on-focus [ update-focus 3 ] on-key [ update-tab face event ] return
    ]
]
```

[00:18](#msg5c31495357c6883f9b6c5dc4)When you tab, the selected value changes, but that field isn't getting focused.

[00:35](#msg5c314d39357dd7655d22cd55)I think my question is then, how can I get the 'window to focus what's actually selected inside a certain 'panel?

toomasv

[06:21](#msg5c319e7d12db9607e7438773)@bferris413 Try using `set-focus` or `face/parent/parent/selected:` instead of `face/parent/selected:`. Only window's `selected` facet controls focus.

## Monday 7th January, 2019

hiiamboris

[05:08](#msg5c32deb51d1c2c3f9cd38dd7)FYI, there's a trick: `event/window/selected`. And there's also a bug: https://github.com/red/red/issues/1869

bferris413

[14:24](#msg5c3361381491b27876d539bd)@toomasv @hiiamboris thanks, I'll follow up in the evening.

Phryxe

[15:31](#msg5c3370de12db9607e74e9c48)

```
x: ["One" "Two" "Three" "Four"]

init: func [x][
	repeat i 3 [
		unless tail? x [to-word rejoin ['f i]/text: x/1]
		x: next x
	]
]

view/tight [
	style f: field 200 gold bold
	below
	f1: f
	f2: f
	f3: f
	do [init x]
]
```

What am I doing wrong?

9214

[15:42](#msg5c33735a357dd7655d2f9525)And what are you trying to do?

Phryxe

[15:43](#msg5c3373ab12db9607e74eaca7)Add text from `x` to the fields with `init`.

endo64

[16:04](#msg5c3378903cf6c35a84a5fa11)@Phryxe you probably should do \`set in get load join "f" i 'text

[16:04](#msg5c3378aa57c6883f9b793f24)ah sorry, on mobile..

[16:05](#msg5c3378c41948ad07e80215f8) `set in get load join "f" i 'text x/1`

toomasv

[17:01](#msg5c3385f71d1c2c3f9cd7cf56)`set in get load rejoin ["f" i] 'text x/1`

Phryxe

[17:23](#msg5c338b2f1491b27876d65ecd)@endo64 @toomasv I don't understand why, but I see it works. Thanks!

toomasv

[17:24](#msg5c338b565ec8fe5a8517d234)@Phryxe You can't use path notation with block.

Phryxe

[17:25](#msg5c338ba0357dd7655d303eaf)@toomasv OK, good to know :)

toomasv

[17:26](#msg5c338bcd3cf6c35a84a675e5)Neither with the result of `to-word rejoin ['f i]`.

Phryxe

[17:27](#msg5c338c0457c6883f9b79c3a1)OK

toomasv

[17:29](#msg5c338c7426d86e4d563dec9b)But you could do also this `unless tail? x [set to-path reduce [to-word rejoin ['f i] 'text] x/1]`

Phryxe

[17:31](#msg5c338ce3aac7082e6feb5141)I see, thnx

toomasv

[17:31](#msg5c338cecbd592b2e6e68c97b):smile:

endo64

[21:12](#msg5c33c0da4ed182787774ebc5)@toomasv Thanks for correcting my example, I always forget that we don't have `join` yet :)

bferris413

[22:57](#msg5c33d93c12db9607e7514cf4)@toomasv both `set-focus` and `face/parent/parent/selected` worked. I didn't know `set-focus` existed, and it didn't occur to me that a 'window could focus a child's children.

[22:57](#msg5c33d9421948ad07e80483fa)thanks for the help

## Tuesday 8th January, 2019

toomasv

[04:11](#msg5c3422fcbd592b2e6e6c63bb)@endo64 @bferris413 You are welcome!

## Wednesday 9th January, 2019

Phryxe

[11:51](#msg5c35e04bbd592b2e6e776c3a)!\[Scroll Test](http://images.crex.se/red/scroll-test.gif)

rebolek

[11:56](#msg5c35e1891d1c2c3f9ce6c7dc):smile:

olivier\_lp\_twitter

[12:21](#msg5c35e75d8b6399655e2fe175)@endo64 you can use rebol definition for join join: func [  
"Concatenates values."  
value "Base value"  
rest "Value or block of values"  
][  
value: either series? :value \[copy value] \[form :value]  
repend value :rest  
]

toomasv

[17:39](#msg5c3631d873360b4d55e2ce8d)@Phryxe :+1:

endo64

[21:17](#msg5c3664f3ef78da1bced65177)@olivier\_lp\_twitter Sure! It's the reason I constantly forget we don't have `join` yet, it is in my `user.red` file and it is loaded during startup by my shortcut (I use Clavier+ for that)

## Thursday 10th January, 2019

greggirwin

[00:32](#msg5c3692b983c7e3776544aa3f)@Phryxe, thanks for posting. Do you have the code in a gist or something, so others can see how it's done?

Phryxe

[07:47](#msg5c36f89866f3433023a41521)@greggirwin Probably not the prettiest code, but here it is ... \[Scoll Test](https://gist.github.com/Phryxe/f6608401a6bc385c09aeebf82fd3303e)

greggirwin

[08:16](#msg5c36ff6c66f3433023a44127)Thanks @Phryxe!

planetsizecpu

[09:22](#msg5c370ed68db70e46c4e32938)Hi guys, I have seen running VID `scroller` for a while, today I tested as `w: layout [s: scroller 200x300]` and seen `s/data` is of `float!` type, so where to enter data to rows for test?

[11:20](#msg5c372a7754d8bb07ccc99514)Ah, maybe at `s/pane` as objects, will made some test again and try to understand how it works.

toomasv

[11:50](#msg5c37317ddfe13328202a4fcb)@planetsizecpu Play with this:

```
view [panel [origin 0x0 text 40 "Data:" t0: text 40 "" return 
    sc: scroller 200x300 on-change [t0/text: to-string face/data]] 
    below text "Selected:" t1: text "" 
    slider 25x260 [t1/text: to-string round/to sc/selected: face/data .01]
    return text "Steps:" t2: text "" 
    slider 25x260 [t2/text: to-string round/to sc/steps: to-float face/data .01]
]
```

planetsizecpu

[12:34](#msg5c373be95aa04d46c58a3a48)@toomasv thx, it works as you want, I tested with `s/pane` but I don's see how to set some text into rows for selection as in `text-list` for example, so will have to wait until info become available, maybe it is under development or it is not intended for data selection.

toomasv

[12:37](#msg5c373c7c8db70e46c4e4537e)@planetsizecpu Can you please elaborate more on what you want to achieve?

planetsizecpu

[12:43](#msg5c373df4a57b501bcfe0fe0f)@toomasv I think I did not fully understand what was the use of this widget, I thought it was for data selection in rows, but now I see that I was wrong. Everything has been a mistake on my part :-)

toomasv

[12:59](#msg5c3741cc9289cc7aa74fa817)@planetsizecpu did you want to do something like this? (just a quick throw-together, needs more consideration):

```
view [
    sc: scroller 15x150 [
        tl/selected: min max 1 to-integer face/data / face/steps length? tl/data
    ] tl: text-list data ["One" "Two" "Three" "Four"] 
    do [sc/steps: 1.0 / length? tl/data]
]
```

planetsizecpu

[13:03](#msg5c3742982e25e453d75ce9d4)@toomasv no, I just thought it was intended for use as selector in the way `text-list` does, so there was my error.

[13:22](#msg5c37471fe7832c7aa8a30330)@toomasv IIRC by the days `scroller` where announced we were talking here about multi-column text-list, time has passed and I had forgotten for what it were intended to. It seems I need a RAM update :-). Anyway thx for your help, last script may have interesting applications for data selection.

toomasv

[13:23](#msg5c374749783a5553d8107bd2):smile:

[14:26](#msg5c375608e7832c7aa8a36417)@planetsizecpu

```
view [
	sc: scroller 15x150 [tl/selected: to-integer round/ceiling face/data / face/steps] 
	on-created [
		face/steps: 1.0 / length? tl/data        
		face/selected: 1.0 / (length? tl/data) * 100%]
	tl: text-list 100x150 data [
		"one" "two" "three" "four" "five" "six" "seven" 
	]
]
```

[16:47](#msg5c37771a83c7e377654a5c70)Different flavor of scroller within rich-text:

```
context [
	rt: scr: i2: none
	select-line: function [line][
		pos: rt/text
		loop line - 1 [pos: find/tail pos newline]
		i1: index? pos
		if not i2: find next pos lf [i2: tail rt/text]
		i2: index? i2
		rt/data/1: as-pair i1 i2 - i1
	]
	view [
		rt: rich-text 100x150 "one^/two^/three^/four^/five^/six^/seven^/eight" 
		with [flags: 'scrollable] 
		on-created [
			put get-scroller face 'horizontal 'visible? no 
			scr: get-scroller face 'vertical 
			scr/max-size: rich-text/line-count? face
			scr/page-size: 1
			i2: index? find face/text newline 
			face/data: compose [(as-pair 1 i2) 255.255.255 backdrop 0.120.215 ]
		] 
		on-scroll [
			unless event/key = 'end [
				select-line scr/position: min max 1 switch event/key [
					track [event/picked]
					up page-up [scr/position - 1]
					down page-down [scr/position + 1]
				] scr/max-size
			]
		]
	]
]
```

planetsizecpu

[17:58](#msg5c3787c0783a5553d8123ba1)Nice!

toomasv

[18:03](#msg5c3788d7a57b501bcfe30fc7):smile:

greggirwin

[19:17](#msg5c379a485aa04d46c58cd64d):+1:

toomasv

[19:47](#msg5c37a152317e2407cd0fa765)It's interesting that there are two different scrollers -- a stand-alone one, as in first snippet, and an embedded one, as in second, each with different facets and set-up.

Re-git

[21:35](#msg5c37bab6e7832c7aa8a61c65)Is it planed to have some kind of easy responsive design for Red gui system soon? At the moment it's not really simple to have a resizable window with all the widgets responding correctly. I feel like this is the only thing stopping red from being the best tool for creating Gui desktop apps.

greggirwin

[21:46](#msg5c37bd1f8db70e46c4e7dbc6)@vejitatoja, it's not a priority item on our list, but there have been a number of experiments done. @toomasv can probably point you to them quickest. It's not the only thing stopping us, though. ;^)

## Friday 11st January, 2019

toomasv

[04:25](#msg5c381aadda98233022f1706a)@vejitatoja I have three trials \[here](https://github.com/toomasv/learning/tree/master/styles). Not that it makes it easy.

## Saturday 12nd January, 2019

greggirwin

[21:37](#msg5c3a5e31ba355012a42baba1)@toomasv @gltewalt see the chat following https://gitter.im/red/red/system?at=5c39cb7f95e17b45253c5d56 and let's see if we can get docs put together while the iron is hot and the core team can give support to get them right.

## Sunday 13th January, 2019

greggirwin

[21:38](#msg5c3bafe3ba5936605bb545c7)@hiiamboris your recent font graphic posts embed in Gitter and show as very small for me here. Your text makes it clear, but it's hard to see the results on screen.

[21:39](#msg5c3bb01628513d605a1f7372)Ah, Gitter expands them if I maximize the window. All good.

## Friday 18th January, 2019

Phryxe

[13:38](#msg5c41d6e4ba355012a45b4b3f)!\[Sort Fake Datagrid](http://images.crex.se/red/sort-fake-datagrid.gif)

rebolek

[13:39](#msg5c41d6fd20b78635b6431b05):clap:

Phryxe

[13:42](#msg5c41d7d87a0f4d5b19cbdf88)\[Sort Fake Datagrid](https://gist.github.com/Phryxe/225a5ed619a9e648ab9ef1323d0e99bc)

[13:43](#msg5c41d814746d4a677ad1d503)A bit too hardcoded. It can probably be made more generic ... :smile:

toomasv

[14:15](#msg5c41df68f780a1521f2de8f4)@Phryxe Cool! :+1:

Phryxe

[14:32](#msg5c41e36227611d4204c3d89a)@rebolek @toomasv Thanks!

rcqls

[17:30](#msg5c420d1fdab15872ceb56ff2)@Phryxe With the last PR I made your datagrid example working on Linux with red/GTK.

Phryxe

[17:42](#msg5c420fec20b78635b644b432)@rcqls Nice :smile\_cat:

greggirwin

[23:24](#msg5c42604895e17b4525730a78):+1: @Phryxe

## Tuesday 22nd January, 2019

Phryxe

[11:04](#msg5c46f8c535350772cf6ef8c7)Is there a code example of a custom widget?

rebolek

[12:37](#msg5c470e851cb70a372a1bbdd6)@Phryxe http://red.qyz.cz/writing-style.html

Phryxe

[12:52](#msg5c4711fd0a491251e3383824)@rebolek Thank you! :thumbsup:

rebolek

[12:53](#msg5c471250c45b986d119f49c5)@Phryxe you're welcome! It 's very basic tutorial, if you have some questions, feel free to ask.

## Thursday 24th January, 2019

Oldes

[13:44](#msg5c49c140cb47ec300095461b)Does anybody have svg to draw dialect conversion script?

AlexanderBaggett

[17:26](#msg5c49f55a20b78635b67761e8)I don't, but sure would be interested in one.

Oldes

[18:01](#msg5c49fd5d746d4a677a056b76)I'm not sure if draw is able to display everything what current SVG provides... on the other side, I'm more interested in converting draw to svg (so be able to save what I have in draw in vector format which can be used elsewhere).

AlexanderBaggett

[19:35](#msg5c4a139f7a0f4d5b19007f76)Either one honestly, I would be glad to have either one.

rebolek

[19:45](#msg5c4a15dc8318994524416812)I've seen tiger demo on Android, so there must some way to do it.

ne1uno

[21:02](#msg5c4a27d17a0f4d5b19010644)@Rebol2Red set alpha bit to 254, will still be transparent but catch events.

Rebol2Red

[21:06](#msg5c4a28e7746d4a677a06a1c8)I removed my entry because the loaded file from internet was not a real .png file  
@ne1uno  
Alpha bit from what?  
Can you give me a short example of this, please  
I hope you do not mean to alter every pixel of the .png file?!

[21:08](#msg5c4a29557a0f4d5b190111dd)Here i post the updated question

No event occurs when clicked on a transparent part of a .png file

Try this for yourself:

im: some-real-png-file from your harddisk (not a renamed .jpg to .png)  
as an example:  
im: %\\D\\TEBACKUPPEN\\REN\\DATAFILES\\gmail.png  
view \[image 400x400 im \[print event/picked]]

Is there a way to get an event somehow?

remark:  
I tried the following (with the obvious results):

A hidden image (below the shown image) ==&gt; gets no event too

If i place the image on a base and put the event on it ==&gt;  
The image which is put on this base takes the event away

I want the event occurs on any part of this .png file

[21:19](#msg5c4a2bed0721b912a5d288d1)Is there some 'build-in' .png file to use as an example file?

greggirwin

[22:25](#msg5c4a3b60cb47ec3000989c69)@Oldes, we want SVG translations too, though the first step in that is an XML codec. A key element for that, simply because of the size of a lot of XML datasets, is that it needs to be performant. I'm all for making it as easy as possible, as a first step, but performance is an important aspect long term.

## Saturday 26th January, 2019

rgchris

[02:06](#msg5c4bc0a578e1ed41038dca97)@Oldes I have some code kicking around for that. One of the trickiest limitations to overcome is Red's integer-pair restriction, I've had some success multiplying the values coming in and scaling the resultant draw block down.

[04:52](#msg5c4be77b41775971a085f7fb)This is raw, embryonic, highly experimental and unvarnished. YMMV, there may be dragons and no guarantees: https://gist.github.com/rgchris/b1ee7786c38f572c10e0b04235715afb

[04:53](#msg5c4be7b38aa5ca5abf32933d)(as you can see from the example, it has some ways to go)

[05:10](#msg5c4bebe193fe7d5ac0f057ec)In the \[pinkie](http://reb4.me/x/red-pinkie.svg) example (`#Pole_Outline`), the path =&gt; shape conversion is stymied by Red's \[SHAPE](https://doc.red-lang.org/en/draw.html#\_shape\_commands) assertion: \*"Shapes are automatically closed (no need to draw the last stroke back to start position)."\*—that might be a dealbreaker in a few situations.

meijeru

[13:15](#msg5c4c5d8c93fe7d5ac0f2f473)Missing in the GUI documentation: the `text-list` face ignores tabs when displaying the items in the `data` facet.

## Tuesday 29th January, 2019

greggirwin

[05:55](#msg5c4feae8975714406b5bb532)To be confirmed on MacOS.

## Wednesday 30th January, 2019

Oldes

[08:16](#msg5c515d7393fe7d5ac0134bab)@rgchris thanks.. nice code as usually.

endo64

[22:43](#msg5c5228841b62f12650774c32)Is this a known issue?

Click on the button will make the button black instead of transparent

```
view [
	b: base red 100x100 "Test"
	button [b/color: transparent]
]
```

While this one works, even click on the button:

```
view [
	b: base red 100x100 "Test"
	button [b/color: transparent]
	do [b/color: transparent]
]
```

rgchris

[22:52](#msg5c522ab341775971a0ae6109)@Oldes Thanks! Let me know if you're able to push it along any. I don't think it'll be too difficult to get the TRANSFORM properties working. TEXT too might actually be doable as well, but it'll take a bit of effort handling TSPAN's.

greggirwin

[22:54](#msg5c522b2293fe7d5ac0192710)Very cool @rgchris.

[23:00](#msg5c522c9b78e1ed4103b7517a)@endo64 I don't see a ticket for that issue.

## Thursday 31st January, 2019

toomasv

[04:22](#msg5c5277feceb5a2264f6bd666)@endo64 Something similar has come up earlier, but I cannot find it in issues. `base` face's alpha-channel should be set in creation different from 0, then it works:

```
view [
    b: base 255.0.0.1 100x100 "Test" 
    button [b/color: transparent]
]
```

hiiamboris

[10:08](#msg5c52c93878e1ed4103bb2d55)Runtime changing of base style on W7 is probably just not implemented, but I wonder what stops it from working on W8+...

endo64

[10:10](#msg5c52c98054f21a71a1d56f68)I tested on win 10.

toomasv

[13:54](#msg5c52fdf9975714406b707ceb)W10 here too

## Monday 4th February, 2019

ldci

[11:10](#msg5c581d9813a2814df619c33d)Update for red OpenCV here https://github.com/ldci/OpenCV3-red. Improved for red 0.6.4 compiler.

[12:54](#msg5c58362054f21a71a1f8200a)Update for redCV and red 0.6.4 : https://github.com/ldci/redCV

## Saturday 9th February, 2019

lepinekong\_twitter

[14:43](#msg5c5ee70b4003460b2d20a8c4)@moliad really nice is there code somewhere ?

## Monday 11st February, 2019

moliad

[21:13](#msg5c61e5768328315decda3fec)@lepinekong\_twitter talking about graph editor?

[21:13](#msg5c61e582ef98455ea41c02f2)not yet, but it will be shared

[21:13](#msg5c61e5884bafd97ca3d637cd)we are still working on it.

lepinekong\_twitter

[21:43](#msg5c61ec6aecef85660b8c4264)@moliad ok thanks. What I want is an example to be able to implement grafcet ;) this one is in js https://gojs.net/latest/samples/grafcet.html

moliad

[21:47](#msg5c61ed83d1e3093ab503e893)my graph engine is meant to implement live procedural dataflow diagrams

[21:48](#msg5c61edaa126af75deb8d39cf)its not just for drawing, it will have real time messaging, meant to develop and test liquid v2 on Red, using native (R/S) code.

## Tuesday 12nd February, 2019

Oldes

[13:29](#msg5c62ca35604f233ab6f8c1f5)I thought that Red is DPI aware, but it looks that not fully... check this screenshot:

[13:29](#msg5c62ca43604f233ab6f8c25c)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/KvpO/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/KvpO/image.png)

[13:31](#msg5c62caa480df6804a19092fb)Or is it by design and I should manually scale my content down to the exact resolution?

pekr

[13:34](#msg5c62cb7828c89123cbb769b2)I wonder, if xnView is dpi aware - I have constant problems when cutting screenshots and pasting into other apps ....

[13:35](#msg5c62cb9b4bafd97ca3dc3d12)But - I never thought about it deeply. xnView is my go to viewer for more than a decade though ...

Oldes

[13:36](#msg5c62cbdc604f233ab6f8ca82)I think that xnView is correct as I don't want to see my images blurry as it is now in Red.

[13:37](#msg5c62cc0eecef85660b9228c1)Btw... my DPI is correctly reported:

```
>> ? system/view/metrics/dpi
SYSTEM/VIEW/METRICS/DPI is an integer! value: 144
```

hiiamboris

[15:06](#msg5c62e0f4ecef85660b92c7e1)@Oldes I think \*dpi-independent* might be a better term. It scales everything, including images, by 144 / 92. And that's it. I don't think it supports reading image's DPI property or scales the image for you.

[15:16](#msg5c62e3517502282258e06ef5)I can tell that GetVerticalResolution &amp; GetHorizontalResolution functions of GDI+ (to inquire image properties) aren't even defined in Red sources.

Oldes

[17:14](#msg5c62fee2d1e3093ab50b8c13)The question is.. how to have it under control, when I don't want it scaling

hiiamboris

[17:35](#msg5c6303d128c89123cbb92940)by reverse-scaling it in draw

JacobGood1

[20:15](#msg5c632960604f233ab6fb85dc)hey guys does view work in linux yet?

## Wednesday 13th February, 2019

Oldes

[00:19](#msg5c636286ef98455ea4266e8a)@JacobGood1 follow it here https://gitter.im/red/GTK

moliad

[14:59](#msg5c6430ed253c2b5ea306e012)there is a little win32 function to call to tell the OS that you are handling the gui scaling, then the OS stops doing its DPI scaling tricks.

[15:02](#msg5c643194ecef85660b9c0b97)note that even microsoft has trouble supporting it... MS Outlook often has some parts of it scaled and blurry while other parts of the gui are sharp and crisp... it's laughable

pekr

[15:34](#msg5c64391980df6804a19a8b0a)@moliad Max, unbelievable - we were just discussing scaling problems in Win10 and 5 minutes ago I showcased an MS Outlook - when you open file explorer, it is blurry. MS can't get its own app corrected, hilarious. Well, one year ago, I had to restart (or log-off/in), as the whole Outlook was blurry. MS is getting there, just very slowly :-)

lepinekong\_twitter

[16:42](#msg5c6448efef98455ea42cd091)@moliad would be nice to be able to style your graphics element so that one could draw something as nice as this ;) https://www.literatureandlatte.com/assets/image/scapple/history\_of\_rock.jpg on https://www.literatureandlatte.com/scapple/overview

moliad

[16:44](#msg5c644960604f233ab6036a72)hehe the style system actually the simplest part of it. I'm using nothing of view within the node editor, its 100 DRAW, so its easy to skin and it would take just an hour or two to make it look like what you gave :-)

[17:17](#msg5c64512a80df6804a19b469b)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/fUaO/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/fUaO/image.png)

[17:18](#msg5c6451627502282258e5e34a)@Oldes if you look into the properties of an application, I just discovered, that you can control the DPI scaling from there... maybe that's enough for you :smile:

[17:19](#msg5c6451a1604f233ab603aa6f)first time I notice it (image from Windows 10)

## Thursday 14th February, 2019

rebolek

[10:43](#msg5c654669dc3f0523ccb3389b)What am I doing wrong?

```
>> view [style test: base on-click [face/data: random 1000] x: test button "test" [print x/data]]
none
none
none
none
```

hiiamboris

[10:47](#msg5c654756ef98455ea433c41d)@rebolek you've overwritten the whole `actors` facet ☻

rebolek

[10:48](#msg5c654774adf6cb0b2cb88b30)Yeah, I'm that cool.

[10:49](#msg5c6547a0adf6cb0b2cb88c1f)But that doesn't mean that `face/data` shouldn't be set, does it?

hiiamboris

[10:49](#msg5c6547d38328315decf1ba54)how? on-click was lost before the window shows

rebolek

[10:52](#msg5c654872253c2b5ea30e70d6)@hiiamboris Ok, works with `on-up`. However my original problem was with `on-over`, let me test it...

[10:53](#msg5c6548b0ecef85660ba3c5b0)Oh.

[10:53](#msg5c6548c7253c2b5ea30e72c4)I've got two styles there...

[10:54](#msg5c6548d64bafd97ca3ede120)Was setting it in first and testing second...

hiiamboris

[10:54](#msg5c6548ed4bafd97ca3ede14d):D

toomasv

[11:02](#msg5c654ac5ef98455ea433ddf9)@rebolek `on-click` works for buttons only.

```
>> view [style test: base on-down [face/data: random 1000] x: test button "test" [print x/data]]
503
771
648
492
```

rebolek

[11:05](#msg5c654b65253c2b5ea30e8302)@toomasv Right, I haven't `on-click` in my original code, just used it for an example. And the problem was with confusing two styles I am working on simultaneously.

toomasv

[11:05](#msg5c654b88ecef85660ba3d8be)Ok

rebolek

[11:06](#msg5c654bbb253c2b5ea30e8596)And using `on-click` wasn't good idea at all.

[11:38](#msg5c655323dc3f0523ccb39421)Anyway, the default face's action is problematic.

toomasv

[11:43](#msg5c65546e5095f6660cf15a60)@rebolek What do you have in mind?

## Friday 15th February, 2019

rebolek

[08:52](#msg5c667dca80df6804a1aabe4e)@toomasv for example selecting what the default action for given face (e.g.: `base`) should be.

[08:52](#msg5c667dda28c89123cbd15428)Bitmap font: https://i.imgur.com/hAF3Cwu.png

BeardPower

[11:37](#msg5c66a4848328315decfb627b)@rebolek Bitmap font and AA is a bad thing ;-)

rebolek

[13:10](#msg5c66ba427502282258ee44a4)Yeah, I should have turned it off.

## Saturday 16th February, 2019

rebolek

[08:38](#msg5c67cbf78328315dec030314)Segment display: https://i.imgur.com/AuVdg2V.png

toomasv

[11:41](#msg5c67f6cd8328315dec040da6)@rebolek :+1:

meijeru

[17:20](#msg5c684651ecef85660bb7f903)Nice! Where do we find `segment7!`?

greggirwin

[18:33](#msg5c68576580df6804a1b7147e)@rebolek, niiiiiiice. :^)

On DPI, I wonder if that's why Notion desktop is sometimes blurry for me. Not always, but sometimes.

rebolek

[18:53](#msg5c685c3c4bafd97ca302bbd8)thanks guys :)

@meijeru I'll cleanup the source a bit and put it into my `red-styles` repo

## Sunday 17th February, 2019

temperfugit

[20:37](#msg5c69c62728c89123cbe6373b)I worked out how to save a canvas as a png using `test: to-image` and then `save %test.png test`. However if I try it on a canvas larger than the screen, it appears that the parts not on the screen are saved as empty (black) areas. Is there a way to save a canvas that's larger than the screen to png? Maybe even a way to render draw code to png without drawing it on the screen at all?

9214

[20:44](#msg5c69c7c5d1e3093ab539648d)&gt; Maybe even a way to render draw code to png without drawing it on the screen at all?

Uhm, have you read `draw` specification? It takes `image!` (of any size) as a first argument, or a `pair!` that specifies canvas size.

temperfugit

[21:35](#msg5c69d3bf126af75debc239ce)Thank you, that's what I needed to know. I suppose that was a pretty silly question. I didn't realize `draw` worked outside of `view`, so I was trying to find an argument for or within `view` when I should have been looking directly at `draw` itself.

## Monday 18th February, 2019

mikeparr

[13:40](#msg5c6ab5dfef98455ea456f041)I know that other contributors are working on drag/drop GUI editing for individual faces. Alongside such editing, I also like a component tree, to clearly show the nesting of panels and faces.  
Here is something I've been working on. It can input a VID (subset), parse it into nested blocks(for panels), and display a name-type tree. The tree allows manipulation of panels as single items.  
The images below show the tree, and the selection/deletion of an inner panel.  
BTW I'm not doing much more with this. It started to get complicated, and I'm not sure if my coding is the best approach.

[13:40](#msg5c6ab5eb4bafd97ca31124af)\[!\[face-tree1.jpg](https://files.gitter.im/red/red/gui-branch/7ajP/thumb/face-tree1.jpg)](https://files.gitter.im/red/red/gui-branch/7ajP/face-tree1.jpg)

[13:41](#msg5c6ab5f716e4682259c26a50)\[!\[face-tree2.jpg](https://files.gitter.im/red/red/gui-branch/EnmN/thumb/face-tree2.jpg)](https://files.gitter.im/red/red/gui-branch/EnmN/face-tree2.jpg)

moliad

[13:42](#msg5c6ab65f4003460b2d6f219d)cool

toomasv

[13:42](#msg5c6ab65f7502282258068cbf)@mikeparr Very nice!

rebolek

[13:42](#msg5c6ab6604bafd97ca31128d9)@mikeparr that's looks very useful!

moliad

[14:27](#msg5c6ac0ee16e4682259c2b600)can anyone confirm that bound words are not evaluated within a draw dialect ? this is one of the most useful features of draw on Rebol

rebolek

[14:30](#msg5c6ac1774bafd97ca3117a1e)AFAIK it's not allowed due to security concerns.

moliad

[14:30](#msg5c6ac17cd1e3093ab53fcf15)I am expecting this to work: `my-pos: 200x200 to-image my-img [ circle my-pos 30 ]` (I get invalid draw dialect error in my tests)

[14:30](#msg5c6ac1868328315dec154f1f)security.. wtf?

rebolek

[14:30](#msg5c6ac19280df6804a1c5c990)`compose` is suggested in such case.

moliad

[14:31](#msg5c6ac1acadf6cb0b2cdc50c7)but compose must regenerate the block at each redraw which is VERY slow compared to just redrawing.

rebolek

[14:31](#msg5c6ac1c1750228225806d375)either that or changing required values directly

moliad

[14:31](#msg5c6ac1d080df6804a1c5cb60)where is the security issue?

[14:32](#msg5c6ac1f1adf6cb0b2cdc530e)don't say that its because its in a dialect... everything in red is a dialect, even do.

rebolek

[14:32](#msg5c6ac20fef98455ea45749d4)IIRC in Rebol it was possible to do things like `my-pos: func [][delete-all-files]`.

moliad

[14:33](#msg5c6ac228adf6cb0b2cdc5403)yes. and all you need to do to prevent this is to unbind your block.

[14:33](#msg5c6ac2385095f6660c14e3e3)(use to-block instead of load)

rebolek

[14:34](#msg5c6ac26e80df6804a1c5d0bf)Let's see if @dockimbel has more details to add.

moliad

[14:34](#msg5c6ac271d1e3093ab53fd4f1)strange I was under the impression that red also added `unbind` from R3

[14:34](#msg5c6ac27880df6804a1c5d0cc)can't find it.

rebolek

[14:35](#msg5c6ac29fecef85660bc76e84)I don't think it was added.

moliad

[14:35](#msg5c6ac2a228c89123cbec720f)we could add `none!` as a valid type to `bind`, which is pretty logical... bind this block to nothing.

[14:35](#msg5c6ac2cc28c89123cbec7347)as in `bind myblock none`

[14:36](#msg5c6ac2d8750228225806dc4c)(pretty easy to implement too)

rebolek

[14:36](#msg5c6ac2dadc3f0523ccd718b9)looks fine to me

nedzadarek

[14:36](#msg5c6ac2fdecef85660bc77044)@moliad so every word in `myblock` would be bound to unset value?

[14:38](#msg5c6ac359d1e3093ab53fdc0d)`a: 42 [print ["Answer: " a]]`

rebolek

[14:38](#msg5c6ac35e4003460b2d6f7743)@moliad in Red Draw, you can use `set-word!` as a label, so you can do `draw-block: [my-circle: circle 100x100 30] my-circle/2: 150x150`

moliad

[14:53](#msg5c6ac6f4604f233ab62e7ef3)@nedzadarek there are two ways of implementing this, depending on how Red handles unset! you could have a word with a null pointer to a context (which is how Rebol2 seems to do it) which is when you get the error `word is bound to no context` and assigning each word to an `unset`, where you get the error `a needs a value` (when used). I do not know if Red officially supports the first, which is the proper one.

[14:55](#msg5c6ac75a16e4682259c2e283)@rebolek that is neat, didn't know that (doesn't solve my problem, but its nice nonetheless)

9214

[15:03](#msg5c6ac9575095f6660c1515bc)@moliad Red doesn't support the first way (i.e. all words are bound to some context, global or otherwise), I think it may change after `module!` is implemented.

[15:07](#msg5c6aca308328315dec158ec3)So your `bind block none` would "nullify" all words in a block? Sounds too heavy-handed.

moliad

[15:18](#msg5c6accc64003460b2d6fbbcf)no its necessary. its called unbinding. it's the only way to make sure that a block of data doesn't have any unknown words dangling. usually, you will rebind a block to known and accepted contexts. anything left is an error, or a security error you prevented.

9214

[15:23](#msg5c6acddcef98455ea4579c22)@moliad ah, I see now. If I want to unbind specific words, then, I should do `bind bind block none context [...]`?

Oldes

[15:42](#msg5c6ad24a4bafd97ca311f740)@moliad I see no reason why `draw [ circle my-pos 30 ]` could not work. It is same like: `view layout [image my-img]` which works now.

[15:42](#msg5c6ad280d1e3093ab5404b32)although I would prefer to use `get-word` in such a case.. so: `draw [ circle :my-pos 30 ]`

moliad

[15:44](#msg5c6ad2e4126af75debc89fba)@Oldes `get-word!` is a good middle ground. it would be more explicit

[15:46](#msg5c6ad33b8328315dec15cc67)@Oldes I agree that it should work... but in my tests it doesn't. it's probably graphic-element specific, rather than dialect-wide

Oldes

[15:46](#msg5c6ad373126af75debc8a30f)I think it is just \_not implemented yet_ but it should be requested.

moliad

[15:50](#msg5c6ad45828c89123cbecef13)rebolek seems to think it was designed like this on purpose. :confused:

[15:51](#msg5c6ad478d1e3093ab54058cf)

9214

[16:04](#msg5c6ad79780df6804a1c667ea)Well, VID already allows evaluation of arbitrary code for specific facets, I don't see why Draw shouldn't do the same for coordinates.

[16:08](#msg5c6ad88580df6804a1c66e02)Although, change of value referred by `:my-pos` won't trigger any reaction in Draw block itself, so this way is a bit limited than changing the coordinate directly.

moliad

[16:10](#msg5c6ad8fa604f233ab62f0f6b)@9214 I see that as a good thing ;-)

rebolek

[16:17](#msg5c6ada8ddc3f0523ccd7c392)@moliad it's possible I'm wrong, but I believe I remember such conversation.

nedzadarek

[17:16](#msg5c6ae859ef98455ea4585a6c)@moliad wouldn't it be better to have another type that doesn't have context (like, as fair I remember, symbol in @9214 explanations of words)?

[17:23](#msg5c6aea04d1e3093ab540f76f)@9214  
&gt; Although, change of value referred by `:my-pos` won't trigger any reaction in Draw block itself, so this way is a bit limited than changing the coordinate directly.

We could use reactors:

```
draw-block: [line 10x10 50x50] rea: make reactor! [my-pos: 10x10 my-pos: is [draw-block/2: my-pos]]
comment {
== make object! [
    my-pos: 10x10
]
}
draw-block ; == [line 10x10 50x50]
rea/my-pos: 20x20 ; == 20x20
draw-block ; == [line 20x20 50x50]
```

but I guess it would be overkill for some code.

moliad

[17:24](#msg5c6aea3b80df6804a1c6e8a9)no we want binding, cause its the only way to compose lists of things which have coordinates from their objects.

nedzadarek

[17:25](#msg5c6aea89750228225807fd32)^^ I see

moliad

[19:10](#msg5c6b0313604f233ab63027b0)anyone know how we can disable the auto-refresh of the windows? I want it to stay dead and only refresh when I call `'SHOW`. I can't remember how to set it up.

9214

[19:10](#msg5c6b034128c89123cbee3bad)@moliad `system/view/auto-sync?: no`.

moliad

[19:11](#msg5c6b034e16e4682259c491b8)ah... thx

greggirwin

[20:16](#msg5c6b1291ef98455ea4597d59)@dockimbel will have to say, but using get-word! syntax for unevaluated dereferencing makes sense to me.

@mikeparr, that's very cool! If you put your code in a gist or repo, I bet others will at least learn from it, if nothing else.

moliad

[22:49](#msg5c6b3681ab952d3085534789)@greggirwin I like that it visually separates keywords from values and there is no ambiguity when you look at the draw block.

[22:50](#msg5c6b36ad85b7eb4569f3cb24)(and `get-word!` are bound too, so it solves the basic issue)

9214

[22:59](#msg5c6b38b4e5eeec0d9b8b19dd)@moliad and also prevents `any-function!` from evaluation, i.e. so-called "security" issue.

moliad

[23:42](#msg5c6b42d3e5eeec0d9b8b5e70)yes it could raise an error about `function!` not being proper type like `parse` does it

## Tuesday 19th February, 2019

rebolek

[07:11](#msg5c6bac137667931e2fc5fdbd)My segment display is now available at https://gitlab.com/rebolek/red-styles/blob/master/segment7.red

[07:15](#msg5c6bad1ba7d733509d8e0734)It's not a style yet, but the usage is very simple: `segment7!/draw "12345"` will return draw block that you can use with for example `base` style. See the source for help on available settings (size and offsets). It supports numbers only right now, but if you look at the source, adding letters is really easy (with known limitations of 7-segment displays. good luck with `M`, `W`, or `Q` :smile: ).

toomasv

[07:45](#msg5c6bb4265df86a45685b926a)@rebolek :clap:

rebolek

[08:53](#msg5c6bc4161f14630421e5628d)Cool, I probably overwrote my `stylize` branch and would have to start from scratch! :dizzy\_face:

toomasv

[09:05](#msg5c6bc6bd85b7eb4569f73591)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/RAAn/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/RAAn/image.png)

rebolek

[09:06](#msg5c6bc70b9e430b30868f5ea1)@toomasv :smile:

toomasv

[09:14](#msg5c6bc9117667931e2fc6c096)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/sEHi/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/sEHi/image.png)

meijeru

[09:48](#msg5c6bd0d2c82c68509eff3cc9)On segment alphabets: Douglas R. Hofstadter experimented with those "gridfonts" in the '80s. See his book "Metamagical themas". I wrote a design program for those fonts, that also generates draw blocks. Here is a \[sample picture](https://github.com/meijeru/pictures/blob/master/SquareCurl.jpg)

rebolek

[09:58](#msg5c6bd32e1f14630421e5c3f5)@meijeru `x` reminds me of something...

9214

[10:13](#msg5c6bd6c15df86a45685c73fd)Reminds me of:  
http://www.zachtronics.com/alien-writing/

meijeru

[10:42](#msg5c6bdda4ab952d3085573d1b)@rebolek Hofstadters main concern was coherence in the design, i.e. how the style of each letter was in keeping with the rest of them. In that particular design (from section VII of his book), this is how it came out. A totally different design is \[here](https://github.com/meijeru/pictures/blob/master/Boat.jpg).

rebolek

[11:10](#msg5c6be4349e430b3086901e0d)@toomasv are you going to make a merge request with your additional letters? :)

toomasv

[11:19](#msg5c6be646a378ef11f604f9ad)@rebolek Sorry, I did just a quick and messy hack, but I can clean it and do a PR if you like it.

rebolek

[11:25](#msg5c6be7aa9e430b308690391e)I do and I believe others will too :)

toomasv

[12:05](#msg5c6bf1235df86a45685d2727)OK, but a bit later, I have to cut some trees :)

rebolek

[12:22](#msg5c6bf4fb9e430b3086909363)I understand, that's much more fun that sitting in front of computer :)

pekr

[12:40](#msg5c6bf944c776985d8f1af2b0)Maybe he talks about some new game he created using Red right this afternoon? :-)

rebolek

[12:40](#msg5c6bf95135c7a5042278c5a0):-D

rcqls

[13:49](#msg5c6c097ae5eeec0d9b9035e1)\[!\[Capture d’écran 2019-02-19 à 14.48.18.png](https://files.gitter.im/red/red/gui-branch/cx3F/thumb/Capture-d\_ecran-2019-02-19-a-14.48.18.png)](https://files.gitter.im/red/red/gui-branch/cx3F/Capture-d\_ecran-2019-02-19-a-14.48.18.png)

rebolek

[13:51](#msg5c6c09f035c7a504227938b2):clap:

rcqls

[13:52](#msg5c6c0a07a378ef11f605ef05)First version of rich-text with some imperfection… but… After trying pango attributes, I made the choice to translate to pango markup (which translates in pango attributes). It was a long run!

[13:55](#msg5c6c0ab81f14630421e73a9d)I think I could be able to directly use pango attributes but don’t know yet if this is convenient… Some other stuff need to be fixed since the baseline is not fixed automatically from now.

rebolek

[14:03](#msg5c6c0cc75df86a45685de582)@rcqls keep up to good work!

rcqls

[14:48](#msg5c6c17377667931e2fc8c998)@rebolek Thanks! Sorry for the noise (even it is related to this room) but I thought I was in the red/GTK room!

rebolek

[14:48](#msg5c6c1755c4da4a11f57f74e2)It's certainly GUI related, so not a noise.

toomasv

[16:01](#msg5c6c285f35c7a504227a1a55)@rcqls :+1: :+1:

rcqls

[16:04](#msg5c6c2901c82c68509e019223)@toomasv Thanks! BTW, do you have an example of use case of rich-text more evolved than this simple demo? I have in mind that you already made some evolved examples about rich-text.

toomasv

[16:06](#msg5c6c2973ab952d308559563b)@rcqls https://github.com/toomasv/learning/tree/master/snippets/rich-text  
and, hm, of course https://github.com/toomasv/syntax-highlighter

rcqls

[16:06](#msg5c6c298d9e430b30869204b1)@toomasv Many thanks!

toomasv

[16:06](#msg5c6c299dc82c68509e019611)You are welcome! :)

[16:09](#msg5c6c2a4385b7eb4569f9e67c)@rcqls Also examples in the end of https://doc.red-lang.org/en/rtd.html

rcqls

[16:11](#msg5c6c2ac135c7a504227a2a35)Cool! Thanks!

[18:14](#msg5c6c478a9155d45d903f871d)@toomasv What a huge amount of examples in your GitHub repo! Very interesting above all when developing red/GTK! Thanks again!

toomasv

[20:09](#msg5c6c6286b6c74f1e2e7b652d):smile:

[21:07](#msg5c6c702935c7a504227c0f91)@rebolek

\[!\[image.png](https://files.gitter.im/red/red/gui-branch/5Mfm/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/5Mfm/image.png)

[21:14](#msg5c6c71a5c82c68509e037c92)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/P66k/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/P66k/image.png)

hiiamboris

[21:25](#msg5c6c745c85b7eb4569fbe020)what's the advantage over using a font?

Respectech

[22:01](#msg5c6c7caac82c68509e03cf06)@hiiamboris I imagine you could do something more animated where segments blink in and out as it is switching the message.

hiiamboris

[23:22](#msg5c6c8fcea7d733509d942102)Are there any known efforts to implement pen input in Red or Rebol?

## Wednesday 20th February, 2019

rebolek

[06:55](#msg5c6cf9e635c7a504227f6dcd)@toomasv great! I will take a look at it and accept it.

[07:00](#msg5c6cfb19a7d733509d968af0)Done.

toomasv

[07:53](#msg5c6d078fa7d733509d96e757):+1:

rebolek

[07:55](#msg5c6d0808a378ef11f60c64ea)@hiiamboris there's none. It just looks cool ;)

But seriously, as @Respectech wrote, you can do some animated effects and the main reason why I did it is that you don't need to distribute font with your app.

meijeru

[08:08](#msg5c6d0b0b00aa630d9adfd38c)@toomasv A nice font :clap: but what grid is it based upon? I detect some "special" strokes that I don't think fit in a simple grid...

rebolek

[08:10](#msg5c6d0b755df86a45686468d5)@meijeru grid is described in comments for https://gitlab.com/rebolek/red-styles/blob/master/segment-display.red . My original grid are segments 1..7, everything else are @toomasv extesions.

toomasv

[08:11](#msg5c6d0b9e35c7a504227fdad1)@meijeru There is a grid. I tried to sketch it in the beginning of file.  
Ah, as @rebolek said..

[08:51](#msg5c6d1501c4da4a11f585e1cf)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/5NGF/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/5NGF/image.png)

rebolek

[09:12](#msg5c6d1a0685b7eb4569ffe12d)yes, why not?

gltewalt

[09:13](#msg5c6d1a3ee5eeec0d9b9723b9)New website font 😁

toomasv

[10:33](#msg5c6d2d109e430b30869890bb)@rebolek Added primitive kerning too.

rcqls

[11:11](#msg5c6d35ddc4da4a11f586bed1)@toomasv Thanks to your wonderful examples on matrix transformation, it was easier for me to extend draw for red/GTK. Now these examples work on red/GTK.

rebolek

[11:11](#msg5c6d35f11f14630421eed662)Wonderful news!

toomasv

[11:12](#msg5c6d3607e5eeec0d9b97d9e3)@rcqls Great! Congrats for good work!

rcqls

[11:14](#msg5c6d369b35c7a50422811280)Actually, it was pretty easy because cairo is powerful! I was only missing really good examples and both of you are helping me a lot.

pekr

[11:19](#msg5c6d37b235c7a50422811aae)So, soon enough, GTK version will surpass macOS one, right? :-)

rcqls

[11:22](#msg5c6d385bb6c74f1e2e80982a)@pekr Unfortunately, I don’t think so soon since there is a lot of work remaining. But we never know and it is my goal…( I am actually on macOS working with docker )

rebolek

[11:22](#msg5c6d387f9e430b308698e89c)Ideally all versions should work same.

rcqls

[11:23](#msg5c6d38bbb6c74f1e2e80999b)That’s definitely the goal since red is a killer cross-compilation tool!

[15:00](#msg5c6d6b7fab952d308561b2c0)@toomasv Weirdly, richtext-medium2 and 3 does not work on macOS and win7 in a virtualbox and works on my linux (after some nice debugging). From now, no breaking line considered yet so richtext-beginner3 does not work properly but the other richtext-beginner work as expected. Richtext-advanced work only on win7 for me. Not yet on linux but I hope so soon.

toomasv

[15:09](#msg5c6d6daa9155d45d9046def0)@rcqls Do medium-2 and -3 not work at all? Any error-msg? On W10 they are ok. `count-nl` is Window-specific.

rcqls

[15:10](#msg5c6d6dfc35c7a50422828adf)@toomasv I mean '&lt;b&gt;toto&lt;/b&gt;’ does not translate in right panel. But it works on red/gtk.

[15:14](#msg5c6d6ec5b6c74f1e2e821a7d)BTW, except if I miss something, I guess that I can’t test syntax-highlighter on linux. The binary app for macOS does not work too.

[15:15](#msg5c6d6ef9c4da4a11f5885d9e)I am testing it on win7 on my VB.

toomasv

[17:26](#msg5c6d8da9b6c74f1e2e82e86d)@rcqls I see. I'll take down the mac file.

[17:39](#msg5c6d90bec82c68509e0ad9e6)Playing with alternative object-viewer:  
\[!\[object-viewer](https://www.toomasv.red/images/make-plan.gif)](https://www.toomasv.red/images/make-plan.gif)

hiiamboris

[17:43](#msg5c6d91d7c82c68509e0adee5)@toomasv colors are type-dependent?

toomasv

[17:44](#msg5c6d91f400aa630d9ae3759a)Yes. Will include legend later. And make them adjustable.

hiiamboris

[17:45](#msg5c6d92545df86a456867f9cf)Think about adaptive radius as well ☻

toomasv

[17:46](#msg5c6d926cc82c68509e0ae2b8)Yes.

moliad

[19:10](#msg5c6da63f9155d45d904871ea)@toomasv neat

endo64

[19:57](#msg5c6db12900aa630d9ae45063)@toomasv It's cool! Would it show the value at the end? On a tooltip or something?

toomasv

[20:11](#msg5c6db461b6c74f1e2e83fc60)Thanks! @endo64 I am considering what is the best way to show values. Probably with hovering like tooltip, yes.

greggirwin

[22:08](#msg5c6dcfcfddaa310c89c390b9)So much great stuff! This is true teamwork.

[22:30](#msg5c6dd51bb6c74f1e2e84d154)Gitlab is giving me a 404 for @rebolek's segment link though.

gltewalt

[23:30](#msg5c6de2fe7667931e2fd47516)@toomasv You should watch that video on Pharo, if you haven't already.

## Thursday 21st February, 2019

toomasv

[04:07](#msg5c6e23ea85b7eb456906a238)@greggirwin This one? https://gitlab.com/rebolek/red-styles/blob/master/segment-display.red

[04:20](#msg5c6e2702c776985d8f2926c2)@gltewalt Thanks! I'm watching.

rebolek

[05:01](#msg5c6e30b3c4da4a11f58d3cf8)@greggirwin it has been renamed from segment7 to segment-display because it's no longer just seven segments :)

greggirwin

[07:58](#msg5c6e5a21b6c74f1e2e87f545)Thanks guys, I can see it now. :+1:

planetsizecpu

[09:09](#msg5c6e6ae2c4da4a11f58ea65e)Hi guys! today need some help to attach `on-time` actor to a face with `make face!` instead of normal definition mode, looking similar to this:  
`w: make face! [type: 'base size: 50x50 offset: 10x10 color: red rate: 1 ...`

I did some test without much luck as `... actors: context [on-time: func [f e][foreach-face f [if select face/actors 'on-time [face/actors/on-time face e]]]]`

But don't see how to hook `on-time` event to a bunch of \[code] on this way, I will look in documentation for some clue, so help is welcome.

rebolek

[09:21](#msg5c6e6d7fe5eeec0d9b9f9950)You are trying to run `on-time` from other `on-time`?

planetsizecpu

[09:23](#msg5c6e6df41f14630421f6c3bd)no, just have a bunch of faces, some of them (not all) need to have their own idependent `on-time`event

[09:24](#msg5c6e6e4fab952d3085682b37)the problem is I don't know the face's names at writing time, face data comes from a text file, so they need to be created after reading with `make face!`

rebolek

[09:26](#msg5c6e6ebdc4da4a11f58ebf6b)@planetsizecpu and `w/actors: context [on-time: func [f e][print "hello world"]]` doesn't work?

planetsizecpu

[09:26](#msg5c6e6ed2a378ef11f615c0e4)I will test now, wait...

rebolek

[09:27](#msg5c6e6efe7667931e2fd7c22d)It works for me. Don't forget to set `rate` for such face also.

planetsizecpu

[09:28](#msg5c6e6f2585b7eb4569087da2)YES! it works THX!

rebolek

[09:30](#msg5c6e6fbac776985d8f2af1ee)Great! :smile:

GalenIvanov

[10:13](#msg5c6e79c37667931e2fd808ef)Last week I was working on an explorer for \[L-systems](https://en.wikipedia.org/wiki/L-system). Here's the \[result](https://github.com/GalenIvanov/Graphics-Red). It's a simple project, but combines different aspects: simple parsing, drawing and GUI.  
During my experiments I had problems with appending a block to draw, when the block contains color in hex format:

rebolek

[10:15](#msg5c6e7a35a378ef11f61611ff)@GalenIvanov I've noticed same problem. I just switched to tuple colors and haven't investigated it deeply yet, but I think it can be considered a bug.

GalenIvanov

[10:16](#msg5c6e7a829155d45d904d9484)@rebolek Thanks! (I was trying to paste some test code here)

rebolek

[10:17](#msg5c6e7a9fc776985d8f2b36e1)@GalenIvanov btw, it's very nice and works great under GTK!

rcqls

[10:17](#msg5c6e7ad200aa630d9ae93205)@rebolek Good news!

GalenIvanov

[10:18](#msg5c6e7af49155d45d904d97cb)@rebolek Thank you! It's my first ever try at Red's graphics and GUI

rcqls

[10:20](#msg5c6e7b7c7667931e2fd814f6)@GalenIvanov Just tried (on Red/GTK), very nice!

rebolek

[10:24](#msg5c6e7c409e430b3086a0f0ec)@GalenIvanov That's great for a first try! My first try was a button that did nothing :smirk:

GalenIvanov

[11:12](#msg5c6e87a3a7d733509da0a0ca)@rcqls Thanks!

hiiamboris

[11:16](#msg5c6e888500aa630d9ae99199)@GalenIvanov Great!

GalenIvanov

[11:16](#msg5c6e888addaa310c89c812da)@rebolek :) Maybe I must have said "my first ever try I saved as .red file"

[11:25](#msg5c6e8aa7ab952d308568e868)@hiiamboris Thanks!

rebolek

[11:54](#msg5c6e9167c776985d8f2bdacb)@GalenIvanov instead of using `cos` and `sin` and converting degrees to radians, use `cosine` and `sine` which accept degrees directly.

[11:55](#msg5c6e91c0b6c74f1e2e896ed5)Also, instead of

```
draw-block: make block! 1000
collect/into [...] draw-block
draw-block
```

you can write just

```
collect/into [...] make block! 1000
```

[11:56](#msg5c6e91e87667931e2fd8b12b)otherwise it's very nice code

GalenIvanov

[11:57](#msg5c6e922ea378ef11f616ba91)@rebolek Thanks for your advice, it's very helpful!

toomasv

[12:02](#msg5c6e934b1f14630421f7c13c)@GalenIvanov Very nice! My earlier experiments with l-systems:  
in \[gist](https://gist.github.com/toomasv/4090e6767bf6c6e0df6544790d889cf3) and \[repo](https://github.com/toomasv/l-system/blob/master/l-system.red)

rebolek

[12:02](#msg5c6e93697667931e2fd8b8d0)Also I'm not a big fan of `do string!` so I would change

```
do rejoin ["append canvas" idx "/draw normalize-coords p 110"]
```

Into something like

```
canvas: select to word! rejoin ["canvas" idx] 'draw
append canvas normalize-coords p 110
```

But that's a matter of taste I guess.

GalenIvanov

[12:14](#msg5c6e962b1f14630421f7d39f)@toomasv Thank you! Your experiments are very nice! I'm glad that I didn't search for L-systems implementations in Red before I started coding, beause I would have most probably given up after seeing yours :)

[12:15](#msg5c6e965d7667931e2fd8c724)@rebolek You're right, that's better!

toomasv

[12:15](#msg5c6e96745df86a45686e6ab5):smile: Making these is a great way to learn!

GalenIvanov

[12:20](#msg5c6e979485b7eb45690988a7)@toomasv Yes! My next plans include mazes and Hamiltonian cycles on a grid. Then I hope I'll use some of them for making a simple game.

toomasv

[12:20](#msg5c6e97a81f14630421f7dca6):+1:

moliad

[13:07](#msg5c6ea29eab952d3085698ea3)@GalenIvanov wow haven't heard about L-Systems for 20 years... :smile: I used to work with them in the houdini 3D application which implements them as a native polygon type, you just feed it the grammar and it generates the 3d models for you .

GalenIvanov

[13:10](#msg5c6ea352b6c74f1e2e89e681)@moliad :thumbsup:

toomasv

[17:34](#msg5c6ee1215df86a4568708947)Few steps forward:  
1\. Legend  
2\. Panning  
3\. Change of diameter  
4\. Immediate values display  
5\. Looks into maps and blocks too

\[!\[Red-viewer](https://toomasv.red/images/Red-viewer/make-plan2.gif)](https://toomasv.red/images/Red-viewer/make-plan2.gif)

I'm not yet sure how to represent funcs.

rcqls

[17:35](#msg5c6ee16b00aa630d9aec144e)@toomasv Wow! Hope it would run on Linux!

rebolek

[17:35](#msg5c6ee1701f14630421fa0285)In 3D :P

toomasv

[17:48](#msg5c6ee46a1f14630421fa17de)@rcqls I am sure you are not far from realizing it!

rcqls

[18:23](#msg5c6eeca5ab952d30856b9f81)@toomasv Is the code of this wonderful show freely accessible?

toomasv

[18:24](#msg5c6eeceec4da4a11f59243b9)@rcqls Not yet. There are some important omissions and some annoying bugs. I hope to strighten this up in few days.

rcqls

[18:26](#msg5c6eed3ee5eeec0d9ba329d8)@toomasv Have a good fight against these annoying bugs! Good luck!

toomasv

[18:26](#msg5c6eed49c82c68509e13b9d4)Thanks!

greggirwin

[20:07](#msg5c6f050fa7d733509da4077e)@GalenIvanov, \*really nice* indeed. We should add this to the showcase repo.

[20:09](#msg5c6f0579e5eeec0d9ba3d024)Including the clickable examples is fantastic, and they look great.

[20:14](#msg5c6f06beb6c74f1e2e8cb7e4)@toomasv, more great progress. Maybe add an up-arrow to the center/parent box, so you can click that to go back up a level? If that affordance works in general, you could add a `?` to functions, to click for info.

toomasv

[20:22](#msg5c6f0871a7d733509da42088)@greggirwin Thanks, I will consider these!

greggirwin

[20:22](#msg5c6f0878b6c74f1e2e8cc19f)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/gf3I/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/gf3I/image.png)

[20:27](#msg5c6f09c0ddaa310c89cba653)Now I'm going to plant another seed. ;^) One of the hardest problems when developing software, especially learning new systems and other people's code, is getting the structure and relations in your head. This is a mix of static cross referencing, dynamic configurations (e.g. Dependency Injection came up recently), data structures, and runtime behavior. Your various experiments are all parts of that big picture.

This is also where Smalltalk and systems like it are a win for experts. With a living image that you can explore, you can poke around and watch things work, see what effect changes have, or what they depend on. A good visual cross reference/networking diagram can also show, at a glance, whether a system is tightly bound or loosely coupled.

[20:29](#msg5c6f0a1fb6c74f1e2e8cccee)For those newer to Red, the small image above came from this:

```
view compose [
	space 0x0
	across
	base pink 100x20 "system/catalog" base (pink + 16.16.16) 20x20 "↑"
	return
	pad 0x20
	base orange 100x20 "append" base (orange + 16.16.16) 20x20 "?"
]
```

While you can use an image editing program, many of us find that Red makes generating things like this really easy.

Respectech

[23:30](#msg5c6f3482c776985d8f30812b)@greggirwin Yes, I used to use VID quite often to create logos and other images from scratch. I found it had much finer control and made it easier to experiment with ideas.

## Friday 22nd February, 2019

GalenIvanov

[07:33](#msg5c6fa5c6c776985d8f332289)@greggirwin Thank you! I'll be happy to inspire others to use the fantastic Red language!

toomasv

[16:03](#msg5c701d6ce5eeec0d9bab33b5)@greggirwin Thanks for another seed! Let's hope it gets rooted. :smile:

planetsizecpu

[18:33](#msg5c704068c82c68509e1cafd1)Have you played this 80's arcade game? it was \*\*Cave-In\** , it is a mockup, but I'm really enjoying doing this experiment, we'll see if I get something acceptable, for the moment I see how fast Red is running, I had to put some delay in the movement of the lifts and the kart, this allows me to see that their movement in individual loops is not correct, they do not move until the kart does not finish its loop, ideally they would move in unison, in parallel. I have to keep experimenting :-)

[18:34](#msg5c704098c776985d8f374246)\[!\[cavetest1.gif](https://files.gitter.im/red/red/gui-branch/LIox/thumb/cavetest1.gif)](https://files.gitter.im/red/red/gui-branch/LIox/cavetest1.gif)

hiiamboris

[19:08](#msg5c7048ba9e430b3086ad4351)@planetsizecpu Try doing your events on timer (rate 67+), while keeping other event actors light. Or better, in your own always-running event loop.

planetsizecpu

[19:20](#msg5c704b73b6c74f1e2e954668)@hiiamboris Will see, this is only part of the game background, each lift &amp; cart has his own timer event &amp; rate, it is not hard coded but file-driven, in a per-level basis, this is how the config file looks for this first level:

[19:20](#msg5c704b7a1f1463042103a79f)\[!\[level01.png](https://files.gitter.im/red/red/gui-branch/jwKJ/thumb/level01.png)](https://files.gitter.im/red/red/gui-branch/jwKJ/level01.png)

[20:52](#msg5c706107ddaa310c89d4f9f5)I meant the rate is set by delay field.

hiiamboris

[21:29](#msg5c7069d1c776985d8f384e8c)Yeah I see ☻

## Saturday 23th February, 2019

Rebol2Red

[00:13](#msg5c70901c5df86a45687be521)

```
view [
	button font-size 20 "cancel"
	button font-size 20 "change"
	button font-size 20 "delete"
]
```

Order of buttons in view is: delete change cancel  
Is this related to issue #2937?

hiiamboris

[00:26](#msg5c709351a378ef11f6248fa8)I vaguely recall smth about different platforms having different buttons order and Red trying to follow the platform standards.

Respectech

[01:41](#msg5c70a4ce9e430b3086af7dee)@hiiamboris Yes, Mac and Windows have different default orders for "OK" and "Cancel", or something like that.

hiiamboris

[18:30](#msg5c71914085b7eb45691cfe8a)Is anybody aware of the status of the whole `aux-down`/`aux-up` View events situation? Currently `on-aux-down` event is never triggered (it's not even in R/S code).  
But the bigger problem is what kind of mouse button is aux button? Most gaming mice have at least 5 buttons today, last two being very handy as forward/backward or undo/redo. That is, regardless of which one is chosen as "aux", it won't be of any use alone.  
Is there a plan for `alt-aux-down`/`alt-aux-up` or smth like that?

[18:38](#msg5c7193169e430b3086b52083)@qtxie maybe you?

rebolek

[20:33](#msg5c71ae071f146304210c4a2b)IIRC it's reserved for touch screens?

## Sunday 24th February, 2019

qtxie

[02:32](#msg5c720225c82c68509e2761d8)@hiiamboris I think those two events inherit from Rebol. I'll check how rebol handle it. Maybe use `event/picked` to indicate which button is pressed.

planetsizecpu

[08:23](#msg5c725480b6c74f1e2ea16833)I modifyed the config file, now the moving objects can be initially located in any of their stop points, that permits lifters go in different directions. I also made changes in code to delete all objects `on-time` actors, by setting only one attached to the main cave `panel`, so the behavior si sightly light, but the movements still sequential, more fun coding in progress next week :-)

[08:23](#msg5c72548b9155d45d9066087f)\[!\[cavetest2.gif](https://files.gitter.im/red/red/gui-branch/0KOh/thumb/cavetest2.gif)](https://files.gitter.im/red/red/gui-branch/0KOh/cavetest2.gif)

[08:38](#msg5c7257f7a7d733509db90c53)Now with an exaggerated delay you can see how the movement is sequential

[08:38](#msg5c7258195df86a45688652f0)\[!\[cavetest3.gif](https://files.gitter.im/red/red/gui-branch/BKk5/thumb/cavetest3.gif)](https://files.gitter.im/red/red/gui-branch/BKk5/cavetest3.gif)

hiiamboris

[11:29](#msg5c728014a378ef11f63004f1)@qtxie just to mention, there's a point to consider... if `event/picked` will be the way to distinguish buttons 4 and 5, it's fine with `on-aux-down` event actor. But `event/flags` (e.g. with `on-over` event) will be a bit limited: it will tell you (if it contains the `aux-down?` flag) that either button 4 is down (current behavior) or that at least one of 4 or 5 is down (possible alternative), but no more than that.

toomasv

[17:05](#msg5c72ceedc776985d8f46b053)@planetsizecpu Nice exercise!

hiiamboris

[17:28](#msg5c72d4509e430b3086bc9780)Is there no way to know the scroll offset of a text-list?

gltewalt

[19:34](#msg5c72f1afb6c74f1e2ea545e4)What do you mean by scroll offset?

toomasv

[19:36](#msg5c72f231ddaa310c89e46bfa)@hiiamboris I can't get it either. Even if custom scroller is created, the native one overtakes the control.

hiiamboris

[20:14](#msg5c72fb0eddaa310c89e4aa8b)@gltewalt I mean if you scroll the list down, you have no way to know where you are. Black box...

[20:14](#msg5c72fb31ab952d3085852db7)@toomasv ok thanks for attempting to work around it ☻

## Monday 25th February, 2019

planetsizecpu

[07:36](#msg5c739b18a378ef11f636e164)@toomasv Thx yours as well

greggirwin

[23:24](#msg5c74791b7f20ac599cc77d32)@planetsizecpu, nice!

[23:29](#msg5c747a4a66e2b3118b1a410e)@Rebol2Red, check out the Cross-Platform GUI Metrics section in https://www.red-lang.org/2017/07/063-macos-gui-backend.html, and also the rules in `system/view/VID/GUI-rules`. You can set `probe system/view/vid/GUI-rules/active?: no` to turn off the processing.

## Tuesday 26th February, 2019

planetsizecpu

[08:58](#msg5c74ffc7d44b746ebf476b6d)@greggirwin Thx, Today works go in design direction, arrange people in different positions and test, but the hard job coming is movement, especially the movement with AI, I don't know at this moment where will this take me.

[09:00](#msg5c75001947276019e97f1f9d)\[!\[cavetest4.gif](https://files.gitter.im/red/red/gui-branch/RnzC/thumb/cavetest4.gif)](https://files.gitter.im/red/red/gui-branch/RnzC/cavetest4.gif)

greggirwin

[19:52](#msg5c7598e22ca5ec5474450254)&gt; I don't know at this moment where will this take me.

That's part of the fun. :^)

## Friday 1st March, 2019

planetsizecpu

[09:40](#msg5c78fe16d2d62067b726017d)Now moving objects go free in their way, just have to set a timing for stops to allow people jump on. As the Z order matters, I have to design each object with all the people who can use it, pointing to the right and left sides. So loaded elevators have different `image` than empty ones :-) Just wonder the speed Red is processing `offset` of moving faces even in interpreted mode. Here is a 20fps example.

[09:41](#msg5c78fe44e1446a6ebe644fca)\[!\[cavetest4.gif](https://files.gitter.im/red/red/gui-branch/65is/thumb/cavetest4.gif)](https://files.gitter.im/red/red/gui-branch/65is/cavetest4.gif)

Respectech

[22:48](#msg5c79b6da212d0c1e1ab9c17a)Nice job!

## Saturday 2nd March, 2019

toomasv

[04:21](#msg5c7a04d947276019e9a03efd)@planetsizecpu Great! Keep caveing!

dander

[08:34](#msg5c7a40164a65f754734edd25) @planetsizecpu It's fun to see progressions like this. Thanks for sharing it!

planetsizecpu

[10:42](#msg5c7a5e02212d0c1e1abd8060)@respetech @toomasv @dander Thx! I'm enjoying and learning a lot while I'm in the cave, I still remember many aspects of the arcade game, including the melody and the different sounds, I would like a dialect in the style of the old MSX Basic language `play abcd ...`, does anyone remember it? knowing the potential of Red to create new dialects ... well everything in its time :-)

toomasv

[11:55](#msg5c7a6f4953efa912039e3825)@rcqls :point\_up: \[February 21, 2019 8:23 PM](https://gitter.im/red/red/gui-branch?at=5c6eeca5ab952d30856b9f81) \[explorer](https://github.com/toomasv/explorer)

rcqls

[12:00](#msg5c7a707b8a7def0752ff026a)Thanks @toomasv… Just a slight pb: where to find ../utils/info.red ? Oh maybe in the repo utils if it exists… I’ll check...

toomasv

[12:03](#msg5c7a7103de3a6e64c0c8d5a2)@rcqls Uh, sorry. It is same as in syntax-highlighter: \[info.red](https://raw.githubusercontent.com/toomasv/syntax-highlighter/master/info.red)

rcqls

[12:03](#msg5c7a711965ffa019ea751e87)@toomasv Thanks!

[12:15](#msg5c7a73e3cbebcf784a2941ed)@toomasv Oups! Trying to run it… on macOS and Linux. Nothing happens if I do `red explorer.red system` and if try to compile it:

```
-=== Red Compiler 0.6.4 ===-

Compiling /Users/rcqls/tmp/RedTest/Toosmas/explorer/explorer.red ...
*** Compilation Error: undefined word face!
*** in file: /Users/rcqls/tmp/RedTest/Toosmas/explorer/explorer.red
*** near: [face! [type: 'text]
    words: copy []
    selected: copy []
]
```

[12:20](#msg5c7a750dc1cab53d6f627902)`Needs: View` was missing but I guess you don’t have to compile it since:

```
Compiling /Users/rcqls/tmp/RedTest/Toosmas/explorer/explorer.red ...
*** Compilation Error: undefined word help-string
*** in file: /Users/rcqls/tmp/RedTest/Toosmas/explorer/explorer.red
*** near: [help-string tuple! 2
    print-props: func [wh] [
        print ["Properties of" form type? wh ":"]
        foreach prop exclude switch type?/word wh [
            event! [system/catalog/accessors/event!]
            object! [words-of wh]
        ] [window face parent on-change* on-deep-change*] [
            print [prop ":" mold wh/:prop]
        ]
    ]
    edit-options:
]
```

toomasv

[12:36](#msg5c7a78d34a65f754735044bc)@rcqls Yes, so far I used it in gui-console only. It is not prepared for compiling.

rcqls

[12:38](#msg5c7a795135c0130753621924)@toomasv So how to use it even in console? In your website you say: `explorer system` but I don’t have `explorer` object after doing `do %explorer.red`?

toomasv

[12:42](#msg5c7a7a48e8ea1437379d516b)@rcqls It is `explore system`

rcqls

[12:45](#msg5c7a7af84a65f7547350547f)@toomasv Thanks! How silly am I! Works on macOS (mostly) and needs debug on Linux! As usual it is really beautiful!

toomasv

[12:49](#msg5c7a7bdac1cab53d6f62a55b)I'm glad it works, even if partially!

rcqls

[12:53](#msg5c7a7ce1cbebcf784a298734)I would say `red` and `pink` labels works but for the other labels there some errors (see the output if it could help you):

```
>> explore system
*** Script Error: select does not allow logic! for its series argument
*** Where: select
*** Stack: explore view do-events do-actor do-safe
>> explore system
*** Syntax Error: invalid character in: {"Return a word identifying the operating system"}
*** Where: to
*** Stack: explore view do-events do-actor do-safe to-word
```

toomasv

[13:03](#msg5c7a7f0bcbebcf784a2995ba)@rcqls Thanks, I'll look at a usual suspect.

rcqls

[13:12](#msg5c7a812ab1503b3d7069ffe2)@toomasv Better news! It works also on Linux exceot that I maybe need add `recycle/off`… It is far from perfect but it does not come from your side. There is no label and I know what I have to do…

[13:12](#msg5c7a814535c0130753624f09)\[!\[Capture d’écran 2019-03-02 à 14.11.20.png](https://files.gitter.im/red/red/gui-branch/frLJ/thumb/Capture-d\_ecran-2019-03-02-a-14.11.20.png)](https://files.gitter.im/red/red/gui-branch/frLJ/Capture-d\_ecran-2019-03-02-a-14.11.20.png)

toomasv

[13:16](#msg5c7a821465ffa019ea7587f5):clap:

[15:52](#msg5c7aa6b30966d912040f57ac)@rcqls I renamed file into `explore.red` and now it also compiles on W10, provided you have `%../../red-latest/red-master/environment/console/help.red`.

Here it can be invoked as `explore` when compiled (&lt;struct&gt; is optional. If not provided, `system` will be explored).

It can also be called as `red explore.red` from command-line. If &lt;struct&gt; is not provided, a console should open with `explore.red` loaded.

And finally it can be called from console or terminal after `do %explore.red` as `explore`. Also I put an input field into left upper corner, where new structs can be input without closing window.

rcqls

[16:20](#msg5c7aad390966d912040f84d9)@toomasv Excellent! The compiled version seems to work perfectly on macOS: all the labels work now. Only none box generates an error but now it is not blocking. On linux same as before except that it seems that also even if error occurs it is not blocking. Great job @toomasv the red artist !

[16:23](#msg5c7aae1ede3a6e64c0ca53fb)The `words` box is funny because of the huge numbers of leafs...

toomasv

[16:31](#msg5c7aafdf0966d912040f91fc):smile: yes, I have to think how to limit number of shown items for `words`, and how to “scroll” limited items.

rcqls

[16:44](#msg5c7ab2d6e8ea1437379ebe8b)Yep! It would be a great problem for you to find out how to show all the items when the number is really large. I would say that you could have more than one radius to propagate the items and place everything in a scrolled window to travel on it. Really amazing tool! Also every tools you proposed help me to see new issue on red/GTK: At the beginning the black panel shows on all the width of the window and when I first click on the theme menu, everything becomes fine. I have to think about it...

Oldes

[19:35](#msg5c7adb1be1446a6ebe706568)@qtxie as Red is linked with \[UXTheme.dll](https://github.com/red/red/blob/202bfb031a4e7f2ffe8c25d7f1e273f06c825144/modules/view/backends/windows/win32.reds#L2820-L2839), do I understand it well, that it needs at least Windows Vista?

pekr

[19:41](#msg5c7adc754a65f7547352edd5) Most probably so, IIRC Red is no more Win XP compliant ....

Oldes

[20:03](#msg5c7ae19d53efa91203a14116)Ok. No problem:)

[20:19](#msg5c7ae5668a7def0752021620)@pekr Although it probably means, that Windows 2000 are also out, or where the Vista stands?

pekr

[21:39](#msg5c7af8294a65f7547353a232)It was 2000, XP, Vista, 7, 8, 10?

## Sunday 3th March, 2019

pekr

[09:59](#msg5c7ba5648a7def075206812f)Just a general question of uneducated :-) Quite often I can see that turning off a GC helps the case. Does it mean there are possibly still some memory leaks / bugs in GC implementation?

hiiamboris

[11:30](#msg5c7bbac08a7def0752070f3a)I was stress-testing GC a lot on my W7. And I have gui console and code explorer running on for weeks of uptime with no problem. But I've also experienced GC-related crashes when code explorer starts and it's file size + pathname length is withing some tight limits. And a lot of crashing on W8+. Couldn't find the source of that so far.

My guess is that some memory bugs are there somewhere in W8+ GUI code, and those bugs have a bad effect on GC operation.

## Tuesday 5th March, 2019

planetsizecpu

[13:50](#msg5c7e7ea347276019e9bcdce8)Today I spent a while to the movement of the thief, but with each new advance appear new problems to solve, for example is the gravitational effect in the holes and the walls effect, I thought to solve it by checking the content of the pixels in the coordinates below the feet and on both sides of the people, but I have not found a VID function to do it, IMO will have to wait. What I have managed to do is to control when two objects overlap, with `overlap?` maybe I could put black objects in the holes and check when someone touches them for the gravity effect, and also is the transparency effect on moving objects, wow! we will see!

[13:53](#msg5c7e7f4847276019e9bce33e)\[!\[cavetest5.gif](https://files.gitter.im/red/red/gui-branch/uLqe/thumb/cavetest5.gif)](https://files.gitter.im/red/red/gui-branch/uLqe/cavetest5.gif)

hiiamboris

[13:57](#msg5c7e806153efa91203b8abff)@planetsizecpu you can `to-image` your base face and check the pixels on it

planetsizecpu

[14:00](#msg5c7e8109e1446a6ebe87ee1a)@hiiamboris mmm, it is an approach I will investigate it when have time, but may have tons of data... well, will see Thx.

endo64

[15:41](#msg5c7e98bb65ffa019ea901eba)I think, it could be easier to use some map and/or math, instead of checking pixel perfect collision.

[15:45](#msg5c7e99834a65f754736b39ab)A simple technique is check rectangular boundaries first and if overlaps then check pixel perfect collision for players and objects.

planetsizecpu

[16:41](#msg5c7ea6b753efa91203b9c052)@endo64 Thx, it could be for now, but I wonder the easyest \[way](https://www.msx.org/wiki/POINT) I know :) IIRC it had a slow execution.

rebolek

[16:44](#msg5c7ea763e8ea143737b847b0)Pixel-perfect collision detection is easy with masks. Have a bw bitmap of background and bw bitmap of sprite at right position. Do AND and if result is &gt; 0, then you have collision.

planetsizecpu

[16:53](#msg5c7ea98fe8ea143737b858e9)Ah, I was reading some similar for get transparent bitmaps but using XOR instead AND

rebolek

[18:40](#msg5c7ec2ab4a65f754736c71d7)AND will give you zeroes unless there is 1 on both sides and XOR will give you zero if both sides are same. So basically transparency in case of XOR, yes.

## Wednesday 6th March, 2019

greggirwin

[00:07](#msg5c7f0f2e86e34a126f92a7be)@planetsizecpu here is some \*really* old experimental R2 code for a BASIC PLAY dialect:

```
REBOL []

; beep & sound stuff
lib: load/library %kernel32.dll
beep: make routine! [
	frequency [integer!]
	duration  [integer!]
	return:   [integer!]
] lib "Beep"

notes:  ["C" "C#" "D" "D#" "E" "F" "F#" "G" "G#" "A" "A#" "B"]
A440:   440
base-note: find notes "A"
base-octave: 4

play-note: func [note sharp octave duration /local base-A op steps] [
    ;print [note sharp octave duration]
    steps: offset? base-note find notes join note either sharp ["#"][""]
    if zero? octave [ocatve: base-octave]
    base-A: 2 ** (octave - base-octave) * A440
    freq: base-A
    if not zero? steps [
        op: either negative? steps [:divide][:multiply]
        loop absolute steps [freq: op freq 1.059463]    ; 1.059463^12 = 2
    ]
    ;print [base-A steps freq]
    beep freq either duration > 0 [duration] [250]
]

any-note: charset "ABCDEFG"
sharp-note: charset "ACDFG"
non-sharp-note: charset "BE"
octave-num: charset "12345678"
digit: charset "0123456789"
rule: [
    some [
        ;[ copy note sharp-note [#"#" (sharp: true) | "" (sharp: false)]
        [ copy note sharp-note (sharp: false) opt [#"#" (sharp: true)]
        | copy note non-sharp-note (sharp: false)]
        opt [copy octave octave-num]
        opt [copy duration some digit] (
            ; Now we have all the data to play a note.
            play-note note sharp
                to integer! trim octave
                to integer! trim duration
        )
    ]
]

play: func [input] [parse input rule]

play "C4 250 C4 250 C4 250 G#3 1000" 
wait .5
play "A#3 250 A#3 250 A#3 250 G3 1000" 

;parse "C1 250 D4 F4 E4 D4 G2 G2 G4 G4 E4 F4 D2 D2 D4 F4 E4 D4 C4 C4 B4 A4 G4 F4 E4 D4 C1" rule
;parse "D4 250 F4 E4 D4 G2 G2 G4 A4 E4 F4 D2 D2 D4 F4 E4 F4 C4 G4 D4 E4 C2" rule

;parse "A1 500 A#1 1000 B1 1500 C#3 2000" rule
;parse "C1 0 C#1 0 D1 0 B7 0 C8 0" rule
;parse "A3 500 A4 500 A5 500 A6 500" rule
```

Respectech

[00:14](#msg5c7f1102bf7990126e56f3bc)The example seems to be the beginning to Beethoven's 5th. :-)

greggirwin

[00:16](#msg5c7f1154c8e5bc5162f29ce1)It's a classic.

planetsizecpu

[12:03](#msg5c7fb6ffbf7990126e5b2342)@greggirwin Thx I'll save it for test when time permits.

toomasv

[12:25](#msg5c7fbc39d1e7281f09e45d0e)@greggirwin \[Ported](https://gist.github.com/toomasv/5a80b6c82a99c974076b8d88a2d722a8)

```
play {
	B4 500 B4 500 C5 500 D#5 500 
	D#5 500 C5 500 B4 500 A4 500 
	G4 500 G4 500 A4 500 B4 500 
	B4 750 A4 250 A4 1000
	B4 500 B4 500 C5 500 D#5 500
	D#5 500 C5 500 B4 500 A4 500
	G4 500 G4 500 A4 500 B4 500
	A4 750 G4 250 G4 1000
}
```

planetsizecpu

[12:27](#msg5c7fbc94b4b6ef7bc86585c9)@toomasv ohh great!!! thx  
What a wonderful community!

toomasv

[12:28](#msg5c7fbcebe527821f0a12bf79):smile:

hiiamboris

[12:31](#msg5c7fbd86e527821f0a12c55c)@toomasv great! :D  
too bad this Beep function makes a pause between notes though

toomasv

[12:35](#msg5c7fbe76f895944c084d3247)@hiiamboris Yeah.

[12:44](#msg5c7fc0a6c8e5bc5162f73250)Ode to (Red-)Joy:

```
play {
	B4 500 B4 500 C5 500 D#5 500 
	D#5 500 C5 500 B4 500 A4 500 
	G4 500 G4 500 A4 500 B4 500 
	B4 750 A4 250 A4 1000
	B4 500 B4 500 C5 500 D#5 500
	D#5 500 C5 500 B4 500 A4 500
	G4 500 G4 500 A4 500 B4 500
	A4 750 G4 250 G4 1000
	A4 500 A4 500 B4 500 G4 500 
	A4 500 B4 250 C5 250 B4 500 G4 500
	A4 500 B4 250 C5 250 B4 500 A4 500
	G4 500 A4 500 D4 1000 
	B4 500 B4 500 C5 500 D#5 500
	D#5 500 C5 500 B4 500 A4 500
	G4 500 G4 500 A4 500 B4 500
	A4 705 G4 250 G4 1000
}
```

Respectech

[19:50](#msg5c8024891c597e5db694b1ef)Great job! However, the D# should just be D:

```
play {
B4 B4 C5 D5 
D5 C5 B4 A4 
G4 G4 A4 B4 
B4 1.5 A4 .5 A4 2
B4 B4 C5 D5 
D5 C5 B4 A4 
G4 G4 A4 B4 
A4 1.5 G4 .5 G4 2
A4 A4 B4 G4 
A4 B4 .5 C5 .5 B4 G4 
A4 B4 .5 C5 .5 B4 A4 
G4 A4 D4 2 
B4 B4 C5 D5 
D5 C5 B4 A4 
G4 G4 A4 B4 
A4 1.5 G4 .5 G4 2
}
```

greggirwin

[20:00](#msg5c8026e0c8e5bc5162fa3e11)Thanks @toomasv (a.k.a. Porter ;^)!

toomasv

[20:25](#msg5c802cb8bf7990126e5e94fe)@Respectech Thanks! @greggirwin :smile:

## Friday 8th March, 2019

Oldes

[12:33](#msg5c826117b4b6ef7bc8772be1)Should not clicking anywhere outside `area`, `field` or other widgets lose focus from these? Now when I create `area`, type something into it and then click outside, the `area` is still receiving key events.

hiiamboris

[12:45](#msg5c8263e60a6b915163f67dbc)@Oldes https://github.com/red/red/issues/1869

Oldes

[12:56](#msg5c8266650a6b915163f69068)Thanks... commented it there.

## Saturday 9th March, 2019

toomasv

[15:36](#msg5c83dd94f895944c08685cff)@rcqls IIRC you were unhappy that `rtd-layout` didn't have option for width setting. I tried to write a \[wrapper](https://gist.github.com/toomasv/b2719d0635ed965ae22068ad1ecb6536) that let's you do this, but to my great surprise a syntax compiler came out of it that takes in a simplified high-level syntax string and spits out a syntax block for `rtd-layout`, or rich-text face itself, letting you also determine its width.

Syntax is minimalistic

1\. Tag starts with `\` and is followed by  
A) single-letter from \[i b s u] (e.g `\i`, `\b`), or  
B) by block containing either:  
1\) single letter from \[i b s u] (e.g. `\[i]`)  
2\) color-word or tuple (e.g. `\[red]`)  
3\) combinations of the above (e.g. `\[i b red]`)  
4\) `bg` with color-word or tuple (e.g. `\[bg blue]`)  
5\) `f` (or `font`) with integer! font-size and/or string! font-name (e.g. `\[f 16]`, `\[font "Courier New"]`, `\[f "Times" 24]`)

2\. Tag may be placed:  
A) immediately before a letter (e.g. `"\bHello!"`, `"Hello\[b red]!"`). In this case its scope is the letter.  
\[!\[image.png](https://files.gitter.im/red/red/gui-branch/xm30/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/xm30/image.png)  
\[!\[image.png](https://files.gitter.im/red/red/gui-branch/B4XH/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/B4XH/image.png)  
B) one space before the word (e.g. `"\[red] Hello!"`). Scope is word.  
\[!\[image.png](https://files.gitter.im/red/red/gui-branch/G5Pm/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/G5Pm/image.png)  
C) two spaces before the word or letter for arbitary scope. This must be closed with backslash + space `\` (e.g. `"Supercali\[b] fragilistic\ expialidocious"`)  
\[!\[image.png](https://files.gitter.im/red/red/gui-branch/g1vR/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/g1vR/image.png)

3\. Tags can be nested (e.g. `"\[f 24] \[red] The \[b i] Journey Begins\b!\ \ "`), but this is buggy, can be conflicts.  
A)  
\[!\[image.png](https://files.gitter.im/red/red/gui-branch/IbeW/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/IbeW/image.png)  
B)  
For word-scope tags you have to ensure there is a space after word, otherwise it can't determine where to close tag. (e.g. `"\[f 24] \i Hello \[red] Red \b world! \ \ "`)  
\[!\[image.png](https://files.gitter.im/red/red/gui-branch/24fc/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/24fc/image.png)

That's it!

planetsizecpu

[15:41](#msg5c83dea6bf7990126e769d8b)Good job @toomasv  
Today's own work go in gravity direction, that is down! but just as the effect of gravity matters, so does the upward thrust of the terrain, now the boy gets semi-buried on the slopes :-) I'm having a lot of fun doing that!

[15:42](#msg5c83def70a6b915163000a52)\[!\[cavetest6.gif](https://files.gitter.im/red/red/gui-branch/TFov/thumb/cavetest6.gif)](https://files.gitter.im/red/red/gui-branch/TFov/cavetest6.gif)

toomasv

[15:43](#msg5c83df2cd1e7281f09ff46f5)@planetsizecpu Congrats! :clap:

planetsizecpu

[15:44](#msg5c83df790a6b915163000c71)Thx @toomasv we are a good team this community!

toomasv

[15:46](#msg5c83dfd3293ac75db57c468e):+1:

rcqls

[16:59](#msg5c83f0f5c8e5bc5162131a9d)@toomasv Congrats, this seems very promising. Need to try it on Red/GTK. I tell you soon.

toomasv

[17:22](#msg5c83f64cb4b6ef7bc8815dee)@rcqls Thanks! If you notice bugs, I'd appriciate reports.

endo64

[19:07](#msg5c840f02e527821f0a2f3f17)@planetsizecpu Cute! :)

rcqls

[20:22](#msg5c8420763162ec7bc746b0d6)@toomasv Could you please provide the full code of your examples (but only if it is quick for you)? I first gave a try for the fourth exaple and I don’t have the same result on macOS and Linux. So not sure whether I don’t make a mistake

toomasv

[20:43](#msg5c84256bd1e7281f09011aea)@rcqls Fourth:

```
do %rtd-simple.red
view compose/deep [
    rich-text 400x150 draw [
        text 50x30 (rtd-simple/width "\[f 24]  Supercali\[b]  fragilistic-\ ^/expialidocious\ " 300)
    ]
]
```

Ha! It seems gitter ate double spaces in previous examples!

[20:47](#msg5c84264f1fae6423ca5b8b99)Fifth:

```
view compose/deep [
    rich-text 400x150 draw [
        text 50x50 (rtd-simple/width "\[f 24]  \[red]  The \[b i] Journey begins\b!\ \ " 300)
    ]
]
```

[20:48](#msg5c8426ba1fae6423ca5b8dae)Sixth:

```
view compose/deep [
    rich-text 400x150 draw [
        text 50x50 (rtd-simple/width "\[f 24]  \i  Hello \[red] Red \b world! \ \ " 300)
    ]
]
```

rcqls

[20:49](#msg5c8426e8f895944c086a380c)@toomasv Thanks! The result on macOS and linux respectively

[20:50](#msg5c842706d3b35423cb910c5a)\[!\[Capture d’écran 2019-03-09 à 21.49.10.png](https://files.gitter.im/red/red/gui-branch/yQEM/thumb/Capture-d\_ecran-2019-03-09-a-21.49.10.png)](https://files.gitter.im/red/red/gui-branch/yQEM/Capture-d\_ecran-2019-03-09-a-21.49.10.png)

[20:50](#msg5c84270db4b6ef7bc88293c6)\[!\[Capture d’écran 2019-03-09 à 21.49.23.png](https://files.gitter.im/red/red/gui-branch/qHdX/thumb/Capture-d\_ecran-2019-03-09-a-21.49.23.png)](https://files.gitter.im/red/red/gui-branch/qHdX/Capture-d\_ecran-2019-03-09-a-21.49.23.png)

toomasv

[20:51](#msg5c84273c86e34a126fb472da)Does changing width in `rtd-simple` correct it?

[20:51](#msg5c842746d1e7281f0901251b)Otherwise great!

[20:51](#msg5c842768c8e5bc51621482dd)MacOS doesn't like bold?

rcqls

[20:51](#msg5c84276dc8e5bc5162148350)It seems that there is a trouble with macOS about the bold...

[20:53](#msg5c8427b7d1e7281f0901284a)on linux, I did not find the right font or there is something wrong in the code of rich-text!

toomasv

[20:54](#msg5c8428143162ec7bc746e3ca)Which font does it use? How does it react on changing e.g. `\[f 18]`

rcqls

[20:55](#msg5c8428490a6b91516301e914)changing size to 350

[20:57](#msg5c8428a5ac408e1192323624)\[!\[Capture d’écran 2019-03-09 à 21.56.45.png](https://files.gitter.im/red/red/gui-branch/dDCk/thumb/Capture-d\_ecran-2019-03-09-a-21.56.45.png)](https://files.gitter.im/red/red/gui-branch/dDCk/Capture-d\_ecran-2019-03-09-a-21.56.45.png)

toomasv

[20:57](#msg5c8428c2d1e7281f09012eba):+1:

rcqls

[20:58](#msg5c8428fd1c597e5db6aee08a)`\{f 18]` works too! Congrats!

toomasv

[20:58](#msg5c8429071c597e5db6aee0e7):clap:

rcqls

[21:00](#msg5c8429710a6b91516301ef83)@toomasv It is only your job! (BTW, what are shortcuts for emojis on Gitter?)

toomasv

[21:01](#msg5c8429a9f895944c086a46de)If I need some uncommon ones, I look 'em up \[here](https://www.webfx.com/tools/emoji-cheat-sheet/)

rcqls

[21:02](#msg5c8429d6d3b35423cb911f4b)Ok! So no direct shortcuts on Gitter! Thanks!

toomasv

[21:03](#msg5c842a141c597e5db6aee81a)Not that I know of :flushed:

rcqls

[21:04](#msg5c842a701fae6423ca5ba280):laughing: :clap:

toomasv

[21:08](#msg5c842b341c597e5db6aeee23)BTW My job was easy - just a little string manipulation. But you have taught linuxt to interpret it! This is great job!

rcqls

[21:13](#msg5c842c8fd1e7281f09014a69)simple manipulation but with plenty of great idea about scope…My first feeling is also that I like the syntax...

[21:17](#msg5c842d80bf7990126e789fb1)Fifth and sixth examples work too on linux (and weirdly not on macOS about the bold)!

Phryxe

[21:54](#msg5c8435f825e4e24c07421cc7)If you write `:wa` e.g. you will get a popup with emojis like `:walking:` etc :walking:

## Sunday 10th March, 2019

rcqls

[01:12](#msg5c84647cf895944c086bac47)Thanks @Phryxe

toomasv

[17:16](#msg5c8546698f294b134a1d6f85)@rcqls I \[simplified](https://gist.github.com/toomasv/b2719d0635ed965ae22068ad1ecb6536) the syntax further. Now all modifiers with same scope may be included in one block. No need to have font and background in separate blocks.

rcqls

[17:19](#msg5c8547170a6b91516308c8d3)@toomasv :clap: much more simple!

hiiamboris

[20:57](#msg5c857a30e527821f0a38208d)@toomasv as a rich-text pioneer, maybe you do understand what's happening here? ☺

```
extend system/view/VID/styles [
	style1: [template: [type: 'rich-text junk1: junk2: 1]]
	style2: [template: [type: 'rich-text junk1: 1]]
] 
view [
	style1 100x100  on-created [print ['style1 size-text/with face "A"]]
	style2 100x100  on-created [print ['style2 size-text/with face "A"]]
]
```

Output:

```
style1 0x1
style2 0x11
```

toomasv

[21:08](#msg5c857cea25e4e24c074a388f)@hiiamboris Strange. I'll try to play with it tomorrow.

hiiamboris

[21:30](#msg5c858200c8e5bc51621cdfb2)Good luck! ☻

## Monday 11st March, 2019

toomasv

[13:11](#msg5c865e77b4b6ef7bc890280e)@hiiamboris I wrote a long reply, but gitter swallowed it and doesn't give it back. I'm not in mood to write it again. Shortly, this does not concern VID, or styling, but appears also when `rich-text` is created directly with same junky parameters. The problem disappears if two `rich-text` parameters (`line-spacing: 'default handles: none`) are set \*\*before\** junky ones. If any of these two is left out or appears after the junky ones, the problem reappears. When used on `rich-text`, `size-text` returns always the size of current text of the face, regardless of `/with` refinement. Size of same text measured on `rich-text` and other faces is different. It's more precise, if applied on `rich-text`, but too small if measured on `rich-text` and applied on other faces.

hiiamboris

[13:44](#msg5c86663ee527821f0a3e170c)ctrl-z doesn't work? (for gitter)

[13:50](#msg5c8667c0d1e7281f090f407e)I figured it concerns those 3 extra parameters (line-spacing, handles, tabs) that are not present in a `face!`... Worth raising an issue? Looks like someone's accessing these (rich-text) parameters with an integer constant somewhere?

[13:52](#msg5c86680e1c597e5db6bd0109)@toomasv thanks for looking into it by the way ☻

toomasv

[14:21](#msg5c866eeb293ac75db58c647f)&gt; Worth raising an issue?

I think so.

hiiamboris

[14:38](#msg5c8672ca8f294b134a24f3cc)https://github.com/red/red/issues/3814

[14:38](#msg5c8672e20a6b915163108a11)not a day without a few more issues popping up ;)

## Tuesday 12nd March, 2019

planetsizecpu

[12:27](#msg5c87a5b02f2fb54c37da07e5)I like it when things work well by their very nature -mathematical in this case- now the elevators already make their stops and the boy can go everywhere, although he needs a bit of refinement in his behavior haha :-)

[12:29](#msg5c87a6422f2fb54c37da0b84)\[!\[cavetest7.gif](https://files.gitter.im/red/red/gui-branch/nM3O/thumb/cavetest7.gif)](https://files.gitter.im/red/red/gui-branch/nM3O/cavetest7.gif)

Respectech

[19:26](#msg5c8807f0f895944c0883cfab)@planetsizecpu Looks like it will be a fun game when you get it complete!

greggirwin

[20:10](#msg5c8812282f2fb54c37dd1840)Go @planetsizecpu, go!

rebolek

[20:33](#msg5c881796ac408e11924c2e99)@planetsizecpu I like it!

## Wednesday 13th March, 2019

planetsizecpu

[07:54](#msg5c88b739bf7990126e95a587)Thx all for support!  
@Respectech this game was amazing, I spent a lot of coins in arcade when teenager  
@greggirwin I enjoy a lot, even my daughter (who is studying python at the university) is interested!  
@rebolek the boy walks all the time with his arms raised, a bit like Jack Sparrow, do not you think? It's their nature, as the clothes show haha.

pekr

[08:05](#msg5c88b9bde527821f0a4dc435) Reminds me of the Manic Miner or Jet Set Willy games from ZX Spectrum :-)

planetsizecpu

[08:24](#msg5c88be4a1fae6423ca7900cb)😃

## Friday 15th March, 2019

planetsizecpu

[11:31](#msg5c8b8d1fc25d677f842c2114)I did some improvements last days, the boy walk a bit better, more on slopes, also fixed the falls, from low altitude and the deaths from high altitude, bad news for the guy :-)

BeardPower

[11:32](#msg5c8b8d422b6075296bccbbbd)&gt; I did some improvements last days, the boy walk a bit better, more on slopes, also fixed the falls, from low altitude and the deaths from high altitude, bad news for the guy :-)

Sell a parachute through IAP ;-)

planetsizecpu

[11:35](#msg5c8b8e1deca34208c6ea30b3)\[!\[cavetest8.gif](https://files.gitter.im/red/red/gui-branch/bIBy/thumb/cavetest8.gif)](https://files.gitter.im/red/red/gui-branch/bIBy/cavetest8.gif)

toomasv

[12:53](#msg5c8ba059c627612ffd9fd34a) :joy:

greggirwin

[18:32](#msg5c8befc91243db346b9bec11)More good progress @planetsizecpu. It's funny how strongly simple things can make us react. Fond memories of playing, when imagination counted for so much more.

## Saturday 16th March, 2019

planetsizecpu

[14:46](#msg5c8d0c326a3d2e230dd46c7b)@greggirwin Thx, I do it when time permits, having a lot of fun.  
If you look closely, when the boy hits the ground and the desired effect occurs, the rest of the movement stops, elevators and kart.  
That is due to the side loop that alternates the different images of the boy on the ground, to produce the effect, is out of the main loop. Doing so in the main movement loop does not make sense due to its complexity, since it would imply having to change the images of the boy according to a frame type diagram. I've thought about changing this with a .GIF file that produces the desired movement, but the .GIF does not alternate the movement, so I'm forced not to put that effect for now, but it occurs to me that maybe in the future the .GIF are supported .  
Another thing that I think can help in the future (I mean 1.x) would be if `on-time` block of code could be executed asynchronously in other thread, this would help a lot, for example, with elevators and guards. They are just some ideas that come to me during development.

greggirwin

[16:22](#msg5c8d22cb2f6ded0abbf286ad)We don't have the concurrency design finalized, but a common approach is for each object to maintain state, and your main loop isn't blocked, like a cooperative multitasking system. No threads required.

## Tuesday 19th March, 2019

planetsizecpu

[08:03](#msg5c90a264fa5b721a1fb2e752)Thx, I will try to explore that way to see how it behaves

GalenIvanov

[19:08](#msg5c913e1749fdaa0d81e03f31)Hi! I'm workng on a puzzle simulator for the \[Hex-pave](http://www.gamepuzzles.com/hex-pave.htm) puzzle invented by Carl Hoff.

[19:09](#msg5c913e77d0133e21e5dfc65a)!\[Hex-Pave/Red](https://github.com/GalenIvanov/Games/blob/master/Hex-Pave.png?raw=true)

[19:13](#msg5c913f69fcaf7b5f73df5d9a)It's a WIP and serves more as a proof of concept, so it needs a lot of improvements. Right now it's only a set of draggabal tiles (which are simple base controls). In order to polish it, I'll most probably need to switch to a full polygon-based implementation. Please take a look at the current state of it and share your thoughts/suggestions with me.

[19:14](#msg5c913f7aa21ce51a20897b5d)\[Hex-Pave/Red](https://github.com/GalenIvanov/Games)

rcqls

[20:12](#msg5c914d303dd81711491a72a7)@GalenIvanov Looks great! Almost there on Linux since I have noticed a little issue on dragging…. :clap:

GalenIvanov

[20:29](#msg5c91511edfc69a1454bfcbbb)@rcqls Thanks! I only tested in on WIndows 10, where the dragging is smooth.

rcqls

[20:30](#msg5c9151782fb6800d8049241d)@GalenIvanov It works on macOS too! And I am sure on Linux soon since I already observed this issue in another example… So a good news for me to see this issue again.

GalenIvanov

[20:34](#msg5c915272fcaf7b5f73dfdbb4)@rcqls I'm glad that it works on macOS. I also hope that Linux will catch up soon :)

toomasv

[20:37](#msg5c91531752c7a91455c0c099)@GalenIvanov Very nice! One simple step might be adding to `view-block` `on-down` actor, which would bring the tile unde mouse to front:

```
on-down [move find face/parent/pane face tail face/parent/pane]
```

## Wednesday 20th March, 2019

greggirwin

[00:59](#msg5c91905f49fdaa0d81e27023)@GalenIvanov very nice! I'll try to actually play with it soon.

GalenIvanov

[07:34](#msg5c91ece852c7a91455c47678)@toomasv Thanks! May be I'll need some help to apply your advice to my code - I'll ask if necessary.

[07:39](#msg5c91ee202f6ded0abb11b808)@greggirwin Thanks! According to Carl the puzzle has 19 solutions in total, not counting rotations and reflections. There are 3051 solutions with the smaller regular hexagon outside the tray. Enjoy!

toomasv

[09:14](#msg5c92045afa5b721a1fbc6733)@GalenIvanov I am happy to help if needed.

GalenIvanov

[09:14](#msg5c920461dfc69a1454c45caf)@toomasv Your solution works very well, thanks! I only need to apply it also to `on-alt-up` and maybe to `on-mid-up`

toomasv

[10:02](#msg5c920fa69d9cc8114aeefc10):+1:

rebolek

[14:05](#msg5c9248a4f3dbbd230c897328)Does `fill-pen bitmap` work? It certainly does not work as described in \[docs](https://doc.red-lang.org/en/draw.html#\_bitmap\_fill), passing `image!` throws error. Passing word with image value works, but I can't see the image (on GTK, so maybe it's just current limitation of GTK branch).

toomasv

[14:26](#msg5c924da93dd81711492119bd)@rebolek This works on W:

```
bm: draw 20x20 [fill-pen gold circle 10x10 6]
view [box 100x100 draw [fill-pen bitmap bm box 0x0 80x80]]
```

[14:26](#msg5c924db18126720abc13fb47)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/FRll/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/FRll/image.png)

rebolek

[14:28](#msg5c924df90d719050573758d4)@toomasv thanks, so it seems to be just GTK limitation.

toomasv

[14:30](#msg5c924e9e9d9cc8114af0be7c)@rcqls ^

rcqls

[16:12](#msg5c9266548126720abc14ae0b)@toomasv @rebolek I confirm that it is not implemented in Linux but also on macOS…

rebolek

[16:37](#msg5c926c2e6a3d2e230df7867a)If it's not working on macOS, it's probably worth a ticket. I'll open one later.

## Friday 22nd March, 2019

planetsizecpu

[09:38](#msg5c94ad0f52c7a91455d7b1d7)Hi guys, there is little news from the cave due to lack of time, but today I was able to touch the elevator routine a bit to allow the boy to jump inside. As you can see on the gif, when it jumps in, the image of the elevator changes suddenly, but when it jumps out, instead, you see both the elevator boy and the guy who jumps out, the two faces, this is due to the overlap that follows having. You can also jump from the next floor, if it is not too high; if that is the case, the boy dies just as he leaves the elevator, but not while he goes inside :-)

[09:41](#msg5c94adc8f3dbbd230c99d38e)\[!\[cavetest9.gif](https://files.gitter.im/red/red/gui-branch/yyP0/thumb/cavetest9.gif)](https://files.gitter.im/red/red/gui-branch/yyP0/cavetest9.gif)

toomasv

[09:45](#msg5c94ae9ffcaf7b5f73f64df7)@planetsizecpu It's evolving nicely!

planetsizecpu

[09:45](#msg5c94aeb2dfc69a1454d6b2a2)\[!\[cavetest10.gif](https://files.gitter.im/red/red/gui-branch/yBf2/thumb/cavetest10.gif)](https://files.gitter.im/red/red/gui-branch/yBf2/cavetest10.gif)

rebolek

[09:46](#msg5c94aee2fcaf7b5f73f64f95):clap:

planetsizecpu

[09:52](#msg5c94b06681b15c5e4b6931de)Thx guys, I keep working hard on it

Rebol2Red

[11:32](#msg5c94c7ba6a3d2e230d079403)@greggirwin  
&gt; Check out the Cross-Platform GUI Metrics section in https://www.red-lang.org/2017/07/063-macos-gui-backend.html.

Great help, thank you.

BeardPower

[12:15](#msg5c94d1f5fcaf7b5f73f742d0)I did a little R&amp;D regarding charts as well. Trying out DSLs, plugins and so on.

[12:16](#msg5c94d216fcaf7b5f73f74370)\[!\[charts.jpg](https://files.gitter.im/red/red/gui-branch/aLPM/thumb/charts.jpg)](https://files.gitter.im/red/red/gui-branch/aLPM/charts.jpg)

[12:16](#msg5c94d21952c7a91455d8b9a4)\[!\[volume.jpg](https://files.gitter.im/red/red/gui-branch/aidh/thumb/volume.jpg)](https://files.gitter.im/red/red/gui-branch/aidh/volume.jpg)

[12:17](#msg5c94d23ffcaf7b5f73f74524)\[!\[line.jpg](https://files.gitter.im/red/red/gui-branch/29dr/thumb/line.jpg)](https://files.gitter.im/red/red/gui-branch/29dr/line.jpg)

[12:17](#msg5c94d2632fb6800d80613343)@GalenIvanov Awesome!

planetsizecpu

[17:22](#msg5c9519ba2fb6800d80633e87)Nice stuff @BeardPower

Respectech

[17:59](#msg5c95226e9d9cc8114a0430e6)@BeardPower Looking forward to replacing gnuplot as soon as you're done. :-)

greggirwin

[18:24](#msg5c9528439d9cc8114a045258)@planetsizecpu, more good progress. We'll all learn a lot from your work as we look at building games.

@BeardPower nice! It's \*off the charts\*!

GalenIvanov

[19:33](#msg5c953887dfc69a1454daaf9f)@BeardPower Thank you!

BeardPower

[19:45](#msg5c953b5581b15c5e4b6d2887)@Respectech That's the idea ;-)

## Saturday 23th March, 2019

planetsizecpu

[10:31](#msg5c960b0e9d9cc8114a09dad9)@greggirwin you're right, I'm learning a lot doing the game, for example, some weeks ago I did ask for a `point(x,y)` function will be good for game design. Although I do not use them, I have defined these two functions to treat the color value in the faces image, `getpoint`&amp; `setpoint`, I still have to harden them to catch casual errors, the first returns the color of the face/image at a given point, the last sets them:

```
; Get color of a face/image on a given point
getpoint: function [face [object!] point [pair!]][
	Ret: none
	Pnt: (point/y  * face/size/x) + point/x 
	Ret: face/image/(Pnt)
	return Ret
]

; Set color of a face/image on a given point
setpoint: function [face [object!] point [pair!] value [tuple!]][
	Ret: none
	Pnt: (point/y  * face/size/x) + point/x 
	face/image/(Pnt): value
	return Ret
]
```

[10:33](#msg5c960b91fcaf7b5f73ff3a62)That helped a lot to allow the boy walk over the terrain and fall out in the holes :-)

hiiamboris

[14:12](#msg5c963ebb2fb6800d806a7172)why not just `face/image/:point` and `face/image/:point: value` ?

GiuseppeChillemi

[15:46](#msg5c9654e9a21ce51a20ab4cb1)@BeardPower WOW ! Are you going to publish it ?

rcqls

[17:51](#msg5c96720e2fb6800d806bceb1)@toomasv It took me long time to fight an issue on rich-text on-over actor with panel parent. I found a solution but I don’t know if it is the final solution. As a consequence, easy-VID-rt.red is now mostly working (except slight trouble with some exit button) on Red/GTK. It was one of your challenge! Not fully answered yet but really not so far now!

[17:51](#msg5c9672208aa66959b65bf4ae)\[!\[Capture d’écran 2019-03-23 à 18.50.30.png](https://files.gitter.im/red/red/gui-branch/W12v/thumb/Capture-d\_ecran-2019-03-23-a-18.50.30.png)](https://files.gitter.im/red/red/gui-branch/W12v/Capture-d\_ecran-2019-03-23-a-18.50.30.png)

planetsizecpu

[18:35](#msg5c967c6552c7a91455e3aa88)@hiiamboris I don't get what you mean. @rcqls Good job!

[18:51](#msg5c9680446a3d2e230d12d35e)I had to adjust the routine of the elevator quite a bit more, since there was overlap between it and the kart, and it was dragged up, so I saw the kart running down the second floor between the walls :-) I now need to take the boy out of the lift before it jumps out, so you do not see both at once.

[18:55](#msg5c96811c6a3d2e230d12d83d)\[!\[cavetest11.gif](https://files.gitter.im/red/red/gui-branch/bWhk/thumb/cavetest11.gif)](https://files.gitter.im/red/red/gui-branch/bWhk/cavetest11.gif)

[19:05](#msg5c96839681b15c5e4b75301f)It has been complicated to hide the boy behind the elevator, so it is dragged until it jumps out, it is not seen because it is hidden due to the Z order, but I have to make the face not visible also during the drag, to be satisfied with the operation of the routine. More fun coming :-)

rcqls

[19:11](#msg5c9684d1fcaf7b5f730245f5)@planetsizecpu Good job too BTW!

planetsizecpu

[19:12](#msg5c96850ea21ce51a20ac9c03)Thx @rcqls I'm learning and having fun at a time!

toomasv

[21:07](#msg5c96a01649fdaa0d81049907)@rcqls Fantastic! :+1:

dander

[21:08](#msg5c96a0363dd81711493deaee)@rcqls great progress. Congrats!

[21:10](#msg5c96a0c13dd81711493df214)@planetsizecpu I'm not sure if transparency is supported, but it seems like it could be useful to have the boy's background be transparent instead of black

GiuseppeChillemi

[22:26](#msg5c96b2b1a21ce51a20adaf0e)Working with remote system it would be nice to have a GUI replicated remotely. It would be possible to have all drawing command as text to have them replicated into the mirror screen ?

## Sunday 24th March, 2019

BeardPower

[00:38](#msg5c96d18c52c7a91455e5c84c)@GiuseppeChillemi My plan was to implement a full-fledged charting/trading application. I'm currently undecided if I will released it as Open Source.

rebolek

[07:01](#msg5c972b30a21ce51a20b08f3a)if anyone needs charts, my chart stykes are open already

GiuseppeChillemi

[07:42](#msg5c9734ef52c7a91455e812b8)@BeardPower open source it and you will multiply the hands that will develop your project.

rebolek

[07:43](#msg5c97350c8126720abc3457b7)That's just theory.

rcqls

[08:08](#msg5c973af0a21ce51a20b0f02e)@rebolek Could you please remind us the link of your chart styles?

rebolek

[08:09](#msg5c973b23fcaf7b5f7306a11a)@rcqls as all my other styles, https://gitlab.com/rebolek/red-styles/

[08:09](#msg5c973b3f3dd8171149417547)currently in `bbchart` branch, will be moved to master soon (it's still in heavy development)

rcqls

[08:09](#msg5c973b5281b15c5e4b798048)Thanks! I was watching on github….

rebolek

[08:09](#msg5c973b573dd817114941756b)@rcqls btw, I believe that `arc` in GTK is buggy.

[08:10](#msg5c973b912fb6800d80708c64)@rcqls yeah..I have some stuff on Github and some on Gitlab, it's confusing I know...but Gitlab has some nice features over Github, so I'm moving my stuff there.

rcqls

[08:11](#msg5c973bce52c7a91455e83e92)@rebolek Do you mean shape arc? arc is actually working for ballots.red now…

planetsizecpu

[08:25](#msg5c973ee8dfc69a1454e7576f)@dander Yes, the transparency would simplify things a lot especially on the stairs, I was trying it but I could not make a bitmap with the transparent background for the boy using pbrush. In any case it is complicated because the elvator, for example, has the zone of the transparent window but not the basket, the same happens with the kart, and things get complicated since different types of faces can overlap. What would be very helpful would be the support for GIF files, this would greatly simplify the special effects :-)

rebolek

[08:25](#msg5c973efc81b15c5e4b799546)@rcqls yes, shape arc, sorry.

[08:26](#msg5c973f193dd8171149418a22)@rcqls see the mockup in Gritter. Does scroller render fine for you?

rcqls

[08:26](#msg5c973f3b49fdaa0d81085ce9)@toomasv @dander Thanks!

[08:27](#msg5c973f698126720abc3491be)@rebolek shape arc is in development… not so easy...

rebolek

[08:31](#msg5c9740459d9cc8114a11624b)ah, ok. thanks

rcqls

[08:31](#msg5c974073f3dbbd230caa78d6)@rebolek It seems to be better last time I tried but not sure… I am working on actors now and I don’t think it can affect draw dialect but we never know…. I need to fix on-over for example...

rebolek

[08:36](#msg5c9741899d9cc8114a11693d)@rcqls no problem, follow your schedule of course, I just found out few days ago, so wanted to mention it to you.

BeardPower

[08:48](#msg5c97445afcaf7b5f7306dddc)@GiuseppeChillemi As @rebolek noted, Open Source is not a guarantee to get developers on board nor does it mean success. It also depends if I will be sponsored by a company/creating it for a company. If they do its their decision if they want it to be Open Source or not.

[09:00](#msg5c9747152fb6800d8070d5f4)You would also need to manage the project. If people don't agree with your ideas and concepts they will fork it and work-force will be split over multiple projects. Some of forks will get abandoned, others have less quality and go into a direction which is the total opposite of what the original developer envisioned. Going Open Source has a lot of drawbacks. There is also another important point: we all have to pay our bills.

GiuseppeChillemi

[11:31](#msg5c976a818aa66959b661d9c3)@BeardPower The stupid man takes without giving, the wise one supports the developers.

BeardPower

[11:32](#msg5c976ac79d9cc8114a125725)@GiuseppeChillemi closed source does not equal not giving back.

GiuseppeChillemi

[11:33](#msg5c976aeffcaf7b5f7307c596)Personally I won't help anything which is not open sourced and I am ready to send fund open develpment.

[11:33](#msg5c976af849fdaa0d81096533)And I have a reason

[11:33](#msg5c976aff8aa66959b661dc79)Explayned many times:

[11:35](#msg5c976b7adfc69a1454e86cba)Open source let you modify the project when you need it even if the develpers wont do it; let you continue the work even if the developer abandon it; lets you interface to things you only now; lets you make a better suited product for your needs when the develpers has no willingness to do this.

[11:37](#msg5c976c053dd8171149429c0c)My company has been near to close thanks to closed source software used to extort money in difficult times. We were very lucky to save us. So, no one will have anymore such power over our lifes.

[11:39](#msg5c976c5a81b15c5e4b7aafee)That time I have choosen to contribute, even with plenty (when I have it ;-) of money to enyone developing open source software we use so we are free.

BeardPower

[11:39](#msg5c976c7c6a3d2e230d186e8a)Sure, that's a valid point but you end up with fragmentation. Just look at Linux. Thousands of distributions doing some minor things differently. They differences don't offer any big advantage. Imaging everyone worked together on the same thing. The product would evolve faster and could result in a superior product.

GiuseppeChillemi

[11:40](#msg5c976c986a3d2e230d186f23)Freedom is actually the most important value for our company when talking about software and machinery.

[12:16](#msg5c977518f3dbbd230cabcc1c)@BeardPower You call it fragmentation but I call it multiplication. Developers expressing their idea forking a project multiplicate the avaliable solutions. Closed source give a false idea of superior product. A lone tree in a forest seems big because there is no forest ! But what make the forest is the presence of other trees and a forest is always stronger than a single tree.  
Having many forks does not let you have less funds or developers. You have the same money, plus development made from other develpers, plus all user and funders attracted from the other flavours of your project. You have not divided a cake, you have your cake plus the whole cakery, plus the whole franchising, plus all the people which love that kind of cakes and have money to bake that kind off cakery.

[12:16](#msg5c9775295547f77448591998)(let's continue on chit chat)

rebolek

[12:33](#msg5c977924f3dbbd230cabe69a)@BeardPower fragmentation is inevitable. That's why I'm working on my chart styles and you are working on your own, even if we could work together.

BeardPower

[17:50](#msg5c97c372a21ce51a20b475cc)@rebolek It is for various reasons. I'm trying out various approaches so I have more to discuss with you, which I wanted to do today (I finished testing out my designs). To work together we need to a consensus. What if we can't get to one?

[17:51](#msg5c97c3b549fdaa0d810ba579)So expect a PM soon ;-)

## Monday 25th March, 2019

ldci

[12:32](#msg5c98ca662fb6800d807ac11e)Denoising images with redCV : https://redlcv.blogspot.com

rebolek

[13:58](#msg5c98de9f2fb6800d807b5692)@ldci wondreful!

[13:59](#msg5c98deae81b15c5e4b841ea0)If anyone's willing to test it, I'll be glad: https://github.com/red/red/pull/3825

toomasv

[14:22](#msg5c98e43e81b15c5e4b8446df)@ldci Amazing!

ne1uno

[15:47](#msg5c98f812f3dbbd230cb5bc62)@rebolek the few simple things I tried work. much nicer than extending system styles too

rebolek

[15:51](#msg5c98f8fa6a3d2e230d22aa13)@ne1uno thanks! It seems to that it's working, but I certainly haven't tested everything, so any help is appreciated.

[15:51](#msg5c98f9058126720abc3ff751)\*to me

Oldes

[16:12](#msg5c98fdec3dd81711494cf6b2)@rebolek you should include test files, so one can test it even without knowing what should work. It would be also good to provide description in the PR especially when it is `FEAT`, because I believe, Nenad is (or could be) using it for future blog post describing the new release.

rebolek

[16:16](#msg5c98fefbfcaf7b5f73124782)@Oldes you're right, I'm working on tests, current test framework is not designed for GUI testing, so it needs more features

Oldes

[16:17](#msg5c98ff31f3dbbd230cb5f816)I know... but still there is already `tests` folder with \_View_ scripts.

rebolek

[16:20](#msg5c98ffbb8aa66959b66c8e62)They jus run GUI, for styles it's imo better to compare created objects, not viee anything

Oldes

[16:23](#msg5c99007b8126720abc402e14)They can actually work as a code examples too. Remember that you know what you can type and expect it to be working, but you are the author of it.

rcqls

[16:23](#msg5c9900843dd81711494d08cb)@rebolek Since I am not an expert on style, what is the use case of stylize? Do you have some obvious examples? (I have read your blog about style and the source code of your PR but it is difficult for me to test it if I don’t know what is the goal?)

Oldes

[16:24](#msg5c9900b8dfc69a1454f329a4)http://www.rebol.com/docs/words/wstylize.html

rcqls

[16:24](#msg5c9900c749fdaa0d81140a47)Thanks! Interesting!

## Wednesday 27th March, 2019

kpeters58\_gitlab

[01:00](#msg5c9acb4a5636de703de8eca2)Is there an up-to-date and complete document on Red GUI somewhere?

9214

[01:04](#msg5c9acc131f74fc4d4ca318bd)@kpeters58\_gitlab \[official reference documentation](https://doc.red-lang.org/en/view.html).

greggirwin

[01:04](#msg5c9acc1b5c7a815f27d3f7b8)Hi Kai! See https://doc.red-lang.org/en/gui.html

kpeters58\_gitlab

[01:14](#msg5c9ace700d719050576f4633)Thanks!

## Thursday 28th March, 2019

planetsizecpu

[11:56](#msg5c9cb6728df8b02f0473db73)Hi guys, some news from the cave.  
Now the boy can move inside the elevator (it's a simulation because there's no transparency) and it can jump in and out. It can also go up on the roof to get to the next stop, where he gets inside. From now on, the work to get into the kart begins.  
More news will come soon, I can not describe how much fun I am having :-)

[11:59](#msg5c9cb70551353e5a4dab9db8)\[!\[cavetest12.gif](https://files.gitter.im/red/red/gui-branch/QWUt/thumb/cavetest12.gif)](https://files.gitter.im/red/red/gui-branch/QWUt/cavetest12.gif)

BeardPower

[11:59](#msg5c9cb73351353e5a4dab9f6c)Nice.

TimeSlip

[14:26](#msg5c9cd9abe4561321d0516e66)@planetsizecpu How cool!

greggirwin

[18:29](#msg5c9d128c6a9761361b1980e1)Fantastic @planetsizecpu!

toomasv

[19:08](#msg5c9d1bbbb7e27d2f059b40bd)Cave, @planetsizecpu , cave! :+1:

## Friday 29th March, 2019

planetsizecpu

[18:29](#msg5c9e63fb6a9761361b22e429)Thx all!, I just was reading official doc about `image!` and I saw opacity can be modifyed by code using alpha channel, I had the idea of set the boy semi-transparent by code, by setting last value of color tuples as ARGB `0.0.0.200` for example, it may work fine on stairs, so next week will try to see if I can. As an advance, I can say that I have already seen the boy get on the kart, I have to improve the process a bit before showing here, because it jumps on instead of using the handle as it did in the arcade game :)

ldci

[18:48](#msg5c9e6871e422d15199349f5a)@planetsizecpu have a look to RedCV which includes transparent gestion

## Saturday 30th March, 2019

planetsizecpu

[08:10](#msg5c9f247b31aec969e8212c62)Thx I'll do a look

## Monday 1st April, 2019

Claudio08

[16:27](#msg5ca23be1a84e0c501abbe0c0)I do not see where is my error.  
The code must display 3 master panels. Each master panel contain 3 panels (or more) with each one a different text. But all the panels and text are displayed in the first master panel. Now master panel are 3 but they will be 12. I think a "copy" problem?

[16:28](#msg5ca23c26016a930a4546404c)init-txt: func \[root txt][  
foreach-face/with root [  
face/text: txt/1  
print face/text  
txt: next txt  
]\[face/type = 'text]  
]

view/flags compose [  
style my-panel: panel 65x250 gray [  
space 0x3  
below  
origin 2x10  
panel 50x50 blue \[text ""]  
panel 50x60 gold \[text ""]  
panel 50x70 green \[text ""]  
]  
p1: my-panel red on-create \[init-txt face \["1111" "2222" "3333"]]  
across  
p3: my-panel on-create \[init-txt face \["aaaa" "bbbb" "cccc"]]  
across  
p2: my-panel black on-create \[init-txt face \["++++" "####" "\*\*\*\*"]]  
]\['resize]

[16:28](#msg5ca23c43a0790b29c944334b)First time that i use the chat. Thanks

[16:36](#msg5ca23e095a83c30a46f2547a)I use windows 10 pro

rebolek

[16:38](#msg5ca23e810aad6350190f2aae)Just a moment, I'll take a look at it...

[16:43](#msg5ca23fa97ecbdc29cae1aa33)@Claudio08 ok, this is problem with `style` applied on `panel`. You need to populate panel's pane manually in `on-create`.

[16:46](#msg5ca240831f6e900d5ebf4973)This is simplified code showing the problem:

```
view [style p: panel [button "asdf"] p p p]
```

toomasv

[17:28](#msg5ca24a2d016a930a4546a981)@Claudio08 I could make it work only this way:

```
init-txt: func [root txt][
	foreach-face/with root [
		face/text: txt/1
		print face/text
		txt: next txt
	][face/type = 'text]
]
extend system/view/VID/styles [
	my-panel: [
		template: [
			type: 'panel
			size: 65x250
			color: gray
			pane: []
		]
		init: [
			face/pane: layout/only [
				space 0x3
				below
				origin 2x10
				panel 50x50 blue [text ""]
				panel 50x60 gold [text ""]
				panel 50x70 green [text ""]
			]
		]
	]
]
view/flags compose [
	p1: my-panel red on-create [init-txt face ["1111" "2222" "3333"]]
	across
	p3: my-panel on-create [init-txt face ["aaaa" "bbbb" "cccc"]]
	across
	p2: my-panel black on-create [init-txt face ["++++" "####" "**"]]
]['resize]
```

\[!\[image.png](https://files.gitter.im/red/red/gui-branch/XK4S/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/XK4S/image.png)

rebolek

[17:46](#msg5ca24e7a93fb4a7dc2b8d2b4)The button is obviously there, it's just not visible. There's probably some initialization missing, I'll take a look at that:

```
>> layout [style p: panel [button "asdf"] p1: p p2: p p3: p]
== make object! [
    type: 'window
    offset: none
    size: 286x6...
>> p1/pane/1/type
== button
>> p1/pane/1/text
== "asdf"
>> p2/pane/1/type
== button
>> p2/pane/1/text
== "asdf"
```

hiiamboris

[17:47](#msg5ca24ebe31aec969e8365794)

```
>> same? p1/pane/1 p2/pane/1
== true
```

rebolek

[17:49](#msg5ca24f278148e555b23041d5)The problem is that styling in `layout` just ignores `pane`.

## Tuesday 2nd April, 2019

Claudio08

[04:50](#msg5ca2ea02f851ee043d48c65e)Thanks!!!

rebolek

[06:42](#msg5ca30439a84e0c501ac100f2)I wrote a fix for this bug, available at https://github.com/rebolek/red/tree/style-panel  
However it's based on my `stylize`branch, that has yet to be merged to main.

## Thursday 4th April, 2019

Claudio08

[15:28](#msg5ca622a8f851ee043d5f3b3c)Hi, i do not understand how work "center" text style in a panel.  
I thinked that work "center-aligned" as in html or word processor, but seem that is not so. I need in small panel to vertically center texts or wrap. This is a test code that i used (size 50x300 display nothig) with a bad result:

```
view/flags [
	title "test"
	style hline: base 60x2 red
	style t: text font-name "courier new" font-size 8 font-color white	
	panel gray "<center>"  bottom center 
	[
	;size 50x300
	size 100x300
	below center
	hline 
	t "CENTER"
	t "CCC" 
	t "C" 
	t "aaaaa"  
	t "bbbbbb" 
	t "ccc"  
    t "text1text2text3text4text5text6text7" wrap 	
	]
]['resize]
```

hiiamboris

[16:08](#msg5ca62be8bd70a40d5ff5f18d)@Claudio08 try `style t: text 100 center ...` instead. And keep in mind that on Windows `text` only supports wrapping on word boundaries. You can use `base` to wrap text like this or use some custom automatic splitting algorithm that suits you.

## Friday 5th April, 2019

Claudio08

[08:06](#msg5ca70c95a0790b29c965111f)@hiiamboris thanks, with `style t: text 100 center ...` works better

planetsizecpu

[08:33](#msg5ca712bd0aad6350192fc9e4)Here is the update of the week, improvements using kart, and now we can get gold, pickax and wheelbarrow, a lot of work and amusement :-) but it has only 850 LOC

[08:35](#msg5ca7133c93fb4a7dc2d931a6)\[!\[cavetest13.gif](https://files.gitter.im/red/red/gui-branch/OH91/thumb/cavetest13.gif)](https://files.gitter.im/red/red/gui-branch/OH91/cavetest13.gif)

greggirwin

[18:20](#msg5ca79c720aad63501933a7f7)Ha! That's great! Really fun to see these updates as you progress @planetsizecpu.

Where's @BeardPower for the Heavy Gold? :^)

Respectech

[19:54](#msg5ca7b27b8148e555b255a0e4)@planetsizecpu Nice job!

TimeSlip

[20:40](#msg5ca7bd3cb34ccd69e76e4d51)@planetsizecpu Cool!

## Saturday 6th April, 2019

rebolek

[05:56](#msg5ca83fa08148e555b2591962)\[!\[map.PNG](https://files.gitter.im/red/red/gui-branch/fGPb/thumb/map.png)](https://files.gitter.im/red/red/gui-branch/fGPb/map.PNG)

[05:57](#msg5ca83faef851ee043d6d7894)I wanted to make simple map generator and ended up with this instead.

toomasv

[06:45](#msg5ca84b0d016a930a45704295)Cell culture? Complex molecule? Atomic model?

rebolek

[06:58](#msg5ca84e057ecbdc29ca0a9a94)I'm not sure what it is. I'm just sure, what it isn't. A map :smile:

rcqls

[07:18](#msg5ca852ab1f6e900d5ee87995)@rebolek Nice! I guess it does not work on Linux….

planetsizecpu

[07:45](#msg5ca859253ebbdc55b36deb9f)@rebolek Wow! maybe microscope image, good job whatever the algorithm is

rebolek

[07:51](#msg5ca85a80c55bd14d3599888b)@rcqls it should, it creates image pixel by pixel in a loop, nothing special.

rcqls

[07:53](#msg5ca85adcb34ccd69e771d1c9)@rebolek Cool then even if it needs to be tested! There is some issues in RedCV for Linux related to image transformation...

GalenIvanov

[07:59](#msg5ca85c657ecbdc29ca0af083)@rebolek It looks like Voronoi diagram - each cell is shaded according to the distance to the (center of ) nearest adjacent cell. Maybe you have created it by putting "blobs" using max operator for composition?

rebolek

[08:00](#msg5ca85cad31aec969e85df50f)@planetsizecpu it first creates some random points - peaks ant then it calculates distance from nearest peak from each point in image. The shorter yhe distance is, the brighter the pixel is.

[08:01](#msg5ca85cd51f6e900d5ee8bac7)@GalenIvanov right, that's basically what it is.

GalenIvanov

[08:04](#msg5ca85d8631aec969e85dfc26)@rebolek Nice! I want to write a texture generator in Red - not sure of the interface though - GUI with stacking bases for controls or a simple DSL and a text edit for scripting.

rcqls

[08:06](#msg5ca85e14b34ccd69e771e151)@rebolek Brightness is scaled from 0 to max of nearest-distances? Or is there a cut-off from a fixed range of nearest distances (i.e black from a fixed distance)?

rebolek

[08:06](#msg5ca85e20a84e0c501ae4e0b0)@GalenIvanov I did texture generator for Rebol 2, see http://www.rebol.org/view-script.r?script=texture-lab.r

[08:07](#msg5ca85e3925686a7dc3e4299e)@rcqls there s some cutoff, it was too bright, when there wasn't

GalenIvanov

[08:08](#msg5ca85e94b34ccd69e771e4b9)@rebolek Thank you, I'll examine it and hopefully will find inspiration to start coding :)

greggirwin

[18:05](#msg5ca8ea6fc55bd14d359d547e)It's a beautiful mistake @rebolek. I love nature's algorithms.

## Sunday 7th April, 2019

Phryxe

[09:09](#msg5ca9be4e25686a7dc3ecd217)@rebolek Cool! It looks like a blurry photo of some sort of organism.

## Monday 8th April, 2019

ldci

[11:14](#msg5cab2d0a20fbe911ee7dd916)@rebolek Could you send your code to compare with some experiments with redCV?  
https://drive.google.com/file/d/1cPlLcEstmmhlxMwhYsgtPHqO8tAt6t2u/view?usp=sharing

[11:14](#msg5cab2d3120fbe911ee7dd960)@rebolek Thanks a lot :)

rebolek

[14:34](#msg5cab5bfd8148e555b26d6056)@ldci no problem, I’ll put it in a Gist, but it’s child’s play compared to RedCV :smile:

Claudio08

[16:13](#msg5cab733d1f6e900d5efcc92e)Hi, wich is the valid syntax to use react/later?

The following script, and others, give me always this error:  
\*\** Script Error: VID - invalid syntax at: \[react/later \[b/color/1: to integer! 255 * s/data]]  
\*\** Where: do  
\*\** Stack: view layout cause-error

```
view [
    s: slider 
	return
    b: base react/later [b/color/1: to integer! 255 * s/data]
]
```

use react without /later work fine.  
thanks

9214

[16:22](#msg5cab7556759abc043c89abd7)@Claudio08 `react later`.

## Wednesday 10th April, 2019

rebolek

[04:42](#msg5cad7445759abc043c976ac4)@ldci https://gist.github.com/rebolek/8f7520f01d3297507d724e6e2c99b6f2

rcqls

[04:52](#msg5cad769c016a930a45937543)@rebolek Nice! As you said, it works on linux too!

rebolek

[04:55](#msg5cad774925686a7dc30634f8)@rcqls thanks, it doesn't use any special features, just displays an image, so it should work without problems.

ldci

[06:38](#msg5cad8f74759abc043c981d87)@rebolek Thanks a lot!

toomasv

[06:46](#msg5cad9142a0790b29c99052fb)@rebolek Beautiful! But what is `map`func there for?

rebolek

[06:55](#msg5cad9358016a930a45942ec1)@toomasv good question! :smile: it's copied from larger code and this function was accidentally left there.

toomasv

[06:55](#msg5cad936df851ee043d9125b4):smile:

[07:15](#msg5cad981aa0790b29c99084f3)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/1696/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/1696/image.png)

rcqls

[07:17](#msg5cad988fa0790b29c9908776):clap:

rebolek

[07:42](#msg5cad9e4cbd70a40d5f26a189)Interesting!

toomasv

[07:51](#msg5cada0710aad6350195be3c5)\[!\[ast-voronoi](https://toomasv.red/images/Graph/ast-voronoi.gif)](https://toomasv.red/images/Graph/ast-voronoi.gif)

rcqls

[07:54](#msg5cada12920fbe911ee8eb64a)@toomasv No way! I was guessing that you were cooking graphical programming! And here it is! You are a wonderful wizard!

toomasv

[07:57](#msg5cada1dd31aec969e88047ec) :tada: :smile:

rebolek

[07:59](#msg5cada269c55bd14d35bd7e64)Cool :)

[08:16](#msg5cada645a0790b29c990f30b)Anyone has an example how to use `on-close` ?

toomasv

[09:01](#msg5cadb0cc3ebbdc55b39210dc)Hmm..:

```
view [on-close [probe "Auf wiedersehen"] text "Close me from cross-on-the-bar"]
```

?

[09:07](#msg5cadb23a0aad6350195c5c5d)@rebolek I was thinking about how to stop the `map` that was in your `voronoi`from leaking. Would this be satisfactory?:

```
map: function ['word series code][
	if word? word [word: to-block word]
	bind word obj: object collect [
		forall word [
			keep to-set-word first word 
			keep 'none
		]
	]
	bind code obj
	collect [
		foreach :word series [
			keep do code
		]
	]
]
```

ldci

[09:38](#msg5cadb99ff851ee043d9237bd)@rebolek tested under macOSX: perfect and elegant :)

[10:57](#msg5cadcc0b31aec969e88160b4)@rebolek Playing with your code https://drive.google.com/open?id=1uE4ic6HbXvBeZp4otIerHPEvo68Gn6Rl

rebolek

[10:59](#msg5cadcca020fbe911ee8fe4a8)@ldci that's much nicer :)

rcqls

[11:00](#msg5cadccdc8148e555b27e853a)@ldci Is this new code related to redCV?

ldci

[11:05](#msg5cadcddea84e0c501a096cf3)No, just added Voronoi seeds to test your code. We need a red/system version to be included in RedCV and of course you'll be credited for these functions.  
This will be also perfect for Delaunay triangulation. We keep in touch.

rebolek

[11:11](#msg5cadcf65759abc043c99e227)@toomasv I'll take a look at it. have you tested the speed difference?

toomasv

[11:11](#msg5cadcf7f0aad6350195d2f95)@rebolek Not yet.

rebolek

[11:17](#msg5cadd0c6a84e0c501a098342)Ok, I'll try to do some tests.

planetsizecpu

[12:43](#msg5cade501c55bd14d35bf633d)@toomasv good job!

This week I had a lot of work in the mine, I modified the kart and made some improvements in its behavior. The routine of the elevator was not on the right direction, the fact of not having transparency with the boy made it very complex, I decided to turn the elevator into a platform, that way we don't need transparency, it simplifies the behavior a lot, and also the boy can travel over with the gold or the pickaxe, we can even load the gold in the wheelbarrow and have lives &amp; gold accounting, I still need to control a series of special cases, but in a few weeks I can start work with the guard :-)  
More news to come by the weekend if I can.

[12:46](#msg5cade590a84e0c501a0a200d)\[!\[cavetest15.gif](https://files.gitter.im/red/red/gui-branch/0uQJ/thumb/cavetest15.gif)](https://files.gitter.im/red/red/gui-branch/0uQJ/cavetest15.gif)

toomasv

[13:13](#msg5cadebf53ebbdc55b393cbbb)@planetsizecpu Nicer and nicer! :+1:

## Thursday 11st April, 2019

GalenIvanov

[08:27](#msg5caefa8ac55bd14d35c6d0c4)@toomasv Impressive!

toomasv

[09:46](#msg5caf0d080aad635019659e10)@GalenIvanov Thanks! Now VID is also parsed correctly:  
\[!\[VID-tree](https://toomasv.red/images/Graph/vid-tree.gif)](https://toomasv.red/images/Graph/vid-tree.gif)

rcqls

[11:00](#msg5caf1e30bd70a40d5f309653)Wow! Hope this one could work on Linux!

Phryxe

[11:11](#msg5caf20ef3ebbdc55b39c2218)I'm a fan of @toomasv :bow:

GiuseppeChillemi

[13:15](#msg5caf3ddfc55bd14d35c89aa2)#RESPECT !

rebolek

[13:35](#msg5caf42be016a930a45a0316a)@toomasv you have custom VID parser there?

toomasv

[13:43](#msg5caf4485c55bd14d35c8d16c)@rebolek Its's very simple, it doesn't check syntax, just recognizes keywords.

rebolek

[13:45](#msg5caf4506bd70a40d5f31a8bd)I see.

endo64

[15:12](#msg5caf596f016a930a45a0ddd0)Wow! COOL!!

toomasv

[15:51](#msg5caf62808148e555b289b5f2)Parse DSL also digested (er.. hopefully). Example from @9214 recent snippet:  
\[!\[parse-tree](https://toomasv.red/images/Graph/parse-tree.gif)](https://toomasv.red/images/Graph/parse-tree.gif)  
Test challenges accepted (not too long)

meijeru

[16:24](#msg5caf6a3e25686a7dc313bec8)Fascinating! Where is the source for `ast`?

toomasv

[17:03](#msg5caf7368a84e0c501a14e0da)@meijeru I hope it'll be presentable some day in next week.

[17:42](#msg5caf7c8f759abc043ca58bbd)Aaand \[draw-tree](https://toomasv.red/images/Graph/draw-tree.gif) too.

endo64

[21:28](#msg5cafb160a84e0c501a169e32)Amazing!

## Friday 12nd April, 2019

Claudio08

[05:33](#msg5cb023273ebbdc55b3a311dc)Hi, is possible to change the default standard font name and size for the window and all his faces in one time and not coding font for each single face?  
I tried some code as the following but is not the right way. Thanks

```
view [
        on-create [system/view/screens/1/font: [name: "Courier New" size: 20 color: red]]
        text "xxxxxx"
        text "yyyyyy"
]
```

ldci

[08:47](#msg5cb050aca84e0c501a1a9e84)@rebolek : Added some different distance calculation to your Voronoi code (https://drive.google.com/file/d/1vuYRXuVxOg9GuUnrzrXYNDD\_Qo0mSKGE/view?usp=sharing)

rebolek

[08:49](#msg5cb051191f6e900d5e1d87bf)@ldci great!

planetsizecpu

[11:17](#msg5cb073cda0790b29c9a40263)@ldci wow! stay on the line, much encouragement with this project!  
And now from the cave:  
The control of gravity has become a little complicated, but now I can throw the gold bags and the pickaxe through the elevator hole, so that if the guard is below it we can knock him out haha.

[11:18](#msg5cb0740320fbe911eea1ea2f)\[!\[cavetest16.gif](https://files.gitter.im/red/red/gui-branch/ro8Z/thumb/cavetest16.gif)](https://files.gitter.im/red/red/gui-branch/ro8Z/cavetest16.gif)

rebolek

[11:19](#msg5cb07451a0790b29c9a406d6)@planetsizecpu better and better!

planetsizecpu

[11:20](#msg5cb07493759abc043cabf776)Thx all, I'm learning a lot, but I'm enjoying much more!

toomasv

[13:05](#msg5cb08d0ea0790b29c9a4b6ff)@Claudio08 One way is to change system template, e.g.:

```
append system/view/VID/styles/text/template [
    font: make font! [
        color: red size: 20 name: "Courier New"
    ]
]
```

[13:05](#msg5cb08d160aad6350196ff7ee)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/49wd/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/49wd/image.png)  
But this change affects only changed styles, of course.

[13:21](#msg5cb090c9759abc043caccc09)Second way is to change `default-font`, but this still needs you to "touch" font facet of styles you want to display this font, e.g.:

```
system/view/VID/default-font: [
    name fname size fsize color fcolor
]
fname: "Courier New" fsize: 16 fcolor: orange 
view [below 
    text "Second way" font [] 
    button font [] "On all styles" 
    tab-panel 200x50 font [] ["A" [] "B" []]
]
```

[13:21](#msg5cb090ce25686a7dc31b9bf0)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/nPwj/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/nPwj/image.png)

greggirwin

[18:47](#msg5cb0dd47f851ee043da8150f)Go @planetsizecpu, go! :^)

## Saturday 13th April, 2019

Claudio08

[09:09](#msg5cb1a75e0aad6350197719b9)@toomasv thanks, i have a lot to learn :-)

toomasv

[09:34](#msg5cb1ad3aa84e0c501a23d374)@Claudio08 You are welcome! (And thanks to your question I just learned these methods myself too :smile:)

[09:51](#msg5cb1b11c25686a7dc323211e)@Claudio08 By the way, second method lets you vary aspects of the custom style, e.g.:

```
system/view/VID/default-font: [name fname size fsize color fcolor]
set [fname fsize fcolor]["Courier New" 8 255.64.64]
view [below 
    text "Very small text" font-size 6 
    button "Bigger, but otherwise same" font-size 10 
    area wrap "And big one, with same custom style" font-size 16
]
```

\[!\[image.png](https://files.gitter.im/red/red/gui-branch/9FrH/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/9FrH/image.png)

[13:01](#msg5cb1ddbff851ee043dae6c24)@Claudio08 And on further thought you might want to use something like this:

```
set-defaults-for-styles: function [styles [block!] defaults [block!]][
    foreach style styles [
        append system/view/VID/styles/:style/template defaults
    ]
]
```

E.g.:

```
set-defaults-for-styles [text area field][
    font: make font! [name: "Courier New" size: 16 color: orange]
]
```

Claudio08

[15:02](#msg5cb1f9eab34ccd69e7b1008f)@toomasv thanks. A lot of usefull solutions

greggirwin

[16:21](#msg5cb20c8f759abc043cb6a16c)@toomasv keep those notes somewhere, or add them to a wiki page. Useful info.

endo64

[16:25](#msg5cb20d731f6e900d5e28eeb2)@toomasv let's create `[NOTES] VID` if there is no already.

[16:25](#msg5cb20d8793fb4a7dc2228bbb)* wiki page.

greggirwin

[16:29](#msg5cb20e7a016a930a45b32e35):+1:

[16:30](#msg5cb20e8f1f6e900d5e28f6e7)https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips

GiuseppeChillemi

[17:57](#msg5cb22314bd70a40d5f4478d9)@toomasv what are you using to make you videos?

toomasv

[18:19](#msg5cb22834c55bd14d35dc7ae0)@greggirwin @endo64 https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips#how-to-set-up-default-custom-font

[18:20](#msg5cb2287f8148e555b29c8856)@GiuseppeChillemi I use \[ScreenToGif](https://www.screentogif.com/)

greggirwin

[20:18](#msg5cb243fa016a930a45b4ae4b)Thanks @toomasv !

## Sunday 14th April, 2019

Claudio08

[05:05](#msg5cb2bfb2c55bd14d35e02570)@toomasv another usefull tip (of the last) to note is to pass data between two windows (https://gitter.im/red/help?at=5caf9bfba84e0c501a161047)

toomasv

[08:37](#msg5cb2f15d759abc043cbbfd24)@Claudio08 https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips#how-to-pass-data-to-second-window

endo64

[13:43](#msg5cb339013ebbdc55b3b77863)@GiuseppeChillemi LICEcap is also useful https://www.cockos.com/licecap/

GiuseppeChillemi

[18:07](#msg5cb376d525686a7dc32e7800)@endo64 thanks

ldci

[20:29](#msg5cb39820a84e0c501a30083a)@rebolek : Faster version for Voronoï diagram in redCV (https://twitter.com/fjephe/status/1117524684092919808)

[20:33](#msg5cb3991493fb4a7dc22c7765)oups: here https://pbs.twimg.com/media/D4I-xAQWkAUXLFQ.png:large

## Monday 15th April, 2019

rebolek

[06:18](#msg5cb42224f851ee043dbd0ea9)@ldci Nice, as always! How much is it faster?

ldci

[08:02](#msg5cb43a7e25686a7dc3332d10)0:036 sec for a 640x480 image with 30 peaks

[09:35](#msg5cb4507293fb4a7dc231172f)@rebolek . With red 20.94 sec and with redCV 00:032 sec for the same image and the same number of seeds. Test on iMac 16Go Ram. I'll write a routine for your code now:)

pekr

[09:37](#msg5cb450bcbd70a40d5f51f3dc)That's quite a speed-up :-)

rebolek

[09:37](#msg5cb450d6bd70a40d5f51f4f0)@ldci Wow!

ldci

[09:42](#msg5cb451fac55bd14d35ea66c8)red/System is really adapted for image processing. redCV updated ASAP

rebolek

[09:43](#msg5cb4524520fbe911eebb16a2)@ldci Voronoi diagram is only a byproduct, I was trying to generate map. So if you know about some simple algorithm, that would be great!

ldci

[11:21](#msg5cb4694ef851ee043dbf0001)@rebolek work on progress : based on your initial simple, I'm writing some red/system routines for distances and map calculations. You can also play with Chamfer Distances that are included in redCV. See /samples/snake/flow.red. Regards

rebolek

[13:51](#msg5cb48c5a0aad6350198a2de2)@ldci Thanks! I'll take a look at it.

ldci

[17:02](#msg5cb4b91325686a7dc336d46f)Voronoï diagram with different distance functions: https://pbs.twimg.com/media/D4NYKFGWkAMge-G.png:large

## Tuesday 16th April, 2019

Claudio08

[09:27](#msg5cb59fe9a84e0c501a3d6c22)Hi, after reading the Red "\[HOWTO] VID and View (GUI) hints and tips" i have tried the following simple code to input only numeric digit in a field, that seem to run.  
But is this the right way? Thanks

```
system/view/capturing?: yes
numeric-key?: function [face event /local digit special ok?] [
	digit: charset ["0123456789,-^(back)"]
	special: charset ["end" "home" "left" "right" "delete"]
	if event/type = 'key [
        either (char? event/key) [ok?: parse to-string event/key [some digit ]]
							     [ok?: parse to-string event/key [some special]]
	   	if not ok? [return 'stop]
	]
]
view/flags [
    title "test"
    text "numeric field"
 	num: field 150 right focus font-size 14 on-detect [numeric-key? face event]
]['resize]
```

toomasv

[10:16](#msg5cb5ab7d25686a7dc33d1af1)@Claudio08 Seems OK, although I would bring `digit` and `special` out of function and not make `special` a charset:

```
context [
	system/view/capturing?: yes
	digit: charset ["0123456789,-^(back)"]
	special: ['end | 'home | 'left | 'right | 'delete]
	numeric-key?: function [face event /local ok?] [
		if event/type = 'key [
			either (char? event/key) [ok?: parse to-string event/key [some digit ]]
									 [ok?: parse to-block event/key special]
			if not ok? [return 'stop]
		]
	]
	view/flags [
		title "test"
		text "numeric field"
		num: field 150 right focus font-size 14 on-detect [numeric-key? face event]
	]['resize]
]
```

As charset, `special` is equivalent to `charset "defghilmnort"`.

Claudio08

[10:37](#msg5cb5b07e016a930a45cb4380)@toomasv thanks. May be that you can add this to "\[HOWTO] VID and View (GUI) hints and tips" because is usefull for others people as readonly field tip. One thing: why you use "context \[ ... ]" and what does it mean? Thanks

[10:54](#msg5cb5b466c55bd14d35f3d3df)@toomasv i found this for Context: "The word context is a shorter form of make object!.

Using context it is very easy to "hide" variables and functions from the global naming scope".

toomasv

[10:59](#msg5cb5b59420fbe911eec48c7b)@Claudio08 Yes, that's the reason to use `context` here - to hide internals from global environment. And not to put these in function - otherwise they will be unnecessarily built again on every keypress.

[11:28](#msg5cb5bc708148e555b2b402a0)@Claudio08 This nice example is your creation, why not put it there yourself?

[11:31](#msg5cb5bd29c55bd14d35f41200)PS. It can be little-bit more contracted, but may-be it loses thus somewhat from its readability:

```
context [
    system/view/capturing?: yes
    digit: charset ["0123456789.'-^(back)"]
    numeric-key?: function [face event] [
        if all [
			event/type = 'key 
			not either (char? event/key) [
				parse to-string event/key [some digit]
			][
				parse to-block event/key ['end | 'home | 'left | 'right | 'delete]
			]
		]['stop]
    ]
    view/flags [
        title "test"
        text "numeric field"
        num: field 150 right focus font-size 14 on-detect [numeric-key? face event]
    ]['resize]
]
```

[13:00](#msg5cb5d1d931aec969e8b58510)Sorry for still chewing it; bare-bones:

```
context [
    system/view/capturing?: yes
    digit: charset "0123456789.'-^(back)"
    numeric-key?: func [event] [
        all [
            event/type = 'key 
            not find either char? event/key [digit][
                [end home left right delete]
            ] event/key
            'stop
        ]
    ]
    view [
        title "Test"
        text right "Numeric field:" 
        field 150 right focus on-detect [numeric-key? event]
    ]
]
```

Claudio08

[13:21](#msg5cb5d6e4016a930a45cc6643)@toomasv i have forgot to put in "digit" also the important "^C^V". The second solution is redable but the last is too sophisticated and not so easy for me as newcomer to Red. Better if you post (I continue to learn) the three examples in "\[HOWTO] VID and View GUI hints and tips" both for newcomer and for Red expert. Thanks for all your time and experience

[13:56](#msg5cb5df0720fbe911eec5ba26)@toomasv The "all" instruction is a real discovery for me and also the use of "not either" and "not find either". I risk of getting lost with the power of Red lang and his developers.

toomasv

[14:18](#msg5cb5e42ea0790b29c9c82e30)@Claudio08 I agree, these are powerful methods. I put these examples in wiki https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips#how-to-create-a-number-only-field . You can edit these if necessary.

Claudio08

[15:47](#msg5cb5f8f593fb4a7dc23cdc92)@rebolek @toomasv hi, a Toggle-Button or Toggle-Switch is available/planned in standard GUI-VID or is completely to code?

9214

[15:49](#msg5cb5f9a0c55bd14d35f5e3fe)@Claudio08 there's a (functionally equivalent) check box.

rebolek

[16:23](#msg5cb60178990feb4518b0feea)@pekr it is already possible, see the article. It's very basic button, I admit, maybe I should write part II and add some fancy stuff.

toomasv

[16:48](#msg5cb6076b3b6cb0686a01de2c)Two toggle buttons:

```
view [button "No" data no [face/text: either probe face/data: not face/data ["Yes"]["No"]]]
```

```
byes: draw 50x25 [fill-pen 128.255.128 box 0x0 49x24]
bno: draw 50x25 [fill-pen 255.128.128 box 0x0 49x24]
view [
    style toggle: base 50x25 data no with [image: bno][
        face/image: either probe face/data: not face/data [byes][bno]
    ]
    toggle "OK" 
]
```

rcqls

[17:29](#msg5cb610f13b6cb0686a0229e6)@toomasv Works on Linux/GTK…. Great!

toomasv

[17:35](#msg5cb612583b6cb0686a0236f8)@rcqls :+1:

greggirwin

[18:03](#msg5cb618df4b4cb471d908a900)Coming from /GTK, on button/border design. Modern software is often bloated because of image assets. We can improve on that with an `extend` effect, which still lets designers control the look. Doesn't have to be 90's style. :^) We can also do it dynamically with `draw`, which really shrinks things down. If standard images are like WAV files, using `extend` is like MP3, and `draw` is like MIDI.

toomasv

[18:20](#msg5cb61cdeb4700e023d820957)The MIDI version:

```
view [
    base 50x25 data no draw [
        fill-pen 255.128.128 box 0x0 49x24 text 15x5 "OK"
    ][
        face/draw/2: pick [128.255.128 255.128.128] probe face/data: not face/data
    ]
]
```

rebolek

[18:21](#msg5cb61d13990feb4518b1d12b)MIDI? I don't see channel select, note on/off message, or any sysex data.

toomasv

[18:21](#msg5cb61d3c990feb4518b1d2de):flushed:

greggirwin

[18:24](#msg5cb61de1ba1e556869dfe23f)@rebolek you just haven't written that part of the dialect yet. `sysex` is your theme, `on/off` is face state, and channel select is event handling.

rebolek

[19:01](#msg5cb62689990feb4518b21249)@greggirwin \[didn't I](https://gitlab.com/rebolek/midi)? :neutral\_face:

greggirwin

[19:34](#msg5cb62e3ae416b845198daf4a)I don't see the VID port in there. ;^)

rebolek

[20:40](#msg5cb63dcb2e2caa1aa66c76d2)Touché.

## Wednesday 17th April, 2019

planetsizecpu

[11:21](#msg5cb70c4fe416b84519938aa9)Hi guys, much news here as I see, push hard all!!! This week the works in the mine have been for code cleaning and adjusting some things. I also wanted to check how the game reacts when the next level is loaded, so I have been able to solve some malfunctions in the elevators, here is the screen of the second level. The programming work has been null because I only had to create a new screen file and locate the objects in their new positions in a new objects file. More to come next week.

[11:23](#msg5cb70ca2b4700e023d881a5c)\[!\[cavetest17.gif](https://files.gitter.im/red/red/gui-branch/5ZeR/thumb/cavetest17.gif)](https://files.gitter.im/red/red/gui-branch/5ZeR/cavetest17.gif)

ldci

[12:31](#msg5cb71c9ba4ef097471b2d8e0)@rebolek Tests for your distance mapping: 50 seeds and 200x200 image.Red: 14.720386 sec. redCV: 00.039959 sec! Thanks for giving me the opportunity to improve distances and mapping functions.

rebolek

[12:31](#msg5cb71cbd375bac7470bc0c19)wow, that's really something!

[12:32](#msg5cb71cf31cd0b8307d28aaf1)@ldci next time I should write it in R/S directly :smile:

ldci

[12:33](#msg5cb71d013b6cb0686a095069)@rebolek I'll update redCV ASAP with your contribution :)

rebolek

[12:33](#msg5cb71d2a990feb4518b863d5)Well it's not my contribution, I just did a small demo and you rewrote it from scratch :)

ldci

[12:34](#msg5cb71d6c5b3f941aa5474ee3)@rebolek But you give me very interesting idea, so normal to credit your job

rebolek

[12:43](#msg5cb71f5a8790b0307eb70932)ok :)

toomasv

[13:21](#msg5cb7283f375bac7470bc5fa1)@rcqls @meijeru \[ast](https://github.com/toomasv/ast)

rcqls

[13:24](#msg5cb72924b489bb6ed77b87c7)@toomasv Thanks I’ll test this gem on Linux ASAP!

toomasv

[13:28](#msg5cb729ed3b6cb0686a09afec)@rcqls Good! I'm going out now, can see your comments in few hours

rcqls

[13:31](#msg5cb72aad2e2caa1aa672bde3)@toomasv As a really quick comment, you forgot to clean: `*** Access Error: cannot open: %/C/Users/Toomas/Documents/Red/rich-text/info.red`. But nothing major since it is easy to fix … Have fun!

toomasv

[13:43](#msg5cb72d798790b0307eb76ce6)Aargh! Sorry, it may cause problems as I changed my local `info.red`. But I am out already, can’t change now.

rebolek

[13:44](#msg5cb72da6a4ef097471b35173)Just give us password for your machine and we can change it for you remotely :smirk:

rcqls

[13:45](#msg5cb72de73d78aa6c034b096a):smile:

[14:00](#msg5cb73187990feb4518b8fb10)Tested on macOS and Linux with utils/info.red but you are right… it does work. There is no rush!

[15:31](#msg5cb746de3b6cb0686a0a89da)Oups… it does not work...

meijeru

[15:44](#msg5cb749f16a84d76ed8ac1c2d)At first sight it works even with the old info.red.

[15:54](#msg5cb74c1a5b3f941aa5489ae5)But... it says "only function types accepted" when I give it a full program, or an object, amongst others..

Oldes

[16:26](#msg5cb7539de416b8451995a31d)The \[definition of gradient colors is flat](https://doc.red-lang.org/en/draw.html#\_linear\_gradient\_pen) now and looks like:

```
fill-pen linear 255.255.255 0.0 95.175.223 0.5 47.95.223 1.0 0x0 0x480
```

Isn't nicer and more practical the Rebol3 variant, where colors are in block? So it would look:

```
fill-pen linear [255.255.255 0.0 95.175.223 0.5 47.95.223 1.0] 0x0 0x480
```

[16:26](#msg5cb753d33b6cb0686a0aeb96)as there may be up to 256 colors, I think that you would like to have them in separate block, no?

[16:29](#msg5cb7546b6a84d76ed8ac71e2)(256 colors in R3.. how many colors may be defined for gradient in Red?)

meijeru

[16:38](#msg5cb756745b3f941aa548e89f)From the Draw documentation:

Inside Draw code, commands can be arbitrarily grouped using blocks. Semantics remain unchanged, this is currently just a syntactic sugar allowing easier group manipulations of commands (notably group extraction/insertion/removal). Empty blocks are accepted.

Oldes

[16:45](#msg5cb7580f8790b0307eb8a042)I don't know. You definitely cannot use block of colors like I described above.

[16:46](#msg5cb758553b6cb0686a0b125b)Hm... this works:

```
[fill-pen linear 255.255.255 0.0 95.175.223 0.5 47.95.223 1.0 0x0 0x480]
```

9214

[16:52](#msg5cb759c03d78aa6c034c418e)@meijeru "command" here is anything that starts with Draw keyword, I guess.

meijeru

[16:56](#msg5cb75ad76a84d76ed8aca502)If so, then that merits to be more clearly stated

Oldes

[17:05](#msg5cb75cf4b489bb6ed77cfcd3)I still think, that colors should be in separate block.

9214

[17:20](#msg5cb76056990feb4518ba58ff)I propose for `event/picked` to hold 1-based caret position for `field` (and perhaps `area`) faces. Currently it's an `integer!` representation of `char!` key. Thoughts?

toomasv

[19:08](#msg5cb7799d8790b0307eb9963b)@rcqls @meijeru \[Corrected](https://github.com/toomasv/ast). Also noticed that op!-s are not correctly placed and other bugs.

rcqls

[19:33](#msg5cb77f80375bac7470bee158)@toomasv First test on macOS, and it works… :clap:

toomasv

[19:34](#msg5cb77fd4e416b8451996f367):+1:

rcqls

[19:36](#msg5cb78020b4700e023d8b4094)@toomasv But not yet in Linux/GTK… New interesting challenge!

toomasv

[19:36](#msg5cb7804d2e2caa1aa6753ad8)I am sure you will master it in no time!

rcqls

[19:37](#msg5cb78083990feb4518bb4ad2)Hope so!

greggirwin

[19:50](#msg5cb783865b3f941aa54a1f6e)@Oldes I don't see a problem with also supporting blocks for colors. We need @dockimbel or @qtxie to sign off on removing the current syntax, if you propose that as well.

I haven't worked on the `draw` code, but it looks like your targets are `old-gradient-pen` and `check-pen` at least.

[19:59](#msg5cb785bf6a84d76ed8ade26a)@9214, for `event/picked` it would be nice to have the caret position for mouse events. `Selected` could be a block for start/stop positions. For `key` events, `picked` doesn't really have meaning, and you should use `event/key`. Having `picked` be the integer equivalent, as it is now, seems more confusing than useful.

GiuseppeChillemi

[21:09](#msg5cb796228446a6023e31a545)@toomasv https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips#how-to-pass-data-to-second-window Seems not a viable solution. I have many doubts (note, during the first phase of I am working on REBOL):  
I have a function which composes (using "append", no "compose") a layout made of text list with some buttons. The gui, once opened, could call the function which generates itself to create a child window. Child windows could be infinite. Data from the last windows of the windows tree should reach the main code if needed.

Also I don't know if generating the child windows this way and having all face set-words sharing the same name as the main one (myfield: field "Enter something") I could have some problems with VID as they are not isolated contexts....

## Thursday 18th April, 2019

toomasv

[03:57](#msg5cb7f5978446a6023e33fc28)@GiuseppeChillemi Sure, it is not a solution to any specific need, just a lame example of a possibility. Adapt it to your needs or cook a new one.

GiuseppeChillemi

[04:37](#msg5cb7ff178790b0307ebcd4fb)@toomasv it is a good start but raises some questions: the object self initializes when the interpreter encounters it executing the code

[04:43](#msg5cb8005e3b6cb0686a0f6f06)The executed code is 'view lay:'

[04:45](#msg5cb800d5a4ef097471b8df15)So if I need to reuse it should LAY be dynamic?

[04:50](#msg5cb80203375bac7470c2188a)Be back later with some code

rebolek

[05:45](#msg5cb80eee4b4cb471d915cca5)`block!` for colors sounds interesting, but I vote for leaving current syntax as possibility too. For simple 2-3 color gradient, block is unnecessary overhead.

[06:23](#msg5cb817ea3d78aa6c03512827)Second attempt at map making:

[06:24](#msg5cb8182ce416b845199ad6c3)https://i.imgur.com/6eA73WV.png

rcqls

[06:38](#msg5cb81b7a8446a6023e34f1f8)@toomasv « No time » will be a dream… But as usual, your new ast project helps a lot in the improvement of linux/GTK since it is not a toy example at all. First improvement is rounded box (not needed from now!). Thanks!

toomasv

[06:44](#msg5cb81cc54b4cb471d916258c)@rcqls Glad to hear you have something to sharpen GTKs' teeth on!  
@rebolek Obviously you took a picture of a late snowstorm!

rebolek

[06:52](#msg5cb81ec14b4cb471d916356c):)

[06:55](#msg5cb81f6ca4ef097471b9ab6c)First cells, now snowstorm, still not a map :/

GalenIvanov

[06:57](#msg5cb81ff68446a6023e350eb8)@rebolek Nice snowstorm :) In the demoscene there was an effect called "directional blur" - blur an image according to a map (I don't remember the details, but one color channel could be used for distance, another for angle and the third one - for amount. You can try to recreate it in Red.

rebolek

[07:00](#msg5cb820a7e416b845199b0d9f)@GalenIvanov I'm going to try Perlin noise, let's see what comes out of that :)

GalenIvanov

[07:01](#msg5cb820d6b4700e023d8f337b)@rebolek OK, nice target - it can be used for many effects

Phryxe

[07:05](#msg5cb821c53d78aa6c03516ced)@rebolek Interesting experiments! Snowstorm :snowflake: or close-up of som sort of fabric :dress:

GalenIvanov

[07:07](#msg5cb8224ea4ef097471b9c1e1)@toomasv Good work on the ast!

toomasv

[07:10](#msg5cb822d78446a6023e3520e2) @GalenIvanov Thanks!

ldci

[08:04](#msg5cb82fa92e2caa1aa6798486)@rebolek : Now with colors https://drive.google.com/file/d/16kgqTApqRZ36qdeEZCbYoAmNMlLKTgsx/view?usp=sharing

rebolek

[08:05](#msg5cb82fcb3d78aa6c0351d3d8)wow, that's really nice!

ldci

[15:57](#msg5cb89e7b4b4cb471d919cd67)@rebolek Code is here: https://drive.google.com/file/d/1ChDWfGUPMBygS2RRuh5RHFeiBjwiGL37/view?usp=sharing

## Friday 19th April, 2019

greggirwin

[21:52](#msg5cba4312b489bb6ed790897d)I thought Bolek's image was more an ocean than a snowstorm.

Really nice @ldci !

## Saturday 20th April, 2019

rcqls

[02:26](#msg5cba83674b4cb471d9266e23)@ldci Nice to have your code still working on Linux Red/GTK (eventhough you are using image/acquire-buffer in routine). Your code is amazingly pretty simple to get an amazingly wonderful result. :clap:

ldci

[08:10](#msg5cbad3ef6a84d76ed8c3b23e)Thanks for comments. But initial code comes from Boleslav. Nice to see that it ´s working under Linux. So Voronoi Diagrams are ready for RedCV lib.

[18:08](#msg5cbb6030990feb4518d48436)Done for RedCV

rcqls

[18:13](#msg5cbb61668446a6023e4a80df)Great! (Not yet in your repo redCV?)

ldci

[18:24](#msg5cbb63e2b4700e023da4bf1a)Not yet but next week

rcqls

[18:25](#msg5cbb640c97dcb371d8e59dba):ok\_hand:

## Tuesday 23th April, 2019

planetsizecpu

[12:50](#msg5cbf0a2c6a84d76ed8df3c13)Hi guys, it's been a hard week in the cave. Today I started my first attempt with the guard, at the moment the search function only uses the horizontal parameter, it is not much, but it helps me to adjust the movement functions of the guard and also the behavior in the elevator, this last function is curiously it has been simplified a bit, which means that it was not well defined. Now I have a battery of tests to check (= play :-)), then I will attempt on two axes. For now I leave here an example for your enjoyment.

[12:53](#msg5cbf0ac52e2caa1aa6a66949)\[!\[cavetest19.gif](https://files.gitter.im/red/red/gui-branch/1ORt/thumb/cavetest19.gif)](https://files.gitter.im/red/red/gui-branch/1ORt/cavetest19.gif)

greggirwin

[20:29](#msg5cbf75bb3b6cb0686a401c17)I like that the guard marches in place on the elevator. :^)

## Wednesday 24th April, 2019

planetsizecpu

[10:35](#msg5cc03c05990feb4518f43488)I do too, today I made some improvements, now the guard run away if the boy has the pickaxe, and can be hit to die, so as the boy has 3 lives I decided to give the guards 6 lives. There is also some free benefit, for example the wheelbarrow now has gravity, and can be thrown by the elevator hole without any coding, later I'll have to check for guards get hurt by them and the gold bags, haha. I also noticed the boy died by walking guard while travel in the kart, when it should be the opposite, this kind of checks require more playing :-)

rebolek

[10:36](#msg5cc03c3f6a84d76ed8e78842)@planetsizecpu how big is the source?

planetsizecpu

[10:37](#msg5cc03c5e97dcb371d8059198)\[!\[cavetest20.gif](https://files.gitter.im/red/red/gui-branch/I0kr/thumb/cavetest20.gif)](https://files.gitter.im/red/red/gui-branch/I0kr/cavetest20.gif)

[10:39](#msg5cc03ccc6a84d76ed8e78c4d)@rebolek +- 1.120 LOC ---&gt; 35kb w/o images, complete it raises to 17Mb.

rebolek

[10:40](#msg5cc03d0e5b3f941aa5831c47)Thanks

planetsizecpu

[11:47](#msg5cc04cb56a84d76ed8e802e7)This is level 2 now with two guards running more faster, It is a point on guards rate while they speed up a lot, so we are caught so quick and we can't play

[11:48](#msg5cc04cfc6a84d76ed8e803dd)\[!\[cavetest21.gif](https://files.gitter.im/red/red/gui-branch/YcBd/thumb/cavetest21.gif)](https://files.gitter.im/red/red/gui-branch/YcBd/cavetest21.gif)

Oldes

[15:45](#msg5cc084804b4cb471d94daebf)Should not be `draw` command screen scaling independent? Imagine this code:

```
fnt: make font! [name: "Sans" size: 72 color: black]
save %/x/img.png draw 480x480 [font fnt text 10x10 "hello"]
```

The text size is actually 103px when display scale on Windows is set to 150% (144dpi) and 72px with 96dpi.

9214

[15:56](#msg5cc0872a97dcb371d807ca2e)@Oldes https://github.com/red/red/issues/3725 ?

Oldes

[16:00](#msg5cc0882c990feb4518f64975)That is not exactly the same... because all the content of the view is scaled.. which may be good for someone (and for someone not) would be good to have the scaling optional. In my case I draw directly to image which has exact size given in pixels. It should be possible to have same result even when someone is using screen scaling. I know I can modify the font size to deal with the DPI, but is this expected?

greggirwin

[17:45](#msg5cc0a0a23d78aa6c038a6850)@qtxie will be the best one to answer that.

qtxie

[21:01](#msg5cc0cea6375bac7470fca73f)@Oldes I think it's a bug when drawing text.

## Thursday 25th April, 2019

ldci

[12:52](#msg5cc1ad9c97dcb371d80f86d2)redCV update is here : https://github.com/ldci/redCV

greggirwin

[16:59](#msg5cc1e7568446a6023e75e643)Thanks @ldci !

## Friday 26th April, 2019

Claudio08

[14:18](#msg5cc313354b4cb471d95f74ce)@rebolek @toomasv Hi, i think that the following code with "base" has the same problem of the code with "panel" described here:  
(https://gitter.im/red/red/gui-branch?at=5ca23be1a84e0c501abbe0c0)  
I alredy resolved with the suggestion of Toomasv here  
(https://gitter.im/red/red/gui-branch?at=5ca24a2d016a930a4546a981)  
thanks

```
view [
backdrop black
       style pv: base 40x200 white with [
			pane: append [] layout/only [
	   		   origin 2x2
               below
			   space 2x2
               base 38x20 center 
               base 38x20 center 
			   base 38x90 top 
			]
	        extra: context append []  [
			set-text: func [face t c][
					repeat ix 3 [face/pane/:ix/text: t/:ix face/pane/:ix/color: either c = 1 [gold] [orange]]
            ]] 
	]		
p1: pv	on-create[p1/extra/set-text p1 ["111"  "222" "333"] 1]
across
p2: pv	gray on-create[p2/extra/set-text p2 ["444"  "555" "666"] 2]
across
p3: pv	on-create[p3/extra/set-text p3 ["aaa"  "bbb" "ccc"] 1]
]
```

## Saturday 27th April, 2019

planetsizecpu

[18:18](#msg5cc49d07a4ef0974710c88aa)Hi guys, this week there have been deep changes in the galleries, the behavior of the guards made it necessary, also the stairs have changed color. Now the guards are also going vertically and they can come out of dead ends, but I still have to improve the behavior. Now the pickaxes have an individual timer of about 40 seconds, when time is over they disappear. I think next week could upload to git as alpha, so people who want could play and test.

[18:20](#msg5cc49d8ab489bb6ed7d5eee7)\[!\[cavetest24.gif](https://files.gitter.im/red/red/gui-branch/38BV/thumb/cavetest24.gif)](https://files.gitter.im/red/red/gui-branch/38BV/cavetest24.gif)

fergus4

[20:58](#msg5cc4c282e416b84519ef7029)@toomasv Thanks for the scroll snippets! Exactly what I was looking for.

[21:30](#msg5cc4c9dd375bac747017750f)In rebol 'text will wrap if exceeds the set size but not in red. Is there a way to wrap the text to the container width?

9214

[21:32](#msg5cc4ca64b489bb6ed7d7298c)@fergus4 `face/para/wrap?` and \[`wrap`](https://doc.red-lang.org/en/vid.html#\_wrap).

fergus4

[21:41](#msg5cc4cc7ee416b84519efb46d)I'm sorry it does wrap but it gets cut off vertically unless I set the height longer then the wrapped text but I do not know ahead of time what that size will be.

greggirwin

[22:16](#msg5cc4d4b0b489bb6ed7d77706)Can you provide an example @fergus4? Seems OK to me.

```
view [text "aaaa aaaa^/bbbb bbbbbb^/cccc cc cc^/ddddd ddd dddd ddd^/"]
```

[22:17](#msg5cc4d4ff8446a6023e8954cd)Ah, I get it now, not line breaks, but wrapping cause it.

[22:22](#msg5cc4d6433b6cb0686a64632c)There are a number of tickets related to `size-text`, but I can't find one for this specific issue. https://github.com/red/red/issues/3760 is close.

Please file a ticket with an example @fergus4.

fergus4

[22:53](#msg5cc4dd751cd0b8307d83fd3e)Sure. Did not know if it was a bug or intended. There are a lot of small differences between rebol and red its hard to know when its been re-thought out and changed intentionally. Thanks

## Sunday 28th April, 2019

toomasv

[04:56](#msg5cc532668790b0307e142485)@fergus4 You are welcome!

[06:17](#msg5cc5458f4b4cb471d96ddc35)@fergus4 Work-around for `text` wrap problem:

```
view [
    text wrap 100x100 {Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.} 
    on-created [face/parent/size: face/size: 10 + size-text face]
]
```

Calculation is still wrong but doesn't cut the text. It's better with `rich-text`.

[06:29](#msg5cc548523d78aa6c03aa1079)Sorry, typo `face/parent/size: 10 + ...`

[08:37](#msg5cc5664a6a84d76ed80ac44e)Better yet (on W10):

```
on-created [face/parent/size/y: 20 + face/size/y: to-integer 89% * second size-text face]]
```

fergus4

[13:46](#msg5cc5aebd3d78aa6c03acc132)I'll try yours out too. I had a work around too but its not elegant...Problem is I'm parsing a document and building and populating the panel with other faces as I move through it so I'm not sure if I can use the on-create function. My fix gets the text face size using layout. Not perfect but good enough for now.

## Monday 29th April, 2019

guaracy

[15:24](#msg5cc7171d97dcb371d8337066)After `clear` and `append`, values in text-list are shown in reverse order. Does't occurs in the gtk . Is it a bug or i'm doing something wrong?  
\`

[15:24](#msg5cc717383b6cb0686a73637f)Ops.

```
Red [ Needs: 'view]

a: ["a" "b" "c" "d"]
b: ["1" "2" "3" "4"]

view [
    l: text-list data []
    [
        print ["Selected " l/selected " : " l/data/(l/selected)]
    ]
    button "Clear/Append" [
        clear l/data
        append l/data b
        append l/data "Oops"
    ]
    do [
        ;clear l/data
        append l/data a
    ]
]
```

endo64

[15:58](#msg5cc71f0cb489bb6ed7e6c52d)I'm on mobile so cannot test, but if it is as you described then it should be a bug. Can you `probe b` to see if the `b` is reversed? And let's wait someone test too.

greggirwin

[16:49](#msg5cc72b2197dcb371d834032c)At a glance, it appears that the face is not refreshed properly. If you add `show l` after changing the data, it's correct. No data is reversed.

[16:51](#msg5cc72b78e416b84519ff4f13)Internally, items have to be added individually via the OS API, but I don't remember seeing this problem before.

guaracy

[18:55](#msg5cc748881cd0b8307d9427c2)Yes @greggirwin . When selected, `print` show the correct value. Works fine if changed by `l/data: copy b`.

greggirwin

[20:07](#msg5cc7598d5b3f941aa5b2ebd1)@guaracy please open a ticket for this, so @qtxie can review and decide on what action to take.

## Tuesday 30th April, 2019

planetsizecpu

[11:53](#msg5cc83735e416b845190676a4)Today just released the \[Cave](https://github.com/planetsizecpu/Cave-In) game as alpha, the development continues but if someone want to play now we can. Have fun! :)

endo64

[15:05](#msg5cc8642b8790b0307e2a0b09)Cool! @planetsizecpu

toomasv

[16:30](#msg5cc878416a84d76ed8205723)@planetsizecpu Fantastic! Guard went crazy. Cool!

planetsizecpu

[16:41](#msg5cc87aca990feb45182c3942)Thx guys, all I need is time for debug and I'll take care!

greggirwin

[17:53](#msg5cc88b875b3f941aa5bb46ca)Thanks @planetsizecpu!

planetsizecpu

[19:32](#msg5cc8a2dbe416b84519099f36)You're welcome!

guaracy

[21:22](#msg5cc8bc7f990feb45182e1827)Nice @planetsizecpu  
Just two tips:  
\- Some OSs differentiate lower and uppercase so, in you game, `do %loadlevel.red` will not work on Linux.  
\- Red have a coding style guide. Better avoid CamelCase words.  
https://doc.red-lang.org/en/style-guide.html#\_naming\_conventions

## Wednesday 1st May, 2019

planetsizecpu

[07:52](#msg5cc950494b4cb471d989a098)@guaracy Thx, you're right, better to uppercase these statements.

On the CamelCase, it is my tendency of so many years to write code, while saving some bytes eliminating symbols like - or \_. More over, with my habit of writing long variable names that I learned with Cobol. The fact is that now I like the CamelCase even though it does not follow the coding style, so yes, better avoid it but ... :-)

rcqls

[08:01](#msg5cc952742e2caa1aa6eb9bc2)@planetsizecpu (I think) `#include` already calls `do` in interpreted mode so `#include %LoadLevel.red #include %MakeGame.red` is enough to load your libraries.

planetsizecpu

[09:30](#msg5cc9674697dcb371d843b102)@rcqls Thx, I was not aware of this change, now updated on git, also changed name of upper case files to lower case.

I commented on line 23 of the cave.red file, a strange behavior of the compiler, which gives an error if the `image` field is not defined, when there are other fields not pre-defined. Can you please try to compile the cave.red program with this line as `PlayerFace: object []` in the release mode for windows target? I just want to verify that it is not a memory corruption problem in my computer. There as been the first time I did compile the sources. I get this: Compiling C:\\redlang\\newcave\\cave.red ...  
\*\** Compilation Error: word image not defined in GameData/PlayerFace/image:  
\*\** in file: C:\\redlang\\newcave\\cave.red  
\*\** near: \[]

AiguyGary\_twitter

[10:59](#msg5cc97c065b3f941aa5c18e1b)When we get error messages like near:\[] would it be possible to give the line number in addition?

endo64

[11:58](#msg5cc98a0297dcb371d844ad3c)Nope, it is not possible to get line number. After `load`ing a block there are no line numbers. Think also about dynamic blocks.

rcqls

[16:26](#msg5cc9c8a85b3f941aa5c3e378)@planetsizecpu Tested on red/GTK and it seems to work when I changed the rates for Karting and Lift to 0.001 instead of 0.0001 (otherwise I received a beautiful empty frame). I don’t know yet by the way if it is a Red/GTK issue or it is related to my use of red/GTK inside a docker container. :clap:

planetsizecpu

[17:47](#msg5cc9dbc6e416b84519122213)@rcqls Great!, the rate issue maybe related to processing speed of container. Last week I got different performance on w10 machines related to processor speed, the guards arriving at the same place with some retard in slower machine, but was no necessary to change rates, so thx for testing!

## Thursday 2nd May, 2019

rcqls

[05:39](#msg5cca82a35b3f941aa5c8d41e)@planetsizecpu Finally, this was a lilitation of GTK :`interval: the time between calls to the function, in milliseconds (1/1000ths of a second)`. So I applied a change to red/GTK to have the rate fixed at 1 millisecond when it is provided lower than 1 millisecond.

planetsizecpu

[09:44](#msg5ccabc0f3d78aa6c03cf9112)Ah! I understand. This morning I updated the lifter function to remove old birdcage-shape jumping behavior, now not needed, (the change of shape also gave multi user capability to lifters haha) also improved the walls detection points to avoid corners black box overlap by moving faces, and added agents dead by falling barrow. I will play for a while with the actual sources to see if it is stable, and maybe will add the L3 level if all goes right, while new levels can help to detect malfunctions, then I will continue development.

## Friday 3th May, 2019

loziniak

[16:14](#msg5ccc68f7b489bb6ed70c5c8d)Hi! Is there any way to reflect panel's layout options (\*origin\*, \*space\*) from face tree? There is `face/options/vid-align` so maybe panels could have `face/options/vid-origin` and `face/options/vid-space`?

greggirwin

[20:35](#msg5ccca5f9990feb451849620c)Those values are only used during the layout, but it's an interesting idea. Dynamic layouts could use it effectively. Let's see what others think.

## Saturday 4th May, 2019

planetsizecpu

[08:26](#msg5ccd4c9a6a84d76ed841e598)I'm not quite sure of its usefulness, but what it is adding up does not usually subtract, (except the negative things by its nature) so ... yes +1 to reflect the options, I love dynamic things :-)

[11:24](#msg5ccd767297dcb371d8600822)\[!\[cavetest31.gif](https://files.gitter.im/red/red/gui-branch/NsP4/thumb/cavetest31.gif)](https://files.gitter.im/red/red/gui-branch/NsP4/cavetest31.gif)

[11:24](#msg5ccd7677e416b845192b1692)Today's test on level 3, hope you like it :-)

endo64

[12:37](#msg5ccd87704b4cb471d9a72dc9)Sweet!

toomasv

[15:20](#msg5ccdadafb489bb6ed714fe54)@planetsizecpu Gorgeous!

greggirwin

[17:04](#msg5ccdc615e416b845192d2721)Nice!

## Monday 6th May, 2019

planetsizecpu

[17:12](#msg5cd06af23d78aa6c03f66f82)Today I thought that being a mine, you can not miss the wildlife of these holes, so I put some spiders to make it more interesting, of course the bites do not kill the guards :-)

[17:13](#msg5cd06b3697dcb371d873fccb)\[!\[cavetest32.gif](https://files.gitter.im/red/red/gui-branch/cY6l/thumb/cavetest32.gif)](https://files.gitter.im/red/red/gui-branch/cY6l/cavetest32.gif)

[17:18](#msg5cd06c4a5b3f941aa5f12927)The first time the boy is biten it get crouch, the next they kill the boy.

endo64

[17:40](#msg5cd0719b6a84d76ed856dca3)Haha nice :)

greggirwin

[19:55](#msg5cd0914f2e2caa1aa61cfd01)Fun stuff.

## Tuesday 7th May, 2019

toomasv

[03:12](#msg5cd0f781b4700e023d3521f4)@planetsizecpu I love the "red-lang" crane. Can the address be made into link?

planetsizecpu

[06:49](#msg5cd12a646a84d76ed85bc35a)@toomasv I have seen some propaganda on cranes in my town, so I decided to have one in the cave, but I don't know how to link it to an address, as the whole screen is a bitmap.

rebolek

[06:51](#msg5cd12adf375bac74706c60fd)@planetsizecpu in `on-up`handler check if mouse offset is within the area where the banner is located and if yes, open link.

planetsizecpu

[06:54](#msg5cd12bb96a84d76ed85bcbd7)@rebolek ah! you mean by code, ok I understand, I will see how to fit it into the main loop, Thx!

[08:45](#msg5cd145abb4700e023d374d92)@toomasv @rebolek Ok, two files updated, the browser opens as we click on banner.

[08:48](#msg5cd1464c3d78aa6c03fc6297)I have the idea of drawing the silk thread while the spider falls, I wrote the function to do so, but modifying image files seems not work by now.

rebolek

[08:50](#msg5cd146c1375bac74706d181c):clap:

toomasv

[08:50](#msg5cd146e78446a6023edd8a24)Nice! I have to fight myself to upper levels to try it out.

planetsizecpu

[08:51](#msg5cd147062e2caa1aa621ae67)@toomasv just read the code and you will find a fast path! haha ;-)

toomasv

[08:51](#msg5cd1472c2e2caa1aa621af49):smile:

## Thursday 9th May, 2019

planetsizecpu

[06:53](#msg5cd3ce82b149ca50985d73e9)I decided to incorporate the woman on the cave, don't want to disappoint anybody, but leaving aside the pickaxe use, I am a gentlemen.

[06:54](#msg5cd3ceb4f251e60ffa4e29b5)\[!\[cavetest34.gif](https://files.gitter.im/red/red/gui-branch/VSX9/thumb/cavetest34.gif)](https://files.gitter.im/red/red/gui-branch/VSX9/cavetest34.gif)

greggirwin

[07:00](#msg5cd3d01d79d70050993d38f6)Ouch! '^)

toomasv

[07:19](#msg5cd3d47179d70050993d5740)She got out of the game pretty quickly...

planetsizecpu

[07:26](#msg5cd3d6350824230a7703a0b4)You must keep an eye when no pickaxe, she is so quick and catches you! :)

BeardPower

[10:12](#msg5cd3fcfcb149ca50985ed5e9)This is clearly rated M for mature!

planetsizecpu

[11:44](#msg5cd4129b5a887e1cd9b9fd57)@BeardPower haha, you're right.

Now I'm working in a new level, L4 to L6 will be a very different scenario with same engaging rules, but I want to take it easy and calm, next week more news :-)

greggirwin

[15:29](#msg5cd44770bdc3b64fcf192ec1)It's fun to see the new levels appear.

[15:30](#msg5cd4478af52a237516024e27)Have you written yourself an editor, or helpful tools, for creating them?

toomasv

[15:44](#msg5cd44adc0f381d0a7688cad5)Yet another \[color-picker](https://gist.github.com/toomasv/0a1495870d27a97073c3b94374a2c572) (\[gif](https://toomasv.red/images/Colors/color-picker2.gif))

rcqls

[16:29](#msg5cd4555ae7f42160fa5e5351)@toomasv :clap: (only `event/window/text` is missing for linux and also for macOS).

toomasv

[16:40](#msg5cd457e30824230a7707a14d)@rcqls Does `face/parent/text` work?

rcqls

[16:43](#msg5cd458976fd7c11cd88c43c8)@toomasv yep for both MacOS and Linux!

toomasv

[16:43](#msg5cd458a48fcdb05d47a8a833):+1:

rcqls

[16:44](#msg5cd458d25d48a24fd09c47cc)But I think it is good to fix the issue for Linux...

toomasv

[17:22](#msg5cd461ef5d48a24fd09c8e79)Sure!

moliad

[17:49](#msg5cd468328fcdb05d47a918a9)@toomas I've been looking at the two-years worth page and its awesome...  
I seem to recall you building small interactive PARSE testers but don't seem them... are they from another author or are they simply in another place?

rcqls

[18:01](#msg5cd46ae9252dbb75152b6f2a)@toomasv `event/window` working for GTK/linux now.

planetsizecpu

[18:01](#msg5cd46af6f251e60ffa52e83b)@greggirwin No, I use pbrush alone to draw the cave. First the margins rectangle, then locate lifters and kart holes and cables, draw the edge zone, locate stairs and arrange objects in the config file, finally play and test. Some important rules to work properly, the height of the cavern must be about 50 pixels if it has kart and handle in order to work the jumping function. The stairs must be located carefully, they need to be at some floor distance from walls not being margins, so guards are able to exit a dead end, and the ceiling must be about 45 pixels over the stair if it has start down one, to allow the guards stop climbing the stairs when they detect ceiling. All these stuff are fixed numerical values, I want to change that code by using some parameter words in global context. I have already tested to modify these global values by inserting code in the config file and setting it while loading by `set to-word ...` for example the `TerrainColor` one, that allow different scenario colours, as this code: `& TerrainColor 220.242.248.0` :-)

@toomasv good job!

greggirwin

[18:25](#msg5cd47090e7f42160fa5f18c7)@planetsizecpu thanks for the design notes! It's interesting, not just in games, how we often look for high tech solutions when a simple approach (even if imperfect) gets the job done well, and is easy to understand and reason about. I like it.

I created a skin designer for Rebol/IOS many years ago, which was easy because you just had to design bitmaps that had fixed portions, and an area that the `extend` effect was applied to.

[18:31](#msg5cd471f579d70050994230e6)OK, @toomasv, you are as cruel as @planetsizecpu was just kind. No comments on how your color picker magically changes shape! Going to watch it again...

An article (which I know \*you* won't write ;^)) would be very cool, showing different color picker models, talking about their strengths and weaknesses, or where they can be helpful. Discrete steps, like this one, make it easy to see color relationships, as you might want for selecting multiple colors in a theme. And the background color option as well. So cool.

rcqls

[18:46](#msg5cd4759c6fd7c11cd88d1d36)@toomas, substituting in your `picbrowser.red`, `parse read to-url` with `parse to "" read/binary to-url` makes it working in both Linux and MacOS. I realized the problem with your new example `image-viewer2.red` that fails with the error message:

```
*** Access Error: invalid UTF-8 encoding: #{B9F40000}
*** Where: read
```

toomasv

[18:53](#msg5cd4770f0824230a77088e0e)@moliad Thanks! Do you mean \[this one](https://gitter.im/red/sandbox?at=5a015f28614889d4754c2550)? I played with it a bit more, but looked now on the code (local) and it is a mess. I'll try to clean it up and post somewhere ... in some time.  
@greggirwin Sorry for missing comments! I know I'm bad on that, but I still hope to improve. :flushed:  
@rcqls Thanks for the note!

[19:01](#msg5cd479185a1d435d46130ed3)Basically, it is filtering predefined colors (step 32) according to conditions on top row, and then positioning color according to its rgb values. As on some conditions there are dark and light values on same positions "Reverse" is used to reorder circles.

greggirwin

[19:28](#msg5cd47f7379d700509942899e)Aha, it could be a fun visualization tool for colors and their relationships.

endo64

[20:53](#msg5cd4935b0f381d0a768aebe0)@greggirwin Remember, when you ask @toomasv to write an article last time, a snake popped out :)

greggirwin

[21:14](#msg5cd4982956271260f934544f)Yikes! That's right.

moliad

[21:50](#msg5cd4a0b9f251e60ffa546ce5)@toomasv that's a link to a python regexp page... is that what you meant?

## Friday 10th May, 2019

toomasv

[03:35](#msg5cd4f1720824230a770bd526)@moliad Sorry for messing up the link! Here's the initial version: https://gitter.im/red/sandbox?at=5a186c0bffa3e37919b6727b (\[pic](http://vooglaid.ee/red/parse-viz1.png))

planetsizecpu

[07:32](#msg5cd5290dda34620ff917a926)Ah! you're right @greggirwin we must supply some info and tech data to share knowledge, I had time to write a little schema of how the game works from high level view.

[07:32](#msg5cd5291479d7005099470993)\[!\[Schematic.png](https://files.gitter.im/red/red/gui-branch/VNAl/thumb/Schematic.png)](https://files.gitter.im/red/red/gui-branch/VNAl/Schematic.png)

toomasv

[07:35](#msg5cd529c15a1d435d4617a6c1)@planetsizecpu :+1:

gltewalt

[08:50](#msg5cd53b60bdc3b64fcf1fe04f)Instead of articles, you could make videos narrating what you’re doing and your thought process.

rebolek

[08:56](#msg5cd53ca8f251e60ffa5876f3)I prefer articles.

planetsizecpu

[09:47](#msg5cd548b15d48a24fd0a2bb38)I prefer to code, but time is not on my side, so I tend to write as much comments as I can in my scripts (because we are not alone, and other reasons), so by reading the sources help a lot.

GiuseppeChillemi

[13:09](#msg5cd577f00824230a770f8546)@toomasv have I missed the release of https://toomasv.red/images/Graph/vid-tree.gif asd?

[13:09](#msg5cd5781af52a2375160ac67e)Or it is still work in progress?

toomasv

[13:13](#msg5cd578fdf52a2375160acdbb)@GiuseppeChillemi It is work in (eternal) progress, but accessible \[here](https://github.com/toomasv/ast)

GiuseppeChillemi

[15:26](#msg5cd59809b149ca50986ab9a0)@toomasv I wish to try it ! Thanks

toomasv

[16:35](#msg5cd5a866f52a2375160c493a)You are welcome!

moliad

[17:01](#msg5cd5ae4eda34620ff91ba166)@toomasv yep, but did you have more complex examples? something like what we are messing around with:

[17:01](#msg5cd5ae58da34620ff91ba17a)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/Fu7m/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/Fu7m/image.png)

toomasv

[18:35](#msg5cd5c4606fd7c11cd8966a1f)@moliad Wow! I have something much more modest but I need to strighten it out, as I said.

planetsizecpu

[19:45](#msg5cd5d4d979d70050994c3a1d)@moliad Wow! seems useful, push hard.

greggirwin

[21:38](#msg5cd5ef3b6fd7c11cd89789c0)@planetsizecpu thanks for the flowchart!

[21:42](#msg5cd5f04079d70050994d08cd)@moliad @toomasv there was an old tool called Visual Parse++ which was an IDE for writing shift-reduce parsers, and it was pretty slick. I probably still have diskettes here somewhere. ;^) Maxim and I talked about it before, I think, and had many of the same ideas for a `parse` IDE or `parse-lab` tool.

## Saturday 11st May, 2019

Claudio08

[08:56](#msg5cd68e445d48a24fd0ab853f)Hi, i realized a particular switch/toggle button thanks to @toomasv examples  
(https://gitter.im/red/red/gui-branch?at=5cb6076b3b6cb0686a01de2c)  
(https://gitter.im/red/help?at=5cd2798cf251e60ffa44b7e7)  
The following is not a sophisticated Red-lang code but seem to work and for  
me is the first custom button that i have created in an easy manner.  
Thanks

```
bits: [0 0 0 0 0 0 0 0 0 0 0 0]
view compose/deep [
	style switch-btn: base 40x90 on-create [
			face/extra: context [
				swb-color: face/color
				face/color: black
				swb-dark: swb-color - 30.30.30
				swb-off: draw 40x90 [
					fill-pen swb-dark
					box 2x2 38x88
					pen gray
					fill-pen swb-color
					polygon 2x2 38x2 33x70 5x70 
					polygon 33x70 5x70 5x77 33x77
				]
				swb-on: draw 40x90 [
					fill-pen swb-dark
					box 2x2 38x88
					pen gray
					fill-pen swb-color
					polygon 2x2 38x2 33x10 5x10 
					polygon 33x10 5x10 5x17 33x17
				]
				swb-click: func [face][ 	
							either face/data = 0 [
							face/data: 1 face/image: face/extra/swb-on
							][face/data: 0 face/image: face/extra/swb-off]
					]
		]
			face/data: 0
			face/image: face/extra/swb-off
	]
	across
	space 0x0
	switch-btn red [face/extra/swb-click face bits/1: face/data print bits]
	switch-btn orange [face/extra/swb-click face bits/2: face/data print bits]	
	switch-btn gold [face/extra/swb-click face bits/3: face/data print bits]
	switch-btn yellow [face/extra/swb-click face bits/4: face/data print bits]	
]
```

rcqls

[09:36](#msg5cd697b7e7f42160fa6dabd4)@Claudio08 Nice! (and works on linux/GTK)

toomasv

[10:57](#msg5cd6aa8bda34620ff921fad1)@Claudio08 :clap: (In current form `compose/deep` is not needed -- no parens in code)

greggirwin

[17:19](#msg5cd70411252dbb75153cfe63)Fantastic @Claudio08 ! Please put it in a gist or something, so it doesn't get lost in chat.

## Sunday 12nd May, 2019

Claudio08

[13:18](#msg5cd81d1079d70050995b4b1e)Thanks ... but "Fantastic" are the Red-Lang peoples and all their work

[13:56](#msg5cd82610f52a2375161cb7a9)@greggirwin i put it \[in Github](https://github.com/Claudio08/Red-lang-first-steps/blob/master/Switch-Button) but i have not experience how to use Github

greggirwin

[18:20](#msg5cd863db0f381d0a76a4ce2e):+1:

planetsizecpu

[18:32](#msg5cd866a88fcdb05d47c47160)@Claudio08 It works well, good job!  
@greggirwin Thx, I found some last-minute errors in the flowchart, so better to amend it.

[18:32](#msg5cd866ae56271260f94dfe71)\[!\[Schematic.png](https://files.gitter.im/red/red/gui-branch/ljV8/thumb/Schematic.png)](https://files.gitter.im/red/red/gui-branch/ljV8/Schematic.png)

## Monday 13th May, 2019

GiuseppeChillemi

[19:51](#msg5cd9cacff251e60ffa779498)@toomasv I have discovered your site with your 3 years of reduction experiences... It's Too Porn!

toomasv

[19:54](#msg5cd9cb75bdc3b64fcf3ee134)@GiuseppeChillemi Watch your tongue!

GiuseppeChillemi

[19:58](#msg5cd9cc49252dbb75154fd0c5)@toomasv tongue and fingers!

[20:01](#msg5cd9cd13252dbb75154fd758)I repeat: too porn!

## Wednesday 15th May, 2019

planetsizecpu

[08:09](#msg5cdbc92eda34620ff9448b9a)Although it is missing some tweaks, we can now play at \[L4](https://github.com/planetsizecpu/Cave-In) level, but be careful, the ice is very cold and the falling drop of water can kill you!

[08:10](#msg5cdbc971252dbb75155d17ed)\[!\[cavetest41.gif](https://files.gitter.im/red/red/gui-branch/Quep/thumb/cavetest41.gif)](https://files.gitter.im/red/red/gui-branch/Quep/cavetest41.gif)

gurzgri

[14:07](#msg5cdc1d355a887e1cd9f120e9)@planetsizecpu Congrats, that really looks nice!

endo64

[14:15](#msg5cdc1ee756271260f9675eee)Very nice!

[14:15](#msg5cdc1f080f381d0a76be4f9d)I put my digger on the wall :S

[14:15](#msg5cdc1f0eb149ca5098971f25)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/x5F7/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/x5F7/image.png)

moliad

[14:17](#msg5cdc1f658fcdb05d47de2d24)the fact that I remember playing this kind of game on C64 &lt;sigh&gt; I'll stop my sentence right there . ;-)

endo64

[16:15](#msg5cdc3b260f381d0a76bf36e7)I remember a very similar game on c6, it was gold mine or something like that.

[16:15](#msg5cdc3b2f56271260f968362a)on c64.

greggirwin

[17:56](#msg5cdc52deb149ca509898b6ac)Love the look of the new level @planetsizecpu . :+1:

pekr

[18:47](#msg5cdc5eb70f381d0a76c04c2f)Manic minner and Jetset Willy games on 8bits, similar ....

moliad

[20:34](#msg5cdc77cd252dbb75156248d3)yes... manic miner !!!

## Thursday 16th May, 2019

planetsizecpu

[08:34](#msg5cdd20860ec37966a179b047)Thx all. I knew about manic miner game, and there was also a 3d Cave-In game as I saw at google images, but quite differents.

@endo64 You have too much muscle! :-) The pickaxe in the walls is a known problem that I have in my to-do list.

@greggirwin There will be two more ice levels, then I'll switch to ... who knows, pyramids, volcano, jungle, city? there are a lot of scenarios to discover, mmm volcano it's calling me a lot, what do you thing about a lava falls?

If someone feels strong, he can design his own scenarios, just copy one of them and change the content, then place the objects in the configuration file.

endo64

[08:45](#msg5cdd23448265145bbb1c2476)Would be nice to put some explanations in the README.md file in GitHub, how to make your own levels etc.

planetsizecpu

[10:13](#msg5cdd37ac0ec37966a17a5c19)Yes, you're right, I'll write a few lines and update README.md when time permits.

## Monday 20th May, 2019

Claudio08

[08:47](#msg5ce269a49d64e537bcdcd00d)@toomasv Hi, i am confused with the following code snippets (the first is your)  
that give very different result with or without the use of `'` with shape.  
I found code of other people that do not use `'` with shape.  
What is the the difference or the right way?  
Thanks

```
view [
	box draw [
		shape [
			move 0x0 
			'hline 50 
			'arc 10x10 10 10 0 sweep 
			'vline 50 
			move 0x0
		]
	]
]

view [
	box draw [
		shape [
			move 0x0 
			hline 50 
			arc 10x10 10 10 0 sweep 
			vline 50 
			move 0x0
		]
	]
]
```

rebolek

[08:50](#msg5ce26a5a9404bf2aed797a6d)@Claudio08 All drawing commands are using absolute coordinates by default, using the lit-word version of the command switches the command to relative coordinates.

toomasv

[08:50](#msg5ce26a6575d9a575a611d5b5)@Claudio08 Sure they are different. Commands with apostrophe are relative, without -- absolute. Please read \[docs](https://doc.red-lang.org/en/draw.html#\_arc\_2) :smile:

greggirwin

[12:22](#msg5ce29c040ac9852a950d0f7d)This is one of those interesting (and quite subtle) things. It makes sense that non-literal `shape` keywords are compatible with `draw`, being absolute, but a "literal" position attribute seems like it would be absolute. It is a nice, lightweight notation though, and shows how important datatypes can be in giving us flexibility in dialect design.

Claudio08

[14:18](#msg5ce2b7279404bf2aed7bcc72)I have a long way to go to learn how to use Red-lang; the first steps are important to learn while having fun. Thank you all for this experience

toomasv

[14:23](#msg5ce2b8600ec37966a1a0b846)@Claudio08 You are welcome to ask any questions!

## Tuesday 21st May, 2019

planetsizecpu

[12:11](#msg5ce3ead963dea422b4bdcff6)Hi guys, new level L5 is \[available](https://github.com/planetsizecpu/Cave-In) have fun!

[12:12](#msg5ce3eb189404bf2aed83ecf3)\[!\[cavetest51.gif](https://files.gitter.im/red/red/gui-branch/gpWz/thumb/cavetest51.gif)](https://files.gitter.im/red/red/gui-branch/gpWz/cavetest51.gif)

greggirwin

[18:27](#msg5ce44314b313d72314057738)Nice!

## Wednesday 22nd May, 2019

gltewalt

[19:12](#msg5ce59f328f019114ae9bacbf)Have you considered using .png so that the background of characters can be transparent?

## Thursday 23th May, 2019

planetsizecpu

[08:18](#msg5ce657606366992a940818b4)@gltewalt It was one of the tasks in my to-do list, I was working with Pixelformer to find out how to make transparent some areas of the BMP images, but I did not know that with the PNG files it was so easy, so you just helped me a lot THX!. Now I find myself modifying all the files to put transparency, and I can say that the game looks more correct in this way. This weekend will be ready on my repo. :-)

gltewalt

[15:58](#msg5ce6c32a7c363c75a72e571a):+1:

## Friday 24th May, 2019

planetsizecpu

[08:14](#msg5ce7a7c9ad024978c61d5067)As we can see transparency works well on objects, now I want to test a new level with semi-opacity background image and how to deal with gravity effect.

[08:15](#msg5ce7a829ef853135c81443e8)\[!\[cavetest52.gif](https://files.gitter.im/red/red/gui-branch/eObS/thumb/cavetest52.gif)](https://files.gitter.im/red/red/gui-branch/eObS/cavetest52.gif)

[08:16](#msg5ce7a8709404bf2aed9dff4a)Of course the guards intelligence must be enhanced.

toomasv

[08:17](#msg5ce7a8b083ae782aeec0598f):+1:

gltewalt

[08:42](#msg5ce7ae848f019114aea9d042)Excellent!

pekr

[08:51](#msg5ce7b09f6366992a9411c7bc)I like to watch police officers maddening left-right, being locked between walls, as you stand in parallel location. The alghoritm tries to move them left and right, not trying to find the way in an upper/bottom way :-)

[08:52](#msg5ce7b0b7ef853135c8147c1b)Looks great, I like the design of levels, feel fresh and not 8bit old :-)

planetsizecpu

[09:28](#msg5ce7b92183ae782aeec0cc6b)@toomasv @gltewald @pekr thx, the guards function it's so monolithic and I would like to implement a points based algorithm, for example 4 points to best direction and then decreasing or zero for blocked directions, I'll have time this summer and will try to improve.

greggirwin

[16:11](#msg5ce817b89404bf2aeda13b70)That change makes a world of difference in the look. It's great. And hitting the guard with the bag of gold mid-air, wow. ;^)

planetsizecpu

[16:35](#msg5ce81d5013e9854e335d7d34)And we learned a lot, have you noted floor slippery?, It was a bit tricky to find the correct behavior and values, I love this effect. Also tested but later discarded "The Flintstones" effect, that is, going a bit back when start to walk and then run to front side, it made the game too difficult to play :-)

[17:03](#msg5ce823fd9d64e537bc04b29b)\[!\[cavetest53.gif](https://files.gitter.im/red/red/gui-branch/U9a9/thumb/cavetest53.gif)](https://files.gitter.im/red/red/gui-branch/U9a9/cavetest53.gif)

[17:05](#msg5ce8244783ae782aeec3e92a)This is a test where I activated slippery to the guards. As we can see, they run too fast, even in my old machine, so better to deactivate and give them heavy ice boots haha

greggirwin

[17:38](#msg5ce82c1563dea422b4db7324)Ice skates. :^) So many details people don't see that go into design.

## Tuesday 28th May, 2019

planetsizecpu

[09:38](#msg5ced01b2d22ba766a21286a6)The development of new levels helps a lot to locate hidden faults, as in this case the new level L6 has served with the stairs in the middle of the slopes, I had to touch up some function so that the boy does not sink in them.

[09:39](#msg5ced01d39d64e537bc24f595)\[!\[cavetest61.gif](https://files.gitter.im/red/red/gui-branch/oOWa/thumb/cavetest61.gif)](https://files.gitter.im/red/red/gui-branch/oOWa/cavetest61.gif)

toomasv

[10:55](#msg5ced13a3879f4478c7f68a4e)Marvelous!

dander

[19:04](#msg5ced8622cea8295279b47622)Yeah, it's looking really great!

greggirwin

[19:17](#msg5ced895db76eac527a65422b)Cool.

planetsizecpu

[19:34](#msg5ced8d4ab76eac527a655ccc)Thx guys, tomorrow I'll start new level L7, as I said they will have volcanoes theme, let's see if I can make lava falls :-)

rcqls

[19:56](#msg5ced9278481ef4167b915504)@planetsizecpu Just to let you know that in your CaveIn repo I guess that cavern.bmp files are mostly replaced with cavern.png files but in items.txt files cavern.bmp is still there.

## Wednesday 29th May, 2019

planetsizecpu

[06:08](#msg5cee21c56f530d3b61fe8310)@rcqls It was my mistake, all right now. Thx.

## Friday 31st May, 2019

toomasv

[12:45](#msg5cf121d4ff3f016baa7f8e58)\[Diagram dialect](https://github.com/toomasv/diagram/blob/master/diagram-style.red) extending VID with `diagram`, `node` and `connect`. Also providing `dia` func (better name needed) through which diagram-VID should be sent. `dia` generates proper VID with new styles. If you try it, please let me know of bugs, which are plenty, I'm sure. "RedBNF" provided. Small examples in the end of file.

rcqls

[13:02](#msg5cf125df65392c3b60974311)@toomasv Almost perfect on macOS (« the problem » and « here » texts are not displayed properly). On linux/GTK, no browse implemented, also since shape dialect is not well implemented on linux, the rendering is not perfect! Excellent work!

toomasv

[13:20](#msg5cf12a249b50f639355bbe14)@rcqls Thanks! With "problem" and "here" - can it be that they don't fit into boxes?. Can you try to reduce the font (e.g. `font-size 8` for "Think about the problem" and `[f 8 i "Some " /i u "remarks" /u b " here" /b /f]` for rt)

GaryMiller

[13:49](#msg5cf130f9f3a60a79a42e7442)Does the Diagram dialect have a CenterOn word so that you can have a large virtual diagram, but selecting the name of the CenterOn word would scroll the diagram to the name of the shape referenced by CenterOn? I believe that they call this a Hypergraph. It is used in a personal information mnager called "TheBrain" https://www.thebrain.com/ Also is there a feature for link type that will label the edge connecting two shapes with the text flowing along the angle and direction of the edge. Edges in directed graphs have the arrowhead to denote the direction. I realize this is a fairly advanced diagram especially with the algorithms for auto-positioning the shapes. They have some amazing examples at this site of what is possible today in Javascript http://arborjs.org/halfviz/#/mystery-of-the-secret-room

[13:54](#msg5cf131fc5de053468bec1794)I think these Hypergraphs are wonderful for visualizing data in graph databases or semantic networks as they are used in AI projects because they give the user a way to navigate. I understand that programs can be represented graphically and some of the earlier examples of diagrams shown seemed to be pointing in the direction of a Red development tool moving down this path.

toomasv

[13:55](#msg5cf1326cbf4cbd167c097bae)@GaryMiller Thanks for links, I'll study these hypergraphs. Edge labels are planned but not implemented yet. No advanced auto-layout is planned so far. Dont expect too much. It's just a simple addition to VID not fancy beat-all-competitors. :)

rcqls

[15:12](#msg5cf1444382c2dc79a52a135e)@toomasv Your suggestion works but it is not perfect since « the problem » doesn’t go to the new line. But I think it is only due to macOS implementation.

toomasv

[15:24](#msg5cf14734faac643934197b8b)@rcqls Ah, thanks!

GiuseppeChillemi

[18:38](#msg5cf1749dcea8295279ce5b4e)@toomasv Downloaded and run: fantastic ! But I do see a way to have a table with header, columns and rows. I thought I have spotted it previously but it could be a mistake.

rebolek

[19:19](#msg5cf17e556fc5846bab3dd0ff)There's text-table with all of it already implemented :)

GiuseppeChillemi

[20:11](#msg5cf18a6e82c2dc79a52c0a9d)@rebolek Not such text table ! Just a simple multicolumn shape with text inside it.

[20:13](#msg5cf18af1481ef4167bab7749)@rebolek About text-table we have to complete that project once those hard times (for my company) will end.

rebolek

[20:17](#msg5cf18be5cea8295279cef945)@GiuseppeChillemi I hope you're getting better! I would love to finish it anyway, just don't have much time for it right now unfortunately.

GiuseppeChillemi

[20:22](#msg5cf18d1a9b50f639355e5f53)@rebolek No, we are not getting better. After the facts of december a sales man convinced some of our customers to hand him money they owed to us and disappeared.

[20:29](#msg5cf18e926f530d3b61157040)Its a very difficult battle. We have ended the product develpment process, the product gfx, the business model, taste tests (we produce italian filled pasta here). We are behind our schedule only due money constraints. If we will find some funds we could take off before our competitors will reach us. We are very competitive. Without help the take off will be longer and more dangerous.

greggirwin

[20:55](#msg5cf194cab76eac527a7fde56)Diagram is looking great @toomasv.

toomasv

[20:56](#msg5cf19516bf4cbd167c0c1c27):smile:

rebolek

[20:59](#msg5cf1959efaac6439341b9861)@GiuseppeChillemi Oh, I'm sorry to hear that :(

greggirwin

[21:00](#msg5cf195dd7c1dab468c7c64c3)@GiuseppeChillemi I certainly hope it all works out. Business can be ugly sometimes.

## Saturday 1st June, 2019

planetsizecpu

[19:43](#msg5cf2d5476f530d3b611da491)Go @toomasv go!

## Monday 3th June, 2019

loziniak

[09:51](#msg5cf4ed9efaac643934311c57)Hello! Is something like this possible?

```
p-right: make face! [
	type: 'panel
	color: yellow
	visible?: true
]
layout/parent [
	text "RIGHT" red
] p-right none

view [
	p-left: panel [
		text "LEFT"
	]

	:p-right ;-- how to do something like this?
]
```

endo64

[11:45](#msg5cf508649b50f6393574cafa)You can `append` `p-right` to your window's `pane`.

[11:47](#msg5cf508b7b76eac527a9647b5)`win: layout [ ... ] append win/pane p-right view win`

loziniak

[13:06](#msg5cf51b49bf4cbd167c22fe68)but `p-right` won't automatically position itself next to `p-left` then...

toomasv

[13:11](#msg5cf51c79702b7e5e7620c01b)@loziniak Automatic positioning is VID feature:

```
p-right: [panel yellow []] 
append last p-right [text "RIGHT" red] 
view compose [p-left: panel [text "LEFT"] (p-right)]
```

loziniak

[13:17](#msg5cf51dcf9b50f63935755e6c)@toomasv I would not call this automatic, you're just constructing block of static VID code and then lay it out as a whole. I'd like to update a layout AFTER adding a new `face!` to it. Perhaps that's not so clear from my code example.

[13:18](#msg5cf51e16b76eac527a96de2a)Or at least create a layout from existing `face!` object instead of creating it with the layout, as officially documented.

toomasv

[13:18](#msg5cf51e3c7c1dab468c938e5e)@loziniak Then you have to set offset for the added face too. And update window size, etc.

loziniak

[13:31](#msg5cf52126ff3f016baa99fdb9)Seems like the only way. I hoped that there exists a kind of "hack". Thank you!

toomasv

[15:02](#msg5cf53697f3a60a79a448b3dc)@loziniak You are welcome!

greggirwin

[17:06](#msg5cf553875de053468b07c499)&gt; but `p-right` won't automatically position itself next to `p-left` then...  
&gt; I'd like to update a layout AFTER adding a new face! to it.

@loziniak how can it know where you want it? The layout is already complete, sized, and reactively connected. You can set the offset for your panel, which will be honored when you append it to the pane, and do more calcs and updates to build a dynamic system like that. But Red can't guess that you want to resize something, because you might not. Maybe you have buttons that move offscreen layouts into view.

```
p-right: make face! [
    type: 'panel
    color: yellow
    visible?: true
    offset: 300x20
]

layout/parent [
    text "RIGHT" red
] p-right none

win: layout [
    size 640x480
    text "LEFT" 
    button
]

append win/pane p-right
view win
```

loziniak

[23:35](#msg5cf5aeb87c1dab468c977b8b)@greggirwin I imagine that these two codes would have the same effect:

```
win: layout [
    text "LEFT" 
    button
    panel yellow [
    	text "RIGHT" red
    ]
]

view win
```

and:

```
p-right: make face! [
    type: 'panel
    color: yellow
]

layout/parent [
    text "RIGHT" red
] p-right none

win: layout [
    text "LEFT" 
    button
]

append win/pane p-right
view win
```

## Tuesday 4th June, 2019

toomasv

[04:21](#msg5cf5f1daf3a60a79a44d980a)@loziniak No, as said you, when incrementally adding faces have to feed offsets and sizes:

```
p-right: make face! [
    type: 'panel
    color: yellow
]

layout/parent [
    text "RIGHT" red
] p-right none

win: layout [
    text "LEFT" 
    button
]

p-right/offset: win/pane/2/offset + as-pair win/pane/2/size/x + 10 0
win/size: max win/size p-right/offset + p-right/size + 10
append win/pane p-right 
view win
```

planetsizecpu

[07:19](#msg5cf61b8fff3f016baaa077f2)After many tests, in the end I had to discard the cascade of lava falling, it did not fit well because she needed to have the same height as the window of the game, in order to be able to roll the tape infinitely, otherwise you would see the end of the tape falling. So I thought to leave the static lava and put some rocks falling, which serves me the same function of droplets falling from the ice, just changing the image. I hope you like the design, I'm already thinking about the next level :-)

[07:24](#msg5cf61cae82c2dc79a54a0b21)\[!\[cavetest71.gif](https://files.gitter.im/red/red/gui-branch/JUjr/thumb/cavetest71.gif)](https://files.gitter.im/red/red/gui-branch/JUjr/cavetest71.gif)

rebolek

[07:28](#msg5cf61da5b76eac527a9d9164)Nice :)

greggirwin

[19:14](#msg5cf6c32fbf4cbd167c2e68ba)@planetsizecpu I love getting the insight into the design. The new level is cool too. Cart and grab bar are nice.

[19:26](#msg5cf6c5d4702b7e5e762c69cd)Good example @toomasv.

@loziniak, \*why* do you imagine your two examples would produce the same layout? Red can't read your mind. When you create faces with `make`, they are separate objects with attributes, and you are in control of those. When you use VID, it automatically sets attributess \*and* builds a tree of faces. Once you decide to handle faces directly, only \*you* know how you want to compose them. This is important to understand, vital even. VID limits what you can do, making choices on your behalf. If we carry those behaviors down to the core of the View engine, you can't write new UI dialects like VID, because you'll be fighting the system at every turn. Does that make sense?

## Wednesday 5th June, 2019

planetsizecpu

[07:29](#msg5cf76f43faac64393441d599)Thx guys, I thought to set a "killing colour", so if the boy touches static lava will dead, but falling rocks do the same work, so finally don't did it to avoid adding complexity to the main loop tests, for better speed. Today's tests indicate that two guards is the correct choice, with three its too difficult to collect all the gold, so I did some updates and set the config file that way.

endo64

[08:04](#msg5cf7779a6fc5846bab6567e5)You can add number of guards as a difficulty level, in a config file maybe.

planetsizecpu

[08:26](#msg5cf77ccd65392c3b60c18540)@endo64 In practice it does not work well, the guards have to be placed in in correct starting coordinates, otherwise they could be born inside the walls, or too close to the boy. I always have to do several tests to put them in a proper position. Next, the config level must contain all the objects, so it would be necessary to edit the file just after setting the guards number, too complex and too far from the goal. I think the difficulty goes more in the guards speed way, it is easy to change the `rate` for any face, in fact female guards are going faster than boys :-) So good idea to set a difficulty level, I may test how it goes on next level L08.

[08:55](#msg5cf78367b76eac527aa71016)\[!\[cavetest72.gif](https://files.gitter.im/red/red/gui-branch/zLrn/thumb/cavetest72.gif)](https://files.gitter.im/red/red/gui-branch/zLrn/cavetest72.gif)

endo64

[11:02](#msg5cf7a149ff3f016baaaabe3e)@planetsizecpu then, you may need to have two sets of level data for each level, one for "nornal" one for "difficult" :)

planetsizecpu

[12:30](#msg5cf7b5d865392c3b60c304f2)@endo64 I have to think about it well, the idea maybe to have four levels, one easy, the normal, one more difficult and another expert, the start is normal - the one that is loaded with the game -, the other three could be accessed during the game with buttons of the type `radio` or a `slider`, they only have to decrease/increase the `rate` of the guards a little more, so that they walk slower/faster, something easy using`foreach-face [...]`. We would see :-)

## Thursday 6th June, 2019

planetsizecpu

[10:45](#msg5cf8eee7481ef4167bdc4921)@endo64 Just added difficulty level selection, I did four levels, as I commented before, so I wrote feasible speed parameters for guards that tested working right, let's have fun.

[11:27](#msg5cf8f8aa6f530d3b61474317)Ah, I forgot to say that spiders are also affected by level selection, so they can run so fast :-)

endo64

[11:53](#msg5cf8feca6fc5846bab700e8d)@planetsizecpu Great! I will play tonight.

## Saturday 8th June, 2019

loziniak

[10:15](#msg5cfb8ab1ff3f016baac5dcb8)@greggirwin @toomasv Perhaps my poor selection of words is the source of confusion. I just started asking about some imaginary "thing" (function? technique?) that would allow me to update lay-outs after adding `face!` objects to them. Couple days of tinkering with View/VID after, I'm a little more clever. Currently we can lay-out faces created from blocks of VID code, and once they are laid-out, there is no way of automatically updating that using the same layout algorithm. What I was dreaming about was some kind of `re-layout` function, that would strip all the positioning (offset/size) info from existing faces tree, allow me to add/remove/edit the faces in it, and then - layout it all back. Now I know, that such a function does not exist.

toomasv

[12:31](#msg5cfbaabcbf4cbd167c4fa25a)@loziniak I have tried something similar with \[responsive style](https://github.com/toomasv/learning/blob/master/styles/responsive.red) (but no adding/removing, just repositioning).

greggirwin

[17:02](#msg5cfbea32faac64393460dbc1)@loziniak much clearer, thanks. @toomasv's example is a great starting point. And building a new layout system that works from existing faces is doable. We've talked a number of times about whether a constraint based layout system, like Cassowary, should be part of Red. Either the team or someone else will build one at some point, but it's not a silver bullet. The more work done to research that area, the better. We have the ability to tag faces with extra data, the `foreach-faces` function (I've done a few examples with that), and can treat everything as data for easy manipulation. Nothing needs to change in the underlying View engine to experiment. Go for it!

rgchris

[23:48](#msg5cfc4940b76eac527ac7bfc4)Have been tinkering with some \[responsive ideas in Rebol 2](https://gist.github.com/rgchris/b6fdf694df53ea82af424c48abeeefac). There's a few things going on in there, but automatic layout is one of the goals.

## Monday 10th June, 2019

GaryMiller

[14:32](#msg5cfe69e26fc5846bab94adf0)It would be nice to have a little more scroll bar control too. Right now there's no scroll to bottom if you pre-populate the text area and it's kind of hard to do manually when you append to it because of word wrap making a single scroll insufficient in the text appended waps to more than one line.

greggirwin

[17:18](#msg5cfe90fcbf4cbd167c62e587)@GaryMiller can you provide some example code? Are you talking about the `area` style?

BuilderGuy1

[20:45](#msg5cfec160702b7e5e7662a4c2)@toomasv Where is your repository of GUI examples?

[20:48](#msg5cfec2343dcdab4003234b1b)Scratch that. Found it :-)

## Tuesday 11st June, 2019

planetsizecpu

[12:42](#msg5cffa1a6ff3f016baae12f9d)Today I released \[Cave-In](https://github.com/planetsizecpu/Cave-In) level L8, it has needed a lot of hours of designing work, new lifter shapes with some arrangements on moving function, and a new tape band rolling function for lava flow. I'm looking to play it for a while to see if it is some malfunction or wrong behavior before to continue, hope you like it.

[12:43](#msg5cffa1dcfaac643934796132)\[!\[cavetest81.gif](https://files.gitter.im/red/red/gui-branch/t93q/thumb/cavetest81.gif)](https://files.gitter.im/red/red/gui-branch/t93q/cavetest81.gif)

greggirwin

[15:59](#msg5cffcffdbf4cbd167c6b5b5b)Woohoo!

toomasv

[16:36](#msg5cffd89a6fc5846bab9e7f2f)@planetsizecpu Great work!

rebolek

[17:30](#msg5cffe54b13a19a0ae037a9bb)@planetsizecpu Wonderful! I see that you have horizontally scrolling lava there. Does that mean that you'll do also vertically scrolling one in last level?

dockimbel

[19:19](#msg5cfffedca30be21ff9f1eba4)@loziniak VID is a layout description dialect that gets compiled to a tree of faces, which is fed to View engine (which can only act on a tree of faces, the same way the DOM tree works in browsers). Adding, removing, changing faces is easily achieved by modifying that face tree itself. If you want to have the same facilities as in VID for creating new individual faces dynamically, you can rely on `make-face` builder, that can optionaly take a VID-like face options description.

[19:44](#msg5d00049518e85b354be70bf3)BTW, I just found a bug in `make-spec` while writing a simple usage example. Will fix it asap.

## Wednesday 12nd June, 2019

planetsizecpu

[06:11](#msg5d0097acc2aaa957c2bc4bb9)Thx guys.  
@rebolek Probably, I have not yet thought about how to do it, I'm sure that one or two lava cascades, but they have to go to the edge of the screen or nothing could cross them, they will kill everything that moves on over :-)

rebolek

[07:02](#msg5d00a38e049bf9263c5762d0)@planetsizecpu why should they go to edge of screen?

planetsizecpu

[07:12](#msg5d00a5c25656e6268b8570fc)@rebolek Because the band has to cover the entire screen distance on his direction to display correctly, and every moving thing that touches the lava dies, so, the boy, the guards and the spiders can't go across the lava flow from one screen side to other, as there is no clear way to go.

rebolek

[07:14](#msg5d00a65872e5732607883ec0)@planetsizecpu I don't understand why it has to cover whole screen. IMO you can put scrolling image in any rectangle area. Just repeat the image twice and crop it.

planetsizecpu

[07:21](#msg5d00a817c7a8fc263a0bda87)Yes, but when the tape frame reaches the visible area of the window then you see a square image moving, so you need to reset the tape just before the end reaches the visible area of the screen, so you do not see the frame of the image moving and looks like an endless image.

rebolek

[07:23](#msg5d00a8625656e6268b858476)@planetsizecpu Hm, I try do some tests over weekend, I believe it should be possible without artifacts.

planetsizecpu

[07:24](#msg5d00a8c3c7a8fc263a0bdfc0)Yes, it is possible I did some tests some weeks ago, but then you don't get the endless effect.

rebolek

[07:25](#msg5d00a8eb8655842639e5a017)I see, but I believe that the endless effect must be possible somehow.

planetsizecpu

[07:26](#msg5d00a92d8655842639e5a1b1)Well maybe if you use semi transparent images, I have not tested yet that way

rebolek

[07:27](#msg5d00a956c5386926f6d5551c)I don't think transparency will play any role in it.

planetsizecpu

[07:53](#msg5d00af682f44e426f58cd845) If you succeed, we can incorporate it into the game :-)

rebolek

[07:57](#msg5d00b05ec7a8fc263a0c17ad)Of course! I believe it should be possible and would love to try it. I let you know during the weekend.

gurzgri

[17:25](#msg5d01358c5656e6268b89f136)@planetsizecpu Image `picture` being some sort of 'lava'-image instead of the placeholder image. Shouldn't something like

```
picture: to image! draw make image! reduce [32x64 white] [pen blue fill-pen sky circle 16x16 14 circle 16x48 14]
view [
    canvas: image 200x600 draw [
        line-width 200
        pen bitmap picture 0x32 200x32 tile
        line 100x0 100x600
    ] rate 32 on-time [
        canvas/draw/6/y: canvas/draw/6/y - 1 if canvas/draw/6/y = 0 [canvas/draw/6/y: 32]
    ]
]
```

allow you scrolling lava vertical?

greggirwin

[17:39](#msg5d0138ceee9dda04629df34d)Is it a standard seamless image tiling issue? If so, it's just the image itself that needs to be changed for @rebolek's idea to work.

gurzgri

[17:52](#msg5d013becc7a8fc263a109658)Yes, I think that's the issue. And by using the pen or fill-pen image tiling capabilities most of the work can be handled by View itself. Just checked the repo: Having %lavatape.png being 3200x35 pixels in size just to realize horizontal scrolling probably leaves some room for improvements. The above is just a quick example.

greggirwin

[17:56](#msg5d013cc4c8d21d26064a4866)Could maybe use a simple gradient as a fixed background, and move small PNG patterns, alpha+composite masks, for the effect.

planetsizecpu

[18:09](#msg5d013fdb209ae3263ab8f8ac)@gurzgri Yes. For now it is only horizontal scroll function, for vertical I would add a new function as L9 may include vertical lava flow.  
Your example is great, but movement is done by draw code, that's a different approach, but it will not work in my game as it consumes a lot of time and would be difficult to fit on the working schema.

@greggirwin for image movement we only have time to just move the image a bit on every game cycle to properly work, must be done on accurate time lapses or things go too slow. Change the image aspect by executing code is stole game cycles to the main loop, then things won't work. For example the guards dead loop, I had to remove looking delays I had set before, because it stopped other objects movement on every guard dead. It is a bit tricky, that is for what I did ask for GIF image support, (assuming it would be done asynchronously) :-)

AlexanderBaggett

[19:51](#msg5d0157d48655842639eb35ab)@toomasv , do you have an examples on how to use your diagram dialect experiment?

GiuseppeChillemi

[19:53](#msg5d01583ac2e5ba268ce7df98)@AlexanderBaggett I am just trying to run it. It's embedded at the end of the code.

toomasv

[19:53](#msg5d01584817fefb263b0c4a71)@AlexanderBaggett There are few examples in the end of \[file](https://github.com/toomasv/diagram/blob/master/diagram-style.red)

AlexanderBaggett

[19:53](#msg5d015854c2e5ba268ce7dfc6)@GiuseppeChillemi , @toomasv, thanks I see the examples now.

GiuseppeChillemi

[19:54](#msg5d015861c7a8fc263a11857f)@toomasv `do %diagram-style.red` is the only thing to do ?

toomasv

[19:55](#msg5d0158aec7a8fc263a11881b)@GiuseppeChillemi and use `dia` func as in `view dia [...]`.

GiuseppeChillemi

[19:57](#msg5d015931209ae3263ab9c969)@toomasv but `do...` should automatically run the embedded demo... shouldn't it ?

toomasv

[19:58](#msg5d015972209ae3263ab9cc0d)I disabled automatic demo run, but you can enable it by commenting out `comment` block lines of any example.

AlexanderBaggett

[20:03](#msg5d015aa8c2e5ba268ce7f13e)Awesome Toomas, got an example working.

toomasv

[20:04](#msg5d015ab35656e6268b8b2467):+1:

GiuseppeChillemi

[20:05](#msg5d015aff5213b6266373dd7b)@toomasv when you open diagram-style.red in your editor but it uses the last 31-may-2019 version and what you see is not what you get !

toomasv

[20:08](#msg5d015bd372e57326078dfd60)What problem do you get?

[20:10](#msg5d015c4317fefb263b0c6901)I loaded up new version, but not much tested.

GiuseppeChillemi

[20:15](#msg5d015d765656e6268b8b3e35)Nothing but had not found any "comment" :-)

[20:27](#msg5d01602a8655842639eb7d05)@toomasv The demo with the RED types is very slow on my machine

toomasv

[20:29](#msg5d016097209ae3263aba03ff)Yeah, there are deeply nested structures, which makes it slow I guess, + it tries to guess the correct size for window of fly...

[20:32](#msg5d016162c7a8fc263a11c4fc)Another experimental toy style \[nanosheet](https://github.com/toomasv/table/blob/master/sheet.red). Not as compact as picosheet of course.

```
view/flags [
    ar: area wrap 
    button "Do" [do ar/text] return 
    sheet 5x4
] 'resize
```

\[!\[nanosheet](https://toomasv.red/images/Table/nanosheet.gif)](https://toomasv.red/images/Table/nanosheet.gif)

GiuseppeChillemi

[20:32](#msg5d0161638655842639eb87ab)When I have extrapolated the demo some texts were overlapping. It seems the demo depends from something else

greggirwin

[20:38](#msg5d0162bac8d21d26064b8f50)Another cool demo @toomasv.

@planetsizecpu, thanks for the information. Guessing at ideas from the outside, as I did, isn't always helpful.

GiuseppeChillemi

[20:39](#msg5d01630dc5386926f6db380e)&gt; Another experimental toy style \[nanosheet]

You are scaring me ! Are you human or alien ? Stop producing such great things in so short time. I will need 2 lifes to fully understand everything and start to code like you !

[20:41](#msg5d01638717fefb263b0c9dbd)I will need moving to Buddhism to have reincarnation and such extra life !

AlexanderBaggett

[20:42](#msg5d01639ac2e5ba268ce840b9)@toomasv , so `dia` is the function! that takes a spec block and convert it to a diagram that view can use?

toomasv

[20:44](#msg5d016418ee9dda04629f5d86)@AlexanderBaggett `dia` function just forms the proper VID bloc from diagram "extended VID". To see its output, use `view probe dia [...]`

[20:44](#msg5d01643217fefb263b0ca27a)BN, to sleep mode.

AlexanderBaggett

[20:45](#msg5d01647e17fefb263b0ca583)@toomasv , thanks, Got it.

GiuseppeChillemi

[20:52](#msg5d01661f2f44e426f592b0b9)@toomasv I have modified the first demos. I have acknowledged the basics of how nodes are built and connected. Sleep mode for me too.

## Thursday 13th June, 2019

toomasv

[04:54](#msg5d01d6ea5213b62663771cf9)@GiuseppeChillemi

&gt; some texts were overlapping. It seems the demo depends from something else

Oops, sorry, I was experimenting with `zoom` (which I can't make work so far) and forgot to change back the example. Now it is corrected online (replace `di: type-box zoom` with `di: diagram wheel`).

planetsizecpu

[06:58](#msg5d01f41044ed26263dcb163f)@toomasv Useful, push hard!  
@greggirwin your input is ever welcome, this is today's starting grid on L9 work, everything starts with a bit of imagination.

[06:58](#msg5d01f41f2f44e426f59685f8)\[!\[L9w.png](https://files.gitter.im/red/red/gui-branch/5LOz/thumb/L9w.png)](https://files.gitter.im/red/red/gui-branch/5LOz/L9w.png)

[11:54](#msg5d02397bc7a8fc263a17ca1d)And now that we have imagination and time, I designed a new kind of teletransporter :-) so we could travel across any vertical lava flow, or anyting in fact!

[11:54](#msg5d02398617fefb263b128010)\[!\[cavetest91.gif](https://files.gitter.im/red/red/gui-branch/KJE9/thumb/cavetest91.gif)](https://files.gitter.im/red/red/gui-branch/KJE9/cavetest91.gif)

rebolek

[11:55](#msg5d0239c544ed26263dcd39d3)Cool, add also portal gun there! :smile:

greggirwin

[15:49](#msg5d027079c7a8fc263a19c63e)Nice! I didn't think about iterative level design. Seeing it in action is great.

GiuseppeChillemi

[21:04](#msg5d02ba595656e6268b958d72)@toomasv First diagram:

[21:04](#msg5d02ba5e5656e6268b958d77)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/H2xa/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/H2xa/image.png)

[21:05](#msg5d02ba8ac5386926f6e50c82)

```
Red []

view probe dia [
	size 300x300
	diagram 250 border 1 vertical beige "Example" [
		below
		style closed-arrow: connect arrow closed from bottom to top
		pad 10x0 
		space 40x40

		n1: node ellipse "Start"
		closed-arrow from :n1 to :n2

		n2: node box "first op"
		closed-arrow  from :n2 to :n3

		n3: node box "second op"
		closed-arrow  from right :n3 to bottom :n4 hint [horizontal 20 0]

		return

		n4: node ellipse "end"
	]
]
```

[21:07](#msg5d02baf9c12fd5266401c9c0)Changing:  
`closed-arrow from right :n3 to bottom :n4 hint [horizontal 20 0]`

to

`closed-arrow from right :n3 to left :n4 hint [horizontal 20 0]`

I get:

[21:07](#msg5d02bb1cc8d21d2606558bf9)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/PcWm/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/PcWm/image.png)

[21:08](#msg5d02bb54c7a8fc263a1c1490)Is there a way to have the ending line segment to END as horizontal ?

[21:28](#msg5d02bff9209ae3263ac45cb9)I would like also to have the last line connecting to the top of END but it should turn around from the left of it.

## Friday 14th June, 2019

AiguyGary\_twitter

[01:43](#msg5d02fbd22d3f89045fb8313d)@greggirwin Code Example Ask What is AI? return then What is the Singularity? and you will see the scrolling problem. Had to use pastebin because too big for Gitter. https://pastebin.com/8qn5eP4r

toomasv

[03:26](#msg5d0313dcc5386926f6e76bcc)@GiuseppeChillemi To connect it to left (as on last image) just remove `0` from the end of changed line.  
To connect it to the `top` pad "end" down a bit and use e.g. `hint [horizontal 20 -200]`

[03:31](#msg5d03150b17fefb263b192124)In general you should give `hint` as many points as your `connect` will need minus 2. I.e. last two legs are computed automatically.

[04:21](#msg5d0320c8049bf9263c6a32bd)Nice start BTW!

greggirwin

[06:02](#msg5d0338822313502d383c31bb)@AiguyGary\_twitter and here I thought I'd be able to provide helpful advice. ;^) Late here now, and this deserves a fresh brain and coffee. Stay tuned.

[06:04](#msg5d03390126477710bba85e1f)When I saw ShortestDist, I thought maybe LCS. I did one of those years ago in R2, and the rebbin version was loads faster than straight Rebol. Doesn't look like the case here so, again, more soon.

toomasv

[06:19](#msg5d033c6fe527d95addce45e8)@GiuseppeChillemi Furthermore, you could take advantage from the fact that in case you are connecting consecutive nodes, you don't need to name them:

```
view probe dia [
    size 300x300
    diagram 250 border 1 vertical beige "Example" [
        below
        style closed-arrow: connect arrow closed from bottom to top
        pad 10x30 
        space 40x40

        node ellipse "Start"
        closed-arrow 

        node "first op"
        closed-arrow

        node "second op"
        closed-arrow from right to top hint [horizontal 20 -230]

        return

        pad 0x30 node ellipse "end"
    ]
]
```

Naming is needed in case you want to connect to nodes not immediately before ("from-node") or after ("to-node") `connect`.

planetsizecpu

[12:50](#msg5d0398014e8f972d3719e18d)It has been a day of hard work, now the teleportation function admits any number of doors, they only have to be grouped by pairs in the configuration file, and by the way I changed the aspect a bit.

[12:50](#msg5d03981cfbcc305cc46c5ced)\[!\[cavetest92.gif](https://files.gitter.im/red/red/gui-branch/rjkO/thumb/cavetest92.gif)](https://files.gitter.im/red/red/gui-branch/rjkO/cavetest92.gif)

GiuseppeChillemi

[12:53](#msg5d0398c2bb789747fb026e8b)Thanks for the clarification. I have already spotted that working but not used it. Currently I have a question: do the from-node and to-node are meant as "source code creation sequence" or something related to they video position/column etc. I am 99% sure that the correct on is the former but I ask it anyway...

[12:59](#msg5d039a1f2313502d383f3b2d)Another question: could I change the color of the diagram element once I click on it ?

[13:00](#msg5d039a64325b465cc329073b)@planetsizecpu Please send me the code. I need to teleport my self to a carribean beach !

[13:00](#msg5d039a6c6f0ec85ade077db5)(Nice work !)

toomasv

[14:15](#msg5d03abecf5cf1f10bc6f3fc6)@GiuseppeChillemi Sorry, I don't understand what you mean by "source code creation sequence" or "video position/column". Please clarify.  
Editing diagram elements is planned.

GiuseppeChillemi

[14:26](#msg5d03aeac8e050f62aa188233)N2 is declared after N1. If you use a connector it will go from bottom N1 to top N2. That's one logico.

[14:26](#msg5d03aeb1bb789747fb032965)Logic

[14:30](#msg5d03af712313502d383ff7f4)If you use RETURN, the last element is located in a second column and a the top of the diagram near the first one. Connector could use an adiacence logic for its target.

pekr

[14:30](#msg5d03af96bb789747fb033403)@toomasv - is there any showcase to your excellent work? I would like to do an FB post, suggesting ppl to look into your work ....

GiuseppeChillemi

[14:36](#msg5d03b0f2a8d9871b3287d16f)@pekr it could be premature. There is no documentation and few diagrams. I suggest waiting for resources to be available. That becouse I think Toomas work is GREAT and it deserves a great WOW and followers

toomasv

[14:38](#msg5d03b17a325b465cc329dd07)@pekr I did a \[recollection](https://toomasv.red/Two-years.md.html) ~two months ago about my two years of reducing. Is that good enough? (too overloaded with gifs, alas)

@GiuseppeChillemi Nodes are positioned as usually in VID -- by `below`, `across`, `space`, `origin`, `return`, `at`and `pad`. `connect`'s are different, they are influenced by `vertical`, `horizontal`, `hint` and `to`/`from` keywords.

pekr

[14:42](#msg5d03b23af5cf1f10bc6f7735)That's really nice, thanks a lot ....

GiuseppeChillemi

[14:43](#msg5d03b2a92313502d38401a86)@toomasv yes, thats a thing with a great wow factor! You have finally published it!

toomasv

[15:02](#msg5d03b6eb950f1062a96c45de)@pekr Thanks! And you are welcome!

rcqls

[15:48](#msg5d03c1b1fbcc305cc46dba01)@toomasv wow wow wow wow….

GiuseppeChillemi

[16:04](#msg5d03c584fbcc305cc46dd6fd)@toomasv a question comes to my mind: where have you acquired such amazing graphic coding skills ?

planetsizecpu

[17:01](#msg5d03d30126477710bbad540a)@GiuseppeChillemi THX, of course, and make reservations for all of us, so we meet up on a beers round!

toomasv

[19:23](#msg5d03f44626477710bbae649f) :blush:

mikeparr

[21:03](#msg5d040bac26477710bbaf134e)I love your 'recollection' @toomasv !!

## Saturday 15th June, 2019

toomasv

[03:12](#msg5d046239f5cf1f10bc746ba3)Thanks, @mikeparr !

Claudio08

[04:45](#msg5d0477ebf5cf1f10bc74fc59)@toomasv :clap:

toomasv

[06:42](#msg5d04934bbb789747fb09877b)Thx, @Claudio08 !

GalenIvanov

[08:06](#msg5d04a708e527d95addd8b9fb)@toomasv Great collection! Very impressive and inspirational!

toomasv

[08:07](#msg5d04a758f5cf1f10bc763cc2):smile:

pekr

[08:22](#msg5d04aac48e050f62aa1fa5bc)You see? Just one impulse and so many reactions :-)

GiuseppeChillemi

[08:40](#msg5d04aefef5cf1f10bc7671c9)It's not just an impulse... 2 years on work condensed on that site an great results!

[08:42](#msg5d04af5ad100e447fc1a6231)I am learning to use his diagram dialect and I have already great ideas in mind.

[08:47](#msg5d04b08fbc56c731f8c0e39f)@toomasv Please implement shape color change ASAP! With it will be possible to communicate to the user the competition of a flow procedure while it is running.

[08:47](#msg5d04b09fbc56c731f8c0e409)\*completition

[08:48](#msg5d04b0e58e050f62aa1fcbce)\*completition of a step in a procedure rapresented as diagram

[08:52](#msg5d04b1ba2313502d384758e1)More on, if we could use pictures as diagram elements we could use them to better express our ideas. Think about importing Visio like shapes and using them!

[08:56](#msg5d04b2cd2313502d38475f9c)You have opened a whole universe of possibilities!

toomasv

[10:11](#msg5d04c468bc56c731f8c172b6)@GiuseppeChillemi You can use images, see examples with red star-like nodes.  
And you can change node-color programatically, e.g.

```
tick: 0 view dia [
    space -1x0 
    style n: node box 20x40 0 border off rate 10 
    on-time [
        if tick = face/extra/1 [face/draw/fill-pen: face/extra/3] 
        if tick = face/extra/2 [face/draw/fill-pen: white]
    ] 
    at 0x0 box hidden rate 5 on-time [tick: tick % 7 + 1] 
    n extra [1 2 magenta] 
    n extra [2 3 red] 
    n extra [3 4 orange] 
    n extra [4 5 yellow] 
    n extra [5 6 green] 
    n extra [6 7 blue] 
    n extra [7 1 cyan]
]
```

\[!\[node-colors](https://toomasv.red/images/Diagram/node-colors.gif)](https://toomasv.red/images/Diagram/node-colors.gif)

GiuseppeChillemi

[10:36](#msg5d04ca3026477710bbb40f68)I need to change a shape color either on mouse click or to reflect an event or state change.

[10:36](#msg5d04ca496f0ec85ade100289)I will try later

[10:37](#msg5d04ca81bc56c731f8c19c95)Could text color or text inside shapes be changed either in content or color too?

[10:38](#msg5d04cab58e050f62aa20764f)And line color/tickness/text?

[11:56](#msg5d04dce1ecc6a91b31ec4669)Here is the target use of changing shape color:

[12:01](#msg5d04de02d100e447fc1ba952)

[12:08](#msg5d04dfd7bb789747fb0b9612)

[12:09](#msg5d04dff5fbcc305cc47587e4)(I fill winally find the proper way to share my GIF animation !)

[12:11](#msg5d04e0784e8f972d372326c1)

[13:37](#msg5d04f481bb789747fb0c297b)Ok boys, need help:  
I have created an animated gif. Then I have uploaded it on dropbox and set the file as shared. I have copied the shared link and embedded here using the following markdown command:  
! \[ alt ] ( url )

[13:37](#msg5d04f4ab325b465cc332bda8)(No spaces)

[13:37](#msg5d04f4b0e527d95adddac994)Where is my mistake ?

toomasv

[13:53](#msg5d04f842325b465cc332d56e)Hmm. Seems ok.

GiuseppeChillemi

[14:13](#msg5d04fd062313502d384964dc)Lets try again:

[14:13](#msg5d04fd17a8d9871b3290fa2d)!\[alt](https://drive.google.com/file/d/1ysRwLFja8Eh\_h4iuJ2QQaanlFhXMJ46t/view?usp=sharing)

[14:14](#msg5d04fd484e8f972d3723f2f4)@toomasv do you see it ?

[14:17](#msg5d04fdf92313502d38496a57)Link is: ! \[alt] ( \*ttps://drive.google.com/file/d/1ysRwLFja8Eh\_h4iuJ2QQaanlFhXMJ46t/view?usp=sharing )

[14:17](#msg5d04fe176f0ec85ade117250)(Change * to H)

[14:30](#msg5d05011826477710bbb58119)Note: on-dbl-click works but on-down does not.

planetsizecpu

[15:18](#msg5d050c60fbcc305cc476b580)@GiuseppeChillemi let me try for you: \[here](https://drive.google.com/file/d/1ysRwLFja8Eh\_h4iuJ2QQaanlFhXMJ46t/view)

[15:21](#msg5d050ce26f0ec85ade11dcad)The url it's ok, and I don't see any typo, maybe some malfunction on gitter at the moment.  
BTW good job!

toomasv

[15:57](#msg5d051575faf70031f91c16f1)@GiuseppeChillemi :+1: Thanks, @planetsizecpu!

[16:15](#msg5d0519aea8d9871b3291ca82)Here you are:  
\[!\[proc](https://toomasv.red/images/Diagram/Process.gif)](https://toomasv.red/images/Diagram/Process.gif)

greggirwin

[16:49](#msg5d0521a6ecc6a91b31ee26e1)Great teamwork! Nice feature demo.

## Wednesday 19th June, 2019

planetsizecpu

[11:48](#msg5d0a210f325b465cc364df9e)Just now I released \[Cave-In](https://github.com/planetsizecpu/Cave-In) level L9. Next level L10 will be the end of the game for now, as I have to take a time for some construction works at home, let's see what direction it goes!

[11:53](#msg5d0a223b325b465cc364ea5c)\[!\[cavetest93.gif](https://files.gitter.im/red/red/gui-branch/BUi4/thumb/cavetest93.gif)](https://files.gitter.im/red/red/gui-branch/BUi4/cavetest93.gif)

greggirwin

[19:13](#msg5d0a8970a8d9871b32c723b8)Thanks for keeping us updated @planetsizecpu. Enjoy your break.

## Thursday 20th June, 2019

toomasv

[17:33](#msg5d0bc36d207f6e6963cd6e92)\[!\[chess](https://toomasv.red/images/chess/chessboard.gif)](https://toomasv.red/images/chess/chessboard.gif)

:scream:

\[gist](https://gist.github.com/toomasv/5d3bc8fd4cc7204dc75f333d46348dd3)

greggirwin

[18:46](#msg5d0bd48dd1aaa16964d84a13)Tiny chess. :^)

rcqls

[18:53](#msg5d0bd6414b0b7b477b2b2f45)@toomasv Impressive! Above all since it seems to work in Red/GTK :thumbsup:

toomasv

[18:58](#msg5d0bd765d16b28559f562b6b)Hooray to Red/GTK!

endo64

[19:17](#msg5d0bdbe3bc834f76a4ae96a2)@toomasv Nice :)

toomasv

[19:37](#msg5d0be086d35d4162a86b1258):smile:

Phryxe

[19:55](#msg5d0be4a1d1aaa16964d8d54f)@toomasv Another helpful demo :clap:

GiuseppeChillemi

[20:10](#msg5d0be83bbc834f76a4af0101)@toomasv 👏👏👏👏👏👏👏👏

[20:11](#msg5d0be87e007cff7a82e79425)(it's a clap, or it should be!)

toomasv

[20:17](#msg5d0be9bdfd4aa914b510206f)Thx!

AiguyGary\_twitter

[23:51](#msg5d0c1bff41654c559ecc94cb)Amazing!! Toomas could port D3 to Red in a Week! https://d3js.org/

## Friday 21st June, 2019

AiguyGary\_twitter

[00:15](#msg5d0c21afd1aaa16964dac632)Has anyone written a dialect to evaluate algebraic expressions with parenthesis, math/trig functions and standard mathematical operators. I don't understand the RED dialects yet but I once wrote code in .Net to parse and convert a an algebraic expression into Reverse Polish Notation (RPN) and then push/pop the values and operators on and off a stack to evaluate them for an earlier AI to do unit conversions and word math type problems. Am I correct in saying the RED's order of math evaluation is already very close to an RPN evaluator when read from left to right. It would be nice if RED had an built in expression evaluator that would convert an algebraic expression to RED format for graphing programs. HP calculators were great for engineers but when Texas Instruments came out with their much cheaper TI series for students and business people the HP saw the writing on the wall.

9214

[01:17](#msg5d0c30224b0b7b477b2df961)There's a built-in `math` dialect, but it's too simplistic and handles only multiplication and division. I have an extended version \[here](https://gist.github.com/9214/e6378c30f21af4c75436692776fa9589), which handles PEMDAS precedence rules.

planetsizecpu

[08:29](#msg5d0c9579d1aaa16964de5e06)Great job @toomasv I like the tiny design as it fit well on android devices, would you add playing mode such as human vs computer?

toomasv

[08:31](#msg5d0c95d7d35d4162a870b56c)@planetsizecpu Thanks! Would be nice, but I should learn to play chess before! :neckbeard:

planetsizecpu

[08:31](#msg5d0c95f2fd4aa914b515743f)haha me too!

dockimbel

[10:23](#msg5d0cb009e7267a62a914d3ab)The purpose of the built-in `math` is educational (just show that it is possible), it is not meant for real usage, as a much more complex processor would be needed for real-world expressions:

```
>> math [1 + 2 * length? "hi"]
*** Script Error: length? is missing its series argument
*** Where: length?
*** Stack: math also
```

9214

[11:31](#msg5d0cc00f5bc3210bb76ec147)@dockimbel yeah, I omitted expression handling, as it makes processing way too complex and won't work in all cases. `math` is a "local" dialect, in a sense that it supposed to be applied only to deliberately chosen expressions with arithmetic operators.

Also, since, like @dockimbel said, it's purpose is educational, my version was rejected from being merged in the main branch, because it's not really newbie-friendly (but you still can learn a lot from it, esp. about Parse) :neckbeard:

planetsizecpu

[12:58](#msg5d0cd4701e35ef14b68f7725)As a final climax (for now) to the game \[Cave-In](https://github.com/planetsizecpu/Cave-In) I have released level L10, it is a very difficult level due to the large amount of gold bags that you have to collect, a nightmare, I am still testing if everything works well, I hope you like it . The following weeks I will not have time, but if I can do something I will dedicate myself to improve the function AI of the guards, my job for this summer. Later I intend to put the sound effects and music in the background, we will see how everything comes.

[12:59](#msg5d0cd4a4207f6e6963d6979e)\[!\[cavetest101.gif](https://files.gitter.im/red/red/gui-branch/mUWk/thumb/cavetest101.gif)](https://files.gitter.im/red/red/gui-branch/mUWk/cavetest101.gif)

dockimbel

[14:57](#msg5d0cf0701e35ef14b690863c)@9214  
&gt; Also, since, like @dockimbel said, it's purpose is educational, my version was rejected from being merged in the main branch, because it's not really newbie-friendly (but you still can learn a lot from it, esp. about Parse) :neckbeard:

I think we can incorporate your version as it's not much bigger (big mezz code in the runtime has a cost in compilation time and executable size). Just don't add anything to it anymore. ;-)

AlexanderBaggett

[15:42](#msg5d0cfadf007cff7a82f09694)@AiguyGary\_twitter , thanks for sharing d3js.

toomasv

[16:20](#msg5d0d03bdbc834f76a4b8666e)@planetsizecpu Great work! Have a nice summer!

## Thursday 27th June, 2019

planetsizecpu

[06:24](#msg5d14613addc34e0f13f1e257)Thx @toomasv you too!

My tests on weekend for L10 where not sucessful, as it run too slow on computers not so fast, as quad-core pentium machines, this is due to too much running elevators. I decided to remove the ones not strictly needed to play, so the game runs better, and in turn, it is a few more interesting. I have also corrected some problem in the guards route of the right screen. Now it's time to take a break.  
See you all here!

[06:25](#msg5d146177aacbfb5fb7d7d13e)\[!\[cavetest102.gif](https://files.gitter.im/red/red/gui-branch/1PqC/thumb/cavetest102.gif)](https://files.gitter.im/red/red/gui-branch/1PqC/cavetest102.gif)

endo64

[08:37](#msg5d14803b4e13324f8b9a8ca9)@planetsizecpu We can examine why running elevators slows down the code that much, there might be optimization points.

planetsizecpu

[09:57](#msg5d149319aacbfb5fb7d98082)@endo64 I think it is related to `rate` timers not only elevators, but kart and guards, spiders, drops also. As more timers you set, as more slow it runs, but I haven't noted anything before, L10 at origin had twelve timers plus game timing, no other level had that number of timing events. So we can optimize on multiple functions.  
Today I compiled the code in W10, and was my surprise at running the exe file: W10 tells you if you want to save the video while playing, by hitting \[Win] key + 'G', I did it. The question is how the hell they know my exe is a game? anyway now I can say for first time in my life I developed a game for windows haha.

endo64

[11:00](#msg5d14a1c1501ea60f1255ee0a)Well it is obvious that it is game :-)

dockimbel

[11:39](#msg5d14aafbddc34e0f13f49c59)@planetsizecpu For a game, you should only need one timer with ticking frequency matching the target desired FPS, then move everything incrementally on the screen from the timer handler.

planetsizecpu

[12:53](#msg5d14bc4bb3f22a4b2a48c1c0)@dockimbel Yes, that would be a different approach. When I came up with the game I thought that each object could have its own independent timing and call its management function, that way the main cycle of the game would be simpler in theory, since all the objects except the boy would have autonomous movement. If I had time I could deactivate the `rate` timers of the objects and call their functions that now manages `on-time` from the main loop of the game (which already has its timing), I think it can be done with a cycle of `foreach-face` to call their same handling functions, maybe that way the process would be speeded up a bit, but the main slowing problem is on handling functions. The problem is that this involves time and tests that I don't have for now. There are still some aspects to improve as the AI of the guards and the sound, I think it is better to finish it and then see what happens, because perhaps nobody plays at the end, we do not know. Apart from this, I have some new project in mind in which I would use what I learned with this game.

Anyway I appreciate your input a lot, so thx!

AlexanderBaggett

[17:15](#msg5d14f99811ba925f6a382c3e)@planetsizecpu , Great work on the game.

## Saturday 29th June, 2019

loziniak

[19:00](#msg5d17b5654db9b92ce37088ac)Hi! My approach to fluid layouts:  
https://github.com/robotix-pl/resize-deep  
There's certainly space for improvement, but it is already usable at this stage. If you can point out some errors or thigs that can be improved, I'll be grateful for every GitHub issue .

endo64

[19:14](#msg5d17b8898dff05627b9255a1)@loziniak I just tested and it works well on Win10, nice work!

[19:16](#msg5d17b92a79f6d94a8ef77d74)Why `in-extra?` is an `op!` instead of a normal function?

loziniak

[19:22](#msg5d17ba5ea611a04ff1a1c7df)`if 'fixed in-extra? parent` seems closer to English \*if fixed is in extra field of parent*

greggirwin

[19:53](#msg5d17c1b52be6a2404deccd60)Very nice @loziniak. For `in-extra?`, since you're not using the return value, or `/skip` with blocks (not sure if that's intentional), you can just use `find`.

It does drop some resize events for me on Win10 here.

dockimbel

[20:57](#msg5d17d0b6189e7b4ff035d320)@loziniak Nice work! Dropping some resize events on Win7 here also.

[20:57](#msg5d17d0d1a611a04ff1a2913f)This code pattern can be simplified a bit: `to pair! reduce [child/size/x 0]` =&gt; `as-pair child/size/x 0`

[20:58](#msg5d17d100da128007c6955ef4)FYI, I did use a very similar approach for VID in Rebol2: https://github.com/dockimbel/auto-resize

## Sunday 30th June, 2019

mikeparr

[08:20](#msg5d1870cda611a04ff1a7ca54)@loziniak Are you planning for nested panels?

loziniak

[11:17](#msg5d189a594db9b92ce37818d4)@mikeparr , there are nested panels already. `window` is treated as a panel, and it has a panel inside.

mikeparr

[11:35](#msg5d189e6faa095d404ce7dd69)@loziniak Nested panels - yes, thanks, but I wondered if your work resizes inner panels also?

loziniak

[11:36](#msg5d189ecb2be6a2404df3e866)Yes.

[11:39](#msg5d189f75a8b20942baaf5e13)As long as they have `extra` facet set to object or block with `expand` key set to `vertical` or `horizontal` or both.

[11:47](#msg5d18a15c189e7b4ff03cbc2a)@greggirwin , good point, thanks. That will spare me 10 lines of code!

[11:52](#msg5d18a28ada128007c69c215d)@dockimbel @greggirwin What do you think is causing these dropped events? Is this because they come too quickly for the processor to compute and resize the layout?

greggirwin

[20:20](#msg5d1919753d12712ce4bb5f37)`reisze` shouldn't come in too fast, but `resizing` does. But the problem does't seem to be in your code. I can dupe it with just `view/flags [on-resize [print face/size]] 'resize` on Win10.

## Monday 1st July, 2019

dockimbel

[11:41](#msg5d19f16eda128007c6a79d08)@qtxie ^---

BeardPower

[13:12](#msg5d1a06b6ddd2c007c740564a)

qtxie

[17:10](#msg5d1a3ea3da128007c6aa95b9)The gui-console steals some `resize` event somehow.

## Thursday 11st July, 2019

Oldes

[13:52](#msg5d273f330c8c4114d9103763)@qtxie I've tried this script:

```
i: make image! size: 600x600
dr: [line-width 10 pen 0.0.0 line 0x0 0x0]
view/no-wait [g: image i]
forever [
	dr/4: random 255.255.255
	dr/6: random size
	dr/7: random size
	draw i dr
	show g
	wait (1 / 30)
]
```

and it stops working after a few seconds :-(

[13:53](#msg5d273f7217cc7b05caaecc60)(I know that I could use `rate`, but I suppose, this should be working too)

meijeru

[16:06](#msg5d275e81d0e06b66758889cd)@Oldes `(1 / 30)` evaluates to `0` in my REPL

[16:07](#msg5d275ebdf5dd145742687c5a)Shouldn't that be `1.0 / 30` ?

qtxie

[18:53](#msg5d2785bed14e297762b47710)@Oldes It doesn't work at all on my computer.

Oldes

[18:58](#msg5d2786ed202bb93f0086f2d1)@meijeru you are right, but the result is same. @qtxie it works for me like 5 seconds and then the window stops responding. Looks like the events have no time to go thru or something like that?

[19:01](#msg5d2787773be99c478631fff3)This seems to work:

```
i: make image! size: 600x600
dr: [line-width 10 pen 0.0.0 line 0x0 0x0]
view/no-wait [g: image i]
forever [
    dr/4: random 255.255.255
    dr/6: random size
    dr/7: random size
    draw i dr
    show g
    do-events/no-wait
    wait (1.0 / 30)
]
```

[19:01](#msg5d2787983be99c4786320090)but when I close the window, than there is this error:

```
*** Script Error: VIEW - face not linked to a window
*** Where: do
*** Stack: show cause-error
```

[19:03](#msg5d2787f77dbfff32428e8712)@qtxie I was expecting, that `do-events` is not required when there is `wait`, but I was wrong:)

## Friday 12nd July, 2019

rsheehan

[01:12](#msg5d27de6201621760bc9b2854)Is there anyway to get the insertion point position in the text of a View Area? I can get selected text positions but I would like the current position of the cursor, and I don't want to have to make my own widget if I can help it. Thanks

toomasv

[05:28](#msg5d281a6501621760bc9cae3e)@rsheehan Alas, currently it is possible only by counting your movements in area, not directly.

rsheehan

[05:30](#msg5d281ae001621760bc9cb25c)@toomasv That's what I was afraid of. Thanks anyway, at least I know I have to do it that way now :).

Oldes

[07:19](#msg5d283495eab6cd77635451a5)@dockimbel isn't comment \[at this line](https://github.com/red/red/blob/6e3a460d29153bed585efbd16041e5ab1754e9db/modules/view/backends/windows/gui.reds#L62) wrong?

qtxie

[07:48](#msg5d283b584d750532412fa16f)@Oldes Sorry. It works. I just realize that I have to press `Enter` after pasting the code into the gui-console.

[07:50](#msg5d283be1e190903936cf1bf2)You need to test if the window has been closed or not. Otherwise the `forever` loop will try to show a closed window, which cause the error.

```
i: make image! size: 600x600
dr: [line-width 10 pen 0.0.0 line 0x0 0x0]
win: view/no-wait [g: image i]
while [win/state] [
    dr/4: random 255.255.255
    dr/6: random size
    dr/7: random size
    draw i dr
    show g
    do-events/no-wait
    wait (1.0 / 30)
]
print "finished"
```

[07:53](#msg5d283c607dbfff3242934ca4)It works fine on Win10. What OS are you using?

[07:56](#msg5d283d423b41924785a595c3)@Oldes &gt; I was expecting, that do-events is not required when there is wait, but I was wrong:)

Once we have asynchronous IO, just a `wait` should be enough. ;-)

Oldes

[08:52](#msg5d284a4eeab6cd776354e874)Yes... it is working fine when I `do-events` :) Thanks.

[09:14](#msg5d284f8b3596f56f8cc49dba)@qtxie it's just a detail, but regarding the `win/state`, should not the `unview` (closing window) set `win/parent` and `win/visible?` to `none` too?

qtxie

[09:47](#msg5d28573ff4fe943971f40e2b)@Oldes I'm not sure. Seems not necessary to set them to `none`.

Oldes

[09:49](#msg5d28578f3b41924785a65ef7)but it would look better to have `while [win/parent]` or `win/visible?` than `win/state` which is for internal use.

qtxie

[09:51](#msg5d28583e7dbfff3242940873)The values in `state` block are for internal use. But `state` itself is not, the user can use it to check if the face is instantiated or not.

Oldes

[11:32](#msg5d286fe53596f56f8cc5807f)One more question... the positioning of the window is now modified so the window's borders/caption is fully visible, which then makes this:

```
>> win/offset: 100x100
== 100x100
>> view win
>> win/offset
== 102x124
>> view win
>> win/offset
== 104x148
```

Wouldn't it be better to use the offset as a left-top position of the content instead?

qtxie

[11:54](#msg5d2874fb202bb93f008d6219)Yes. Something is wrong there. The offset should be 100x100.

Oldes

[12:10](#msg5d2878c154d3383937f34613)Definitely wrong (on Win10) is that the window is not exactly on the left edge. The reset is more about decision how to interpret the window position, which is not that easy as users may have different needs.

dockimbel

[13:43](#msg5d288e93c3740260bb0c19cd)@Oldes Yes, for the `/parent` facet, it should be set to `none` when the face is detached from the face tree.

[13:45](#msg5d288eeac3740260bb0c1d24)@Oldes  
&gt; @dockimbel isn't comment \[at this line](https://github.com/red/red/blob/6e3a460d29153bed585efbd16041e5ab1754e9db/modules/view/backends/windows/gui.reds#L62) wrong?

It should be correct, but incomplete. I remember we reserved more than what we really use, because IIRC, sub-classing uses that field too, so we leave the first 64 bytes for widgets internal usage, and start putting our data after that. We checked for each widget we use that they take less than 64 bytes. @qtxie might know better.

Oldes

[15:12](#msg5d28a34c3e2c7e397071cd0c)Hm... but if I understand \[this table](https://github.com/red/red/blob/6e3a460d29153bed585efbd16041e5ab1754e9db/modules/view/backends/windows/gui.reds#L13-L33) correctly, you are allocating 80 bytes (60 + 20) but use only 48 bytes so far, right?

[15:14](#msg5d28a3b8202bb93f008ed19d)Is there any reason why there is the `wc-offset`? Is it just to make it clear, that the negative values are for internal widget use (and can be extended in the future)?

dockimbel

[15:15](#msg5d28a41b3e2c7e397071d4b7)@Oldes Correct.

greggirwin

[17:13](#msg5d28bfc0d14e297762bd004b)@rsheehan what is it you want to do with the cursor position? Use cases can help guide design.

Oldes

[20:04](#msg5d28e7ba3be99c47863bc1ed)@qtxie when I go back to my drawing lines experiment with added `prin`:

```
i: make image! size: 600x600
dr: [line-width 10 pen 0.0.0 line 0x0 0x0]
win: view/no-wait/flags [g: image i] [resize]
while [win/state] [
    dr/4: random 255.255.255
    dr/6: random size
    dr/7: random size
    draw i dr
    show g
    do-events/no-wait
    wait (1.0 / 30)
    prin "."
]
print "finished"
```

Is there any way how not to stop evaluation, when the window is being dragged or resized?

[21:38](#msg5d28fdba54d3383937f73e86)Looks like this is a reason why to use `rate` in the view instead of tight loops.

```
i: make image! size: 600x600
dr: [line-width 10 pen 0.0.0 line 0x0 0x0]
view/flags [
	g: image i rate 0:0:0.02 on-time [
	    dr/4: random 255.255.255
	    dr/6: random size
	    dr/7: random size
	    draw i dr
	]
] [resize]
```

Although with `rate` one will not get high FPS if needed and there is the 500ms pause after window drag start.

## Saturday 13th July, 2019

rsheehan

[04:03](#msg5d29581a570ac36f8d1563c0)@greggirwin I was thinking of a structure editor where knowing the insert position would determine the types of inserts that were allowable at that position. I can fake this by checking the text content before and after inserts to determine where the cursor must have been. A related option if the program could also set the cursor position would be to jump to particular elements in the text.

planetsizecpu

[11:45](#msg5d29c46d7dbfff32429dfdd1)@AlexanderBaggett Thx.

I'm here again.

I took my time for home works, then I did a depth search on the web for the original arcade videogame, so I may have been mistaken, the real game name was \[Bagman](https://www.youtube.com/watch?v=NOHzwQIYrJA) from the french company Valadon Automation, I don't know from where I remember Cave-In game, maybe my mind's fog, anyway I'll preserve the actual name as \[Cave-In](https://github.com/planetsizecpu/Cave-In)

I made some upgrade in the first levels gravel scenarios to follow the original look, then looked the available videos on the web to learn how guards work, this way I adopted a new approach to the guards behavior function, now they are a bit more intelligent so the game in turn is more interesting, I still have to correct some guards-crossing event when walls are close.

Here are images from original Bagman and Bagman 2nd edition.

Next is level 10 with new guards function, look how they come on...

[11:45](#msg5d29c47454d3383937fc5941)\[!\[bagman.png](https://files.gitter.im/red/red/gui-branch/OwKq/thumb/bagman.jpg)](https://files.gitter.im/red/red/gui-branch/OwKq/bagman.png)

[11:47](#msg5d29c4ebc3740260bb147d5e)\[!\[cavetest105.gif](https://files.gitter.im/red/red/gui-branch/nog8/thumb/cavetest105.gif)](https://files.gitter.im/red/red/gui-branch/nog8/cavetest105.gif)

## Sunday 14th July, 2019

Re-git

[22:48](#msg5d2bb12f3b41924785bd6a14)What is a good way to get the mouse cursor position inside a window?

```
view/flags [
    on-over [probe event/offset]
    base red
] 'all-over
```

I tried using `on-over` but this only works if cursor is over the backdrop of the window and stop working when cursor gets over any face inside window.

## Monday 15th July, 2019

toomasv

[07:09](#msg5d2c26bbf4fe9439710e578d)@vejitatoja I experimented a bit and got this:

```
system/view/capturing?: yes
view/flags lay: layout [
    on-detect [
        ofs: either event/face/type = 'window [0x0][event/face/offset] 
        attempt [if 0 <= event/offset/x [probe event/offset + ofs]]
    ]
    on-close [system/view/capturing?: no]
    base red all-over
    base blue all-over
] 'all-over
```

But may-be there is some more direct way too, I don't know.

dockimbel

[07:49](#msg5d2c2ff454d33839370d2dfd)@vejitatoja Out of curiosity, what is your use-case?

endo64

[11:19](#msg5d2c614d3e2c7e39708b648e)This one is also interesting, event triggered once when you enter the window area:

```
view [
    on-over [probe event/offset]
    base red all-over
]
```

toomasv

[12:55](#msg5d2c77aceab6cd7763716071)And negated window offset when entering base.

[13:15](#msg5d2c7c633b41924785c2ff7f)For nested structures:

```
system/view/capturing?: yes
view/flags [
    on-detect ['local [fc ofs]
        fc: event/face ofs: 0x0
        while [fc/type <> 'window][
            ofs: ofs + fc/offset
            fc: fc/parent
        ]
        attempt [if 0 <= event/offset/x [probe event/offset + ofs]]
    ]
    on-close [system/view/capturing?: no]
    panel red all-over [base gold all-over]
] 'all-over
```

dockimbel

[22:19](#msg5d2cfc0c4d7505324150bed5)@qtxie ^---

## Wednesday 17th July, 2019

greggirwin

[17:03](#msg5d2f54ffd14e297762ebcb8d)@planetsizecpu thanks for the update!

@rsheehan, @toomasv has done a number of rich text experiments, which may work for you, though it's a more complex style. The native widgets are limited in many ways, and while adding support for, e.g., `EM_GETCARETINDEX` on Windows should be easy, we then have to figure out how to expose it. Using the `selected` facet, we could return an integer, rather than a pair, to denote that there is a starting point to the selection, but not an end. The question then is whether `none` should ever be returned.

[17:06](#msg5d2f557ff4fe943971261717)Other platforms will have similar APIs.

rsheehan

[22:22](#msg5d2f9f953b41924785da4852)@greggirwin Thanks Gregg, I was intending to look at rich text but haven't gotten there yet.

greggirwin

[23:26](#msg5d2faeb4570ac36f8d4258e4)If anyone else wants to comment on my quick thoughts above, that would be great. Also good would be reasons \*not* to do it.

## Thursday 18th July, 2019

toomasv

[05:20](#msg5d3001a5a26c1643bccadf55)I like what you propose. Missed it in several occasions. E.g. it would enable remembering the last position in area and restoring it on reentering. `none` should be returned if `text` facet is `none`. Otherwise 1-based as normal `index?`. Existing code would not be too hard to update.

## Monday 22nd July, 2019

ldci

[14:32](#msg5d35c91935e05c09938005af)General update for redCV before summer break: https://github.com/ldci/redCV/tree/master

endo64

[16:45](#msg5d35e8128fe53b671dba391b)Thank you @ldci ! May I kindly suggest you to write more meaningful commit messages, it would be much easier to track what's updated

greggirwin

[18:00](#msg5d35f9a9ec5abe7bbc2d00fc)Thanks @ldci have a nice break. I'll second @endo64's request. When we don't keep up, it's hard to tell what "update" might mean. :^)

## Tuesday 23th July, 2019

ldci

[11:46](#msg5d36f381ec5abe7bbc33c220)I agree. I was in rush yesterday. Relly sorry :)

[11:46](#msg5d36f38e35e05c0993883f99)Really sorry :)

greggirwin

[18:02](#msg5d374bd309580b7bbb92d40c):^) We're excited to see updates in any case.

Oldes

[22:07](#msg5d37850aec5abe7bbc3800e6)@qtxie It looks that there is some leftover (`modes`) in this function: https://github.com/red/red/blob/613d71cfc26789c3b404176a31b54d5e054c3b88/modules/view/backends/windows/gui.reds#L899-L921

## Thursday 25th July, 2019

qtxie

[03:57](#msg5d3928a2081e44596e25899a)@Oldes Yes. Seems it is a leftover.

## Monday 29th July, 2019

ralfwenske

[04:43](#msg5d3e796d8aab922429dc5a38)I am not sure if this is GUI related but I post here anyway:

```
Red [needs: view]
num: 0
process: func [][
    repeat i 100 [
        wait 0.1
        num: to-percent ((to-float i) / 100)
	print num
    ]
]
view [size 200x200
    below
    progress 100x20 20% react [face/data: s/data]
    s: slider 100x20 20%
    progress 100x20 20% react [face/data: num]
    button "start process" [process]
]
```

when I run this the progress bar driven by the slider works,  
however the one with num doesn't. It prints correctly 0% to 100%.  
What am I not understanding?

greggirwin

[04:48](#msg5d3e7a838aab922429dc5f93)`num` needs to be part of a reactive source. From the docs:

&gt; Red implements the object-oriented reactive programming model, where only object fields can be the source of change.

So you need to put `num` in a `reactor!` and reference it via that.

[04:49](#msg5d3e7ad38aab922429dc6321)e.g.

```
Red [needs: view]
r-src: make reactor! [num: 0]
process: func [][
    repeat i 100 [
        wait 0.1
        r-src/num: to-percent ((to-float i) / 100)
        print r-src/num
    ]
]
view [size 200x200
    below
    progress 100x20 20% react [face/data: s/data]
    s: slider 100x20 20%
    progress 100x20 20% react [face/data: r-src/num]
    button "start process" [process]
]
```

ralfwenske

[04:54](#msg5d3e7bec84bc7a717fdf7fc3)That gives me a better idea, thank you. Even though, something seems to be missing:  
The progress bar jumps to 100% after the repeat loop. Do I have to have some sort of refresh?

greggirwin

[04:55](#msg5d3e7c48ce271b4acd264edc)I'm on Win10 and it's OK. If you're on MacOS, could be that.

ralfwenske

[04:56](#msg5d3e7c803e51d77b1b88cb5a)Should I put this to red/bugs ?

greggirwin

[04:57](#msg5d3e7cb3ce271b4acd2650b2)Yes, and see if adding `loop 3 [do-events/no-wait]` after the `r-src/num:` line fixes it.

ralfwenske

[04:59](#msg5d3e7d147e00fc4ace6a006a)Cool - that fixes it.

rcqls

[05:09](#msg5d3e7f7684536e27e068f867)@greggirwin Why not only `do-events/no-wait`? I guess there is a good reason Actually this trick without `loop` seems to work on both macOS and red/GTK.

ralfwenske

[05:13](#msg5d3e80858aab922429dc887b)@rcqls Confirmed (on macOS)

greggirwin

[06:30](#msg5d3e92702136933a870d3fcb)@rcqls habit for me, since in the past it often took 2 or more calls to let the OS message pump breathe.

rcqls

[06:37](#msg5d3e941584bc7a717fe02a23)@greggirwin thanks for this share!

## Thursday 1st August, 2019

ralfwenske

[05:50](#msg5d427d8f1dc3324670e1d9e9)On OSX I observe that long text inside an area does not wrap nor is there a vertical scroll bar. I remember seeing an image in \[helpin.red](http://helpin.red/Faces.html) where it seems to wrap.  
Should it work or are there any settings that might help?

greggirwin

[17:19](#msg5d431f274b8ca519c9c8c863)@ralfwenske, are you using `wrap`?

```
view [area wrap "one two three four five six seven eight nine ten" 60x75]
```

## Friday 2nd August, 2019

ralfwenske

[00:48](#msg5d43884741d5cd61b59a304a)@greggirwin thanks. How would I go about to find something like this. The \[docu](https://doc.red-lang.org/en/view.html#\_area) mentions `wrap?` only under `para object`. The console `?` and `source` are very helpful in many cases - is there anything (not too deep) in regards to view elements?

[03:40](#msg5d43b0b6757b7b19c83cedc1)When copying source text from VC and pasting into area I was (pleasantly) surprised to see the color markup retained. Is there documentation how to do that programatically?  
Also I detected that text rewraps when increasing width of area whereas text does not rewrap when shrinking width. \[Code and images](https://github.com/ralfwenske/area-wrapping-issue).

[04:23](#msg5d43baada96def4751a11994)@greggirwin My observation that `area` needs explicitly `wrap` was wrong because I only looked for reaction when shrinking `area`s width. When pasting text into a small area it wraps correctly. (except see above).

toomasv

[06:27](#msg5d43d7dcff59f961b4fd6e5e)@ralfwenske For VID keywords you need to look at \[VID document](https://doc.red-lang.org/en/vid.html), where you'll ind \[wrap](https://doc.red-lang.org/en/vid.html#\_wrap) too.

ralfwenske

[06:48](#msg5d43dcd64635976e04163548)Thanks @toomasv it seems I won’t easily get away with a \*not too deep* approach :) (at least at this alpha stage where beginners documents aren’t complete)

toomasv

[06:59](#msg5d43df623d8f1f29e0f900e0)You are welcome! Doesn't VID make it exactly \*not too deep* approach? :smile:

ralfwenske

[08:09](#msg5d43ef9ea96def4751a2930e)@toomasv I agree. Those deep thoughts that appear to be behind the entire language and implementation is what i like about it. Learning it is fun because there always comes along appreciation about the design (especially in contrast to my attempts to learn JavaScript :) )

AiguyGary\_twitter

[09:28](#msg5d440251a96def4751a32b09)My problem with wrap and scroll isthat when I appended text into the area and it wrapped to multiple lines the scroll bar did not stay in synch with the bottom most text displayed (autoscroll down) so it was not visible. Somebody said earlier that scroll bar might get some love in 6.5 if possible. But no promises were made. My alternative kludge is that if the bottom text is not visible just to hit return a few times to force it to scroll up a few more times so I can read it.

[09:53](#msg5d44080e7c87746165fa0e7b)@toomasv I agree that VID makes for a not too deep approach. Edge cases right now lie the scroller work arounds just make you dive deeper than you would like to for something that should seem to to just work. But when dealing with pre-1.0 software patience, a positive attitude and realistic expectations are necessary. Hence my excitement about the forth coming Pro version. Just hope it is not cloud based or something like other low-code solutions on the market.

greggirwin

[17:37](#msg5d4474d93d8f1f29e0fd8656)@AiguyGary\_twitter on auto-scroll-down, is there a precedent in other GUI tools for this? I can see both sides, where I \*wouldn't* want it to do that, which means supporting it is either a tradeoff or a new facet.

GaryMiller

[19:07](#msg5d4489ea3d8f1f29e0fe2d65)The natural behavior for any console window is to scroll down a line at a time as you type into it if you are on the bottom line of the visible portion of the screen. So if you are receiving a line of text from a program or another user in chat it should observe the same behavior if autoscroll is turned on. I just think the word wrap needs to be taken into account too so if 1 line sent ends up wrapping into 4 lines the correct number of scrolls keeps all the bottom text that was sent visible.

## Saturday 3th August, 2019

ralfwenske

[08:19](#msg5d4543777c87746165031347)Can someone confirm my observation regarding inconsistent area text wrapping: :point\_up: \[August 2, 2019 1:40 PM](https://gitter.im/red/red/gui-branch?at=5d43b0b6757b7b19c83cedc1) If so has it been reported already?

toomasv

[10:04](#msg5d455c41475c0a0febefe1f9)@ralfwenske On Windows 10 it rewraps on increasing as well as on decreasing window size.

ralfwenske

[10:31](#msg5d456278475c0a0febf00801)@toomasv thanks. So it’s unlikely having been reported. I will post an issue tomorrow.

toomasv

[10:34](#msg5d45631fee80d76164de2e26)@ralfwenske You can check if there is something connected in issues. E.g. add `wrap` to filters and press enter.

## Sunday 4th August, 2019

ralfwenske

[06:15](#msg5d4677e6475c0a0febf74b46)@toomasv Thanks - I’ve posted an issue #https://github.com/red/red/issues/3964

toomasv

[06:20](#msg5d46793dff59f961b40feac9):+1:

## Wednesday 14th August, 2019

quan-nh

[03:38](#msg5d53821b9507182477d47a6d)on VID gui, how to handle keyword shortcuts, e.g. `windows + o` to open a file?

bitbegin

[03:45](#msg5d5383cb9507182477d484c7) view \[area on-key \[probe event/ctrl?]]

[03:46](#msg5d53841d1dadc42a116864f0)seems it not support `windows + key`

quan-nh

[03:49](#msg5d5384b5029a51607f8db7a6)how to detect the combination of keys, e.g. `ctrl + o` ?

bitbegin

[03:52](#msg5d5385919507182477d48f49)view \[area on-key \[if event/key = #"^O"\[print "detected"]]]

quan-nh

[04:05](#msg5d53889353490e334dea9af7)can we bind the `on-key` event to the container (window) instead of `face`?

toomasv

[04:21](#msg5d538c462612bb718c63a45d)On Windows `event/ctrl?` is detected when area has focus.  
You can also do

```
view [area focus on-key [probe event/ctrl?]]
```

To check combinations:

```
view [area focus on-key [if all [event/key = #"^O" event/ctrl?] [print "detected"]]]
```

To detect events on window:

```
system/view/capturing?: yes
view [size 300x300 on-detect [if event/type = 'key [probe event/ctrl?]] area]
```

quan-nh

[04:26](#msg5d538d79d03a7c63e6237df3)thanks! can we detect the `window` key (`Command` on MacOS)? or just Ctrl, Shift

toomasv

[04:31](#msg5d538eb97d56bc60804d29dc)I am out now, can’t check. But why don’t you try?

[07:53](#msg5d53be0f7d56bc60804e6c59)@quan-nh Here's what I see on Windows on pressing `window` key:

```
view [size 300x300 on-down [face/selected: none] on-detect [if event/type = 'key [probe event/key]] area]
left-command
```

quan-nh

[08:01](#msg5d53bff1a4efe3718dfcf3f9)nothing is detected when press `Command` key on MacOS :(

toomasv

[08:04](#msg5d53c0a3bfd2887f53e69cc6) :worried:

rcqls

[08:11](#msg5d53c2141db76d0ffecc9ea6)@toomasv I have to check what is `on-detect` but it is not yet implemented on Red/GTK too. In such case on red/GTK I use `on-key`. However `Cmd` is not recognized yet for on-key.

toomasv

[08:12](#msg5d53c25bd03a7c63e624e1bd)@rcqls See \[here](https://doc.red-lang.org/en/view.html#\_event\_flow) (11.4)

rcqls

[08:12](#msg5d53c26d4e17537f522bad14)@toomasv Thanks!

toomasv

[08:12](#msg5d53c275029a51607f8f6350):+1:

rcqls

[08:18](#msg5d53c3d47d56bc60804e9c10)@toomasv I guess it is not so easy to implement… at least for Red/GTK. I need to think about it more carefully by reading the gtk doc with this in mind. Thanks again for pointing this feature.

toomasv

[10:09](#msg5d53ddcfa4efe3718dfdc7dc)Glad to be of help!

rcqls

[16:14](#msg5d5433659507182477d963cb)This mechanism is implemented inside`capture-events` in pure red. Example `tests/events-flow.red` works for clicking `on-down` but an adaptation for `on-key` seems to work on macOS except for special key. Also `area` is a widget special for this task. As usual you give me @toomasv an opportunity to learn some specific feature that Ialready read in the doc but I did not guess how it was useful in the red/GTK implementation.

greggirwin

[18:58](#msg5d5459d753490e334df0b3a7)In R2, VID let you specify simple hot-keys for faces, using `char!` values. We want an improved model in Red, which has to account for menu accelerators, and labels associated with fields, that set focus on the field, which ties into having a tab order, which... nothing is simple.

## Thursday 15th August, 2019

quan-nh

[08:23](#msg5d551680c87a0963e7740efd)do we have vertical scrollbar with `rich-text` face, I can't find it on document :(

greggirwin

[09:07](#msg5d5520d5bfd2887f53f0a4cb)Not at this time @quan-nh.

[09:08](#msg5d5520ff1db76d0ffed6c639)@toomasv might have a gist or example for putting one in a panel, with a separate scroller.

toomasv

[09:11](#msg5d5521c0bfd2887f53f0ab6b)@quan-nh One example of scroller with rich-text is \[here](https://github.com/toomasv/learning/blob/master/snippets/scroller/rt-scroller.red). See \[other examples](https://github.com/toomasv/learning/tree/master/snippets/scroller) too.

quan-nh

[09:22](#msg5d55244e9507182477e02de0)can we have similar behavior with `area` scrollbar? e.g. my `rich-text`is large, so I only display part of it, then when I scroll down, I can see another part?

toomasv

[09:30](#msg5d552647a4efe3718d073c0f)Yes, you can do it. You have to determine scroller's `max-size` and `page-size`, also your line-heights.

quan-nh

[09:38](#msg5d552827beba830fff97b94c)yep, let me try, thanks @toomasv

rcqls

[09:39](#msg5d5528425178a724768f93a1)BTW, another sophiticated example is `gui-console.red`. I know that since I am fighting with it unsuccessfully on the Red/GTK side!

toomasv

[13:08](#msg5d5559367d56bc60805a304c)@quan-nh Here is an example with fixed text:

```
view [
    panel 320x100 white [
        origin 4x4 space 0x0 rt: rich-text 300 "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?" 
        pad 0x-4 scroller 16x100 [
            rt/offset/y: 0 - to-integer max 0 min rt/size/y - face/size/y face/data / face/steps * lh
        ] on-created [
            face/steps: 1.0 / (1.0 * rt/size/y / (lh: rich-text/line-height? rt 1)) face/selected: h / lh
]]]
```

This uses VID scroller, which seems not to be documented yet. And, to be honest , I'm not quite sure what exactly goes on here, but it works. (I know this is not good recommendation)

The other option is to use embedded scroller, but there are some caveats:  
1\) It seems to be unfinished, so it is not documented either.  
2\) When you embed it directly in rich-text, then it will cover part of your text.  
3\) If you embed it in panel, which contains also the rich-text, then it is errant -- even if you embed only vertical scrollbar, it still generates events as-if it were horizontal.  
4\) And even if you use horizontal-scrollbar event-names to adjust rich-text vertically (which works), trace still wouldn't work.

So, I suggest to use something like the above solution. It doesn't allow dynamic addition/navigation/deletion of the text though, which would need special implementation.

[13:33](#msg5d555f3d2612bb718c70e7df)Ah, sorry, the last `h / lh` should rather be `1.0 * face/size/y / rt/size/y`. `h / lh` was left there from earlier experimentation.

greggirwin

[17:08](#msg5d55918cc87a0963e777c8b8)A recent link in red/welcome led me to \[this](https://blog.qt.io/blog/2018/10/10/introducing-distance-field-generator/). Quite interesting read on pre-rasterizing fonts for higher speed text rendering.

## Saturday 17th August, 2019

quan-nh

[11:26](#msg5d57e46d029a51607faeb6af)@toomasv seem `scroller` face is not available on MacOS, I got this error `*** Script Error: VIEW - invalid face type: scroller`, with `macOS red-16aug19-e47ade4e`

toomasv

[13:09](#msg5d57fca1d03a7c63e644f8c6)Have to wait then.

## Sunday 18th August, 2019

planetsizecpu

[09:50](#msg5d591f499507182477fee599)Today I have uploaded the latest improvements in the game, now the boy can take the gold bag  
or the pickax while traveling in the kart, as in the original arcade game; before he had to release  
them for jump on.  
During the tests I detected a very well hidden fault while traveling in the kart, if a guard  
were hit then sometimes you could not jump out, this has been corrected.

I intend to start with sound testing after the summer, we will see how it fits with the game rate  
porting and experiments done by @toomasv would help a lot, so thx!

[09:51](#msg5d591fb4beba830fffb66062)\[!\[cavetest110.gif](https://files.gitter.im/red/red/gui-branch/HsrC/thumb/cavetest110.gif)](https://files.gitter.im/red/red/gui-branch/HsrC/cavetest110.gif)

GiuseppeChillemi

[10:00](#msg5d5921c2d03a7c63e64dd45c)I feel so 1980....

planetsizecpu

[10:03](#msg5d59225e7d56bc6080775b1d)me too, that's why I made the game, love 80s haha, if you look closely, the boy holds the goldbag with his teeth while hanging on the handle :-)

GiuseppeChillemi

[10:06](#msg5d592336029a51607fb85818)Oh, now I see it !

toomasv

[12:57](#msg5d594b3e7d56bc608078a5a2)Very nice, @planetsizecpu ! :+1:

planetsizecpu

[12:58](#msg5d594b70d03a7c63e64f26a8)You're welcome

## Monday 19th August, 2019

greggirwin

[17:38](#msg5d5ade9b95071824770dbaa9):^)

## Friday 23th August, 2019

planetsizecpu

[16:02](#msg5d600e17a498b6723782acf5)\[!\[cavetest111.gif](https://files.gitter.im/red/red/gui-branch/lS48/thumb/cavetest111.gif)](https://files.gitter.im/red/red/gui-branch/lS48/cavetest111.gif)

[16:03](#msg5d600e65022dba538e4a245d)Just now I added capability to carry gold from other floors, that help is ever welcome!

ldci

[16:14](#msg5d6010f135f914538d72a162)Hi, you can play with ffmpeg from Red: https://github.com/ldci/ffmpeg

Respectech

[17:21](#msg5d60208c38f9c27238bee393)@ldci Do you have some examples of ffmpeg from Red? I'd LOVE to see that!

ldci

[17:40](#msg5d60250ee403470ab6c43915)@Respectech : you'll find some examples in /video directory. Just compile the code. More to come in a few days.

Respectech

[18:16](#msg5d602d7435f914538d736d6d)Nice!

## Saturday 24th August, 2019

planetsizecpu

[08:57](#msg5d60fc07e403470ab6c9cc12)Great job @ldci, is there limitation on videos size? I have a 96MB .mp4 and movies.exe turns on black player screen but not play or seems to hang.

ldci

[09:08](#msg5d60fe7c68406739f9742130)@planetsizecpu if you don’t need sound add -an option in command-Line

planetsizecpu

[09:19](#msg5d610127a498b6723788ffe2)@ldci Just to test I did it, also renamed the file to mpg, but nothing changed, here is what I get. Maybe the file format is not compatible.

[09:19](#msg5d61012ea498b6723788ffe9)\[!\[movies1.gif](https://files.gitter.im/red/red/gui-branch/xPvw/thumb/movies1.gif)](https://files.gitter.im/red/red/gui-branch/xPvw/movies1.gif)

ldci

[11:05](#msg5d6119eea498b6723789a5c9)@planetsizecpu : first of all check you Ffmpeg install under windows (I don't use Windows), and then just try ro read your movie with ffplay -I your movie from the shell.

[16:56](#msg5d616c2107d1ff39f877b577)@Respectech just ffplay tour movie :)

## Sunday 25th August, 2019

Rebol2Red

[14:33](#msg5d629c39c8228962acc110cc)I have a program which compiles fine under an older version of Red (26-5-2019)  
In the latest Red version the program runs fine in the Red-Gui-console  
But when compiling i get no error(s) and when running the created exe i get no errors and nothing shows up!  
I compiled with red.exe -r -t Windows films.red  
In this program i used view so i included Red \[needs: 'View]  
In my program i use view but when i run the compiled version with the latest Red nothing shows up  
How to find out what i have to change in this program to get it working with the latest version? Is there somewhere a changelog?  
Awaiting for an answer i put the old version of Red into the folder of this program.

9214

[14:40](#msg5d629dc368406739f97edc67)@Rebol2Red use additional `-d` flag for compilation, launch your program from console and see if there's any error output. Or use additional `-e` flag and check if your compiled program works as expected.

The best place to continue this is `/help` room though, as your problem is unrelated to View.

endo64

[14:55](#msg5d62a16135f914538d839898)@Rebol2Red it would also help if you can isolate the issue with a minimal example so others can also test.

Rebol2Red

[16:11](#msg5d62b317be3a8a311ae5cacd)@9214 Debug mode or errors?! I mentioned i got no errors when compiling or running  
Please do not point out on rooms when it is not clear if it is in the wrong room. The program uses view and nothing shows up so i think it must be related to view. I'd rather see some good solutions or pointers. I bet something has changed which is good to know but other languages has a changelog. Maybe Red should have too

@endo64 How on earth can i isolate code when i don't know where it is wrong?!

It is disappointing to see people do'nt read well before they answer over here

9214

[16:25](#msg5d62b677be3a8a311ae5e4c6)&gt; I'd rather see some good solutions or pointers

I offered two of them, in case you've missed it:  
\* compile your program with `-d -r -t` flags, launch compiled binary from Windows console and see if there is any debugging output; if there is - share it with us.  
\* compile your program with `-e -r -t` flags and see if it fixes the problem that you experience.

It's impossible to suggest anything else beyond that, as you haven't provided any details or source code.

&gt; I bet something has changed which is good to know but other languages has a changelog. Maybe Red should have too

It's called \[commit history](https://github.com/red/red/commits/master). We don't follow strict semantic versioning release model, so "changelogs" are just a part of commit history between two subsequent version numbers.

&gt; It is disappointing to see people do'nt read well before they answer over here

Indeed it is. And please tone down a bit, we're all trying to help you here.

rgchris

[18:12](#msg5d62cf84c8228962acc268d5)Trying a little `push` experiment:

```
view [
    box 400x400 coal draw [
        pen red
        fill-pen green
        box 10x10 300x300
        push [
            pen off
            fill-pen blue
            box 30x30 320x320
        ]
        box 50x50 340x340
    ]
]
```

I'd expect the last box here to have a red border like the first, however it doesn't appear so. Also, should a 'pushed block inherit the style of its container?

9214

[18:13](#msg5d62cfe4f2821072aa11d7c7)@rgchris like this?  
\[!\[изображение.png](https://files.gitter.im/red/red/gui-branch/PHzU/thumb/izobrazhenie.png)](https://files.gitter.im/red/red/gui-branch/PHzU/izobrazhenie.png)

Rebol2Red

[18:14](#msg5d62cfff07d1ff39f880ce81)Automated build is the issue. Even a simple alert "test" does compile but no alert is shown. The Stable version works fine

rgchris

[18:22](#msg5d62d20368406739f98054e9)@9214 I get this:

[18:23](#msg5d62d205a080d70ab57d5bc8)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/ITyM/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/ITyM/image.png)

9214

[18:24](#msg5d62d246a498b6723794ec21)@rgchris thanks, seems to be macOS-specific. Can you confirm that on the latest build and file a ticket?

[18:26](#msg5d62d2dc49ac051923ad2b75)@rgchris and while at it, could you please check if `alert "test"` compiles and works on macOS (see the error above)?

rgchris

[18:32](#msg5d62d44407d1ff39f880e778)Yes, it does compile with just `-r`

```
$ red -r alert-test.red 

-=== Red Compiler 0.6.4 ===- 

Compiling /.../alert-test.red ...
...compilation time : 2171 ms

Target: Darwin 

Compiling to native code...
...compilation time : 60723 ms
...linking time     : 556 ms
...output file size : 1032192 bytes
...output file      : /.../alert-test 


$ ./alert-test
```

(shows dialog)

9214

[18:32](#msg5d62d4579b381b084ff29ca3)@rgchris thanks again!

rgchris

[18:39](#msg5d62d5d049ac051923ad3fa5)What is the expected inheritance behaviour of a DRAW PUSH block? Should it retain all the style facets relative to its position within its container? e.g. pen, fill-pen, line-width, font, etc.

9214

[18:42](#msg5d62d69f3c1aba311bcdddd7)@rgchris per, documentation:

&gt; Saves the current state (transformations, clipping region, and pen settings).

@toomasv or @qtxie with @dockimbel can elaborate on it I think.

rgchris

[18:43](#msg5d62d6da68406739f9807ea3)I seem to be getting some quirky results, so I'm not quite sure that verbiage clarifies the expected behaviour.

[18:44](#msg5d62d711a080d70ab57d76db)(that to me would only suggest that the next element ignores anything that is changed within the PUSH block—nothing about what the PUSH block inherits)

9214

[18:46](#msg5d62d7a34b1189084e629bfa)@rgchris yep, see for example https://github.com/red/red/issues/3236

rgchris

[18:51](#msg5d62d8cea080d70ab57d83f2)For example:

```
view [
    box 300x300 coal draw [
        fill-pen purple
        push [
            box 10x10 290x290
        ]
    ]
]
```

The box here is purple (inherited fill-pen from container)—is that expected? Does that inheritance work for all the visual facets? e.g. pen, fill-pen, line-width, font, etc.  
(my intuition suggests it should, but it would also not be unreasonable to expect that PUSH clears the slate, reverts to defaults)

9214

[18:53](#msg5d62d931e403470ab6d600a0)@rgchris there's nothing in Draw implementation that suggests reverting to defaults, as far as I can tell. It simply tucks away `draw-state!` struct and then restores it back.

rgchris

[18:55](#msg5d62d988c8228962acc2acf2)However, there's no hint in DRAW docs to suggest that inheritance is implied—and when you get quirky results, the docs can seem ambiguous :-/

9214

[18:58](#msg5d62da3aa498b67237951b87)@rgchris agreed, this needs some clarification.Oh, and \[that](https://github.com/red/red/blob/master/modules/view/backends/macOS/draw.reds#L25) explains why it doesn't work on macOS - it's simply not implemented. Compare it to \[Windows](https://github.com/red/red/blob/master/modules/view/backends/windows/draw.reds#L55), for example.

[19:09](#msg5d62dd0110bb5d2db06c8447)Uh, scratch that. Perhaps the actual state is stored in \[`draw-ctx!`](https://github.com/red/red/blob/master/runtime/definitions.reds#L88) somehow.

rgchris

[19:19](#msg5d62df529b381b084ff2e6fe)Kind of related, in converting the \[SVG example here](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Basic\_Shapes#Basic\_shapes), I have the following Draw block:

```
view [
    box 200x250 draw [
        push [
            pen #000000 
            fill-pen off 
            line-width 5 
            box 10x10 40x40
        ] 
        push [
            pen #000000 
            fill-pen off 
            line-width 5 
            box 60x10 90x40 10
        ] 
        push [
            pen #ff0000 
            fill-pen off 
            line-width 5 
            circle 25x75 20
        ] 
        push [
            pen #ff0000 
            fill-pen off 
            line-width 5 
            circle 75x75 20 5
        ] 
        push [
            pen #ffa500 
            line-width 5 
            line 10x110 50x150
        ] 
        push [
            pen #ffa500 
            fill-pen off 
            line-width 5 
            line 60x110 65x120 70x115 75x130 80x125 85x140 90x135 95x150 100x145
        ] 
        push [
            pen #008000 
            fill-pen off 
            line-width 5 
            polygon 50x160 55x180 70x180 60x190 65x205 50x195 35x205 40x190 30x180 45x180
        ] 
        push [
            pen #0000ff 
            fill-pen off 
            line-width 5 
            shape [
                move 20x230 
                qcurve 40x205 50x230 
                qcurv 90x230
            ]
        ]
    ]
]
```

Aside from auto-closing the `shape` (🙁), it appears `line-width` appears to drop off after the first block.

[19:20](#msg5d62df63e403470ab6d624ed)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/KnWp/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/KnWp/image.png)

[19:21](#msg5d62df9ec8228962acc2d66c)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/Vsdf/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/Vsdf/image.png)

[19:21](#msg5d62dfb368406739f980b9d9)(original example ^^^)

[19:26](#msg5d62e0e9e403470ab6d62d3c)(converted by \[this script](https://gist.github.com/rgchris/6b33462e6894f431d8e09c349565aee5))

9214

[19:28](#msg5d62e14535f914538d854f6c)@rgchris I suggest to bump https://github.com/red/red/issues/3236, as it was closed prematurely, or to dupe it in `red/REP`.

[20:52](#msg5d62f51bc8228962acc36197)@Rebol2Red please try again with latest build, the issue should be fixed.

## Monday 26th August, 2019

qtxie

[05:45](#msg5d637216e403470ab6d9eeb8)@rgchris `move 0x0` will turn off the auto-closing.

```
view [
    box 200x250 draw [
        push [
            pen #0000ff 
            fill-pen off 
            line-width 5 
            shape [
                move 20x230 
                qcurve 40x205 50x230 
                qcurv 90x230
                move 0x0
            ]
        ]
    ]
]
```

ldci

[11:35](#msg5d63c3e6e403470ab6dc4326)New samples and doc for ffmpeg and Red: https://github.com/ldci/ffmpeg.

rgchris

[13:28](#msg5d63de903c1aba311bd4b5c6)@qtxie That inverts the SVG convention of implicitly leaving paths open, requiring `Z` to close them.

[13:35](#msg5d63e0163c1aba311bd4bfb2)Also, that's only the last segment. How would you close a preceding segment?

```
view [
    box 200x250 draw [
        push [
            pen #0000ff 
            fill-pen off 
            line-width 5 
            shape [
                move 20x130 
                qcurve 40x105 50x130 
                qcurv 90x130
                ; close me
                move 20x230 
                qcurve 40x205 50x230 
                qcurv 90x230
                move 0x0
            ]
        ]
    ]
]
```

[13:35](#msg5d63e0363c1aba311bd4c111)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/MUKj/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/MUKj/image.png)

[13:37](#msg5d63e09ea498b672379bf468)NM, CLOSE works for that. CLOSE isn't in the \[PATH](https://doc.red-lang.org/en/draw.html#\_shape\_commands) documentation though.

Respectech

[19:31](#msg5d6433ad10bb5d2db075ad10)&gt; @Respectech just ffplay tour movie :)

Where is the ffplay tour movie?

greggirwin

[21:59](#msg5d645643be3a8a311af13384)We should look at the win/loss of auto-closing, because `move 0x0` is not a clear way to do it IMO.

dander

[22:32](#msg5d645de649ac051923b7d3fe)Maybe it should be a flag, like `fill-pen`. Also, from playing with @rgchris's snippet, the `0x0` is arbitrary, since any `move` prevents the last segment from being closed, but that's what he was saying anyway - I just didn't understand it at first. It seems a little inconsistent to me, or at least unexpected that each segment wouldn't be closed.  
If the default were changed to not auto-close, the `close` command sure is nice and clear

rgchris

[22:49](#msg5d64621035f914538d8fa57b)@greggirwin With SVG, a path is open unless explicitly closed. Thinking of a path as a line drawing, this is intuitive to a degree. Perhaps though the naming (`shape` vs. `path`) indicates different semantics?

## Tuesday 27th August, 2019

greggirwin

[03:56](#msg5d64a9fac8228962accf27b0)`Shape` surely indicates auto-closing, so that makes sense. A design note would be good, because porting SVG will be important. I don't know if a separate, compatible `path` command that doesn't auto-close is a good solution. Something for those who work more in this domain (like you Chris) can weigh in on .

qtxie

[15:27](#msg5d654bc449ac051923be671c)Looks like a bug. There is `close` command in shape dialect, the shape should be open by default.

toomasv

[16:07](#msg5d65555110bb5d2db07dc4b0)`close` command is not documented. Instead doc says:

&gt; shapes are automatically closed (no need to draw the last stroke back to start position)

[16:12](#msg5d655689a080d70ab58ea3d6)I agree with @greggirwin, that semantically `shape` indicates auto-closing. To draw unclosed curves / lines, there are `draw` commands without `shape` slang.

qtxie

[17:24](#msg5d65676707d1ff39f892eb6b)One problem is that if you draw several curves in shape, only the last one is auto-closing.

[17:27](#msg5d6567eedbf5ae2d42d4d7ce)Another question is why we need shape dialect, why not just put all the commands in draw?

[17:28](#msg5d65684b9b381b084f0479c2)If we can reuse the shape, then it can be useful.

[17:29](#msg5d65688668406739f9925d05)heart: shape \[...]

[17:30](#msg5d6568ac10bb5d2db07e5886)Like this, you can define a shape and use it many times later.

dander

[17:33](#msg5d65697cf2821072aa23c9b6)@qtxie that does seem useful. Is there a design reason for why `shape` does not close all its curves?

pekr

[17:34](#msg5d65698fa080d70ab58f27d1)I think that we don't necessarily need to be compatible with Rebol anymore. How many apps are out there, which would make porting more difficult? Red is going to be a bit different anyway. So my vote is to take things further and implement things as we see fit for a new Red age.

toomasv

[18:46](#msg5d657a76a498b67237a74f54)Not closing every curve but last only is the heart of shape - every line and curve continues from the last one, it is for drawing complex shapes after all.

dander

[18:56](#msg5d657cd849ac051923bfd11d)@toomasv I see. That makes much sense. I am pretty immature with this subject :blush: . What about when you move? Would that be a case where closing would make sense? That is the case that @rgchris had brought up. What term do people use for several connected segments?

toomasv

[19:04](#msg5d657ecc35f914538d9741b3)@qtxie's example would work like this:

```
heart: [shape ['curve -180x-150 0x-200 0x-100 'curve 0x-100 180x-50 0x100]]
view compose/deep [box 420x250 draw [shape [move 200x200] (heart) shape ['move 30x10] (heart)]]
```

greggirwin

[19:39](#msg5d658705dbf5ae2d42d5a84c)@dander, @rgchris can correct me, but connected segments would be considered a `path`. SVG's path model supports a number of commands: https://www.w3schools.com/graphics/svg\_path.asp

[19:40](#msg5d65872ba080d70ab58ff6cf)I also agree with @pekr that future utility trumps R2 compatibility in `draw` quite heavily.

[19:56](#msg5d658ad807d1ff39f893e9ce)`Shape` has great semantic meaning, as shown by @qtxie's `heart: shape [...]` example.

Right now, `shape` is just the equivalent of SVG's `path`, but with auto-closing. My gut says that requiring `close` is OK, because "shape" only \*softly* implies "polygon". It's a much nicer term for humans than `path`.

I propose that `shape` \*not* auto-close, that `close` be checked for bugs, and that `move 0x0` not be supported for open shapes.

toomasv

[20:02](#msg5d658c5fbe3a8a311af9ac34)@rgchris, @dander To close earlier shapes use `line` (or some curve) before you move to a new location, e.g.

```
view [
    box 200x250 draw [
        push [
            pen #0000ff 
            fill-pen off 
            line-width 5 
            shape [
                move 20x130 
                qcurve 40x105 50x130 
                qcurv 90x130
                line 20x130
                move 20x230 
                qcurve 40x205 50x230 
                qcurv 90x230
                move 0x0
            ]
        ]
    ]
]
```

greggirwin

[20:03](#msg5d658caa9b381b084f05858d)On another note, `Draw` has rel/abs support, using lit-word versions of commands. My brain sometimes wants to reverse their meaning. e.g. `'move 100x100` moves relatively, not \*lit\*erally to 100x100. What if it used an optional `to` keyword after a command to denote an absolute position? e.g. `move 100x100` is relative, `move to 100x100` is absolute.

dander

[20:17](#msg5d658fd668406739f993734b)@greggirwin I had that hitch when I was reading it yesterday too. I like the `to` idea. If the `shape` auto-close behavior is removed, maybe also rename it to `path` then? Unless that is too confusing with `path!`

[20:27](#msg5d65923a4b1189084e759860)on the other hand, there is nothing wrong with having an \*open* or \*closed* `shape`

greggirwin

[21:03](#msg5d659aaa07d1ff39f89461a4)@dander I like shape, and agree that shapes can be open or closed. It's a more general term than concrete box, circle, etc.

[21:05](#msg5d659b0f10bb5d2db07fd573)I understand the use of `path` in SVG, and it's not a terrible name either, if we go that way. It's more computery, to be sure.

## Wednesday 28th August, 2019

toomasv

[03:28](#msg5d65f4c6022dba538e7273be):point\_up: \[August 27, 2019 11:02 PM](https://gitter.im/red/red/gui-branch?at=5d658c5fbe3a8a311af9ac34) On afterthought - `line` doesn't actually close the shape. It would be better to draw separate shapes:

```
...
           shape [
                move 20x130 
                qcurve 40x105 50x130 
                qcurv 90x130
            ]
            shape [
                move 20x230 
                qcurve 40x205 50x230 
                qcurv 90x230
                move 0x0
            ]
...
```

[03:35](#msg5d65f694dbf5ae2d42d89873)@greggirwin OTOH, `line to a b c` or `curve to x y z w` seem a bit awkward.

qtxie

[05:43](#msg5d66149035f914538d9b416b)&gt; @qtxie's example would work like this:  
&gt;

```
> heart: [shape ['curve -180x-150 0x-200 0x-100 'curve 0x-100 180x-50 0x100]]
> view compose/deep [box 420x250 draw [shape [move 200x200] (heart) shape ['move 30x10] (heart)]]
>
```

If we put those commands (`'curve`, `'move`) in DRAW directly, it would be more powerful.

```
heart:  ['curve -180x-150 0x-200 0x-100 'curve 0x-100 180x-50 0x100]
view compose/deep [box 420x250 draw [move 200x200 (heart) 'move 30x10 (heart)]]
```

[05:56](#msg5d66177cdbf5ae2d42d96d14)I'm thinking something like this:

```
view [
	box 420x250 draw [
		heart: shape ['curve -180x-150 0x-200 0x-100 'curve 0x-100 180x-50 0x100]	;-- define a shape
		move 100x100 heart	;-- move to 100x100 and draw a heart shape there
		move 150x150 heart
		line 50x50 200x200	;-- draw a line cross the two hearts
	]
]
```

pekr

[06:10](#msg5d661abe3770ed0cbd9fd1f3)I don't like path term at all, though it is quite common in gfx design tools. Shape is imo much nicer, hence my vote for shape to stay.

[06:11](#msg5d661b22e403470ab6ecb56c)As for move and its relative vs absolute. I always thought, that one disadvantage of parse is, that we design our dialects without the refinements. So my quesiton is more general - why there can't be a dialect with refinements? `move/to`or reversed scenario `move/by`

toomasv

[06:58](#msg5d662615e403470ab6ecffc0)@qtxie About the last example: it is interesting option but connected to the more general usage of set-words in draw-block of course. Currently they are not definitions but reference-points like in `parse`. And they are not set in layout-time but in view-time.  
Your example would be great simplification from it's current implementation (with little additions) like this:

```
view compose/deep [
    box 420x250 draw [
        (heart: [shape [fill-pen red 'curve -180x-150 0x-200 0x-100 'curve 0x-100 180x-50 0x100]])
        line 100x80 200x130
        rotate 27 100x80 [line 95x75 110x80 95x85 line 105x75 120x80 105x85]
        shape [move 200x200] (heart)
        shape [move 220x220] (heart)
        line 225x143 300x180
        rotate 27 300x180 [triangle 300x180 280x175 280x185]
    ]
]
```

qtxie

[07:29](#msg5d662d6b4b1189084e79a613)@toomasv Looks nice! :+1:

toomasv

[07:39](#msg5d662fca68406739f997aec1) :cupid:

greggirwin

[14:58](#msg5d6696b1e403470ab6f0511f)@toomasv good point on `to`. My initial thought was `rel` or `abs` (along the lines @pekr thinks with refinements), which I thought could be generalized in a single word.

@qtxie I \*love* your latest example, and the idea of `move` especially, outside of `shape`. We use `at` in VID for "move to", which could be used for locating shapes, but I don't want to add more words if they aren't really needed.

Could the `draw` interpreter work such that if it sees a word (`heart`) that refers to a block it treats it as a sub-block, with a special case that if the first item in the block is `shape | matrix | push` it uses that command with the next item in the block, then resumes, like a `push`? I haven't thought it through, but then you could use standard blocks or references to the same or other blocks of draw commands. If paths were supported, you could also use maps or objects.

Where it could be really useful is in drawing programs and the creation of reusable `draw` elements and libraries.

planetsizecpu

[15:00](#msg5d6696fb49ac051923c7993e)This is a first test of new demo mode I did this afernoon, I have to work on it a bit more, but it seems to have some difficulty.

[15:00](#msg5d669716e403470ab6f05612)\[!\[cavetest115.gif](https://files.gitter.im/red/red/gui-branch/gMt1/thumb/cavetest115.gif)](https://files.gitter.im/red/red/gui-branch/gMt1/cavetest115.gif)

greggirwin

[15:04](#msg5d6697f4e403470ab6f05df5)Runs so fast! Fun to watch.

toomasv

[15:04](#msg5d6697f7dbf5ae2d42dd0875)@planetsizecpu Nice to see you in cave again! Press on!

## Thursday 29th August, 2019

planetsizecpu

[08:24](#msg5d678bc5a563676ace8aa2c6)Just wanted to set the game play alone, as in the arcade games when no coin. The algorytm is so simple by now, every 15 seconds switch direction in left-right pattern and make it run, I gave the boy 99 lives as it has a lot of deads :-) I just uploaded it to my repo, to activate/deactivate demo mode just press \** @ \** key.  
This example was done in a i5 machine, the boy always run at full throttle as don't need for keyboard!

DideC

[15:29](#msg5d67ef73a563676ace8d7735)Hi all. Does anybody knows if scrollers are usable in panel style?  
I have tested the `flags: scrollable` with panel, then scrollers are displayed, but events from the vertical scroller return horizontal words (right, left...).  
And it seems to not handle repetition on arrows.

[15:37](#msg5d67f145bee75051a419b0e6)to test:

```
view [
	container: panel 400x200 [
		gallery: base 400x800 draw [polygon 0x0 200x800 400x0]
	] with [
		flags: 'scrollable
	] on-created [
		sc: get-scroller face 'vertical
		sc/position: 0
		sc/page-size: 200
		sc/max-size: 800
	] on-scroll [print event/key]
]
```

toomasv

[15:43](#msg5d67f29f986f5c6ff4688385)@DideC See my longer response on Aug 15. (Sorry, can’t link now; on phone)

9214

[15:57](#msg5d67f5e6a563676ace8da59d)https://gitter.im/red/red/gui-branch?at=5d5521c0bfd2887f53f0ab6b

planetsizecpu

[18:28](#msg5d6819452f10da7cb356f38d)@DideC just at the fly I got this, you may modify `offset`using `sc`scroller think:  
`view/options [ container: panel 400x200 [ gallery: base 400x800 draw [polygon 0x0 200x800 400x0] ] with [ flags: 'scrollable ] on-created [ sc: get-scroller face 'vertical sc/position: 0 sc/page-size: 200 sc/max-size: 800 ] on-scroll [gallery/offset/y: gallery/offset/y - sc/position] ] [actors: context [on-scroll: func [face event][gallery/offset/y: gallery/offset/y - 10 event/key]]]`

toomasv

[18:41](#msg5d681c70a563676ace8ece14)@9214 Thanks! There it started. The point I referred to above was \[this](https://gitter.im/red/red/gui-branch?at=5d5559367d56bc60805a304c).

[18:43](#msg5d681ce979fc6f3f9efcad71)@planetsizecpu Does it actually work? On my W10 both horizontal and vertical scroll-bar scroll up, and that only on first try. Then it's gone.

## Friday 30th August, 2019

DideC

[06:47](#msg5d68c67f418f705d875f8451)Thanks. So this is a known unfinisched implementation.

planetsizecpu

[06:55](#msg5d68c8795b9a174fdf04dca3)@toomasv Yes, only works on first try, it was a last minute idea to help with his path to scroller, then I had to close connection and go out. @DideC sorry there was no time for more.

AiguyGary\_twitter

[11:44](#msg5d690c12d3fda15e7435bad5)Yes, the ability to just position scroller to bottom after loading text was on my wish list too. Word wrap on longer text added like a paragraph causes it to not scroll down far enough. But for single line additions the workarounds the team provided work great!

DideC

[13:28](#msg5d69246a0d4b1f5d8885f8a4)Don't worry. I have changed my code to use 'base instead of panel as I could do it in this case.

## Thursday 5th September, 2019

planetsizecpu

[08:09](#msg5d70c2a4be4a3f13fdee1fdc)Yesterday I made a small improvement, with only two LOC, now we can use any number of wheelbarrows, so in difficult levels we can put more than one of these objects in the config file, to help the player. Here is an example of level 1 modified momentarily to test with two.

[08:09](#msg5d70c2c3be4a3f13fdee2070)\[!\[cavetest117.gif](https://files.gitter.im/red/red/gui-branch/fkjY/thumb/cavetest117.gif)](https://files.gitter.im/red/red/gui-branch/fkjY/cavetest117.gif)

greggirwin

[19:20](#msg5d715ff7b3e2fc57935c9423)Nice!

## Saturday 7th September, 2019

pekr

[15:42](#msg5d73cfe7c5939027202ca901)Was there any work done on the text-list like style (grid), displaying the columnar data? Could it be done in a platform specific style (some higher level style to wrap on each platform, requiring though maybe a different style of navigation) or would it be better to have a cross-platform one? Have seen my old Rebol friend post about his dependency upon the R2, for two reasons basically - DB drivers and columnar data display.

[15:44](#msg5d73d06dd5c7bd57944fc8b2)In the past, I have sponsored creation of such style for RebGUI. Was able to display infinite amount of records, allowed row or cell movements, and was transforming data source from query to virtual table (just pointers, no data needed to be moved/copied). I would be eventually willing to donate again, if there is some consensus. The cells were basically faces IIRC, so it was able to display just anything, not just a text. Maybe I would be able to find its sources.

[15:48](#msg5d73d15ea08e2b4bd2a479d9)My take is, that in the beginning, we don't need anything such fancy. It also tends to get quite complex pretty soon, when you try to introduce stuff like columns resizing, swapping, freezing, sorting, etc.

greggirwin

[19:18](#msg5d74026fb9abfa4bd369cfb5)Grid/Table is a killer GUI feature. i.e. we \*need* it. No final decisions, but will likely not be a native widget, because they all vary so widely. Finding the lowest common denominator and still providing compelling features will be near impossible.

## Sunday 8th September, 2019

meijeru

[06:35](#msg5d74a1333b1e5e5df1720f07)"Grid/Table is a killer GUI feature. i.e. we need it." couldn't agree more. Have written many a REBOL application that absolutely relied on it, using Ashley's RebGUI. That is non-native and open source, so it could be used as prototype.

pekr

[06:41](#msg5d74a28f50508949d3f883c1)I could post what Cyphre did for me contractually. The thing is, the grid never got published, as Ashley has changed the API at some point and Cyphre did not adapt it later, nor I was able to get it running. Btw - did not @rebolek wrote some kind of grid / table for Red? We might need two styles - some simple Excel / spreadsheet like table, and later on, some more complicated one. We might as well look into some JS frameworks and just conceptually copy what is popular in there? We don't imo need to necessariraly reinvent the wheel ....

greggirwin

[18:30](#msg5d7548d3a08e2b4bd2ae79a4)Yes, @rebolek has done some table work. There are deep issues here though. While a basic text table will cover a lot of needs, and R2 table styles did that, there is a lot more to consider. We do want to learn from others, of course, but Red's nature is so different that we don't want to paint ourselves into a corner with early design decisions that lock us out of advancing the state of the art.

[18:34](#msg5d7549b8b105ed4110cc31c6)Two key things that make us very different are native reactivity and cell programmability. If you remember Carl's old SS example that Steve Shireman and I extended, or Nenad's NanoSheet example, look what a cell "formula" can do. And while it may seem like too much to think about now (we just want a simple table, right?), canonical grid layouts are powerful and Red content can be \*anything\*, including dynamically loaded GUIs. Maybe this ends up being 2 separate things, so one is very simple, and the other very general, but that's the process we need to go through.

AiguyGary\_twitter

[18:57](#msg5d754f2954e7c649d4ae18dc)There are open-source spreadsheets based on ReactJS also. https://jspreadsheets.com/react-spreadsheet-component.html

## Monday 9th September, 2019

greggirwin

[02:19](#msg5d75b6a654e7c649d4b0c38e)Thanks @AiguyGary\_twitter.

[02:28](#msg5d75b8e432e48c5df260c01f)@AiguyGary\_twitter have you use the reactJS spreadsheet? Their demo doesn't see to do... \*anything\*. How does it scale? e.g. no scrollbars or anything but fixed data in the demos.

[02:29](#msg5d75b91aae44a84124a58143)When I say "anything" I mean I can't tab or Enter between cells and rows, hit F2 to edit a cell (all typing overwrites existing content), no formulas, at which point I stopped trying things.

[02:33](#msg5d75ba17767de913fca88283)Looks like we need to update Doc's pico-sheet for current Red compatibility. The team is all very focused right now. If somebody in the community wants to look into it, that would be great.

AiguyGary\_twitter

[09:53](#msg5d762109b9abfa4bd377f81f)@greggirwin Check out these examples. These appear to be a lot more functional but no I have not used it myself. https://react.rocks/tag/DataTable

greggirwin

[19:24](#msg5d76a6d732e48c5df2676f89)Thanks @AiguyGary\_twitter. Good resource.

http://bvaughn.github.io/react-virtualized/#/components is impressive. Team Red, make note. Many of the others appear to be down.

[19:45](#msg5d76abd650508949d306a5e6)The interesting thing to me is the domain language, and how `masonry` just looks like `collection` with text below elements; and `grid/list/table` are combinations of headers and grid lines. Similar to how standard Windows `listview/treeivew` styles were quite generic, with many options that could be applied. They became quite unwieldy to use in practice (IMO). The main thing to me is what your data looks like, and how easy we can make it to select a given style and options for it. In many cases, more than one rendering model may apply, and being able to change the style, without other effects, could be very useful.

## Tuesday 10th September, 2019

ralfwenske

[06:26](#msg5d774202a08e2b4bd2bbd424)On OSX a text-list item is not readable when selected - though only when I specify a font-name:

```
Red [needs: view]   ; from 'http://helpin.red/Faces.html'
view [
    tl: text-list 100x100 
    font-name "Courier New" ;without this --> selected item's font color turns white and thus is readable
    data[
        "Nenad" "Gregg" "Qtxie" 
    ]
]
```

!\[alt](https://ralfwenske.net/text-list-demo.jpg)  
Is this a bug?  
`Red 0.6.4 for macOS built 10-Sep-2019/5:30:36+10:00 commit #6cfcfe9`

greggirwin

[06:41](#msg5d7745a03b1e5e5df18456fc)If `alt` is an attached image, I can't see it in Gitter here.

ralfwenske

[06:47](#msg5d7746f8d5c7bd579467617f)@greggirwin Sorry - I had deleted it on my server (assuming that Gitter would copy it). Please try again.

[07:29](#msg5d7750d7b9abfa4bd38086eb)Using `font-name "Courier"` in `area` and selecting some text results in a light-blue background color. Maybe that would be a consistent solution if also applied to `text-list`?

greggirwin

[08:35](#msg5d7760436e889c4bbdce298e)I see it now. Thanks.

## Friday 13th September, 2019

toomasv

[09:14](#msg5d7b5e112e8fd94630c4fb38)Couldn't resist :)  
\[!\[fourier](https://toomasv.red/images/Fourier/fourier.gif)](https://toomasv.red/images/Fourier/fourier.gif)

rebolek

[09:16](#msg5d7b5e5cb84cb24c7ebf69fa)@toomasv You could do Red logo but noooo.... :)

toomasv

[09:18](#msg5d7b5ee8bda393169473f681):flushed:

[09:47](#msg5d7b65ce5d40aa0d7d2b3698)Specially for you, @rebolek:  
\[!\[](https://toomasv.red/images/Fourier/red-logo.gif)](https://toomasv.red/images/Fourier/red-logo.gif)

planetsizecpu

[10:58](#msg5d7b7673bda3931694749682)Wow @toomasv impressing! how yo do guide the pencil?

toomasv

[11:46](#msg5d7b819e5d40aa0d7d2bf38a)@planetsizecpu It's \[my take](https://github.com/toomasv/fourier) on \[Fourier Discrete Transform](https://en.wikipedia.org/wiki/Discrete\_Fourier\_transform).  
(With substantial help from \[The Coding Train](https://www.youtube.com/watch?v=MY4luNgGfms)  
and other superb material:  
\[3Blue1Brown](https://www.youtube.com/watch?v=r6sGWTCMz2k&amp;list=PLZHQObOWTQDNPOjrT6KVlfJuKtYTftqH6&amp;index=5&amp;t=0s)  
\[Mathologer](https://www.youtube.com/watch?v=qS4H6PEcCCA)  
\[Algorithm-archive](https://www.algorithm-archive.org/contents/cooley\_tukey/cooley\_tukey.html)  
\[Jez Swanson](http://www.jezzamon.com/fourier/)  
\[The Fourier Transform](http://www.thefouriertransform.com/)  
\[The animated curves](https://www.geogebra.org/m/t9uspumz#material/eue3sne8)  
\[Alex Miller](https://alex.miller.im/posts/fourier-series-spinning-circles-visualization/)  
\[Hackaday](https://hackaday.com/2018/12/21/explaining-fourier-again/)  
\[An Interactive Guide to the Fourier Transform](https://betterexplained.com/articles/an-interactive-guide-to-the-fourier-transform/))

planetsizecpu

[12:24](#msg5d7b8a845d40aa0d7d2c39b7)Good job!

greggirwin

[16:33](#msg5d7bc4dc5d40aa0d7d2e0cf5)This is Pure Magic.

[16:35](#msg5d7bc559b84cb24c7ec26a42)Can we make a Laser Etching device driven by that? LEaaS. :^)

toomasv

[16:44](#msg5d7bc764577fc14c7fbb9702)\[Final piece](https://toomasv.red/images/Fourier/fourier2.gif) in the puzzle.

pekr

[16:44](#msg5d7bc76d62bfc95112e18480)😀

toomasv

[16:46](#msg5d7bc7fe72fe1251119bdda5)@greggirwin

&gt; "Any sufficiently advanced technology is indistinguishable from magic"

\*A.Clarke*

greggirwin

[16:51](#msg5d7bc90953bbf77ee0594c29)Really fun to watch. How hard is it to create new ones?

toomasv

[16:52](#msg5d7bc96372fe1251119be515)I still need the points-collecting code. Currently did by hand, not fun :)

greggirwin

[16:54](#msg5d7bc9c0bda3931694771822)Focus on fun.

[16:55](#msg5d7bca042e8fd94630c80699)If anyone else wants to do point-collection, I'm sure Toomas will give you pointers on what he needs.

toomasv

[17:03](#msg5d7bcbded5c523462f785098)Points collecting:

```
img: load %some-picture.png
points: copy []
view [image img on-down [append points event/offset]] ; pic points in ~5mm distance; closer on sharper edges
write %my-points points
```

In `%fourier3dft.red` replace `%f-points` with `%my-points`. Done

greggirwin

[17:08](#msg5d7bcd1ca6f4896449fc5f8b)Pfffft. And I thought the magic was gone.

[17:11](#msg5d7bcdab72fe1251119c0916)Anybody up to make a PointMan utility to do that? Add file/URL selection, save points file as the same name as the source with a new extension.

9214

[17:15](#msg5d7bcec6577fc14c7fbbcc16)@greggirwin what's the point (no pun intended) of that? Use Sobel filter or Canny edge detector (@ldci) with subsequent pixels to Draw points conversion.

greggirwin

[17:19](#msg5d7bcf86577fc14c7fbbd0ce)Which is easier and more fun?

9214

[17:22](#msg5d7bd039577fc14c7fbbd8fb)Evidently, drawing points by hand is not fun, or at least a different kind of fun than CV, made easy by @ldci's framework.

&gt; I still need the points-collecting code. Currently did by hand, not fun :)

ldci

[17:38](#msg5d7bd432a6f4896449fc9481)@toomasv I'm testing your FFT implementation. Really nice job :)

toomasv

[17:41](#msg5d7bd4ce3cc2b87edff959cd)@ldci Thanks! Any hints how to use RedCV to automatically collect points?

greggirwin

[18:11](#msg5d7bdbd5d3283306ba37218c)I'm interested to see how an automated version orders the points.

toomasv

[18:14](#msg5d7bdc935d40aa0d7d2eb44d)They have used traveling salesman algorithm to order points. But I am still to master it. :baby\_chick:

AiguyGary\_twitter

[21:40](#msg5d7c0cd005fd3716951e3f3c)Hook that to a 3D Printer and you'll have a model builder! https://pinshape.com/

## Saturday 14th September, 2019

planetsizecpu

[07:37](#msg5d7c98a153bbf77ee05e9cf6)@toomasv I use this function that looks at some image for pixels at a given point, you may modify it to look on each image point for gather the wanted coords:

[07:38](#msg5d7c9908d3283306ba3bca49)

```
CheckFloor: function [face [object!]][
		Ret: false
		FSize: face/size
		FOffset: face/offset
		CheckPointL: (((FOffset/y + FSize/y + 1) * GameData/CaveFace/size/x) + FOffset/x )
		CheckPointR: (((FOffset/y + FSize/y + 1) * GameData/CaveFace/size/x) + FOffset/x ) + FSize/x
		TerrainL: GameData/CaveFace/image/(CheckPointL)
		TerrainR: GameData/CaveFace/image/(CheckPointR)	
		if any [TerrainL = GameData/TerrainColor TerrainR = GameData/TerrainColor] [Ret: true]
		return Ret
	]
```

ldci

[10:05](#msg5d7cbb7a3cc2b87edfff2c3c)@toomasv : You'll find in redCV/samples/image\_contours/imagecontour.red an efficient way to automatically collect points in image. I've tested with Fourier image for rather pretty result. May be you need to pre-process your image first according to the quality of image. You can use a lot of filter in redCV for that.

toomasv

[11:16](#msg5d7ccbf7d5c523462f7ee17e)@planetsizecpu @ldci Thanks! I am out now. Will try tomorrow.

meijeru

[15:48](#msg5d7d0bd472fe125111a43965)@planetsizecpu Apart from ldci 's suggestions, here is one to make your function more idiomatic Red style: you don't need `Ret` local variable and the last two lines can be replaced by `any [....]`because a function by default returns the value of the last expression evaluated in its body .

[15:49](#msg5d7d0c0d3cc2b87edf016032)It is true that if the `any` condition is not satisfied, the result is then `none` instead of `false` but for most purposes this is equivalent...

rgchris

[16:13](#msg5d7d119453bbf77ee061e4c2)Couple of functions added to my \[SVG Tools](https://gist.github.com/rgchris/6b33462e6894f431d8e09c349565aee5), including the ability to transform a path from absolute to relative coordinates. I've also consolidated the SVG object, some of the sub-functions can now be isolated—including PATH-TO-BLOCK, and PATH-TO-SVG-PATH (two-way path/d encoding/decoding). Can apply ROUND/TO on the latter function to clean up some overly precise paths.

```
my-path: "M50,160L55,180 70,180 60,190L65,205L50,195L35,205L40,190L30,180L45,180Z"
svg/path-to-svg-path svg/to-relative-path svg/path-to-block my-path
== "M50,160l5,20l15,0l-10,10l5,15l-15,-10l-15,10l5,-15l-10,-10l15,0z"
```

SVG-TO-DRAW is now SVG/TO-DRAW. I hope to add the ability to scale coordinates in transition to allow more precision with Red's integer-based pairs.

dander

[16:26](#msg5d7d149a577fc14c7fc43a4c)@toomasv my 8 year old watched those drawing animations for about 10 minutes 😄

toomasv

[16:35](#msg5d7d16c82e8fd94630d07334):smile:

## Sunday 15th September, 2019

planetsizecpu

[08:54](#msg5d7dfc2fbda3931694859669)Thanks @meijeru I did not know this trick, I usually learn things with daily practice.

meijeru

[11:17](#msg5d7e1dbcbda393169486823e)This sort of semantics is described in the \[spec document](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc) which I maintain. Its content will eventually be subsumed by the official documentation.

## Tuesday 17th September, 2019

viayuve

[06:34](#msg5d807e6553bbf77ee079540f)finger crossed for DATAGRID/TABLE @greggirwin will wait for it, lots of my projects do need it.

## Wednesday 18th September, 2019

ralfwenske

[06:21](#msg5d81ccd1d3283306ba600cff)What am I doing wrong here?

```
Red []
modalview: layout [  title "A modal view" size  400x200
    h5 "A modal window." return
    tl: text-list 380x100 font-name "Courier" data ["one" "two" "three"] [choice: tl/selected OK-btn/enabled?: true]
    return
    OK-btn: button "OK" disabled [unview/only modalview]
    Cancel-btn: button "Cancel" [unview/only modalview]
] [modal]   

;view modalview    ; uncomment this and 'win' does NOT show? (OSX)

win: layout  [
    title "A view test"
    h1 "test window"
]
?? win/size         ; just to see that we come along here after modal view has been closed
view win
```

When the modal view has been shown the 'win' does not show up

Also could someone on OSX confirm that selected item in 'text-list' is barely readable?

toomasv

[06:54](#msg5d81d4c03cc2b87edf22c026)@ralfwenske Don't know if this helps but you forgot to give `modalview` the `/flags` refinement. On W10 it works with and without the flag.

ralfwenske

[07:52](#msg5d81e25b2438b53a64d07851)Thank you @toomasv I tried with `/flags` in both `layout` and `view` : doesn’t make a difference.

planetsizecpu

[08:17](#msg5d81e80d2438b53a64d0af5f)@ralfwenske just add a the end some last line like `print "OK"` it works for me, also text-list displays ok on w10

[08:18](#msg5d81e8385ab936169411274c)but was difficult to find, needed some tests :-) it seems last line wait for &lt;enter&gt; key

[08:22](#msg5d81e961a38dae3a6371eb6a)also if there is a blank line at the end, then it works correct

ralfwenske

[08:51](#msg5d81effcab4244767bbdec55)@planetsizecpu Strange - I feel like there might still be some limitation with view:  
Doing the following

```
Red []
win: layout [
    title "Win"
    h1 "test window"
    button "Close" [unview/only win]
]
win1: layout  [
    title "Win1"
    h1 "test window 1"
    button "Close" [unview/only win1]
]
win2: layout  [
    title "Win2"
    h1 "test window 2"
    button "Close" [unview/only win2]
]
view win 
view win1
view win2

print "Done"
```

win opens and waits until I close it (either way). Then both win1 and win2 open at once. Clicking on close on any of those two closes both.  
When I comment out `view win` win1 opens. When I close it the program finishes normal but no sight of win2

[09:15](#msg5d81f5c15d24375b3ed6c510)I now have observed in my original app that when I open a small view before the main view, the main view flashes and disappears. When I don’t open the small view everything works fine as expected.  
(btw. `modal` was a destraction and probably doesn’t play a role in this)

Oldes

[10:04](#msg5d820138a38dae3a6372a727)@ralfwenske you probably want to use `view/no-wait` for the first 2 (`help view` is your friend)

[10:08](#msg5d820203e45b6d473211effc)But you are probably having other problem as I see now... but I must say that here (Windows) it is working as expected. First I see one window, when I close it there is just second and finally the third.

planetsizecpu

[10:10](#msg5d820282e45b6d473211f485)Just tested a bit my game (at work now hehe) with last automatic update available and runs as normal.

[10:12](#msg5d82031d5d24375b3ed72fc3)@Oldes that is the normal behavior I think, so as @ralfwenske says it is strange, don't evaluate the last line, just waits for enter key

Oldes

[10:14](#msg5d82037d8521b34d91486c96)It is strange if \_both win1 and win2 open at once._ Sounds like a bug.

planetsizecpu

[10:45](#msg5d820acf56677e767a1446fd)@ralfwenske @Oldes Seems a console related issue, if you write the code in a .red file it runs as normal, also the last line. But if you paste the code on console, then last line wait for enter key.

dockimbel

[12:43](#msg5d822656e45b6d4732130d13)@ralfwenske Cannot reproduce your issue on Win10, win2 opens after win1 is closed, as expected. If you can reproduce it consistently on macOS, then open a ticket for it.

Oldes

[19:45](#msg5d82894f901bb84d902f879e)Is there simple way how to make an image from raw ARGB binary? I think that this is bad result:

```
>> i: make image! [2x1 #{01020304 05060708}]
== make image! [2x1 #{010203040506}]
```

[19:47](#msg5d8289bd8521b34d914c96fc)Is it a good idea to have `ARGB` and `RGBA` codecs?

[19:49](#msg5d828a5f5ab936169416418a)Hm... this works:

```
>> i: make image! 2x1 i/argb:  #{0102030405060708} i
== make image! [2x1 #{030201070605} #{
FBF7}]
```

[19:52](#msg5d828b0da7a5cc473314c308)Although it looks that the order is wrong:

```
>> i/1
== 3.2.1.251
```

[19:53](#msg5d828b3cab4244767bc2c80a)The binary value is in BGRO or (BRGA?) format

zxq2233

[23:21](#msg5d82bc132438b53a64d742ae)I am trying to make a simple notepad using red-lang.  
Can I use the Windows Explorer window to open the file and get the path? Does the GUI control do it all?!\[win-common-dlg-image2.png](https://i.loli.net/2019/09/19/aA6oY1vPNB4xGqX.png)

greggirwin

[23:24](#msg5d82bcbaa38dae3a63788ea9)`Request-file` is the function you want.

[23:25](#msg5d82bcfc56677e767a19d429)Use `? request-file` to see details, and play in the console with it, to see how the refinements work. You can also do `? request` to see the other requestors that are available.

zxq2233

[23:41](#msg5d82c0aea7a5cc4733165180)@greggirwin Thank you!

## Friday 20th September, 2019

meijeru

[15:29](#msg5d84f0481998d51695702732)Here is an interesting example of Red's \_code = data_ property: with five LOC I add a new item to the console's menu

```
; get console face
cons: first head system/view/screens/1/pane

; add to console menu
append last cons/menu ["Check for updates" check-update]

; modify the body of the on-menu actor function
body: body-of :cons/actors/on-menu
insert third body [check-update [do %check-update.red]]

; rebuild the function from the spec and the modified body
cons/actors/on-menu: func spec-of :cons/actors/on-menu body
```

toomasv

[16:08](#msg5d84f97056677e767a2a5ee2)@meijeru Beautiful! :+1:

pekr

[16:09](#msg5d84f9b85ab9361694286714)Really cool!

greggirwin

[17:27](#msg5d850c03a38dae3a6389d780)Very cool indeed.

[17:28](#msg5d850c4c2438b53a64e864c8)Can you post the code for %check-updates.red as well?

[17:57](#msg5d8513232438b53a64e8a0bb)Ah, I see your gist in the other room now. Thanks!

## Saturday 21st September, 2019

planetsizecpu

[17:01](#msg5d86577356677e767a34026e)@meijeru Wow, useful!

## Tuesday 24th September, 2019

GalenIvanov

[12:50](#msg5d8a11165d24375b3e1055e0)Something I'm currently working on: \[Hamiltonian cycles generator ](https://github.com/GalenIvanov/Graphics-Red/blob/master/Hamilton\_cycles.png)

[13:00](#msg5d8a1386c7ec2e2208e2e959)I need to improve the code, because the program crashes when I try bigger sizes. I don't know if this due to memory leak or recursion.

[13:01](#msg5d8a13c2be709e39d184b902)\[!\[Hamilton\_cycles.png](https://files.gitter.im/red/red/gui-branch/lTwP/thumb/Hamilton\_cycles.png)](https://files.gitter.im/red/red/gui-branch/lTwP/Hamilton\_cycles.png)

rebolek

[13:02](#msg5d8a13e6a38dae3a63ac9a99)@GalenIvanov try `recycle/off`, it may be some GC bug.

GalenIvanov

[13:11](#msg5d8a15ff04053c5b3db3ace0)@rebolek Thanks, I'll try it.

greggirwin

[19:11](#msg5d8a6a5aa7a5cc47334c92bd)@GalenIvanov cool. Thanks for posting.

GalenIvanov

[19:15](#msg5d8a6b3a56677e767a508df3)@greggirwin Thank you! It's just a WIP, I'll post the source of the finished projects on Github - I have ideas for 2 games based on this.

## Wednesday 25th September, 2019

GalenIvanov

[07:34](#msg5d8b188afb00d668fa2b1945)@rebolek A quick update: I decided to see if the program crashes when compiled. Surprisingly it doesn't crash. In the console it starts crashing with inputs around 16x16; the compiled one successfully generated a hamiltonian cycle on a grid of 40x40 points.

rebolek

[08:20](#msg5d8b234463b06968fbe62c13)@GalenIvanov interesting, I'll check how my crashing stuff behaves when compiled because there's certainly some GC error in the interpreter.

GalenIvanov

[08:24](#msg5d8b245834a7236bf5b8ecaf)@rebolek OK, thanks! I'll post my source when I'm ready - I don't rule out the possibility of more mistakes from my side.  
By the way, success with 70x70 (it took maybe 15 minutes, but proves that my concept works) - I'll need much smaller grids, but was annoyed by the crashes.

rebolek

[08:25](#msg5d8b249163b06968fbe63661)@GalenIvanov crash is definitely not your problem. You should get an error, if your code is wrong, but not a crash.

GalenIvanov

[08:26](#msg5d8b24a85c966b58fb70e7f0)@rebolek Yes, exactly!

rebolek

[08:26](#msg5d8b24d263b06968fbe637e7)definitely NOT...sorry for the typo :)

GalenIvanov

[08:27](#msg5d8b24e6fb00d668fa2b7915):)

endo64

[19:15](#msg5d8bbcbd692d464f796c8d3d)@GalenIvanov "In the console it starts crashing with inputs around 16x16" is it on GUI console or both GUI and CLI?

9214

[19:23](#msg5d8bbea6cdbb7d4f78878e7c)@qtxie :point\_up: I can't recall if garbage collection for `image!`s was implemented?

qtxie

[19:24](#msg5d8bbeea14635d6b37ec7ece)@9214 Not yet.

9214

[19:29](#msg5d8bc00986eddb6ea0d3d185)I generated FASS curves and L-system trees of quite a monstrous size back in the day, and haven't seen any crashes, only errors due to `pair!` overflow, which were expected.

GalenIvanov

[19:41](#msg5d8bc2f7bae2907f6c381909)@endo64 I only tested it on the GUI console

9214

[19:44](#msg5d8bc3a7692d464f796cc539)GUI / CLI difference has no bearing here, it's interpreter issue. @GalenIvanov you ought to provide at least some error or debug message, if you want it to be resolved. "It crashes" isn't terribly useful.

GalenIvanov

[19:49](#msg5d8bc4d4fb00d668fa306cce)@9214 I'm aware that it could be entirely my fault. I just realized the big difference between the code inerpreted in the GUI console and the compiled code. Unfortunately I didn't receive any error message. I tried to naively debug the code with printing/probing some values, but when the program crashed in the console, I never got any error message. I'll post a link to my code tomorrow. Thank you all for your feedback.

[19:50](#msg5d8bc51163b06968fbeb22e0)@9214 BTW, here is my take on \[L-systems](https://github.com/GalenIvanov/Graphics-Red/blob/master/L-systems.red). I also didn't get any crashes.

9214

[19:59](#msg5d8bc71abae2907f6c383ce3)@GalenIvanov it 's our fault that Red crashes, not yours :wink: Try to compile console in debug mode (`-d` flag) and launch it from command line, then paste here stack trace that you'll see after crash.

## Thursday 26th September, 2019

GalenIvanov

[07:08](#msg5d8c63d34ee8b81cda22f90d)@9214 Thank you for your support. In the meantime I updated Red to the automated build - red-25sep19-f753e25c.exe - and there is no problem anymore, not a single crash. Sorry for wasting your time and not trying the most obvious thing. The version I have been using until now was really old - built on 22 Nov 2018.

greggirwin

[16:28](#msg5d8ce741fb131014e7ef4066):+1:

## Saturday 28th September, 2019

greggirwin

[00:31](#msg5d8ea9d773dd29627ec49b56)Does anyone remember why `drop-list` doesn't have a readable `text` facet? i.e., it's not set on selection.

## Monday 30th September, 2019

GalenIvanov

[12:29](#msg5d91f526fcb47b627fefd967)\[!\[Island\_allleys\_8x8.jpg](https://files.gitter.im/red/red/gui-branch/BgpY/thumb/Island\_allleys\_8x8.jpg)](https://files.gitter.im/red/red/gui-branch/BgpY/Island\_allleys\_8x8.jpg)

[12:29](#msg5d91f541deb6da63d7d4c455)I almost finished the game for which I was coding my generator of Hamiltonian paths. I present you the "Island Alleys"

[12:30](#msg5d91f57d66c8b4512243870c)It is a logic puzzle in the vein of Slitherlink.

[12:33](#msg5d91f613eb1eff63d64f8137)You need to connect the dots by clicking (not dragging) between them and form a closed loop that goes through all the dots on the grid. The numbers are placed only where two or more "alleys" meet at a right angle and indicate the total distance to the shore in all directions.

[12:34](#msg5d91f66c290b8c354a015796)I'll add a thorough step by step example solve later.

[12:34](#msg5d91f66d47de0a719d394d92)Enjoy!

[12:35](#msg5d91f682eb1eff63d64f84b1)\[Island Alleys](https://github.com/GalenIvanov/Games/blob/master/Island%20Alleys.red)

endo64

[12:55](#msg5d91fb5ffb131014e713c3b8)@GalenIvanov Very nice! You could also add a textbox so the user can select a specific game (value for `random/seed`).

GalenIvanov

[12:59](#msg5d91fc26deb6da63d7d4ff41)@endo64 Thank you! Yes, that would be a good feature and it's easy to implement. I also need to make the "About" window modal; some of the contents of the canvas/draw block don't need to be computed at each click but only when needed.

[13:01](#msg5d91fcc10e829f604752af5d)One thing I observed (I'm not 100% sure though, I'll check tonight at home) is that `style` doesn't work correctly for the size of the button - the `y` part of the pair is not taken into consideration in Win 8.1. Here, on my Win 10 at work it's working correctly.

toomasv

[15:37](#msg5d92213d462ada5123257392)@GalenIvanov Very nice game! :+1:

[17:10](#msg5d9236f4fb131014e715b36b)@GalenIvanov When you add grid size to the title, I think you should copy the text first, otherwise several grid sizes are added if player reloads new game in desperation (as I did).

[17:25](#msg5d923a96bf625112c00b73b2)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/gR8a/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/gR8a/image.png)

GalenIvanov

[17:52](#msg5d9240e5086a72719e8f2875)@toomasv Thank you and congratulations for solving it! Apparently you don't neeed an elaborated step-by-step-how-to-solve-it :) Thank you also for finding the bug in the title - I fixed it and moved the title creation in the `init-board`func, where it belongs.  
I have several more ideas for games on such a grid, I hope I'll finish them too.

toomasv

[18:24](#msg5d924848290b8c354a03c40f)@GalenIvanov Congratulations for very interesting game!

GalenIvanov

[18:44](#msg5d924d19d97d8e3549de3f9a)@toomasv I'm very happy that you like it!

greggirwin

[19:58](#msg5d925e6e086a72719e8ff9ec)Very nice @GalenIvanov! I might need step by step instructions though. How do you win? e.g. this doesn't:

[19:58](#msg5d925e7266c8b4512246a928)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/Wawh/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/Wawh/image.png)

toomasv

[20:04](#msg5d925fccbf625112c00c817c)Hint - numbers are on meeting alleys only, indicating sum of number of cells to wall in each direction. So, 6 in upper line cannot be just in middle of an alley, 5 in corner indicates altogether 5 cells to wall in two direction (any combination of \[4 1] \[3 2]...)

greggirwin

[20:54](#msg5d926b9666c8b451224705e0)Thanks!

## Tuesday 1st October, 2019

toomasv

[02:54](#msg5d92c003462ada512329dff1):) Another hint - all info you need to start solving it is given on the middle picture of the announcement above.

greggirwin

[04:11](#msg5d92d1eb7fe6a605d15e352d)I get it now. At least I won one round. :^)

[04:11](#msg5d92d1f3deb6da63d7dafbae)I like it!

[04:12](#msg5d92d221fcb47b627ff61940)With @endo64's suggestion, then you can have a timer and leaderboards given a specific seed.

toomasv

[04:18](#msg5d92d38afcb47b627ff6219c)Yes, great distraction, er.. no, exercise!

GalenIvanov

[06:44](#msg5d92f5de7fe6a605d15f203a)@greggirwin Thank you! I was thinking about a timer too, I might add one, along with a seed. @toomasv gave you very accurate hints. The middle picture shows all the initial preparations - the 4 corner dots are always part of the island, so their adjacent edges must be included; the numbers are always on the island, that's why the squares with numbers at the borders of the grid must have their outer edge included in the loop and so on. I'm starting writing a solving instruction right now.

planetsizecpu

[06:49](#msg5d92f6ff6d4b2512c146d555)@GalenIvanov Good job! I still playing.

GalenIvanov

[06:51](#msg5d92f78bbf625112c01054f6)@planetsizecpu Thank you! Have a nice time playing!

[10:29](#msg5d932a94bf625112c011bb42)@greggirwin May be you don't need it anymore, but I uploaded \[solving instructions](https://github.com/GalenIvanov/Games/blob/master/Island%20Alleys%20-%20solving%20instructions.pdf) for my game.

rcqls

[10:41](#msg5d932d60fb131014e71c62fe)@GalenIvanov Always nice to see something new working on `red/GTK`!

GalenIvanov

[10:43](#msg5d932de9bf625112c011d07e)@rcqls That's great!

rcqls

[10:47](#msg5d932eb4d97d8e3549e430dc)@GalenIvanov And even better delivered as a compiled binary! Great job!

GalenIvanov

[10:49](#msg5d932f1c0e829f60475b4ce5)@rcqls Thank you! I'm now adjusting the color scheme and will update the source, but that won't affect the performance :)

toomasv

[11:21](#msg5d9336c247de0a719d422841)@GalenIvanov Excellent example solution!

GalenIvanov

[11:23](#msg5d933749290b8c354a0a3057)@toomasv Thank you! Most probably there are more situations lacking description here, but I think it's a good start.

greggirwin

[18:01](#msg5d9394607fe6a605d163b118)Thanks for writing instructions @GalenIvanov. I'll try to check them out soon. Another nice feature would be the ability to save and load games. So if you get stuck, or are tired, you can pick back up to continue.

[18:15](#msg5d9397b0d97d8e3549e733b3)Just glanced at them @GalenIvanov. Wow! Detailed. Thanks!

GalenIvanov

[18:29](#msg5d939b17086a72719e989086)@greggirwin That would be a nice feature - I might try it. Another nice feature would be to include the instructions as prerecorded autoplay with popup instructions/hints. But I'll leave it for the next game :)

greggirwin

[18:33](#msg5d939bfa9d4cf1736050093c)A hint feature could be nice. And a "Get it started" option that fills in all the first pieces that your hints outline, because that's just repetitive work for every game. Not the challenging part.

GalenIvanov

[18:38](#msg5d939d199d4cf17360501070)@greggirwin Yes, it can become tedious

## Sunday 13th October, 2019

DVL333

[00:43](#msg5da27338158cfd67351e4e4d)Is it possible to use variables inside `style` instruction?  
For example, i want to write something like that:

```
style hand: base 30x30 loose on-drag [(var): face/offset]
```

where (var) - variable that i want to set when "hand" face will be created.

toomasv

[05:11](#msg5da2b1eedbf67667344e4964)@DVL333 You can use `compose` in either way:

```
view [
	style hand: base 30x30 loose with [
		actors: object [
			on-drag: func [face event] compose [
				(to-set-word var) face/offset
			]
		]
	]
	...
]

view compose/deep [
	style hand: base 30x30 loose on-drag [
		(to-set-word var) face/offset
	]
	...
]
```

9214

[11:20](#msg5da3089280e62056e4f8164a)@DVL333 depends on what you mean by "variable".

[11:41](#msg5da30d84f88b526fb92eeced)@toomasv why this complication instead of `set var face/offset`?

toomasv

[13:00](#msg5da31fdb89acff6ff5ead500)Heh, indeed

## Monday 14th October, 2019

planetsizecpu

[07:22](#msg5da4222339e2ef28addc2b69)Hi guys! I'm very busy last weeks, but this weekend I had some time to play a bit, I noticed level 4 too much difficult, so I scarved a gallery on the ice, at the top of scenario, so the boy can cross away with his barrow, early this morning I updated the \[repo](https://github.com/planetsizecpu/Cave-In) for those who want to play.

[07:22](#msg5da42240158cfd673529e227)\[!\[cavetest41.gif](https://files.gitter.im/red/red/gui-branch/0lUV/thumb/cavetest41.gif)](https://files.gitter.im/red/red/gui-branch/0lUV/cavetest41.gif)

rebolek

[07:29](#msg5da423e7894dee56e53d6a1c):clap:

toomasv

[12:28](#msg5da469fb809de9699f36e60c)@planetsizecpu :+1:

planetsizecpu

[14:20](#msg5da4842b57c2517c6a08ac93)Thx all!, now I'm involved in w7 upgrade to w10 for about 130 computers before end of support, as ever time it's not on my side, and that's why I come and go here time to time :-(

greggirwin

[21:40](#msg5da4eb5ef1c89c0758ec6cab)Very \*cool\*. Melting ice drops are nice.

## Tuesday 22nd October, 2019

patrick-philipot

[14:56](#msg5daf188c10bd4128a13fc3c7)Hi I'm new here but I've been using Rebol2 a lot in the past. I'm giving Red a try and in that process I'm missing some VID features like GUIDE or AT returning a pair value.  
I don't know if I'm the right place and I apologize in advance if not.  
pat665

greggirwin

[15:00](#msg5daf198a7477946badadab69)Welcome @patrick-philipot! This is the place. Main chat in red/red, and red/help for general questions. Some core differences are noted \[here](https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol). General docs are \[here](https://doc.red-lang.org). There are some differences, and `guide/at` in VID is one of them currently.

## Wednesday 23th October, 2019

patrick-philipot

[11:13](#msg5db035bea3f0b1784973c854)Hi Gregg, here is my attempt to fix the missing guide.

```
Red [Title: "No guide in RED" Needs: 'View]

view [
	title "Test with RED"
  below
	h3 "Guide missing in RED"

	here: button "Button 1"
	button "Button 2"

  origin here/offset

	return
	button "Button 3" 
	button "Button 4" 
]
```

It's not the exact same thing as the buttons are aligned relatively to the h3 text.

If anyone can improve ?

toomasv

[13:04](#msg5db04fc4fb4dab784aef3a9f)How about:

```
view [
    title "Test with RED"
    h3 "Guide missing in RED"
    origin 10x60 below
    button "Button 1"
    button "Button 2"
    return
    button "Button 3" 
    button "Button 4" 
]
```

Not sure it is better though.

[13:06](#msg5db0505610bd4128a148f7f7)Or:

```
view [
    title "Test with RED"
	below
    h3 "Guide missing in RED"
	panel [
		origin 0x0 below
		button "Button 1"
		button "Button 2"
		return
		button "Button 3" 
		button "Button 4" 
	]
]
```

greggirwin

[16:55](#msg5db085ec3d669b28a0c2d6b2)@patrick-philipot rather than trying to recreate `guide`, look at whether Red's replacements for it will do what you want. We haven't ruled out `guide` entirely, but using panels with divider options, which defines the number of rows or columns, makes it easier to create consistent layouts and group related items such that you're not messing with the implicit `guide/at` values. Those are more flexible, of course, and I used them a lot myself. I certainly missed `guide` for a while.

If you have sample GUIs you want to port, people here will probably offer help in Redifying them.

Here's a panel example. The integer after `panel` is the divider option, which you can read about \[here](https://doc.red-lang.org/en/vid.html#\_panels):

```
view [
    title "Test with RED"
    below
    h3 "Guide missing in RED"
    panel 2 yellow [
        origin 0x0
        below
        button "Button 1"
        button "Button 2"

        button "Button 3" 
        button "Button 4" 

        button "Button 5" 
        button "Button 6" 
    ]
    panel 3 green [
        origin 20x20
        below
        button "Button 1"
        button "Button 2"

        button "Button 3" 
        button "Button 4" 

        button "Button 5" 
        button "Button 6" 
    ]
]
```

[16:58](#msg5db086c42a6494729c2795db)In the panels, change `below` to `across` and see what happens.

[17:00](#msg5db087343d669b28a0c2df51)Something we can all think about is whether the locality of the divider option axis could be improved by allowing, e.g. `panel 3 across [...]`, `panel 4 below [...]`.

## Thursday 24th October, 2019

patrick-philipot

[07:22](#msg5db151212f8a034357c9afe2)Thank you Toomas and Gregg. Sure the panel is most certainly the way to go. In passing, I'm using Flutter a bit, and there are similarities. Both Red and Flutter use declarative UI. Thanks again.

greggirwin

[17:01](#msg5db1d8cdf26ea4729deae5e7)Do you have to build your whole app in Dart to use Flutter?

## Friday 25th October, 2019

rebolek

[04:50](#msg5db27f0af26ea4729defb250)How do I change font in GUI console on macOS? Both "Choose Font..." and "Setting..." options in menu don’t do anything.

patrick-philipot

[06:42](#msg5db2996be469ef43585f77dd)@greggirwin Yes Dart is mandatory. The language is close to Javascript in some aspects. To get a better idea I would suggest you to go to Udemy. They have a "Free Flutter intermediate course". It will give you a better idea.  
\[Udemy](https://www.udemy.com/course/free-flutter-intermediate-course/)

pekr

[14:54](#msg5db30ca5e886fb5aa2f44150)Here at work we have switched from AngularJS to Angular (Typescript). For mobile development, our two partners are tinkering with Flutter too. It is just that the project app of our Intranet is over 1GB in sources? Of course, upon the release, it gets stripped down. It feels more like creating an app, and not just the website.

The apps look really nice though - material desing and the resizing stuff, how the app is able to remodel its forms for various devices and portrait / landscape modes. And ag-grid is really cool grid.

It made me think about the Redbol ecosystem. With R2, the GUI suffered mostly on UI elements not having a proper system friendly behaviours, facing various glitechs here or there. So sometimes we wished for a native GUI. With Red, we've got a native GUI, but when you think about a cross platform usage, you are starting to face a problem here, e.g. with something like a data grid. Under Windows, you can have some text list, but 1) it will be far from being satisfatory for data manipulation (column dragging, freezes, saving the setups, etc.) 2) most probably you will not find identical UI element on other OSes.

It still seems the combination of both aproaches might be the way to go. For small utils, native app looks good. But I am not sure, for something like e.g. a tree-view, I would like to use Windows explorer like native one - not a touch friendly imo. Or what if you prefer your app to look identical over the devices and/or OSes?

Not sure what is the state of recent Red GUI implementation, if the creation of custom styles is already supported? I am also eagerly avaiting, what Android support brings to the table. We are about to decide, if we will make some small mobile apps for the IS we use internally by our team. And of course there is a Flutter option, or eventually a Red one. Once again - small apps, communicating via REST and providing selected small agendas to supply our internal IS.

greggirwin

[18:37](#msg5db340f39c3982150983fd05)Good info @pekr. Grid and Tree are hard to do cross platform with native controls. There are experimental pieces being developed that will let us do custom styles all the way down.

Be sure to tell @rebolek what you like about ag-grid. Maybe even start a wiki page for grid/tree notes.

## Thursday 31st October, 2019

planetsizecpu

[14:46](#msg5dbaf3b2a3f0b17849c0fcaa)Today I was able to hide from work just for a couple of hours, I had mock up an idea that was around my head while we wait for official sound support in the cave. I just enjoy a lot doing, this could not happen without Red lang :-)

[14:47](#msg5dbaf402e886fb5aa22bf73c)\[!\[lander1.gif](https://files.gitter.im/red/red/gui-branch/oP0p/thumb/lander1.gif)](https://files.gitter.im/red/red/gui-branch/oP0p/lander1.gif)

pekr

[15:47](#msg5dbb021fa3f0b17849c1776a)I loved space ship games of whatever kind :-) Remember ZX Spectrum's Jetpack :-)

endo64

[16:37](#msg5dbb0dade886fb5aa22ccf74)Nice! Landing, rescue mission or alien attack game? :)

lucindamichele

[16:38](#msg5dbb0dec9825bd6bac00d2ef)@planetsizecpu hey, cool mock up!

greggirwin

[18:24](#msg5dbb26d63d669b28a00f0d85)I love Lunar Lander!

[18:25](#msg5dbb271d10bd4128a196d7df)We do need someone to lead on sound APIs.

GiuseppeChillemi

[18:42](#msg5dbb2b2c7477946bad04b743)@greggirwin yeeeeessssss !!!!

planetsizecpu

[18:43](#msg5dbb2b6d9c39821509bbf536)Thx guys, @endo64 For now I want to land on a base, then well see, my thoughts go to collect a container of samples and then take off to dock in a orbiting mothership or rocket, I may put also some dangers, I don't know yet it's just a mockup haha.  
@greggirwin people who understand sound drivers should not be very common birds, good skills may be needed (and I'm not one of these, of course)

## Friday 1st November, 2019

GalenIvanov

[13:14](#msg5dbc2fb6e1c5e91508137358)@planetsizecpu Nice!

## Tuesday 5th November, 2019

loziniak

[16:24](#msg5dc1a221fb4dab784a6c3c4a)Hi! I spotted a strange behavior in this code:

```
Red [Needs: 'View]
styles: [
	button-x [
		default-actor: on-down
		template: [
			type: 'base
			size: 200x50
		]
	]
]
vid-code: [
	panel [
		button-x "test" [
			print "base"
		]
	]
]
window: layout/styles vid-code styles
view/flags window ['resize]
```

`base` and it's text is drawn relatively to the screen, instead to the panel. I tested it under \*Wine\*. Can anybody try this under Windows? Thanks.

hiiamboris

[16:28](#msg5dc1a3403d669b28a03e0041)!\[](https://i.gyazo.com/c9bab13ea156cfef97abb341a4f58dc2.png)

[16:29](#msg5dc1a34f14d55a3785dd07a7)W7

toomasv

[17:17](#msg5dc1aea79c39821509eafef7)Can't see anything wrong with it (W10):  
\[!\[image.png](https://files.gitter.im/red/red/gui-branch/bpfx/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/bpfx/image.png)  
Made panel a bit bigger to see differences.

## Thursday 7th November, 2019

loziniak

[12:26](#msg5dc40d729825bd6bac41b316)Thanks! Seems like just \*Wine* problem.

## Friday 8th November, 2019

planetsizecpu

[14:22](#msg5dc57a13ea7d147cb341c896)Today I was able to make a small advance in the cave, now we have score.

[14:23](#msg5dc57a4c50010612b28110ca)\[!\[cavetest23.gif](https://files.gitter.im/red/red/gui-branch/r4pa/thumb/cavetest23.gif)](https://files.gitter.im/red/red/gui-branch/r4pa/cavetest23.gif)

[14:31](#msg5dc57c43091dd14a0e83b12b)Shall we play some beer on most high score? we must provide some proof about the points, for example a screen capture haha .

greggirwin

[19:19](#msg5dc5bfc8eeb63e1a837b5f53)Woohoo! Fun stuff.

## Wednesday 13th November, 2019

planetsizecpu

[12:13](#msg5dcbf36492a84f79fe5c5178)Since we can now score the points, this morning I designed new types of gold bags, heavier and more valuable, so people can risk picking them up :-)

[12:14](#msg5dcbf39168ad1c4a0fbb3983)\[!\[cavetest26.gif](https://files.gitter.im/red/red/gui-branch/6i2R/thumb/cavetest26.gif)](https://files.gitter.im/red/red/gui-branch/6i2R/cavetest26.gif)

hiiamboris

[12:19](#msg5dcbf4c7fd6fe41fc0782f59)Looks better and better ☻  
By the way, is it a feature that walking people are animated like they have seizures? ;)

planetsizecpu

[13:03](#msg5dcbff1b68ad1c4a0fbb8fb0)haha yeah, they have!

endo64

[15:16](#msg5dcc1e4f50010612b2afe0f3)Does heavier bags slow down the user?

## Thursday 14th November, 2019

greggirwin

[00:13](#msg5dcc9c1350010612b2b3af22)Nice to see more fun @planetsizecpu. :^)

planetsizecpu

[11:07](#msg5dcd355768ad1c4a0fc46fff)@endo64 They don't, it would be complex to do it, in fact in old cpu's everything is slower.

@greggirwin It is difficult to imagine the fun that is hidden in the Red language, thanks to its human oriented feature, one does not know it until it is put into practice and dig a bit. The fact is that I am enjoying programming this game as I never did before in 30 years, and I'm always trying to find the time to make improvements to the code, while daily work permits.  
So, thanks to The Red Team for making it possible and much encouragement.

## Friday 29th November, 2019

henrikmk

[15:30](#msg5de13979c3d6795b9ff1cf92)is there a way to bind a DRAW block, so I can update coordinates externally?

[15:31](#msg5de139b7d75ad3721d225574)Like this: `y: 0x120 view layout [draw [pen yellow line y 500x150]]`

rgchris

[16:35](#msg5de148b5f65fec1c8e9076f7)@henrikmk Have you looked at the \[reactive](https://www.red-lang.org/2016/03/060-red-gui-system.html) demos? e.g.

```
view [
    sld: slider return
    base 200x200
        draw  [circle 100x100 5]
        react [face/draw/3: to integer! 100 * sld/data]
]
```

[16:38](#msg5de1496c46397c721c57aefc)\[Reactivity](https://doc.red-lang.org/en/reactivity.html) documentation.

henrikmk

[17:27](#msg5de1551a26eeb8518f3b4b88)@rgchris Thanks, but this won't do. The scenario is a draw block with maybe 5-10000 elements, then 3 of them change and the drawing updates. you don't know which ones, but by externally referring them, you can easily change them. so, I'm wondering if I just need to do a BIND of some kind.

[17:41](#msg5de1583c05eec2433da34536)So, it seems DRAW doesn't handle non-draw words and paths as externally bound values, this even if the block is bound correctly, and the value can manually be obtained with GET. IMHO there should be a way to do this, as REBOL can do that. Perhaps this is a small change in the DRAW dialect.

[17:43](#msg5de158bed75ad3721d23455b)Also, this is inconsistent, because LAYOUT handles externally bound values.

GalenIvanov

[19:37](#msg5de1737e08d0c961b7bf3b4c)@henrikmk I don't know what your `layout` is, but you can use `compose` to evaluate the variable parts of your drawing code. Something like this:

[19:37](#msg5de1738532df1245cbb3df74)

```
y: 0x120 view [base 600x300 draw compose[pen yellow line (y) 500x150]]
```

henrikmk

[19:40](#msg5de1744408d0c961b7bf4136)@GalenIvanov thanks for the suggestion. it is, however, not enough. it should not be necessary to rebuild draw blocks, just to change them.

GalenIvanov

[19:42](#msg5de1749126eeb8518f3c28f7)@henrikmk Oh, sorry, I probably misunderstood your question.

pekr

[20:02](#msg5de1794426eeb8518f3c4894)maybe it is a good design related question to @qtxie ^^^

## Saturday 30th November, 2019

greggirwin

[03:05](#msg5de1dc79c3d6795b9ff65927)Seems like it should be possible, at a glance. All the `DRAW-FETCH*` defs would need a clause added.

qtxie

[09:14](#msg5de232f805eec2433da92ada)@henrikmk You can do it like this:

```
view [
	b: base 300x300 draw [pen yellow line y-arg 200x150]
	button "Change Y" [y/1: random 200x200]
	do [
		y: find b/draw 'y-arg
		y/1: 0x120
	]
]
```

[09:29](#msg5de23683d64a052fb68c8227)&gt; So, it seems DRAW doesn't handle non-draw words and paths as externally bound values, this even if the block is bound correctly, and the value can manually be obtained with GET. IMHO there should be a way to do this, as REBOL can do that. Perhaps this is a small change in the DRAW dialect.

How does REBOL do it?

Oldes

[11:57](#msg5de2594046397c721c5f330b)@qtxie I wonder if it should not be possible to write:

```
y: 0x120 view [base 600x300 draw [pen yellow line :y 500x150]]
```

instead of above used:

```
y: 0x120 view [base 600x300 draw compose[pen yellow line (y) 500x150]]
```

[12:08](#msg5de25bd99319bb5190b91f39)@qtxie In Rebol 2 this works:

```
y: 0x120 view layout [box 600x300 effect [draw [pen yellow line y 500x150]]]
```

[12:12](#msg5de25cb38e906a1c8d43ddcc)I prefer using `get-word!` instead of any `word!`, which is not part of the dialect. Actually I wonder why get-words are not more used in various dialects.

[12:16](#msg5de25d8e46397c721c5f5322)I was using `get-word!` in my \[Bass binding experiment](https://github.com/red/code/blob/749f4662320068da6d5bc5531ac25ea0282215d9/Library/Bass/bass-test.red#L26-L42).

pekr

[12:43](#msg5de2640546397c721c5f7f2d)The get-word indeed has more visual clarity imo ....

toomasv

[13:14](#msg5de26b2226eeb8518f42b8e0)

```
view [
    base 300x300 draw [pen yellow y: line 200x150 200x150] 
    button "Change Y" [y/2: random 200x200]
]
```

&gt;

henrikmk

[14:19](#msg5de27a835506624598424158)@qtxie thanks for the suggestion. it's however not tenable to use FIND on a DRAW block with 10000 elements that constantly updates, particularly, if you don't know what you're searching for. the best solution is to GET the value from the draw block's point of view. this requires no other maintenance than binding the draw block correctly.

[14:24](#msg5de27ba89319bb5190b9fca6)Of note, this isn't just words, but paths as well.

In REBOL, you can do this:

```
colors: reduce [red green blue]
view layout [box effect [draw [pen colors/2 box]]]
```

[14:39](#msg5de27f1c32df1245cbbafb12)Extended example:

```
colors: reduce [red green blue]

view layout [
    bb: box effect [draw [pen colors/2 box]]
    slider [
        colors/2: get pick [green black red yellow] round/ceiling face/data * 4
        show bb ; no knowledge of the draw block structure necessary
    ]
]
```

Oldes

[14:50](#msg5de281aac3d6795b9ffad038)I believe this is something what could be supported in Red.. I would just use get-words and get-paths for it.

henrikmk

[14:51](#msg5de2820b26eeb8518f435b0c)That might be ok, as long as it doesn't obstruct the building of draw blocks and the binding of values. Sometimes, a draw block needs to be bound to multiple contexts, say one for colors and one for vertex coordinates.

Oldes

[14:54](#msg5de282ac5506624598427a7b)I understand you:) But I'm not the right person. @qtxie is.

henrikmk

[15:00](#msg5de284129319bb5190ba3590)@toomasv thanks for the suggestion. still won't quite do, though. no direct poking of the draw block allowed.

pekr

[17:27](#msg5de2a66b08d0c961b7c7998e)If any such flexibility is possible, I think we all agree it could/should be supported :-)

henrikmk

[17:31](#msg5de2a7635506624598438a33)It looks to me that it would be a minor code change. I've been working in the past few months on some DRAW code in REBOL 2 that deeply depends on this feature, so having this in Red would make it possible to port it.

GiuseppeChillemi

[21:13](#msg5de2db749319bb5190bc94f4)@henrikmk VEK on Red?

[21:14](#msg5de2db98f65fec1c8e9b8f0e)"few months": no, it isn't.

greggirwin

[21:24](#msg5de2de1408d0c961b7c92356)Using `get-word!/get-path!` syntax has the benefit of not conflicting with any existing syntax in `draw`, and also making it clear that the result is not evaluated (I'm sure someone will want to abuse this by having funcs inline as well, but we'll just say No to that. ;^). But this feature opens the design question of whether it only works for args, or any value in a draw block, e.g. keywords. We can support just args for now, which @qtxie can say is easy or not, via only `DRAW_FETCH*` def updates. If it's generalized later, it shouldn't break anything.

`Draw` could do the same kind of lookup for parens, automatically, so `compose` isn't required, and a new block isn't created for dynamic scenarios. But for consistency it should fully evaluate parens, and that's a bigger conversation.

We can work around this limitation today, but the declarative approach is very convenient, and @henrikmk is coming at it from a real use case, where draw blocks are large. I know of at least one other real world system, based on R3 gobs, that supports massive GUIs as well.

henrikmk

[22:47](#msg5de2f16f1659720ca8d71def)@GiuseppeChillemi RebGUI

GiuseppeChillemi

[22:49](#msg5de2f205f65fec1c8e9c2ce9)@henrikmk Saphirion version ?

henrikmk

[22:50](#msg5de2f229f65fec1c8e9c2e5d)@GiuseppeChillemi yes.

GiuseppeChillemi

[22:54](#msg5de2f31b550662459845a021)Very happy to read this. So, Robert and its knights are joining Red forces!

henrikmk

[23:12](#msg5de2f75808d0c961b7c9cfe6)@GiuseppeChillemi sorry, this is a personal project, so no such news, unfortunately.

GiuseppeChillemi

[23:15](#msg5de2f814d64a052fb691cdb0)@henrikmk When a knight arrives the others will follow soon ;-)

henrikmk

[23:55](#msg5de3016232df1245cbbe9299)@GiuseppeChillemi we have really discussed this a lot (really a lot) internally and as far as I'm concerned, it won't happen.

## Sunday 1st December, 2019

GiuseppeChillemi

[05:57](#msg5de3563c32df1245cbc0dc2c)@henrikmk is it caused by lacks in Red, it's current alpha state, or other reasons like high cost of the transition of existing soft ?

greggirwin

[06:14](#msg5de35a34d75ad3721d314b27)Do we have a regression related to `unview`? `Alert` causes the parent window to close as well, but is then stuck in the event loop:

```
view [button "?" [alert "yikes!"]]
```

Win10 here.

[06:14](#msg5de35a4fd75ad3721d314b7c)#3822 is the closest ticket I could find.

[06:20](#msg5de35b9c8e906a1c8d4acbd0)`'modal` seems to be the culprit.

[06:23](#msg5de35c62d64a052fb69478df)Ah, it's #3942, which is closed. @qtxie should we reopen it?

meijeru

[08:59](#msg5de380ee46397c721c6736f3)I still have the #3942 issue on W10 currently, so I am in favor of reopening it!

endo64

[10:46](#msg5de39a018e906a1c8d4c8463)Same here.

qtxie

[14:26](#msg5de3cd9326eeb8518f4c4d1e)@greggirwin Yes. I reopen it.

[14:29](#msg5de3ce4f08d0c961b7cfa4ed)&gt; Of note, this isn't just words, but paths as well.  
&gt;  
&gt; In REBOL, you can do this:  
&gt;  
&gt;

```
> colors: reduce [red green blue]
> view layout [box effect [draw [pen colors/2 box]]]
>
```

@henrikmk I think it's doable in Red.

henrikmk

[15:04](#msg5de3d68046397c721c699c7d)@GiuseppeChillemi can't really talk much about it, but as far as I know, even a completely finished and feature complete Red wouldn't be enough. so, that's where we are.

[15:04](#msg5de3d6891659720ca8dd4060)@qtxie thank you, sounds good.

pekr

[15:36](#msg5de3dde68e906a1c8d4e605f)@henrikmk How does feature complete language differ just from any other feature complete one, other than being just a personal preference? Is that for speed, link to some special libraries, etc?

henrikmk

[15:39](#msg5de3dea226eeb8518f4cc20f)@pekr it doesn't differ. there is not necessarily logic involved in this decision. that's all I can say.

pekr

[15:42](#msg5de3df6026eeb8518f4cc844)Well, I do remeber Robert liking Lua. Well, but whatever works, just works 🙂

Oldes

[16:07](#msg5de3e5501659720ca8ddac79)Robert is using `D` now.

pekr

[18:56](#msg5de40cfa8e906a1c8d4fa6e0)@qtxie I can see new commit in Direct2D branch. Is it going to be a draw support via a Direct2D, or more general support for rendering e.g. windows, etc.?

luce80

[19:39](#msg5de416e905eec2433db68f3f)@henrikmk as a temporary workaround what about something like this ?

```
convert-block-words: func [
	; recursively convert none pair! number! tuple! logic! object! image! path!, unset!
	block [block!]
	/local
		item
	][
	forskip block 1 [
		if 'none = block/1 [block/1: none]
		if word? block/1 [
			if find [pair! number! tuple! logic! object! image!] type?/word item: attempt [get block/1] [block/1: item]
			if block? attempt [get block/1] [block/1: none]
		]
		if path? block/1 [block/1: do block/1]
		if unset? block/1 [remove block]
		
		if block? block/1 [block/1: convert-block-words block/1]
	]
	;probe
	head block
]
```

henrikmk

[19:58](#msg5de41b4fd75ad3721d36b6f4)@luce80 thanks for the suggestion, however I'm not sure how that is supposed to work?

Oldes

[20:00](#msg5de41bd2f65fec1c8ea44f39)@luce80 that would be very slow solution!

henrikmk

[20:03](#msg5de41c8fd64a052fb699dd4d)I think I'll just wait and see when it gets solved. :-)

[20:04](#msg5de41cba26eeb8518f4e7579)also my Red has no FORSKIP, so I'm not sure if I'm up to speed on the latest Red.

## Monday 2nd December, 2019

greggirwin

[02:50](#msg5de47c0e8e906a1c8d528bfe)`Forskip` is undecided, but is part of the HOF design conversation right now. It's easy to mezz in if you need it for porting purposes.

henrikmk

[04:03](#msg5de48d0cd75ad3721d39797a)I see, thanks. I won't start anything yet, because I need to better understand the state of the code. I found a change between red-064 and nightly master build, where ON-RESIZE doesn't work for the BASE style, but am not sure if this is on purpose.

qtxie

[09:59](#msg5de4e0909319bb5190ca8e46)@pekr For DRAW only. We're going to drop the current GDI/GDI+/Direct2D mixed DRAW implementation.

pekr

[10:20](#msg5de4e5778e906a1c8d555d07)Thanks, sounds good!

Oldes

[11:33](#msg5de4f675550662459853695d)@qtxie and who is the winner?

qtxie

[11:45](#msg5de4f96c5506624598537d31)@Oldes Direct2D, no good reason to use GDI/GDI+ nowadays.

Oldes

[11:46](#msg5de4f9a79319bb5190cb48c6)at least when you are not frozen on XP ;-)

pekr

[11:56](#msg5de4fbe36a85195b9ee37fd5)I think that Vista still might need it too, but maybe upon some patching might not, not sure anymore. Anyway - Win7 itself is mostly EOL, so why to care about an XP and Vista? IIRC, WinXP was deprecated by Red. It might still work, but not all of it?

qtxie

[11:59](#msg5de4fcb008d0c961b7d7c01d)XP can use the current one.

henrikmk

[17:45](#msg5de54dbec3d6795b9f0e9dba)

```
view [field on-key [probe face/text]]
```

This outputs a string that is one keystroke behind of what it should be. That seems rather useless to me. Should it be changed?

hiiamboris

[18:24](#msg5de556c28e906a1c8d58feb8)You can use `on-key-up`

Oldes

[18:37](#msg5de559d908d0c961b7dac429)@henrikmk `on-change` is probably what you want as the content of the field may be changed not only by keys.

greggirwin

[18:56](#msg5de55e4a32df1245cbcf577d)It would be great to have a How To article for event handling. The team is all very busy at the moment though.

henrikmk

[20:35](#msg5de5758f8e906a1c8d59df89)@Oldes you are right, that works better.

[20:35](#msg5de575a205eec2433dc0a813)@hiiamboris on key up works too, but there are cases, where you want the action to occur on key press.

greggirwin

[22:21](#msg5de58e8208d0c961b7dc5150)What are those cases @henrikmk ? If you react to key presses, there is no guarantee about the state of the UI relative to that.

## Tuesday 3th December, 2019

rgchris

[05:43](#msg5de5f5e826eeb8518f5bde69)@henrikmk Not sure if you've solved this (temporarily or other) and not sure if this might work for you (depends on whether your elements are X number of shapes or points) but this approach illustrates a possible way of managing a shape in an arbitrary position within the draw block:

```
my-shape: [line 10x10 190x190]

view [
    below
    field 200 "10x10 190x190" on-change [
        insert clear next my-shape face/data
        show target
    ]
    target: box 200x200 draw reduce ['pen 'red my-shape]
]
```

Although you can't put in a named reference, you can place a block with its own binding within the draw spec.

[05:43](#msg5de5f61546397c721c78c141)Variation—this shows how you might go about it reactively:

```
view also layout [
    below
    coords: field 200 "10x10 90x90" on-change [
        target/draw/1: 'pen ; hack to force refresh
        show target
    ]
    target: box 200x200 draw [pen red]
]

my-shape: make reactor! [
    append/only target/draw shape: [line 10x10 190x190]
    update: is [change next shape coords/data]
]
```

greggirwin

[06:09](#msg5de5fc1032df1245cbd3da6d)Thanks @rgchris. Another good approach.

hiiamboris

[13:46](#msg5de667341659720ca8eff5db)to simplify the above:

```
view [
    below
    f: field 200 data [10x10 190x190]
    box 200x200 react [face/draw: compose [pen red line (f/data)]]
]
```

rgchris

[15:18](#msg5de67cc96a85195b9eef173b)@hiiamboris It does simplify it, but you lose the detachment where there's an arbitrary number of shapes being managed externally. If you have to compose/reduce the draw block containing 5-10'000 shapes every time there's an update, that could get costly.

[15:22](#msg5de67db832df1245cbd7c4fa)In both examples, the main draw block doesn't change. Only the sub-block(s) that is managed from its parent value/object.

hiiamboris

[15:28](#msg5de67f1f1659720ca8f0ac36)Fair enough ☻

henrikmk

[17:32](#msg5de69c406a85195b9ef01535)@greggirwin with text, those rules are a bit different. you almost always act on key down, and very rarely act on key up. the inverse is somewhat the case for mouse presses.

a problem here, let's say, you're auto-completing or doing total text replacement in a text field, is that you cannot intercept text content correctly, because it's not yet set with ON-KEY or ON-KEY-DOWN. with ON-KEY-UP, you can do it in two update passes, which causes visual flickering (1. the character is typed, 2. you change the field content).

you can't do it with ON-CHANGE, because that causes a stack overflow with both the key press and the update mechanism updating the field.

that's why ON-KEY should act after face/text has changed, not before.

[17:33](#msg5de69c6d26eeb8518f60d512)on a side note, the real time update model prevents you from doing multiple face updates without face flickering. in that case, I would want a PAUSE-AUTO-SYNC/CONTINUE-AUTO-SYNC mechanism to temporarily halt face updates, and using that in widget code will allow real time face update to be system wide on, but allow the widget coder to pause it locally to avoid flickering.

hiiamboris

[18:19](#msg5de6a7208e906a1c8d62ef9d)`system/view/auto-sync?: no`

[18:19](#msg5de6a72355066245986074f9)`set-quiet`

[18:19](#msg5de6a740d64a052fb6ac8143)`on-detect` and `system/view/capturing?: yes` as well

[18:20](#msg5de6a769b065c6433c301d5f)But you'll have more luck writing your own edit control than repurposing current `area` in it's today's state

[18:35](#msg5de6aaf1d75ad3721d49da15)

```
system/view/capturing?: yes
view [
	text "Autocomplete word:" w: field "complete"
	return
	area focus
	on-detect [
		if all [
			event/type = 'key-down
			event/key = #"^M"
			not empty? face/text
			w/text = find w/text face/text
		][
			change face/text w/text
			face/selected: 1x1 + (1x1 * length? face/text)
			return 'stop
		]
		yes
	]
]
```

Smth like this may work if you add a routine to get/set caret position (but only for small text, or it will be slow to update the whole).

henrikmk

[20:23](#msg5de6c43c05eec2433dcab4b8)@hiiamboris thanks for the suggestion

## Friday 6th December, 2019

dockimbel

[10:33](#msg5dea2e638e906a1c8d7c3dfd)@henrikmk  
&gt; no direct poking of the draw block allowed.

Why?

henrikmk

[16:15](#msg5dea7e9805eec2433de56f81)@dockimbel the scenario is to update hundreds or thousands of elements in a draw block, so it's easier to bind the draw block to one or multiple other objects and/or another block than the other way around. in that case, the draw block construction code and the update code are in two different places, so you don't know what the draw block looks like. so I made the rule of never poking the draw block directly.

## Saturday 7th December, 2019

henrikmk

[15:50](#msg5debca3bc3d6795b9f3d90f4)question regarding EVENT/KEY:

```
view [field on-key [probe event/key]]
```

yields the expected key, while using ON-KEY-UP or ON-KEY-DOWN provides always capitalized letters and qualifier keys don't work.

I found an off-hand reference from @qtxie elsewhere that EVENT/KEY sometimes may be "not translated". I could not find it in the View docs.

is this correct?

hiiamboris

[16:42](#msg5debd683d64a052fb6d199cb)`on-key-up` and `on-key-down` are more low-level. They catch modifier keys, arrow keys, everything. Another distinction is that `on-key` event gets repeated, while these do not.

henrikmk

[17:27](#msg5debe0fa550662459885f993)I see, thanks.

[20:10](#msg5dec0735f65fec1c8edd9d78)I've noticed that Red's DRAW does not seem to use sub-pixel rendering, whereas REBOL/View does, and that can be adjusted with SCALE. In Red, using SCALE doesn't seem to have that effect. This makes it rather difficult to produce high-res glyphs. Is this related to using GDI?

[20:13](#msg5dec07d4c3d6795b9f3f4cde)Example, REBOL:

```
sz: 30
view layout [
across
b: box effect [draw [pen black fill-pen yellow circle 20x20 20] draw [pen black fill-pen red circle 40x40 sz]]
slider [sz: 30 * face/data show b]
]
```

Example, Red:

```
view [
b: box 200x200 draw [[pen black fill-pen yellow circle 20x20 20] [pen black fill-pen red circle 40x40 20]]
slider [b/draw/2/7: 30 * face/data]
]
```

greggirwin

[20:39](#msg5dec0e198e906a1c8d89c47b)Maybe it's my eyes, but I don't see a difference on Win10.

[20:39](#msg5dec0e1c8e906a1c8d89c48d)\[!\[image.png](https://files.gitter.im/red/red/gui-branch/OVO7/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/OVO7/image.png)

hiiamboris

[20:42](#msg5dec0ec46a85195b9e16e954)Interestingly, the circle center jumps on W7.

[20:43](#msg5dec0edf1e0b827cc8bc02cf)That's unexpected

[20:43](#msg5dec0f0e9319bb5190f97cee)I wonder if the real circle painting function takes left/top and right/bottom corners.

greggirwin

[20:44](#msg5dec0f28c3d6795b9f3f84c8)API difference maybe.

hiiamboris

[20:45](#msg5dec0f5ac3d6795b9f3f855f)@henrikmk There are issues with draw implementation. You can work around that for now, by scaling everything down. Scale 0.1 gives you 1/10 of a pixel precision. 0.01 - 1/100, etc.

[20:50](#msg5dec108805eec2433df089cc)As I thought, `draw` uses ellipse func with integer coordinates https://github.com/red/red/blob/1d4f76601ae1ebfc459e79292820088205008c6f/modules/view/backends/windows/draw.reds#L1535  
Rather than the float32 one

[20:53](#msg5dec11308e906a1c8d89d9a2)And it seems only GDI+ has a float32 version, not GDI.

greggirwin

[21:36](#msg5dec1b471e0b827cc8bc62b2)If @qtxie doesn't have that on a list, we should note it.

hiiamboris

[21:45](#msg5dec1d7d9319bb5190f9de7e)D2D will save us all :)

henrikmk

[21:52](#msg5dec1f2b05eec2433df0f30b)@greggirwin I'm on Win10 too, and scaling the circle is definitely much coarser in Red than in REBOL.

[21:53](#msg5dec1f5405eec2433df0f457)@hiiamboris as said (perhaps not clearly enough), using SCALE didn't help.

hiiamboris

[21:56](#msg5dec20021e0b827cc8bc85c0)Well it works for me: `view [b: box 200x200 draw [[pen black fill-pen yellow circle 20x20 20] [pen black fill-pen red scale 0.01 0.01 circle 4000x4000 2000]] slider [probe b/draw/2/10: 1000.0 * face/data + 2000.0 ]]`

[21:56](#msg5dec201926eeb8518f8314a7)Check your code ;) It has to work.

henrikmk

[22:05](#msg5dec2228d75ad3721d71517e)@hiiamboris ok, sorry, I mixed up two issues.

## Sunday 8th December, 2019

henrikmk

[00:33](#msg5dec44e76a85195b9e185b2a)Perhaps as a workaround for GDI, scaling all draw operations internally 10x could help sub-pixel issues, although of course, I'm not sure if there then will be problems with fonts. Is GDI meant to stick around for legacy/compatibility purposes?

hiiamboris

[09:52](#msg5decc7cd32df1245cb0458ac)GDI can render older (pre-truetype) fonts for one. And is somewhat faster than GDI+.

dockimbel

[11:43](#msg5dece1d08e906a1c8d8f5d84)@henrikmk  
&gt; @dockimbel the scenario is to update hundreds or thousands of elements in a draw block, so it's easier to bind the draw block to one or multiple other objects and/or another block than the other way around. in that case, the draw block construction code and the update code are in two different places, so you don't know what the draw block looks like. so I made the rule of never poking the draw block directly.

So you are using hundreds or thousands of words to update the draw block?

Anyway, Draw interpreter is optimized for maximum speed. Resolving words for Draw instruction arguments would slow down a bit the decoding of all the Draw commands supporting arguments. We allow the optional use of words for values in some specific cases though, for color names and font object (as there is no literal object form). Moreover, the Draw block is meant to be modified dynamically, as you can (should) use it directly as a datastructure. By searching for workarounds to avoid that, you are fighting against the Draw design. In Red, Draw has some extra features to make it easier to update the block dynamically, like set-words for naming specific positions in the block and commands grouping (both good solutions for variable-length shapes). Creating filtered direct reference lists on the Draw block is also another approach that is very efficient.

henrikmk

[14:06](#msg5ded034d05eec2433df725c0)@dockimbel I think it got lost in the discussion, but paths are used as well, and yes, there are thousands of paths.

[14:16](#msg5ded05a5c3d6795b9f45f53b)@dockimbel "Anyway, Draw interpreter is optimized for maximum speed. Resolving words for Draw instruction arguments would slow down a bit the decoding of all the Draw commands supporting arguments."

In REBOL, View's image compositor is the bottleneck long before DRAW block parsing becomes a bottleneck, especially if you do layered draw blocks. I'm not sure if it's the same for Red, but I think it's necessary to consider.

[15:22](#msg5ded1548d64a052fb6da4cbb)@dockimbel Moreover, the Draw block is meant to be modified dynamically, as you can (should) use it directly as a datastructure.

So in the scenario, I'm working on, there are some things to consider and are all used for a real-world application:

\* You don't necessarily know the draw block data structure from the scope of coordinate calculation, but you may know the coordinates.

\* Not knowing the draw block data structure comes from a requirement of high configurability of leaving certain elements in or out, positioning them slightly differently or drawing the same elements with different styles or scales.

\* Therefore, the draw block is created, at times, the same amount of times that coordinates are calculated, but usually, much less often. Therefore, creating the draw block and calculating the coordinates are two different processes.

\* The same coordinates can be bound to several different draw blocks simultaneously, although calculation only happens \*once\*.

\* Coordinates can also be referenced in multiple places in the same draw block, say for where multiple separate lines meet up. If you then calculate a new coordinate, you're only doing \*one change\*.

\* Calculating the coordinates is independent of the draw structure, addressing coordinate objects and blocks directly via the simplest possible loops. Since coordinate calculation happens in mezzanines, that's a simple optimization that requires no effort.

\* Making draw blocks with words makes them self documenting and there is no need for dummy 0x0 coordinates.

\* While the coordinate calculation doesn't change, you can have a list of draw block variants. In one place, you can freely interchange 9 different variants during a draw block rebuild using the same coordinate object.

\* Also, the above point means you can change the draw block without doing calculations, since coordinates are safely stored elsewhere.

\* Coordinate objects are much, much easier to debug than layered draw blocks, because you can say `probe vertex-obj/guide-line/top-left` and get a bunch of related coordinates in a block instead of `probe reduce [draw-blocks/4/653 draw-blocks/4/667...]`.

\* Calculating the coordinates can freely come before creating the draw block and this is sometimes done in order to know on the first run how many elements you need in the draw block. Subsequent runs just update the coordinates.

\* In all of the above, \*no direct poking of draw blocks is done\*. There is a build process for initial build and for reconfiguration, but otherwise no poking and no need to know absolute positions in draw blocks.

All this is possible, simply by being able to bind words to draw blocks and use paths in them, so I think it should be quite simple to add to Red.

GiuseppeChillemi

[15:58](#msg5ded1da4d64a052fb6da85d5) (Being with the pros and saving their articles for a further reading when you will the knowledge to understand them, its happening right now, again! )

pekr

[16:14](#msg5ded215f32df1245cb06ca4e)Exactly :-) I don't understand at least half of the stuff discussed, but it keeps me excited - dunno why? Maybe I still remember Carl's "Multimedia is my second name" and wish a Scala Multimedia smooths animations done in Redbol.

[16:16](#msg5ded21e79319bb519000a9c0)I wonder if new D2D draw backend adds some smoothness to the rendering ....

GiuseppeChillemi

[16:23](#msg5ded239455066245988eb54a)I remember having read somewhere that Rebol VID was good for making kiosks. It would be time to resurrect that style as we are in the touch interfaces era.

pekr

[16:33](#msg5ded25c046397c721cac5733)Well, we are supposed to make own styles. I haven't tried, using draw or some other way, but if it is possible, most probably we will be able to make a complete own styles. But - once again we would be back in territory of handling everything ourselves (events, keyboard support, focusing, etc.)

henrikmk

[16:33](#msg5ded25e232df1245cb06eb65)sorry, if it sounds hard to understand. the above is meant to make code simpler to make, simpler to read and simpler to scale up to greater complexity.

GiuseppeChillemi

[16:47](#msg5ded29246a85195b9e1e6e38)@henrikmk You are a very advanced developer specialized on GUIs. I am just a newbye on this topic. You have nothing to excuse for, it's me who has everything to learn.

[16:49](#msg5ded29871e0b827cc8c39061)I don't have any idea of internal DRAW block VID functioning, dialect conversion and inner data structure of DRAW/VID blocks either in Rebol and RED. Documentation would welcome if any exists.

henrikmk

[16:49](#msg5ded29916a85195b9e1e714c)@GiuseppeChillemi it's also my challenge to make things simple, so that beginners have a chance to keep up. :-)

GiuseppeChillemi

[16:56](#msg5ded2b3a5ac7f22fb5835f83)@henrikmk As written I lack of basic documentation. A reference document would be welcome.

henrikmk

[17:06](#msg5ded2d81c3d6795b9f470095)@GiuseppeChillemi I wouldn't know where to start, since I'm not up to speed with which docs are where, but I might journal the creation of styles, if I get around to that (probably next year, since schedule is pretty tight right now)

GiuseppeChillemi

[17:23](#msg5ded31858e906a1c8d919f79)@henrikmk would be very welcome.

greggirwin

[19:45](#msg5ded52de32df1245cb0821a1)@henrikmk seeing the actual code would probably help more than explanations.

henrikmk

[20:26](#msg5ded5c6df65fec1c8ee6bd45)@greggirwin it's really basic. the examples I posted when I first mentioned it show what is necessary. I don't want to and can't post the entire code (about 5200 lines), since I don't have permission.

greggirwin

[21:10](#msg5ded66dcc3d6795b9f4893aa)I appreciate the time taken to explain how you use it, and agree that clarify of intent is important. We have a couple people working on charting in the background, which will be our first big internal application for `draw` in a domain. We'll likely learn from that, and your thoughts. Something to consider, per @dockimbel's message, is that when there's a frame-rate driven approach, having a static structure means more consistency, where dynamic lookups could cause lag. Evaluating words, which may reference functions for example. Design is an imperfect science.

henrikmk

[22:31](#msg5ded79aed75ad3721d7a9652)@greggirwin I agree that picking an approach is hard without having some idea what the result will be. Performance and flexibility often require two different implementations.

I can also appreciate that it must be difficult to gain a different perspective, when you've worked long and hard on a DRAW engine that gives you great performance in certain tests.

In honesty though, when drawing a GUI, \*which one must presume that Red's DRAW will primarily be used for\*, the draw dialect parsing and coordinate calculation is the least of it. It's the rasterizing that costs, and so, adding a bit more flexibility to DRAW should not give you a large performance impact.

The average Red GUI developer will not care if the tiger.ps demo runs at 100 or 400 FPS, but rather whether certain GUI widgets can be done and how much code it takes to build them and how readable and maintainable the code is, when they're done. And allowing full binding of DRAW blocks \*will* give you more readable DRAW blocks.

Consider this:

```
draw bind bind [
  pen pen-color
  fill-pen fill-color
  scale config/dpi-scale config/dpi-scale
  line-width config/standard-line-width
  box top-left bottom-right
  text top-left box-text-string
] draw-info config
```

Separately from this:

```
draw-info: make object! [
  pen-color: red
  fill-pen: yellow
  box-text-string: "foo"
  top-left: 20x20
  bottom-right: 150x40
]
config: make object! [
  dpi-scale: 1.2
  standard-line-width: 1.5
  half-line-width: .75
]
```

And all you need to do to make adjustments:

```
draw-info/top-left: get-mouse-cursor-offset
draw-info/bottom-right: draw-info/top-left + size-text size-face draw-info/box-text-string
config/half-line-width: config/standard-line-width / 2
```

(It doesn't explain the use of paths, but don't want to post too much stuff)

I have also tried developing REBOL widgets using a personally developed C draw library which draws to an image! using REBOL routine!s and then bypassing View's image compositor, and it pushes View to the limit, update-wise, giving me 30-45 FPS on a 2560x1440 screen, drawing millions of dots and  
hundreds of thousands of squares per second on screen, and it was very fun to use. It wasn't even particularly optimized. In REBOL terms, it's many times faster than what can be done natively. But the library was so inflexible that I abandoned it quickly.

"Very fast in straight lines", I think they say.

hiiamboris

[23:38](#msg5ded89589319bb5190033fb1)Don't you think D2D implementation will push rasterization cost totally out of the equation?

## Monday 9th December, 2019

henrikmk

[01:26](#msg5deda2b31659720ca82398c7)@hiiamboris I doubt it will be pushed that far out of the equation, especially also with image compositing in mind. I'd like to see how much of a cost it would be to have those DRAW changes. I bet it's negligible.

greggirwin

[02:29](#msg5dedb1809319bb51900442af)@henrikmk you make a strong case for the declarative approach. Performance wise, it needs to be fast enough, but no more. :^)

## Thursday 12nd December, 2019

planetsizecpu

[08:26](#msg5df1f9d0f1cc6c27ea362a8f)This week I had some time to enjoy a little playing in the cave. I have noticed that the L3 level was too difficult to overcome, so I modified the stage a bit, including some stairs and also new handles to hang on the kart railway, so as not to be rammed. I don't know if some one is playing, hope you like it 😉

[08:27](#msg5df1fa080dc628523e206d6d)\[!\[cavetest31.gif](https://files.gitter.im/red/red/gui-branch/YeQE/thumb/cavetest31.gif)](https://files.gitter.im/red/red/gui-branch/YeQE/cavetest31.gif)

[08:30](#msg5df1fa9fe7265623012ddc1e)Another thing I have seen, that with today's update the mobile elements, such as the kart and the elevators work a little faster, I guess due to improvements, we have to congratulate the Red team.

## Friday 13th December, 2019

pekr

[13:16](#msg5df38f1f2bca3016aa723dc3)What is the main purpose of the Direct2D backend? Respectively - what is going to be supported? Just some image manipulations, or even draw and text rendering, etc?

hiiamboris

[13:34](#msg5df3936de47fb31eb7a5db82)Haven't you asked it already? :point\_up: \[December 1, 2019 9:56 PM](https://gitter.im/red/red/gui-branch?at=5de40cfa8e906a1c8d4fa6e0)

pekr

[13:39](#msg5df3948d0616d6515e30d33a)I thought so, but did not remember the answer. Was doing some tests with my news-scroller old script, also particles, was comparing D2D branch with the Master and can't see/feel any difference ....

[13:42](#msg5df39533e47fb31eb7a5ea02)Qtxie repliead, that it's for draw only, but I can see also some image related stuff (wic - windows image components) support, so was not sure, if the support is going to be wider or not ....

henrikmk

[19:34](#msg5df3e7c20dc628523e2e16fd)Well, there is one difference, it crashes a lot easier. :-)

## Sunday 15th December, 2019

henrikmk

[18:11](#msg5df6776ae47fb31eb7b94406)Is there any method implemented for getting the cursor position in a text field? I see proposal for EVENT/PICKED and such, but was wondering what the state of this is.

hiiamboris

[18:28](#msg5df67b390616d6515e4451f6)Funny you should ask, because we with @toomasv were hacking that (on Windows only) today ;)

[18:30](#msg5df67bc255d9392300172e5f)I believe design decisions about that have not been made yet.

henrikmk

[18:31](#msg5df67bf07ce7ea1e358c9fd5)Ah, that sounds good. Though, maybe EVENT/PICKED isn't as obvious as putting that information in FACE/CARET or something. FACE/SELECTION exists and I find the two bits of information to be related.

[18:32](#msg5df67c51578ecf4b1fabc08f)Any text editing state management should probably be in its own context for each face and extensible, for faces that support multiple cursors and selections.

hiiamboris

[18:34](#msg5df67ca50dc628523e3f2753)In fact selection and caret position are sharing the same mechanism in WinAPI. But my wild guess is that they were separated in Red by design so that `face/selected` is not `none` only when there really is a selection.

henrikmk

[18:35](#msg5df67cf7dbf24d0becf544db)I would like to consider the idea that Red gets its own text editing kernel in the future.

hiiamboris

[18:36](#msg5df67d2cdbf24d0becf545a7)It seems that was the idea 3 years ago ;) https://github.com/red/red/issues/2422#issuecomment-279211371

henrikmk

[18:39](#msg5df67de37d382b523f81e7a5)I'm getting the sense that the development of this has slowed down, because the AREA widget is native.

greggirwin

[18:41](#msg5df67e43ac14cc652c8bfe08)@henrikmk R2 had a simple editing kernel, and we can certainly look at that. I know you're just getting into Red, but you know that domain pretty well. Cate Dixon even wrote a little Emacs editor IIRC. With modern features like multiple carets, we will want it eventually. Since we have a rich-text style, it can be quite powerful.

hiiamboris

[18:42](#msg5df67e89c6ce6027ebc83de2)https://gist.github.com/toomasv/8fcd1bbd7de9451e7789dbdf5ae35881 related

henrikmk

[18:47](#msg5df67fc87d382b523f81f2d3)@greggirwin I know it a bit, yes, though I never really looked deeply into the text editing kernel in View, other than to fix a few bugs for VID Extension Kit. Neither REBOL/View's text editing kernel nor RebGUI's variant are particularly good. A good kernel can be a bit of an undertaking, but probably also something that is easily developed separately from the rest, and could with great value also be ported back to REBOL.

I'm not familiar with the text editing kernel for R3, but I seem to remember that Gabriele Santilli might have worked on it.

greggirwin

[18:48](#msg5df67ffd7ce7ea1e358cb794)Thanks @hiiamboris !

henrikmk

[18:49](#msg5df68037ac14cc652c8c0932)@hiiamboris there seems to be a rich text widget in the built-in VID style list in Red. Is this a different one?

hiiamboris

[18:50](#msg5df68063c6ce6027ebc84d91)This snippet provides editing facilities (caret and keys) to it I believe.

greggirwin

[18:50](#msg5df6806bc6ce6027ebc84d96)https://doc.red-lang.org/en/rtd.html

toomasv

[18:54](#msg5df68158dbf24d0becf55e72)This was early experiment just after rich-text was announced. Doesn't work anymore.

[18:56](#msg5df681e67ce7ea1e358cc520)But \[this](https://github.com/toomasv/syntax-highlighter) probably works still. (At least my local copy does)

henrikmk

[19:00](#msg5df682b242784416abf1c10b)@toomasv thank you

[19:01](#msg5df682f2ac14cc652c8c1c5a)Basic layout as you type program. A way to stretch the legs of VID (it cramps up here and there. notes at the bottom):

https://gist.github.com/henrikmk/c77504cfe1bbf91d3f2d543e02a0e027

toomasv

[19:01](#msg5df682f9f1cc6c27ea5534b5)You are welcome! These were my experiments while learning Red, probably full of silly things.

henrikmk

[19:04](#msg5df683abce2b2e652bdfb24b)@toomasv thanks. I would eventually also like to work on widget resizing. I have some models in mind that I've already been prototyping in REBOL, that might solve some problems with how to convey complex resizing information in layouts.

toomasv

[19:06](#msg5df68432e47fb31eb7b99c7d)More about \[rich-text](https://github.com/toomasv/learning/tree/master/snippets/rich-text). Some \[resizing/positioning experiments](https://github.com/toomasv/learning/tree/master/styles) too.

GaryMiller

[19:06](#msg5df6844e578ecf4b1fabf481)I think knowing the cursor position would allow you to add code to scroll correctly with word wrap turned on if you knew the cursor position because if the cursor position was greater than the last line you are capable of viewing in your multiline text box then you could just do another "Scroll". (regular multiline text box not Rich Text)

## Tuesday 17th December, 2019

planetsizecpu

[10:56](#msg5df8b450ac14cc652c9b8adf)Of course there are some tricks and also hidden cheats in the \[game](https://github.com/planetsizecpu/Cave-In) I enjoyed while programming. There is a new L11 level knocking on my head, let's see if this xmas holidays I find the inspiration again.

[10:57](#msg5df8b4972bca3016aa955629)\[!\[cavetest32.gif](https://files.gitter.im/red/red/gui-branch/vBDS/thumb/cavetest32.gif)](https://files.gitter.im/red/red/gui-branch/vBDS/cavetest32.gif)

hiiamboris

[11:00](#msg5df8b54b0dc628523e4e6b9e)cart shot :) nice!

planetsizecpu

[11:01](#msg5df8b59d55d939230026c817)yeah, note the barrow loaded the gold itself 😂

loziniak

[11:05](#msg5df8b68d55d939230026d05c)It's not fair, policeman should also be killed by the elevator!

planetsizecpu

[11:08](#msg5df8b734f1cc6c27ea6472e1)@loziniak it is a friendly elevator 😉 other wise the game would be hard to design

greggirwin

[21:47](#msg5df94d0d7d382b523f95c806)I really need to make time to play. :^)

## Friday 20th December, 2019

pekr

[12:36](#msg5dfcc0580cb24d1d44f0afc7)Ellipse, triangle, polygon, spline, arc, curve, pen, matrix .... does seem like Direct2D might be more, than just a text support on D2D :-)

[12:37](#msg5dfcc07bc0c8ef301be43c05)PS: ignore my expectations, Christmas and gifts are coming, right?

planetsizecpu

[15:52](#msg5dfcee348897197969cc8be7)I have just started L11 chroma this afternoon, it is a hard work towards me this next weeks.

[15:52](#msg5dfcee3bc0c8ef301be58861)\[!\[cavern-struct-chroma.jpg](https://files.gitter.im/red/red/gui-branch/g3ED/thumb/cavern-struct-chroma.jpg)](https://files.gitter.im/red/red/gui-branch/g3ED/cavern-struct-chroma.jpg)

[15:54](#msg5dfceeaa49314a1d45af730f)What will be in background is a secret to discover 👀

greggirwin

[18:22](#msg5dfd1182260751301ce09473)@planetsizecpu :^)

@pekr I haven't seen any announcements.

pekr

[18:34](#msg5dfd1444cf771f7708004eee)I haven't seen any either. Just watching D2D commits and wondering, how wonderful our rendering backend is going to be ;-)

greggirwin

[18:55](#msg5dfd190e0cb24d1d44f329de):^)

## Thursday 26th December, 2019

pekr

[09:11](#msg5e04795c44e1fb33f62db292)I am following the D2D branch. Was curious, if the Particles demo would work with acceleraded D2D backend and if we would get higher FPS. While it does not work with the D2D backend yet, I observed strange thing with the Particles demo - when I start it, I can get something like cca 40 fps for 100 particles. When I turn it into 200 particles, the FPS gets lower. So far, logical. But when I lower the number of Particles down to cca 20, the FPS skyrockets and stays there even if I go back to 100 or 200 ones. I am just curious, what is the cause - either the FPS count does not have a good logic, or there are some preallocations or something like that, which makes it run faster?

qtxie

[10:30](#msg5e048bcc84c2167709680178)I don't think the Particles demo will be faster. It creates different gradient circles each frame while create gradient pen in D2D is expensive.

pekr

[11:38](#msg5e049ba384c2167709686336)OK, it displays higher FPS (30 vs cca 800), but the screen is empty (just black bg). Most probably D2D is still not fully implemented. Well, if my understanding of D2D completly replacing GDI is correct at all ...

## Friday 27th December, 2019

phillvancejr

[20:04](#msg5e0663c10fd3413f4c6497a1)Is it possible to compile Red to C? For example if i wanted to be able to write a program in C but use the Red view system for my Gui?

dander

[20:25](#msg5e0668ce89701b511d1f614c)@phillvancejr is this what you are looking for? https://doc.red-lang.org/en/libred.html

phillvancejr

[20:27](#msg5e0669202d574c7d1eca4209)Thank you @dander !

dander

[20:28](#msg5e06696ed5a7f357e690be29)@phillvancejr you're welcome! There is also a \[blog post](https://www.red-lang.org/2017/03/062-libred-and-macros.html) about it

greggirwin

[20:43](#msg5e066cd92d574c7d1eca5967)Note, there is currently an open issue with building libRed. We're on it.

## Sunday 29th December, 2019

koba-yu

[00:57](#msg5e07f9f82d574c7d1ed415bf)&gt; Note, there is currently an open issue with building libRed. We're on it.

Just information. The issue now closed.  
\[Issue#4209](https://github.com/red/red/issues/4209)

greggirwin

[01:00](#msg5e07faa76ff7ae03fc641f7a)Thanks for checking!

koba-yu

[01:02](#msg5e07fb3c833c373f4d732ad4):+1:

## Monday 30th December, 2019

planetsizecpu

[14:11](#msg5e0a058f0c3aeb107d789277)Just now released L11 level as beta, I need to play a bit to check if everything is ok, but we can enjoy playing.

[14:14](#msg5e0a0635eaa2cd096fc73b31)\[!\[cavetest111.gif](https://files.gitter.im/red/red/gui-branch/k3bG/thumb/cavetest111.gif)](https://files.gitter.im/red/red/gui-branch/k3bG/cavetest111.gif)

greggirwin

[20:52](#msg5e0a6396d5a7f357e6a9de48)Is there a riddle to go with that Sphinx? :^)

## Tuesday 31st December, 2019

planetsizecpu

[09:12](#msg5e0b10ef052986049816115c)mmm good idea, I could put a teleporter, as in level L9. I will have to credit you in the source code for this contribution :-)
