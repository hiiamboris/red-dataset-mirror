# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2023

## Tuesday 3th January, 2023

luce80

[14:54](#msg63b441a8378d512c18440134)Promotion:  
Inspired by various example scripts posted here and with the aid of @hiiamboris 's elasticity...  
After a few hours of playing I have made \[this](https://gist.github.com/luce80/a5bb54f128934140e36c7a1073958455)  
try it by typing this in the console:

```
do/args https://t.ly/cq6ih "test"
```

[14:56](#msg63b44218c4fec572d668fe90)@hiiamboris If you think I would have not "stolen" your work, please tell me and I will erase it.

hiiamboris

[15:22](#msg63b448240dba3574235a5060)Nobody owns ideas, they just use us to conquer the world ;)  
So my work is free for anyone to build upon and take inspiration from.

[15:33](#msg63b44abbff1fd121b328f126)I like your idea of composable reaction templates :+1:  
But `emit-rule` is totally esoteric :)

[15:35](#msg63b44b548f8df4262ad591c1)Another way to check for 4 ints: `parse block [4 integer! end]`

luce80

[15:39](#msg63b44c2b51d2482e91ed9b43)&gt;totally esoteric

I am waiting for a more idiomatic version ;) . And while you are at it what about you implementing the system/script/header/Notes TODO part ;) ?  
&gt; check 4 ints

Nice! I think I will steal also this.

hiiamboris

[15:47](#msg63b44e1f40557a3d5c5a5b10)&gt; more idiomatic version

You could rewrite every `some/path/value: x` into `set in some/path 'value x` or rather `set in (path) 'value x`... or even better `set in (object) 'value x`... or just `bind` the whole block to the face in question... ;)

[15:52](#msg63b44f3b378d512c184421d4)As for  
&gt; it would be nice to have some widgets being "attached" to their neighbours to keep their relative distances so not to have to explicitly set #move- when not necessary

This thing (which is employed by `#fill` strategy) takes about half of the `elasticity.red` code - distance measurement in a chaotic ensemble of boxes. Well, measurement less, filling strategy more, but it's still problematic.

[15:56](#msg63b4503963c9fc72d30d96ed)You may find some useful funcs here: https://codeberg.org/hiiamboris/red-spaces/src/branch/master/auxi.red#L114-L150

luce80

[16:07](#msg63b452ba410c633d4809e44a)

```
*** Script Error: invalid function definition: [{Get coordinates of the point on box B1-B2 closest to ORIGIN} B1 [pair!] "inclu
*** Where: either
*** Near : closest-box-point?: function [{Get coordi} ]
```

Have you redefined `function` somewhere to accept default values ?

hiiamboris

[16:09](#msg63b4532fff1fd121b3290586)https://codeberg.org/hiiamboris/red-common/src/branch/master/advanced-function.red

[16:26](#msg63b4574040557a3d5c5a6e82)While you're thinking on how to maintain distance to this or that face, here's a layout to meditate upon :)  
!\[](https://i.gyazo.com/04a90a99357e9b07e82ec23a6a4f31e7.png)

luce80

[16:38](#msg63b45a067de82d26160f134f):) simple, just use AI ;) . But I prefer to meditate on resizing normal table-like layouts. Just imagine , for instance, that simply defining the 1st `field` of my example as "resizable" it will push and pull the nearby `button`and same for `text-list` and bottom widgets. Shouldn't that be too hard, but not in my \*immediate* todo list so if you want to take the challenge ;) ... or does anyone else dare ?

hiiamboris

[16:43](#msg63b45b250dba3574235a7c8b)(: delegating decisions to AI is the first step towards Skynet (or Matrix)

luce80

[16:50](#msg63b45cbf51d2482e91edbf12)We already did that step, it's just a matter of time.

## Saturday 7th January, 2023

luce80

[10:05](#msg63b943f6378d512c184e4864)A variation on #5221 :

```
view/flags [
	base: base 50x200 255.100.100;.100
	at 200x100 base brick 20x30 loose
	react later [base/size: face/offset - base/offset show base/parent]
] 'resize
```

\- Why are there \*\*3\** rectangles ?  
\- If I drag the "brick" and then resize the window the resizing is slow and with black bands but if I uncomment the transparency and try again the resizing is faster !?  
\- If I change `show base/parent` with `show face/parent` the brick will not move. (A reaction loop ?)  
\- If I remove `later` the window does not open centered on the screen anymore !?

hiiamboris

[10:22](#msg63b947e9be2c3c20c7393d15)https://github.com/red/red/issues/4473

[10:24](#msg63b94863c9591d20d3903164)probably the reason behind all of it

[10:24](#msg63b948713b37dd2c116a21e1)add this example there please

[10:24](#msg63b9487a3b37dd2c116a21ea)so when it's fixed we don't overlook anything

luce80

[18:33](#msg63b9bb0f7de82d261619f216)A "better" version:

```
view/flags [
    base: base "1" 50x200 255.100.100;.200
    at 200x100 text "2" sky 20x30 loose
    react later [base/size: face/offset - base/offset show base/parent]
] 'resize
```

If I resize the window, the text is "blitted" on the "ghost" `face`, with alpha channel the text is not blitted.

## Saturday 21st January, 2023

greggirwin

[02:14](#msg63cb4aa18e760b51fdfe0eaf)Nice work @luce80. Nice meditation @hiiamboris.

## Thursday 26th January, 2023

tangentstorm

[23:20](#msg63d30aab49431d63701a6ac3)is it possible to get a reference to the red console window? `system/view/screens/1` seems to be the whole desktop... other red windows get added to `system/view/screens`, but I can't seem to find the console itself.

greggirwin

[23:30](#msg63d30d1b21cada4343ad545b)`gui-console-ctx/win`, or look at that entire object, depending on what you're trying to do.

## Friday 27th January, 2023

tangentstorm

[00:03](#msg63d314b8434214494d2707c9)awesome! `con: gui-console-ctx/win/pane/1 con/color: hex-to-rgb #ff9999` makes the background light red. haven't found the right place to set the foreground color yet.

greggirwin

[01:11](#msg63d324a6b5e8a462768771cc)`gui-console-ctx/set-font-color`

## Saturday 28th January, 2023

mikeyaunish

[15:25](#msg63d53e54ec2bfc6286783cd8)Is there a way to disable an individual tab in a tab-panel?

hiiamboris

[15:28](#msg63d53f107740c84e49385694)you mean let it stay there but not be selectable?

mikeyaunish

[15:29](#msg63d53f4afc90af0348a7b79e)Yes

hiiamboris

[15:37](#msg63d541540c94855213d24130)theoretically I think this should work:  
`system/view/capturing?: on view [tab-panel 200 data ["a" [button "A"] "b" [button "B"] "c" [button "C"]] on-detect [if event/type = 'select [if (probe event/picked) = 3 ['stop]]]]`

but in practice we don't know what tab \*is going to be* selected, since `event/picked` reports the one \*previously selected* (+1), so I guess you've just found two more bugs

[15:39](#msg63d541a8434214494d2adc45)`'change` event (where event/picked is correct) doesn't stop it from changing

[15:42](#msg63d5424cec2bfc628678459d)ok third bug: `tab-panel` doesn't have a `pane`

[15:43](#msg63d5429e80dc214e32956bba)oh that's because I used `data` (and it kind of worked but not really lol)

ne1uno

[15:44](#msg63d542dafb5fe8552e51d740)`panel/pane/n/enabled?: false` didn't work

hiiamboris

[15:45](#msg63d54307cea934033454a464)yeah just tried that: it disables actual contents of the panel, but not the panel itself

[15:46](#msg63d54344434214494d2adef0)I guess you're out of luck for now @mikeyaunish :)

[15:47](#msg63d54391fc90af0348a7bfdf)`set-focus` doesn't work either

mikeyaunish

[15:49](#msg63d543f8fc90af0348a7c086)OK - thanks for looking at this for me @hiiamboris.

ne1uno

[15:49](#msg63d5440549431d63701e4e98)`panel/selected: n` works

hiiamboris

[15:49](#msg63d5441a21cada4343b13ed6)yes indeed!

[15:49](#msg63d5441b603e2b638731c7ba)`view [p: tab-panel 200 ["a" [button "A"] "b" [b: button "B"] "c" [button "C"]] on-select [old: event/picked] on-change [if event/picked = 2 [face/selected: old]]]`

[15:50](#msg63d5442d603e2b638731c7c7)this won't let you select tab 2

mikeyaunish

[15:52](#msg63d544bdec2bfc6286784a0f)OK - I'll play with that.

ne1uno

[15:53](#msg63d544ddc2911455433c669b)rename tab

[15:53](#msg63d544deec2bfc6286784a5c)"don't click"

hiiamboris

[15:57](#msg63d54602b5e8a462768b40bd)and if user clicks it, crash the program :) that'll teach him

mikeyaunish

[15:59](#msg63d54668434214494d2ae484)Haven't used the "crash-the-program" function yet :)

greggirwin

[17:33](#msg63d55c7a8e760b51fd1022c8)You don't have to be so extreme as to crash the program. Triggering a spring-loaded boxing glove next to the computer should be enough.

hiiamboris

[18:06](#msg63d5641e434214494d2b1455):D

[18:08](#msg63d56494624f3f4330348621)now that would be a \*responsive UI* ;)

greggirwin

[18:08](#msg63d564b6c2911455433c9f07)Indeed! :^)

## Monday 30th January, 2023

lylgithub2021

[07:03](#msg63d76bc6c291145543403a40)

```
view [a: drop-down data ["a" "b" "c"] with [selected: 2] button [print a/text]
```

When I push button before doing any selection on the face `drop-down`, I get `none`, not "b" as I expect. Why? And how to get "b" before selection?

ne1uno

[07:10](#msg63d76d6980dc214e329948cf)lylgithub2021&gt;, which version and OS? I get b with recent latest, win10. though need to press twice to see both output

lylgithub2021

[07:12](#msg63d76dddec2bfc62867c1c64)@ne1uno build 0.6.4 on win7

ne1uno

[07:27](#msg63d7716cc29114554340433d)lylgithub2021, what does `about` show? works on win7 for me but older version does show none. you might try downloading latest version.

lylgithub2021

[07:45](#msg63d775aa21cada4343b52172)\[!\[图片.png](https://files.gitter.im/55b1d8290fc9f982beaacceb/2qL5/thumb/Tu-Pian.png)](https://files.gitter.im/55b1d8290fc9f982beaacceb/2qL5/Tu-Pian.png)

[07:49](#msg63d7767dcea93403345894be)@ne1uno Thank you for yourr suggestion! which version shoud I download? GUI Red or Red Tool chain? I don't know their difference.

ne1uno

[07:49](#msg63d7768ccea93403345894c5)gui

lylgithub2021

[07:50](#msg63d776af80dc214e32995a4a)What is toolchain used for?

ne1uno

[07:50](#msg63d776c28e760b51fd13e93c)compiling executable

lylgithub2021

[07:56](#msg63d77849fc90af0348abb14f)You mean the latest version `GUI Red` can not compile red script(which can be done by the version I use at present)?

ne1uno

[07:59](#msg63d778d20c94855213d63a29)previously, they were all packed together. gui/cli/toolchain but it then required a delay unpacking on the first use, now they are ready to use

lylgithub2021

[08:00](#msg63d7791dfb5fe8552e55bd90)@ne1uno Many thanks for your help!!

ne1uno

[08:00](#msg63d77936ec2bfc62867c32bd)I think it's eventually going to be simpler.

lylgithub2021

[08:06](#msg63d77a75b5e8a462768f1a90)In sys Windows, where are the unpacked files located?

ne1uno

[08:24](#msg63d77eaa0c94855213d64413)%rootdir%/programdata/red maybe on win7

## Tuesday 31st January, 2023

lylgithub2021

[08:38](#msg63d8d3877740c84e493ee812)

```
view [group-box "title" [text "on-over" on-over [face/parent/text: "hint title"]]]
```

By the above codes, I try to achieve this: when mouse moves over the face of `text`, the title of the face `group-box` will change from "title" to "hint title". when mouse is off `text`, the title change back to "title". The second part(restore the title) fails. Any idea tto make it work? Thanks.

hiiamboris

[08:47](#msg63d8d5ac49431d637024d713)Make use of `event/away?`.

lylgithub2021

[11:01](#msg63d8f50c0c94855213d91091)@hiiamboris How to use it?

hiiamboris

[11:10](#msg63d8f725b5e8a4627691fa66)start with `probe`ing :)

[11:11](#msg63d8f74dfc90af0348ae9203)https://github.com/red/docs/blob/master/en/view.adoc#112-event-datatype

## Wednesday 1st February, 2023

lylgithub2021

[01:43](#msg63d9c3b449431d6370269830)Many thanks!!

[01:54](#msg63d9c654b5e8a46276938bc6)

```
Red [needs 'view]
view [
dd: drop-down data []
return
text react [
myinput: attempt [to-integer trim dd/text]
either all [myinput myinput >= 0] [face/text: dd/text] [face/text: "??"]
]]
```

I want the content of `text` to change with

the value of `drop-down`. When I input "12" to "dd"

from keyboard, I get "21". It seems that the

cursor keep at the beginning position of the

`drop-down` all the time. Why and what's wrong

with my code?

ne1uno

[02:00](#msg63d9c7bf434214494d330b75)try `trim copy dd/text`

lylgithub2021

[02:10](#msg63d9ca12fb5fe8552e5a2948)Many thanks @ne1uno ! And I still do not understand why a simple `copy` solves the problem.

ne1uno

[02:11](#msg63d9ca5e49431d637026a31e)hopefully, someone will comment. adding a copy solves many a problem though

[02:14](#msg63d9cb237740c84e4940b9dd)why the 2nd numbers was 1st and 3rd number 2nd also strange

lylgithub2021

[02:18](#msg63d9cc0aec2bfc62868087fc)This confuses me a lot(of time and energy).

ne1uno

[02:19](#msg63d9cc4b434214494d3313c3)lylgithub2021, a few functions like trim, sort, reverse etc modify series in place. that's part of the answer

hiiamboris

[10:44](#msg63da42a0a24223243861a0ed)@lylgithub2021 cursor is reset every time a modification of text is detected by drop-down

## Thursday 2nd February, 2023

luce80

[18:31](#msg63dc0194a24223243865063f)I have a `loose` button and I want it to move only horizontally, how can I do ? The way I tried is flickering a lot :)

toomasv

[19:00](#msg63dc084f5fb4132b5d9d7b46)@luce80 With `loose` it is flickering, but without is smooth

```
view [
   button "OK" all-over 
   on-down [x: event/offset/x] 
   on-over [if event/down? [face/offset/x: face/offset/x + event/offset/x - x]]
]
```

hiiamboris

[19:01](#msg63dc08a21bbc096730bb23cc)https://github.com/red/red/issues/1637#issuecomment-1248305098

luce80

[19:17](#msg63dc0c5f5fb4132b5d9d8402)@toomasv thanks! Back to the roots ;) . @hiiamboris I made a `loose` implementation in R2 and used `step: 1x0` to move horizontally and `step: 30x0` to move horizontally 30 px at a time.

hiiamboris

[19:19](#msg63dc0cae89339e0bf0c3de10)what was the use case for 30x0?

luce80

[19:24](#msg63dc0dee5fb4132b5d9d866c)Snap to a grid, a knob of a slider that has only a few discrete values, anything you can think of.

hiiamboris

[19:26](#msg63dc0e55daa343234a00d565)you mean if I provided step = 30x30 it would not move the thing diagonally, but snapped to a 30x30 grid?

[19:27](#msg63dc0e9a84f08f6727ff4099)yes, interesting idea, though I'm still not sure it's worth making a standard feature

luce80

[19:35](#msg63dc109a8bbe41172a7007a6)Perhaps not worth it but it won't hurt anyone:

```
view [
   button "OK" all-over 
   on-down [x: event/offset/x] 
   on-over [if event/down? [face/offset/x: face/offset/x + round/floor/to event/offset/x  5 - x]]
]
```

Damn , this is not working correctly but I do not want to debug and fix it and you get the idea ;) .

hiiamboris

[19:39](#msg63dc116658c7fc1a839c2d09)yeah thanks

dockimbel

[21:15](#msg63dc27f5ac888c172f4bd6b6)@luce80 See the \[`bounds`option](https://github.com/red/docs/blob/master/en/view.adoc#options-facet) that was recently introduced for restricting dragging movements. I've noticed some glitches using it in some cases, I would be interested to see if that happens in your case too. Let me know.

## Friday 3th February, 2023

mikeyaunish

[00:30](#msg63dc5590f0c41678f3a8b508)How would I find out about new features/options (like the bounds option above)? Is there a document I can look at?

greggirwin

[01:20](#msg63dc614a9c90f8647b265d0c)New features are generally collected for major releases into change notes, but we also tend to watch commits to see what's being done.

mikeyaunish

[02:45](#msg63dc754c9c90f8647b268037)OK thanks @greggirwin

dockimbel

[13:48](#msg63dd10b8747c6938e1fe0804)As a reminder, you can switch View to debug mode using `system/view/debug?: yes` to get logs about events and face-related reactions. It can sometimes dump too much info, but that's a start. A possible improvement could be to have a companion GUI app with filtering options, where all those logs go to, for easier usage.

## Sunday 5th February, 2023

luce80

[07:24](#msg63df599cf0c41678f3ae551b)I have a panel with many faces, I want to remove all the faces (and perhaps also the panel) and rebuild the panel with a lot of new faces. Which is the better way to not waste memory ?

hiiamboris

[10:28](#msg63df84de6fc5ff38e44b82fe)Repurpose old faces?

luce80

[13:24](#msg63dfadf1c841ba597f2ccef0)The number of faces will be different and I think/hope that rebuilding all will be simpler.

hiiamboris

[13:42](#msg63dfb253480b726318ae1ddf)Then I would just do it the simplest way and worry not about preemptive optimizations.

luce80

[14:07](#msg63dfb8249c90f8647b2ca0d3)So simply clearing the panel and re-making all, won't waste a lot of memory ? Isn't at least `recycle` placed somewhere-I-dont't-know-where, recommended ?

hiiamboris

[14:33](#msg63dfbe1e9c90f8647b2cac84)recycling is done automatically

greggirwin

[19:45](#msg63e00773f4ead81aa360ec10)As @hiiamboris said, don't worry about it until you know it's a problem. Do a test (and share it here) to generate a random combination of faces, clear, rebuild and do basic profiling. Let the computer do the work. If you \*know* it's going to be a large system, and find out that the easy way won't work, then you can create pools of faces and reuse them, but that's a LOT more work and a LOT more chances to make mistakes. Then you have to ask if it's better to be a little slow than to be wrong or crash.

## Monday 6th February, 2023

rebolek

[09:46](#msg63e0cc5ec841ba597f2eddd2)https://poignardazur.github.io//2023/02/02/masonry-01-and-my-vision-for-rust-ui/  
The thing that I agree most with is "replay feature should be a first-class citizen". Which means user definable `event!`s.

ldci

[09:47](#msg63e0ccc0eddd71596c192e93)@luce80 . The way I adopted for removing facets and keeping others in a panel:

```
deleteNubs: does [
	nbFaces: 22									;--number of facets to keep
	keptFaces: copy/part radioWin/pane nbFaces	;--save facets
	append clear radioWin/pane keptFaces		;--delete nubs and add saved facets
]
```

## Tuesday 7th February, 2023

luce80

[18:08](#msg63e29395747c6938e1087623)I am trying the `bounds` alternative to move a `loose` face only horizontally but... try this:

```
view [button "test" loose options [bounds: object [min: 0x0 max: 0x0]]]
```

```
>> about
Red 0.6.4 for Windows built 4-Jan-2023/9:46:38+01:00  commit #8290def
```

hiiamboris

[18:10](#msg63e293fc195b0f64828836e6)oopsy,

```
*** Runtime Error 98: assertion failed
*** in file: /d/devel/red/red-src/master/runtime/datatypes/symbol.reds
*** at line: 107
***
***   stack: red/symbol/resolve 126360808
***   stack: gui/parse-common-opts 05972240h 05720E88h
***   stack: gui/OS-make-view 049F0584h 9184474
***   stack: ctx||459~make-view 049F0584h 049F0594h
```

[18:10](#msg63e294164a6a1844631ab729)you should report it

[18:11](#msg63e2946b747c6938e10877e1)works as expected when I put an `object!` value there

luce80

[18:15](#msg63e29534747c6938e1087985)There where ?

hiiamboris

[18:18](#msg63e295fc6b829e1a9a801c73)after `bounds:`

[18:19](#msg63e296216b829e1a9a801cb6)(you have a word where it expects an object)

luce80

[19:21](#msg63e2a4cf6b829e1a9a8037b2)Ok I 've done it and it works :) but I wouldn't say it is easy nor "as described" :(

```
view [
	button "move x" loose
		on-created [ append face/options compose [bounds: (object [min: face/offset - 20x0 max: face/offset + 50x0])]]
]
```
