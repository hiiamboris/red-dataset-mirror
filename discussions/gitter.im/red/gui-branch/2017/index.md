# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2017

## Thursday 5th January, 2017

DideC

[13:03](#msg586e44079e6f00e74afcac02)If a made a change in VID.red, how can I test it from the source ?  
I tried building the console as explain in the Readme, but it give an ms-dos console without view module !

ghost~5680c5f416b6c7089cc058a5

[13:06](#msg586e44e2af6b364a29335ef7)@DideC Add `Needs: View` to the header in console.red and then compile console.red

DideC

[14:08](#msg586e5354c895451b755b7afb)@nc-x I tried: the resulting console.exe does not work anymore. No error, it just start and stop without showing anything.

Zamlox

[14:08](#msg586e5358c02c1a3959edc0e2)@DideC This is how I compile gui console on Windows:

```
rebol -s red.r -t Windows environment/console/gui-console.red
```

DideC

[14:09](#msg586e5385c02c1a3959edc251)Ah! I compile console.red, not gui-console.red. That might be my problem ;-)

Zamlox

[14:09](#msg586e539baa6be0472f0ef302);)

planetsizecpu

[14:44](#msg586e5bcbc02c1a3959eded31)@qtxie Today I downloaded Red 0.6.1 - 5-Jan-2017/15:20:23+1:00 and noticed  
a blink effect on area text when displayed with rate, seems related to scroll  
bar movement because it only appears when text length is bigger than area.  
If we avoid to display scroll bars reducing text area it displays as normal  
and so did in previous releases with full length text. I don't know if it is  
an issue or a new behavior, but IMO it is quite disappointing.

Here is a link: https://dl.dropboxusercontent.com/u/35032037/otp.exe

DideC

[16:16](#msg586e71429d4cc4fc537ccda8)@Zamlox @nc-x Compiling gui-console is OK. Thanks

[17:16](#msg586e7f5a7a3f79ef5ddd89b3)I tried today my first PR for a VID changes. But I'm still new to Github, so...  
As I understand it this PR is on my Red fork Didec/Red.master (Am I wrong ?), not Red/Red.master one ?  
https://github.com/DideC/red/pull/1

[17:16](#msg586e7f695ffdeea7230d4004)So How do I push this PR on Red/Red codebase ?

Zamlox

[17:21](#msg586e807f9e6f00e74afdf337)@DideC In your Github 'Code' section select your 'master' branch then press 'Pull request' link on the right. On the next page you must select your branch with your changes then press the green button 'Create Pull request'.

DideC

[17:28](#msg586e822e5ffdeea7230d50fd)Got it thanks @Zamlox

Zamlox

[17:28](#msg586e8237af6b364a2934af91);)

## Friday 6th January, 2017

Zamlox

[10:51](#msg586f76b45ffdeea723128e1d)@dockimbel I just made a PR for implementation of

```
complex pen
```

feature as described here: https://github.com/qtxie/red/wiki/Create-Complex-Pen-in-Draw There are many commits and it is only for Windows GDI+ backend. It will break compatibility for gradient usage as the new specification is different by the current one.

meijeru

[11:29](#msg586f7f985ffdeea72312b84b)If I have a `print` call in an interpreted GUI program, the print output appears in a separate window that is started before the window created with `view`is shown. If I run a compiled GUI program with a `print`in it, I can't discover where the print output appears, because only the window created with `view` is shown.

## Saturday 7th January, 2017

endo64

[18:59](#msg58713aaa5ffdeea7231b873d)Can you try to compile with `-t MSDOS` so probably `print` will open a command window (didn't try)

## Monday 9th January, 2017

dockimbel

[09:00](#msg5873511a64d5fd7e1695593f)@qtxie Please have a look at @planetsizecpu GUI issue above.

[09:02](#msg587351a3074f7be763aa13c6)@Zamlox Thanks. We'll try to process your PR this week. There's also a few things I'd like to discuss with you about the directions where we want to go with Draw and its sub-dialects.

[09:03](#msg587351d861fac5a03db46339)@DideC Thanks for the PR too, we'll process it in the next days.

rebolek

[09:10](#msg5873539761e516c157905a52)@dockimbel so can I hope that my 2 months old stylize PR will be proceeded too? ;)

dockimbel

[09:11](#msg587353da64d5fd7e16956937)Yes, it will be processed before 0.6.2 is released.

rebolek

[09:12](#msg587353f3db9cafe9183bda53)Good to know, thanks!

Zamlox

[10:12](#msg587361f8873d96e16d44b258)@dockimbel thanks. I'm looking forward to have a discussion on that subject.

qtxie

[11:52](#msg5873796fdb9cafe9183bdea8)@planetsizecpu Could you please give me the source code to test?

planetsizecpu

[17:14](#msg5873c4f7dec171b811c7a107)\[!\[blob](https://files.gitter.im/red/red/gui-branch/aEFS/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/aEFS/blob)

rebolek

[17:15](#msg5873c51961e516c157906ab8):+1:

planetsizecpu

[17:15](#msg5873c521dec171b811c7a20f)@qtxie of course, it is in my repo, you can get it your way thx.

Also I want to encourage red ppl on his work, things are rolling out, so please stay on the way!  
This xmas I took another red pill to stay on, as we see on the image I felt it is time to show red-lang beauties :)

## Tuesday 10th January, 2017

qtxie

[05:42](#msg58747458d99b1dd03d2f8356)@planetsizecpu Your issue is caused by I remove the WS\_EX\_COMPOSITED flag in a window when \[DWM](https://en.wikipedia.org/wiki/Desktop\_Window\_Manager) is enabled on Windows 7. This flag conflicts with DWM and DirectX(also Direct2D).

I don't find a good way to check whether we need this flag or not when creating a window. So I think the fix for this case should be: `disable the scrollbar`.

[05:54](#msg58747731db9cafe9183bfd6d)We need to provide a way to disable the scrollbar when it's not needed.

planetsizecpu

[08:05](#msg587495decbcb2817704d5bc2)@qtxie THX, I'm in your way disabling scrollbar, maybe a flag? that could be set to true/none values

Zamlox

[08:14](#msg587497f6300f220a66cbe539)@qtxie it must be taken into consideration how Windows (I tested on Windows 7) is configured related to performance/appearance. If it's configured for best performance (Contol Panel-&gt;System-&gt;Advanced system settings-&gt;Advanced-&gt;Performance-&gt;Settings-&gt;Adjust for best performance) then @planetsizecpu example works well (regarding flickering). But you can see that fonts are a bit different in size. If it is configured for best appearance (Adjust for best appearance) then the issue occurs and fonts are nicer. Perhaps this gives an answer also related to WS\_EX\_COMPOSITED flag

qtxie

[08:39](#msg58749dc8db9cafe9183bffcd)@Zamlox Thanks for the testing. It's tricky to get the native widgets flickering-free on Windows. :sweat:

pekr

[09:05](#msg5874a3d361fac5a03dbbf169)Pity we can't forget Win7 yet, as we would be able to use DirectCompositor ... well, if it would be of any help ....

qtxie

[09:53](#msg5874af1cdb9cafe9183c0252)Actually the WS\_EX\_COMPOSITED is mainly used for WinXP, on Win 7 and above should no need this flag.

Zamlox

[11:32](#msg5874c662dec171b811cd2141)

[11:33](#msg5874c672cbcb2817704e6c07)\[!\[blob](https://files.gitter.im/red/red/gui-branch/G4lm/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/G4lm/blob)

[11:33](#msg5874c681dec171b811cd2195)but it is used when configured for best performance:

[11:33](#msg5874c699300f220a66cce0e3)\[!\[blob](https://files.gitter.im/red/red/gui-branch/xplu/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/xplu/blob)

[11:34](#msg5874c6ba6c1635643c0c8fec)Styles shown are for application's main window.

[11:36](#msg5874c720300f220a66cce439)As I understood WS\_EX\_COMPOSITED is related to some double buffering behind the scene, that's why control will not flicker when used.

[11:44](#msg5874c9046c1635643c0c9d74)There might be more differences between those two configuration modes, which currently I am not aware of.

qtxie

[23:21](#msg58756c61cbcb281770528ee0)@Zamlox Yes. It's a problematic flag, I think we should not use it.

[23:22](#msg58756ca1074f7be763b5ea30)@planetsizecpu We cannot disable it for now. :sweat:

## Wednesday 11st January, 2017

qtxie

[04:05](#msg5875aef9cbcb28177053dc5f)@planetsizecpu I fixed some issues on drawing text on base face. Now you can use 'base face instead of 'area in your otp app.

```
Area1: base 440x410 rate 10 blue font [
        name: DefFnt
        size: 12
        color: white
] para [align: 'center wrap?: yes] on-time [CycleDoc]
```

pekr

[06:16](#msg5875cdd611e7a7f61d7eb5ab)@qtxie whater you have done, fixed my news scroller base face with text and grey background, which jittered like mad before. Now everything is smooth! :-)

qtxie

[06:25](#msg5875cff496a565f844088554)@pekr A surprise windfall. :smile:

planetsizecpu

[09:10](#msg5875f68e873d96e16d5316e7)@qtxie @pekr @Zamlox Good workaround, now text is rolling soft!

[09:11](#msg5875f6bfe836bf70102b7ead)Thx all together, as I said before this is 1st class development ;)

qtxie

[09:33](#msg5875fbf296a565f844088835)@planetsizecpu I realize that using base you cannot copy &amp; paste the text anymore, it's not good. :(

planetsizecpu

[10:56](#msg58760f6e074f7be763b8dfcd)@qtxie There is no problem, for the moment don't have the need of paste, and we copy data to a txt file while wait for I/O.  
I hope there will come some upgrade to manage scroll bar behavior. Anyway I made this app to learn red, doing some with practical utility not destined to trash. Also I want this as my first android app, and could not wait for see it running in a cell :fire:

[11:07](#msg587611fde836bf70102c1a03)@qtxie also I see terminal and fixed fonts are not right aligning, probably done by center o wrap, but I am unsure.

qtxie

[11:09](#msg5876127a61e516c15790a540)@planetsizecpu Do you use the latest version in master branch?

planetsizecpu

[11:16](#msg587613fd873d96e16d53b4d8)@qtxie You are right, I downloaded last version and now run well ;)

## Friday 13th January, 2017

dockimbel

[09:24](#msg58789cba074f7be763c681be)@planetsizecpu Where can we order such a "Red pill" t-shirt like that? ;-)

planetsizecpu

[11:55](#msg5878c0296c1635643c2399d2)@dockimbel haha, it is self design, and the printout was done at the corners shop, but I can provide the jpg image if it is needed ;)

[11:56](#msg5878c0706c1635643c239ae1)\[!\[blob](https://files.gitter.im/red/red/gui-branch/c6zX/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/c6zX/blob)

[11:59](#msg5878c1326c1635643c239ef5)

## Saturday 14th January, 2017

dockimbel

[04:13](#msg5879a584074f7be763cc0e82)@planetsizecpu Nice! :-)

iArnold

[07:15](#msg5879d02ae836bf7010414864)&lt;/unhide&gt;Personally I would prefer promoting smoking to youngsters in favor of promoting the consumptions of pills, even if the pills are Red.&lt;hide&gt;

## Wednesday 18th January, 2017

maximvl

[12:10](#msg587f5b39873d96e16d832916)oh cmon, how could I miss that channel :D

[12:10](#msg587f5b52dcb66e4f767ae111)so where can I buy "Take the Red pill" tshirt?

[12:11](#msg587f5b6d074f7be763e6caf7)@Zamlox is it a password generator you wrote?

[12:11](#msg587f5b73300f220a660143b3)looks nice

Zamlox

[12:30](#msg587f5fd6dcb66e4f767af718)@maximvl what password generator ?

maximvl

[12:30](#msg587f5ffbe836bf70105c1f07)@Zamlox the OTP gui you posted, it look like one :D

Zamlox

[12:31](#msg587f6018dcb66e4f767af8bc)not done by me.

maximvl

[12:31](#msg587f601cdcb66e4f767af8c2)or is it a font test tool?

Zamlox

[12:31](#msg587f6021dcb66e4f767af8dd)I was pointing out some issues.

maximvl

[12:31](#msg587f6030e836bf70105c20a2)ok, I see

Zamlox

[12:32](#msg587f6059300f220a6601596e)it was done by @planetsizecpu

maximvl

[12:44](#msg587f631b300f220a66016756) @planetsizecpu nice work! do you mind posting source code?

planetsizecpu

[13:45](#msg587f717b6c1635643c44e71b)@maximvl the code is in my repo, so feel free to download and play ;)

maximvl

[13:46](#msg587f71b8dcb66e4f767b5e71)@planetsizecpu nice, I should have checked the github profile before :D

[13:47](#msg587f71e3dcb66e4f767b605d)some time ago I had a link to a page of guy who made some password research and he had a "perfect" list of characters to use in passwords

[13:47](#msg587f71f1074f7be763e747c5)eg no `i 1 l 0 O` and so on

[13:47](#msg587f71fe873d96e16d83a8cf)I will try to find it

geekyi

[13:48](#msg587f7231300f220a6601bf5b)@maximvl https://xkpasswd.net/s/ could be related

maximvl

[13:48](#msg587f7241300f220a6601c02e)this is the generator itself

[13:50](#msg587f728bcbcb28177085cb7f)where were just tips and reasoning behind each of them

[13:50](#msg587f7292300f220a6601c1fe)no worries, I'll look for it :)

geekyi

[13:53](#msg587f7370cbcb28177085d11a)@maximvl ~~also https://www.grc.com/haystack.htm~~ https://blog.codinghorror.com/your-password-is-too-damn-short/ is the best overview / big picture, I remember reading about passwords

planetsizecpu

[13:54](#msg587f739de836bf70105c92cb)@maximvl just updated the repo with latest fix on @qtxie &amp; @Zamlox appointments

[13:55](#msg587f73d5cbcb28177085d4b2)now flicker is avoided

[13:59](#msg587f74c0074f7be763e75b82)@maximvl FYI here is a link to my old java version (more complex of course): https://dl.dropboxusercontent.com/u/35032037/otp.jar

maximvl

[14:08](#msg587f76cb6c1635643c4510bd)@planetsizecpu cool, now I have to read whole discussion to learn what changes you did and why =)

planetsizecpu

[14:10](#msg587f7741e836bf70105cac5b)@maximvl changed area1 from "area" to "base" as @qtxie pointed, just to avoid flicker done by scroll bar movement

maximvl

[14:10](#msg587f7756074f7be763e76b88)what's the difference between `area` and `base`?

planetsizecpu

[14:11](#msg587f778ae836bf70105caf84)Not so sure, just wanted to disable scrollbars, not possible with area

CodeTortoise

[17:58](#msg587facc0dcb66e4f767cebb3)Red has so many branches... how do I set up the reactive gui

[17:58](#msg587facc1cbcb281770877fc1)?

rebolek

[18:02](#msg587fada1db9cafe9183cfe8b)just use latest build, reactive gui is part of master branch

CodeTortoise

[18:03](#msg587fadf6dcb66e4f767cf605)Okay! I have become too reliant on using Chocolatey for getting my programming languages. Time to dive in proper.

rebolek

[18:06](#msg587faeb3db9cafe9183cfeca)you can use precompiled nightly build from http://www.red-lang.org/p/download.html

## Thursday 19th January, 2017

dockimbel

[03:26](#msg588031e6cbcb2817708a4968)@CodeTortoise We do support Chocolatey, see at the bottom of the download page.

CodeTortoise

[03:58](#msg58803970873d96e16d885e11)@dockimbel Yes, thank you. That is how I initially got it. I think that is how I rediscovered it, just searching for random programming languages on it.

## Friday 20th January, 2017

virtualAlan

[00:39](#msg58815c5a074f7be763f23350)might be helpful: I update it weekly: http://www.mycode4fun.co.uk/red-beginners-reference-guide - also adding new examples here: http://www.mycode4fun.co.uk/About-Red-Programming - my site seems to be all about Red just lately.

dockimbel

[02:49](#msg58817ab2e836bf701068e05d)@virtualAlan For your example 9, you should be using `time` events rather than an infinite loop:

```
view [
	title "Red time"
	tim: text 150 font [size: 14 color: red] rate 1 on-time [
		tim/text: append form  "Time: " now/time
	]
]
```

[02:51](#msg58817b35dcb66e4f76873af0)In example 14, you could also simplify the code by replacing all the `if event/picked =` with a single `switch event/picked [...`.

[02:52](#msg58817b82dcb66e4f76873bda)Nice to see all those new examples, good job! ;)

virtualAlan

[03:29](#msg58818404e836bf70106907db)thanks @dockimbel - yes of course, will change it - thanks for looking.

## Thursday 26th January, 2017

PeterWAWood

[09:37](#msg5889c36bc0de6f017ff3d2c5)This question was asked on the Mailing List:

"Can I centre an image in a window ?

```
view [ size 400x400 image %pic.jpg ]
```

will put it in the top left corner.  
Is it possible to centre it in the window? "

Any suggestions?

DideC

[10:02](#msg5889c94ccbcb281770bac4ce)@PeterWAWood There is `center-face` to do that. I tried several things (with `on-create` or VID `do`) but the image face has no parent until the window face is shown. So to use it you need to center the image after viewing it :

```
view/no-wait main: layout [size 400x400 img: image %pic.jpg]
center-face img
do-events
```

[10:04](#msg5889c994dcb66e4f76b32ba2)OR you have to compute the face offset regarding the window and image size and use `at` to put the image at the right place in the layout :

```
pic: load %pic.jpg
pos: 400x400 - pic/size / 2
view [size 400x400 at pos image pic]
```

PeterWAWood

[10:28](#msg5889cf62c0de6f017ff41a19)@DideC Merci.

## Monday 30th January, 2017

endo64

[10:50](#msg588f1a80e836bf7010aba579)Can I detect mouse scroll events?

rebolek

[11:13](#msg588f1fd696a565f8440aac8a)@endo64 have you tried `on-scroll` or `on-wheel` ?

endo64

[12:28](#msg588f31801e4d4bd962af623b)@rebolek I tried, no effect. And I don't see any event for scroll or wheel in the wiki https://doc.red-lang.org/en/view.html#\_events

rebolek

[12:32](#msg588f3271d99b1dd03d31d50d)@endo64 then it’s possible it's not implemented yet. I just saw it in console sources, but scrolling in console doesn’t do anything. @qtxie should know more.

## Sunday 5th February, 2017

qtxie

[01:49](#msg589684b03bcc9b3b25de156d)@endo64 Here is the commit for mouse scroll event: https://github.com/red/red/pull/2263

[01:51](#msg589685271319d8183ef2b28a)There is an example in view-test.red: https://github.com/red/red/pull/2263/commits/8fe045c21ce9c3639c5fc0fcc5fbc9b1e9a65afa#diff-b951d8b2a45168836e3eae62bf0d7530R746

endo64

[11:34](#msg58970dc4ca6c6eb4494a62ce)@qtxie Great! Thanks.

## Thursday 9th February, 2017

Rebol2Red

[05:58](#msg589c051af045df0a2224d44a)The maximum characters in an area is about 27.556 characters.  
If exceeded the text will be truncated.

Can i overcome this limitation and if so will the handling of the text be too slow?

Note:  
I need to handle 160.000 characters or more. An area will be the best choice because i want to load, edit and save large text in an easy way.

[16:12](#msg589c9501f045df0a2227dbd8)Is a maximum amount of characters in an area a bug or does it depends on the free amount of memory? If so then it seems impossible to make a decent editor while using an area!

rebolek

[16:22](#msg589c97564150746b1513340c)@Rebol2Red this is interesting. I don’t think it depends on free memory, I doubt that you have only 27'556 bytes free ;) What OS are you using? Have you tried it in other OS?

[16:24](#msg589c97af9eb1bd81481c3377)Also you wrote 27'556 characters, are you using Unicode chars, or is it just ASCII?

maximvl

[16:26](#msg589c982b872fc8ce6213f027)@rebolek I don't think the limit should be that small, for both ASCII and Unicode

rebolek

[16:27](#msg589c9872567b0fc8138ce87c)@maximvl I don’t think that also, I just find that number bit odd, but with Unicode chars maybe there is some 32kB limit somewhere. That would make some sense.

[16:31](#msg589c9947567b0fc8138ce893)OTOH I don’t think that AREA is good fit for an editor.

maximvl

[16:32](#msg589c9988aa800ee52c733b84)@rebolek so what could be good for editor?

rebolek

[16:36](#msg589c9a86fef1d2de52a9a161)@maximvl I think it depends what you need from the editor. If you want thins like syntax highlighting, AREA can’t do that.

[16:36](#msg589c9aa6fef1d2de52a9a166)There are specialized widgets like Scintilla, or it’s also possible to write one in View directly.

maximvl

[16:37](#msg589c9ab2872fc8ce621403b6)good points

rebolek

[16:39](#msg589c9b444150746b1513349c)I understand that using AREA is the easiest way right now.

greggirwin

[16:52](#msg589c9e6200c00c3d4f18b8d7)Standard widgets, and GUI systems in general, often have limits that are easy to implement, hold-overs from long ago, and work 99.9% of the time. It's only when you exceed their limits that you find the problem. So this doesn't surprise me. When you hit a limit, it's custom code time.

We'll face the same problem if we want to write a full spreadsheet app in Red. At some point, the number of fields will be too high for the OS to manage.

Rebol2Red

[16:55](#msg589c9ef021d548df2ce94ef2)@rebolek  
Plain ASCII (i think)  
Copied and pasted a long source code into an area (made with the editor: Geany)  
OS: Windows 10

rebolek

[17:00](#msg589ca03c9eb1bd81481c3596)@Rebol2Red I've just tried pasting 34kB Red/System source into an area on Mac and there’s no truncation. I will try it under W7 VM.

Rebol2Red

[17:02](#msg589ca0911465c46a5642b7a0)@rebolek Please do, i am very curious if your text is also truncated!

rebolek

[17:03](#msg589ca0f94150746b151335b5)@Rebol2Red so under W7 VM, the text gets truncated at 29093 bytes.

[17:04](#msg589ca1104150746b151335bd)IMO this looks like Windows limitation.

Rebol2Red

[17:06](#msg589ca193aa800ee52c736b81)@rebolek Thanks for testing. Should i file a new issue?

rebolek

[17:06](#msg589ca19c567b0fc8138cea0f)125 kB source is fine under OSX but truncated under Windows.

[17:07](#msg589ca1e1567b0fc8138cea21)@Rebol2Red you should, I think. Maybe it can’t be fixed, because it is Windows problem, maybe there is just some limitation in the Windows backend.

[17:08](#msg589ca203fef1d2de52a9a2a9)I looked at the source briefly, but wasn’t able to find anything related, but I don’t know the source that well to be sure.

Rebol2Red

[17:31](#msg589ca787f045df0a22285757)@rebolek I filed the issue under #2432

rebolek

[17:33](#msg589ca7ce4150746b15133698)@Rebol2Red :+1:

## Friday 10th February, 2017

endo64

[21:41](#msg589e33a26b2d8dd5522a6703)\[!\[blob](https://files.gitter.im/red/red/gui-branch/IfPD/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/IfPD/blob)

[21:42](#msg589e33aef045df0a2230bc87)\[!\[blob](https://files.gitter.im/red/red/gui-branch/4WBP/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/4WBP/blob)

[21:48](#msg589e3546aa800ee52c7c65d7)@qtxie There is a refresh problem on base face.  
I have a base face with a draw block. A function updates the face's draw block. Above you can see the face after draw block changed (first one), but actually the second one is the correct look and only if I set face's text then I see the correct one.

[21:51](#msg589e35ff1465c46a564ba782)My draw block is

```
[ anti-alias on line-join round pen 68.68.68 fill-pen 235.229.225 line-width 2 box 0x0 222x64 text 91x23 "Button" ]
```

my function changes box's size 222x64 to something smaller (say 220x60), I see the first one, if I set `face/text: ""` then I see the second one which is correct.

[21:52](#msg589e3630de50490822b19ba7)It looks like it misses a one-last-update.

[22:40](#msg589e4156f045df0a22310601)@qtxie I also open issue #2434 "event/ctrl? always returns true for on-wheel event"

## Saturday 11st February, 2017

qtxie

[02:13](#msg589e7348567b0fc8138d1bbe)@endo64 Thanks. I'll have a look at it.

endo64

[08:48](#msg589ecfd421d548df2cf4d619)@qtxie It is strange but I cannot produce "event/ctrl? always returns true for on-wheel event" anymore. After a restart it starts working now. I didn't change my source or build red.exe.

[21:20](#msg589f8036aa800ee52c823108)@qtxie I found that #2434 happens only if I use touch pad, it works with a real mouse scroll.

## Sunday 12nd February, 2017

qtxie

[02:26](#msg589fc7cefef1d2de52a9e86e)@endo64 Ok. So that means we need to handle touch pad events.

geekyi

[05:31](#msg589ff34121d548df2cf9ce0c)When testing #2434 , I get an error, but `b` does get changed even so:

```
red>> c: func spec-of :b/actors/on-wheel [probe event/ctrl?]
== func [face event][probe event/ctrl?]
red>> b/actors/on-wheel: :c
*** Script Error: b/actors/on-wheel: is missing its face argument
*** Where: on-wheel
red>> :b/actors/on-wheel
== func [face event][probe event/ctrl?]
```

[05:34](#msg589ff3f921d548df2cf9d0e9)Also, I can't reproduce with my touchpad (it works correctly for `ctrl?` and `shift?`, only giving `true` when the respective key is held down)

[05:37](#msg589ff49fde50490822b8c39f)Mmm.. wait.., I only tried scrolling, just read the bug, gives true with zooming

endo64

[10:26](#msg58a0383f00c00c3d4f2a25db)I thought that touch and mouse scroll events are same but that's not true, touch (zoom) event is ctrl+scroll. it works like that in browsers too.

## Monday 13th February, 2017

Rebol2Red

[09:54](#msg58a18239f045df0a223ec7f9)@rebolek #2432 is fixed (tested with newest version, limitation now about 500k after this the program quits, i think this depends on available memory). Thanks Nenad!

dockimbel

[09:55](#msg58a1829021d548df2c00e93a)@Rebol2Red It should be limited by available memory only.

Rebol2Red

[10:09](#msg58a185f421d548df2c00fcbc)@dockimbel Before the start of a program i have in use 2.1 G, available 1.9 G and when using an area filled with 500k the same values. I watch this in taskmanager and process hacker. Which available memory are you talking about? Maybe disk memory, Cache memory or ...  
I closed firefox to see if i could load 600k into an area.  
The program just quits.

dockimbel

[10:21](#msg58a188b71465c46a565a53d3)Using `view [area "hello"]` test code, I can paste megabytes of text there without any issue (Windows 7).

[10:23](#msg58a189101465c46a565a5590)Available memory usually means \[RAM](https://en.wikipedia.org/wiki/Random-access\_memory).

Rebol2Red

[10:27](#msg58a18a10aa800ee52c8b2ce0)@dockimbel I use windows 10, maybe this is the problem. Do you know if this can be fixed somehow? (Closed anything but the limit is still 500k)

maximvl

[10:35](#msg58a18bf1238b1dae5701f425)@dockimbel @Rebol2Red I will be able to try this out at home, I also have Win10, to be sure if this is reproducible or not

[10:36](#msg58a18c17f045df0a223f03fb)in the evening today, Europe timezone

Rebol2Red

[10:37](#msg58a18c5b00c00c3d4f309944)@dockimbel I think i know why the program quits.  
I did not use area ""  
This is what i use to check.

```
x: copy {}
loop 600 * 1024 [
	append x {a}
]
view [a: area 600 x button "print length" [print length? a/text]]
```

Why is this code (dynamically filling) wrong? How to correct this?

maximvl

[11:05](#msg58a19310aa800ee52c8b67b8)@Rebol2Red so what's the output?

Rebol2Red

[11:06](#msg58a19348872fc8ce622bda4e)@maximvl It will work with area "" so you don't have to try this.  
I do appreciate your willing to test.

The program quits. No output. Because of not using ""  
When using area "" you can copy and paste large amounts of text.

maximvl

[11:08](#msg58a19390aa800ee52c8b6a03)@Rebol2Red ah, I believe there are several reasons why your program could exit like this

[11:08](#msg58a1939daa800ee52c8b6a2a)and only one of them is `area` ;)

[11:09](#msg58a193d7aa800ee52c8b6af1)I suggest you to post the code you are using to test things right with your question, because it makes things less ambiguous

Rebol2Red

[11:10](#msg58a1941021d548df2c015128)@maximvl Several reasons?

maximvl

[11:11](#msg58a1945a1465c46a565a975d)yep, @dockimbel 's code is as simple as possible, your's makes loops &amp; stuff, probably causing a lot of copying since we don't have GC yet, maybe few other things

dockimbel

[11:14](#msg58a194fe1465c46a565a9a59)@Rebol2Red I can reproduce the crash with your example code, please open a ticket for it.

Rebol2Red

[11:19](#msg58a1962c872fc8ce622be8cc)@dockimbel Will do. But maybe you can give me a good title for the issue? Maybe "Dynamically filling of an area does not work well" ?

dockimbel

[11:21](#msg58a196c821d548df2c016021)@Rebol2Red "Crash when trying to view an area with a huge text". You should ban "does not work well" from your programmer's vocabulary. ;-)

Rebol2Red

[11:25](#msg58a1979d00c00c3d4f30d869)@dockimbel Thanks for the title. Maybe you could tell me why i should ban "does not work well"? Just curious!

DideC

[11:29](#msg58a198a9872fc8ce622bf83b)You should ban "Hello doctor, I'm sick" from your patient vocabulary as well ;-)  
And probably "Hello mechanic, my car is out of order" too !

Rebol2Red

[11:33](#msg58a199a6238b1dae57023cb7)@dockimbel, @DideC I spot some humour over here. Nice! Life is hard enough! I say "A laugh a day keeps the doc away"

dockimbel

[11:38](#msg58a19aa100c00c3d4f30ef28)@Rebol2Red Because it carries no useful information beyond a user not happy about the software (could be the user misusing it, or just not reading the docs). Reporting a software issue using "does not work" gives no single clue about what happened. Did it run or did it crash? Did it run fine and the user's expectations are not met? A ticket title needs to be useful for the readers (both for the developers and other users trying to figure out if their issue has been already reported), so it needs to carry as much information as possible to qualify the ticket with as little words as possible. Is it important (like a crash) or not? Is it compiler/toolchain related? Interpreter-related? GUI-related?.... You need to stick to objective descriptions and avoid subjective words (like "well", "not well"). Moreover, a ticket describing an issue, needs to be accurately reproductible, so usually, it provides a minimal source code to reproduce the issue, or otherwise a step-by-step procedure, or even a screen capture (like this \[nice one](https://asciinema.org/a/740utrwaryfn4y07e9nbbzvc0) from @skrylar).

Rebol2Red

[11:45](#msg58a19c70238b1dae57024bd3)@dockimbel Agreed. After reading Didec's comment, i realised what you ment. You just confirmed it with a good explanation. I will keep this in mind.

## Wednesday 15th February, 2017

endo64

[07:52](#msg58a408c8872fc8ce6239e980)@qtxie on-wheel events doesn't triggered on the latest master branch (encapped just now), can you please check:

```
f: make face! [
	type: 'base
	color: red
	size: 100x100
	text: "Test 1"
	actors:	object [
		on-wheel: function [face event] [
			print "face-wheel"	; never happens
		]
		on-down: function [face event] [
			print "face-down"
		]
	]
]

win: make face! [
	type: 'window
	text: "Test"
	size: 300x300
	pane: reduce [f]
	actors:	object [
		on-wheel: function [face event] [
			print "win-wheel"	; never happens
		]
		on-down: function [face event] [
			print "win-down"
		]
	]
]

view win
```

greggirwin

[17:08](#msg58a48b191465c46a566bf420)Running interpreted here, I see the "win-wheel" events, but not any "face-wheel" events.

endo64

[20:57](#msg58a4c0acde50490822d20bf4)@greggirwin Interesting, I just run above test script on Win10 x64 before and after updating red to latest commit, both works normal.  
On my Win8.1 x64 at work, doesn't work neither of on-wheel events.

[20:57](#msg58a4c0cdaa800ee52c9e440d)Can some one test please the above script with the latest red source?

greggirwin

[21:27](#msg58a4c7a4aa800ee52c9e77eb)I'm on Win7 with the latest source.

[21:28](#msg58a4c7f521d548df2c148a00)Mousing down produces win-down for the window, and both face-down and win-down on the face.

## Thursday 16th February, 2017

endo64

[09:03](#msg58a56aef00c00c3d4f46f719)I just encapped and tested again on Win8.1, only down events triggered, no wheel events.

meijeru

[22:36](#msg58a6298700c00c3d4f4bac6a)@dockimbel I am puzzled: I have set the `image` facet of a `base` face to `make image! 100x100` say. Now I set, in a loop, the individual pixels one by one to some color value. Strangely, I only see the result after the loop is finished. Shouldn't the changes to the image appear immediately?

## Friday 17th February, 2017

qtxie

[01:02](#msg58a64b9d9eb1bd81481d1b05)@meijeru You may need to add `do-events/no-wait` in your loop, so the view engine can processs some messages.

[04:04](#msg58a676601465c46a5676fc09)@endo64 It works fine on Win7. I'll test it on Win10 later.

[04:10](#msg58a677b700c00c3d4f4d311b)Ah, I cannot get `face-wheel` now after I disable the \[WizMouse](http://antibody-software.com/web/software/software/wizmouse-makes-your-mouse-wheel-work-on-the-window-under-the-mouse/) in my system.

meijeru

[13:11](#msg58a6f6680ad50ac3152aba30)@qtxie Thanks for reminding me. It works!

endo64

[20:11](#msg58a7590a00c00c3d4f523b50)@qtxie I also have a similar application installed on my Win8.1 (wheel event runs) but not on Win10 (wheel event doesn't work)

## Thursday 23th February, 2017

meijeru

[14:30](#msg58aef1f9e961e53c7f589d43)Question: how can I remove a sub-face from a window? In particular: how can I remove a sub-panel from a tab-panel face? Is removing the face object out of the pane enough?

rebolek

[14:44](#msg58aef541de504908220625ab)yes, that should be enough

## Tuesday 7th March, 2017

sergeantWilson

[15:02](#msg58becb9600c00c3d4fd1252f)Just getting started. Stuck on something and hoping someone can help.

So, if I have 2 area widgets with enough text so that scrollbars are showing in both,  
is it possible to use the scrollbar on one area and have the other follow automatically and vice versa ?  
I mean as I scroll one area, the other area also scrolls at the same rate.  
Is there an example ?  
thanks.

DideC

[16:18](#msg58bedd5c21d548df2ca31482)@sergeantWilson You have to use Win API calls to do that. I have done it with others languages. You have to send scroll events received by one scrolbar to the other one.  
But, actually, there is no way that I know of to receive scroll events (@qtxie ?) and `scroll` is not in the list of events available in View.  
So, there is not built in functionnality available to do that at this moment.  
You must go to the R/S View level and add it.

[16:22](#msg58bede331465c46a56fbb453)As a reminder, here is the code I use (Its WINDEV code, but still understandable I think):

```
// Code executed at the receive of a WM_SCROLL event of one scrollbar of table control named TAB_DATA1 :
IF _EVE.lParam > 0 ALORS
	// Send the event to the other table control:
	PostMessage(Handle(TAB_DATA2), WM_VSCROLL, _EVE.wParam, 0)
END
```

greggirwin

[17:54](#msg58bef3ce872fc8ce62cc1cca)@sergeantWilson, you could open a wish ticket for `scroll` event support. It may require some thinking in how best to wrap it. e.g. Windows' wParam vs other platform options. If we had scroll support, it's possible that it could be used reactively in your case.

## Wednesday 8th March, 2017

sergeantWilson

[23:50](#msg58c098d5872fc8ce62d613d6)Thanks for the answers. As I said I am just getting started. How would I make an API call with Red ? Any examples would be great. Thanks again.

## Thursday 9th March, 2017

greggirwin

[00:04](#msg58c09bfcdd08b4b859a3e597)Visit the https://gitter.im/red/red/system room. FFI will come to Red soon. In the meantime, you need to write those calls in Red/System and use them from Red.

## Thursday 16th March, 2017

pekr

[07:29](#msg58ca3ee8ac314c8a1a5462c5)Someone is working on FFI support?

PeterWAWood

[08:00](#msg58ca46026d7eb18404d1dff6)@pekr If you check the 0.6.3 card of Red Tasks Overview on Trello you'll see this:

```
library! datatype
```

[08:00](#msg58ca46320b2625d06484b483)It's probably what you were asking about?

pekr

[08:27](#msg58ca4c5ffe6a638b1aceb7ad)Missed that one, wonder about what `load/library`will do, if it is going to be a separate thing to wrapping a library in R/S, or just the means to postpone loading of such a wrapper? Anyway - wrong channel ...

## Sunday 19th March, 2017

geekyi

[11:38](#msg58ce6dccfe6a638b1adfc3df)What's the

## Monday 20th March, 2017

Oldes

[12:55](#msg58cfd12f6701410e58584d95)@dockimbel as you are working on draw documentation, is this correct?

```
hline <point>   (absolute)
'hline <point>   (relative)

<point> : coordinates of the ending point (pair!).
```

When it should be \_horizontal line from \*\*current pen positon\*\*\_, why is it `point`?

Zamlox

[13:05](#msg58cfd3972215a08f04a6564c)@dockimbel @Oldes implementation for

```
hline
```

and

```
vline
```

is done for

```
integer!
```

or

```
float!
```

.

dockimbel

[14:31](#msg58cfe7ab6d7eb18404e8dba9)@Oldes Thanks! It's a mistake, I'm fixing it. Done.

[14:31](#msg58cfe7d35917e26076b53277)@Zamlox What are those \[extra arguments](https://github.com/red/red/blob/master/modules/view/draw.red#L598) for in `hline` and `vline`?

Zamlox

[15:19](#msg58cff2fb2215a08f04a6f945)@dockimbel it can have any number of arguments (

```
integer!
```

or

```
float!
```

)

[15:32](#msg58cff60f8fa1633954fa1b76)like in R2

[15:34](#msg58cff67a6d7eb18404e92af2)Red:

```
view [base 300x300 draw [shape [move 0x0 line 100x100 hline 50 0]]]
```

R2:

```
view layout [box 300x300 effect [draw [ pen black shape [move 0x0 line 100x100  hline 50 0]]]]
```

dockimbel

[15:47](#msg58cff978a84f611959c51d7e)@Zamlox How is that different from `hline 0`?

Zamlox

[15:47](#msg58cff98f5917e26076b58acf)it's not. it's same.

[15:47](#msg58cff9aaa84f611959c51e53)for compatibility with R2 I have implemented in same way.

dockimbel

[15:49](#msg58cffa18590d72c864e9261e)Ok, I see. It looks like a R2 bug to me, unless there is a need in SVG for such feature?

Zamlox

[15:52](#msg58cffacd8fa1633954fa33f1)SVG doesn't have such element, so it is not needed. Then perhaps, can be changed to accept only one argument.

dockimbel

[16:00](#msg58cffc86a84f611959c52bfd)@Zamlox If it's not needed anywhere else, I think it would be better, as I can't make sense of it. I'll let you do it.

Zamlox

[16:00](#msg58cffca258ad4eb02833fde8)ok, I'll do it.

dockimbel

[16:01](#msg58cffcde590d72c864e93457)@Zamlox For the complex pen, does your PR add features which are not in the \[spec](https://github.com/qtxie/red/wiki/Create-Complex-Pen-in-Draw)? (Qingtian mentioned to me some extra features in the PR) If so, could you briefly list them, with a short explanation?

Zamlox

[16:02](#msg58cffd326701410e585925be)it might be, yes. May I update directly the spec ?

dockimbel

[16:03](#msg58cffd3aa84f611959c5301e)That is fine too.

Zamlox

[16:03](#msg58cffd4e590d72c864e936a5)ok, I will do it.

dockimbel

[16:04](#msg58cffd718fa1633954fa3fd7)Thanks!

## Tuesday 21st March, 2017

Zamlox

[06:15](#msg58d0c4ea8fa1633954fd7202)@dockimbel I have created PR for fixes. I have also updated complex-pen spec https://github.com/qtxie/red/wiki/Create-Complex-Pen-in-Draw

dockimbel

[06:39](#msg58d0caaca84f611959c88458)Thank you very much!

maximvl

[19:42](#msg58d1823ab809ca5f4a6a913d)http://i.imgur.com/FGaY0hf.pnghttp://i.imgur.com/FGaY0hf.png

[19:42](#msg58d18242b809ca5f4a6a9149)is this a bug?

[19:45](#msg58d182d16701410e585fca11)

```
>> system/build/date
== "21-Mar-2017/20:14+1:00"
```

greggirwin

[20:17](#msg58d18a43f7f7d481043f7788)Not a bug. `l` is a block, and becomes the default actor for the list. Try `view [text-list [print face/selected] data l]`

maximvl

[20:46](#msg58d1913f2215a08f04ae2967)@greggirwin it works! so, having parameters in docs, how do I transform them into code?

[20:47](#msg58d19161590d72c864f02f34)should I use `keyword arg` like `data l` ?

[20:48](#msg58d19191a84f611959cc52ac)

```
>> view [text-list [print face/selected] data l selected 3]
*** Script Error: VID - invalid syntax at: [selected 3]
*** Where: do
```

[20:48](#msg58d1919c6701410e58600e89)I don't get it

[20:49](#msg58d191bca84f611959cc53a8)does position matter?

[20:49](#msg58d191caf7f7d481043f9a77)if so, how can I find the order?

greggirwin

[20:54](#msg58d19302590d72c864f036c2)`selected` needs the face to exist, which might be a possible wish for the future, to allow what you want. For now you can do this:

```
l: ["A" "B" "C"]
view [text-list [print face/selected] data l on-create [face/selected: 3]]
```

maximvl

[21:00](#msg58d19468f7f7d481043fa80e)@greggirwin thanks!

[21:01](#msg58d194976d7eb18404f07c41)&gt;selected needs the face to exist

this is not explained in the docs, this is why i'm confised

greggirwin

[21:06](#msg58d195c42215a08f04ae4109)Yup. Good to note somewhere.

## Wednesday 22nd March, 2017

dockimbel

[04:15](#msg58d1fa7c5917e26076be4fc3)@greggirwin @maximvl `selected` is a facet (a property of the `face!` object), while the VID keyword you want is `select`:

```
list: ["A" "B" "C"]
view [text-list [print face/selected] data list select 3]
```

greggirwin

[05:03](#msg58d205aa2215a08f04afd976)Thanks @dockimbel! I should revisit docs rather than my old code.

## Sunday 26th March, 2017

maximvl

[13:34](#msg58d7c349b402a53211b3a0e2)is this a known bug?  
http://i.imgur.com/0QuUr48.png

[15:15](#msg58d7db200e4137042ab0fb26)http://i.imgur.com/sP03rLM.png

[15:16](#msg58d7db3d8bb56c2d1144cd9b)going to test on 6.2 and make a pull request

greggirwin

[16:20](#msg58d7ea4ef22385553dda7aac)Only face width is automatically set, but having it set the height is a nice wish.

[16:20](#msg58d7ea590e4137042ab1367c)Cool looking tool.

maximvl

[18:02](#msg58d802375982df9373ade813)@greggirwin what can I do if I want to change only height of the component, and keep the default width? as I see size can only be passed as a `pair!`

greggirwin

[18:06](#msg58d803258e4b63533d66693c)Under R2 we could trick it by using -1x&lt;n&gt; IIRC, but that doesn't work in Red right now. In the meantime, you could use `size-text`to calc things...maybe. I haven't tried. But submit it as a wish for the `text` style to auto-calc the height.

[18:06](#msg58d8033e08c00c092a19c506)I generally just spec a width though. It's easier.

## Monday 27th March, 2017

dockimbel

[05:54](#msg58d8a90d408f90be665cc09a)@maximvl You can change the face's properties at last minute using `on-create` (though, it's post-VID, so calculations for container's size are done):

```
view [text "^/Test^/" on-create [face/size/y: 100]]
```

[05:59](#msg58d8aa318e4b63533d68e6fb)@maximvl Nice tool! I don't want to spoil about some new features, but we are planning a plugin interface for the new console in 0.6.3, where users could (very simply) extend the console with plugins scripts or apps. We'll probably set up a repo for that, or just have a folder on red/code (not sure yet), where users could add new plugins. You helper app is \*exactly* the kind of console plugin I would like to have. ;-) Moreover, the new rich-text abilities in 0.6.3 would greatly enhance such app.

[07:07](#msg58d8ba328e4b63533d692adc)@maximvl I am willing to accept your PR for now, as it is a nice helper app, but we will need later to move that code out of the console engine, and convert it to the upcoming plugin app.

maximvl

[07:13](#msg58d8bb8c08c00c092a1c771e)@dockimbel plugin system seems good, I also was thinking wherever this code should belong to the main repo or not, I'll take care of moving it to a plugin system once it's released :)

[17:56](#msg58d9526008c00c092a1f5634)how do I use generated face in the `view`?

```
>> f: make face! [type 'text text: "hello"]
== make object! [
    type: 'face
    offset: none
    size: none
    text: "hello"
...
>> view compose/deep [pane [(reduce f)]]
*** Script Error: VID - invalid syntax at: [pane [make object! [type: 'face offset: none size: none text: "hello" image: none color: none menu: none data: none enable?: true visible?: true selected: none flags: none options: none parent: none pane: none state: none rate: none edge: none para: none font: none actors: none extra: none draw: none ]]]
*** Where: do
>> view compose/deep [pane [(f)]]
*** Script Error: VID - invalid syntax at: [pane [make object! [type: 'face offset: none size: none text: "hello" image: none color: none menu: none data: none enable?: true visible?: true selected: none flags: none options: none parent: none pane: none state: none rate: none edge: none para: none font: none actors: none extra: none draw: none ]]]
*** Where: do
>> view compose/deep [(f)]
*** Script Error: VID - invalid syntax at: [make object! [type: 'face offset: none size: none text: "hello" image: none color: none menu: none data: none enable?: true visible?: true selected: none flags: none options: none parent: none pane: none state: none rate: none edge: none para: none font: none actors: none extra: none draw: none ]]
*** Where: do
>> view compose/deep [f]
*** Script Error: VID - invalid syntax at: [f]
*** Where: do
>>
```

geekyi

[18:17](#msg58d957458e4b63533d6c2413)@maximvl use layout instead

[18:18](#msg58d95784b402a53211ba5959)Modify the layout object as you please and finally pass it onto view

maximvl

[18:20](#msg58d957fb08c00c092a1f7371)@geekyi I'm trying to add some features to the console and it already uses `window` with pane

[18:21](#msg58d95825b402a53211ba5d11)but if I pass anything except `console` to `pane: reduce [console]` resulting binary doesn't even start =\\

geekyi

[18:24](#msg58d958e97ea420cc420ee62a)@maximvl there's gotta be a layout object somewhere.. I think you can modify the pane? Use help on it

[18:25](#msg58d959298fcce56b20a3008c)Sorry.. On mobile right now.. I really should try and see if red works on my mobile..

[18:31](#msg58d95a788bb56c2d114b30e4)@maximvl I can understand.. Because I'd been there too.. You're trying to compose.. Which doesn't work because view is a dialect.. The way to go here is to get a basic layout object and then add to or remove from it

## Tuesday 28th March, 2017

maximvl

[07:10](#msg58da0c4b8fcce56b20a5b701)@dockimbel if I add code like `txt: make face! [type: 'text text: "hello"]` and then use it here https://github.com/red/red/blob/master/environment/console/gui-console.red#L259  
as `pane: reduce [txt]`  
binary will be compiled, but fails to run

[07:10](#msg58da0c5408c00c092a222d31)and I don't understand why

dockimbel

[07:11](#msg58da0caff22385553de367af)@maximvl Have a look at how to build the face tree manually without VID: https://github.com/red/red/blob/master/tests/view-test.red

maximvl

[07:12](#msg58da0cc2408f90be6662cc61)Yes, I checked that

[07:12](#msg58da0cf9b402a53211bd1d60)I don't understand why `console` works for pane and my `txt` doesn't

dockimbel

[07:13](#msg58da0cfc408f90be6662ce64)`view` means you are passing a block of VID code. `view` is what you want (should be a `type: 'window` face, with a `pane` referring to a block of child faces).

[07:14](#msg58da0d3e0e4137042aba4411)@maximvl That `pane` in gui-console code is inside a `face!` object context, not in a block of VID code.

maximvl

[07:14](#msg58da0d3eb52518ed4db4ed49)this is exactly what is in the `gui-console` :)

[07:14](#msg58da0d6708c00c092a223160)okey, it's inside `face!`, but I'm creating my `txt` also as `make face!`

dockimbel

[07:14](#msg58da0d688e4b63533d6ef807)I see `win: make face! [...` there, not `win: [...`.

maximvl

[07:16](#msg58da0db08bb56c2d114deb58)I mean, I'm trying to replace `console` with my own face, the only difference is that it has different `type`

dockimbel

[07:16](#msg58da0db3f22385553de36df7)You have a typo in `f: make face! [type 'text text: "hello"]` , should be `type:`.

maximvl

[07:16](#msg58da0dd84cb8d0917333c9ae)mm, let me check the code, probably just misstyped here

[07:17](#msg58da0e26b52518ed4db4f04b)I have this in the code:

```
win-text: make face! [
     type: 'text text: "hi" offset: 100x100 size: 100x100
  ]
; inside win
	pane: reduce [win-text]
```

dockimbel

[07:20](#msg58da0ecc08c00c092a22384e)This works fine:

```
f: make face! [type: 'text text: "hello" offset: 10x10 size: 80x20]
view make face! [type: 'window offset: 40x40 size: 200x200 pane: reduce [f]]
```

[07:22](#msg58da0f3ead849bcf422771c7)Remember that you can use `layout` instead of `view` to conveniently build the face tree for you and then get a window face! as returned value.

maximvl

[07:28](#msg58da109908c00c092a22414c)@dockimbel this one works, but my changes in `gui-console` don't =\\

[07:30](#msg58da110d08c00c092a2243e7)

```
@@ -228,6 +228,11 @@ gui-console-ctx: context [
 		]
 	]
 
+  win-text: make face! [
+     type: 'text text: "hi" offset: 100x100 size: 100x100
+  ]
+
+
 	win: make face! [
 		type: 'window offset: 640x400 size: 640x400 visible?: no
 		text: "Red Console"
@@ -262,7 +267,7 @@ gui-console-ctx: context [
 				unless system/view/auto-sync? [show face]
 			]
 		]
-		pane: reduce [console]
+		pane: reduce [win-text]
 	]
 	
 	launch: does [
```

[07:30](#msg58da1113b402a53211bd2fd5)this is the diff I have

[07:36](#msg58da127408c00c092a2248c0)can anybody try and confirm this?

dockimbel

[07:46](#msg58da14d28e4b63533d6f1bc0)I don't see anything wrong in your diff. @rebolek could have a look at it, as he knows that code part fairly well.

rebolek

[08:29](#msg58da1ee74cb8d09173341448)@dockimbel @maximvl Of course, I will take a look and let you know.

maximvl

[08:53](#msg58da247a7ea420cc421215fd)@rebolek thanks!

rebolek

[08:53](#msg58da24930e4137042abab2d9)I'll just finish one small thing here and will take a look at it.

maximvl

[08:55](#msg58da2504ad849bcf4227d9dc)because it stops me from adding some awesome features to the console :D

rebolek

[08:57](#msg58da2581f22385553de3d830)I've added editor to console, so it is definitely possible :) Just give me 20-30 minutes to finish one thing :)

maximvl

[08:58](#msg58da25a18e4b63533d6f63c7)sure, nice, editor was on my list as well :)

[11:53](#msg58da4ec1b402a53211be48b9)@rebolek any progress?

rebolek

[12:18](#msg58da54a108c00c092a237016)@maximvl No, sorry, I have troubles compiling red-console, something is wrong here.

maximvl

[12:19](#msg58da54bc7ea420cc4212f0bf)@rebolek oh, with my changes or without?

rebolek

[12:20](#msg58da54fcb402a53211be66f3)@maximvl it doesn't matter, both with them and without them:

```
Compiling e:\Code\red\environment\red-console\red-console.red ...
*** Red Compiler Internal Error: Script Error : clear expected series argument of type: series port bitset none
*** Where: comp-path
*** Near:  [insert clear last output compose]
```

maximvl

[12:21](#msg58da55414cb8d091733506a2)@rebolek that's strange, I was able to compile console with 62 without any issues many times

rebolek

[12:21](#msg58da55538bb56c2d114f2cc9)No, it's my fault, I am compiling wrong file... :)

maximvl

[12:21](#msg58da555c4cb8d09173350765):D

rebolek

[12:21](#msg58da555c08c00c092a237492)Sorry, I will try again.

maximvl

[12:21](#msg58da55668e4b63533d703be1)you need gui-console.red, right?)

[12:22](#msg58da55868e4b63533d703c8b)or is this the new version Doc mentioned?

rebolek

[12:23](#msg58da55af0e4137042abb9fd7)Right, gui-console. I always confuse it, when I do not compile it for few days.

maximvl

[12:23](#msg58da55bfad849bcf4228b807)we need makefiles

[12:24](#msg58da55ea408f90be666424a2)btw having makefiles in Red would be neat

rebolek

[12:26](#msg58da5678b402a53211be6e73)@maximvl so, you are changing the `gui-console` and not the `red-console`, right?

pekr

[12:29](#msg58da57398e4b63533d70439f)I compile it the following way:

\- launch R2  
\- change-dir to the root of my Red folder  
\- do %red.r  
\- rc "-t Windows %environment/concolse/gui-console.red"

rebolek

[12:31](#msg58da57a8408f90be66642c38)I do basically the same, just with `do/args %red.r ...` instead of `rc`. But it's the console name that I got confused :) `red-console` cannot be compiled now and must be run manually from `gui-console`.

maximvl

[12:33](#msg58da580d408f90be66642d80)wat

[12:33](#msg58da58157ea420cc421302cc)I compile with `red -t Windows red-console.red`

[12:34](#msg58da583d8e4b63533d704a99)what is the `red-console`, let me check sources

[12:34](#msg58da5858b52518ed4db63fb8)I don't see any `red-console` here: https://github.com/red/red/tree/master/environment/console

rebolek

[12:35](#msg58da5882ad849bcf4228c4f0)@maximvl no, you won't find it there, you need this branch: https://github.com/qtxie/red/tree/red-console

[12:35](#msg58da589a408f90be66642fc1)It is new console with color support.

pekr

[12:38](#msg58da5942b52518ed4db64721)not updated since a month. Well, most probably it uses new rich-text, right?

rebolek

[12:42](#msg58da5a1e7ea420cc42130e0d)Yes.

maximvl

[12:43](#msg58da5a87f22385553de4d854)@rebolek could you still try my change with the old one? because even Doc said it should work

[12:44](#msg58da5a9c7ea420cc4213107c)maybe there is a bug or something

[12:44](#msg58da5ab1f22385553de4d920)and I don't know how to inspect compiled binary

rebolek

[12:45](#msg58da5ae5f22385553de4da3f)Of course, I take a look at it, I just thought you are using the newer console. Not sure why :-)

maximvl

[12:48](#msg58da5bb0b52518ed4db652f1)I thought the newest things are in `master` :D

rebolek

[12:49](#msg58da5bbfb402a53211be881d)@maximvl the crash is caused by removing `console` from the pane. If you change it to something like `pane: reduce [console win-text]`, it will work.

maximvl

[12:49](#msg58da5bd1ad849bcf4228d7e4)@rebolek what? why is this causing the crash?

[12:50](#msg58da5c01408f90be66643fb6)I mean, you can create windows without `console` face, what is the difference?

rebolek

[12:50](#msg58da5c0d4cb8d091733527b7)I am not sure, that would take more time, but my guess is that something else in the console code depends on it.

maximvl

[12:50](#msg58da5c188bb56c2d114f4f45)interesting

[12:50](#msg58da5c2708c00c092a2399c4)@rebolek this `console` face, is it a native widget or Red code?

rebolek

[12:50](#msg58da5c31ad849bcf4228d9b0)Native widget.

maximvl

[12:51](#msg58da5c3a8e4b63533d70607b)I see

rebolek

[12:51](#msg58da5c3cb402a53211be8b82)The new console is written in Red.

maximvl

[12:56](#msg58da5d73ad849bcf4228df2e)ok, basically I wanted to add tabs with `tab-panel` but it started crashing the console

[12:56](#msg58da5d917ea420cc42132363)I'll check new console code

rebolek

[13:24](#msg58da6406ad849bcf4228fe94)@maximvl

maximvl

[13:24](#msg58da64180e4137042abbe8b5)@rebolek mm?

rebolek

[13:25](#msg58da64338fcce56b20a74f2c)IIRC, it's not possible to use multiple consoles

maximvl

[13:25](#msg58da643aad849bcf4228ffa4)wat

rebolek

[13:25](#msg58da6447ad849bcf4228ffdf)(sorry, I am on phone)

maximvl

[13:25](#msg58da64588fcce56b20a74f9c)no worries, but why is this impossible?

[13:26](#msg58da64854cb8d0917335554f)btw, I also noticed that console input doesn't work while I'm running `view` windows

rebolek

[13:26](#msg58da649bb402a53211beb9c8)Not in one window, probably some hardcoded stuff. @qtxie should know more.

maximvl

[13:28](#msg58da64ecb52518ed4db6855d)since we don't have ways to run code in parallel for now I understand why running the code blocks everything

[13:28](#msg58da650a408f90be6664703c)but this shouldn't be a problem for having several input sources

qtxie

[14:18](#msg58da70af408f90be6664aefa)Yes. We cannot have multiple consoles in one process as we use a global `system/console` object.

maximvl

[14:36](#msg58da74dab52518ed4db6e0b6)using global objects doesn't scale

[14:36](#msg58da74f68bb56c2d114fdc4d)are you sure this is the best approach we can take?

qtxie

[15:27](#msg58da80d4b52518ed4db71d95)@maximvl Rethinking about it, I think it's fine to just have one `system/console` object per red session. In order to make multiple consoles working properly, we need to start a red session for each console. So either using multi-thead or multi-process, which we cannot do in Red for now.

maximvl

[15:28](#msg58da811d8bb56c2d1150230e)@qtxie okey, makes sense

## Wednesday 29th March, 2017

dockimbel

[08:15](#msg58db6d17ad849bcf422d8700)@maximvl `using global objects doesn't scale` It is not the issue, `system/console` could refer to a block of consoles. We could multiplex execution of several Red sessions in a single thread, but the result would not be satisfying. Better wait for parallel processing support.

## Friday 31st March, 2017

bilbo872

[01:20](#msg58ddaec4408f90be6672b10b)amd64/debian 8.1 jessie

[01:23](#msg58ddaf854cb8d09173436aa9)trying to set up red - console works, console version of hello world works, gui version fails with Script Error: view has no value . I've tried several of the simple gui scripts - same problem. I've read my typing closely and pretty sure its accurate. Help appreciated. Isn't the view module included in the download?

[01:37](#msg58ddb2c40e4137042aca831b)I should add that the compile works fine - the

[01:37](#msg58ddb2d9f22385553df3681d)error msg is from running the exe.

PeterWAWood

[01:40](#msg58ddb3730e4137042aca84f5)@bilbo872 View is not yet available for Linux.

bilbo872

[01:55](#msg58ddb715ad849bcf42377e9f)Thx. any guess as to when it will be? Also, I note that needs: 'view compiled ok but needs: 'viewxxx got an error - viewxxx module not found - which may mean it found the view module.

PeterWAWood

[02:38](#msg58ddc1427ea420cc4221f167)@bilbo872 Unfortunately, the person who was contributing to making View available under GTK+3 hasn't been around for a while.

[02:42](#msg58ddc2298bb56c2d115dffb1)I expect that it will be available at some stage in the lead up to Red 1.0 but I'm not certain of the current schedule.

maximvl

[06:35](#msg58ddf8a7f22385553df45463)@bilbo872 what I do - compile for windows with `red -t Windows file.red` and run under wine

## Monday 3th April, 2017

Kerneels

[07:53](#msg58e1ff7d8bb56c2d116d24f1)Hi! Just got latest red, but quickly would like to check something with you guys: if I do: "view layout \[button "x" \[print "you chose X"] button "y" \[print "you chose Y"]]

[07:55](#msg58e1fff9f22385553d02e805)I get a dialog, with two bottons, but my a11y tech (JAWS) does nothing when I try to tab between the two buttons, and when I do manage to activate one of them, the printout (if anything) in the console is also not there. Firstly, should I be able to tab between the two buttons, and secondly, this using native Windows UI elements, why is it not accessible straight away?

greggirwin

[07:57](#msg58e200797ea420cc423136d7)Tab handling to set focus isn't in place yet. You could check issues and submit a wish if one isn't already there.

Kerneels

[07:58](#msg58e2008f08c00c092a41eda9)I have high hopes for the Red UI at least on Windows to be fully accessible, since it uses the native UI controls, but it might be that some properties would have to be set.

greggirwin

[07:58](#msg58e20093ad849bcf424706e7)I do see the output here when I click the buttons.

[07:59](#msg58e200e38e4b63533d8e759c)Works for both GUI and CLI consoles here.

rebolek

[08:00](#msg58e20136b52518ed4dd3fd57)@Kerneels hi! FYI, you can use backtick (\`) to format text as code, it improves visibility. As @greggirwin said (and he was faster than me this time), Tab-support is not there yet and I also can see the output in the console.

greggirwin

[08:01](#msg58e2017568bee3091f0509ec)I've been sitting here for days, waiting to pounce Bolek. ;^)

rebolek

[08:03](#msg58e201d30e4137042ada146b)I am find with it as it makes Red having the fastest support available ;)

## Tuesday 4th April, 2017

dockimbel

[05:35](#msg58e330b97ea420cc42367284)@Kerneels Hi! Tabbing support between controls is done in an awkward way in the win32 API, and it is \[not trivial](http://stackoverflow.com/questions/18035999/switch-between-edit-controls-using-tab) to integrate into our GUI event loop (as we don't use Dialog windows). As it requires a bit of time, it didn't make it in 0.6.2, though, I hope we can get it done in 0.6.3.

## Wednesday 5th April, 2017

rcqls

[14:44](#msg58e502d968bee3091f12035d)@qtxie Just in case you miss that: `react-test5.red` fails on macGUI branch...

dockimbel

[15:19](#msg58e50af4b52518ed4de11e2e)@qtxie ^---

Rebol2Red

[21:46](#msg58e565cd408f90be66911a37)A start of a picture slideshow.  
Do you know of a better 'Reddish' way?  
I find this too much 'Basic' like  
Note: Copy and paste code into console.

```
pictures: copy []
append pictures c: make image! 120x120 draw c [box 10x10 110x110]
append pictures c: make image! 120x120 draw c [circle 60x60 50] ; line 120x0 0x120]
append pictures c: make image! 120x120 draw c [line 0x0 120x120 120x0 0x120]
x: 1	i: 1	picture: pictures/:x
next-picture: [
	i: i + 1	
	x: ((mod (i - 1) 3) + 1)  im/image: pictures/:x 
	t/text: rejoin["Picture: " x]
]
view [
		at 10x5
		t: text 120x35 font-size 20 "" return
		at 10x45
		im: image picture rate 2 on-time [
			do next-picture
		]
                ; one time initialisation
		do [t/text: rejoin["Picture: " i]] 
]
```

greggirwin

[22:03](#msg58e569bdf22385553d11e3eb)

```
pic: function [cmd][c: make image! 120x120 draw c cmd  c]

pics: reduce [
    pic [box 10x10 110x110]
    pic [circle 60x60 50] ; line 120x0 0x120]
    pic [line 0x0 120x120 120x0 0x120]
]

view compose [
    across
    style text: text 100x35 font-size 20
    text "Picture:" t: text 20 "1" return
    im: image (pics/1) rate 0:0:1 on-time [
        pics: next pics
        if tail? pics [pics: head pics]
        face/image: first pics
        t/text: form index? pics
    ]
]
```

Rebol2Red

[22:05](#msg58e56a21b52518ed4de2f4a4)@greggirwin Thanks! That's more like it.

greggirwin

[22:06](#msg58e56a4cf22385553d11e5a1)Ideas to play with anyway.

Rebol2Red

[22:08](#msg58e56acf4cb8d09173618f6c)@greggirwin Maybe you can tell me also how i could compile a source which only displays a text for instance the date and time.  
This is my regular compile: red-exe.exe -c -t windows %f

greggirwin

[22:10](#msg58e56b5a0e4137042ae91f27)We don't have a `date!` type yet. This will show the current time in a text face: `view compose [text "time:" text (form now/time/precise)]`

[22:10](#msg58e56b7108c00c092a50fd5e)You could use `call` to get the system time.

Rebol2Red

[22:11](#msg58e56b8b8bb56c2d117c3285)@greggirwin Yes that's exactly what i do  
I use call but how to compile this so it displays it?

greggirwin

[22:13](#msg58e56c1708c00c092a51002f)Does it not show the window when compiled? What error do you get?

[22:14](#msg58e56c480e4137042ae92342)`\red.exe -c -t Windows "D:\Red\temp\view-time.red"`compiles and runs fine here.

geekyi

[22:14](#msg58e56c62ad849bcf4256300d)@Rebol2Red whenever it doesn't work, try with `-r` flag ;)

[22:16](#msg58e56ca868bee3091f141425)Are you trying to compile Gregg's code? Did you miss `needs: view`

greggirwin

[22:16](#msg58e56cce408f90be669136f6)I did add that in my compiled test, sorry not to mention it.

Rebol2Red

[22:20](#msg58e56da8f22385553d11f239)Well, i thought you can do without Red \[needs: 'view] because the only thing i want to display is the date string? Am i wrong?

greggirwin

[22:20](#msg58e56dcb8e4b63533d9db482)If you call `view` you need the GUI module (View) included. If you just want to compile for DOS and `print` it, you don't need that.

geekyi

[22:23](#msg58e56e7708c00c092a5109f9)@Rebol2Red actually, it works for me without `needs: view`, maybe I have to clear some cache (no) and use `-r` (yes)

Rebol2Red

[22:29](#msg58e56fdf4cb8d0917361a3e6)Thanks, it works now.

```
Red []
get-date: {} 	call/output "date/T" get-date 
parse get-date [
	copy dayname to " "
	thru " " copy day to "-"
	thru "-" copy month to "-"		
	thru "-" copy year to " "		
]
print [day month year]
```

compiled with: red.exe -r test.red  
and executed in a windows console  
Note:  
This is only the essential part of my source  
Works only in windows because of using the date function of windows

greggirwin

[22:36](#msg58e57189b52518ed4de312e6)Glad it works now.

## Friday 7th April, 2017

Rebol2Red

[12:36](#msg58e787c24cb8d091736a0386)Wheel event  
'The wheel event and on-wheel actor are now available for handling mouse wheel events.'

I need to process the wheel event when the wheel is scrolled over a text  
I get none or an error  
I have the latest red version

```
x: 10
view [
	at 8x0
	text 382x30 font-size 20 "Click or scroll wheel over this text"
	on-wheel [ 
	
		print ["Event/key:" event/key] ; <----------
		; output is none

		print ["Event/wheel:" event/wheel] ; <----------
		; ** script error: cannot access wheel in path event wheel

		;x: x + 1 ; when upscroll
		;x: x - 1 ; when downscroll
	]
	on-down [
		print ["x = " x] ; output value of x
	] return

]
```

qtxie

[12:39](#msg58e788790e4137042af17985)@Rebol2Red Here is the documents for wheel event: https://doc.red-lang.org/en/view.html#\_event\_datatype

[12:39](#msg58e7888df22385553d1a6223)You should use `event/picked`.

Rebol2Red

[12:39](#msg58e78898408f90be6699b023)Thanks, i am not good at events :)

qtxie

[12:41](#msg58e788f7f22385553d1a63a8)And here is an example using it: https://github.com/red/red/blob/master/tests/view-test.red#L764

rcqls

[14:37](#msg58e7a447ad849bcf425f4a20)@qtxie @dockimbel congrats for `red-latest` working again and above all for mac integration on master branch. Maybe it is only on my Mac but all react-test are fine except `react-test5.red` inside the red console and compiled (`red -r tests/react-test5.red`).

```
2017-04-07 16:34:29.924 react-test[30391:490928] NSFont instance 0x319c90 is over-released.

*** Runtime Error 1: access violation
*** at: 9EC0D514h
```

dockimbel

[14:46](#msg58e7a6314cb8d091736a94ed)@qtxie ^---

rcqls

[14:55](#msg58e7a86708c00c092a5a1b59)@qtxie @dockimbel Fresh install with a second computer confirms the pb on `react-test5`...

## Saturday 8th April, 2017

qtxie

[01:39](#msg58e83f5cf22385553d1d660c)@rcqls What's version of macOS are you using? It's working well on my 10.9 VM.

PeterWAWood

[03:09](#msg58e8544c0e4137042af4d213)@qtxie I also get an access violation with

```
react-test5
```

. The other react-tests run from a console that I compiled (with Needs: 'View]

```
peter$ ./test-console tests/react-test5.red
2017-04-08 11:06:17.808 test-console[23526:2623003] NSFont instance 0x2125190 is over-released.

*** Runtime Error 1: access violation
*** at: 9ED92514h
```

[03:09](#msg58e854698bb56c2d11880a95)I am using macOS 10.12.4

qtxie

[03:20](#msg58e856f2b52518ed4deeb4de)Thanks. I'll give it a try on macOS 10.12.

PeterWAWood

[03:58](#msg58e85fd97ea420cc424c56b6)@qtxie Just a small thing, Views "apps" don't respond to CMD+Q under macOS.

rcqls

[04:56](#msg58e86d8d8bb56c2d11884c4b)@qtxie The last one 10.12.4 like @PeterWAWood

[06:25](#msg58e8825008c00c092a5d6445)@qtxie To be complete: `red tests/react-test.red` works fine when `red -r tests/react-test.red;./react-test` fails with same previous error (both for `red tests/react-test5.red` and `red -r tests/react-test5.red;./react-test5`).

qtxie

[11:31](#msg58e8c9fd0e4137042af63d8b)@rcqls Thanks. I pushed a fix. :smile:

rcqls

[11:50](#msg58e8ce9b4cb8d091736ec770)@qtxie Everything is fine now :clap:

Scaremonger

[11:53](#msg58e8cf348bb56c2d11898e17)Hi everyone. I'm just learning and trying to produce some feature of apps I have written in other languages to work out what it can/can't do so that I have a baseline when choosing which language to use for a specific task. I've been playing around with view and it's very cool. Is there any way to make an application always on top. I don't need modal (exclusive on top), but it needs to stay above all other applications so it's visible.

[12:38](#msg58e8d9b668bee3091f2164f6)The other thing I can't get working is offset. I have tried

```
view [ title "test" offset 100x100 ]
```

and although it compiles, it doesn't do anything (under windows). I have also tried a bit of code I found about rebol and that seems to be ignored too:

```
view [
    title "Click to move window"
    button "Move to 100x100" do [
        win: window-face? face
        win/gob/offset: 100x100
        show-later win
    ]
]
```

Am I missing something?

dockimbel

[12:53](#msg58e8dd5ef22385553d1f47d0)Two ways to achieve it:

```
view/options [title "test"] [offset: 100x100]

win: layout [title "test"]
win/offset: 100x100
view win
```

greggirwin

[15:59](#msg58e908ef08c00c092a5f4343)@Scaremonger, we don't have an `on-top` facet yet. Under R2 I used Win APIs to do it. That meant jumping through a few hoops with other APIs to get the window handle.

[16:13](#msg58e90c3a408f90be669f5b02)I see that Doc posted an answer in another channel.

Scaremonger

[20:24](#msg58e946e57ea420cc424f87cc)Yeah, I saw the post on the other channel, wasn't sure where to ppost it!

[20:25](#msg58e9472a8fcce56b20e2ab5d)@dockimbel - Perfect :)

## Sunday 9th April, 2017

dockimbel

[02:02](#msg58e9964908c00c092a613370)@Scaremonger Glad it helps. We should have an FFI at Red level soon, so you won't have to use Red/System nor compile it.

[02:14](#msg58e9990068bee3091f240be9)@greggirwin What about integrating `on-top` as a possible window flag in View (it should be possible to keep a window on top on the other desktop platforms we support)? It is a rare use-case, but at least on Windows backend, it's just a line of code to add.

greggirwin

[17:22](#msg58ea6dc1ad849bcf42690a3a)I think it's worth adding. It is useful in small desktop helper apps (I have my own, old toolbar app from R2 days that does it), and in the modern world, notification windows for messaging systems and such may be hidden if not on top. It's also an FAQ. Adding that one line will save you hours in answering it again and again. ;^) Another one sure to come up often is file dropping on a window. It was a pain in R2, but doable in a console window. I don't know about portability for that, but users love it.

## Monday 10th April, 2017

dockimbel

[02:50](#msg58eaf311ad849bcf426ac7d7)@greggirwin. Okay, we will add it then. Files drag'n drop support: that one is definitely desirable.

maximvl

[19:15](#msg58ebd9bd8bb56c2d1194b670)I want to make a simple game with DRAW, but how do I make a loop while GUI takes all events? can I get access to it's event loop and run my code there? Or can I have somehow separate loop running and updating GUI inside?

rebolek

[19:16](#msg58ebd9f2408f90be66a963d3)use event loop with on-* actors

maximvl

[19:16](#msg58ebda11f22385553d2a2a0f)didn't get it, which actors?

rebolek

[19:17](#msg58ebda56bdf4acc112479f56)`on-click` etc

[19:19](#msg58ebdaa4ad849bcf426eb0d7)for animation, add `on-time` with some rate like 30

maximvl

[19:20](#msg58ebdae5ad849bcf426eb226)@rebolek turns out `on-time` is a rate per second, but I was trying to use it with values like `0.3` :D

[19:20](#msg58ebdaf0f22385553d2a2dcf)@rebolek thanks!

rebolek

[19:21](#msg58ebdb2608c00c092a6993bc)@maximvl `view [s: text "1234" rate 30 on-time [s/text: form random 9999 show s]]`

maximvl

[19:22](#msg58ebdb76b52518ed4dfb44d0)nice

[19:32](#msg58ebddc4bdf4acc11247b2ae)@rebolek how do I capture keyboard events and how do I access the event object?

rebolek

[19:37](#msg58ebdf0f408f90be66a97977)@maximvl for keyboard access you would need global event handler

maximvl

[19:38](#msg58ebdf2da0e4856242ef4a82)global event handler? isn't there something like `on-key`?

[19:38](#msg58ebdf4d8fcce56b20ec03cb)

```
>> view [base 500x500 on-click [probe "test"]]
>> view [base 500x500 on-key [probe "test"]]
```

both don't work for me =\\

rebolek

[19:40](#msg58ebdfcb68bee3091f2c79a0)Try something like this:

```
red>> w: view/no-wait [b: base "1234" on-key [probe event/key]]
red>> w/selected: b
red>> do-events
```

[19:41](#msg58ebdff6408f90be66a97d61)Only focused face catches on-key events.

maximvl

[19:47](#msg58ebe14e4cb8d0917379e677)@rebolek hm, is there any way to switch selected face without "detaching" the window?

rebolek

[19:50](#msg58ebe1ff8fcce56b20ec1191)@maximvl Directly in VID? I am not sure if there is. But it is useful to prepare the window first and then be able to run some code before starting event loop.

maximvl

[20:12](#msg58ebe74b08c00c092a69c8a8)the `event` object seems to lack reflection:

```
>> view make face! [type: 'window size: 500x500 actors: object [on-key: func [face event] [probe event]]]
event
event
event
event
event
```

rebolek

[20:13](#msg58ebe75da0e4856242ef744a)Yes, currently.

[20:14](#msg58ebe7aa68bee3091f2c9db1)See here https://github.com/red/red/blob/master/runtime/datatypes/event.reds#L111

[20:14](#msg58ebe7b64cb8d091737a03fe)but not all fields are present in every event type

maximvl

[20:23](#msg58ebe9d068bee3091f2caa2b)ok, cool

[20:26](#msg58ebea9208c00c092a69da3e)@rebolek is there any way to ask a face to redraw?

rebolek

[20:28](#msg58ebeaf6ad849bcf426f0492)yes, `show face`

[20:29](#msg58ebeb1568bee3091f2cb019)In case, you have auto-sync turned off

maximvl

[20:34](#msg58ebec44408f90be66a9bd3f)@rebolek how do I code `on-time` inside the `make face!`, not the `view`?

[20:34](#msg58ebec54f22385553d2a7d8e)for specific `rate`?

[20:38](#msg58ebed498fcce56b20ec4b07)they are just separate fields, haha, so easy :D

rebolek

[20:38](#msg58ebed4968bee3091f2cba09)

```
red>> w: layout []
red>> append w/pane make face! [size: 100x100 color: red rate: 10 type: 'base actors: context [on-time: func [f e] [f/color: random white show f]]]
red>> view w
```

maximvl

[20:38](#msg58ebed5bb52518ed4dfb9ab9)yeah, thanks!

[22:31](#msg58ec07ba68bee3091f2d23a7)my first 2D GUI video game :D  
http://imgur.com/LoDTwmj.png

[22:31](#msg58ec07c8408f90be66aa31d0)https://gist.github.com/maximvl/6787d6fb3382bf72399eab87b2857d86

[22:32](#msg58ec07f44cb8d091737a8f4f)the collisions and win/lose conditions are not there yet, but it's already fun :DD

## Tuesday 11st April, 2017

greggirwin

[01:46](#msg58ec35848bb56c2d11962789)I ran into all kinds of stuff. :^) Can't wait for a `doink!` sound.

dockimbel

[02:15](#msg58ec3c2af22385553d2ba4b0)@maximvl Very cool! Alternatively, you can run your own event loop using `do-events/no-wait` (see some examples in red/code like \[particles.red](https://github.com/red/code/blob/master/Scripts/particles.red)). In such case, you need to use `view/no-wait` to create the windows without starting an implicit event loop, so you can roll out your own.

maximvl

[13:27](#msg58ecd9b2a0e4856242f3466b)@dockimbel what exactly happens when I use `view/no-wait` and `do-events/no-wait` ?

[13:28](#msg58ecd9f2b52518ed4dff3124)do we have something like an event queue and `do-events` pulls some and executes handlers?

[13:34](#msg58ecdb554cb8d091737daa5f)https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L1224

[13:34](#msg58ecdb58bdf4acc1124bae43)ok, I found it :D

Rebol2Red

[19:45](#msg58ed3272f22385553d3000b2)Are there any plans to making use of relative positions within draw commands. For ex. something like this:  
draw \[offset 100x100 triangle 0x10 10x10 20x0] ; will draw a triangle at 100x100 with given vertices  
Or maybe  
draw \[pos 100x100 triangle 0x10 10x10 20x0]  
Is it possible already?

DideC

[20:10](#msg58ed3818b52518ed4d0123dc)You can achieve that using transformation like `translate`.

Rebol2Red

[20:11](#msg58ed38768e4b63533dbc12dd)I will look into translate thanks.

DideC

[20:13](#msg58ed38ce8bb56c2d119ac726)`draw [translate 100x100 [triangle 0x10 10x10 20x0]]`

Rebol2Red

[20:14](#msg58ed390e4cb8d091737f9a2b)I could not find documentation. You can read my mind? I was just about to ask for an example.

[20:23](#msg58ed3b4f408f90be66af5fd6)What about events inside draw commands.  
I want to draw something, click on it which will fire a function.  
In other words how to make your own widgets or controls.

Scaremonger

[20:28](#msg58ed3c858fcce56b20f1ee6a)@maximvl - Take a look at Example8 on this link: http://www.mycode4fun.co.uk/About-Red-Programming

Rebol2Red

[20:48](#msg58ed4103bdf4acc1124dcd60)This is what i did to make a control. Click on the triangles to increase or decrease the number.  
Please comment on it!  
Note: I could not use translate with this code.

```
Arial: make font! [name: "Consolas" size: 20]
im1: make image! 80x40
im2: make image! 80x30
im3: make image! 80x40
d1: [
	pen 240.240.240 
	fill-pen 240.240.240 
	box 0x0 80x40 
	fill-pen red 
	triangle 0x40 40x0 80x40
]
d2: [fill-pen white pen black box 0x1 79x29 font Arial pen black text 0x0 "0" ]
d3: [
	pen 240.240.240 
	fill-pen 240.240.240 
	box 0x0 80x40
	fill-pen blue 
	triangle 0x0 40x40 80x0
]
view [
	size 800x600
	text font-size 20 "Spinner (0 to 5)" return
	space 0x0
	image im1 draw d1 [
		if (to integer! d2/14) < 5 [
			d2/14: to string! ((to integer! d2/14) + 1)
		]
	] return
	image im2 draw d2 return
	image im3 draw d3 [
		if (to integer! d2/14) > 0 [
			d2/14: to string! ((to integer! d2/14) - 1)
		]
	] return
]
```

DideC

[21:26](#msg58ed4a23a0e4856242f5a0fd)IMO, im1 to im3 are useless: use `base` instead of `image` and specify the size.

Rebol2Red

[21:32](#msg58ed4b80b52518ed4d017c19)Thanks, but i still keep wondering if this is the right way to do this kind of stuff. Maybe there is somewhere an example of a homebrew control?

[21:54](#msg58ed5084408f90be66afc0bb)An improvement to place the control at any place

```
Arial: make font! [name: "Consolas" size: 20]
d1: [
	pen 240.240.240 
	fill-pen 240.240.240 
	box 0x0 80x40 
	fill-pen red 
	triangle 0x40 40x0 80x40
]
d2: [fill-pen white pen black box 0x1 79x29 font Arial pen black text 0x0 "0" ]
d3: [
	pen 240.240.240 
	fill-pen 240.240.240 
	box 0x0 80x40
	fill-pen blue 
	triangle 0x0 40x40 80x0
]
view [
	base 800x600 transparent
	at 5x5 
	text font-size 20 "Spinner (0 to 5)" return
	at 340x235
	panel [
		space 0x0
		image 80x40 draw d1 [
			if (to integer! d2/14) < 5 [
				d2/14: to string! ((to integer! d2/14) + 1)
			]
		] return
		image 80x30 draw d2 return
		image 80x40 draw d3 [
			if (to integer! d2/14) > 0 [
				d2/14: to string! ((to integer! d2/14) - 1)
			]
		] return
	]
]
```

## Wednesday 12nd April, 2017

greggirwin

[03:10](#msg58ed9aaaad849bcf42764e66)@Rebol2Red, very cool start! I don't know of any examples. Early days, and the focus is on the native widget side. I did little grab handles in https://gist.github.com/greggirwin/4b3c9962dc682c12821f55583d702a8e, and we can easily tinker with things like Bret Victor shows in some of his talks, where you click and drag to change a value in a face.

[03:11](#msg58ed9ad0f22385553d319784)I played with it a tiny bit, and think we can make it work well with little effort.

[03:14](#msg58ed9b7b69a692963ea0842c)Many years ago, Chris Ross-Gill and I worked up a little Arrow style that was fun. Used `draw` commands and just a few tweaks of them to give you something like 5 different looks (std, chevron, penta, etc.).

[03:46](#msg58eda30f8bb56c2d119c4e0b)Is this by design?

```
>> parse "" [collect [keep to end]]
== [#"^@"]
```

dockimbel

[03:47](#msg58eda353bdf4acc1124f363c)@Rebol2Red It is possible to make custom controls, but there is no framework available yet to help with you with that (@rebolek has a few examples).

[03:48](#msg58eda3764cb8d091738125f2)@greggirwin Looks like a bug, as `keep` is grabbing something from the input when it should not. ;-)

greggirwin

[03:48](#msg58eda388a0e4856242f6db4e)OK, I'll ticket it.

rebolek

[04:56](#msg58edb3648fcce56b20f39ff5)@Rebol2Red Nice!

[05:28](#msg58edbb11ad849bcf4276b956)@Rebol2Red I've added auto inc/dec-rement when holding mouse button:

```
Arial: make font! [name: "Consolas" size: 20]
d1: [
    pen 240.240.240 
    fill-pen 240.240.240 
    box 0x0 80x40 
    fill-pen red 
    triangle 0x40 40x0 80x40
]
d2: [fill-pen white pen black box 0x1 79x29 font Arial pen black text 0x0 "0" ]
d3: [
    pen 240.240.240 
    fill-pen 240.240.240 
    box 0x0 80x40
    fill-pen blue 
    triangle 0x0 40x40 80x0
]
view [
    base 800x600 transparent
    at 5x5 
    text font-size 20 "Spinner (0 to 5)" return
    at 340x235
    panel [
        space 0x0
        image 80x40 draw d1 
            on-down [face/rate: 6]
            on-up [face/rate: none]
            on-time [
                    if (to integer! d2/14) < 5 [
                        d2/14: to string! ((to integer! d2/14) + 1)
                    ]
                ]
        return
        image 80x30 draw d2 return
        image 80x40 draw d3 
            on-down [face/rate: 6]
            on-up [face/rate: none]
            on-time [
            if (to integer! d2/14) > 0 [
                d2/14: to string! ((to integer! d2/14) - 1)
            ]
        ] 
        return
    ]
]
```

[06:16](#msg58edc648bdf4acc1124fa32b)I can't edit it anymore, so one more version with some improvements:

```
Red[]
Arial: make font! [name: "Consolas" size: 20]
d1: [
    pen 240.240.240 
    fill-pen 240.240.240 
    box 0x0 80x40 
    fill-pen red 
    triangle 0x40 40x0 80x40
]
d2: [fill-pen white pen black box 0x1 79x29 font Arial pen black text 0x0 "0" ]
d3: [
    pen 240.240.240 
    fill-pen 240.240.240 
    box 0x0 80x40
    fill-pen blue 
    triangle 0x0 40x40 80x0
]

action: function [dir] [
    switch dir [
        up [op: :+ comp: :< val: 5]
        down [op: :- comp: :> val: 0]
    ]
    if (i: to integer! d2/14) comp val [
        d2/14: form i op 1
    ]
]

view [
    base 800x600 transparent
    at 5x5 
    text font-size 20 "Spinner (0 to 5)" return
    at 340x235
    panel [
        space 0x0
        image 80x40 draw d1 
            on-down [face/rate: 6]
            on-up [face/rate: none action 'up]
            on-time [action 'up]
        return
        image 80x30 draw d2 return
        image 80x40 draw d3 
            on-down [face/rate: 6]
            on-up [face/rate: none action 'down]
            on-time [action 'down]
        return
    ]
]
```

endo64

[08:34](#msg58ede68cbdf4acc112502974)@rebolek Making custom widgets will be easier than R2 with `base`. Nice use of `on-time` btw :) I think it would be less costly using `base` instead of `image`

rebolek

[08:42](#msg58ede87f69a692963ea1a25c)@endo64 you're right, `base` works without problems. `stylize`would also help to remove some redundant code.

[08:56](#msg58edebb7ad849bcf4277859c)Now with `base` and also graphic indication for pressed button https://gist.github.com/rebolek/878dab89cb1b8e0c1fa6947811cfa500

[09:06](#msg58edee23f22385553d32d0e1)And now with keyboard handling also (only `0` - `5` allowed).

DideC

[10:38](#msg58ee03a68fcce56b20f4e523)@rebolek You still use `action` int the VID code but you renamed the function `do-anim`!

rebolek

[10:40](#msg58ee0419ad849bcf4277f8fd)@DideC Thanks! I run the code in same repl session, so `action` is still defined.

[10:45](#msg58ee0548408f90be66b25e2c)fixed

raton3062015

[15:09](#msg58ee434169a692963ea35ed9)View \[size 400x400 text "test" ] , how can I open a view with maximum size

dockimbel

[15:18](#msg58ee454608c00c092a73c945)@raton3062015

```
max-size: system/view/screens/1/size
view [size max-size text "test"]
```

raton3062015

[15:23](#msg58ee466b08c00c092a73ce8c)It will open window where close button is not visible. So I can not close the window

dockimbel

[15:38](#msg58ee49eb408f90be66b3b1de)@raton3062015 You asked for maximum size, that's what you got. ;-) You can close the window from the task bar (ALT+SHIFT to reveal it), or from a quit button you can put inside. You can also reduce the size slightly to make the borders apparent.

DideC

[15:39](#msg58ee4a4708c00c092a73dfec)...or close it with ALT+F4 (under Windows of course)

## Thursday 13th April, 2017

maximvl

[12:44](#msg58ef72ba8bb56c2d11a410cf)the collision detection seems to be quite a complex task, oh my

dockimbel

[12:54](#msg58ef74f208c00c092a78d233)@maximvl As you use very basic shapes IIRC, it shouldn't be that difficult?

maximvl

[12:55](#msg58ef7551f22385553d39689b)@dockimbel yep, I just thought it's a known and solved problem

[12:56](#msg58ef7562b52518ed4d0a5d53)now it explains why things fall into textures / walls in video games, lol

dockimbel

[12:56](#msg58ef7578bdf4acc11256e6aa):-)

[12:57](#msg58ef75a58e4b63533dc57332)Pixel-perfect collision detection is usually very expensive, so you need to make some trade-offs if you want to keep the framerate high. ;-)

maximvl

[12:57](#msg58ef75cfbdf4acc11256e83b)you developed games, didn't you?

dockimbel

[12:59](#msg58ef76308fcce56b20fb1340)Only as an amateur, never professionally. But like pretty much all people who learned coding on 8-bit computers, I am well-versed on that topic. ;-) Though, some of my close friends did became game developers for triple A game studios.

maximvl

[13:00](#msg58ef76774cb8d0917388d007)nice, I see

[13:01](#msg58ef7691b52518ed4d0a6345)when I was interested in making games programming a simple window in C++ with win forms was hell of a nightmare

[13:01](#msg58ef769f69a692963ea873a3)around 300 lines of macros or something which I couldn't put into my head

[13:01](#msg58ef76c74cb8d0917388d0f2)now Red gives me a second chance :D

dockimbel

[13:02](#msg58ef76d4ad849bcf427e44f8)After Red 1.0 is out, we can start working on proper game engines for it, with a few well cooked dialects to make it really fun. ;-)

pekr

[13:06](#msg58ef77d3ad849bcf427e4985)Don't forget the sound support :-)

maximvl

[13:06](#msg58ef77daad849bcf427e499a)sounds great, I'll try to get my knowledge up to date by that time :)

[13:07](#msg58ef7811a0e4856242febe94)@pekr yeah, I believe sound and multimedia in general is so cryptic and complex stuff, there tons of incompatible libraries and few people understand what's going on in this area

dockimbel

[13:08](#msg58ef7861f22385553d397811)We should get sounds support for 1.0.

pekr

[13:09](#msg58ef7897b52518ed4d0a6b68)@maximvl btw - Doc did one game for Rebol, don't remember its name anymore though. But if you start a Desktop in R2, you can find some nice demos in rebol.com / User contest folder ...

[13:10](#msg58ef78e08e4b63533dc582b2)@maximvl Maybe you don't know, but initial Rebol's name was LAVA (Language for Audio and Video Applications), but Carl then decided otherwise ... and the supposed OS would be named MagmaOS .... well, just a point in history ....

maximvl

[13:11](#msg58ef78f1408f90be66b88ec0)one of my friends was able to use Direct3D 11 hardware acceleration for FFmpeg, and he is very proud of it

[13:11](#msg58ef7906ad849bcf427e4f30)let's see if I can persuade him to port his stuff to Red

pekr

[13:12](#msg58ef792ea0e4856242fec3e2)I was thinking about some Red wrapper for some video stack - ffmpeg, mplayer, vlc, gstreamer ....

maximvl

[13:12](#msg58ef7952408f90be66b890a7)@pekr didn't know it, cool names, I'll check the demos, thanks :)

pekr

[13:15](#msg58ef79f5bdf4acc11256fc25)Well, later on, Carl wanted to call a Rebol OS being Wildman ... dunno why :-)

[13:16](#msg58ef7a1569a692963ea88515)Pity it never came. So here we are, wating for the RedOS!

maximvl

[13:27](#msg58ef7cdf69a692963ea8941d)@pekr regarding OS I believe in Redox, it's written in Rust and it's compile-time memory &amp; types safety is incredible

[13:29](#msg58ef7d23f22385553d3990a0)not sure if we need (want?) same level in Red, I also was thinking adding Redox as compile target for Red

[13:36](#msg58ef7eef8e4b63533dc5a2f1)I see it as two main "branches" of languages tree: one is highly dynamic, very powerful with all kinds of abstractions allowing you to make things easy and fast, another - static, very restrictive with all kinds of checks, very verbose and requires patience to write code, but gives you truly robust &amp; verified result

[13:50](#msg58ef824269a692963ea8b252)@dockimbel btw, thanks for your comments on the gist :)

dockimbel

[15:27](#msg58ef98dc8e4b63533dc63248) @maximvl You're welcome. ;-)

greggirwin

[17:23](#msg58efb404f22385553d3ab3ac)@maximvl, if you do C++, have you seen http://box2d.org/?

maximvl

[17:27](#msg58efb4fa8e4b63533dc6bb18)@greggirwin nope, it looks like a \*real* game engine :D

greggirwin

[17:34](#msg58efb68cad849bcf427f89f7)There was another neat example, I think part of Explorable Explanations, that showed interactive raycasting. Can't find it right now though.

maximvl

[17:36](#msg58efb700f22385553d3ac0cd)raycasting is too advanced for me, I'll try to make a collision detection + add some sprites for beginning )

greggirwin

[17:37](#msg58efb7744cb8d091738a0848)Yup. One of my favorite little demo games was always cannons. The original Angry Birds. :^)

JacobGood1

[17:54](#msg58efbb3e08c00c092a7a231c)Thanks @greggirwin

rebolek

[19:54](#msg58efd7834cb8d091738a977f)@maximvl collision detection is not that hard, keep mask of each sprite and using simple logic just test if they overlap.

maximvl

[20:07](#msg58efda88b52518ed4d0c4264)@rebolek what is that mask?

[20:10](#msg58efdb4769a692963eaa4751)for now I'm just following basic ones described here: https://developer.mozilla.org/en-US/docs/Games/Techniques/2D\_collision\_detection

[21:16](#msg58efea96408f90be66ba9f36)new version with collision detection and few other improvements! :D  
https://gist.github.com/maximvl/6787d6fb3382bf72399eab87b2857d86

greggirwin

[21:27](#msg58efed4cb52518ed4d0c90c2)My screen went a little crazy when I closed it. Otherwise, it's pretty fun. I swear I made it to the exit, but then got `doinked` back to start. How do I win!? ;^)

maximvl

[21:28](#msg58efed83bdf4acc112592ff5)whoops

[21:37](#msg58efef9008c00c092a7b0040)@greggirwin give me few minutes to fix that :D

[22:06](#msg58eff667bdf4acc112595358)@greggirwin please try it again :)

ericguedespinto

[22:51](#msg58f000e04cb8d091738b32ed)Hi everyone. I am trying to resize a face after changing its text. In Rebol I could use caret-to-offset but that func is not defined in Red. Any suggestions? Thanks in advance

[22:58](#msg58f0027f4cb8d091738b3972)Found size-text and it works fine :)

## Friday 14th April, 2017

raton3062015

[02:57](#msg58f03a85a0e485624201fda7)Red \[]

view/options [  
title "Closed window"  
size 500x600

][  
actors: object[  
on-close: func \[face event][  
view/flags cur-face: layout[  
text "Do you want to close? &lt;yes&gt; &lt;No&gt;"  
style b: button  
b "Yes" \[unview/all]  
b "No" \[unview cur-face]  
]\[modal popup]

]

]

]  
"

in my main window when i will click close, it show up a modal window with yes and no button. if i click button "No" then the modal window will disappear but my above code is closing both modal and main window.

greggirwin

[03:24](#msg58f04105bdf4acc1125a4140)`on-close` may be too late to abort the window closing. It may be possible with `insert-event-func` but I haven't tried.

raton3062015

[03:39](#msg58f04462b52518ed4d0daeb9)you are boss. its worked

qtxie

[03:47](#msg58f046578fcce56b20fe54cc)@raton3062015 Or you can return `'continue` in `close` event to cancel the closing.

```
view/options [
	title "Closed window"
	size 500x600
][
	actors: object[
		on-close: function [face event][
			view/flags cur-face: layout[
				text "Do you want to close? <yes> <No>"
				style b: button
				b "Yes" [ret: 'done unview/all]
				b "No" [ret: 'continue unview cur-face]
			][modal popup]
			ret
		]
	]
]
```

raton3062015

[04:31](#msg58f0509ff22385553d3cfdb4)qtxie... i have tried your code. it's crashing

[05:45](#msg58f061f169a692963eac0275)after down mouse left button if i move mouse cursor which event will fire ?

greggirwin

[05:55](#msg58f064484cb8d091738c6c60)What OS are you on @raton3062015 ? I just tried @qtxie's code and it worked here on Windows.

raton3062015

[05:56](#msg58f06472b52518ed4d0e12e8)windows 8

geekyi

[05:58](#msg58f064e9b52518ed4d0e1416)@raton3062015 maybe a problem with your version of red? (I'm on Win10)

```
>> system/build/config/build-basename
== %gui-console-2017-4-8-27033
```

raton3062015

[05:59](#msg58f0652d4cb8d091738c6ea4) %gui-console-2017-3-29-55448

[06:00](#msg58f06566bdf4acc1125ab058)i should download the latest version

greggirwin

[06:00](#msg58f065788fcce56b20feb3da)Yes, that's the first thing to try. Red is moving fast.

raton3062015

[06:02](#msg58f065ff408f90be66bc2e74)ok. but if i use insert-event-func, i have to remove it after closing the window. otherwise when i am running another red programme and i am trying to close the window it shows up the same modal window

greggirwin

[06:04](#msg58f06671b52518ed4d0e17d2)@qtxie's answer is preferred in this case, so let's see if we can get that working for you. Global event func handlers shouldn't be an issue in a normal application; only when running multiple experiments in a single console session.

iArnold

[06:58](#msg58f073328e4b63533dc97b0e)I am experimenting with draw and shape. I am trying to make the letter `C`. I use a (slightly adapted version of) livecode https://github.com/red/code/blob/master/Showcase/livecode.red ( I made a PR to implement my adaptations. )  
This is how far I have gotten:

```
b: base 400x400 draw [
	pen white	
	shape [
		fill-pen yellow
		line 250x175 200x175 
		'arc -50x0 20 10 90 sweep large
		'qcurv 0x50 
		'arc 50x0 20 10 90 sweep
		line 200x225 250x225
		arc 250x175 80 150 180
	]
]
```

Notice that the docs on shape arc https://github.com/red/docs/blob/master/en/draw.adoc#arc-1 are not correct in stating `closed` instead of `large`.  
Furthermore the `'qcurv` is producing a straight line not a curve, various variants like `curve` `'curv` `'curve` (and so on) are not making it any better than my result here.  
The last `arc` in this code seems I just got lucky with using the value 180 at the end there, tiny variations disrupt the effect, somehow I had expected it to be simple to make the inner part an ellips too.  
Suggestions for improvements?

[09:01](#msg58f08fdcf22385553d3dd4c2)For those wanting to experiment with the shape, there is a real nice SVG site http://svgpocketguide.com/book/ to get some ideas from and check if Red implementation is compatible.

maximvl

[09:05](#msg58f090c34cb8d091738cff0c)@iArnold how is exactly is `shape` different from `draw`?

iArnold

[09:05](#msg58f090e7ad849bcf4282a6cb)Shape can group or concatenate multiple items together.

[09:06](#msg58f09110f22385553d3dd8d3)Practical for filling more irregular shapes, like my `C`.

maximvl

[09:09](#msg58f091aca0e4856242031c12)@iArnold is it processed in some different way or just grouping as a common block?

iArnold

[09:14](#msg58f092f38bb56c2d11a86a13)Keine Ahnung. https://github.com/red/docs/blob/master/en/draw.adoc#3-shape-commands

maximvl

[09:43](#msg58f099c18fcce56b20ff6b32)@dockimbel my latest game gist crashes on OS X when you hit the "exit"

[09:43](#msg58f099d0881b89e1014d0664)I don't have mac to test what exactly causes the issue

dockimbel

[09:43](#msg58f099d5a0e4856242033a82)@qtxie ^----

maximvl

[09:46](#msg58f09a7a8bb56c2d11a888a5)there is a hotkey `w` a shortcut to win, should make testing easier

Scaremonger

[10:03](#msg58f09e704cb8d091738d304f)How do I add a context menu to a window? The docs suggest "Using the popup keyword at the beginning of the menu specification block". I have a working menu, but adding the keyword 'popup' before the first menu entry prevents it from working altogether.

```
Red[ needs 'view]
win: layout [ button "OK" [print ["OK Pressed" ]] ]
menu: [ popup "Help!" ["This" [Print "This"] "That" [Print "That"]]]
win/menu: menu
view win
```

dockimbel

[10:08](#msg58f09fab8e4b63533dca1e8a)@Scaremonger Seems to be a regression. The contextual menu is still working if set to a non-window face... Please open a ticket for that.

Scaremonger

[11:02](#msg58f0ac3c8e4b63533dca4c4b)Thanks, I've raised issue #2580

RiVeND

[13:00](#msg58f0c7f18e4b63533dcac295)@qtxie :point\_up: \[April 14, 2017 4:47 AM](https://gitter.im/red/red/gui-branch?at=58f046578fcce56b20fe54cc) This is also crashing for me on exit after the "Yes" button is clicked. The console window closes immediately. I'm using the latest automated build on Windows 7 64-bit.

luis-rj

[21:55](#msg58f145424cb8d091738fcae3) Is it possible to detect what text has been selected in a text area ?

## Saturday 15th April, 2017

qtxie

[01:11](#msg58f1734e408f90be66c01bdc)@raton3062015 @RiVeND This is the correct version:

```
view/options [
    title "Closed window"
    size 500x600
][
    actors: object [
        on-close: function [face event][
            view/flags layout [
                text "Do you want to close? <yes> <No>"
                style b: button
                b "Yes" [ret: 'done unview]
                b "No" [ret: 'continue unview]
            ][modal popup]
            ret
        ]
    ]
]
```

dockimbel

[03:08](#msg58f18e9f8bb56c2d11ac0063)@luis-rj Not yet, but it's a planned feature.

luis-rj

[03:55](#msg58f199a9881b89e10150bb2a)Ok, and cursor position ?

dockimbel

[05:06](#msg58f1aa48881b89e10150e9c2)That feature too.

RiVeND

[10:44](#msg58f1f98a69a692963eb196ab):point\_up: \[April 15, 2017 2:11 AM](https://gitter.im/red/red/gui-branch?at=58f1734e408f90be66c01bdc) Ah, so it looks like it was the unview/all in the original that was causing the problem. Thanks.

maximvl

[16:38](#msg58f24c888fcce56b20055d56)is there any way to draw things without a border? I only see `border` option related to images, but what about other things?

dockimbel

[17:21](#msg58f256b6408f90be66c2f646)@maximvl Define "things". Do you mean predefined filled shapes, like rectangle, circle, etc...? If that's what you mean, then just turn off the pen using: `pen off` and the border will be gone.

maximvl

[17:27](#msg58f2580fa0e4856242093b95)@dockimbel true, thanks, didn't figure it out from the docs :D

[17:33](#msg58f25955a0e4856242093f21)http://i.imgur.com/vL5vbqV.png

[17:34](#msg58f259924cb8d09173933b64)https://gist.github.com/maximvl/12d7f153c3479a54044f45cd8a5ace47

[17:35](#msg58f259e0bdf4acc112619982)a small app for experiments with `draw`, image updates on the fly and you can mix it with Red code :D

greggirwin

[17:38](#msg58f25a7b881b89e101532e19)Cool Maxim. You can use `random 255.255.255` for the random color.

maximvl

[17:39](#msg58f25ae908c00c092a8359c0)@greggirwin wow, ok, thanks)

[17:48](#msg58f25cd9ad849bcf4289289e)@greggirwin do you think there is a better way to cleanup image than `forall img-swap [ img-swap/1: bg-color ]` ?

[17:48](#msg58f25d08f22385553d443dc0)I can imagine how it converts each tuple to byte

greggirwin

[17:53](#msg58f25e27408f90be66c30eb8)Will this work? `change/dup img-swap/rgb bg-color length? img-swap`

[17:56](#msg58f25ed508c00c092a836677)`img-swap/rgb: head change/dup img-swap/rgb bg-color length? img-swap`

maximvl

[17:57](#msg58f25efc69a692963eb3083c)@greggirwin yes, great! the second one works

[17:57](#msg58f25f1abdf4acc11261af03)@maximvl didn't know about `/rgb` field on image

greggirwin

[17:58](#msg58f25f42bdf4acc11261affb)There is also `/alpha` and `/argb`

[18:05](#msg58f261008bb56c2d11aea16c)Other hints: `email!` have `/user /host` and `pair!` have `/x /y`. If you look at the %.reds source for a datatype, and there is an `eval-path` function, you can see how they work.

maximvl

[18:07](#msg58f261734cb8d09173935961)yeah, but it's quite inconvenient to check sources each time, would be nice to have this info in runtime, in `help` for example ;)

greggirwin

[18:09](#msg58f261f2bdf4acc11261b7ec)Changing groups.

## Sunday 16th April, 2017

qtxie

[01:04](#msg58f2c326ad849bcf428aa23a)@maximvl You can simply set the background color like this:

```
img-swap/rgb: bg-color
```

greggirwin

[01:07](#msg58f2c3d9f22385553d45a26e)That's brilliant Qingtian!

[01:08](#msg58f2c4258fcce56b2006fb96)I didn't look into the `set-data` func to see that it would work that way. Should have known you guys would reduce it to the bare minimum.

maximvl

[07:19](#msg58f31b10f22385553d469b0f)@qtxie nice!

## Monday 17th April, 2017

Scaremonger

[20:32](#msg58f526420ed3020c38269a2e)I can't get the align property of \[Radio](https://doc.red-lang.org/en/view.html#\_radio) or \[Check](https://doc.red-lang.org/en/view.html#\_check)box to work. The Docs say there is `para` Facet with an `align` field that can be set to `left` or `right` and `data` can be set to `true` or `false`. `data` works fine.  
`enable: check "Enable?" data true` works fine, but text is always on the right.  
`enable: check "Enable?" data true para left` fails.  
`enable: check "Enable?" data true para/align left` fails.  
`enable: check "Enable?" data true align left` fails.  
`enable: check "Enable?" data true left` Compiles, but doesn't seem to do anything. Might be default I guess.  
`enable: check "Enable?" data true right` Compiles and seems to add a tabstop or extra space between control and text.  
Incidentally: There is a typo in the Docs for `check`, The row for the `data` facet is listed under `para`!

greggirwin

[20:36](#msg58f52736bdf4acc1126b5665)

```
>> view [enable: check "Enable?" data true left]
>> view [enable: check "Enable?" data true right]
>> view [enable: check 200 "Enable?" data true right]
```

[20:38](#msg58f527d108c00c092a8d1dbf)If you need to set more things in the `para`:

```
view [enable: check 200 "Enable?" data true para [align: 'right]]
```

Scaremonger

[20:38](#msg58f527d3ad849bcf42933131)I see what it's doing. Its aligning the text within a borderless text box to the right of the checkbox itself, rather than putting the text on the left or right of the control.

greggirwin

[20:39](#msg58f527ec881b89e1015d2c9f)Correct. Native widgets. :^\\

[20:39](#msg58f5280ad32c6f2f09155a18)The way around that is to use a checkbox with no text, and a separate text face.

Scaremonger

[20:40](#msg58f5282708c00c092a8d1f98)I've just tried that, but when you tab to it, it displays a dotted border around a blank label.

greggirwin

[20:41](#msg58f528918fcce56b200f55c3)Set the width to something narrow, like 15. That should hide it. No guarantee though.

Scaremonger

[20:43](#msg58f528efd32c6f2f09155e46)Yep. That did it.  
Thanks

greggirwin

[20:43](#msg58f52901d32c6f2f09155edf)And there is no standard on-click handler for text faces.

[20:47](#msg58f529f969a692963ebcc0b9)You can use `on-up` if that works for you.

```
view [text "Enable?" on-up [enable/data: not enable/data] enable: check 15  data true]
```

Scaremonger

[20:51](#msg58f52ae2f22385553d4df477)Thats cool.

## Tuesday 18th April, 2017

Scaremonger

[19:15](#msg58f665cb8fcce56b2014495e)I have three tabs, "General", "Detail" and "Tags" and on the General tab there is a checkbox "Enable?". The Tab "Detail" visibility needs to be based on the state of the checkbox. I can get the state of the check using `enable/data` (as per @greggirwin example above), but I cannot figure out the path for the Detail tab visibility. Currently I have `enable: check 15 on-change [tabs/pane/detail [ hidden: enable/data ] ]`, which doesn't do anything, but doesn't give me any error either!

## Wednesday 19th April, 2017

dockimbel

[05:17](#msg58f6f2f2a0e48562421a3c38)@Scaremonger `pane` is a block of panel faces (when built by VID), so you need to access it with indexes (`tabs/pane/2`). Though, I don't remember that our tab-panel supports setting a tab visibility that way.

[05:28](#msg58f6f58abdf4acc112725faa)@Scaremonger Here's an example code for that, it provides a function to handling the insertion/removal of the "Detail" tab:

```
detail-tab: none

toggle-detail: function [state [logic!]][
	either state [
		insert at tabs/data 2 "Detail"
		insert at tabs/pane 2 detail-tab
	][
		remove at tabs/data 2
		detail-tab: tabs/pane/2
		remove at tabs/pane 2
	]
]

view [
	tabs: tab-panel [
		"General" [check data on "Detail" [toggle-detail face/data]]
		"Detail"  [text "hello"]
		"Tags"	  []
	]
]
```

[05:29](#msg58f6f5aa8fcce56b20164540)Though, when putting the tab back, there's an error popping up in the console, we'll fix that laterr today.

[05:54](#msg58f6fb9908c00c092a9461ca)Ah, got caught by `function` once again :fearful: ... Just replace `function` with `func`, and it will work fine. I've open a ticket about it anyway, as the View code needs to be more robust against such mistake.

[05:59](#msg58f6fcbd8bb56c2d11bfaa75)Here is a cleaner version:

```
detail-tab: first layout/only [panel [text "hello"]]

toggle-detail: function [state [logic!]][
    either state [
        insert at tabs/data 2 "Detail"
        insert at tabs/pane 2 detail-tab
    ][
        remove at tabs/data 2
        remove at tabs/pane 2
    ]
]

view [
    tabs: tab-panel [
        "General" [check "Detail" [toggle-detail face/data]]
        "Tags"    []
    ]
]
```

rebolek

[09:05](#msg58f72846ad849bcf429b1ce1)Is this expected behaviour?

```
>> l: layout [base 100x100 rate 1 now on-time [print "tick"]]
tick
```

maximvl

[09:07](#msg58f728d0bdf4acc112732d54)@rebolek what does `now` do in this case?

dockimbel

[09:11](#msg58f729d1f22385553d55cd89)@rebolek Yes, the purpose of `now` is to trigger a first `time` event immediatly (at t = 0).

rebolek

[09:12](#msg58f729f9bdf4acc11273322e)@dockimbel I see, thanks.

AlexanderBaggett

[19:00](#msg58f7b3ccbdf4acc11275d010)I know its less efficient, but using view is so straight forward. `show probe make face! [type: 'window size: 400x400 pane: reduce [make face! [type: 'button size: 200x200]]]`

[19:00](#msg58f7b3d73e27cac331a45a40)Its so clear what I am doing here.

[19:00](#msg58f7b3dad32c6f2f091f9c86)I like it

maximvl

[19:01](#msg58f7b40508c00c092a97a288)@AlexanderBaggett what do you mean by less efficient?

AlexanderBaggett

[19:01](#msg58f7b419881b89e101678f4c)erm I mean takes more code

maximvl

[19:02](#msg58f7b437cfec91927255f236)more code than what?

AlexanderBaggett

[19:02](#msg58f7b45ecfec91927255f2df)`probe view [size 400x400 title "" button 200x200]`

maximvl

[19:06](#msg58f7b5428e4b63533de48199)@AlexanderBaggett I would say that these are two different things - first one allows you to program all parts of the interface as objects in the code and easier reprogram them, while the second is more "lightweight" and a quick try approach

AlexanderBaggett

[19:29](#msg58f7ba863e27cac331a4797d)I see

[19:30](#msg58f7baedbdf4acc11275eed2)Does anyone know what sorts of things go in the `block!` in a 'window's menu? https://doc.red-lang.org/en/view.html#\_window Its not clear from looking at the documentation

meijeru

[19:33](#msg58f7bba2a0e48562421dc524)Quote from the view documentation:

```
To be added:
menu facet specification
Image! datatype description
```

In other words, menu is not yet documented...

rebolek

[19:35](#msg58f7bc028bb56c2d11c312a1)@AlexanderBaggett see this example:

```
win/menu: [
			"File" [
				"About"				about-msg
				---
				"Quit"				quit
			]
			"Options" [
				"Choose Font..."	choose-font
				"Settings..."		settings
			]
		]
```

AlexanderBaggett

[19:35](#msg58f7bc13cfec91927256153a)It looks like it takes a block of strings who can have a block argument which is is a sub menu

rebolek

[19:36](#msg58f7bc3fbdf4acc11275f55f)The structure is text `string!` followed by `word!` or `block!`.

[19:36](#msg58f7bc4c8e4b63533de4a424)Or `---` for delimiter.

AlexanderBaggett

[19:37](#msg58f7bc70ad849bcf429de1da)`show probe make face! [type: 'window size: 400x400 flags: [resize] menu: ["File"["Close" quit]] pane: reduce [make face! [type: 'button size: 200x200 text: "Click" ]]]`

[19:37](#msg58f7bc8e08c00c092a97cb72)here `quit` doesn't do anything. Is `quit` a VID command?

rebolek

[19:40](#msg58f7bd158e4b63533de4a737)@AlexanderBaggett 1. you must use `view` instead of `show`. `view` will run event engine, `show` will just update it, so no new events (like clicking) will be received.

AlexanderBaggett

[19:41](#msg58f7bd543e27cac331a48815)OH

[19:42](#msg58f7bdaabdf4acc11275fc92)wait a sec `view probe make face! [type: 'window size: 400x400 flags: [resize] menu: ["File"["Close" quit]] pane: reduce [make face! [type: 'button size: 200x200 text: "Click" ]]]` clicking on Close still doesn't do anything.

rebolek

[19:43](#msg58f7bdd28e4b63533de4aadd)@AlexanderBaggett yes, that was the first point, heres the second one :)

maximvl

[19:43](#msg58f7bddead849bcf429de959)@AlexanderBaggett :D

```
>> help quit

USAGE:
      quit  /return status

DESCRIPTION:
      Stops evaluation and exits the program. 
      quit is of type: function!
```

rebolek

[19:43](#msg58f7bdf5881b89e10167bbd6)2. Clicking on menu item returns `word!`, it does not evaluate it.

[19:44](#msg58f7be018bb56c2d11c31b36)So you need to add some menu handler, like this:

[19:44](#msg58f7be213e27cac331a48b82)

```
view probe make face! [
    type: 'window 
    size: 400x400 
    flags: [resize] 
    menu: [
        "File" [
            "Close" quit
        ]
    ] 
    actors: context [
        on-menu: func [face event] [if equal? 'quit event/picked [unview]]
    ] 
    pane: reduce [make face! [type: 'button size: 200x200 text: "Click" ]]
]
```

AlexanderBaggett

[19:47](#msg58f7bec9cfec919272562267)Ah

[19:48](#msg58f7bf208bb56c2d11c32199)Man, having a community to ask questions to is awesome. :)

rebolek

[19:49](#msg58f7bf3bcfec919272562452):D

[19:49](#msg58f7bf5cf22385553d589a37)It is awesome to have a community to answer questions ;)

greggirwin

[20:01](#msg58f7c232bdf4acc1127613b4)@AlexanderBaggett, on VID vs View, the latter may seem more transparent, and it's good to know how things work at that level, but once you get used to VID, and the idea that facets are dispatched and identified by datatype, it's hard to give up. Certainly, you have less control, but when default actions and such work 95+% of the time, your code shrinks dramatically. For fun, create a window with a few dozen faces on it, with some actions, in both View and VID. How do they compare?

rebolek

[20:11](#msg58f7c45ea0e48562421def62)@greggirwin you don't have less control with VID.

greggirwin

[20:14](#msg58f7c5258bb56c2d11c33c9b)Of course. Poor wording on my part. How about "VID gives you more defaults and hides more details, so you may not know what all your options are, but that's OK because most of the time you don't need them anyway." ? :^)

rebolek

[20:15](#msg58f7c56b8bb56c2d11c33e17)Maybe... ;)

[20:17](#msg58f7c5c2a0e48562421df4e9)It is problem of dialects not having self-documenting support as functions have.

greggirwin

[20:20](#msg58f7c691cfec9192725645fb)Not sure we can solve that in general. We could write a dialect dialect that does it, normalizing how dialects are constructed. Will work for many cases. It's come up before. Higher level tools, along the lines of what ANTLR does in some ways.

rebolek

[20:23](#msg58f7c72e8bb56c2d11c34673)I agree, we could add some higher level functions, like we have `func`, we could have `rule` or `dialect`.

## Thursday 20th April, 2017

dockimbel

[03:29](#msg58f82b0c08c00c092a9967e0)@AlexanderBaggett You can still use `show` if you prefer it on the window face, you just need to start the event loop manually then, which is achieved using `do-events`. Though, `view` function comes with its own perks, just have a look at `source view`.

[03:33](#msg58f82c1c881b89e101695267)Just a remark about VID vs View, VID code is really just a front-end which is compiled to a tree of faces. At run-time, when you need to apply changes to the GUI, you need to know what is a face, how it works and be able to manipulate the face tree in order to achieve dynamic behavior. It is similar to the DOM tree, just way more simpler. ;-)

planetsizecpu

[06:48](#msg58f859c0bdf4acc1127842fe)@qtxie I have some image!s stored at a,b,c and a block! x \[a b c], so if I do view \[image x] I get view displayed with no image, but if I do view \[image x/1] (wich is a) I get vid invalid syntax, so what will be the right way to view a block of images or one by one?, I don't know if it has some sense... just playing with images to learn :smile:

[06:50](#msg58f85a2ccfec9192725851b4)The goal will be to display a block of images on sucession, that makes some sense to me.

dockimbel

[06:58](#msg58f85c293e27cac331a6c3fd)@planetsizecpu To get you started:

```
view [i: base 200x200 on-down [i/image: first list: next list] do [i/image: list/1]]
```

planetsizecpu

[07:02](#msg58f85d0d881b89e1016a07e7)@dockimbel thx! I'll keep trying :smile:

[08:38](#msg58f8737ac1d3b50154014a29)@dockimbel I'm not sure if I understand correctly, I did that:  
a: load %test.bmp  
b: a  
c: b  
x: \[a b c]  
d: first x

print type? a  
print type? x  
print type? d  
; e: to-image d

Then, a,b,c are image!, x is block!, and d is word! so do \[i/image first x] does no display anything, furthermore if you uncoment e: to-image d it aborts console and exit. So I not sure if it my mistake or an issue.

Phryxe

[08:38](#msg58f8738c881b89e1016a6a80)

maximvl

[08:39](#msg58f873db881b89e1016a6bb2)@planetsizecpu `first x` returns word `a`, not the value

[08:40](#msg58f873f68e4b63533de75b49)to get the value run `get first x` or `get d`

planetsizecpu

[08:42](#msg58f87476c1d3b50154014e7f)@maximvl thx!, I was not aware of "get", now it works as I want

maximvl

[08:44](#msg58f874d008c00c092a9a6f66)@planetsizecpu it's very important to understand that `[a b c]` creates block with three words, `a`, `b`, `c`, not the values of these words

[08:45](#msg58f875168bb56c2d11c5bb93)you need to explicitly do something to get values there instead, like `reduce` or `compose`

planetsizecpu

[08:51](#msg58f876888bb56c2d11c5c0df)@maximvl yeah! thats my java inheritance :smile:

## Friday 21st April, 2017

justjenny

[02:34](#msg58f96fbe12d240993582f235)Rebol \[needs: 'view]  
view layout [  
f1: field "field 1"  
f2: field "field 2"  
button "Focus 2" \[focus f2]  
button "Focus 1" \[focus f1]  
] - Is it possible to do this in Red ?

[02:37](#msg58f97074d32c6f2f0926c88c)sorry, I mean is there a way to do it

greggirwin

[02:38](#msg58f970aa881b89e1016ebf8c)

```
Rebol [needs: 'view]

win: layout [
	below
	f1: field "field 1"
	f2: field "field 2"
	button "Focus 2" [win/selected: f2]
	button "Focus 1" [win/selected: f1]
]
view win
```

justjenny

[02:49](#msg58f9731f8e4b63533debb618)Thanks Gregg - love it.

qtxie

[02:56](#msg58f974f4d32c6f2f0926d76e)@justjenny @greggirwin We have `set-focus` in Red now. ;-)

```
view [
    below
    f1: field "field 1"
    f2: field "field 2"
    button "Focus 2" [set-focus f2]
    button "Focus 1" [set-focus f1]
]
```

greggirwin

[02:57](#msg58f975263e27cac331ab89e2)Nice @qtxie !

planetsizecpu

[05:59](#msg58f99fc812d2409935839036)@dockimbel @maximvl finally I got it, I was playing a little and wrote that:

Red [  
Needs: 'View  
]

a: load %test1.bmp  
b: load %test2.bmp  
c: load %test3.bmp  
x: \[a b c]

v: \[i1: base 200x200 i2: base 200x200 i3: base 200x200 rate 2 on-time \[do rotation] ]

rotation: does [  
o: first x  
i1/image: get first x  
i2/image: get second x  
i3/image: get third x  
x: next x  
append x o  
]

view v

maximvl

[06:39](#msg58f9a93d8e4b63533dec7482)@planetsizecpu nice, few things to take a look at:  
`x: [a b c]` you can replace with `x: reduce [a b c]` so you don't need `get` afterwards

[06:41](#msg58f9a9828e4b63533dec7665)and `append x o` grows `x` infinitely, which will eat all the memory, better to replace with something like  
`if tail? x [ x: head x ]`

[06:41](#msg58f9a99b08c00c092a9f81d7)which will just start iterating from the beginning of `x`

dockimbel

[06:50](#msg58f9abd312d240993583bcf3)@greggirwin Do you think we should have named it `focus`, like in Rebol instead of `set-focus`, which actually sounds a bit verbose to me compared to the Rebol version?

greggirwin

[06:54](#msg58f9ac948bb56c2d11cae538)I like `set-focus` better. `Focus` isn't bad, but the verb is short and makes it stronger. Then you can ask for the focused face with `get-focus`, yes?

DideC

[07:49](#msg58f9b9938bb56c2d11cb1e97)@planetsizecpu A litle smaller en more efficient:

```
Red [Needs: 'View]

a: load %test1.bmp
b: load %test2.bmp
c: load %test3.bmp
x: reduce [a b c]
v: [style img: base 200x200 i1: img i2: img i3: img rate 2 on-time [rotate] ]
rotate: does [
	move x tail x
	i1/image: first x
	i2/image: second x
	i3/image: third x
]
view v
```

iArnold

[08:02](#msg58f9bc8d12d2409935840338)&gt; `focus` for all widgets that can get focus and `set-focus` and `get-focus` for the actions on focussing.

planetsizecpu

[08:04](#msg58f9bd1012d24099358404b0)@maximvl @DideC Thx!, I'm old fashioned thinker :smile: and had not thought on reduce. Now there are at least two words I love: rate &amp; reduce. What a powerful tools!

pekr

[08:05](#msg58f9bd458bb56c2d11cb2eab)I might actually prefer `focus`- good enough and in line with the topic of naming we are recently discussing :-)

planetsizecpu

[08:13](#msg58f9bf19d32c6f2f0927f509)@DideC I also was not aware of move word, now I was doing some examples to lear its behavior and crashed console with this code: &gt;&gt; a: \["X" "Y" "Z"]  
\== \["X" "Y" "Z"]  
&gt;&gt; b: first a  
\== "X"  
&gt;&gt; tail a  
\== \[]  
&gt;&gt; move b tail a

DideC

[08:20](#msg58f9c0e88e4b63533decdd58)`move` is new to me too (learned it yesterday ;-).  
Read the help : it wants two positions in a serie. In your code `a` point to the head of a block, and `b` point to the head of a string that is also the first of the block, it's not the same serie value!  
You must use `b: head a` not `first`. `first` is like `pick 1`, but you have to use `at`or `skip` in this case to point on a element of the serie, not to refer to it.

[08:25](#msg58f9c1ed881b89e1016ff92b)Correction: `move` wants two positions in series, not in a serie. That could be the same serie or two different ones, but of the same type.  
You tried to move a string! element to a block!.  
The crash is due to missing type compatibility checking I guess.

[08:31](#msg58f9c368f22385553d60e596)I posted an issue about it.

planetsizecpu

[08:39](#msg58f9c525c1d3b5015406f2eb)@DideC Thx!, You are right, b: is a string! type, I found that: move to-block b tail a works fine. One must be cautious with type conversion, and I don't see out of scope for move to do this by default, at all, a: is a block containing strings, so I think move would need some refinements.

DideC

[08:49](#msg58f9c7b0cfec9192725e6e87)`move` is initially here to move elements inside a serie (shift positions) in an efficient maner:  
`a: [1 2 3 4 5 6 7 8] loop 8 [move a tail a probe a]`  
It avoid using `insert` and `remove` to do that.  
But it is also able to move elements bewteen two series, and that is cool.

planetsizecpu

[10:04](#msg58f9d92208c00c092aa04d99)@DideC Ah, I miss that move is for series! manipulation, yes you are right, and when type checking become available no more confussions. I tryed your example of loop and works fine!, then I changed "loop 8" for "forever" just to see how it happens, but there was no output from probe on screen as I supossed, had to force closing console, it is in my nature to bring things to their limits :smile:

DideC

[14:52](#msg58fa1cb6d32c6f2f09299077)Sad you close it, maybe it will still run at this moment ;-)

## Saturday 22nd April, 2017

maximvl

[14:19](#msg58fb665bad849bcf42ac716f)is assignment such a heavy operation?

```
red>> i: make image! 200x200
red>> time-it [ forall i [ 0.0.0 ] ]
== 0:00:00.003000001
red>> time-it [ forall i [ i/1: 0.0.0 ] ]
== 0:00:00.009000001
```

[14:19](#msg58fb66768e4b63533df32ef1)makes whole thing 3x times slower

[14:19](#msg58fb667fad849bcf42ac71f8)is there any workaround?

greggirwin

[15:12](#msg58fb72cd3e27cac331b30039)`i/rgb: black`

maximvl

[15:12](#msg58fb72faf22385553d672e6c)@greggirwin but I need to set them to different colors =\\

greggirwin

[15:14](#msg58fb734dcfec91927264c741)You didn't say that. :^) Faster way would be Red/System, but even though it's 3x slower, it's still pretty fast, right?

maximvl

[15:15](#msg58fb737b08c00c092aa64ae7)I guess, yeah

qtxie

[15:40](#msg58fb797a8bb56c2d11d1b78f)@maximvl You can get the buffer first, change it, then set it back. This way should be faster if you need to do a lot manipulate on pixels.

```
i: make image! 200x200
rgb: i/rgb
until [change rgb 12.34.56 rgb: skip rgb 3 tail? rgb]
i/rgb: head rgb
```

maximvl

[15:45](#msg58fb7a9112d24099358a8e39)@qtxie wow, that's much faster, thanks!

rebolek

[16:05](#msg58fb7f32cfec91927264efe3)or use Red/System ;)

Scaremonger

[18:25](#msg58fba014ad849bcf42ad3c47)How do you disable menu items? (For example, disable File|Save until a file is actually open). I tried using a path, but I suspect this is just the menu text, rather than the menu item face.

```
Red [ needs view ]
win: layout [button "ok"]
win/menu: [ "File" [ "New" f-new "Close" f-close ] ]
win/menu/file/new/disabled?: true
view win
```

\`

luis-rj

[18:29](#msg58fba126ad849bcf42ad3f27)It's possible get the var of an face ? (like face/var in Rebol)

[18:30](#msg58fba1338fcce56b2028ca07)Is't..

Scaremonger

[18:32](#msg58fba1cfd32c6f2f092ee697)My example doesn't work, but the values in a block can be accessed through a path using a forward slash, so I expect this works across most, if not all types. I'm only learning so some things are still a bit vague.

[18:33](#msg58fba2178bb56c2d11d23319)Hopefully one of the experienced guys can point out if there are places that it doesn't.

maximvl

[21:08](#msg58fbc64bcfec91927265c6e4)@Scaremonger `win/menu` returns a block, that's why `/file` returns none and it doesn't work

[21:08](#msg58fbc664d32c6f2f092f56e7)there should be other way to get menu "object"

[21:09](#msg58fbc6848fcce56b20293ee3)or menu DSL should support this

Scaremonger

[21:10](#msg58fbc6aaf22385553d6826c6)I suspected it was a block used for the menu text, but cannot find anything in the docs about retrieving an object.

maximvl

[21:11](#msg58fbc6ebf22385553d682784)@Scaremonger  
&gt;To be added:  
&gt;menu facet specification

Scaremonger

[21:12](#msg58fbc72d8bb56c2d11d2a3a6)Doh!... Right at the bottom. ;)

maximvl

[21:13](#msg58fbc7628bb56c2d11d2a483)yep, have to wait for docs update

meijeru

[21:35](#msg58fbccbe08c00c092aa7601e)@luis-rj If I recall, in Rebol `var` was a local that was added automatically to each event-handler (being a function with spec `[face event /local var]`).

[21:36](#msg58fbccd78fcce56b20294f0c)In Red, one has to declare locals in event handlers oneself.

luis-rj

[22:04](#msg58fbd3688bb56c2d11d2c589)@meijeru I'm looking for a Red equivalent to:

```
>> view layout [myBox: box red [print face/var]]
myBox
myBox
myBox
```

greggirwin

[22:24](#msg58fbd8308e4b63533df485c2)@luis-rj, it's not built in, but you can achieve it.

```
>> view [myBox: box red extra 'myBox [print face/extra]]
myBox
myBox
myBox
```

Scaremonger

[22:26](#msg58fbd87bd32c6f2f092f8ac8)When would you use this?

greggirwin

[22:37](#msg58fbdb0e8bb56c2d11d2dade)When a face wants to tell someone who it is.

[22:38](#msg58fbdb7b8fcce56b20297b34)Imagine logging user actions in a GUI. Now imagine you could take that log and replay it. Going by offsets and such is tricky, but if you know exactly what face was acted on, it's much easier.

Scaremonger

[22:40](#msg58fbdbf108c00c092aa78b1e)I think I see what you mean.

[22:42](#msg58fbdc383e27cac331b43f1e)I used something similar in a treeview that contained a number of database records in a container so that i could reference them in the database.

greggirwin

[22:42](#msg58fbdc408bb56c2d11d2ddbd)Take another step, and that replay is an instant macro recording system built into your app.

Scaremonger

[22:42](#msg58fbdc6b12d24099358bb947)Yeah. Got it... :)

luis-rj

[23:01](#msg58fbe0e28fcce56b20298b2c)@greggirwin Thanks Gregg !

## Sunday 23th April, 2017

justjenny

[23:50](#msg58fd3dd06aea30763d365c83)@qtxie - view [  
below  
f1: field "field 1"  
f2: field "field 2"  
button "Focus 2" \[set-focus f2]  
button "Focus 1" \[set-focus f1]  
]

[23:51](#msg58fd3deacfec9192726a4c0d)I get \*\** Script Error: set-focus has no value  
\*\** Where: act  
&gt;&gt;

[23:53](#msg58fd3e788bb56c2d11d71e79)I'm using red 0.62 last stable build

## Monday 24th April, 2017

dockimbel

[00:08](#msg58fd42068fcce56b202dc578)@justjenny IIRC, `set-focus` was introduced after the 0.6.2 release. Here is the source of that function:

```
set-focus: function [
    "Sets the focus on the argument face" 
    face [object!] 
][
    p: face/parent 
    while [p/type <> 'window] [p: p/parent] 
    p/selected: face
]
```

You can just copy/paste it in your code.

[00:09](#msg58fd4251d32c6f2f0933e787)@justjenny BTW, to nicely format your code on Gitter, you can use triple backquotes like:  
\`lisp

[00:11](#msg58fd42a48e4b63533df8f8b3) to open a code block and:

[00:11](#msg58fd42b5cfec9192726a599d)\`

[00:11](#msg58fd42b908c00c092aabd861) to close it (both on separate lines).

justjenny

[00:19](#msg58fd4487cfec9192726a5f54)Apologies, and thanks @qtxie and Nenad - just used the last 'automated build' works fine - I really need to look before i waste your time.

dockimbel

[00:24](#msg58fd45c46aea30763d367239)@justjenny No worry, it's always a pleasure to be helpful to a Red user.

luis-rj

[05:14](#msg58fd89b7cfec9192726b2ca0)

```
view/no-wait [p: panel 260x260  draw [][box  blue [] loose] button "add box" [print " I don't know..."]]
```

How do I add new boxes dynamically ?

dockimbel

[05:25](#msg58fd8c51d32c6f2f0934c151)@luis-rj `view` produces a tree of faces, adding new faces individually can be done by inserting them in the tree (or you can use `layout` to produce more complex layouts, and then insert the resulting face(s) in the tree). See the View docs at http://docs.red-lang.org

endo64

[06:47](#msg58fd9f7ec1d3b50154144c84)@luis-rj Here is a simple example. There might be many other ways;

```
base-box: make face! [type: 'base options: [drag-on: 'down]]
view/no-wait [p: panel 260x260 [] button "add box" [append p/pane make base-box [size: random 50x50 offset: random 100x100 color: random white] ]]
```

[06:53](#msg58fda0d28fcce56b202eff3a)@justjenny Usually automated build is stable enough, it is better to use it normally and if you see a problem then check the stable build, not the opposite way. All new features, newly added functions and bug fixes is on daily build.

raton3062015

[07:14](#msg58fda5c1c1d3b501541463ca)Options: \[ drag-on: 'down] what it does? Which name and value we can use in options block

endo64

[08:40](#msg58fdb9f9881b89e1017d8359)Check this out:

```
>> view [b: box red loose] ? b/options
b/options is a block! of value: [drag-on: 'down]

>> view [b: box red] ? b/options
b/options is a none! of value: none
```

[08:41](#msg58fdba4e08c00c092aad5ba9)I don't know the other possible `options` if there are any.

luis-rj

[13:34](#msg58fdff02d32c6f2f0936a286)@endo64 Thanks Semseddin !

meijeru

[16:09](#msg58fe233a8fcce56b20315107)@endo64 See also the \[official documentation](https://doc.red-lang.org/en/view.html#\_options\_facet)

endo64

[16:32](#msg58fe289a587a245e244355f9)Thanks @meijeru I've missed that part.

justjenny

[22:07](#msg58fe772512d240993595099b)thanks @endo64 - yes, will do.

## Tuesday 25th April, 2017

greggirwin

[00:41](#msg58fe9b45d32c6f2f09393796)@qtxie , is it by design that `text/data` for a field are not changed until after `on-key`?

```
view [field on-key [print [face/text face/data]]]
```

qtxie

[01:07](#msg58fea1508e4b63533dfe8182)Yes, then you can intercept on key event. `on-change` is for detecting the change of text.

```
view [field on-change [print [face/text face/data]]]
```

greggirwin

[01:43](#msg58fea9afcfec9192726ff1f6)Thanks. I knew I was forgetting something.

luce80

[12:06](#msg58ff3bb58bb56c2d11deea9f)How can I customize a face with VID since there seems not to be the `with` keyword ?

DideC

[12:08](#msg58ff3c5012d240993597eca6)@luce80 You can use `on-create [face/size: ...]`to programmaticaly modify the face at its creation.

luce80

[12:09](#msg58ff3c8c6aea30763d3e1a29)Thanks. Simple and effective.

DideC

[12:13](#msg58ff3d5d12d240993597f18c)ie: `view [text "Red Build " on-create [append face/text form system/build/date face/size: size-text face]]`.

[12:14](#msg58ff3dc1c1d3b501541b106a)You just have to know that `layout` has already accounted for the face offset and size (before `on-create` code), so it does not change the window layout in the case.

[12:18](#msg58ff3e90d32c6f2f093ba597)@dockimbel Could be nice to have a keyword to handle that while needed (if no better solution can be found).  
ie: `view [text "Red Build " on-create [append face/text form system/build/date face/size: size-text face] relayout]`  
The `relayout` keyword would force `layout` to recompute the current layout position and size base on the face size and offset after `on-create`.

dockimbel

[12:23](#msg58ff3fbdf22385553d749163)@DideC We could also move `on-create` before the face size/position calculation by the layout?

DideC

[16:01](#msg58ff72dbcfec91927273598d)@dockimbel I remember pointing this issue in some related way in #2062.  
Of course `on-create` can be move if this not a problem.

greggirwin

[16:08](#msg58ff748ad32c6f2f093cb782)That does seem like it would be more convenient. Right now it happens in `show`, which doesn't trigger another `on-create` event if you just change `visible?` on a face. Are there other cases where `on-create` may trigger again? `on-created` comment says its only called once.

dockimbel

[16:36](#msg58ff7b0dd32c6f2f093cd43d)@greggirwin Only once, on face first show. We can move `on-create` to a little ealier position as we still have `on-created` to deal with post-show custom initialization.

greggirwin

[16:42](#msg58ff7c80cfec919272738cf7)Got it. That makes sense. The way it is now, the face isn't sited (in a pane) during `on-create`, but it is for `on-created`, otherwise, there's not much difference, right?

dockimbel

[16:44](#msg58ff7cdfcfec919272738f67)Looking at the code, you're right, `on-created` is also pre-show, but post-graphic object allocation.

greggirwin

[16:46](#msg58ff7d576aea30763d3f5f7d)The diagrams you have in the View doc are great, for event flow and face parentage. Once this is nailed down, a diagram showing the setup/teardown states and events will be helpful too.

luce80

[18:41](#msg58ff98738e4b63533d02985d)

```
>> img: make image! 10x10
== make image! [10x10 #{
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFFFFFFFF
>> view [button image img]
*** Script Error: VID - invalid syntax at: [img]
*** Where: do
```

while this works:

```
and this does not show the image over the button
```

view \[button on-create \[image: img]]\`

greggirwin

[18:43](#msg58ff98b56aea30763d3fe744)@luce80, put \` on a line by itself first to get the formatting right.

luce80

[18:43](#msg58ff98c98fcce56b203749e6)

```
>> img: make image! 10x10
== make image! [10x10 #{
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFFFFFFFF
>> view [button image img]
*** Script Error: VID - invalid syntax at: [img]
*** Where: do
```

while this works:

```
>> view [button return image img]
```

and this does not show the image over the button

```
view [button on-create [image: img]]
```

greggirwin

[18:45](#msg58ff99448bb56c2d11e0b944)The first example works fine here. Maybe a recent fix?

[18:45](#msg58ff99578e4b63533d029d04)Not sure what you're trying to do in the last one.

luce80

[18:46](#msg58ff999908c00c092ab560f3)I'm trying to make a custom button with an image on it instead of the text

greggirwin

[19:56](#msg58ffa9fa8e4b63533d02e8b1)Can't do that right now. Red uses native widgets, which Rebol did not.

rebolek

[20:05](#msg58ffac1e587a245e2449d1d7)You can do custom button with image, but it's not that simple.

justjenny

[23:30](#msg58ffdc0e6aea30763d4107cb)@rebolek you have to show us how - you said it - sorry lol

## Wednesday 26th April, 2017

qtxie

[00:34](#msg58ffeaf98fcce56b2038a333)I remember we can set a list of images in the button's `image` facet.

```
img-1: load %pic1.jpg
img-2: load %pic2.jpg

win: make face! [
	type: 'window text: "Red Test" offset: 500x500 size: 200x200
]
win/pane: reduce [
	make face! [
		type: 'button offset: 50x50 size: 70x38
		image: reduce [img-1 img-2]
	]
]
view win
```

[00:37](#msg58ffebb512d24099359b19b9)Seems VID only support one image in the button. The code below works.

```
view [button 70x38 img-1]
```

[00:42](#msg58ffece812d24099359b1d86)\[!\[test.gif](https://files.gitter.im/red/red/gui-branch/tBpr/thumb/test.gif)](https://files.gitter.im/red/red/gui-branch/tBpr/test.gif)

greggirwin

[03:02](#msg59000dca6aea30763d41b82b)Thanks @qtxie! I stand corrected.

rebolek

[09:47](#msg59006ca2cfec919272775378)If you haven't checked `text-box!` yet, you should. It is really cool, it helps me making Gritter much better app (I am certainly no designer, so be lenient :wink: ) http://i.imgur.com/dvqPYIP.png

pekr

[09:51](#msg59006d97f22385553d79ba43)Looks nice! So Redbol land finally got its rich-text area?

[09:51](#msg59006da88e4b63533d05e518)As for the scrollbar - is that your implementation? Does not look like a system one?

rebolek

[09:52](#msg59006df18bb56c2d11e40955)@pekr yes, `text-box!` is rich-text we deserve - easy to use, OS driven, so no hack like my Rich Text Dialect.

pekr

[09:53](#msg59006e0e12d24099359d130c)If the screenshot would be a bit prettier, Doc could tweet it :-) But it contains "private chat", user names, etc.

rebolek

[09:53](#msg59006e2108c00c092ab8c55e)Scrollbar is my implementation, yes.

pekr

[09:53](#msg59006e318bb56c2d11e40a40)@rebolek is `text-box` in the mainline, or in some other branch?

rebolek

[09:54](#msg59006e38d32c6f2f0940a427)mainline

pekr

[09:54](#msg59006e5508c00c092ab8c61a)Cool - how is that used. It is not a dialect, you say? Any short code example?

rebolek

[09:54](#msg59006e5a8fcce56b203a9d1a)That's why I am advertising it :) It is mainline but I guess not a lot of people know about it.

[09:55](#msg59006ea7587a245e244cdecd)@pekr The screenshot is current state of affairs, the left column is going to be reworked using `text-box!` also. THEN it will be worth of tweeting :)

[09:56](#msg59006ec08e4b63533d05e92a)For examples, see this great docs by @qtxie - https://github.com/qtxie/red/wiki/Text-box!-Usage

[09:57](#msg59006efa12d24099359d1718)It is very easy, you just supply `text-box!` object instead of string to `text` in Draw block (and you need to set `Direct2D` flag for the face).

pekr

[09:58](#msg59006f4a587a245e244ce199)So it needs Direct2D? Is there a fall-back for WinXP or so? Well, not that I care much for the Win XP anymore :-)

[09:59](#msg59006f82f22385553d79c457)I knew it was in development, did not know it is already available. This one went silent, needs some promo, so go ahead. You can also post in the FB group, would get lots of likes imo :-)

rebolek

[10:00](#msg59006fbb6aea30763d4346ca)@pekr @qtxie told me that fallback version could be done, but it would be slower. Anyway, I think that macOS/Linux should be higher priority than XP ;)

[10:03](#msg5900705f8e4b63533d05f254)@pekr it is available, but not finished, also my screenshot is just a WIP, I certainly will brag about it when it looks better ;)

Oldes

[11:23](#msg5900834d08c00c092ab92835)Cool, but what if you want to select and copy the text?

rebolek

[11:26](#msg590083d4f22385553d7a1f7f)It is possible, `text-box` has inbuild `offset?` and `index?` functions to convert mouse position to text position.

Oldes

[11:26](#msg590083f012d24099359d71df)It would be nice to have some example too.

rebolek

[11:26](#msg590083f2f22385553d7a202b)Also, text and styles are separated, so copying text is easy.

[11:27](#msg590084108e4b63533d0648b5)@Oldes I want to write some, but I am still learning to use it myself :)

qtxie

[11:40](#msg59008744881b89e1018946ed)@Oldes The `text-box` is a graphic object, not a rich-text editor. We can build a rich-text editor using it.

[11:43](#msg590087ca881b89e101894a44)FYI, we have functions for \[read/write OS clipboard](https://github.com/red/red/blob/master/environment/routines.red#L102) since a while. :smile:

greggirwin

[12:57](#msg59009925881b89e10189a2c4)Fantastic @rebolek ! It's hard to keep up with features. And thanks for the reminder about clipboard @qtxie.

Oldes

[13:55](#msg5900a6dd8bb56c2d11e522e8)@qtxie I know... looking forward to use `rich-text-area` ;-)

## Thursday 27th April, 2017

planetsizecpu

[06:57](#msg5901967212d2409935a21387)@qtxie Thx! I was waiting for clipboard funcs :clap:

[07:02](#msg59019784cfec9192727c6dd3)@rebolek looks well, good job!

rebolek

[07:06](#msg59019877d32c6f2f09457f6b)Thanks guys.

asampal

[08:12](#msg5901a800dddd87f332d3ae7d)@qtxie , the last examples for text-box produce some errors for me - maybe you've made some recent changes that weren't accounted for. Look great, though!

qtxie

[08:22](#msg5901aa42d32c6f2f0945d209)@asampal What error you got?

asampal

[08:23](#msg5901aa967b553c707c52b8f9)

```
*** Script Error: ... has no value
*** Where: layout
```

[08:26](#msg5901ab21d7ab15e817259c1d)@qtxie ^

pekr

[08:26](#msg5901ab3a587a245e245267f1)A code example?

qtxie

[08:28](#msg5901ab9f08c00c092abe1948)Hmm, strange error. Looks like the comment line being interpreted. There is a `...` in the comment.

[08:33](#msg5901acbef22385553d7f4a15)It works fine on my Mac VM and Win 7.

asampal

[08:33](#msg5901ace7c4ac989f3cb8e75a)I'm using Windows 10

[08:34](#msg5901acffdddd87f332d3aeab)@pekr , yes, examples 4 and 5 give me that error

## Sunday 30th April, 2017

GiuseppeChillemi

[18:23](#msg59062b84881b89e1019ea653)Hi, is the TEXT-TABLE being developed ?

## Monday 1st May, 2017

greggirwin

[02:53](#msg5906a3228e4b63533d1d6c9d)Not yet, AFAIK. You can see most targets on https://trello.com/b/FlQ6pzdB/red-tasks-overview

luce80

[08:34](#msg5906f318f22385553d9265ed)I want to drag a face but only vertically and this does not work:

```
view [
	panel 400x600 [
		button 160x100 loose
			on-drag-start [face/extra: face/offset/x]
			on-drag [
				print ["x" face/offset/x face/extra]
				if face/offset/x <> face/extra [
					print face/offset/x: face/extra
				]
			]
	]
]
```

any hint?

dockimbel

[08:48](#msg5906f66208c00c092ad13ef3)@luce80 It "works" here, just that the face becomes invisible during the dragging, because of too many refreshes happening. Turn auto refreshing off using `system/view/auto-sync?: off` and it will display correctly while dragging. @qtxie Could we avoid those extra refreshes in auto-sync mode?

pekr

[08:53](#msg5906f79ed32c6f2f0958a8bc)@dockimbel I tried above example, just cleared the `on-drag`content and added some print statements. While printing a `face`object works, I can't get `event`output?

```
view [
    panel 400x600 [
        button 160x100 loose
            on-drag [
               print mold face
               print mold event
            ]
    ]
]
```

[08:55](#msg5906f7e6d32c6f2f0958a97a)But `event`seems to be "live", as printing `event/type`get `over`printed ....

luce80

[09:26](#msg5906ff42c1d3b501543950a3)@dockimbel thank a lot !

greggirwin

[15:37](#msg5907562cd32c6f2f095a22bc)@pekr, it looks like `event` isn't set up to `form/mold` its details yet. There isn't a lot you can do with them yet, just compare for equality (handy for event stream compression). And access the field values of course.

pekr

[15:48](#msg590758cbedf919574a67abc5)Thanks, makes sense then :-)

asampal

[20:04](#msg590794bedddd87f332d3e01a):point\_up: \[April 27, 2017 4:28 AM](https://gitter.im/red/red/gui-branch?at=5901ab9f08c00c092abe1948) @qtxie , I forgot to mention that in both the examples, the windows show, as intended. In example 4, the error displays in the console when you press the "Info" button, while in example 5 the error shows as soon as the example runs.

qtxie

[23:42](#msg5907c7d38e4b63533d21b99a)@asampal I don't get any errors in my tests (Win 7, Win 10 and macOS). Are you using the latest version of Red?

[23:42](#msg5907c7f26aea30763d5f10c5)I use this one: `red-01may17-a8be796.exe`

## Tuesday 2nd May, 2017

asampal

[01:37](#msg5907e2bf7b553c707c52ee23)@qtxie , yeah, I always get latest sources and build the gui console myself. I got the prebuilt one from the Red site to double-check and see the same behaviour. Just to make sure we're doing the same thing, I copy the `text-box!` definition from the examples page and paste it into the gui console. No error yet. I then copy the the text for example 4, paste it into the console, get a window, click the "Info" button and see the error in the console.

[01:38](#msg5907e314e3700b1461ca1d03)With example 5, I copy the text for the example and paste it, get the window, and see that an error was emitted in the console , the same error as for example 4.

qtxie

[01:38](#msg5907e32cf22385553d961479)@asampal Ah, I know. You don't need to copy the `text-box!` definition into the console. It's already in the red runtime.

asampal

[01:39](#msg5907e33fdddd87f332d3e368)ah, OK - didn't think it was in yet

[01:40](#msg5907e3797b553c707c52ee29)thanks, and sorry for the noise

qtxie

[01:41](#msg5907e3d28e4b63533d2219b1)OK. Problem solved. :smile:

## Wednesday 3th May, 2017

luis-rj

[05:39](#msg59096cfff22385553d9c71f2)Is't possible to save/load graphics objects in order to show it later ?

[05:39](#msg59096d2a881b89e101ab0193)(pane objects)

meijeru

[06:23](#msg5909775dedf919574a7068d2)``to image! or to-image will do that, if is a facei.e. an object derived from face!. rebolek 07:15I have on-key actor in VID and I want to do special handling of some keys, like TAB. That's possible, but the TAB is then added to face/text and I want to prevent it. How can I do it? endo64 08:37Hi @rebolek here how you can do that: win: layout [area "test" 200 red on-key [print "key press"] ] win/actors: make object! [on-key: func [f e] [? e/key if e/key = tab [return probe 'stop] ]] view win This will prevent tab key event on textarea. rebolek 08:38@endo64 stop is it, thanks! I was trying false or none :) endo64 08:39https://doc.red-lang.org/en/view.html#_actors 'stop : exit the event loop. 'done : stops the event from flowing to the next face. rebolek 08:43Setting cursor position in area isn't possible yet, is it? qtxie 08:53@rebolek You mean caret ? rebolek 08:57@qtxie yes qtxie 09:46@rebolek Not yet. I just check on Windows. There is a hack way to set it with character position. dockimbel 09:54@endo64 It should be 'done, 'stop is supposed to exit the whole event loop. It doesn't seems to work as expected, or maybe the doc is not up to date. endo64 11:10I tried 'done first but it didn't work as expected. maximvl 12:39few GUI demos one line away, can be useful for demonstration and as a starting point: do read https://raw.githubusercontent.com/greggirwin/7guis/master/Red/launcher.red greggirwin 16:49@maximvl, should we add a View Source feature? asampal 21:58@pekr IIRC you build the gui-console from source, like I do 21:59what's the command-line you use? 22:03since a little while ago, I get an error dialog before compilation happens: http://imgur.com/a/W5U8G 22:04After OK'ing that, the gui-console seems to compile fine 22:05I drag a script containing the following onto an R2 executable to do the compilation: Rebol [] do/args %red.r "-t Windows %environment/console/gui-console.red" 22:06I'm running Windows 10, btw Thursday 4th May, 2017 rebolek 05:07@asampal IMO you need to add -r: do/args %red.r "-r -t Windows %environment/console/gui-console.red" asampal 07:51@rebolek , I tried - same error dialog pops up even with "-r". Also, the resulting executable comes out the same. rebolek 07:57@asampal Oh sorry, I missed the error dialog (it was before morning tea :) ). I am not sure what is causing the error, I've never experienced it. asampal 07:58I'm also not sure if there is a difference between using "-r" with "-t Windows" or not - maybe I'm just not seeing it. rebolek 08:00-r is needed when compiling console, to recompile libRed also. -t Windows makes sure it is Windows and not DOS program (i.e. that print outputs to Red window and not to DOS console). asampal 08:17@rebolek , like I said, I get the same result with or without "-r", if I use "-t" iArnold 08:36> @rebolek , like I said, I get the same result with or without "-r", if I use "-t" I think that is because -t triggers a target platform compilation, lidRed is useful only on home target. Friday 5th May, 2017 swthornton 22:34Hi, how would I add an image to a button and align the text below the image - thanks 22:39Ignore last request - found example above :smile: Saturday 6th May, 2017 luce80 14:04I tried the example 4 in https://github.com/qtxie/red/wiki/Text-box!-Usage and after the window is opened if I put the window below another window and then on top again, the background of the striked "abc" disappears ! I am using latest 0.6.2 Friday 12nd May, 2017 pekr 08:44@asampal I have no problem compiling from sources under Win10, R2 2.7.8 here. I usually use rc "-t Windows %environment/console/gui-console.red", after I start a shortcut, which brings me to R2 console, doing %red.r upfront .... 08:45Now I have tried to launch the console manually, changing to particular dir, using the above suggested do/args aproach - works here too Sunday 14th May, 2017 justjenny 22:47I can tell without doubt, a -t windows compile is also a release mode compile - I spent some time trying to understand this. If you use -t windows you dont need -r - I think Arnold has got it right. Monday 15th May, 2017 geekyi 00:19And to remove any further doubt whatsoever: https://github.com/red/red/blob/master/red.r#L701 00:20 opts/dev-mode?: no ;-- forces release mode Forces release mode if -t dockimbel 01:43@justjenny The -t currently forces the release mode, though I think it should be relaxed for targets which are on the same OS. rebolek 17:14Here's a simple tool to illustrate some aspect of Red/View. Click on boxes with white text, get value over 10 to kickstart rate: https://gist.github.com/rebolek/6f8475bdc0890eaae8ffbebf47c02ecc maximvl 17:57@rebolek please don't forget to fill the header so your scripts can be put into community repo :+1: greggirwin 18:06Really nice Bolek. I'm going to have to analyze that when I have time. 18:07I think there's a game in there. Figure how to use N clicks to get them all to end at the same time. rebolek 18:31@maximvl Ok, will do. 18:32@greggirwin Yes, it can be a game, if we can figure out the rules ;) Wednesday 17th May, 2017 planetsizecpu 11:48@rebolek good job, stay on the line :clap: Thursday 18th May, 2017 planetsizecpu 11:10@all I'm willing to use a vertical shaped slider, is there a way? normal slider don't fit as I want. qtxie 11:47@planetsizecpu view [slider 30x100] planetsizecpu 12:00@qtxie Thx, so the orientation defines the behavior, good approach! no need modifyers :smile: I uploaded a new repo for testing [here](https://github.com/planetsizecpu/Rate-Testing/blob/master/tstrate.red) maximvl 17:59is there any way to make a tooltip? Is it a separate option or widget or something? iArnold 19:10A tooltip is very easy, I'll post one way to do it tomorrow. Friday 19th May, 2017 dockimbel 04:09@maximvl Not builtin yet, though it's trivial to implement by yourself. Just define an extra face which will be visible when a field has the focus, and invisible when loosing focus. iArnold 06:28@maximvl Tooltip example uploaded as promised. luis-rj 20:14@iArnold Where has your example been uploaded? iArnold 20:21@luis-rj I pm'ed you the link. luis-rj 20:22Thanks ! Thursday 1st June, 2017 planetsizecpu 08:30@qtxie This morning I found that a 'loose' image can resize out of bounds of the red window, I'm not sure if it is normal or not, thus, is better to inform the team so you can check. 08:31[![scr.jpg](https://files.gitter.im/red/red/gui-branch/aDpi/thumb/scr.jpg)](https://files.gitter.im/red/red/gui-branch/aDpi/scr.jpg) rebolek 08:31That's certainly a bug. I thought it was fixed already. planetsizecpu 08:33@rebolek may be, but a lovely bug, I like this effect if it is desired :smile: rebolek 08:34@planetsizecpu I understand that sometimes it may be desired, but it's pretty annoying in other situations :) iArnold 08:41I also thought this was fixed. I used it to create a splashscreen, so I was not happy with the fix, but the content of the window should stay inside, else things become very messy. I will welcome some special way to handle this feature. pekr 08:45Wow, what a nice bug. Imagine upon some event (e.g. a button press), your UI elements leave Red window and go and hide in other apps, so you have to chase them and bring the back home :-) planetsizecpu 08:49I just was playing a little with this line to test resizing: z: [b: base 800x600 gray at 10x10 i: image 300x300 myimg loose button "RSZ +" on-click [i/size: i/size + 30] button "RSZ -" on-click [i/size: i/size - 30]] luce80 12:53Is there a way to paste one or many images inside another image ? geekyi 12:54@luce80 draw over a base you mean? 12:55You can recursively do to-image a pane as well I guess.. 12:56@planetsizecpu not anymore I guess? (within window bounds for me if unclear, 28 May build ) 12:56[![image.png](https://files.gitter.im/red/red/gui-branch/sSU6/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/sSU6/image.png) 12:57Inception :p ( I replaced 'myimg with link to your screenshot) 12:58@geekyi also notices @planetsizecpu is on Windows 7, unlike himself who is on win 10 luce80 13:04@geekyi I want to repeatedly do to-image of some faces and paste them inside an image! . It's the "pasting" that I do not know how to do. rebolek 13:06@luce80 you mean something like: view [t: text "abcd" i: image 100x100 button "to image" [i/image: to image! t]] ? 13:07Or more like view l: layout [t: text "abcd" i: image 200x100 button "to image" [i/image: to image! l]] luce80 13:10@rebolek your examples seem not working on: Red for Windows version 0.6.2 built 6-May-2017/15:39:32+2:00 and also : how to place an image! at a specific place inside another image! ? rebolek 13:13@luce80 My build of gui-console is about week old, maybe you should try newer version. 13:13@luce80 now I understand, you want to put an image on top of another, that's not what my example does. 13:17@luce80 you can do it in VID or in draw, here is simple VID version: view [image %back.png at 100x100 image %fore.png] 13:20Here is Draw version, that is bit longer, but let's you do to-image on the base face: back.png: load %back.png fore.png: load %fore.png view [base 200x200 draw [image back.png 0x0 200x200 image fore.png 50x50 150x150]] luce80 13:29@rebolek Yes. And since I do not know a priori the number of images, I will have to compose a block possibly updating it on-the-fly and than give it to VID or Draw. A bit complicated but I think I will try or will do it recursevily as @geekyi suggested when and if I understand how to do it ;) geekyi 13:51@luce80 the 2 ways @rebolek shows is exactly what I meant 13:52@geekyi thinks @rebolek has mind reading powers rebolek 13:55:) geekyi 13:56@geekyi notes to self http://rebol.org/view-script.r?script=appbuilder.r is really nice. Should port it qtxie 14:04@planetsizecpu Thanks. Looks like a regression. luce80 14:18@rebolek look also at http://www.rebol.org/view-script.r?script=vid-build.r ;P . Should port it. 18:16I am trying to paste an image of a face inside another image. The following code does not work. What am I doing wrong? img: make image! 10x10 draw-blk: reduce ['image img 0x0 img/size] off: 0x-20 view [ button "Add image" [ i1: to-image field-img draw-blk/2: i1 draw-blk/3: off: off + 0x20 draw-blk/4: off + i1/size draw canvas/image draw-blk show canvas ] field-img: field "abcd" return canvas: image 300x200 ] Friday 2nd June, 2017 geekyi 01:51@luce80 Interesting. The canvas/image is actually changed, but not updated. Also, if you close the window and try to view your layout again, it shows the updated changes 01:51 red img: make image! 10x10 draw-blk: reduce ['image img] lay: layout [ button "Click me" [ i1: to-image field-img draw-blk/2: i1 draw canvas/image draw-blk ;show canvas unview lay ] field-img: field "abcd" return canvas: image 30x20 ] view lay ; click button first view lay 01:52Must be a bug in updating from view engine dockimbel 01:58@qtxie ^--- qtxie 03:52@luce80 @geekyi Pushed a fix for the image issue. This code works now: img: make image! 10x10 draw-blk: reduce ['image img] lay: layout [ button "Click me" [ i1: to-image field-img draw-blk/2: i1 draw canvas/image draw-blk ] field-img: field "abcd" return canvas: image 30x20 ] view lay planetsizecpu 06:30@geekyi all ok, I tested on Red for Windows version 0.6.2 built 2-Jun-2017/8:24:54+2:00, thx! 06:49@geekyi, last comment refer to win10, now tested on win7 and still occurs, it seem related to video handling 06:49[![scr.jpg](https://files.gitter.im/red/red/gui-branch/N0Ak/thumb/scr.jpg)](https://files.gitter.im/red/red/gui-branch/N0Ak/scr.jpg) 07:00it is strange, if you move the image to the bounds without resizing, then displays well, the bug occurs if you resize the image without have reached the bounds before. qtxie 10:17@planetsizecpu Should be fixed now. luce80 11:41I already asked this. Is it possible to extend a face! object adding new facets like the with keyword in Rebol ? Since on-create does not work because that way the code is inserted in face/actors on-create func . Or is it possible to create a face! using make face! [... and then use it in VID ? rebolek 13:51@luce80 it is possible using extra 13:52 >> view [button "click" extra "something" [print face/extra]] something 13:52If you and to add more than one value, make it block!, map! or object!. luce80 14:28@rebolek It is not the same as with. Never mind now I have a more complicated problem since this gives access violation: img: make image! 10x10 draw-blk: reduce ['image img 0x0 img/size] off: 0x-20 system/view/VID/styles/il: [ default-actor: on-down template: [ type: 'base size: 100x100 iterated-face: make face! [type: 'text offset: 0x0 size: 100x20 text: "abc" ] ] init: [unless face/image [face/image: make image! face/size]] ] call_and_draw_iters: function [ face [object!] image [image!] ][ index: 1 while [index < 9 ] [ index: index + 1 itering: canvas/iterated-face itering/data: index itering/offset/y: index - 1 * 20 itering/text: form itering/offset i1: to-image itering ; *** Runtime Error 1: access violation draw-blk/2: i1 draw-blk/3: itering/offset draw-blk/4: itering/offset + itering/size draw canvas/image draw-blk ] image ] view [ button "Add image" [ i1: to-image field-img draw-blk/2: i1 draw-blk/3: off: off + 0x20 draw-blk/4: off + i1/size draw canvas/image draw-blk show canvas ] field-img: field "abcd" return canvas: il 300x200 do [call_and_draw_iters canvas img] ] If you comment the "do [" line and press the button you will see what it should happen. dockimbel 16:48@luce80 Please open a ticket for crashes like that. Saturday 3th June, 2017 luce80 06:40I have executed script red/tests/view-test.red with Red for Windows version 0.6.2 built 2-Jun-2017/11:19:20+2:00 and the graphics inside tab panels have disappeared. dockimbel 06:45@luce80 Reproduced. ldci 06:48A lot or problems with 3-jun master branch.I'm testing... dockimbel 06:55The latest commits contain an experimental GUI rules engine for post-processing GUIs produced by VID. 07:04Found the commit which caused the regression, it's from 30-May. 07:18@luce80 @ldci Can you tell me if the fix I just pushed, solves the regression(s)? 07:20Seems to be ok on Windows, but unstable on macOS... luce80 07:36@dockimbel I am on Win 7, in Red for Windows version 0.6.2 built 6-May-2017/15:39:32+2:00 the background color was grey/transparent, now the elements inside tab panels are visible again but the background is white. dockimbel 09:02@luce80 Background should be white, it had a wrong color before, it's fixed now. You can change the panel's color to any one you want. The color used before for panels inside tab-panels is system/view/metrics/colors/panel. ldci 10:28@dockimbel regression with 3-jun version. Compilation with -c option gives error messages *** Compilation Error: undefined symbol: IMAGE_WIDTH or Compilation Error: invalid path value: OS-image/lock-bitmap . Images are correctly loaded and the first call to any RedCV operator is correct. But if I call another RedCV operator on the same loaded image, there is no update of the image. 10:28BTW, on macOS :) 10:33@dockimbel : simple test of draw on image -> crash: Jun 3 12:30:43 DrawOnImage[20042] : CGBitmapContextGetWidth: invalid context 0x0. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable. and *** Runtime Error 1: access violation *** at: 00046EAEh` Sunday 4th June, 2017 ldci 06:58@dockimbel OK, no more crash but draw doesn't work Monday 5th June, 2017 qtxie 01:46@ldci The bitmap (Quartz 2D) on macOS is using PARGB (Pre-multiplied ARGB) format, while on Window (GDI+) it's ARGB. The issue is we cannot use ARGB format on Quartz 2D. So I'm thinking change the internal format to PARGB on all platform. What do you think? ldci 10:18@qtxie Thanks a lot for your response. May be it is a good idea to change to PARGB on all platforms, but I suppose this is an important change. This change will help also for android. Regards qtxie 10:26@ldci Thanks. I'll try another implementation on macOS, which will give us ARGB data. Though it maybe a bit slow. Oldes 10:43I would prefer faster solution even if it would require preprocessed assets, so maybe trying to use PARGB on windows. ldci 11:47@qtxie As far I remember, GDI+ allows the use PixelFormat32bppPARGB under Windows. May be I'm wrong :) qtxie 15:14@ldci Yes. GDI+ support it. 15:21I'm reading the macOS's Core Image documents. It says most image processing algorithms expect RGBA data and its filter use premultiplied RGBA data as default. I have no experience in image processing before, so I'm not sure which one should be used in Red. ldci 15:41@qtxie OK I'll read doc about core image on macOS greggirwin 16:43If it's changed to PARGB, will this break compatibility with older OS versions (i.e. Windows)? I'm not familiar with PARGB, so just read up a bit. It sounds like a win overall, but we may then need some new logic for conversion of ARGB asssets, correct? The appealing thing to me are simplicity and correctness with PARGB when blending. Performance benefits are always nice, but I don't know what our cost is in terms of compatibility. fergus4 21:39@dockimbel > The latest commits contain an experimental GUI rules engine for post-processing GUIs produced by VID. What exactly is a rules engine? greggirwin 21:54Nenad will be able to say more about it, but it will let you define rules that can be applied based on system metrics or themes, corporate or brand standards, etc., without having to define styles. I can also enforce UI consistency by case-altering text, ensuring the OK button is always to the left of the Cancel button in dialogs, and stuff like that. The underlying processing function can also be used for resizing. 21:57I don't know the details of the rule engine, but here's a resizing example using foreach-face: win: layout [ across button field return button field return button field return ] rows: 3 win/actors: object [ on-resizing: function [face [object!] event [event!]][ w: face foreach-face/with win [face/size/x: w/size/x - face/offset/x - 10] [face/type = 'field] y: w/size/y / rows i: 0 foreach-face win [ face/size/y: y - 10 face/offset/y: y * (i / 2) + 5 i: i + 1 ] ] ] view/flags win [resize] 22:01It's not much of a stretch to imagine the rules engine allowing you to map attributes to rules, whether it's a facet, style, or extra data. e.g. add-rule [type = 'field] :fill-right, where fill-right is a function that stretches the face to the right edge of its parent, based on system metrics. 22:03Note, that since it's not official yet, the above may break before the design is locked. Tuesday 6th June, 2017 qtxie 02:12@greggirwin GDI+ support PARGB color. greggirwin 02:47So Windows XP+, which should be fine I think. dockimbel 02:54Pre-multipled formats have an intrinsic flaw: the RGB colors are not accurate anymore, and doing image processing becomes costly as the colors components need to be recalculated first, then after the processing pre-multiplied again. PARGB would kill performances of image processing from user code (including the upcoming image effect pipeline). greggirwin 02:56Rats. The bits I read said it was *better* for blending, but didn't note color accuracy issues. dockimbel 03:01The question is: do we want performance or accuracy? If you set a pixel's RGB color to FF8020h and get back on reading FE7F20h, is that okay? qtxie 03:27I just checked macOS [Core Image](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_advanced_concepts/ci.advanced_concepts.html#//apple_ref/doc/uid/TP30001185-CH9-SW1), Windows [Win2D](https://microsoft.github.io/Win2D/html/PremultipliedAlpha.htm) and [Android](https://plus.google.com/+ChetHaase/posts/ef6Deey6xKA). All of them use pre-multiplied colors internally. > Win2D uses straight alpha in its API surface, but premultiplied alpha for internal rendering operations. The pixel values stored in a bitmap or rendertarget, and the drawing or blending operations that operate on these surfaces, use premultiplied alpha. When bitmaps are loaded from a file their contents are automatically converted into premultiplied format. > Skia, Android's 2D rendering library, works only with pre-multiplied colors. For this reason, libhwui, Android's hardware accelerated 2D rendering pipeline, also works only with pre-multiplied colors. Note that pre-multiplication is also the only bitmap loading operation that you do not have control over: it always happens (this can be an issue and we'll see why below.) 03:39The get-pixel and set-pixel API in Android will do the conversion for the user, while Win2D's not. greggirwin 03:44Color perception versus color data accuracy isn't something I've thought about. Assuming you can control the alpha, you could set it to 1 to maintain accuracy, yes? Designers who need Pantone accuracy may balk, but it seems like ease of portability and consistent behavior are good priorities. 03:46The effect pipeline may be the topper though. pekr 03:47What kind of portability are we talking about here? Red code is portable for its users anyway. Don't understand the purpose, why particular OSes decided to go that route, but it seem crazy that setting particular color, one does not get exactly the same pixel value. I wonder how they do precise stuff for SWs like Lightroom etc, where ppl are pixel peeping and compare various egnines and their output, etc. qtxie 03:48But I'm doubt PARGB would kill the performances. From what I read, The image effect pipeline provided by those platforms are expect pre-multiplied colors. dockimbel 04:46Just to illustrate the accuracy issue: https://stackoverflow.com/questions/38966053/accurately-convert-from-straight-alpha-to-premultiplied-alpha-and-back Thursday 8th June, 2017 greggirwin 19:52The mention of the effect pipeline reminded me of this: - http://www.rebol.com/article/0236.html - http://www.rebol.com/view/demos/convolve.r While I think the main pipeline effects I relied on were fit and extend (ChrisRG used extend really well with small PNGs in his GUI designs), blur effects are very popular now too. I think the only place I provided effect control in a tool was in an IOS skin maker I made long ago. Saturday 10th June, 2017 ldci 09:30@greggirwin convolution is done in RedCV greggirwin 12:38Nice François! I see a number of things in there that could be generally included in Red's effect pipeline, perhaps. ldci 13:00@greggirwin Please, feel free to collaborate on this project! I'll appreciate help :) dockimbel 14:49@greggirwin I plan to write the effect pipeline reusing as many effects from RedCV as possible. geekyi 15:38@pekr > I wonder how they do precise stuff for SWs like Lightroom etc, where ppl are pixel peeping and compare various egnines and their output, etc. I don't know specifically about those. There could be various ways to workaround it. But in general, I think they'd use their own datatypes and algorithms for both lossless (arbitrary precision math); and lossy but more accurate representations (16bit vs normal 8bit rgb) Could also avoid color conversions except at the last pass. Best thing to do is like you do for datatypes in general and not convert unless you really need it? ;) 15:44But I think it's just different use cases here, accuracy vs performance. In order: 1. scientific computing (satellite images, matlab, high accuracy), 2. movies, rendering and animation (lightroom, game engine textures?, approximation, being real enough to fool the eye), 3. gui and realtime rendering (game engines, skia, opengl, etc, for performance) greggirwin 18:05@ldci and @dockimbel, that's great! Leverage what is there and I will stay out of the way. Gerard posted a link to Dwitter, which I think we've seen. I haven't dug in, but it may be something we could build as a demo app, if it's mainly a timer and a user defined draw block. luce80 18:28How can I access a vid face by name from outside of the view [...] block ? Where are "stored" those names? Sunday 11st June, 2017 dockimbel 01:42@luce80 There are just words, so you access them the same way as any other word. By default, they are bound to global context, but you can bind them to an object if required. Monday 12nd June, 2017 endo64 06:25@luce80 Just like using a set-word! >> view [my-face: text "test"] print my-face/text test Oldes 15:10Is it possible to have something like panel with automatic sliders if content is bigger that panel's size? Of course without need to code the sliders myself. dockimbel 15:17@Oldes Should be available in 0.6.4, along with scroller widget. rebolek 15:55@Oldes I wrote (custom) slider for Gritter, if you are interested, you can use it. luce80 17:38@endo64 Red [Needs: View] view [my-face: text "test"] dump-face my-face In the console it works but compiling it: E:\Programmi\Prog\Rebol\Others\Red\local>E:/Programmi/Prog/Rebol/Others/Red/red.exe -c e:\Programmi\Prog\Rebol \Others\Red\local\many-to-images.red -=== Red Compiler 0.6.2 ===- Compiling e:\Programmi\Prog\Rebol\Others\Red\local\many-to-images.red ... ...using libRedRT built on 10-Jun-2017/19:17:13+2:00 *** Compilation Error: undefined word my-face *** in file: e:\Programmi\Prog\Rebol\Others\Red\local\many-to-images.red *** near: [my-face] Oldes 17:43@luce80 using directly without compiling in gui-console: --== Red 0.6.2 ==-- Type HELP for starting information. >> view [my-face: text "test"] dump-face my-face Style: text Offset: 10x10 Size: 80x25 Text: "test" == make object! [ type: 'text offset: 10x10 size: 80x25 text: "test" image: none ... >> 17:45If you want to compile it, you can try to add my-face: none before view as the compiler probably don't see the definition inside the block. There is also some switch to turn off the strict checking, but don't remember how to use it. luce80 18:03@Oldes Ok. But now I have to pay extra attention when I compile code or take the habit to "initialize" the faces I want to reference or simply remeber this "trick". greggirwin 19:08@luce80, yes, for now. The compiler will improve over time, but this is one area you still need to help it out a bit. geekyi 20:48@luce80 especially in dialects! I use the pattern: lay: layout [my-face: ... ] dump-face lay Thursday 15th June, 2017 pekr 06:32Just a question. I can see a recent comming, claiming "Disabled face still receives a mouse events" .... my quesiton is -should not it do so? I can imagine case, when you want to click disabled button or field and such action would be reflected by some visual representation? Not necessariyl though, maybe it does not make sense ... rebolek 06:33on-disabled ? pekr 06:39ok, if such event type is there, then all is good :-) rebolek 06:43Probably not, that is just an idea :) 06:43But when I think of it, flag would be better probably. Tuesday 20th June, 2017 luce80 18:30If I "run" the code below it gives right result but if I compile it it returns the "molded" function ?! system/view/VID/styles/it: [ default-actor: on-down template: [ type: 'base size: 100x100 test-face: none test-func: func [face index] [ ?? index 0 ] ] init: [unless face/image [face/image: make image! face/size]] ] canvas: none button-img: none view/no-wait layout [ button-img: button "abcd" canvas: it 300x190 ] print "Probing..." probe canvas/test-func canvas/test-face: button-img 1 do-events Oldes 19:37Is there any example (if already possible) how to handle dropping any file into Red window, which could be opened and processed instead of classic open file menu? 19:48btw... I'm not able to run tests/view-test.red compiled and when I run it interpreted, I see just a top menu.. is it just me? Windows10. 19:57hm.. no import of DragQueryFile from windows api found, so not supported yet. GiuseppeChillemi 20:06How far will be the iOS Version from the Android one ? Oldes 20:40@dockimbel I'm able to modify Red source to catch WM_DROPFILES message in WndProc in event.reds file... what I should do to create some on-drop-file action? 20:47hm.. maybe better to catch it in process and call make-event than... I will try it tomorrow. greggirwin 23:43I don't know for Red Oldes. In R2 I used system port to do it, but that old code won't help here. 23:45@luce80: https://github.com/red/red/wiki/Guru-Meditations#red-compiler-and-dialects Wednesday 21st June, 2017 dockimbel 04:20@luce80 You need to call the function using do in compiled code, as there is no way the compiler can guess that canvas/test-func is a function call (the compiler can't even guess canvas is an object in such case): probe do [canvas/test-func canvas/test-face: button-img 1] 04:21@Oldes Just have a look at how other events are defined. 04:22For file drag'n drop support, we may want to use the future system port also for that, we haven't decided yet on the best way to handle it. luce80 18:32@dockimbel Sorry but I think it will take me some time to catch the differences between the interpreter and the compiler. In my mind since I can switch between the two and most of the time the effect is the same, it should work always. But can you explain me why do does the trick ? rebolek 18:39do runs the code in the interpreter greggirwin 23:26It's early days for the compiler, so it can't handle everything yet. Thursday 22nd June, 2017 dockimbel 03:08@luce80 Compiler cannot guess a function call if the function is defined at runtime only, and in a non-obvious way (not defined in a code branch, like in your case above, where you define it in a block). The compiler can only walk through code branches from root of code, all data structures are black boxes for it. 03:16Though, they are several workarounds for that, which will be implemented in future versions. ldci 09:35 RedCV updates (https://github.com/ldci/redCV) and (http://redlcv.blogspot.fr) with a lot of new samples. qtxie 09:56Congrat! 🎉 ldci 12:04@qtxie thanks for your job about image! under macOS✌️ greggirwin 19:45Nice @ldci! Friday 23th June, 2017 mikeparr 14:39I'm writing some Red-By-Example material for beginners about the GUI widgets, and have some questions on style etc. There is a fragment below. Q1: I don't need to import Vid, yes? Q2: I assume there is no naming convention. E.g. I can choose button1, do-calc, or b1. (Though I have a personal preference for e.g button-do-calc.) Q3: I prefer to separate the event-handling code from the GUI layout, using functions - OK? (As I do below). Q4: Some Red samples involve 'actor' for events. Is my simple way OK for most circumstances? Red ["Vid? Naming?, event-style?"] ;;;;Event-handling functions ;;; button1-clicked: function [] [ print "You clicked button 1!" ] check1-changed: function [] [ print "You clicked check1!" ] ;;;;GUI Design ;;; view [ button1: button "Click me" [button1-clicked] area1: area white font [ name: "Consolas" size: 12 color: black] {some Text in an area} 180x70 on-change [print "area1 changed"] check1: check "Check me" [check1-changed ] ] iArnold 14:51Q1 not if you DO the script from a gui-console, then that already has the view included. But if you plan to compile the program, you will need the needs: view line. mikeparr 15:05@iArnold It compiles and runs without the 'needs', but my code is in the same folder as the Red interpreter. iArnold 15:50Perhaps a change was made to alleviate the requirement. greggirwin 16:50@mikeparr, good questions. 1) You don't need needs: view in the header if you're running interpreted with a View version of Red. You *do* need it when compiling, either to run with libRedRT or in release mode. 2) Correct. There is no standard naming convention today. For demos like yours, it's fine to name things generically and include the action in the name. It's helpful in that context, to see what connects to what. In a real app, it's generally nicer to give things meaningful names related to the intent. 3) Of course. I often use does for UI commands that don't take any params. 4) Yes, that's fine. I generally treat them like default actors, deciding when to break them out into funcs based on size and context. *BUT*, this does raise a really *great* thing we should put in a style guide. It may be subject to local language rules, but the *order* of adjectives, (facets) in this case, can help understanding. - http://dictionary.cambridge.org/grammar/british-grammar/about-adjectives-and-adverbs/adjectives-order - http://www.gingersoftware.com/content/grammar-rules/adjectives/order-of-adjectives/ mikeparr 17:48@greggirwin Thanks - very useful! Sunday 25th June, 2017 Oldes 13:59@dockimbel I'm diving into drop-files event.. so far I'm able to have in make-event: EVT_DROP_FILES [ count: DragQueryFile msg/wParam FFFFFFFFh null 0 print-line ["Drop-Files number: " count] ] and to get file names would be easy, but what I should do to be able use such a new event from View app? Should it be some global handler or per face event? 14:31Looks I must write routine to get the files block from the event, right? Any idea how I should name it? 14:33So far I'm able to write: insert-event-func [ if event/type = 'drop-files [ ;do something with the drop-file event here... ] ] And I must add on-drop-files into evt-names table so it could be processed per face. 14:35One more question... can I use gui-evt/flags to pass the files count dropped? 14:43Ah... I found datatypes/event.reds eval-path ... so I have no questions now... just will have to stop for a while... ;-) dockimbel 14:44@Oldes Keep in mind that View is a cross-platform engine, so such feature needs to be implemented on macOS too, and features should be the same (extra minor platform-specific features could be accepted if they can be abstracted properly in the engine). Oldes 14:46I'm far from calling myself as a macOS coder, but should I limit myself to implement something for Windows when I'm so close? 14:47My goal will be, that I could catch drop-files event and using event/files get block of file names. 14:47Such an event will not be fired on mac until someone will not make the same. dockimbel 14:48@Oldes Have you checked if such feature is supported on macOS and GTK? Oldes 14:48I would be very surprised if such a basic thing would not be supported. dockimbel 14:48Knowing is better than guessing, at least if you plan to submit that as a PR. Oldes 14:49Especially on mac where you can screw up many things with simple drag and drop 14:50I'm not on mac now, but anybody can try to open any text editor on it and drop some file on its window dockimbel 14:50Drag's drop support might involve more than just dragging icons from Desktop to windows. What about inter-windows face dragging? Is that supported on main OSes? What about dragging a face from a window to the Desktop? What about handling the cursor changes when moving the dragged object around?... If such features are supported on main OSes, maybe the drag'n drop support needs to be designed to account for that. 14:51I'm just saying that in case you want to make a PR for it, if it's just for you, ignore my comments. Oldes 14:55Should I fork Red just because I don't know how to code files dropping on macOS? 14:57Also I'm not mixing drop-files with drag and drop, which has own events. dockimbel 16:12@Oldes Forking Red to add custom features (until they get implemented, if ever) for personal needs is fine, Github makes that easy. We have a cross-platform GUI engine and cross-platform runtime, adding feature only for one platform breaks the cross-platform support, that is not something we want, as that creates more issues for us (and other users too) than it helps. Oldes 17:10@dockimbel honestly... I think that personal forks of programming languages is not good, but I don't want to make such a conversations... better be focused on real work... should I use existing event/picked or create a new word and have event/files? 17:20I'm choosing the first one to reduce code. qtxie 23:43@Oldes I think what Nenad means is if we want to add a feature into Red, we should check if it can be implemented on main OSes. We can just read the documents to confirm it, no need to implemented on all platforms. So when we implementing it on one platform, we can avoid to use some platform-specific functions (which cannot be implemented on the other platforms, or very difficult to be implemented). When we make a PR, If we can explain a bit the code(Algorithm, design choice, etc), provide documents and some code examples, the PR will be processed much more quickly. Even better, if we can provide a list of resources about how to implement it on the other platforms (What API to be used, links of documents). If we just submit the code, then the Red team need to read all the code to understand it, check on the other platforms to be sure it can be done with current limited resource. It will cost lots of time, that's what Nened want to avoid. greggirwin 23:52It's a nice features for Windows, and would be great as an example in the community repo. Maybe others will jump in for MacOS and it could become standard. 23:54It will be good to have a model for how to support OS-specific features, where they don't make sense to be part of the core. Monday 26th June, 2017 dockimbel 01:32I'm all for having Desktop drag'n drop support, it just that it requires studying the API for that on all platform we want to support, so we can check if it's available and what features are common to all platforms. Starting implementing before doing such study will lead to issues, the first one being that an eventual PR for that will not be merged until we get a chance to do such study. Oldes 06:18@qtxie I'm not just submitting a code. I wanted to learn how to make a new event type. I had many questions and... ehm... I've got just advice to read the code... and advice not to try do anything as it is very possible that my code will not be merged. But it is ok. I can even try to read your macOS code to learn how it could be done. Or do something completely different. 06:31Here is drag & drop tutorial for macOS. Looks much more complicated. https://www.raywenderlich.com/136272/drag-and-drop-tutorial-for-macos 07:05And here is windows version described https://www.codeproject.com/Articles/840/How-to-Implement-Drag-and-Drop-Between-Your-Progra 07:06I used the simple method without COM as getting list of files was what I wanted... no fancy drag&drop stuff. qtxie 08:40@Oldes You don't need to read the code on macOS, the document is enough. If both OSes can provide us the some features, then that's fine. 08:53Also I'm not specific to your PR for drag & drop. It's also a note for myself or anyone else who want to implement some features like this one. mikeparr 10:52In vid, we can place characters on-screen with either h1 to h5, or in a 'text'. I'm wondering if the more flexible way is with a text, and that h1-h5 are now downplayed? dockimbel 11:04@mikeparr Have a look at Hx styles definition: https://github.com/red/red/blob/master/modules/view/styles.red#L82 mikeparr 12:04@dockimbel - ah, thanks, I had not seen this. greggirwin 16:54@Oldes, back in my VB days I build a DnD system that seems kind like the Mac version. It was only for use in a single app, but you could declare sources and targets by type, it would change the cursor, etc. That will certainly be useful in Red, especially with touch being so important now. Doing it inter-app would be cool for building suites of tools. Tuesday 27th June, 2017 luis-rj 17:16Is It possible to change the window, panes and faces default color ? 17:34Answer my own question: view [backdrop myColor] Saturday 1st July, 2017 toomasv 21:16Once upon a time @dockimbel asked about the draw version of the red/system datatypes drawing. Voila, [here](https://github.com/toomasv/red-graphviz/blob/master/sys-types.rgv) it is: ![types](https://raw.githubusercontent.com/toomasv/red-graphviz/master/types.png) . It is a raw attempt to use [graphviz](http://www.graphviz.org/Home.php) from inside red. I wrote a simple [dot DSL](https://github.com/toomasv/red-graphviz/blob/master/dot-lang.red) for this. Elementary usage is like: gr: graph [digraph ['A -> sg ['B 'C] 'C -> 'D]] view [image gr] ... with the resulting graphviz file: digraph { A -> { B C } C -> D } ... and image: ![image](https://github.com/toomasv/red-graphviz/blob/master/simple.png?raw=true) It works by call, and needs graphviz/bin in your path. djrondon 21:26I did an implementation using r2/red as backend, rendering on the web the statistics of Supreme Court Proceedings by Minister. It was really cool. 21:34https://play.google.com/store/apps/details?id=br.jus.cnj.rsa 21:35You can install and access menu ministros 21:35Then choose the minister then you'll see a directed graph with statistics on the fly 21:36When you click at the folder you'll get the records of the proceedings 21:36Very cool and fast Sunday 2nd July, 2017 greggirwin 01:13Nice, on both counts! 01:14I love solutions under 100 lines Toomas. :^) toomasv 05:09@djrondon very nice applcation :+1: 05:21@greggirwin I narrowly fitted the bill with dot-lang.red :smile: Monday 3th July, 2017 djrondon 00:12👍 geekyi 12:24Nice! :cool: @toomasv but I wonder why you use *html* in your README.md :p toomasv 13:12@geekyi newbie things geekyi 13:13@toomasv I'll PR then ;) toomasv 13:13done already Oldes 13:24A 9214 13:32B :P Oldes 16:19C Sorry.. chatting from a pocket on mobile. Wednesday 5th July, 2017 tanstaaf1 02:07A few gui questions. Is there a checklist of gui features, widgets, etc. which are currently planned vs. implemented? Along with that question, and maybe even more important to me, how many of the old R2 view features, widgets, etc. are already existent in Red vs yet to come? In particular am I correct that rebol's "grid" widget isn't yet implemented but might be soon? I don't see it mentioned on red-lang.org. Thanks. I just found @greggirwin's article and code "Introducing REBOL with Amazingly Easy GUI Programming" from http://www.onlamp.com/pub/a/onlamp/2003/10/30/rebol.html. greggirwin 02:10@tanstaaf1, https://doc.red-lang.org/en/view.html lists what is there now. The big difference from R2, and it is *big* is that Red uses native widgets. R2 never really had a grid style, though list was close. Henrik's list-view was the best thing going there, but it's not likely that will be ported, because of the native approach. What Red includes is also constrained by what can be supported on all important platforms. It doesn't mean you won't have special widgets available, but the common, base set comes first. geekyi 04:19@geekyi notices @greggirwin had an acm.org email! greggirwin 05:38Yup. IEEE too, for many years. meijeru 06:52IMHO the RebGUI table widget was (and is) a very good "grid" widget. pekr 06:56The problem is, that you can hardly find any native cross-platform solution for more complex widgets. That will be the tough one. What I wonder more is - is GUI engine good enough to bring in custom widgets? E.g. grid, which would be kind of cross platform? The problem is, that then we are once again touching R2 kind of aproach, and you would somehow have to mimick platform specific look, without the ability to reflect user changing OS skin (which might not happen often, though) .... 07:03The other thing is more kind of philosophical point of view. Where do we go? It was just yesterday when my team mates showed me new UI for our inhouse IS. Old Rich Faces replace by Angular and modern Material design slick design. I know users will just love it. That lead me to one quesiton though - what is the preferred target for apps? On mobile, it might be native apps. But on desktop? It might be web browser. I hope, that one day, we will be able to get something like VID4web. 07:05As for native Windows itself for e.g., I am a Win10 user for quite some time. The system is kind of schizophrenic. More and more system stuff is done using so called "modern UI". I know Doc did not like it, but I love the simplistic, tablet ready look. But if I am not mistaken, it is not a Win32 subsystem, but would require completly different aproach? I just hope, tha under macOS, the situation is more clear ... 07:10Well, end of philosophical rant, now back to some practical merits. I would like to know, what is the relation of macOS to iOS? I will explain: 07:11We have got some mobile apps in our company. It is done by third parties, not prominent ones, and it costs us some money. Management asked us, if in some future, we could take over the development in house. Apps are iOS based, many tablets in the wild, we can hardly change here. 07:13So my question is - we are able to run Red Linux ARM binary under Android. While it is not an Android app per se, it is just some beginning and with the Android bridge, we are close. What is the situation between the macOS vs iOS? Can we say, that with recent macOS Red GUI, we would be able to run such an app under the iOS? In other words - haw far away are we from iOS support? I know that some bridge will have to exist too, but just curious, if we could get there in the 1-2 years timeframe? planetsizecpu 08:12@pekr +1 to VID4web :+1: 08:14I also would like to recall multi-column text-list :smile: Oldes 15:03@dockimbel I have this simplified script: Red [ needs: view ] test: func[/local main file-source][ main: layout [ file-source: h5 400x40 "open some file first" ] main/menu: [ "File" [ "Open^-F1" open --- "Exit" exit ] ] main/actors: object [ on-menu: func[ face [object!] event [event!] /local file file-lcl ][ switch event/picked [ exit [unview/all] open [ file: request-file/filter [ "Red File" "*.red" "SWF File" "*.swf" ] if file <> none [ file-lcl: to-local-file file file-source/text: file-lcl ] ] default [ 0 ] ] ] ] view main ] test It works when interpreted but when I try to compile it, I get this error: *** Compilation Error: argument type mismatch on calling: red/set-path* *** expected: [struct! [ header [integer!] data1 [integer!] data2 [integer!] data3 [integer!] ]], found: [struct! [ header [integer!] ctx [pointer! [integer!]] symbol [integer!] index [integer!] ]] *** in file: %/X/GIT/Red/tests/test3.red *** in function: exec/f_ctx430~on-menu *** at line: 1 *** near: [ stack/unwind ] Any idea how to make it compile able? dockimbel 15:32@Oldes Functions in functions are not well supported by the compiler yet. Besides, you should use objects to encapsulate code, not functions. greggirwin 15:58On grid/table, we have hybrid options as well. A table is basically just a constrained layout for other faces. If we can nest faces, we can do what we want, leaving things like column headers as a special case. R2's list style is a great model, though it was a pain to work with when fields were editable, because of the iterated face approach. Done right, the same system works for spreadsheet style tables as well as things like this chat list or the room list to the left of it. meijeru 16:22In good grids/tables, clicking on a column header sorts the table by the values in the column (alternatively ascending/descending). I think that is an important requirement. greggirwin 16:29I don't know if Doc has a design spec for it yet. My guess is that there will be a standard, native version, and, I hope, a "real" one. In my VB days, there was a custom control called TrueGrid that was wonderful. It let you either set data for the grid to manage, including editability, or could work in "virtual" mode, where callbacks were used to fetch data for display and update. That may have been what Carl was going for with list. tanstaaf1 17:10@greggirwin @pekr I know Red's GUI is already far beyond R2GUI (view) in terms of sheer power and potential. However, there are all these great GUI "teaser" projects and tutorials for R2. If it would be possible to at least kludge most of the remaining R2GUI features in Red then existing tutorials could be used with minimal modification. That might not be ideal from a purist standpoint (as I said, I understand Red is way beyond Rebol in terms of potential) but it would save, or at least safely delay, a lot of work actually re-writing/replacing tutorials. And it would provide the "hook" for many new users. Thoughts? greggirwin 17:20What tutorials are you referring to? We can't just kludge things in, because then we'll break them and make people mad (rightly so). 17:22Maybe a better question I should ask is: What examples and tutorials would be most useful? tanstaaf1 17:34Well, I liked yours. Nick wrote a lot of them and those were my intro to what was possible with a few lines of Rebol (actually View). I agree with your better question. Not all Rebol code is worth supporting. Personally I was enthralled the first time I saw the minimal spreadsheet. I immediately wanted to play modifying it and adding some error catching. greggirwin 17:34The 7GUIs project is a good inspiration, and we hope to do more things along those lines as well. tanstaaf1 17:48I have this fantasy of a more advanced tutorial starting with a bare-bones spreadsheet and then incrementally building it up into something quite useful. The darn thing functioning from a few dozen lines of sparse yet intelligible code would be the hook. Then additional functions and error catching could be added in small pieces, gradually leading the user to feel more comfortable with Red's deep lake, parse, etc. as a full-blown, embeddable calculator app was built up and gradually re-purposed. As I said, it's a fantasy.... 17:50Have you ever seen the Haskell tutorial building a Scheme interpreter? Sort of like that but with a GUI 9214 17:51https://en.wikibooks.org/wiki/Write_Yourself_a_Scheme_in_48_Hours greggirwin 18:08I haven't but in clearing some old reading, I hit a Haskell bit that I hadn't seen before. It was interesting because one of its big claims is a nice concurrency mechanism. Turns out it's a lot like the old tuplespace model. 18:16I'll read the Haskell link soon. Reminded me about https://github.com/kanaka/mal/. Thursday 6th July, 2017 tanstaaf1 12:36@greggirwin Doesn't reliance on native, only, restrict Red's GUI to a common denominator? Or -- more reasonably -- some systems would have to have some things kludged anyway? (BTW in my parlance a kludge isn't necessarily a badly built thing - just a workaround) With that in mind, would it be feasible/reasonable to have a RebolVIEW mode ... say as a DSL? As a DSL (kludge) I don't think people will expect pure native look and feel. luce80 18:16If Red team provides the necessary low-level part, you could rebuild Rebol View/VID with Rebol SDK (or by recontricting its sources) and my to-be-modified script http://www.rebol.org/view-script.r?script=vid1r3.r3 . I would suggest to modify the imho ugly&old look of it while at it. Friday 7th July, 2017 greggirwin 02:53It's all choices and compromises. More features will come, but even now you could probably do a lot with the base style if you want to roll your own. The first question is what gaps there are in the common UI widget set that Red needs? tanstaaf1 05:33@luce80 Thanks for the link. I fear it is beyond my skill to do the equivalent for red but I downloaded it for study anyway and I can appreciate it as a big piece of code that got a big job done. 05:34@greggirwin Well, I 05:46It sounds like list or some other grid widget would be appreciated. A grid widget is also one thing Nick A said he would need before he undertook to port his GUI tutorials. He mentioned some others but many will probably come with full IO. I've never seen your TrueGrid but that sounds even more powerful. greggirwin 17:35Grid is probably the least portable, or most complex widget, if you're going native. There are so many ways to do things that it will be hard. From that perspective, providing a *logical* grid style, which is just a container for other widgets, makes sense. Then you have to decide whether it's for small data, infinite data, or how to make it easy to do both. justjenny 22:54now/date - superb, every day it gets better, love it., keep up the good work. Sunday 9th July, 2017 Oldes 12:24@qtxie @dockimbel would it be possible to improve speed of area rendering? I've noticed, that if I want to display text with many short lines (like 7000) it visually lags before it is displayed... like 1s on my fast computer, which is not good. Also when visible, the scrolling is not smooth enough... it is not that bad, but I can see flickering as it is rendered. 12:25I know that there are other things to do instead of optimizations, but just want to point on this issue if not known yet. (Tested on Win10) tanstaaf1 12:31@greggirwin I really like your thinking. Even when I don't totally agree with you I still generally appreciate your logic. In this case the idea of a *logical* grid style seems really visionary. Oldes 13:12hmm... I was trying to make a simple test for the area slow display and it seems to work well, so it must be somehow related to the source of the text in more complex scenario as I get it from routine. 13:46Getting the text is not an issue.. using my time measuring on this piece of code: txt: swf/parse-tag offset none ;creates a new string (no buffer reusing) print ["time1:" time-elapsed] detail/text: txt print ["time2:" time-elapsed " text size:" length? txt "bytes"] I get this result: time1: 0.0 time2: 0.5620000001508743 text size: 88641 bytes which means that the data result is resolved in not measurable time, but displaying it in an area needs 0.56 second and the text size is not too big. 13:49it is the number of lines which makes the slow down, because when I add replace/all txt "^/" "" I get: time1: 0.0 time2: 0.06200000015087426 text size: 81487 bytes dockimbel 14:17@Oldes Area on Windows require converting back and forth the text content to change the line ending format between Windows and Red. Though, it should not take 0.5 sec for that small text. I don't remember if we do that conversion in Red or R/S, if it's in Red, maybe we should rewrite it in R/S. 14:24Also, IIRC, area widget on Windows is by default limited to 32KB or 64KB of text only, so if you are setting more, View backend is sending messages to the widget to expand itself. That expansion might be slow. You should try setting at least twice the text and see if the second time it's faster. Oldes 14:30The time is still same (for same data) so it will not be the issue... I have a simple app with text-list on left and area on right. Clicking on row in the list displays info in the area. 14:32It is slow when there is the scroll bar needed. 14:35I have for example 0.266 seconds for data with 20715 bytes 14:36It's a shame it is not possible to disable the scrolling yet... so I could test if it makes a difference. 14:50According documentation: _the default limit for the amount of text a user can enter in an edit control is 32,767 characters._ 14:51Is extended using the EM_LIMITTEXT message as you said. That is not a problem. dockimbel 14:52Yes, we use that message, but nobody knows what's the OS API is doing there, it could well fully rebuild the widget internally. greggirwin 16:46:point_up: [July 9, 2017 6:31 AM](https://gitter.im/red/red/gui-branch?at=59622231bf7e6af22cbdadb8) @tanstaaf1, thanks. I don't always agree with others either, but being a part of this community (Rebol->Red) is as good for thinking and reasoning as Red itself. I enjoy having to consider my own thoughts, and be able to defend them, and how much I learn from others and their perspectives. Oldes 20:42btw... also writing into area with many lines is terribly slow. I wonder if it's normal with this native widget on Windows or not. Monday 10th July, 2017 Oldes 08:08@dockimbel problem with the slow area will be inside [this function](https://github.com/red/red/blob/master/modules/view/backends/windows/gui.reds#L284-L325) because when I comment [this line](https://github.com/red/red/blob/master/modules/view/backends/windows/gui.reds#L1628) the speed is normal. 08:13It is interesting that the scroll bars works without the mentioned function call... there is just some minor rendering issue as it looks they are not redraw, which disappears when you move mouse over it. And also they are always visible even when not needed. dockimbel 09:10@Oldes Good findings. I wonder if it's not the DrawText call which is taking too much time. Most probably, we need a manual mode for enabling/disabling the scrollbars, for cases where the automatic mode is too heavy. Oldes 09:14Yes... it is the DrawText. I made a little optimization to avoid twice unicode/to-utf16 conversion, but it makes no difference, so it must be some strange OS limitation with the DrawText 09:27btw... what if I would like to have not editable area widget with scrolling? dockimbel 09:49@Oldes Add a filter for 'key event (in a detect event, and return 'stop from it). Oldes 13:46@dockimbel @qtxie I managed to write own code which may be used instead of the slow DrawText, but could you please explain [this line](https://github.com/red/red/blob/master/modules/view/backends/windows/gui.reds#L324)? 14:21With my new code I managed to get the time from 0.56s on 0.06s, but sometimes I get this black parts in scroller (I've seen these also in the official version).. any idea how to fix it? 14:22[![image.png](https://files.gitter.im/red/red/gui-branch/c3P4/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/c3P4/image.png) 15:46@dockimbel any tip how to debug crashing view application? With CMD I can see output in console after crash, but view app just quits:/ dockimbel 16:23@Oldes For debugging View apps, compile them with -d instead of -t Windows and run them from CMD. That will redirect the prints to the standard output. Oldes 16:29Ah... I thought that -t Windows is required for View apps.. thanks. dockimbel 16:29About L324, it's a fix made by @qtxie for https://github.com/red/red/issues/2355 (Tip: you can use git blame to find out which commits where done on a given line). 16:30-t Windows redirects the prints to the GUI console and tells Windows that it's a GUI app, so it won't open a CMD window on start for it. greggirwin 16:36I just started https://github.com/red/red/wiki/VID-and-View-(GUI)-hints-and-tips to collect handy bits and pieces. dockimbel 16:37:+1: Oldes 16:42@dockimbel I see, so there is more issues with the area.... current official version does not display vertical scroll bar when the wrapped text is longer than height of the area... is it desired behavior? 16:44How to add widget options? For example when one would want to have vertical or horizontal bar always visible? 16:58view [area 100x100 no-wrap] in current version will not display horizontal bar for longer text, is it also desired? 19:23And... where to look to make this code work not just once? view [ below a: area 140x50 "Red" para [align: 'right] button 140 "change align" [ a/para/align: either a/para/align = 'right ['left]['right] ] ] 22:09@dockimbel in above case update-para is called just for the initial state and first switch. Looks like something out of my abilities. Tuesday 11st July, 2017 Oldes 08:26@dockimbel when I'm in it.. do you have in your comments any notes what values should be supported in para/scroll? dockimbel 09:29@Oldes Nope, not decided yet, not even sure we'll keep that field there. Oldes 10:06Ok.. so I will leave it as it is. 11:01@dockimbel could you please be more specific how to make area or field read-only? I was trying mentioned on-detect but it is not evaluated: view [ a: area do [ a/actors: make object! [ on-detect: func[ face [object!] event [event! none!] ][ prin 1 ;just to see it is not evaluated return 'stop ] ] ] ] 11:01could we extend para with read-only value? 11:05This is not working either: view [a: area on-key [return 'stop]] view [a: area on-key [return false]] 11:11hm... maybe it should be supported: view [area read-only] or view [a: area do [a/flags: [no-border read-only] ] ] dockimbel 12:04@Oldes The Red/View documentation says: > Event capturing is not enabled by default for performance reasons. Set system/view/capturing?: yes to enable it. > capturing? : yes = enables event capturing stage and detect events generation (default to no). 12:05> could we extend para with read-only value? I don't see the need for that. Oldes 12:21Ok... I don't understand it, but if nobody else needs read-only fields or text areas, than it must be our destiny. dockimbel 12:52As I said, you can just filter out the key events. Oldes 12:59I don't know how. 13:01Hm.. system/view/capturing?: yes makes the trick... with this the on-detect works. dockimbel 13:02 lisp system/view/capturing?: yes view [ a: area "This is a read-only text" on-detect [ if event/type = 'key [return 'stop] ] ] Oldes 13:06Simplified: system/view/capturing?: yes view [area "read only" on-detect [if event/type = 'key [return 'stop]]] But there is one issue, it is not possible to do CTRL+C, which is important part of the read-only fields. dockimbel 13:06Use the mouse, or write a smarter event handler. Oldes 13:07Ok.. you don't want to support view [area options [read-only]] so I end now. dockimbel 13:10I'm working on finishing dates, the macOS support and the 0.6.3 release, working on new features on area is not on my todo-list these days. I don't make design decisions in a few seconds, it takes me a while to study the pros/cons and impact of a decision about every new features. I can't do that while working on a different topic, so my default answer will be "no" until I get the chance to study the point in depth. Oldes 13:16ok.. no problem Saturday 15th July, 2017 virtualAlan 23:00Just updated my 'Red Programming' pages, Included a new Red Alarm Clock Example (example34). I used a call to 'rundll32 user32.dll,MessageBeep' to produce the alarm sounds. http://www.mycode4fun.co.uk/About-Red-Programming Also new stuff here: http://www.mycode4fun.co.uk/example-scripts Sunday 16th July, 2017 mikeparr 14:58@virtualAlan Thanks - useful! greggirwin 15:54Thanks Alan! Friday 21st July, 2017 mikeparr 19:44I'm looking at the 'drop-down' widget in vid - the documentation says: "Extra values of non-string datatype can be used to create associative arrays, using strings as keys." I have it working with strings - easy - but am struggling to understand the associative stuff. Does it check for a non-string type? 19:45Radio widget: typo/error in official docs? It says: "Only one radio button per pane is allowed to be checked." Pane is not exposed in Vid I think - guessing that is should read "panel", not "pane"? greggirwin 20:39@mikeparr, I updated https://gist.github.com/greggirwin/c67d640f09e9ccd0dac0859ec7374ca3 to show more behavior. All string values appear in the list, but the logic for selecting values based on them is up to you. You can see that using strings as keys means you have to use non-strings as values, if you want things to work easily and consistently. And, by string, it means any-string!. 20:40Probably a typo in the docs, yes. Good catch. 20:42Fixed. Saturday 22nd July, 2017 mikeparr 08:21@greggirwin Thanks! planetsizecpu 11:04@greggirwin Interesting, I will learn a lot thx! mikeparr 16:25Anyone know how to create a vertical slider in Vid? greggirwin 16:32view [slider 20x200] 16:32Just make it taller than it is wide. mikeparr 16:41@greggirwin Thanks again! iArnold 19:24@mikeparr Don't forget to document ;-) mikeparr 21:07@iArnold - yes, will do Sunday 23th July, 2017 dockimbel 13:10@mikeparr > Radio widget: typo/error in official docs? It says: "Only one radio button per pane is allowed to be checked." Pane is not exposed in Vid I think - guessing that is should read "panel", not "pane"? That quote is from the [View engine doc](https://doc.red-lang.org/en/view.html#_radio), not from VID doc, so it's correct, as radio faces can be child faces of other faces than just panel type, like group-box, base and window. mikeparr 14:23@dockimbel Apologies. dockimbel 14:56@mikeparr No need, confusion about that detail is understandable. ;-) iceflow19 21:45As I've been using VID and Draw to implement custom widgets for a debugger for my master's thesis, I noticed when you cleanly encapsulate the widgets (using 'init to add an internal object to the extra facet) you end up with something eerily similar to Google's Polymer webframework. @dockimbel is this a coincidence? 21:53I can easily rattle off equivalent functionality between the two: light dom = normal VID elements/hierarchy shadow dom = VID element wrapped by style (usually panel, box, or base) dom-module's js api = object!/reactor! in the extra facet bi-directional binding & observers = reactors & reactions attributes & bindable properties = data facet/extra facet If it was a coincidence, I find it fascinating that we ended up with something so similar on a theoretical level. PeterWAWood 23:26@iceflow19 View, VID and Draw are inspired by their Rebol equivalents which probably pre-date Google let alone Google's Polymer web framework. Monday 24th July, 2017 iceflow19 00:31@PeterWAWood I am aware of that, I'm not talking about the pre-existing development patterns from the Rebol 2 days, more about how reactions interact with those patterns and other improvements Doc and qtxie have made. It was more of a rhetorical question, it's just interesting that the new web components standard ended up with some of the same patterns. 00:41Except that the syntactic disonance between js, css, and html are massively larger then VID, Draw, and Do. dockimbel 03:46@iceflow19 Early Rebol's VID and View had some inspiration from the web, style semantics for example are clearly inspired by CSS principles. Rebol/View was meant for the X-internet, so as a competitor to the early web apps. For the newest features added in Red's View and VID, our goal was (and still is) to go further into the declarative model, empowering face objects even more than in Rebol, and extracting a generalization of it through reactor!, so that we can re-use that model for other domains than GUIs (I give you just one possible application: live reactive objects to interact with robots). The reactive additions in Red are mostly inspired by Smalltalk principles, dataflow programming principles, and some of my readings about popular modern reactive frameworks (like Rx). As many web framework coders are leaning towards, or fully embracing functional principles, I guess they get their influences from the same sources as I do. So I'm not much surprised that we are all converging more or less towards a more declarative model. That's I would explain those similarities you've noticed. 03:48@iceflow19 Your master's thesis seems really exciting, looking forward to read it once published. greggirwin 16:21@kpeters58 has a question I don't know the answer to at the moment: :point_up: [July 24, 2017 9:26 AM](https://gitter.im/red/red/welcome?at=597611c0c101bc4e3ab6f860) 16:21I'll look into it later if nobody else knows either. Tuesday 25th July, 2017 dockimbel 12:39I posted a reply for that. bitbegin 15:31any plan for other widgets? For example, listview greggirwin 16:32@bitbegin, more widgets may come, but because of the cross platform+native nature of Red's GUI system, not all native widgets from every platform will be available. 16:33The notional grid/table/listview is a big topic, and comes up from time to time. maximvl 20:58how do I set loose property of a face object, not in the vid dialect? 20:58I'm trying this, and it doesn't work :( button: make face! [ type: 'button offset: 100x500 size: 100x100 text: "button" loose: true ] 21:00hey, found this one: https://github.com/red/red/blob/master/modules/view/VID.red#L277 21:00:D 22:17@dockimbel about red = reverse blue and color complement: http://i.imgur.com/FvZJDmf.png 22:18Red's palette :D 22:19https://gist.github.com/maximvl/f43ac42a83e1347c08da1758f91126b2 Wednesday 26th July, 2017 greggirwin 01:25Nice Maxim! iArnold 06:57Yes nice, but with a few minor issues. First tuple! already is bounded so no need to test separate values. Second the bound is 256 or the test should be <= 255. And last but not least there are colors that are their own reverse so the names do not show up, so a third name in yet a different color on the canvas would be nice. iceflow19 07:46Thanks @dockimbel for the background. My thesis is over a new ISA I thought up earlier this spring, which is a type of Transport Triggered Architecture. I'm implementing an assembler, which leverages Red's syntax, and a virtual machine, which uses a reactor! to dispatch instructions to secondary functional units. On the gui end I'm developing a minimal debugger to step through the instructions as the vm processes them. [![image.png](https://files.gitter.im/red/red/gui-branch/QA6E/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/QA6E/image.png) 07:50I'm using macros to inline and compose my custom widgets, to make the code less cluttered. 08:12And so I can write something like this: https://gist.github.com/iceflow19/2776ebf8225ad3e5352210b1dbc4d67b 08:15And then I inline it by throwing a simple @style codeline and codeline data ["Example" 1] in a vid block. 08:21Btw thanks @rebolek, your gritter code was really helpful in my understanding how to write custom widgets. rebolek 08:57@iceflow19 You're welcome! pekr 09:03Here comes first Red multicolumn text list widget :-) maximvl 11:08@iArnold thanks for comments, should have checked for 3 == length? value instead 11:10@iArnold I tried to come up with a way to find color which is distinguishable from the background with reverse and complement, not sure how to do it better iArnold 11:27I commented at the gist one way how to do that 11:30Perhaps if the "distance" (square-root(x times x + y times y + z times z)) between two colors is less than a certain number you could pick black or white, whichever is further away. (stupid markup get in the way: asterisk is bold) rebolek 11:58@maximvl you should do it in HSV, not in RGB. maximvl 12:01@rebolek what do you mean? rebolek 12:02@maximvl Finding complement color is very easy with HSV values. maximvl 12:02so my to-tuple [255 - color/1 255 - color/2 255 - corol/3] isn't the correct way? 12:03do we have any api for HSV<->RGB stuff? rebolek 12:03Check for example here http://www.rebol.org/view-script.r?script=hsv-lab.r 12:04The correct way is to add 180 to H. maximvl 12:04now it makes sense why the result is so bad :D 12:05hm, I wanna port this script to Red 12:05and there are probably a lot of things we can port from Rebol scripts rebolek 12:05The conversion is easy, porting it shouldn't take much time. geekyi 12:38@rebolek do you have a script to automate it? :p Sometimes, the problem is the code is written in an old version of rebol2.. Actually, the problem is, I know more about Red than Rebol2 rebolek 14:21@geekyi I've got these functions for working with colors here, https://github.com/rebolek/lest/blob/master/colorspaces.reb - it is for R3, but I will convert it to Red and let you know. greggirwin 17:08@iceflow19, very cool project! kpeters58 18:44What does Red GUI currently have to display a message to a user (inform, alert don't seem to exist)? 9214 19:03@kpeters58 roughly view [ b: button "show info" on-click [w/visible?: yes] w: base "your info" hidden ] 19:05I think you can spawn another window either with popup or no-border flag, it will look similar to alert from Rebol2 19:22@kpeters58 alert: layout [ backdrop red text "Red alert!" do [self/flags: [popup]] ] view [ button "show info" on-click [view alert] ] kpeters58 19:30Thanks much! 9214 19:31though you still need OK button which will close the window, I'm too sleepy and can't figure out how to do this :confused: rebolek 19:55I converted my %colorspaces.reb to Red, available here https://github.com/rebolek/red-tools/blob/colorspaces/colorspaces.red - you can try gui-example to see how it works. Type some color value into the field and press enter. honix 20:48@kpeters58 @9214 this will close current window: button "OK" [unview self] 9214 20:48@honix kudos! 21:08@kpeters58 alert: layout [ backdrop red text "Red alert!" button "OK" on-click [unview self] do [self/flags: 'no-border] ;@@ layout/flags bug workaround ] view [button "show info" on-click [view alert]] Thursday 27th July, 2017 ldci 09:59RedCV makes RGB to HSV among other conversions rebolek 10:07Cool. Friday 28th July, 2017 rebolek 09:40What's the current state of GTK branch? I know it's not currently developed, I just wonder what's possible to do with it. I tried to compile console in GTK branch, there is Needs: View in header, but when try view in console, it has no value. iArnold 09:50You are compiling for -t Linux I presume? Might have to do with the fixes to get compiling for FreeBSD target working again. It would definitively be nice to have a minimal view working (show a window for example) for Linux. That could trigger somebody to take up the development again. PeterWAWood 10:02Arnold: What makes you think the fixes to FreeBSD have anything to do with it? 10:03The tests all pass on Linux. 10:21@rebolek Using the latest gtk branch and compiling the console with the -r option I got this: 10:22[![Screen Shot 2017-07-28 at 18.20.36.png](https://files.gitter.im/red/red/gui-branch/PKHs/thumb/Screen-Shot-2017-07-28-at-18.20.36.png)](https://files.gitter.im/red/red/gui-branch/PKHs/Screen-Shot-2017-07-28-at-18.20.36.png) iArnold 10:24Peter, because there is now code that skips code depending on OS. I'll find a link. 10:26https://github.com/red/red/commit/9d91439fec95ae70b2c8e2383dad6a05fba11391 10:27right. PeterWAWood 10:30Why do you think those changes would affect View running under Linux? 10:33That commit hasn't even been applied to the GTK branch yet. iArnold 10:36They have to do with image processing, but it was only a suggestion. 9214 10:42speaking of GTK+ backend, can anyone say what it can already handle? (i.e. which facets and event handlers are supported) qtxie 10:44@9214 [Here](https://trello.com/c/aoO1zUGr/156-gtk3-gui-backend) on Trello. 9214 10:46@qtxie thank you! rebolek 10:46@PeterWAWood that is strange. I compile with >> do/args %red.r "-r environment/console/console.red" and get sony@tankpad:~/Code/red$ ./console --== Red 0.6.3 ==-- Type HELP for starting information. >> view [button "test"] *** Script Error: view has no value *** Where: catch *** Stack: That is with latest GTK branch. PeterWAWood 10:46Which OS? rebolek 10:47Linux PeterWAWood 10:47Which distro rebolek 10:47elementary 0.4 PeterWAWood 10:47I was running Ubuntu 32-bit rebolek 10:47Elementary is based on Ubuntu 16.04 10:48Do I need some 32bit GTK probably? qtxie 10:48@rebolek Seems you're not in the right branch. PeterWAWood 10:48I'm using 16.04 rebolek 10:48@qtxie which one is the right one? PeterWAWood 10:49Yes, you will need 32bit GTK+ rebolek 10:49 sony@tankpad:~/Code/red$ git status On branch GTK Your branch is up-to-date with 'origin/GTK'. 10:49@PeterWAWood Ah, OK. Do you know how to add them? PeterWAWood 10:50Sorry. I'll see what I can find qtxie 10:52Yes, GTK branch, I mean maybe your local files are mess up. Even you don't have 32bit GTK, view should be defined, it's a Red function in view module. rebolek 10:53Hm, I will try in fresh directory and let you know. Thanks. 10:56So with fresh clone, I get ./console: error while loading shared libraries: libgtk-3.so.0: PeterWAWood 10:57Is a ia32-libs-gtk package available. rebolek 11:00I dont see that package in Ubuntu repo 11:03I've got it running, I needed to install 32 bit GTK with: sudo apt-get install libgtk-3-bin:i386 11:03Thanks all for help! PeterWAWood 11:06 👍 honix 20:55official roadmap says that GTK3 backend is 10% ready, it is close to reality? Oldes 21:09I would guess it's a little 21:09A little bit more. Sunday 30th July, 2017 tmpbci 22:31hi threr 22:32I don't know if there is any process if one offer testing time. mainly os x and debian flavors greggirwin 22:35No fixed process. @dockimbel or @qtxie may offer suggestions though. Monday 31st July, 2017 dockimbel 05:33We usually do deeping testing just before a new release. We manually re-test all the scripts from %tests/ folder and all from red/code repo, and that on all platforms. If we find a regression, we try to fix it, then re-test everything again. That's one of the reasons why releases are expensive for us. Help with that pre-release testing process, tracking regressions, would be a great help. honix 07:19playing with View i found that 'image is a standalone face type actualy, not subpart of 'base as Doc says. btw i like 'image to be standalone dockimbel 07:54@honix See [this](https://github.com/red/red/blob/master/modules/view/styles.red#L106). honix 08:07@dockimbel aha, i see. practically base 100x100 image my-image will create two faces, for base and for image. but suspected a base with image inside according to [this doc](https://doc.red-lang.org/en/view.html#_base) 08:09hmm.. or i will drop 'image word because 'image parses to this style @dockimbel sent dockimbel 08:32image is only a VID style, at View engine level, it is just a base face with an image facet set. mikeparr 19:32I've uploaded a lot of new stuff to the VID page of Red-By-Example - http://www.red-by-example.org/vid.html . It is based on Arie's initial material, though edited/extended by me. Feedback please! Note that it is basic stuff, aimed at beginners. honix 19:48@mikeparr COOOL! i love to learn this way :) greggirwin 20:00Thanks so much Mike! I still owe Rudolf a review of some doc work he's done, but will add yours to my list. kpeters58 20:40Am i correct in assuming that menu fonts (under Windows) are (currently?) immutable? greggirwin 22:02Yes. kpeters58 22:04The code below should - IMHO - result in two same height panels side by side with the contained faces also being of equal height. None of these 2 assumptions are being met as shown in the screenshot. Any reason why I should not file an issue for this? 22:04red [ needs 'view ] view layout [ tab-panel [ " Tab 1 " [ panel olive [ panel gold [ h5 "Header 1" return text-list 200x400 data [ ] ] panel papaya [ h5 "Header 2" return area 800x400 ] ] ] ] ] 22:05[![redbug2.png](https://files.gitter.im/red/red/gui-branch/zfs4/thumb/redbug2.png)](https://files.gitter.im/red/red/gui-branch/zfs4/redbug2.png) 22:11For the record: Windows 10 Enterprise greggirwin 22:44text-list faces are always an even integral of their row height, which can throw things off. However, something else is going on. I have to run right now, but I get the same result on Win7. 22:45We should nail it down more before filing the ticket. virtualAlan 22:47Nice work @mikeparr - Always very helpful - you say basic - not so basic to a novice - all good stuff. kpeters58 23:35@greggirwin I just checked and you are - again - correct re. height calculations - though I have seen row-based controls elsewhere that weren't ashamed to display fractions of a row vertically. In fact, in Delphi one can select either behavior for such controls. Tuesday 1st August, 2017 greggirwin 05:47Yes, it may be an option that can be supported, but may not work on all platforms, in which case it may not be worth doing. GiuseppeChillemi 09:32Hi, I don't remember if asked before: has list-view been implemented in RED VID ? pekr 09:49It was not, yet, well, if you mean a multi-column data widget .... geekyi 10:33@honix img: make image! [1x1] lay: layout [base image img ] dump-face lay 12:00@GiuseppeChillemi did you meantext-list? https://github.com/red/code/blob/master/Showcase/last-commits.red 12:18I'm getting a strange error when running [list-view.r](http://www.rebol.org/view-script.r?script=list-view.r) 12:18Both when I run my local copy of the library and do it online: 12:18 rebol >> do http://www.rebol.org/download-a-script.r?script-name=list-view.r connecting to: www.rebol.org Script: "VID LIST-VIEW Face" (21-Jan-2006) ** Script Error: Â has no value ** Where: stylize ** Near: remove-block-here: func [range] Â [remove-block range filter-sel-cnt] 12:20Â isn't there in the local copy of the file, so I'm not sure how that's getting.. generated? PeterWAWood 12:22@geekyi Have you checked the text encoding of the file? geekyi 12:22Apparently, it is there #{c2a0} 12:24@PeterWAWood by any chance, you know who to contact to correct errors like this? 12:25I was expecting Red to give an error here PeterWAWood 12:27@geekyi There is no way to determine an error If the file contains only valid utf-8 code sequences. 12:32By the way, I thought that #{c2},#{ao} is the correct UTF-8 sequence for a non-breaking space geekyi 12:32@PeterWAWood ah ok, so what I'd have to do is save as something like ISO 8859 because Rebol doesn't actually support UTF-8 12:32Not Red's problem but Rebol 2's here PeterWAWood 12:33The Rebol.org webpage for the script appears to be valid UTF-8, you could just copy and paste it into your editor. geekyi 12:35@PeterWAWood thanks, but I solved by changing encoding to ISO 8859. I should keep in mind that Rebol doesn't support unicode next time 12:36@geekyi could alternatively remove non ascii characters 12:36[![image.png](https://files.gitter.im/red/red/gui-branch/kcd2/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/kcd2/image.png) 12:37Anyway, listview-demo.r works :D 9214 13:22I'm not a reactive programming expert, but is that suppose to happen? view [ across b: base transparent 50x50 draw [fill-pen 255.55.0.70 circle 25x25 20] react/later [b/draw/2/4: to integer! 255 * s/data] s: slider ] *** Script Error: VID - invalid syntax at: [react/later [b/draw/2/4: to integer! 255 * s/data] return] *** Where: do *** Stack: view layout cause-error 13:22without /later refinement everything is fine 13:36sorry, error message is misleading, should be s: instead of return geekyi 14:31@9214 is it the same bug as before? Why not move react/later out of VID as a workaround? https://github.com/red/code/blob/93305f1febcf84e9c26ede5d829e0f9b8fc9f5da/Scripts/reactive/worm.red#L35 14:32https://github.com/red/red/issues/2953 9214 14:35@geekyi indeed! view [ across b: base transparent 50x50 draw [fill-pen 255.55.0.70 circle 25x25 20] s: slider do [react/later [b/draw/2/4: to integer! 255 * s/data]] ] greggirwin 18:23@9214, I commented on your ticket. The syntax in VID is react later. 9214 18:24Gregg saves the day! :^) greggirwin 18:27This is why Red having a small code base and using Red/System is so important. It makes it look like I know things. :^) More seriously, I didn't know the syntax either, but was able to find it. 18:28And your example made it easy to cut and paste to test. 18:29Only after looking at the source did I think to look at rhe docs: https://doc.red-lang.org/en/vid.html#_react :^\ 21:02@kpeters58 :point_up: [July 31, 2017 4:04 PM](https://gitter.im/red/red/gui-branch?at=597fa986f5b3458e309bc2b7) is something @qtxie might be able to comment on. There may be OS metrics at work that affect the Red face. 21:02 blk: collect [repeat i 50 [keep form i]] view layout [ tab-panel [ " Tab 1 " [ panel olive [ panel gold [ h5 "Header 1" return lst-1: text-list 200x400 data blk return button ] panel gold [ h5 "Header 1" return lst-2: text-list 200x401 data blk return button ] panel papaya [ h5 "Header 2" return txt: area 400x400 return button ] ] ] ] button [print [lst-1/size lst-2/size txt/size]] ] 21:03Note the 1 pixel height difference in the first two lists, in the spec, then click the button on the far right to see the sizes as Red renders them. 21:04Best case, it can be improved. Worst case, we need to doc it. I imagine there will be a lot of styles we can't control completely on every OS, so it might make a good general View note, with links from affected styles to see that note. Wednesday 2nd August, 2017 qtxie 00:02Yes. The VID will add 15 pixels to the height of the text-list on Windows. I don't remember why, will check it today. greggirwin 05:52Thanks @qtxie. geekyi 06:23@greggirwin > Only after looking at the source did I think to look at rhe docs: https://doc.red-lang.org/en/vid.html#_react :^\ https://github.com/red/red/blob/master/modules/view/VID.red#L290-L291 ? Curious how you found it, it wasn't immediately obvious to me ;^) 06:24I'll probably know better next time tho mikeparr 07:54Most of the 'Draw' doc is about drawing shapes with pre-determined values. But, what docs should I be looking in if my values are not pre-determined - e.g. if my lines are determined by random numbers) ? 9214 07:57@mikeparr i.e. you want use random inside draw block? dockimbel 08:14@mikeparr Draw dialect is expressed as a block of values (including words, numbers, tuples,...). You can alter that block at runtime at will, like any other block, achieving dynamic behavior. Have a look at the scripts in [red/code](https://github.com/red/code) for some examples (like the [Eve Clock](https://github.com/red/code/blob/master/Showcase/eve-clock.red#L19) one). mikeparr 08:15Got it! Thanks @dockimbel dockimbel 08:22@greggirwin @kpeters58 There's definitely something wrong with the height of displayed text-lists. Might be related to the horizontal scrollbar handling. 08:50I pushed a fix for that issue (#2957). The cause was, as Gregg supposed, that the widget was only allowing integer number of rows and adjusting the height accordingly. I've added the required flag to disable that behavior by default. greggirwin 15:49:point_up: [August 2, 2017 12:23 AM](https://gitter.im/red/red/gui-branch?at=59816fee45fc670746e9588f) @geekyi, I knew it was processing options in VID, so knew to look in %VID.red. From there, I scroll-skimmed the file (which I often do to get a feel for things and look for parts that stand out). I saw the | section, and react, then searched for react elsewhere in it. 15:50Thanks for the text-list fix @dockimbel ! kpeters58 18:25@dockimbel thanks for the text-list required flag fix - will make creating certain UIs without specifying absolute values much easier 18:26Why am I getting this: 18:28Dang - just realized that I cannot copy from the console? honix 19:10can anybody say [why this works](https://github.com/honix/Redraw/blob/master/redraw.red#L16)? is-short: i cant draw on base/image if its fully transparent, looks like fully transparent face wont handle mouse events. 19:15cool, now i know, transparent pixels are mouse insensitive, it gives ability to create custom (not rectangle) mouse zones. greggirwin 19:16First, cool demo. Second, @qtxie is probably the one to answer, but he may be sleeping now. It may come from the OS behavior itself. It will be good to note in any case. 19:17system/view/capturing? doesn't seem to change the behavior. honix 19:33i fixed it by catching events with underlying base. so previous link is misleading -> [new frozen link](https://github.com/honix/Redraw/blob/7b02cb4ed27c51e15d71c18da79494ab708d3c3d/redraw.red#L16). 19:34i think it is a feature, not a bug :laughing: 20:23[![screenshoot.png](https://files.gitter.im/red/red/gui-branch/fBWm/thumb/screenshoot.png)](https://files.gitter.im/red/red/gui-branch/fBWm/screenshoot.png) 20:24done it right geekyi 20:25:+1: nice toomasv 20:28Very cool demo @honix ! honix 20:29@toomasv @geekyi thanks guys! greggirwin 21:15+1! The color picker looks great. honix 21:16@greggirwin ahah four lines of code! greggirwin 21:17Does anyone know if the old mini Paint app I ported got put somewhere in an example repo? maximvl 21:17@honix looks nice, could you share the latest version with this color picker? greggirwin 21:17https://gist.github.com/greggirwin/989ca6ffcec29f0700f54a0f3331d7eb honix 21:18@maximvl https://github.com/honix/Redraw greggirwin 21:18@honix's work reminded me that it needed a color picker. maximvl 21:20@honix strange, I can't paint anything greggirwin 21:20Brilliant palette solution @honix. honix 21:20@maximvl your OS? 21:20btw works fine on win8.1 maximvl 21:21windows 10 21:22color picking and everything else works, the preview changes, just nothing happens when I try to draw rcqls 21:22@honix Same thing for me on macOS greggirwin 21:22I need to move my mouse for the color change to take effect. Win7. honix 21:23@maximvl @rcqls https://github.com/honix/Redraw/blob/7b02cb4ed27c51e15d71c18da79494ab708d3c3d/redraw.red try this please maximvl 21:23@honix this one works :D rcqls 21:24@honix Not working on macos 21:25except if I miss something honix 21:26@maximvl hmm. seems on win10 transparent pixels are clickable, and not clickable on win8.1. cast @qtxie Thursday 3th August, 2017 qtxie 04:01@honix Ok. I'll have a look it. 04:01I got this error on Win7. *** Script Error: VIEW - face not linked to a window *** Where: do *** Stack: do-file layout do-safe update-preview show cause-error dockimbel 06:33@honix Very nice! You have amazing design and coding skills. :clap: How long since you've started learning Red? honix 06:55@qtxie i have this error too, but cant figure it out 06:57@dockimbel its about 16 days qtxie 07:01@honix Seems it caused by the do [update-preview], it will run before the window created. dockimbel 08:49@honix Would you rather say that your knowledge of Common Lisp helped you get Red faster, or was it getting in the way of learning Red? You have some very cool research work on visual programming [there](https://github.com/honix/Visual-List-Editor). :+1: 09:19@honix Sent you a couple of PR, one of them is fixing the "face not linked" error. honix 18:28@dockimbel yes, lisp teached me a lot, any languages become simpler to understand. But i would say Red\Rebol is pretty simple to start with, even you never done programming! greggirwin 20:05@honix, I updated https://gist.github.com/greggirwin/989ca6ffcec29f0700f54a0f3331d7eb to incorporate some of your ideas. Your Pyno project looks pretty cool too. geekyi 20:10@greggirwin *** Script Error: invalid Draw dialect input at: [none fill-pen 109.26.2.0 line-width 5 box 53x96 149x177] *** Where: ??? When you accidentally click outside the color picker, and no color is selected. Minor problem tho greggirwin 20:11Thanks @geekyi. Will look at that. Now, to combine @maximvl and @rebolek's color and colorspace elements, and build the ultimate cross platform color picker tool. :^) 20:13Click outside where/how? Can't dupe yet. 20:14Ah, if I alt+F4 it, I get the error. Thanks. 20:14Or maybe an OS issue that makes it not modal? 20:15Fixed. geekyi 20:26@greggirwin sorry, I should've been more specific, click and drag outside. Anyway, your fix works so it's all good 20:31[![image.png](https://files.gitter.im/red/red/gui-branch/QgSe/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/QgSe/image.png) 20:34@greggirwin one more thing, save button doesn't work,missing a /save in request-file here on L111 greggirwin 21:02Great image. :^) Thanks for catching save as well. Friday 4th August, 2017 GiuseppeChillemi 07:03@pekr @geekyi I mean a multi column data widget like we have (a buggy one) on REBOL3. It is the last thing keeping me from moving to RED all company scripts. geekyi 07:05Ah ok. Same as the the one on rebol.org that I posted above right 07:07@geekyi wonders how hard it would be to port that one rebolek 07:08@geekyi No, R3 one would be my text-list. How hard would be to port it? I guess I would have to try to see. geekyi 07:11Would it be better named table-blah or some such? List doesn't seem to have the connotation of multiple columns for me rebolek 07:11Sorry, it's text-table actually geekyi 07:12Unless column was available as an option for list. Ah ok that's a better name pekr 07:19could be called just list. R2 like list might be enough for starters rebolek 07:20If there ever will be native one...my R3 one was in Draw (and if I will port it, it will be in Draw again). pekr 07:21what I think is, that the grid like widget gets easily complex and it will be almost impossible to find a cross platform common denominator 07:23We imo need good engine support to create custom widgets anyway. rebolek 07:23Yes, having at least stylize would help certainly. pekr 07:27Later on, when Red will target web, we are mostly on our own again, or we will target some existing framework. Eg my guys recently switched to Angular. It uses Material design and in my book looks nicer than anything native. Bu then - it is known I like flat designs :-) 07:28@rebolek isn't there a stylize PR by yours? rebolek 07:33@pekr Yes, but it's rather old, it probably needs some changes to be compatible with latest Red. 08:17[![Snímek obrazovky 2017-08-04 v 10.16.08.png](https://files.gitter.im/red/red/gui-branch/Wy4B/thumb/Sni_mek-obrazovky-2017-08-04-v-10.16.08.png)](https://files.gitter.im/red/red/gui-branch/Wy4B/Sni_mek-obrazovky-2017-08-04-v-10.16.08.png) 08:17Something I did in last half an hour ^ pekr 08:28Nice! Very good start. Initially we don't even imo need colums, resizing, sorting, it would be enough to have scrollers and scroll the list. What Cyphre did for Rebgui, it was an infinite data grid, it cached the result and showed only some part of the data, kind of like a window/cache. rebolek 08:33This one is infinite also, it shows only part of data that will fit available area. I have to leave now, but will add (my custom) scroller to it when I get back. pekr 09:15Custom scroller? I would use system one, if that is available, but whatever works ... meijeru 09:25What about the table widget in RebGUI by Dobeash?? Could that be adapted? rebolek 09:29@pekr I'm not sure if there's already system one available. I've got one done in Gritter, so I just take that one. pekr 09:32I have a source from Cyphre, who did contractual work for my employer. The grid was able to have row or cell hilite, selections, used virtual rows/columns. That was my condition, so that you received a data block from the DB query, and display it without any modifications. Simply put columns were virtual. rebolek 10:11Now with scrolling: http://red.qyz.cz/img/text-table.mov pekr 10:22cool :-) The scroller will look identical even on Windows? rebolek 10:22Yes. 10:23It's the same one as in Gritter. But if it can be replaced with system one, then why not, I will replace it. pekr 10:26I thought we've already got one, but most probably I am mistaken and what is recently wrapped is just progress and slider ... 10:27Wel, anyway - could you put your "table", or whatever you call it, somewhere in the public repo, so that others might use it? rebolek 10:28@pekr >> view [scroller] *** Script Error: VID - invalid syntax at: [scroller] dockimbel 10:28scroller face type should be added in 0.6.4. rebolek 10:29@pekr I will, but it needs some improvements still, it is less than two hours old code, give it some time ;) 10:29@dockimbel cool! mikeparr 10:47I have created a base, and drawn a line on it. I want to add another line to the base (say on a button-click) but preserve the first line. Do I have to save the previous draws in a block and redraw them all, or is there a setting? Not asking for code - I know how to do it. (Sorry if this is an obvious answer!) rebolek 10:51@mikeparr you can append to draw block 10:53You did not want code, but here it is anyway ;) view [b: base 100x100 draw [] button "add line" [append b/draw compose [line (random 100x100) (random 100x100)]]] pekr 10:59@rebolek what a long code doing a useful thing :-) mikeparr 11:08Thanks @rebolek - basically, the answer is yes - everything has to be re-drawn, then. The 'draw block' is all there is? rebolek 11:24@mikeparr or you can convert draw data to image and draw on it. 11:25 view [b: base 100x100 draw [] button "add line" [b/image: to image! b b/draw: compose [line (random 100x100) (random 100x100)]]] pekr 11:30What is the difference here? In the second case, what is drawn already, is placed on the image (so you can't adapt it anymore) and you only add a new lines, correct? rebolek 11:32@pekr Exactly. In the first example, you can manipulate all lines, in the second one, only the last line. pekr 11:33I do remember Cyphre talking about some caching for Draw at the low level, but not sure how it was supposed to work at all ... maximvl 11:48so 11:48since we have all the input events in the view system 11:49is it actually possible to store them and replay at will? dockimbel 12:19@maximvl Not yet, but it's in the todo-list for View engine (just not sure in which release it will come). Basically, you need the ability to make event! and that requires some changes in the way event! type is implemented currently (we need to move more information from the low-level OS event into the event! datatype). pekr 12:24IIRC, some event related stuff is scheduled for the 0.6.5 Android release .... maximvl 12:36@dockimbel great :D GiuseppeChillemi 14:48@rebolek Great work ! Could I help you implementation with a bounty ? Here is a 250USD bounty for you once completed with cell editing ! 14:49Just a note: it will have to support unicode as Italian Language needs special accented characters ! mikeparr 15:00@rebolek re - drawing - thanks for your input. I'm writing some notes. The official docs - reasonably enough - don't have these idioms, techniques. rebolek 15:37@GiuseppeChillemi cool :) thanks to Red's Unicode support, you will get Italian for free ;) I've spent last hour writing down implementation notes and cell editing is on the list. Contact me privately to let me know what other requirements do you have. greggirwin 17:58Go Bolek, Go! GiuseppeChillemi 19:10@rebolek Mail Sent 20:19Another question, is there a way to load a picture, resize and diplay it ? tmpbci 20:23to display a picture one solution is box 630x360 %brain.jpg greggirwin 21:08@GiuseppeChillemi - https://gist.github.com/greggirwin/7107b80258dfec1fde514c3469429ac6 - https://gist.github.com/greggirwin/a1d132b31f15553a9181394ff7a25423 - https://gist.github.com/greggirwin/4b3c9962dc682c12821f55583d702a8e Saturday 5th August, 2017 dockimbel 06:28@GiuseppeChillemi @greggirwin Gregg's image resizing demo is also on red/code (with many other examples): https://github.com/red/code/blob/master/Scripts/resize-image.red luce80 08:14@GiuseppeChillemi here is a reacting version: https://gist.github.com/luce80/e34516e5248b629badfd4016dda6cbb8 Rebol2Red 12:07@luce80 *** Script Error: n1 has no value *** Where: get *** Stack: view layout react What are the values for n1 and n2? 12:14My previous post did not work after copying and pasting into the console so i deleted it. This version does. After selecting an item from a text-list i want to delete it from the list. thedata: ["a" "b" "c"] selecteditems: copy [] view [ te: text-list data thedata [ t: thedata/(te/selected) if not(none? t) [ append selecteditems t thedata/(te/selected): copy "" ] l: 0 foreach item thedata [ if item <> "" [ l: l + 1 ] ] if 0 = l [unview] ] ] print selecteditems ; this order is not important This code works but there must be a nicer better way to do this. Note: The selected items can be chosen random. dockimbel 12:28@Rebol2Red Here is a simplified version: list: ["a" "b" "c"] collected: [] view [ text-list data list on-down [ append collected take at face/data face/selected if empty? face/data [?? collected unview] ] ] Rebol2Red 12:32@dockimbel Much better. Thank you. dockimbel 12:32Some comments about your code: * if not(none? t) [ is equivalent to if t [ in this case. * thedata/(te/selected) is a bit harder to read than pick thedata te/selected or at thedata te/selected. * Use shorter words, use hyphen (-) when putting multiple words together as a variable name. Invest into better names, make your code read well enough in English, it will be easier to understand/maintain. * Avoid using I, l or O as variable names, as they can often be confused with 1 and 0. * Red has a rich API, most of simple actions you need on built-in datatypes are probably covered already. Take some time to study the existing functions (use what from the console and the Rebol/Core manual). Rebol2Red 12:38@dockimbel Thanks for your comments. I appreciate this a lot! I did study the functions but i do'nt have taken the Red pill after many years of programming in c, basic and many other languages. dockimbel 12:41@Rebol2Red In such case, I really recommend you reading the Rebol/Core manual, from cover to cover, with a Rebol console opened to copy/paste and play with the examples. That's the best way, for now, to dive into those concepts. 12:45Here is an even more concise version: list: ["a" "b" "c"] probe collect [ view [ text-list data list on-down [ keep take at face/data face/selected if empty? face/data [unview] ] ] ] Rebol2Red 12:52@dockimbel Maybe i am good at providing poor code to learn others and myself to learn how to do it the right way. I have a lot of it :) dockimbel 12:55Submitting code for improvement by the community is a good way to learn. Though, it should not replace reading in depth the existing docs. Also, asking the community questions about some language concepts or constructs is also very useful. Back in the early days in the Rebol community, we only had the mailing-list for that, and it was *very* helpful for everyone to ask questions and submit code. Nowadays, we have sophisticated realtime chats and online collaborative tools, so don't be shy. ;-) Rebol2Red 12:56@dockimbel So expect a lot from me. I'm just kidding. Back to programming :) 13:12One more question. How do i get the selected item? Looks simple but not to me. list: ["a" "b" "c"] print collect [ view [ text-list data list on-down [ ; I need the selected item to ; store it into another text-list keep take at face/data face/selected if empty? face/data [unview] ] ] ] 13:45Wrong: list: ["a" "b" "c"] selected: copy [] print collect [ view [ text-list data list on-down [ append selected keep take at face/data face/selected ] text-list data selected ] ] If i click on "b" i get "a" into the other text-list 14:12@dockimbel Also on the concise code you gave me this happens. For example if i click on "b" it removes "a" dockimbel 14:26@Rebol2Red Right, I should have used event/picked rather than face/selected. Though, the mouse events seem to not fill event/picked, so that we need to change the event type and add some extra code to ensure that the text-list's selection does not interfere: list: ["a" "b" "c"] probe collect [ view [ text-list data list on-change [face/selected: none] on-select [ keep take at face/data probe event/picked if empty? face/data [unview] ] ] ] Rebol2Red 14:32@dockimbel Thanks, now i have a nice way to select items! dockimbel 14:39@Rebol2Red Selecting items is much simpler than that. The above code is for selecting, removing selected items , and storing them in another list. 14:43I've opened a ticket for the mouse events on text-list, to see if we can improve it. luce80 14:49@Rebol2Red About n1 and n2 of my code: did you just copy-pasted only the piece of code shown by gitter ? If so try to go to the link and copy-paste all the text. Rebol2Red 15:06@luce80 Yes, i did only copy-pasted. I now have all the text. Thanks. 15:34@dockimbel Now i have to find a way to keep the second text-list sorted. A pity "text-list data sort selected" does not work. Any suggestion? Why did you use probe event/picked not leaving probe out? greggirwin 16:48@Rebol2Red, probably Doc is showing how to collect data and return it. If you need to act, i.e. sort, on each selection, you'll need to use the append approach, not collect. 16:49Then you can sort as each item is selected. Sunday 6th August, 2017 dockimbel 06:09@Rebol2Red view [ tl: text-list data ["b" "d" "a" "c"] button "sort" [sort tl/data show tl] ] show should not be needed, seems an object event handler for sort action is missing. 07:10Fix for sort on text-list pushed. GiuseppeChillemi 17:51It would be good to reference those script as expample in the proper documentation section Monday 7th August, 2017 planetsizecpu 13:45+1 to scroller face type (sorry for delay) 14:03[![polo1.jpg](https://files.gitter.im/red/red/gui-branch/jiqD/thumb/polo1.jpg)](https://files.gitter.im/red/red/gui-branch/jiqD/polo1.jpg) 14:03Taking advantage of my holidays I acquired this new T-Shirt at the corner's shop, I'm so proud of wear it this summer :smile: greggirwin 17:52@planetsizecpu, nice! honix 18:41[![gradient-bug.PNG](https://files.gitter.im/red/red/gui-branch/hKUm/thumb/gradient-bug.png)](https://files.gitter.im/red/red/gui-branch/hKUm/gradient-bug.PNG) 18:42Looks like a bug. [Code](https://gist.github.com/honix/ede14f02fb27b605fe9b782dd35f0d56) rebolek 18:43@honix definetely a bug, I can confirm it it on Vbox W10. Please fill an issue for it. honix 18:51done! greggirwin 20:04:point_up: [August 7, 2017 1:07 PM](https://gitter.im/red/red?at=5988ba57614889d475286ff6) How best to access old and new selection in a text-list. henrikmk 20:08the way I see it is to first store SELECTION in LAST-SELECTION or OLD-SELECTION before changing SELECTION in ON-CHANGE. greggirwin 20:10In face/state? henrikmk 20:12where SELECTION is greggirwin 20:12Would need a new facet then, pretty sure. henrikmk 20:13is there an extensible facet? one that stores an object? greggirwin 20:14state and options are blocks, AFAIK, so need to check and append, or designate a fixed slot. Haven't dug in myself yet. henrikmk 20:14ok. what are the prospects for face accessor functions like GET-FACE and SET-FACE? they could help solve this issue in a more "official" way. greggirwin 20:19I'm sure there will be more accessor ideas. do-event was added recently, but I don't know if they'll be wrappers or built into styles. Could be done either way. pekr 20:25IIRC Doc studied available Rebol GUIs, it would be probably best to ask him about those design questions? Tuesday 8th August, 2017 dockimbel 06:27@henrikmk :point_up: [August 8, 2017 11:40 AM](https://gitter.im/red/red?at=59893298210ac269206264d6) There is no need to store the old selection, both old and new values are available during select event. 06:33@planetsizecpu Great! :clap: :-) rebolek 07:19@GiuseppeChillemi @pekr some improvements: http://i.imgur.com/LZm7Vas.png * columns can be reordered * long text is automatically truncated * text can be aligned to left or right * active cell or row can be highlighted * header * and probably some others I forgot. Next is keyboard navigation and editing (probably using fieldstyle, I will see). pekr 07:43Just some input - when you reorder column - do you physically move the data? I hope it is just virtual? rebolek 07:44Virtual, moving all data would be too much work ;) pekr 07:45As for editing - it is just me, so feel just easy, but I don't like in-place Excel like editing. In real-life DB apps, what I like is INS, DEL, ENTER keyboard, and entering the form to change/input new data .... just my opinion though, but if I can influence the design, please allow forbidding the in-place editing as an option .... 07:47btw - is there going to be a vartical scroller too, if there is more than visible amount of columns? Well, beware - that might result in another request to have some columns frozen (not scrolling) at the left :-) 07:47My final word - great work, looks good and will allow ppl to start to produce DB apps, so thanks for that! rebolek 07:50* Vertical scroller - I'd like to avoid that as long as I can ;) * In-place editing - actually having separate editor would be easier to do than in-place one, so I may start with separate one and add in-place later. I need to do some testing to see what is easier. And thanks, I'm glad you like it! pekr 07:53as for an "editor" - it is upon the programmer, to design the form. It would be enough to allow double click, or using the keyboard navigation, plus enter event, to enter the form. I worked with many db apps in an enerprise. Grids rarely allowed to hilite the particular cell, the row was mostly enough. Also some allowed to tick the box, to select multiple rows, and then you could do some batch operations via some button, etc. 07:53I really did not like in-place editing, as sometimes you need to do a validation against some other table, or the field triggers some other operations, etc. 07:54Well, otoh I can understand, why someone might want the in-place editing though. rebolek 07:55Highlighting the cell was easy enough to add, but now I realized I do not support highlighting multiple rows (or cell). I'm adding it to my todo list. mikeparr 08:42Bug in Draw command - 'rotate' documentation? It says that the rotate angle is SET to the angle parameter. In my experiments, the parameter is ADDED to the current rotation amount. Thus, rotate 10 followed by: rotate -10 sets the rotate back to zero angle. henrikmk 09:18@rebolek looks like a good table widget. :-) planetsizecpu 11:01@GiuseppeChillemi Looks well @rebolek good job! will test in 0.6.4 rebolek 11:20@henrikmk @planetsizecpu Thanks guys, there's still lot of work to do, but it's fun :) greggirwin 12:27Really nice Bolek! @pekr, in-place editing will be important in a spreadsheet model. rebolek 12:39Thanks Gregg. The problem I have with in-place editing done using native widgets (field on top of custom table) would look strange. henrikmk 12:45@rebolek is the table widget done with DRAW? rebolek 12:46@henrikmk yes henrikmk 12:50is there a plan for text editing via the DRAW engine? that could help solve your issue eventually. pekr 12:51There is a new text editing widget, which is not yet in the mainline, or something like that. Rich text one ... 12:52Henrik - how far you went with your new planned cross Rebol/Red gui? I mean - do you just start to experience Red? rebolek 12:52Actually, I've already wrote text editor in Draw, so I need to put it together. henrikmk 13:00@pekr The new GUI is presently going nowhere, because I'm spending a lot of time in RebGUI right now. What I would have liked to do is to work on the new GUI with Red and R2 and maybe later R3 and World. Right now, I'm just trying out the existing Red GUI to see what it can and will be able to do, so I don't just repeat what is already being done too much, if I ever get started again. I have a couple of apps, I want to do in Red with its current GUI. pekr 13:03So - welcome onboard :-) Red GUI is still work in progress and if you look in Trello, you will see, that constant improvements are planned. Feel free to throw new ideas in. And if you would like to see some conceptual change, it would be best to do some short article, so that guys at FullStack can consider it .... henrikmk 13:06@pekr thanks. it probably wasn't the best idea to berate the work already done. sorry about that. (but my opinion stands) rebolek 13:06@henrikmk http://i.imgur.com/U24nQ1s.gifv henrikmk 13:07@rebolek wow, that is better than I expected. :-) rebolek 13:14:smile: henrikmk 15:19is there any sort of widget level resizing yet? rebolek 15:20not yet 15:20you have to resize manually henrikmk 15:29feel free to be inspired by the VID Extension Kit resize method, written by Brian Hawley and me. https://github.com/henrikmk/VID-Extension-Kit/blob/master/source/ctx/ctx-resize.r 15:29that of course depends on the resize model you choose. this one is inspired by MacOSX/NeXTSTEP. greggirwin 17:57@henrikmk, it's easy to jump into something new and compare to what you have needed in the past. Red is so different in some ways, and so early, that we haven't started to tap its potential. e.g. the latest blog that talks about the GUI test system, foreach-face (we've done some resizing experiments using that), and reactivity. I did most of the 7GUIs tasks in Red, and Doc's Ballot example, ported from JS. You're coming in at a good time. Plenty in place to play with, but still many areas to contribute to. 17:57Again, really nice Bolek. Wow. 17:58Resizing will probably start with a simple system, but I think it could be fun to implement Cassowary in Red. It will be a big task, and not on any task list, but something any one of us could do. 17:59Maybe we could port yours, just to see what it looks like in Red. dander 18:45I agree, that looks great @rebolek Wednesday 9th August, 2017 henrikmk 08:49@greggirwin Resizing is tightly linked to usability both for the user and the application author, so it makes sense that the resizing algorithm is kept simple. geekyi 09:05@geekyi is a bit frustrated that he can't just copy paste run @henrikmk's code :/ henrikmk 09:16@geekyi you mean, it needs to be adapted? geekyi 09:35@henrikmk No, it's dead easy to run code snippets in Red usually, I had to download a zip from github this time :p 09:35Btw, what tests should I look at? 09:37[![image.png](https://files.gitter.im/red/red/gui-branch/Eeec/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/Eeec/image.png) henrikmk 09:37Yes, those 09:38tests/browsers/style-browser.r is a complete program where some resizing is done. if it runs, that is. :-) geekyi 09:39FYI that was >> do %tests/resize/window.r 09:40@henrikmk > tests/browsers/style-browser.r is a complete program where some resizing is done. if it runs, that is. :-) well, that doesn't run (Win 10, REBOL/View 2.7.8.3.1 1-Jan-2011) 09:41 rebol Script: "VID Style Tags" (1-Jul-2009) make object! [ code: 300 type: 'script id: 'no-value arg1: 'value arg2: none arg3: none near: [get :value] where: 'setup-face* ] ** User Error: Layout error in pane default ** Near: face/add-pane face word pane insert henrikmk 09:41yes, ok. I may try to fix this for later. 09:41dialog-browser.r should work geekyi 09:51[![image.png](https://files.gitter.im/red/red/gui-branch/It9S/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/It9S/image.png) henrikmk 09:51yes, that looks right :-) geekyi 09:51@henrikmk yes it works, but no widget for resizing; have to manually resize as usual henrikmk 09:51what kind of widget do you want? geekyi 09:52This toolkit is a complete replacement for VID I assume? henrikmk 09:52about 90% replacement geekyi 09:52I'm just curious about your designs :D It's nice 09:53@henrikmk Also, I was wondering about Android and other mobile platforms. Not relevant there or..? henrikmk 09:55thanks :-) all the windows should be fully resizable. behavior is determined through layout code by creating springs for each widget starting with a size that is hardcoded for the layout. 09:56VID Extension Kit is R2 only. VID Junior was the intent for a new UI that would run on various REBOL incarnations. 09:57Documentation: http://hmkdesign.dk/project.rsp?id=vid-ext-kit&page=docs geekyi 10:04@henrikmk that's interesting. 10:05Actually, I'd starred https://github.com/henrikmk/VID-Junior before, but hadn't seen the original implementation henrikmk 10:06yes, ok :-) VID Junior was (or maybe is) intended to be a successor, taking everything that I learned while building the VID Extension Kit. geekyi 10:07@henrikmk Would be good to have a link to http://hmkdesign.dk/project.rsp?id=vid-ext-kit&page=docs from the readme, or have it in a Github compatible readable format in a repo. I completely missed that doc 10:08Missing pics/ diagrams, but who'd do that when you can execute the code right? :p 10:09Thanks anyway henrikmk 10:10there can always be more docs :-) geekyi 10:17> @henrikmk Also, I was wondering about Android and other mobile platforms. Not relevant there or..? What I mean is, Red has to consider this case too. More guis these days don't have resize, but *snap to sides* (corners); even in windows. Have to cater to changing UX flow. Automatic resizing etc.. ultimately we'd have tiling Window Managers, or not. 10:18But perhaps that wasn't your point, but from a *ui developers perspective*, you weren't satisfied with the apis? henrikmk 10:28"More guis these days don't have resize, but snap to sides (corners); even in windows." I see that as a subset to a common resize/align model. You could strictly build a UI in VID Extension Kit using a fixed window size and have elements align to the side with split balancer widgets, to simulate that Windows full screen feel. If you need really custom resizing, each widget supports overriding the built in resize model, so you can not only resize the widget itself, but build a panel widget that resizes its content in a custom way, so you could build an AUTO-LAYOUT model inside a panel. If you need some kind of window snapping to specific sizes and offsets, that would need to be built into the event system. What I wasn't satisfied with was the behavior of resizing systems of some UIs. Carl's original R3-GUI comes to mind. If they are too smart, you spend too much time fighting that intelligence instead of getting what you want. I've found the old NextSTEP resizing algorithm particularly easy to work with and simple to understand, because it's rather "dumb". dnmurphy 11:26@henrikmk I agree with what you say, Microsoft has especially gone down that route with Visio and turned what was a great product into a complete pain in the butt use. Some intelligence is useful, but I want the ultimate control, not some demented AI. tanstaaf1 14:25@henrikmk When you say in your docs "Not Goals ...Not cross-platform" and that you are not aiming for native look, do you see a fundamental problem with adapting your approach to Red's existent GUI? Have you begun to look at RedTeam's existent GUI code with an eye toward further integrating your code into the existing Red? henrikmk 14:36@tanstaaf1 I've not looked at everything yet, so I don't know the nature of how the Red/View system uses native widgets versus how custom widgets are made. But, as I see it, if plain graphic overlapping and embeddable regions that support DRAW and text that supports event input are available as a basic widget, on which other widgets could be made, then it should be OK for VID Junior. I use R2/View as a reference for this. VID Junior would obviously make its own "button" and "field" widgets, etc. VID Junior should not use native widgets unless necessary. geekyi 15:27@tanstaaf1 @henrikmk I think that's a great (non-)goal, as that could be a complementary system that can fill in the gaps in Red's VID 15:28By "Not cross-platform", I understand that's referring to the individual per platform widgets, not the whole system, right? Or something else? 15:29That is what I get from: 15:29>This is about the experience of using the GUI system from the view of the program writer 15:32I think this is how most other UI kits like Qt work similarly; (correct me if I'm wrong) they emulate the native look and feel, but one can override their style to get a completely different look because native widgets aren't used. 15:33A middle ground between Red's ambitious native widgets, and Rebol's custom engine and look 15:35And there is the more *"modern"* trend of using a whole browser engine and styling webpages.. henrikmk 16:02@geekyi > By "Not cross-platform", I understand that's referring to the individual per platform widgets, not the whole system, right? Or something else? Actually it's more referring to the abilities of one runtime against another. As a small practical example, R2 can't edit centered or right aligned text in fields, because of some bugs in R2/View that we can't fix. So the workaround would be to left-align the text, as the field is focused and then go back to the previous adjustment, when unfocused. But that's not necessary in R3 or Red (I hope). That means the solution is to have the capabilities system (a table of bugs and limitations with a particular runtime either queried or hardcoded), so the widget author or application author can neatly query for this ability and have the behavior to left align text present in R2, but not in R3 or in Red. This is better than having the author querying what runtime and what version you're running. This means that there won't be some crazy, fancy hack made to make R2 edit right-aligned text, but rather a sensibly different, but still functional behavior. So, it's a small example, but the point is that the behavior will sometimes be different enough that it can't be called cross-platform. Like, when you can't use OpenGL in one place and you can in another. We're not going to have some OpenGL software emulation in VID Junior, but there would be a quick way to query its presence and then if you attempt to use an OpenGL viewport widget, it would just show a boiler plate with "OpenGL Not Available". geekyi 16:10Yes, that is what I expected GiuseppeChillemi 16:23@rebolek Impressed ! 16:26@henrikmk Are you working on saphirion version ? Are you using GitHUB or an internal repository ? henrikmk 16:30@GiuseppeChillemi at saphirion, we use an internal branch of RebGUI. VID Junior is presently not in development. GiuseppeChillemi 16:36@henrikmk I have a version of saphirion RebGUI sent from Robert. I assume it is now obsolete henrikmk 16:37@GiuseppeChillemi how old is it? GiuseppeChillemi 17:41@henrikmk Release: r8393 19:04@henrikmk Also a question about VID Junior. Why not extend and port the current RED engine to have an unique GUI framework ? Would it be so difficult due to prior design differences ? I ask this because we are currently suffering of fragmentation problems. We Have VID, R3GUI, RebGUI ashley, RebGUI saphirion, RED Vid, VID extension kit.... If we all unify our efforts we would be a unstoppable, we would gain a lot of time and capabilities ! 19:06Opps, I forgot GLAYOUT ! henrikmk 19:19@GiuseppeChillemi ok, it's not that old 19:43@GiuseppeChillemi well, every one of those UIs (maybe except for VID) set out to be the ultimate REBOL GUI, when they were made, didn't they? :-) But the fact of the matter is that everyone have different tastes and desires for what a GUI system should be, and they are not necessarily compatible, although there are some common basics. I think the only way to find "the one true GUI system", is simply to build one and wait for it to become popular enough that people would be interested in contributing to it, and I think the key to that is to make it really easy to use at any level, so it clicks and is understood as a good idea by the most people. VID Junior could work on top of Red/View, if it's similar enough to R2/View, but I couldn't extend it on top of the present GUI system, because VID Junior has a different kind of foundation and doesn't focus very much on a dialect initially. GiuseppeChillemi 19:58@henrikmk Thanks for the explanation. I would prefer a cooperative approach, trying to find the ultimate solution than a darwinist one ! rebolek 20:02[![text-table-2.png](https://files.gitter.im/red/red/gui-branch/Mz3Q/thumb/text-table-2.png)](https://files.gitter.im/red/red/gui-branch/Mz3Q/text-table-2.png) 20:03I've added programmable styles, market cap color is done with a single line: face/extra/color: to tuple! reduce [40 min 255 (log-e value) - 16 * 20 40] GiuseppeChillemi 20:45@rebolek It seems I will have to prepare the money sooner than expected ! rebolek 20:47:smile: Thursday 10th August, 2017 dockimbel 07:55@rebolek Instead of to tuple! reduce [...], you could just use the cheaper as-color constructor. rebolek 07:57@dockimbel that's even better :smile: thanks! greggirwin 16:59I was ready to go look a the source for that, but used ?? in the console and then remembered it works on routines. Woohoo! honix 21:18[![screenshoot.png](https://files.gitter.im/red/red/gui-branch/qYo9/thumb/screenshoot.png)](https://files.gitter.im/red/red/gui-branch/qYo9/screenshoot.png) 21:18[Redraw](https://github.com/honix/Redraw) now with brushes programmed in red! meijeru 21:25I get an error *** Access Error: cannot open: %brushes/ *** Where: read *** Stack: do-file reload-brushes honix 21:27 i've redone readme. it's not loading from url anymore, because of local brushes folder greggirwin 21:32Wow @honix! Nice. I get an error though: *** Script Error: VID - invalid syntax at: [center pallete: image] *** Where: do 21:39Works now. Don't know what the issue was. Friday 11st August, 2017 qtxie 00:53@honix Fantastic! rebolek 05:03@honix cool! pekr 06:00Amazing. Will post to the FB group :-) toomasv 09:44@honix :+1: In Readme you asked to report how redraw works on other platforms besides W7/8.1. Works well on W10 too :) On opening/restarting, toolbox partly covers the canvas though. Also stright line works with normal brush only if you press shift after you have pressed left-mouse and moved it. If you press shift before that and try to draw, error is thrown: *** Script Error: invalid Draw dialect input at: [] *** Where: draw-image *** Stack: do-actor do-safe draw And noisy brush changes into arconnect as long as shift is held down. I would also suggest little changes to some lines to get brush names without ".red" extension: reload-brushes: does [ foreach brush read %brushes/ [ --> if parse brush [to [dot "red"] remove to end] [ ;was: thru dot "red" put tool/brushes to-string brush --> do read rejoin [%brushes/ brush ".red"] ;was: make file! reduce [%brushes/ brush] ] ] ] reload-brushes set-brush: func [name] [ tool/current-brush: select tool/brushes name ] --> set-brush "normal" ;was "normal.red" honix 12:04Thanks all! @toomasv yeah, it's more user friendly, thanks! ldci 15:22@honix RedDraw doesn't work under macOS honix 17:13@ldci can you please send me error message or something like that Saturday 12nd August, 2017 ldci 08:31@honix Windows are drawn but app freezes honix 08:53@ldci i cant say for sure, but you can try to remove "\no-wait" at lines 259 and 260 PeterWAWood 09:07@honix @ldci It runs for me on macOS if I remove the \no-wait at line 260. 09:07[![redraw on macOS 2017 08 12 .png](https://files.gitter.im/red/red/gui-branch/ldRf/thumb/redraw-on-macOS-2017-08-12-.png)](https://files.gitter.im/red/red/gui-branch/ldRf/redraw-on-macOS-2017-08-12-.png) 09:08The Size slider didn't seem to work. ldci 09:09@honix : exact with no-wait and for Size slider PeterWAWood 09:10After compiling, I had to remember to direct the compiler to store the executable in the same folder as the brushes folder. ldci 09:14@honix :BTW have a look here https://github.com/ldci/redCV PeterWAWood 09:14If I remove the \no-wait at line 259 I get an empty redraw window and no tool-bar 09:18When I compile and run the unchanged source (i.e. not removing \no-wait'), the program runs, a window flashes on the screen and the program terminates: text $ time ./redraw real 0m0.274s user 0m0.196s sys 0m0.041s ` ldci 09:18@PeterWAWood : remove only at line 260. It's OK for me. PeterWAWood 09:19@ldci :thumbsup: ldci 09:20@PeterWAWood : compilation is also OK 09:21@honix : alpha slider controls size:) PeterWAWood 09:22Yes with the /no-wait on line 260 commented out. (I haven't tried the script in the console yet). honix 16:07@ldci @PeterWAWood cool! i will add macOS as tested platform. but slider are confusing :confused: 16:09:point_up: [12 августа 2017 г., 12:14](https://gitter.im/red/red/gui-branch?at=598ec6debc46472974772512) yep! its will be interesting and powerfull mix Tuesday 15th August, 2017 Phryxe 07:22A couple of newbie questions about Face objects and facet's. In documentation list of facets they have names like offset, size, enabled? etc. I can't tell if one is supposed to mention the facet names in the code or not? If I use the facet size I get an error about invalid syntax. If not mentioned, how do you then separate enabled? and visible?? What does mandatory mean? Offset is mandatory, but you don't need to add that to include e.g. a button. rebolek 07:24You are mixing View and VID. View is the low level engine and VID is build on top of it. In view, you need things like size and offset to place widgets on screen, VID does compute these values automatically (but provides a way to override them). 07:26Widgets can visible? - you can see them on screen, but not enabled? - i.e. button is ghosted and cannot be pressed. Phryxe 07:27Yes, I understand visible/enabled. 07:32I understand I may have mixed View/VID, thanks. I tried to see what options I had when adding a text-list. rebolek 07:33If you have some code that does not do what you expect from it, just paste it here. Phryxe 07:55It was more me trying to understand the documentation ... which failed. greggirwin 15:48Also, VID can assign values to facets by type, but not in all cases, where it may be ambiguous. So sometimes you have to use the name in VID as well. mikeparr 20:49Getting mouse co-ordinates when it is depressed and moving, in a base face? As far as I can see, this is not possible. I can only get them from a mouse event (e.g.'down') but not from a rate (time) event. True? greggirwin 21:08At a glance, I believe that's the case Mike. get-event-offset in %event.reds checks the event type, and timer events will return none for the offset. 21:10I've always tracked it myself, from mouse events. honix 21:46@mikeparr l: layout [text "0x0"] l/flags: [all-over] l/actors: context [on-over: func [face [object!] event [event!]] [l/pane/1/text: to string! event/offset]] view l 21:53but text is capturing event over it... answer will be [there](https://doc.red-lang.org/en/view.html#_event_flow) but i want to sleep fergus4 21:55@rebolek text-table looks great! rebolek 22:05@fergus4 Thanks! I've added few new things, like keyboard navigation, I will release it soon. greggirwin 23:15@honix, yes. I think what @mikeparr is asking is this: l: layout [text "0x0" rate 1] l/flags: [all-over] l/actors: context [ on-over: func [face [object!] event [event!]] [l/pane/1/text: to string! event/offset] on-time: func [face [object!] event [event!]] [l/pane/1/text: form event/offset] ] view l Wednesday 16th August, 2017 mikeparr 07:14Yes, thanks @greggirwin I'm writing some beginner Draw notes, and wanted a tiny 'freehand drawing' program. It is probably a bit advanced for my notes, but will work on it. greggirwin 16:51Maybe you could strip out ideas from @honix's work, or the old R2 paint program I ported to Red. Thursday 17th August, 2017 mikeparr 19:08@greggirwin - thanks Friday 18th August, 2017 GiuseppeChillemi 20:40@rebolek I'll waiting for your release to start my first code in RED ! rebolek 20:46@GiuseppeChillemi I will release it soon, but without GC its memory usage grows very fast. Saturday 19th August, 2017 GiuseppeChillemi 19:45How much memory do you think it will use for 6 columns, 1500 records, 20 characters max each one ? rebolek 21:19data size is not a problem, redrawing is. geekyi 22:47@helloyi did you check color in this table: https://doc.red-lang.org/en/view.html#_face_object Sunday 20th August, 2017 rebolek 08:46@GiuseppeChillemi http://i.imgur.com/UTzFbIn.gifv henrikmk 10:03@rebolek is that memory usage at the bottom? :-) rebolek 10:06@henrikmk Yes, redrawing is very costly without GC (it was running for a while, initial memory usage is much lower), I'm trying to get it lower with /into, we will see... 10:07Or I may just change values in existing draw block instead of creating new one, but that would be bit tricky to write :) henrikmk 12:38so what happens when Red runs out of memory? does it fail nicely or crash? rebolek 12:40 On W10 VM I get crash. dockimbel 12:47@henrikmk Here is what happens usually: >> a: make string! 1000'000'000 == "" >> b: make string! 1000'000'000 *** Internal Error: not enough memory *** Where: make *** Stack: >> print "alive!" alive! 12:49@rebolek Can you get a native stack trace when such crash happens? (You need to compile in debug mode for that). rebolek 12:51@dockimbel Ok, I need to leave now, I'll be back in 2-3 hours, so I post it then. dockimbel 12:52No hurry, you can post it anytime. rebolek 14:37@dockimbel I've compiled debug version of console (with DOS target), but can't run it, it says it's incompatible with 64bit Windows version. henrikmk 17:06@dockimbel ok, thanks. looks like a good way :-) maximvl 22:23famous CL gui toolkit showcases for inspiration: https://common-lisp.net/project/mcclim/excite.html Monday 21st August, 2017 Phryxe 13:09About text alignment. I can get center and right to work, but middle and bottom doesn't seem to work. Tried on text and area faces. greggirwin 19:17Those facets are TBD. The way to simulate it, to some extent, is to use those keywords with overall alignment, per the latest blog entry: view [ style chk: check "Option" data yes style vline: base 2x60 red across top vline button "Ok" text "Text" field chk return across middle vline button "Ok" text "Text" field chk return across bottom vline button "Ok" text "Text" field chk ] Not perfect, but may help. Tuesday 22nd August, 2017 Phryxe 04:44Thanks, @greggirwin! I'm going through a bit of the documentation and trying stuff. I can wait for it TBD, but thanks for the example. 17:14About the window flag resize - *Default is fixed size, not resizeable*. I managed to add resize and it enables the maximize icon, but I already can resize the window in default mode by dragging the edges. Maybe it is TBD or I misunderstand resize? greggirwin 18:17I thought default was fixed size as well. Perhaps a regression. @qtxie should be able to tell us. maximvl 19:12 probe image probe draw image [fill-pen red box 0x0 100x100] 19:12prints make image! [10x10 #{ FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF }] none 19:13somehow draw doesn't want to draw the box 19:13it returns none and image is unchanged 19:13no error no nothing 19:14any idea what's could have happened? 9214 19:19@maximvl are you on Linux? draw seems to return altered image on Win7. maximvl 19:19nope, that's what I get on windows 10 greggirwin 19:19Seems OK here on Win7 as well. maximvl 19:19while I can do draw on just an image - this one is called inside actors 19:20and image is taken from base 19:20somehow nothing happens with it 19:22it works outside of an actors object, hm 19:34ok, now it's super strange 19:34I can set separate bytes of image like image/1: red 19:34but draw still refuses to work greggirwin 19:35Might need to post more example code, though I don't have time to help right now. maximvl 19:37@greggirwin ahahah, I just printed :draw - its none 19:37%) 19:37what is happening here 9214 19:38@maximvl maybe you just cut it off by an accident maximvl 19:38I suppose face! rebinds internal draw words to it's stuff greggirwin 19:54Can you use system/words/draw? 19:54Faces do have a draw facet, yes. maximvl 19:56@greggirwin yep, system/words/draw helps :0 19:57now my favorite part - guess which fields does event have 19:57 *** Script Error: reflect does not allow event! for its value argument *** Where: reflect *** Stack: do-file do-events do-safe probe keys-of 9214 20:08@maximvl are you looking for [this](https://doc.red-lang.org/en/view.html#_event_datatype)? maximvl 20:15found already :) now I'm trying to find out how to change size of an image 20:15seems impossible honix 20:44@maximvl i think you already tried it, but restarting Red (redefining words) may help maximvl 20:45@honix yeah, and it actually helped because I took resizing from an example where it was inserted directly into event handlers 20:45affecting whole world 20:45%) greggirwin 21:07:point_up: [August 22, 2017 2:15 PM](https://gitter.im/red/red/gui-branch?at=599c90ebba0f0f6e38d1353e) @maximvl, something like https://gist.github.com/greggirwin/4b3c9962dc682c12821f55583d702a8e ? 21:08Image resizing came up recently from someone else. You can't mutate the size of an image, but you can make new images from them. maximvl 21:09@greggirwin I just found out that resizing window automatically resizes base image inside 21:09no I don't need to do anything at all :D greggirwin 21:10Even better! maximvl 22:22@CodingFiend_twitter hey, who will do better? :D http://i.imgur.com/yseJVLz.png 22:22https://gist.github.com/maximvl/f3205407d6eeea4a370c9e4cd20d4167 honix 22:30@maximvl yup-yup! Great! Wednesday 23th August, 2017 greggirwin 06:21Go @maximvl, go! endo64 06:57@maximvl Very nice! So much fun to play. 9214 08:34 nope: no yup: yes these should be included in core language :D honix 09:29Ok 09:30There is my statistics for length of red's snake games (without headers) 09:30 wc -w maxim-snake.red && wc -w 41992-snake.red 485 maxim-snake.red 372 41992-snake.red maximvl 09:31I didn't optimize for size but for readability :D rcqls 13:11This last month, i tried to help developing the gtk3 backend first proposed by @qtxie (and also improved by @7hi4g0). I spent a lot of times reading the source code of red/view and the gtk documentation. There is a pull request in the gtk branch. My goal was to make the tests working the best I can do. Even if most of them are working pretty well, this work is not finished yet but I hope that the development is in good position. If some people want to help, they are welcome. In the tests/gtk3 folder, I added a README.gtk describing some tool you need to install (debian packages from now). I tested this branch with a i386 bodhi linux distrib and a x64 elementaryOS distrib. In the new tests/gtk3 folder, I put some specific transformed tests (removing camera for example for view-test.red). To test it just clone my repo and go to the gtk branch. Let me know if you need more info. rebolek 13:43@rcqls that's pretty cool, I will certainly test it on my elementary notebook maximvl 13:55@rcqls I'm waiting the GTK gui for a long time, will take a look on it, thanks :) rcqls 14:00@rebolek @maximvl I can provide the red executable if you prefer but I think it is not a problem for you to test it from the source. To insist, it is not finished yet, but I will appreciate your feedback. BTW, on elementaryOS, I have a white theme when on bodhi linux it is a black one. maximvl 14:01@rcqls I'm more interested in contributing actually rcqls 14:01@maximvl Good news! That’s the goal of my announcement actually. maximvl 14:02@rcqls btw, this is the part I don't fully understand, so it's written in R/S, how do you compile a new Red binary from it? rcqls 14:04@maximvl Somebody helps me to do so… you indeed need all the stuff you know to build the red binary. 14:05But you can compile with the rebol binary the red console as usual. rebolek 14:07@maximvl Red is written in R/S also. Just checkout the right repo and compile it as usual. maximvl 14:08@rebolek so R/S I can compile with Red or should I use Rebol? rcqls 14:12@maximvl Compile with rebol the usual one do/args %red.r "-r %environment/console/console.red" honix 14:13@maximvl rebol -> red -> red or r/s scripts. Read this as "->" = "runs". This is my vision of how it works now rcqls 14:13and then: ./console tests/vid.red for example. maximvl 14:13@rcqls cool, I'll ping you cause most likely I'll have tons of questions :) honix 14:14@rcqls @maximvl im interested in contributing gtk too! :) maximvl 14:14nice :) rcqls 14:16@honix Excellent! @honix @maximvl So I think I will need to write some documentation to give you my point of view because I faced up a lot of tricky issues and I am not sure that was the right way. maximvl 14:17@rcqls tricky issues on Red or GTK side? rcqls 14:18Mostly, how to make GTK in accordance with red/view design. Normally a binding follow the spirit of the GUI (here GTK) but here red/view because it is Multiplatform requires some constraints. greggirwin 16:08:point_up: [August 23, 2017 2:34 AM](https://gitter.im/red/red/gui-branch?at=599d3e192723db8d5ed33369) @9214, very old func: load-logic: func [ "Convert common representations to logic! values." value ][ if find [true yes on t y + #"t" #"y" "t" "y" "true" "yes" "on" ".t" ".t." 1] value [return true] ; The empty string is controversial. Returning false for it is the reverse of what REBOL does. ; Unset! is another one that might be included. REBOL returns true for it. if find [false no off f n - #"f" #"n" "" "f" "n" "false" "no" "off" ".f" ".f." 0] value [return false] ; Questionable options if find ["yes!" "yup" "yep" "ya" "ja" "da" "hai" "si" "oui" "yeah" "sure" "ok" "okay" "uh-huh" "uh huh"] form value [return true] if find ["no!" "halt" "stop" "stop!" "cancel" "abort" "esc" "escape" "nein" "nyet" "no way" "hell no"] form value [return false] ; For anything we don't check, let REBOL do what it does. to logic! value ] 16:09:point_up: [August 23, 2017 7:11 AM](https://gitter.im/red/red/gui-branch?at=599d7f1676a757f808d555e5) Thanks *SO MUCH* for all your work on this @rcqls! 16:10And thanks to others for wanting to help. 9214 16:21@rcqls @greggirwin you're both awesome :sparkles: :clap: rcqls 17:02@greggirwin @9214 Thanks a lot! Hope all this work could be useful! Thursday 24th August, 2017 rcqls 01:02Here [https://toltex.u-ga.fr/RedGtk](https://toltex.u-ga.fr/RedGtk) a simple page to test red/gtk3 on linux. xqlab 12:08Error using the binary from https://toltex.u-ga.fr/users/RCqls/Red/red anton@sixpack ~/own/Red $ ./red-gtk Compiling compression library... Compiling Red console... *** Loading Error: file access error: %gui.reds *** in file: %/home/anton/own/Red/runtime/datatypes/event.reds *** at line: 205 anton@sixpack ~/own/Red $ rcqls 12:12@xqlab weird, I tried this morning without any pb! Have you tried compilation from source? 12:27@xqlab I confirm the issue. I miss something in the building of the red binary and I need to check the documentation. But even it is not satisfactory, it works if you launch the red binary at the root of the cloned repository as I always do by accident. 12:31I think I see the problem, I am not in the build directory when building the red binary. 12:47@xqlab I think it is ok now. I forgot to include the gtk3 files in the red binary. greggirwin 15:05@rcqls, I see more progress has been made on GTK. Great stuff! rcqls 15:07@greggirwin Thanks! I am adding timer and rotate to see the beautiful eve-clock.red working... mikeparr 15:08Draw events. I'm trying to find this mentioned in the official docs, but can't. My view has 'draw d' in it, and when I append to d outside view, the new line is drawn. I wondered what event caused the re-draw? I guess I am wrong in thinking that the draw in view was just for initial setup? d: copy [] ...etc append d [line 22x22 33x33] view [ canvas: base 100x100 draw d ] maximvl 15:12@mikeparr in your code here you pass d which already contains the line 15:13not sure what you mean by "append to d outside view" greggirwin 15:14@mikeparr, I haven't looked, but I believe the draw block is "owned" by the face, which detects changes in it, as part of the object ownership system. mikeparr 15:21Thanks, @greggirwin (BTW my code was from your paint program.) Thanks @maximvl - my example was trimmed a lot. The append was executed when I clicked a button, after the first draw had taken place. So Gregg's explanation makes sense to me. xqlab 15:32@rcqls thanks. It's working now. You are on a good path. maximvl 15:34@mikeparr I see, interesting 15:34this ownership and reactivity system is new to me, need to try it out :) rcqls 16:02@xqlab Great! Friday 25th August, 2017 planetsizecpu 05:33Hi all, I want to adapt the widgets size to the view window size, I tested face on-resize [] raises *** Script Error: VID - invalid syntax at: [face on-resize []], so what will be the right way to catch window resizing? rebolek 06:38@planetsizecpu for example: >> win: layout [base 100x100 draw [line 0x0 100x100] on-resize [face/size: face/parent/size - 20x20 face/draw: reduce ['line 0x0 face/size]]] == make object! [ type: 'window offset: none size: 120x120 text: none image: none color: none menu: none... >> win/actors: context [on-resize: func [f e][foreach-face f [if all [face select face 'actors select face/actors 'on-resize][face/actors/on-resize face e]]]]] == make object! [ on-resize: func [f e][print ["res" e/offset foreach-face f [set 'x face if all [face probe face/type probe sel... >> view win planetsizecpu 06:54@rebolek Thanks, It works the way I want, I will arrange my script too rebolek 07:59@planetsizecpu you're welcome planetsizecpu 08:12@rebolek It is working fine on my script, but I just not fully understand how on-resize context works inside if all, I just did copy&paste, could you give me a short clue? rebolek 08:52@planetsizecpu if all makes sure that face/actors/on-resize exists, it can be written in simpler way, I believe, it's just first thing I tried. planetsizecpu 10:15@rebolek Thx!, I tested with if all [select face/actors 'on-resize] shorter code and it also works rebolek 10:19@planetsizecpu cool! Also you have just one condition now, so you do not need all 10:20if select face/actors 'on-resize is enough planetsizecpu 10:42@rebolek done thx!, I'm just starting this project to learn red while doing some useful, you can check it here (https://github.com/planetsizecpu/forms/blob/master/forms.red) GiuseppeChillemi 20:57@rebolek , nice demo, waiting for you ! Saturday 26th August, 2017 rcqls 08:02Just to let you know that eve-clock.red is (mostly) working on gtk3/linux considering that livecoding is here when using of course already developped tools. The page is [RedGtk](https://toltex.u-ga.fr/RedGtk) to test the console binary. PeterWAWood 09:13I tried to compile the Red console to use GTK3 on macOS (by modifying platform.red) using the latest source on the GTK3 branch . It fails with compilation errors in gtk3/draw.reds. As the very same source compiles on Ubuntu, I guess that it is related to draw not being compiled on Linux. Any hints would be very welcome. pekr 09:29Couldn't GTK have its own Trello board, so that we can watch its completness? PeterWAWood 09:30@pekr [GTK3 Card on Trello](https://trello.com/c/aoO1zUGr/156-gtk3-gui-backend) 09:31I don't think it is up-to-date though. rcqls 09:32@PeterWAWood Never tried to use gtk3 backend on macOS because I never found a i386 version of gtk3. Do you have some link? It is not surprising that gtk3 is only useable on Linux because it is arranged in the code like this. This could be done by arranging the code differently but, as I understand, gtk3 is only useable on Linux. As you may guess, I am a macOS user first and I only contribute on Linux because I love the concept of Multiplatform of red. BTW, to be accepted the commits on gtk3 have only be related to development on subfolder backends/gtk3. The core team could do that later if the gtk3 backend is mature enough but actually I prefer to have native widgets on macOS and Windows. PeterWAWood 09:36@rcqls I completely forgot that I don't have a 32-bit install of GTK3. rcqls 09:36@pekr I guess @qtxie would complete the trello board if he thinks that this work is good enough to be integrated in the official red/GTK branch. What I am doing is just to make the gtk3 tools working but all this work maybe needs to be improved internally and then reviewed by the core team. My page is temporary and done to quicky share the binary. PeterWAWood 09:37Actually, what you are doing is a very, very big help. pekr 09:37I thought I saw the Trello card, but later on, Trello was rearranged a bit, so lost the track of it. Thanks for the pointer .... rcqls 09:38@PeterWAWood I feel reassured because I intensively tried to find a i386 libs. But it is not the spirit of macOS system where almost everything becomes x64 only. PeterWAWood 09:40@rcqls Yes, it seems so may things are x64 only on macOS these days. I couldn't find a 32-bit version of Ruby to see if I could call libRed from Ruby. 09:42(I couldn't even work out how to compile a C program to a 32-bit executable using Xcode to test libRed. I resorted to using gcc from the command line.) rcqls 09:46It is the end of universal libraries... 09:54To be complete, I try to provide some comments on the submitted PR #2960 honix 10:32@rcqls great job! I'm slowly trying to implement drawing functions for cairo. But stuckd with spline.. actualy im trying to fit spline impl from macOS code. I think i will skip it for now and fill what i can. pekr 11:23Is my understandimg correct, that Red will support 64 bits only after the 1.0, once the compiler infrastructure is rewritten? 9214 11:24yes, I guess so rcqls 12:35@honix Thanks! On the cairo side, I think I am stuck writing text coming from FACE_OBJ_TEXT. It is used in the calculator.red. I think I’ll try again since it my next step. So I let you make some advances to the other cairo elements then If I understand what you are doing. 16:29@honix I partially manage to write text (from FACE_OBJ_TEXT) on base widget using pango_cairo instead of cairo (really difficult to control). THe good new with pango_cairo is that I could reuse some code. I let you work on cairo to not conflict with your work. I think I will work on drag and drop… Good news, calculator.red is partially working... luce80 16:41@rcqls If you are creating cairo and pango bindings for r/s, I think they should also be placed in https://github.com/red/code/tree/master/Library so they can be useful also for a lot of other projects. rcqls 16:49@luce80 It is not exactly a binding since we just use gtk3 (and its dependencies cairo and pango) to be compliant to the red design. A binding follows the spirit of the original library offering all the functions as possible. And it is clearly not what we are doing. As it is mentioned in a previous discussion, gtk3, pango and cairo do not work on macOS now (and I am a macOS user first) because not provided in i386 architecture. 16:52BTW, all the binding stuff is in gtk.reds file... 9214 19:54For some reason view window is resizeable even without resize flag. Bug/feature? 20:06[![view.gif](https://files.gitter.im/red/red/gui-branch/fS2L/thumb/view.gif)](https://files.gitter.im/red/red/gui-branch/fS2L/view.gif) Sunday 27th August, 2017 greggirwin 00:56This came up not long ago. Looks like a regression. planetsizecpu 08:36@9214 @greggirwin I though normal behavior of windows is to be resizeable in any OS, you may want to block size as an option, no? PeterWAWood 11:44@rcqls :+1: :+1: :+1: 11:44[![Red View on Raspberry Pi.png](https://files.gitter.im/red/red/gui-branch/lrM3/thumb/Red-View-on-Raspberry-Pi.png)](https://files.gitter.im/red/red/gui-branch/lrM3/Red-View-on-Raspberry-Pi.png) rebolek 11:49@PeterWAWood Cool! 11:50 @rcqls and others, thank you very much for your work on GTK port, it works fine on my Elementary 0.3 (there are some warnings, are you interested in them?), once you will implement Draw, I can leave my W10 VM just for testing and develop on Linux only (Draw is very important for me, it makes writing custom styles super easy). fergus4 17:37Going to be great having red/view on RPi! greggirwin 18:38Go @rcqls, Go! rcqls 20:44@PeterWAWood @rebolek @greggirwin Thanks for your support. @honix is participating too at least for the draw/dialect part with cairo stuff and we are grateful to have the active support of @qtxie. Just mentionned by @qtxie, I unfortunately introduced a regression in tests/vid.red. I suspect my last stuff about base widget be responsible of this issue… So everything is still experimental but I hope the good news is that we make some advances in the linux backend gtk3. greggirwin 21:10Thanks to *all* that are working on this. rcqls 22:55Thanks @honix for introducing beautiful tests/draw.red (see #2960) working in any backend (tested in macos and gtk3). Monday 28th August, 2017 ghost~5680c5f416b6c7089cc058a5 04:28@rcqls With a console compiled from your latest gtk branch on Ubuntu, view [] statement crashes the console with >> view [] *** Runtime Error 1: access violation *** at: 080EECE5h 04:29Other stuff works though :smile: :+1: rcqls 04:51@nc-x Interesting! Thanks! 05:19@nc-x Bug (supposed to be) fixed! OneArb 11:01<-- Back on the Red wagon! :) Any way I can declare a style outside a view? greggirwin 16:36*Style question answered in red/help* honix 20:55[![draw-windows-linux.png](https://files.gitter.im/red/red/gui-branch/oZB6/thumb/draw-windows-linux.png)](https://files.gitter.im/red/red/gui-branch/oZB6/draw-windows-linux.png) 20:55linux getting closer! 20:58can anyone do https://github.com/honix/red/raw/GTK/tests/draw.red on macOS? i'm interested how it looks rcqls 22:17[![Capture d’écran 2017-08-29 à 00.10.48.png](https://files.gitter.im/red/red/gui-branch/L7BN/thumb/Capture-d__cran-2017-08-29-_-00.10.48.png)](https://files.gitter.im/red/red/gui-branch/L7BN/Capture-d__cran-2017-08-29-_-00.10.48.png) Tuesday 29th August, 2017 toomasv 04:05:+1: greggirwin 06:18Woohoo! pekr 06:52Looks nice guys. Now we need screen capture SW written in Red, as a testing, which will "visually" investigate, if the outputted result is identical :-) maximvl 10:03great :clap: PeterWAWood 11:55Raspbian Stretch seems not to include libcrypto.so.1.0.0 upon which the Red console (with GUI) seems to depend. It does include lib crypto.so.1.0.2. pi@pi2b:~/Code/Red $ ldd ./piView linux-vdso.so.1 (0x7ed47000) /usr/lib/arm-linux-gnueabihf/libarmmem.so (0x76f0b000) libc.so.6 => /lib/arm-linux-gnueabihf/libc.so.6 (0x76db8000) libm.so.6 => /lib/arm-linux-gnueabihf/libm.so.6 (0x76d39000) libcrypto.so.1.0.0 => not found libcurl.so.4 => /usr/lib/arm-linux-gnueabihf/libcurl.so.4 (0x76cbd000) libgtk-3.so.0 => /usr/lib/arm-linux-gnueabihf/libgtk-3.so.0 (0x76676000) ... libssl.so.1.0.2 => /usr/lib/arm-linux-gnueabihf/libssl.so.1.0.2 (0x7653c000) libcrypto.so.1.0.2 => /usr/lib/arm-linux-gnueabihf/libcrypto.so.1.0.2 (0x763bc000) Any suggestions other than installing lib crypto.so.1.0.0? xqlab 13:06either renaming a copy or better creating a link ln -s libcrypto.so.1.0.2 libcrypto.so.1.0.0 Wednesday 30th August, 2017 fergus4 01:57I see doc is doing a lot of work on Android branch. Is new console branch on hold? greggirwin 05:03They're in Go mode, so only they can say. If they got the new console to a solid stopping point, it makes sense for them to capitalize on the Android progress, and also what @rcqls is doing on GTK for Linux. If they get *those* to a certain point, that might lead to more new console decisions that would otherwise have to be deferred. pekr 05:16More than the new console, I am looking forward to the /Library loading stuff. It already got postponed once. Hopefully work on 0.6.4 will be done in parallel to the Android build ... dockimbel 05:18The priority is on Android work for now, but we'll keep advancing on the new console and 0.6.4 features in parallel. mikeparr 07:50Red-by-example - major update concerning Draw dialect. Feedback please. It is for beginners, and I have avoided examples which need a deep understanding of Red. (Not all its links are complete - am working on that.) http://www.red-by-example.org/draw.html pekr 07:58Drawing of lines seems to be heavily distorted/jagged. I think it would be nicer with the anti-aliasing being turned on? IIRC, it was not turned on by default. If it is still the case, what I vote for is, to reverse the aproch and having it turned on by default? mikeparr 08:00@pekr I think I manipulated the png files a lot. The originals look better. I will update. dockimbel 08:02@mikeparr Good work! The first screenshot is incorrect, it should show a rectangle. It seems your screenshots are not using a big enough color palette, resulting in lost anti-aliasing effects. 08:08@mikeparr In your bouncing ball example, want-stop word is set several times, but never used in any other expression. mikeparr 08:14@dockimbel thanks - will fix today dockimbel 08:17@mikeparr In the following code: in-canvas: func [] [ ;-- for every tick canvas/rate: draw-freq 08:17The rate does not need to be set on each time event. 08:19Typo: Co-ordinates => Coordinates. 08:20 lisp Red [needs 'View "Sketch with mouse" ] should be: Red [needs: 'View title: "Sketch with mouse" ] toomasv 08:49@mikeparr Nice! Links don't match description: > You might also need VID: Official: http://www.red-by-example.org/vid.html > Red-by-example: https://doc.red-lang.org/en/vid.html 08:56First image (in 2.1) doesn't match code -- box coded, line shown, explaining text refers to line. mikeparr 09:26@dockimbel @toomasv - thanks. Fixed I think. Image quality improved. toomasv 09:51@mikeparr One more (in 3.2): top-left: 4x0 compose [pen red line (d) 3x66] ;compose only ( ) reduce ['pen red 'line d 3x66] > Either of these results in: pen 255.0.0 line 30x30 3x66 I think you meant: top-left: 4x0 compose [pen red line (top-left) 3x66] ;compose only ( ) reduce ['pen red 'line top-left 3x66] And Either of these results in: pen 255.0.0 line 4x0 3x66 mikeparr 10:01@toomasv arrrgggh! yes, fixed toomasv 10:03@mikeparr :) pen 255.0.0 line 30x30 3x66 still there. Should be pen 255.0.0 line 4x0 3x66 Also, throughout the text needs: 'View as @dockimbel pointed out. 10:18@mikeparr In the end of 5.1, problem here: do-move: func [event] [ if mouse-state = 'down [ ;-- and over the canvas draw-block: copy [] draw-block: compose [box (coord1) (event/offset)] ;--based on mouse coords ; print ["draw-block is: " draw-block] canvas/draw: draw-block ] ] Should probably be: do-move: func [event] [ if mouse-state = 'down [ ;-- and over the canvas draw-block: copy [] draw-block: compose [box (coord1) (event/offset)] ;--based on mouse canvas/draw: draw-block ] ] 10:29In 6.1 there is a sentence: > The rate of the canvas tick is once per second, so effectively, we have a clock minute-hand. I believe it should be called second-hand:interrobang: mikeparr 11:04@toomasv thanks for your scrutiny. Fixed most- will add 'title' later toomasv 11:10@mikeparr Thanks for your work! :hatching_chick: greggirwin 17:53@mikeparr, thanks for all that work, and thanks for reviewing @toomasv. 18:04Great work @mikeparr! Maybe add a link to https://doc.red-lang.org/en/draw.html#_shape_commands from the Shape command section, since it's an advanced subset? toomasv 19:30@greggirwin Always (ahem, sometimes) on alert! :cop: Thursday 31st August, 2017 geekyi 02:55@pekr :point_up: [August 29, 2017 11:52 AM](https://gitter.im/red/red/gui-branch?at=59a50f43bc46472974d2b3ff) > Looks nice guys. Now we need screen capture SW written in Red, as a testing, which will "visually" investigate, if the outputted result is identical :-) This is already there: 02:55 red Red [ Title: "Draw image in image" Needs: 'View ] ;; messy because test code based on someone's question img: make image! 10x10 draw-blk: reduce ['image img] lay: layout [ button "Click me" [ i1: to-image field-img draw-blk/2: i1 draw canvas/image draw-blk show canvas wait 1 unview lay ] field-img: field "abcd" return canvas: image 30x20 ] view lay ; click button first view lay quit 02:58Unless you meant video capture, then no. But could workaround that with saving frames as images, then using an encoder like *ffmpeg* 02:59@geekyi should clean up some of my test exampes and upload as gist? Or to community.. ldci 14:01Hi, Chamfer distance calculation is improved for RedCV and Red 0.6.3. Repo will be updated in a few days. (https://pbs.twimg.com/media/DIj_xl0XcAIQiPP.png) honix 14:14@ldci cool stuff! ldci 15:37@honix Thanks. BTW could I use your red-poster file as illustration for RedCV documentation? honix 17:52@ldci yep! :) Nenad really thinks to use this style for whole Red project. 9214 17:53that's a news for me :bear: :guitar: greggirwin 18:17Thanks for keeping us updated François! ldci 20:52@honix : RedCV documentation in progress (https://pbs.twimg.com/media/DIlgpfkXgAE5QEJ.jpg) rebolek 21:20:+1: AlexanderBaggett 21:22:clap: Friday 1st September, 2017 greggirwin 05:56Nice! planetsizecpu 08:50good job! Sunday 3th September, 2017 PeterWAWood 10:49@honix Here is a screenshot of your test on Raspberry PI (using latest commit on GTK branch): 10:49[![honix.png](https://files.gitter.im/red/red/gui-branch/v8Mt/thumb/honix.png)](https://files.gitter.im/red/red/gui-branch/v8Mt/honix.png) 10:50I also got this script error: >> do https://github.com/honix/red/raw/GTK/tests/draw.red *** Script Error: invalid Draw dialect input at: [fstk-logo 10x10 40x40 font font-label text 5x45 "image"] *** Where: ??? honix 18:00@PeterWAWood looks like you on old branch. You can try build Red from [this repo](https://github.com/rcqls/red/tree/GTK?files=1). Latest GTK stuff going here. 18:08Error message is fine because image! isn't ready for linux 18:13Wanna see how pi done those drawings! :) Monday 4th September, 2017 iceflow19 04:54Just curious, has there been any talk as to how VID is going to map to android widgets? It seems like there are more widgets than standard desktop widgets. greggirwin 05:44We'll know when the team makes an announcement. There isn't a doc, that I know of, outlining what widgets will be available as a base set. It's possible that the support will be limited, initially, to what is available on all platforms, or easily assembled from those. 05:46Even now, we don't have all possible styles any single platform may support. But FullStack also knows how important it is to have key styles available on mobile platforms. Wednesday 6th September, 2017 planetsizecpu 06:07Today I need some help, given the next code: >> ? box3 type word! base offset pair! 10x10 size pair! 100x25 text none! none ... >> b: to-word "box3" == box3 >> ? b B is a word! value: box3 >> b/type Script Error: path b/type is not valid for word! type Where: catch Stack: >> (b)/type == /type I want to get box3/type value of base through b, I tested many combinations, also with reduce, but I'm unable. rebolek 06:11Try something like b: get to word! "box3" planetsizecpu 06:14@rebolek ah, I forgot using get it works as wanted, THX! rebolek 06:15@planetsizecpu you're welcome planetsizecpu 07:18@rebolek I'm very happy now, because [it](https://github.com/planetsizecpu/forms/blob/master/forms.red) starts to be usable, despite being a pratice :) thx to you rebolek 09:17@planetsizecpu cool! greggirwin 16:31Nice @planetsizecpu! planetsizecpu 16:45@rebolek @greggirwin Thx I have some improvements in mind, but learning is a slow process over 50's :) greggirwin 17:51We just learn to be more selective as we age. Saturday 9th September, 2017 PeterWAWood 07:33Setting the transparency of a backdrop of a container very high on macOS results in a black backdrop instead of the container becoming transparent. The image below shows a container with a transparency of 254. Is this to be expected? It seems as though the transparency is ignored on Windows. 07:34[![Transparency of 254.png](https://files.gitter.im/red/red/gui-branch/ttfb/thumb/Transparency-of-254.png)](https://files.gitter.im/red/red/gui-branch/ttfb/Transparency-of-254.png) 08:40Is it possible to specify the "padding" between faces? ldci 09:08@PeterWAWood about transparency for macOS and Windows. You'll find in RedCV the rcvSetAlpha function that works fine qtxie 09:17Set transparency for window face is not supported yet. Only base face supports it. PeterWAWood 09:26@ldci @qtxie Thanks!! greggirwin 17:30:point_up: [September 9, 2017 2:40 AM](https://gitter.im/red/red/gui-branch?at=59b3a902210ac269200e9bae) @PeterWAWood, space works here on Win7. e.g.: view [space 100x100 button button return button] PeterWAWood 23:14@greggirwin Many thanks :+1: :+1: Sunday 10th September, 2017 ralfwenske 01:11On my OS X menus only work after switching to another app and back? Can someone confirm this please? (Immediately after starting there is no response when clicking on the menu.) PeterWAWood 01:12@ralfwenske Yes, it is the same for me. ralfwenske 01:16@PeterWAWood Do you think it is sufficient having it mentioned here or do we need to report this elsewhere? PeterWAWood 01:24@ralfwenske I think that it would be best to open an issue on Github. 01:26I don't think it needs to be fixed urgently at this stage but it does need to be fixed sometime before Red 1.0. ralfwenske 01:32reported: #3025 PeterWAWood 04:22Thanks ralfwenske 05:32@PeterWAWood It seems to be happening only when starting the app from Visual Studio - starting from console is ok. Starting from Visual Studio on Win10 is also ok. PeterWAWood 06:38On macOS, it happens when you run the script from the console. ralfwenske 07:16Mmmh? On my machine I do this: 07:18 192-168-1-5:~ ralfwenske$ /Applications/red --== Red 0.6.3 ==-- Type HELP for starting information. >> about Red for macOS version 0.6.3 built 7-Sep-2017/11:11:37+10:00 >> do %Dropbox/red-tests/menu-test.red submenu4 selected >> And on first click the menu responds Tuesday 12nd September, 2017 PeterWAWood 10:14I'd thought that I'd check out Red's native "look and feel" on macOS by trying to build a simple calculator that looks like the one supplied with macOS. (I got the idea from a training course for another language). I've started on the look first. This is close as I've been able to get so far: 10:15[![Calculators.png](https://files.gitter.im/red/red/gui-branch/r4F0/thumb/Calculators.png)](https://files.gitter.im/red/red/gui-branch/r4F0/Calculators.png) dockimbel 10:17Looks good. You should use a origin 0x0 to avoid the left padding. PeterWAWood 10:17I don't expect to be able to build a perfect copy with Red alpha releases (but hope I will by the time Red 1.0 is released). 10:17@dockimbel Thanks and thanks. 10:21I'm sure that I can get closer with the current release as @dockimbel just demonstrated. The code is in a [gist](https://gist.github.com/PeterWAWood/6cca1a238f16429848a3e35f0f49b52a). 10:27Already a little better: 10:28[![Calculator.png](https://files.gitter.im/red/red/gui-branch/Xk7F/thumb/Calculator.png)](https://files.gitter.im/red/red/gui-branch/Xk7F/Calculator.png) dockimbel 10:45For the "0" button, you can make the button bigger (like 3 times the normal width), and slide it left by one square: pad -55x0 grey-button "0" 166x52. 10:46For the upper part, where the windows frame extends down to the result text, that should be doable once in a few weeks, as we have a big need for such feature in Android, so we'll implement it on all supported platforms. 10:51Also, here I get the best results when removing the size 232x298 and the last return. 10:52The font face is also not matching the one used by the original Calculator app, if you can find which font it is using, that should help make it look very similar. planetsizecpu 12:01@PeterWAWood good design! :smile: @dockimbel may be a candidate to request-calculator dialog Oldes 12:15Needs some work to have it nicer on Windows too. 12:15[![image.png](https://files.gitter.im/red/red/gui-branch/HPGS/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/HPGS/image.png) PeterWAWood 13:22@dockimbel I haven't been able to find which font is used. I guess it is going to be Apple's SF which isn't installed by default and must be included in the App bundle. 13:23@Oldes It's not really a good test of the native look and feel for Windows ;-) 13:25[![Windows Calculator.png](https://files.gitter.im/red/red/gui-branch/fiNd/thumb/Windows-Calculator.png)](https://files.gitter.im/red/red/gui-branch/fiNd/Windows-Calculator.png) 13:28Perhaps somebody could come up with one that looks like ^^^ on Windows: 13:55@dockimbel I've included your suggestions though I have reverted to specifying a size as it gave me a better result. I did reduce the width by 1 pixel. I've updated the orange colour to match the one used in the macOS calculator. 13:55I've updated the [gist](https://gist.github.com/PeterWAWood/6cca1a238f16429848a3e35f0f49b52a) 13:58I think the remaining look issues are: 1. Background transparency 2. Extending the Window frame down over the first field 3. Getting the correct font 4. Working out how to render +/- as the original does. greggirwin 16:15Quick hack, without details, for a WinCalc layout: https://gist.github.com/greggirwin/432d7f1565179ed3e14ed1321ee3af89 Wednesday 13th September, 2017 PeterWAWood 01:00@dockimbel View seems to render some fonts differently to Apple apps. Could it possibly be related to how high definition screens are handled? The text on the left is in Apple's Pages. 01:01[![mac fonts.png](https://files.gitter.im/red/red/gui-branch/VJRJ/thumb/mac-fonts.png)](https://files.gitter.im/red/red/gui-branch/VJRJ/mac-fonts.png) dockimbel 03:42@PeterWAWood Indeed, please open a ticket for that. planetsizecpu 11:36For a given editable-type face like area , it is some flag to deactivate the default windows right-click menu? this is: copy, paste, etc. so it will not appear when user right-click the face dockimbel 12:19@planetsizecpu view [a: area do [a/menu: []]] planetsizecpu 12:22@dockimbel THX Thursday 14th September, 2017 planetsizecpu 08:48This morning I was dealing with menus, I found an unexpected behavior [here](https://github.com/planetsizecpu/forms/blob/master/forms.red) that could not find by now (surely is my misunderstand). When you right-click on last added face the menu does correctly, but if you click on other older face, that older face menu works for last added face, not for the face clicked. I have tested on line 219 to print and set-focus that older face to see if it changes behavior, but it still, so help would be welcome while I am testing :smile: dockimbel 09:26@planetsizecpu I can reproduce the issue, though unsure if it's your code or a View bug. Will have a deeper look later. planetsizecpu 09:31Thx 12:39@dockimbel don't waste your time, I found the wrong code on what it was saved on the face's on-menu func, now runs well :smile: dockimbel 15:59@planetsizecpu :+1: Friday 15th September, 2017 planetsizecpu 11:09Today's question seems very simple: how to delete a widget face from inside a panel face containing other widget faces? First of all, I did unset to delete the desired face from global context, but the face still on screen. I have seen on the parent panel/pane block the code of all faces contained by, but I don't know how to remove that one in particular. Some clue to do it? pekr 11:12isn't panejust a block!, so that you can remove the element as with normal series, and then refresh the container by show? planetsizecpu 11:55@pekr thx, I thought the same thing, but this block contains hundreds of lines, even if only have a widget, may be a complex process. I did unview face while face has focus, but that closes main window, so i'm thinking about to find a workaround, this weekend will have some time to spend :smile: pekr 11:59Did not try in deep with Red GUI yet, but I do remember my experiments with R2 GUI - by just sorting the pane you could get reordered elements. I also used the trick to visually disable a face - did a lookup, once found, inserted in front of the found face a semi-transparent one, so that clicks did not work, etc. Hence - not sure what you mean by "contains hundreds of lines" planetsizecpu 12:04@pekr at first time I did print face/pane on the main panel so it displayed a lot of lines, now I see it is more short Anyway I will test the way of disable, thx! dockimbel 12:39@planetsizecpu print is not your friend in Redbol for debugging. Prefer probe and help rather. planetsizecpu 12:57@dockimbel I know, later I saw its behavior. What about remove face or something similar? pekr 12:58I will do some experiments too, just need some coffee :-) planetsizecpu 12:58@pekr I is a good aproach :smile: Im thinking to take too dockimbel 12:59@planetsizecpu Yes, that's the way to destroy a face, just disconnect it from the face tree by removing it from the parent's panel block. planetsizecpu 13:00@dockimbel It is what I thought, but I saw pane do not store the face's name in the block, so how to find the requested one? 13:05Those who want may check [here](https://github.com/planetsizecpu/forms/blob/master/forms.red) over line 245 or so dockimbel 13:06@planetsizecpu You don't need face names at all, just the face object. Search for it in the pane. pekr 13:07 >> obj: [name: "Petr"] == [name: "Petr"] >> blk: copy [] == [] >> insert blk obj == [] >> find blk obj == [name: "Petr"] 13:07Doc just beat me to it ... dockimbel 13:07@planetsizecpu remove find Wnm/parent/pane Wnm should do. pekr 13:10@dockimbel are there any gotchas to the Android GUI, or just "mormal" (=hard) porting effort as usual? I can see Draw is almost done, Widgets too. Can't wait for the first teaser screenshot ;-) planetsizecpu 13:10@pekr @dockimbel Ok, I will test that way THX! I should push up a lot my Red skills :smile: pekr 13:12Just don't be scared that sometimes things are easier than one might think :-) 13:22@planetsizecpu Here's your one-liner, but it works:-) view win: layout [text "Remove widget" button "remove widget" [remove win/pane]] 13:23At first press, it will remove text, at the consecutive one, it will remove the button you just press .... 13:25Here is another variant - without explicitly generating layout and coming from top (win), but rather going up via the parent element: view [t: text "Remove text" button "remove text" [remove t/parent/pane]] 13:26Just beware - it will fail at the second attempt to press the button, as ttext widget will no more exist in the parent pane ... 13:48And here's your innacurate disable overlay. Just beware - there should be some system ready functionality for that, as that simple overlay is just a trick and the button might still receive e.g. keyboard or time event, etc.: view win: layout [b: button "overlay" [append win/pane make face! [type: 'base color: 0.0.0.180 size: b/size offset: b/offset]]] planetsizecpu 16:37@pekr THX very much, remove face/parent/pane works as wanted for my script, but I must refine it, as every time we click delete, it removes the first face on the pane block, so I must go first to point the desired face on the block (maybe with find), and then remove it that way. I do this things to learn, so it will be a good challenge :smile: pekr 16:39use remove find face to find the face you want 16:40sorry just on a cell phone, so not quoting code planetsizecpu 16:42@pekr I will test it tomorrow just have time to shut-down now greggirwin 23:34@planetsizecpu, you may want to store reference to faces you want to to delete, so you can find them later. view win: layout [ button "remove widget" [remove find win/pane t] t: text "Not me!" ] Saturday 16th September, 2017 planetsizecpu 09:16@pekr @greggirwin Thx, I wrote remove find face/parent/pane face in the on-menu event of every face, this works as I want because it is done by the same clicked face, so, problem solved and I can continue development of menu options greggirwin 17:36Nice. Sunday 17th September, 2017 luce80 09:49Can someone, please, show me how to use on-wheel to move a face ? dockimbel 12:14@luce80 Sure: view [ size 200x400 base on-wheel [face/offset/y: face/offset/y + (5 * event/picked)] on-created [set-focus face] ] The key part is giving the focus to the face where you define the on-wheel handler, so that it will receive the wheel events. By default, the window is receiving those events, so you can also put an handler there: 12:17 lisp view/options [size 200x400 b: base][ actors: object [ on-wheel: func [face event][ b/offset/y: b/offset/y + (5 * event/picked) ] ] ] luce80 15:21@dockimbel Thanks! I suspected the "focus" part but the real unknown was the event/picked dockimbel 15:46@luce80 It's in the [documentation](https://doc.red-lang.org/en/view.html#_event_datatype). luce80 16:15@dockimbel RTFM more deeply ;) Wednesday 20th September, 2017 rcqls 11:11Some improvements (first development of image and drag and drop) have been done in the GTK branch on my repo (see the PR in the official repo to see the evolution). Nothing perfect yet but I try first to have something mostly useable. 9214 11:12@rcqls :+1: keep pumping! dockimbel 11:19@rcqls Just to be sure we're on same page: drag'n drop is a View engine feature, not a feature of the backends. rcqls 13:28@dockimbel Yes! It is indeed the functionality of red/view engine and not the gtk one's. Just using the gtk mouse, press and release button signals. At the beginning, I was a bit confused but I realized pretty qucikly that drag and drop in red/view was unrelated to drag and drop in gtk. This was discussed very early (in France) this morning with @qtxie. The most difficult part to understand was the communication of the offset from gtk to red/view (via get-event-offset) rgchris 18:02I have a small UI here: values-for-button-1: [ "Button 1 Field 1" "Button 1 Field 2" ] values-for-button-2: [ "Button 2 Field 1" "Button 2 Field 2" ] view also ui: layout [ below field 200 "Default" field 200 "Default" button "Button 1" [ set list-of-fields values-for-button-1 probe face/parent/pane/1/text ] button "Button 2" [ set list-of-fields/1 values-for-button-2/1 set list-of-fields/2 values-for-button-2/2 ] ] list-of-fields: collect [ foreach face ui/pane [ if face/type = 'field [keep in face 'text] ] ] Button 2 updates the fields, Button 1 does not, although SET did seem to work as intended. 18:41Also—is there a way to refer to a layout/face object in creation? view [do [probe face/pane]] view [field do [append list-of-fields in face 'text]] greggirwin 18:58@rcqls, great! rcqls 18:59@9214 @greggirwin Thanks! greggirwin 19:08Interesting @rgchris. A bit of tinkering hasn't given me any clues. It looks like it's not being rebound, but even showing the field face didn't show the new value in the UI. And just using simple objects, to see if set was confused somehow by the differing contexts, doesn't show the issue either. The data facet of the face isn't changed from button 1, but is from button 2. Maybe add some detail comments and file a ticket. rgchris 19:36Done: [#3048](https://github.com/red/red/issues/3048) greggirwin 19:43Thanks Chris. Thursday 21st September, 2017 dockimbel 06:27@rgchris > Also—is there a way to refer to a layout/face object in creation? view [do [probe face/pane]] view [field do [append list-of-fields in face 'text]] Not yet, but such feature could be easily added. Open a wish ticket for it, and it should be granted at once. ;-) Also, self can be used to refer to the container face, but from the console, it seems to be bound to console's window instead of the new one. rgchris 07:12Done: [#3049](https://github.com/red/red/issues/3049) 07:23This is somewhat related: https://github.com/red/red/issues/3050 pekr 11:56While waiting for the Android GUI and furthe View/VID related developments, I would like to open a more broad topic. Please ignore, if you are pressed for the time, etc., but of course some feedback is welcomed. @rgchris opened the topic of VID apps scalability, pointing out to two aspects mainly: * regular words being used, "leaking" into global context. One of suggestions was to use hash #my-button names and collect in map!, etc. The question is, if modules in future might provide some kind of solution to that * direct access to face!object fields. Would you find it useful to have something like set-face my-button 'color red, simply accessors? Most of the time, those would directly assign a value, but also could do some other stuff eventually Sorry Chris, if I confused some of your points. As for Red View/VID, I can still see the architecture open for future improvements. IIRC, some stuff like forms handling etc. was planned, so maybe the above points are going to be adressed anyway .... greggirwin 18:15@pekr, it would be nice if contexts could capture view face references. @rgchris and I built a system on REBOL IOS that had a fairly extensive UI. Naming conventions were our only way around that, which was fine in our case (small team, limited scope), but more is needed for larger systems, especially if you built extensible apps. Faces are just objects. I think the accessors you're talking about will come with object enhancements as a natural consequence. pekr 18:17Thanks Gregg! 18:19As for Accessors, those could be system (object) related, or just implemented above that, via functions like set/get-face(t). We will see - I can see scheduled some improvement in regards to objects - object events and ownership system. Though I don't know, if it might be related .... greggirwin 18:24It shouldn't even need to be implemented above it. Any kind of access control or monitoring you'd want to do on a face you might also want to do on an object that has no UI component. Since faces are just objects, it comes for free. rgchris 21:03@greggirwin what did you mean by *'We already have the ability to name fields'*? ([Comment on 3050](https://github.com/red/red/issues/3050#issuecomment-331227311)) 21:04I couldn't see any mechanism other than the set-word! approach and no words in the face object like face/reference or face/name. 21:05In Rebol 2, you have the face/var field, albeit is set according to a set-word! assignment. greggirwin 21:43I meant the set-word approach. We don't currently have a name/ID facet. If extra isn't enough, because it will surely be heavily overloaded for various purposes by people, then we get to start asking more questions. e.g.: - Is none the default, or do faces get a default style- name? - Do names have to be unique? - Is it used mainly as in your example, or are you thinking it's also something a selector-oriented language would use to find and stylize? rgchris 22:11* Yes—none is the default, you'd only explicitly apply to faces. * No—it's up to the gatherer how to handle ambiguity. If there was a built-in gatherer, then maybe. * There's lots of ways you could use it, but mainly thinking of automated extraction. 22:13Also too, injection. Think a Rebodex-type application with as few set-words as possible. 22:20 lisp ui: layout [field 'name field 'phone field 'email field 'twitter] set-fields ui #( name: "Gregg" phone: #123456789 email: gregg@gregg.me twitter: @gregg ) 23:46face/extra is a good stop-gap, but I'd suggest this usage was codified as face/name per #3050. See this SO [answer](https://stackoverflow.com/questions/46350543/use-strings-to-create-words-and-paths-in-red-language/46354461#46354461) for its utility. Friday 22nd September, 2017 planetsizecpu 07:27Today I'm testing this function to copy current selected face clonew: func [face [object!]][ str: "new_face" set to-word (str) copy face ] It works as it make the new _face, but unexpectedly the selected source face disappears from screen, and stills in global context. Looking both face's values seems correct, so I thing there could be some internal field making both faces same to vid dockimbel 08:30@planetsizecpu IIRC, there's an open ticket for supporting copy on face! objects. The current copy will just copy the object, but not the underlying system resources, so it could cause troubles and lead to unstable or even crashing states. You should rather create a new face, and set its relevant facets from the old one. planetsizecpu 08:51@dockimbel right, at first I thought to save a few lines of code by copying the whole face, Thx! Tuesday 26th September, 2017 rebolek 09:49> draw keyword in VID now accepts a Red expression Wasn’t this considered dangerous in Rebol? dockimbel 10:17@rebolek How so? rebolek 11:22IIRC it was possible at first, but was disabled later because Rebol code in Draw dialect was considered as possible attack vector. Cyphre would know more, it was him who reported it to Carl. dockimbel 11:31We don't allow Red code in Draw, we allow draw keyword in VID to accept a Red expression (returning a block) instead of only a literal block. rebolek 11:31Ah, OK then. Wednesday 27th September, 2017 planetsizecpu 07:47When you call a function like func [face [object!]][...] it have no face/name field. So how to know the face's name in global context? rebolek 08:04what for planetsizecpu 08:13@rebolek I need the face's name for unset from global context and delete it from some list inside the function rebolek 08:15@planetsizecpu then you probably need to keep record of your faces somewhere or store the name in extra field. Or store faces directly without names planetsizecpu 08:18@rebolek yes, by now I'm using face/text field as it contains the face's name, it works as extra, but I think in other uses would be very grateful to have a face/namefield, do you think so? rebolek 08:26@planetsizecpu I don’t actually. If you want to work with dynamic faces (to add or remove them from pane) you should use faces directly IMO and not reference them by name. It seems to me that it’s much easier that way. planetsizecpu 08:40@rebolek In my script is the user who dynamically uses faces, so we must have a name or other way for refer to, I can't figure how to manage with an unknown number of faces, by my logic the face's name is the right way. May be it is an exception case, I don't know. Anyway from my beginner point of view I don't see very complicated to implement the name field, may be for v1.1 :smile: rebolek 08:41@planetsizecpu it is hard to help without any code, but can’t you have your own list of name/face pairs? 08:42Does the user write VID code? planetsizecpu 08:48@rebolek Thx, I have a face list, you may check [it](https://github.com/planetsizecpu/forms/blob/master/forms.red) there is a func on line 243,but I don't want you waste your time as it is only a pratice, and by now the problem is solved. rebolek 08:54@planetsizecpu Thanks, I am looking at the code, I may try add some comments and change some code, if you are interested. planetsizecpu 09:59@rebolek of course I am interested, I just do these things to learn red thx greggirwin 17:56@planetsizecpu, this is the kind of thing extra can be used for. It's not that it's hard to add a /name facet, but whether it's needed. @rgchris opened a wish ticket for this recently, and there is value in it, but it raises other questions, so isn't just a simple feature addition. rgchris 17:57@planetsizecpu see #3050 Thursday 28th September, 2017 planetsizecpu 06:09@greggirwin @rgchris Thx, It seems a question to rate carefully, I pointed to v1.1 for not disturb the team from their objectives, now #3050 means more or less that I'm asking for. If you think it deeper, there may be cases we don't know at this time where reference may be needed. rgchris 15:57Note that my most recent bias is that a lit-word! be translated to face/name. **view [field 'foo "Text of Foo"]** Friday 29th September, 2017 planetsizecpu 07:20so the syntax may need modifications for existing scripts, maybe in the prefix form view [foo: field " Text of Foo "] would be easier since "VID" knows foo, I do not know, it's a question one level out of my reach. rgchris 19:35I think it should two separate things: Set-Word! notation should still refer to setting a face to a word in-context (global if your layout is defined in the global context). The Lit-Word! notation would be an internal naming system that would be available in Face/Name *and* a Map!—perhaps attached to the layout face. Sunday 1st October, 2017 rgchris 15:54Is it necessary to have separate values in the face! object for IMAGE and DRAW? Seems it could be implied that where face/image is a block that it be processed as the Draw dialect. pekr 16:30Maybe similar question if we need face/text, if the draw is present and you can put text using Draw facilities? greggirwin 16:47If you conflate the facets, you can't draw over an image, for example. Yes, you can then put the image/text in the draw commands, but how do you access them? i.e., you can no longer use face/image or face/text. rgchris 16:50@pekr Draw is a dialect that represents an image—I see face/draw as both redundant and unintuitive. Similarly if face/text is a block, could be assumed to be a rich text dialect. 16:55@greggirwin Seems to me an easily managed edge case (in the case of an image—making no argument for text here). Better to elevate the Draw dialect as equivalent to an image! in face/image—show some faith in that dialect. 16:57Having face/draw is little better than face/effect/draw in ethos. greggirwin 17:01But it's not equivalent to the image. As you say, it's a dialect. I don't see it as an edge case, because every user access to /image then has to be aware that it could be a draw block or an image. And how do you separate the facet data from the drawing commands? I'm streaming questions, as I haven't thought of this before. rgchris 17:28I meant it's an edge case to have to draw over an image—more intuitively handled in such cases by having the image! be included in the draw code. 17:31@greggirwin As to the user have to check what type of image it is—in such cases where they need to know, they most likely already know. I'd rather be able to say face/image: load-svg %some.svg or face/image: my-drawing or face/image: %some.png. 17:31*'And how do you separate the facet data from the drawing commands?'*—not sure what you mean... 17:49This change would refine the graphical value of the face: *now*—four states (face/image *and* face/draw, face/image, face/draw, both none); *proposed*—three states (face/image is image!, block! or none). Monday 2nd October, 2017 planetsizecpu 09:53@rgchris @greggirwin Too complex to my skills! at this time I have no clue on draw. I feel that I do not explain myself well about face/name I meant it would be a read-only value not subject to modifications, (because probably meant modify code/global context) but available to the user as other values. Wednesday 4th October, 2017 ldci 12:28Hi, RedCV library is updated for Red 0.6.3 here: https://github.com/ldci/redCV greggirwin 16:15Thanks @ldci ! Tuesday 17th October, 2017 toomasv 14:06How to restrict dragged face's offset? E.g. in following I'd like to restrict the red square from being dragged out of the left side, but it starts to flicker: view [ size 200x200 at 0x180 box 20x20 loose red on-drag [ if face/offset/x < 0 [face/offset/x: 0] ] ] greggirwin 17:10It doesn't flicker here on Win7. What if you add return 'stop in your if block? toomasv 18:21@greggirwin Thanks, tried but no change. I am on W10 console. 20:05@qtxie Is this ^ method correct for restricting offset? And if so, I report, that on W10 gui-console (build 16.Oct.17) this results on flickering face: ![flickering](http://toomas.vooglaid.ee/red/flicker.png) rgchris 21:45@toomasv Also too: face/offset/x: max face/offset/x 0 Wednesday 18th October, 2017 qtxie 00:50@toomasv Yes. It's flickering here too. I think we need to another way to do it. toomasv 03:18@rgchris Thanks, yes, it is equivalent. Unfortunately flickers also equivalently :( @qtxie What the other method might be? In above method there seems to be conflict between drag implementation and explicit offset manipulation. Flickering is caused by face jumping between new drag-position and restricted position. greggirwin 04:14Just guessing, but if loose faces move and the OS refreshes before you get on-drag, that could do it. Have you tried turning off auto-sync? Turning it off here has no effect. That is, the drag still works as normal, but I can't dupe the flicker on Win7. pekr 04:37Flickering, in general, was long time topic during the R2 View. According to Cyphre (who did View) and also some other guys or even Carl, techniques like double or triple buffering might improve the situation. Wikipedia describes this stuff too. Some other term here is Tearing. I've also read some article, that in some cases, even double buffering does not help. The AmigaOS had something called Virtual Blank Period, where stuff was drawn in between the refresh of the beam. Some ppl say, that OSes like Windows could not solve that, unless DirectX was used. Well, this is all theory, the real reason for the flickering - who knows ... 04:44I e.g. created a news scroller. For R2, R3, Red. When I used just letters, it was OK, when I used the background behind letters, it flickered. Later on, it was fixed, maybe related to @qtxie doing some work on text using DirectDraw, or something like that, dunno. do http://2zone.cz/pekr/news-scroller-red.red It just seems to be much slower then I remember. The code was ported from simple Cyphre's code for R2, might be wrong in some places .... 04:45(beware - it is borderless news scroller, you have to kill it by OS means ....) greggirwin 05:03Will be OS and device dependent too, unless we n-buffer things, which is slower and more memory intensive. Certainly choices have to be made. Apple focuses on making things look smooth and slick, but it doesn't come for free. It's also still very early days for things. Back ends can be improved, and the more people we attract on each platform, the better our chances of getting help with that. 05:05I remember Carl saying that View was a resource miser, while VID was like government spending. I think the extra buffering was in View in R2 though. 05:10Remember, too, that your code is extremely high level, moving large faces, which have to be composited. If you look at some of the other graphic demos that have been done (e.g. bubbles, particles, vector balls), Red does really well. With Red, as with Rebol, you can do some things *very* easily, but you may need to expend a bit more effort to also make them faster. pekr 05:11OK, my report above was wrong. Uncommented wait code. Will do some testing with receng Red GUI state, my last attempts are more than one year old. greggirwin 05:13At a glance, you're moving an entire face that contains drawn text. Why not just change the drawn text offset? pekr 05:16I identified the "problem", whatever value I set to wait, it slows down significantly, even with wait 0.00001 05:16Well, I don't know. It was done by Cyphre ... maybe he wanted to provide some effects around it, dunno ... greggirwin 05:17As with any event-loop model, you don't want to put a synchronous wait in there. pekr 05:17It is not a well written code for Red indeed, just a crude port, so that it worked under Red/R2/R3 05:18Later on, I will try with some clean code, moving just some box around, we will see ... greggirwin 05:25Seems to be the transparency on the large face that slows it down. With an opaque face, it's screaming fast using draw changes. 05:29 Red [ Title: "Simple news scroller" ] system/view/auto-sync?: no screen-size: system/view/screens/1/size news-bottom-offset: 0x100 news-height: 0x100 message: "Simple news scroller. Who makes me faster and smoother? ..." ;--- style for draw dialect bold64: make font! [style: 'bold size: 64 color: white] ;--- just to calculate text size .... txt: make face! compose [size: 3000X200 text: (message)] txt/font: make font! [style: 'bold size: 64 color: white] text-size: size-text txt offset: as-pair screen-size/x 0 draw-blk: compose [font bold64 text (offset) (message)] win: view/options/flags/no-wait compose/deep [ origin 0x0 news: base green (as-pair screen-size/x 200) draw draw-blk ; 0.255.0.255 ][ size: as-pair screen-size/x news-height/y offset: as-pair 0 (screen-size/y - news-bottom-offset/y - news-height/y) ][no-border] forever [ offset: offset - 1x0 if (offset/x + (text-size/x)) < 0 [offset/x: screen-size/x] draw-blk/4: offset show news do-events/no-wait ] 05:33You can leave auto-sync? on and remove show news with no visible speed hit. 05:39If I change the height of the face to 50 and the font size to 32, I can't tell if it's smoother, because it goes by too fast. pekr 06:45Thanks Gregg, it now works as I remember it used to work before. toomasv 07:24@greggirwin Thanks! auto-sync?: no did the trick for me greggirwin 15:41Glad that's so @pekr. @toomasv, cool. Saturday 21st October, 2017 toomasv 19:40My try with [hanoi-tower](https://gist.github.com/toomasv/918853e224591997ce857f306ac71936): ![hanoi-tower](http://toomas.vooglaid.ee/red/hanoi.png) Any suggestions for improvements? greggirwin 21:02Doesn't show anything here, until I close the window, then flashes the graphic briefly. 21:03My old one is here: https://gist.github.com/greggirwin/5da11ee2893f87ccdfc883f670f70368 Though it doesn't run well under current versions it seems. Have to head out, but will revisit at some point. 9214 21:04@greggirwin took you 15 years to perfect :^) greggirwin 21:04I do have another version here, which is better, but still not great. 21:04Well, still not perfect it seems. :^) Sunday 22nd October, 2017 toomasv 10:08@greggirwin Thanks, your layout is beautiful! Though it doesn't run here on W10 :worried: . Mine was meant just for hands-on playing, not for auto-solving. I forgot to include Needs: View. Might that be the reason for not showing? Monday 23th October, 2017 greggirwin 18:14I'm on Win7, and ran under View by pasting into console, so the Needs shouldn't block it. 18:16May be worth looking into why mine doesn't run on Win10 as well. Another item for my list. Tuesday 24th October, 2017 planetsizecpu 17:15@toomasv works well here on w10 console paste, did it in 40 moves (w/o training :smile:) in w7 image gone 17:21@greggirwin yours also stunning run, liked to see it does better tan me :worried: haha toomasv 17:43@planetsizecpu Hey, updated [hanoi](https://gist.github.com/toomasv/918853e224591997ce857f306ac71936) to 5 discs and better looks inspired by @greggirwin. greggirwin 17:45@planetsizecpu, it does better than me too. :^) 17:47@toomasv, nice look! Interesting that I see the disks now (win7), and can play, but don't see the spikes. 17:47[![image.png](https://files.gitter.im/red/red/gui-branch/kBeK/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/kBeK/image.png) 17:47OK, now that's really funny. I did an Alt+PrScr, which shows exactly the opposite. 17:48[![image.png](https://files.gitter.im/red/red/gui-branch/qzE0/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/qzE0/image.png) 9214 17:48@9214 don't try to printscreen the discs, that's impossible... dander 17:49interesting, works fine for me (win10) greggirwin 17:50Yes, it's a Win7 issue, but different than before. toomasv 19:06@greggirwin Interesting indeed. Two alternate realities :) Wednesday 25th October, 2017 endo64 06:29Wow! Very nice hanoi!! Work on my Win10. geekyi 08:55svs: system/view/screens/1/pane 08:55FIX: better fix for unview/all issue, though still not fully correct. 08:56So a temporary thing. Was wondering what it was when I saw it in the globals Thursday 26th October, 2017 toomasv 16:21Added button "Random" to [hanoi](https://gist.github.com/toomasv/918853e224591997ce857f306ac71936) to randomize configuration and ability to mark target peg by clicking on it. greggirwin 17:08Still can't see pegs here, so clicking on them as targets doesn't seem to work. Still fun though! I like the words you've chosen (attach, detach, constrain, let-go). Makes intent very clear. toomasv 17:12@greggirwin Can I do something to make pegs visible "cross-Windows" or are my fingers too short for this (as I belive they are)? greggirwin 17:14Not sure what you mean. It's also not clear to me why they don't show up on Win7. toomasv 17:15I mean - has this problem anything to do with the code? greggirwin 17:15Well, I just removed black from the post style, and now I see them! toomasv 17:16That simple? Whts's wrong with black? greggirwin 17:17No idea. If it works on Win10, it's really odd. We should try to narrow it down for @qtxie. toomasv 17:17What if you replace it with 0.0.0? 17:19And does it change color on clicking? greggirwin 17:19Playing now. 17:21Seems to be an alpha channel issue. 0.0.0, or and 3-tuple doesn't show, but as soon as I add the alpha segment to the tuple, any color works. *And* it doesn't matter what the alpha value *is*. toomasv 17:23Is that enough for @qtxie? greggirwin 17:24It might be, if it behaved the same out of context, but that seems not to be the case. :^( 17:25Seems to be the combination of adding the style def. Wow. toomasv 17:26Is my style def buggy? greggirwin 17:27Doesn't look like it to me. 17:28Writing up a ticket now. toomasv 17:29black in post style def (1st line) is superfluous. greggirwin 17:33Well, maybe I'll write up a ticket. I can't dupe it now, out of context. 17:36They do appear briefly, when I close the Hanoi window. toomasv 17:40Thank you, Gregg! planetsizecpu 17:52@toomasv Now having fun with towers, good job toomasv 17:52@planetsizecpu Happy playing! :) greggirwin 17:57OK, I'll have to stop digging, but it's stranger by the minute. The image used at 0x0 *seems* to cause a z-order issue when black is in place for the post style. Removing that, or changing it to any other style, even a button, makes the problem go away. That is, the image seems to want to come to the front of the z-order, covering the posts, but *not* the discs. It sounds crazy, I know, so I could be off base. 17:58This is after whittling the code down to a bare minimum, then making changes to Hanoi to test. toomasv 18:01@greggirwin I had a feeling that something s wrong with image after looking at your screenshots above. Friday 27th October, 2017 qtxie 01:49We use some tricky ways to support transparent face on Win7. It's not perfect and always on top of the other normal faces. greggirwin 15:51Good to know. Thanks @qtxie. toomasv 16:28Thanks, @qtxie ! @greggirwin, does it help if I move image from 0x0 to eg. 0x1 OSLT (not sure if this compuspeak acronym is well known: "Or Something Like This/That")? greggirwin 19:23New acronym to me. e.g. should cover you there without it, in this case. 19:23I'll try to remember to test when I have a chance. 9214 19:23OSLT is NATM :^) geekyi 21:56@geekyi notes: OSLT: Or Something Like NATM: New Acronym To Me (Or: Not At The Moment? :p) Saturday 28th October, 2017 9214 08:19@9214 9STGIR (@9214 says that @geekyi is right) Sunday 29th October, 2017 BeardPower 15:26Hi all, Is there a good solution to auto-center a button in an across layout? Something similar like the auto-spacers in Qt? @9214 posted an example, which uses pad, but I need the buttons 1 and 2 to be perfectly centered in the window, so I would need to calculate the offset myself. What I want to achieve (the letters and numbers are buttons): a b c d 1 2 Qt has horizontal and vertical auto-spacers, so they calculate the spaces on the left and the right automatically (similar to centering the text throughout multiple columns in a spreadsheet). Monday 30th October, 2017 dockimbel 03:01@BeardPower You can use the center-facefunction for that: view [size 200x200 button "Ok" on-created [center-face/x face]] Direct support for centering faces in VID should come in 0.6.4. BeardPower 11:21@dockimbel Great, thanks! :+1: 11:41I was reading a lot about the Draw dialect and AGG recently (as Haiku and Rebol is also using it; Red having the same features or even better in the future), I stumbled across another software rendering project: [Blend2D - next generation 2d vector graphics engine](https://blend2d.com/). I think it would be an interesting alternative. pekr 11:46My understanding is, that Red uses platform native rendering. The advantage is, that as it gets developed along the OS, it is included with OS, hence no external dependency, etc. BeardPower 11:51Yes, but maybe there are some ideas for extending the Draw dialect and AGG/Blend2D could be implemented directly into Red :) 11:54I only read this: New graphic dialect in REBOL is based on Anti-Grain Geometry. So is it only using the same commands, is it integrated into REBOL or is it using AGG as a dependency? pekr 13:31Rebol was using AGG internally and ditched its own draw engine. Red is using native OS API, but at the draw level, it is mostly compatible to Rebol ... Oldes 13:35Problem with Blend2D is, that it is one man project and it is supposed to be released several years already. Also it should be written in cpp with all its features so it will be very unfriendly for embedding with c like languages. Agg is also cpp, but was on the other side written for easy integration into c projects. It was also one man project and Maxim unfortunately passed away. 13:37B2D autor is easily accessible here on Gitter - https://gitter.im/blend2d/b2d 13:39https://gitter.im/blend2d/b2d?at=58de5baf8bb56c2d116088b0 <-- here is the claim about no c support plans. pekr 13:44I remembered some Czech author, making some vector library. He studied AGG and I remember Cyphre talking to him. Maybe the name was Fog library. Doing some search, I can see Fog was merged into the Blend2D, so maybe it is identical project. Who knows, but those one-man-show projects possess some danger too ... 13:46It must be him, as he reffers to AsmJIT, Petr Kobalicek, that's the name I remember :-) BeardPower 14:10@pekr Yep, it's from the author of Fog. 14:18@Oldes I see. It seems that many developers of some new microkernel based OSs (like Fuchsia or Redox ) favor C++ or another language, but they claim that the integrating of C like projects is made easy as well. greggirwin 18:01> center-face/x face Be sure to pull recent code to get /x support`. It's a new feature. BeardPower 19:52Thanks for the hint! Thursday 9th November, 2017 ne1uno 03:33@rebolek no error real win7 recent built gui-console rebolek 06:53Thanks, I had old build. BeardPower 12:14Will patterns like in Rebol be supported in the future as well or is there only the general pattern system in Red? pen red yellow line-pattern 50 30 line-width 30 circle 200x200 150 dockimbel 14:42@BeardPower Yes, they will. @qtxie can tell more about it. BeardPower 15:14:+1: Tuesday 14th November, 2017 jocko-jc 07:40How to set the color of a button in view ? JenniferLee520 08:21@jocko-jc You might not be able to change the Button color because the OSes do not allow that . Use Base instead of Button. jocko-jc 08:24it is a surprise to me as in rebol this is possible 9214 08:25@jocko-jc yes, because Rebol doesn't use native GUI jocko-jc 08:36I see greggirwin 18:18@JenniferLee520 and @9214 are correct. Wednesday 15th November, 2017 greggirwin 00:26Looks like setting a text value in a style, at least for text and field styles, which parses as a date, will become a date value and form as such by default. view [ style txt: text "2017-12-24" txt text "2017-12-24" style fld: field "2017-12-24" fld field "2017-12-24" ] @qtxie, is that by design? qtxie 02:22Yes. Is there some issue caused by it? greggirwin 02:25It surprised me, changing the behavior of one of the 7GUIs apps. I fixed it already, so it's not important for that, just something to note, that the style value produces different results than the text facet does directly. dockimbel 06:23@greggirwin Worth a ticket to investigate further. greggirwin 19:53https://github.com/red/red/issues/3109. Is not date! specific. Monday 20th November, 2017 BeardPower 13:15I have a question about clipping. A face can be dragged, by using the *loose* keyword. Will the components like image, buttons, drawings etc. be clipped automatically, so they don't use resources? E.g. creating a scrolling view with many drawings. Will the drawings, which are visually clipped, still be kept in memory, or is there some streaming mechanism, like with tile maps, behind the scenes? endo64 15:38I think it's all OS's responsibility. greggirwin 18:22@BeardPower, that would be up to you I think. The OS can optimize some rendering, but the objects still have to exist behind the scenes, unless you manage loading and unloading them yourself. i.e., the OS can't know what logic you require as far as what to keep around. BeardPower 18:59@greggirwin Sure, but as the draw dialect is implemented in Red and it's using the drawing primitives provided by the OS, Red itself could have implemented some clipping. So I assume, a scroll view is just the standard scroll view, which is provided by the OS? greggirwin 19:57Early days for those optimizations, but @qtxie would have to say for sure. Also, consider that you may want to render in an off-screen buffer to create images. Tuesday 21st November, 2017 BeardPower 00:08Sure. I'm just thinking about which would be the better solution: rolling my own infinite scrolling view or count on the implementations on each platform. greggirwin 00:13You could do some testing with text-box!, though I'm not sure it's ready to be judged by any performance metric. 00:15Until we have GC, it may be a moot point. If you have to reallocate things, with no GC, you lose. 00:15New Gitter behavior here. Half my messages have a salmon background, and I get a message about comm error with gitter. Reposting seems to work though. BeardPower 00:18I don't have to reallocate things, because the scroll view behaves like a streaming tile-map. It's reusing cells. Once the objects move out of the viewing area, the new objects will be loaded and the cells will be reused. greggirwin 00:18Ah, got it. BeardPower 00:18Yeah, I got the message 5 minutes ago. gitter is working again. 00:22New cells will be allocated, once the view will be zoomed out and de-allocated when zoomed in again. I don't think all platforms provide such optimization. 00:29So if I want to implement this as a custom widget, I should use the base type, right? I'm asking, because the blog mentioned a **Custom widgets creation framework**. How will that framework be different to using the base type? Any ETA? :) greggirwin 00:31You may want to use panel. @rebolek has built a grid style, and may have recommendations. 00:31I can't comment on the custom widget framework. BeardPower 00:32@rebolek already showed me his code. greggirwin 00:33He's ahead of me even when he's not here! BeardPower 00:45:godmode: 00:51From the docs: base: This face type should be used for any custom graphic component implementation. greggirwin 00:51Seems like the correct choice then. BeardPower 00:53:+1: I will also keep my eyes open for the *custom widgets creation framework*. qtxie 08:04@BeardPower No optimization for now. The drawing is visually clipped by OS. BeardPower 11:47@qtxie Thanks! Can you also tell something about the *Custom widgets creation framework*? ETA or what it will offer? rebolek 11:49@greggirwin Actually, I build text-table style, it is not a grid style, cells are drawn using draw and cannot contain other faces. But grid should not be that hard to do. Wednesday 22nd November, 2017 qtxie 02:29@BeardPower No ETA yet. Maybe after android release. BeardPower 03:21:+1: Sunday 26th November, 2017 rebred 11:57Would it be possible to read the mouse window/global coordinates instead of having to be over a base ? shagrouni_twitter 18:55Hi, Is it possible to make right_to_left widgets in Red gui? greggirwin 19:59@shagrouni_twitter, I haven't seen any mention of that, so I imagine it's TBD. However, Red uses native GUI widgets so it may depend on the OS locale support at that level. Have you tried it and it didn't work? 20:01@rebred, see: https://doc.red-lang.org/en/view.html#_global_event_handlers rebolek 20:54@shagrouni_twitter I believe it should be handled by OS, try it and if it does not work, fill a bug report. Monday 27th November, 2017 shagrouni_twitter 09:38@greggirwin, @rebolek: thank you. https://doc.red-lang.org/en/view.html#_face_object As i can see from this document, a Face object can have "flags" and "options" facats I am not sure what the posible values can be set but i hope RtoL is one of them. My knowledg of red programming is near to none, so I will explore this once i became more familiar with the language. endo64 10:38Possible flags and options are already in the document. shagrouni_twitter 11:00@endo64 Yes thank you, but still can't see RtoL values. greggirwin 17:26That's why I think they're TBD. Need to decide how it works with the OS, and *across* OSs. That is, the OS may handle it all for native types, but if you write custom styles using base, or if you use draw commands, are they affected as well? If the OS doesn't support them at all, or only partially, can we override it? Can you mix RtoL and LtoR styles just by setting a flag? One of the key things here is having someone with experience in the area help with design questions like that, including information gathering of best practices. Feel free to volunteer @shagrouni_twitter, even if you don't know Red. Your RtoL knowledge is valuable (including where other systems fall short). 17:26We can set up a wiki page and you can make notes there, if you like. luce80 18:53I think there is a problem with the size of buttons at least on Win7: >> view/tight [button 50x50 button 50x50 [print [face/offset face/size]]] 52x-1 52x52 >> view/tight [base 50x50 base 50x50 [print [face/offset face/size]]] 50x0 50x50 >> about Red for Windows version 0.6.3 built 27-Nov-2017/19:24:27+01:00 greggirwin 19:08Look at this layout: >> view/tight [base 50x50 [print [face/offset face/size]] button 50x50 [print [face/offset face/size]]] 0x0 50x50 50x-1 52x52 Since things align correctly, my guess is that Red has to account for OS metrics it can't control. Or it tells the OS what size to create, then updates the actual size based on what the OS returns. @qtxie would have to say. Maybe someone can test on another OS and post their results. gltewalt 20:49Where do I use center-face? 20:51Can we use blocks to pass facets around, or do we have to repeat ourselves? endo64 21:07You can use center-face to center a face according to its parent (or any other face) manually: lay: layout [size 300x100 btn: button "Ok"] view lay ; not centered center-face btn view lay ; centered now 21:11For facets, you can use style: view [style st: base red 60x25 "Default" st "One" st green "Two" st ] gltewalt 21:12oh, use base as the default that your'e overriding? endo64 21:18base is the simplest face, you can use any face you want. Just note that button faces are OS dependent, so you cannot change color of a button (yet) gltewalt 21:18I have this. Adding the Red icon pushed all of my stuff to center like I wanted, but I was trying center-face before that. view [ title "Parse Buddy" size 800x600 origin 0x0 space 0x0 style lbl: h4 128.0.0 font-name "times" font-color 250.235.215 style fld: field 600x48 250.235.215 font-size 14 font-name "times" style area: area 250.235.215 font-size 14 font-name "times" tab-panel 800x600 [ "Buddy " [ backdrop 153.0.0 image http://static.red-lang.org/red-logo.png below space 0x0 lbl "Enter parse expression:" fld lbl "Text to parse:" area 600x300 lbl "Match results:" area 600x100 ] "Help " [ backdrop 250.235.215 ] ] ] 21:21The three styles share a bunch of attributes. How do I not repeat myself if I don't have to? combine styles? endo64 21:26Try pad 40x0 instead of image, its not exactly centering but it will has the same effect in your case. maximvl 21:29could somebody explain "clip" draw command? I can't figure out the difference between all options: replace (default) intersect union xor exclude 21:29from what I tried first 2 do the same and second two do the same 21:29union seems to do nothing actually endo64 21:30@gltewalt About not repeating style definitions try using compose: defaults: [font-name "times" font-color 250.235.215] view compose [ style lbl: h4 128.0.0 (defaults) style fld: field 600x48 (defaults) style area: area (defaults) fld lbl ] 9214 21:31@gltewalt https://doc.red-lang.org/en/view.html#_font_object 21:34 text >> mah-font: make font! [name: "times" color: red size: 20] == make object! [ name: "times" size: 20 style: none angle: 0 color: 255.... >> view [text "test" font mah-font] gltewalt 21:47Thanks guys. endo64 21:49@maximvl To see the effect of those clipping modes you need more than one clipping area. intersect, union etc. uses those clipping areas to generate the result. Try changing mode for below code to see the difference: view [ base 300x300 black draw [ pen white fill-pen blue box 0x0 100x100 clip 50x50 150x150 fill-pen red box 30x30 170x170 clip 30x30 100x100 union ;change to intersect fill-pen yellow box 40x40 130x130 ] ] 21:49With xor you get: 21:49[![image.png](https://files.gitter.im/red/red/gui-branch/2RmC/thumb/image.png)](https://files.gitter.im/red/red/gui-branch/2RmC/image.png) maximvl 21:50ohh 21:50@endo64 I see, thanks! endo64 21:50You are welcome. 9214 21:51worth a wiki entry IMO maximvl 21:54also, do we have a way to transform radian angle to a degree one? :) 21:54because all math is done in radians, but draw wants degrees 9214 21:56radians * 180 / pi? maximvl 21:57angle: angle * 57.2957795 :D 22:11https://i.imgur.com/jFKAqAQ.png 22:11:D 22:11mad drawing skillz greggirwin 22:14@maximvl, the standard trig funcs have a /radians refinement, if that helps at all. 22:15Those that don't use it as a default, that is. maximvl 22:17@greggirwin *** Script Error: atan2 has no refinement called radians 22:18I use atan2 to find an angle for an arrow "head" to rotate it accordingly greggirwin 22:19Ah, I see, you want to go the other way. Reading too fast here. 22:20Sounds like a mezz is the way to go for now. maximvl 22:21turns out draw dialect is super awesome, with all those transformations applicable for local blocks 22:21very powerful Tuesday 28th November, 2017 qtxie 02:35@luce80 Like Gregg said, the VID will account for OS metrics when create the faces. There is a 1 pixel margin in the button on Win7, that's why the VID increase the size of the button. shagrouni_twitter 18:20@greggirwin In Windows; I usually set RtoL flags to the form to make it right to left along with its childe components. I can set RtoL to individual component also. The right to left means: right alignment and right_to_left reading or just one of the two. Setting RtoL to a widget will not affect the coordinate system for placing child controls or drawing on the face/canvas of that widget. It will be good in Red application if I can access OS native functions (like: SetWindowLong() in Windows) to change widgets properties. greggirwin 18:51@shagrouni_twitter, thanks. We'll try to hide those details, so you don't need to use OS APIs for that, as it's a general i18n feature and will vary by platform. luce80 19:01@qtxie So, unfortunatly this: https://github.com/red/community/blob/master/games/tile-game.red is not multi-platform. I will have to take it into account, thanks. greggirwin 19:08What isn't cross platform about it @luce80 ? Pasting here, it seems not to work right now, so may just need a fix. luce80 19:33@greggirwin Probably it works on those platforms whose metrics calcs result in the button being 60x60. It works if you use a base object instead of a button or change spacing but then it will problably not work on other platforms. greggirwin 19:35Ah! I see what you mean. It used to work, so the logic just needs to be updated. 19:36Maybe @meijeru will jump in. 19:48 view/tight [ title "Tile game" style piece: button 60x60 [ temp: face/offset - empty/offset if any [ all [zero? temp/x face/size/y = absolute temp/y] all [zero? temp/y face/size/x = absolute temp/x] ][ temp: face/offset face/offset: empty/offset empty/offset: temp ] ] piece "1" piece "2" piece "3" piece "4" return piece "5" piece "6" piece "7" piece "8" return piece "9" piece "10" piece "11" piece "12" return piece "13" piece "14" piece "15" empty: piece "" ] 19:49Should we PR that, or does someone want to improve it first? Wednesday 29th November, 2017 meijeru 08:19Shouldn't view/tight ensure, on *all* platforms, that the buttons touch each other? What else could the definition of tight sensibly be?? greggirwin 08:28I don't know that it *can* ensure that. Using native features means some level of compromise. /tight, to me, just means that VID isn't adding any spacing of its own. 08:29OSs may reserve border space for their own use, like focus rectangles. If VID tries to negatively counteract those, the results could be terrible. meijeru 11:08In that case, much as I regret it, we have no choice but to adopt the somewhat less terse and less intuitive solution you propose. Unless we can guarantee that OSs maintain the squareness of the style, in which case temp/x and temp/y are guaranteed to be equal, I can see no improvement to be made to it. greggirwin 14:54OK, thanks for the input. 14:55We can include notes about it with the PR. We could also use a base style, as you say, but that will not look as nice, or will add more code. gltewalt 15:03Is there a way to use something like this for images in VID? system/options/binary-base: 64 bin-file: read/binary to-file request-file greggirwin 15:05Not sure what you mean @gltewalt. If you have images in files, just load them. If they are base-64 encoded, you don't want to use /binary when reading the file. gltewalt 15:06Oh, I saw this REBOL snippet: REBOL [Title: "Binary Resource Embedder"] system/options/binary-base: 64 uncompressed: read/binary to-file request-file/only editor compress to-string uncompressed 15:09I got it then. >> bin-file: load request-file == make image! [600x400 #{ 1C252D1A232C18212A18212B19212D19212C18202A161E28151D26131A22 11181F12171F11161E10161D10161D >> view [image bin-file] greggirwin 15:16system/options/binary-base may be TBD. Can pose it as a question for Team Red. gltewalt 15:17It's set as 16 by default greggirwin 15:24Nice! toomasv 15:25@greggirwin Can you say why are tiles misaligned after changing their offsets: view/tight [ title "Tile game" style piece: button 60x60 [ temp: face/offset - empty/offset if any [ all [zero? temp/x face/size/y = absolute temp/y] all [zero? temp/y face/size/x = absolute temp/x] ][ temp: face/offset face/offset: empty/offset empty/offset: temp ] ] piece "1" piece "2" piece "3" piece "4" return piece "5" piece "6" piece "7" piece "8" return piece "9" piece "10" piece "11" piece "12" return piece "13" piece "14" piece "15" empty: piece "" do [ offs: copy [] sizes: copy [] foreach b self/pane [append offs b/offset append sizes b/size] probe offs probe sizes offs2: copy [] foreach b self/pane [b/offset: take random offs append offs2 b/offset] probe offs2 ] ] 15:28[![blob](https://files.gitter.im/red/red/gui-branch/UPLp/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/UPLp/blob) greggirwin 15:28Ah, I see it now. Couldn't in your deleted post. 15:28I thought you had changed styles, as they looked like base faces. toomasv 15:31probeing shows offsets are correct, sizes also. :confused: greggirwin 15:33Yup. If I probe in mine, on manual click and move, the values match, but things stay lined up. toomasv 15:34You mean you can move tiles? I can't with misaligned tiles, but sometimes they are more aligned, then I can. Is it W10 problem then? greggirwin 15:35No, the vals are different in some cases! e.g. 186x185 vs 186x186. 15:36In my manual case on Win7, vs your randomizing case. toomasv 15:36Without randomly changing offsets, it works fine here too. gltewalt 15:38offsets are pair!? toomasv 15:39Yes!? greggirwin 15:39Seems to be related to do in the layout spec. This seems to work: view/no-wait wnd: layout/tight[ title "Tile game" style piece: button 60x60 [ temp: face/offset - empty/offset if any [ all [zero? temp/x face/size/y = absolute temp/y] all [zero? temp/y face/size/x = absolute temp/x] ][ temp: face/offset face/offset: empty/offset empty/offset: temp ] ] piece "1" piece "2" piece "3" piece "4" return piece "5" piece "6" piece "7" piece "8" return piece "9" piece "10" piece "11" piece "12" return piece "13" piece "14" piece "15" empty: piece "" ] offs: copy [] sizes: copy [] foreach b wnd/pane [append offs b/offset append sizes b/size] probe offs probe sizes offs2: copy [] foreach b wnd/pane [b/offset: take random offs append offs2 b/offset] probe offs2 do-events 15:41This is a good question for @qtxie, as it may mean that some fixups are done when a layout is finalized. toomasv 15:41Great! It works indeed. Now it remains to implement algorithm to check if the random arrangement is solvable. :) gltewalt 15:53I was playing with to-pair and random last night. And some other pair arithmetic toomasv 17:41Seems to work: view/no-wait wnd: layout/tight[ title "Tile game" style piece: button 60x60 [ temp: face/offset - empty/offset if any [ all [zero? temp/x face/size/y = absolute temp/y] all [zero? temp/y face/size/x = absolute temp/x] ][ temp: face/offset face/offset: empty/offset empty/offset: temp ] ] piece "1" piece "2" piece "3" piece "4" return piece "5" piece "6" piece "7" piece "8" return piece "9" piece "10" piece "11" piece "12" return piece "13" piece "14" piece "15" empty: piece "" ] randomize: does [ offs: copy [] nums: copy [] offs2: none nums: copy [] foreach b wnd/pane [append offs b/offset] offs2: copy random offs foreach b wnd/pane [ b/offset: take offs append nums reduce [ b/offset to-integer either empty? b/text [0][b/text] ] ] n: 0 k: empty/offset/y + 1 / empty/size/y + 1 sort/skip/compare nums 2 func [a b][ (a/1 + (a/2 * a/2)) < (b/1 + (b/2 * b/2)) ] nums2: extract next nums 2 forall nums2 [if all [1 < length? nums2 nums2/1 > nums2/2] [n: n + 1]] ] randomize while [odd? n + k][randomize] do-events gltewalt 18:43Is there a way to do like a on-near or on-nexto? To have something react when the mouse gets near it? rebolek 18:44I don't think so. How near is near? gltewalt 18:45Maybe within 10x10? greggirwin 18:47Still morning for me @toomasv...all clear, I think, except the odd? check. gltewalt 18:48Maybe have a base that's the same color as backdrop with a smaller image glued to it, and then react when on-over the base? rebolek 18:48That could do it. toomasv 18:48@greggirwin see the last answer https://math.stackexchange.com/questions/754827/does-a-15-puzzle-always-have-a-solution greggirwin 18:49Thanks @toomasv. gltewalt 18:49Remember those gag things where you're supposed to click something on a web page and it runs away from the mouse pointer? greggirwin 18:51@gltewalt, you could use on-detect in the parents, with something like this (old R2 func, with money! removed) maybe: near?: func [ {Returns true if the values are <= 1E-15 apart.} value1 [number! date! time!] value2 [number! date! time!] /within "Specify an alternate maximum difference (epsilon)." e [number! money! time!] "The epsilon value." ][ either date? value1 [ e: to time! abs any [e 1E-9] e >= abs difference value1 value2 ][ e: abs any [e to value1 1E-15] e >= abs value1 - value2 ] ] 18:51And I do remember those. 18:54@toomasv, nice. I will have to go to my puzzle books. :^) 18:56@gltewalt, you could start with a simpler version, allowing the mouse to enter it, which gives you an over event. gltewalt 19:00Yep, I'll have to start there and try a few different things after I get that working 19:02If hidden is used, will over work on a hidden face? greggirwin 19:33Have you tried it? gltewalt 19:47Not yet greggirwin 20:04When you do, let us know if it works. gltewalt 21:15Doesn't seem to work 21:15This is close: init-pos: 200x200 run: does [ do reduce [init-pos: init-pos random/only [+ / -] random 60]] view compose [ size 800x600 backdrop 153.0.0 at (init-pos) btn: button 120x40 "Click me" on-over [btn/offset: (run)] ] meijeru 21:35Concerning the solution of a permuted 15-puzzle, one needs to check if the permutation is *even*, and this can be done by the following function: is-even: func [ {Checks if a permutation is even or not i.e. if it is produced by an even number of swaps} perm [block!] "the permutation to be studied" orig [block!] "the original series" /local nsw cperm idx ][ nsw: 0 cperm: copy perm repeat n length? perm [ idx: index? find cperm orig/:n nsw: nsw + absolute idx - 1 cperm: head remove at cperm idx ] even? nsw ] Thursday 30th November, 2017 toomasv 04:28@meijeru In addition, orig and perm have to be formed first, and after evenness check fails, a new permutation needs to be generated. All this happens in above randomize code by a bit different (but essentially same) logic. 9214 13:45@gltewalt compose/deep maybe? gltewalt 14:14It works with just compose, but the approach needs tweaked. Sometimes the button doesn't move much. meijeru 14:30@toomasv :+1: gltewalt 23:17So, window is listed in styles, but view [window] is an error 23:17 SYSTEM/VIEW/VID/STYLES is a map! value: #( window: [ default-actor: on-down template: [type: 'window size: 100x100] ] base: [ default-actor: on-down template: [type: 'base size: 80x80 color: 128.128.128] 23:19 *** Script Error: VID - invalid syntax at: [window] *** Where: do *** Stack: view layout cause-error greggirwin 23:23I believe it's a special case. Maybe the docs should be altered to reflect that. gltewalt 23:24It might be, but just looking at the map it should behave the same as base greggirwin 23:24Screen is another special case. Though technically, the docs may be fine. VID is where things get confusing if you think of them as child styles. 23:25You can't just look at the map that way, as View and VID are different levels, and may use its contents in different ways. 23:26e.g. look at how window is used in https://github.com/red/red/blob/master/tests/view-test.red gltewalt 23:27Well, I would think that all entries in that VID map would behave the same greggirwin 23:28Right, which could mean that there's a window style handler that is TBD in VID, and it's a placeholder, or the fact that it's under VID is an artifact, which may have been done because R2 did it that way. 23:29Maybe @qtxie can say. gltewalt 23:35This works though: win: make face! [type: 'window size: 300x300] view win greggirwin 23:38Layout has a specific check for it: if style/template/type = 'window [throw-error spec] gltewalt 23:38hmmm greggirwin 23:40So the design is intentional, and possibly open to later enhancements. Many years ago, Cyphre (I think) built an entire windowing system on top of VID. Imagine creating a window which is a virtual desktop, and within which you can create other windows. gltewalt 23:42Like a video game? 23:42(Except with access to your whole system) 23:43How do I make this laptop webcam go? view [camera 300x300 data ...]? Friday 1st December, 2017 greggirwin 00:08No camera on this system, and I haven't tried it, but maybe view [camera 300x300 select 1]? 00:08On windows, I was thinking more like virtual OS, or remote desktop. gltewalt 00:09That does turn it on, but it only displays a blue box 00:15I saw an image for a split second after dragging the window - then it went back to blue 00:20https://doc.red-lang.org/en/view.html#_camera 00:21Selecting any number other than 1 crashes my GUI console greggirwin 03:19I can dupe that, as I have no cam on this machine. Please submit a ticket for it. qtxie 09:13@gltewalt Like Gregg said, I think the window style is a special case in VID. gltewalt 23:10If someone makes a mistake and types view [camera 1] instead of view [camera select 1] it freezes the GUI Console and can't even end process through Task Manager greggirwin 23:15Interesting. I hate to ask you to freeze things more, but is there a lower bound for the width of the camera style where that occurs, or is it *any* integer that does it? gltewalt 23:15I had to reboot, and now it produces a narrow window, so I guess it's not catastrophic 23:15Before it was 1 greggirwin 23:16Worth a ticket if you can reproduce it consistently. If it froze the OS, details will help. May be a device driver issue. gltewalt 23:16I rebooted and went through numbers 2 through 9, which made skinny windows. Then back to 1, which then made a skinny widow. 23:17I'd ask you to try it, but it might mean having to reboot, which isn't nice. I'll try a few more times to see if it hangs again 23:19might be my device driver, as a reboot seems to eliminate the hang greggirwin 23:21I hate rebooting. Had to do it a couple months ago. gltewalt 23:21As it behaves now, it's seeing the 1 as the width of the pane or whatever you call it greggirwin 23:21Yes, an integer after a face def is taken as a width. gltewalt 23:21Before reboot it also hung the cli, but that one was escapable 23:26Aha! 23:27After I put the laptop to sleep by closing the lid - opening it back up and doing view [camera 1] hangs the heck out of it greggirwin 23:28*That* is good to note. Maybe start a camera wiki page? gltewalt 23:28Not sure if that's the same as sleep through other Windows methods, but I think it should be 23:29I wouldn't have much on it yet - I haven't been able to get it to work right. Do I need to do something with rate? greggirwin 23:29Device sleep/wake is always tricky. Red may need to add extra handling if a device connection changes during a session, which that would cause. 23:29I've never used camera but I know some other people have. Maybe ask in red/red where there are more people. gltewalt 23:32AND it's if the GUI Console is left open, then the laptop is closed and put into sleep, then back to GUI Console and typing view [camera 1]. greggirwin 23:34Right, so Red may be getting a device handle on startup, even if view isn't called yet. gltewalt 23:34And GUI Console will continue to hang, even in spite of task manager, until you close the lid again - then it exits finally. Somehow. 23:35This will be tricky for me to write up 23:431 is the most reliable hang, though I've gotten 2 and 3 to do it. Looking like a device handle thing greggirwin 23:46It's a little involved under the hood. The camera is instantiated via COM APIs, but has to do a lot of other work as well, and looks like it's done so on demand, when the camera face is created. gltewalt 23:47Should I post the latest summary in red/red to see if someone can reproduce it? greggirwin 23:48You could post there, telling people to check here if they are interested. Saturday 2nd December, 2017 gltewalt 00:07Same result when putting the computer to sleep via the WIN GUI and then waking it back up toomasv 04:00view [camera 1] didn't hang it on W10 laptop. I could close the window and work on. Relieved. Tried with putting to deep-sleep too. gltewalt 05:53:+1: hopefully just a win7 thing. Or maybe my config luce80 14:59About the tile game: randomize-tiles: does [ random/seed now/time loop 200 [foreach face wnd/pane [if random true [do-actor face none 'click]]] ] Tuesday 5th December, 2017 dander 09:13@gltewalt did you check the event log for device errors? When you had to reboot, did you do a hard power cycle, or let the OS restart? I've had audio drivers stop responding, which would cause a bluescreen if I waited long enough while rebooting gltewalt 09:57I didn't check the event log. I let the OS restart. Thursday 7th December, 2017 PeterWAWood 04:50Once you've started a timer, what is the best way to stop it? I resorted to this: view [ t: text "Stop Me! " on-time [move t/text tail t/text] button "Start" [t/rate: 10] button "Stop" [ attempt [ t/rate: 0:00 t/text: "Stop Me!' ] ] ] 04:56The way to do it is to set the rate to none. Friday 8th December, 2017 greggirwin 21:02Finally remembered to update https://github.com/red/community/blob/master/games/tile-game.red, if anyone wants to check for mistakes or suggest improvements. Saturday 9th December, 2017 BeardPower 21:34I have a question regarding rhis trello card: >Replace current GDI/GDI+ backend with Direct2D backend on Windows 7+ Wouldn't it be more beneficial to replace it with a Vulkan backend, as Vulkan is cross-platform? One backend for every platform. rebolek 21:45@BeardPower No, it must be some solution that works out of the box. 21:46that doesn't mean that Vulcan target can't be made, just not as default. BeardPower 22:38Well, what do you mean exactly with "out of the box"? Vulkan support is now included in the mainline Windows drivers, so it would out of the box. greggirwin 22:39How far back does that go, Windows wise? BeardPower 22:39Vulkan will support multi-GPU on Windows 10, 8, and 7 greggirwin 22:41I'm pretty sure I don't have the needed Vulkan runtimes or drivers on my Win7 system, so I would need to install them, yes? BeardPower 22:41What's not in "the box" is 2D shapes and drawing functionality like you get with DX, you would need to implement that. But the big advantage is, that you would only need to do it once. greggirwin 22:42In any case, if you can make a strong case for it, noting the varying support on target OSs (Android is the next one coming), Team Red would at least have the information to work with (though they have likely done quite a bit of digging on their own already). rebolek 22:42Looking here https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility I see that Vulcan on Windows on Intel is supported only from Skylake up. greggirwin 22:43Basically, if it's a win for Red, it could happen, but all aspects are considered, and their priorities may not match each of our individual lists. BeardPower 22:43@greggirwin It should be in the current drivers. You can test it with this litte program: https://github.com/skeeto/vulkan-test greggirwin 22:44Vulkan drivers not installed here. rebolek 22:45So if I would be crazy enough to run Windows on my 4790k, I couldn't use Vulcan at all. BeardPower 22:50Sure, it would need an availability test. If Red will use the platform specific backends, how many would it need to support? At least three, I guess (Windows, macOS, Linux). 22:50@greggirwin Which drivers are installed on your system? rebolek 22:52@BeardPower If someone is willing to do the work on Vulcan Windows support, I certainly wouldn't stop step. I just think it's not a priority for the Red team. If I could decide, GTK support would be more important. greggirwin 22:52The point is not what *I* have, but what will work most easily for the widest range of users, depending on what Team Red prioritizes. (Mine are pretty old BTW) BeardPower 22:53@rebolek Yes, Intel is only supporting Sky-Lake and up greggirwin 22:54So it would only work on CPUs <= 2 years old, roughly? That seems fairly limiting. 22:55That said, if it's a roadmap item, now is a good time to get more info to the team to consider. BeardPower 22:57@rebolek Sure, I'm just trying to get a glimpse on the roadmap and the work I would need to do myself for some projects. Speaking of GTK support. What was the decision on using GTK instead of other UI toolkits? greggirwin 22:58Someone volunteered to do it, and another community member added to the work. Team Red didn't make that call. They just supported them a bit during their work. BeardPower 22:59@greggirwin Sure, the limitation of supported GPUs is something to consider, depending on the Red audience. 23:01Ah, I see. Thanks! So there is no decision yet on the official Linux backend. greggirwin 23:01Correct. rebolek 23:01Unfortunately no. Monday 11st December, 2017 dockimbel 07:32@BeardPower The Linux GUI backend needs to work on the largest number of installed distros out of the box (no extra installation needed), and rely on a framework which provides a set of features equivalent to what is provided by Windows and macOS APIs. The framework also needs to have a C-level API. Do you see a better alternative than GTK fitting the requirements? Oldes 09:48It would be nice to have embedded ImGui -> https://github.com/ocornut/imgui/ BeardPower 12:25@dockimbel This is problematic, as Linux is just a Kernel and there is no standard UI framework in GNU/Linux. The graphical interface is totally separated and optional, unlike on Windows or macOS. The core framework, which will come out of the box when using a window system, is the graphics/display server, but even there are three of them: X11, Wayland and Mir, which depend on the distro used. X11 is the ancient one, Wayland is targeted as a successor to X11. Mir is also targeted as a successor to X11, but implemented by the Canonical Foundation (Ubuntu). Additionally, the Distro/User can chose, what he want to use, so you would need to support all three of them. For every display server, there is an extra installation needed, if you only support e.g. Mir. GTK+ is just a Window-Manager, which is on top of the display servers, like Qt, FLTK and many others. They are totally optional and render their Widgets through vector drawing frameworks. Again, every window manager uses a different one. E.g. GTK+ is using Cairo, Android is using Skia (like AGG). As you can see, there is no real "native widget framework" on GNU/Linux, only the widgets provided by the window managers, which are all drawn by them. An alternative to this mess: rendering your own widgets, like Rebol did. E.g. by using Cairo, because Skia is C++. dockimbel 12:27@BeardPower Thanks, we are well-aware of the Linux architecture. I am a Unix user since 1993, and Linux user since 1996. ;-) We don't have resources to support all the options, we need to focus on the one with biggest marketshare, and which is fulfilling our requirements. BeardPower 12:45@dockimbel You beat me by 4 years (Unix and Linux since 1997). Thanks for the info and your reassuring, we are on the same page :) Well, according to [Distrowatch](https://distrowatch.com/dwres.php?resource=popularity), Ubuntu based distros are used the most and Mir/Unity8 is using Qt On the other hand, RedHaT (fedora) is used widely in the business area and using Gnome as standard Desktop Environment, so GTK+ is used. So it's between GTK+ and Qt, as both frameworks need to be installed, when using Gnome, KDE or Unity8. The best option to get them all, is drawing your own widgets through Cairo. rebolek 12:46@BeardPower Ubuntu recently switched back to Gnome. 12:47I certainly doubt that drawing own widgets is best option, it is very complex task. BeardPower 12:49@rebolek Yeah, right. For now, until they try to invent the next thing and call it Unity X... It's the best option for being independent of the Desktop Environment, but sure, it's not the easy way. 13:23The switch from Mir/Unity8 back to GNOME maybe adds some weight to GTK+, but there is already a fork of the former. The question is, how many users go conform with it? If 50% of the users are preferring Qt, they would also need to install all the GTK+ stuff, just for using an UI in Red. But as the requirements are C and no additional installations, there are only two solutions: Gtk+ or Cairo (rendering your own widgets). rebolek 13:25@BeardPower remember that current Red GTK+ is community project. No one is stopping Qt users from making Qt version of Red. BeardPower 13:27@rebolek Sure, but assuming, the official backend will be GTK+. Will it be a complete rewrite or the community project? If the former is the case, we will have two versions for GTK+, right? rebolek 13:28@BeardPower I believe that the official backend will build on top of current implementation. BeardPower 13:33It would clearly make sense, I guess, but yet to be decided. 14:19Is this intended behavior, false being the default but not allowed to use explicitly? view [radio false] *** Script Error: VID - invalid syntax at: [false] *** Where: do *** Stack: view layout cause-error rebolek 14:21I think so, you can only override it with true BeardPower 14:22It would be nice, if the documentation would mention that in some way: [Radio button documentation](https://doc.red-lang.org/en/view.html#_radio) GiuseppeChillemi 17:51 Hi, Boleslav just got half of the promised Bounty for his table widget. As I still have no time to test/review it I would like to complete the bounty as soon as possible. My specification are included in the source code. Everyone with access to it and which use the table widget is free to test and report any problem in this group. Once bug free (as much we can ;-) the other half of bounty will be sent. 17:51Nice work Boleslav ! rebolek 17:54Thanks, Giuseppe! greggirwin 18:24> I certainly doubt that drawing own widgets is best option, it is very complex task. @rebolek, easier now than 10 years ago. You either draw flat styles or use images for everything. :^) Some things are tricky, but I still hope, someday, we'll see CS teachers and researchers use Red to show *how* OSs, languages, GUI systems, and more work. Like the old books on Minix, Oberon, PenPoint, QNX Photon, etc. It doesn't mean they have to be commercial level products, but they should *work*, so you can play and tinker with them. rebolek 18:25@greggirwin I meant not just drawing, but support all other stuff that OS widgets provide too. greggirwin 18:26Depends on the widget. Some don't do much at all. Obviously, things like a grid are huge tasks. 18:28Was it the Wingz spreadsheet that failed, then became custom controls for VB? Can't remember now. OT thought there. :^) Tuesday 12nd December, 2017 dockimbel 04:02@BeardPower I think we should support false too in that case, as it could be the result of a compose. Please open a wish ticket for it. planetsizecpu 10:57I noticed scroller & get-scroller help upon today's console build, but still return invalid syntax, I guess the team is filling the box with 0.6.4 for noel :smile: I would like to encourage them so much! this is a long-awaited step. nedzadarek 14:09@rebolek Thank you for the link ( https://github.com/rebolek/gritter/blob/master/gritter.red#L161 ) I have 2 questions. How can you share your styles, e.g. here is the file with red button? I guess you can append main layout to your style (e.g. append red-button main-layout) but is there some built-in method? If I want to edit "other values" (e.g. slider's minimum value, slider's maximum value) can I do it with Red? I haven't found it. Do I have to do it in C or Red's equivalent of C? rebolek 14:33@nedzadarek Custom values for a style are defined in face/extra object (that is created in on-create actor in scroller's case), so just add them there. In case of default styles face/extra is none, everything you see there are my custom values. There was stylize function in Rebol that is not implemented in Red yet, so you have to add them manually. I am afraid that append red-button main-layout won't work, just copy and paste them for now. nedzadarek 16:14@rebolek I do not mean my custom values. Slider has some values that I can edit slider/data (possible values:50%, 0.5) or slider/color (possible value: 255.0.0) - I can just slider/data: 42%. I am wondering if I can get & set other values (for example maximum and minimum value that is possible - at the moment, minimum is 0.0 or 0% and maximum is 1.0 or 100%). I do not want to re-implement it on my own, if it's possible. rebolek 17:40@nedzadarek I see. That's not possible, AFAIK. You need to recalculate min and max values outside of slider. BeardPower 18:43@dockimbel Sure. I will collect my wish tickets and open them ASAP. greggirwin 20:48@nedzadarek, see my message in red/red. Friday 15th December, 2017 toomasv 12:01Is text-box! broken now? qtxie 12:40@toomasv Yes, we are changing the interface of text-box! for the new release. toomasv 12:41@qtxie Ok, thanks! Wednesday 20th December, 2017 toomasv 17:22Why is that: >> view [drop-down data ["A" "B" "C"] on-enter [append face/data copy face/text]] ; After entering "D": *** Script Error: invalid DATA facet content ["A" "B" "C" "D"] *** Where: on-change-facet *** Stack: view do-events do-actor do-safe on-face-deep-change* 9214 17:23@toomasv IIRC you can't update drop-down content toomasv 17:24What use then of the field there? 9214 17:24it's like field with pre-defined default options toomasv 17:25But this is drop-list 9214 17:26drop-list doesn't allow you to make custom input, but drop-down does toomasv 17:28Do you think it would be wishable to want text entered into field to be appendable to the drop-down data? 9214 17:29@toomasv idk, maybe, I think of them as built-in defaults, doesn't make much sense to allow their modification toomasv 17:30What should I then use to build up interactively my drop-down? 9214 17:30may be worth to ask @dockimbel if current behavior is intentional 17:31@toomasv text-list maybe? toomasv 17:31You can't insert/append there -- no field 9214 17:33 text view [f: field [append t/data f/text] return t: text-list data ["A" "B" "C"]] toomasv 17:47Something more like this: view b: [t: drop-list data ["A" "B" "C"] at 10x10 f: field [unview append b/4 face/text view b]] 17:51@9214 Much better yet: view b: [t: drop-down data ["A" "B" "C"] on-enter [unview append b/4 face/text view b]] 18:31Aaand finally: view b: [ t: drop-down data ["A" "B" "C"] on-enter [ unview append b/4 face/text l: layout b t/selected: length? t/data view l ] ] rebolek 18:52Seems like a bug to me, it should work automatic. toomasv 18:55@rebolek I expected it to work too. Should I report it? rebolek 18:57@toomasv Certainly. 18:57The worst thing that can happen is that it will be dismissed. toomasv 19:02#3153 19:23Shouldn't visible?: no take the face out of the flow? Currently it doesn't: view compose [a: drop-list data ["A" "B"] b: text-list data ["C" "D"] do [b/visible?: no]] If not, then which attribute does this? 19:52Or does only taking it out of the pane take it out of the flow? gltewalt 20:30@toomasv It's invisible on Win7 20:32No: https://imgur.com/Mlf76iu 20:33Yes: https://imgur.com/mqQdzPY toomasv 20:44@gltewalt Yes, it is invisible, but takes still space in the flow of faces. I thought it will not influence flow when inivisible, but apparently only taking it out of the pane does this 20:53Nope. I wanted something like this: view [ drop-list data ["A" "B" "C"] on-change [ insert p: face/parent/pane make dl: take p compose [ type: 'text-list actors: object [ on-change: func [f e][ insert p: f/parent/pane make take p [ type: 'drop-list actors: dl/actors ] ] ] ] ] ] Thursday 21st December, 2017 dockimbel 05:11@toomasv To take it out, you need to *disconnect* the face object from the face tree, so effectively removing it from its parent's pane block. 05:14@toomasv > Do you think it would be wishable to want text entered into field to be appendable to the drop-down data? Yes, that should be working, you can submit a bug ticket for it. toomasv 05:16@dockimbel Thanks! It's there #3153 greggirwin 22:09@toomasv, I'm sure someone will build a dynamic layout system that emulates what people expect coming from DOM development. Friday 22nd December, 2017 rebolek 00:13@greggirwin And I'm sure that person will get CSSrazy. greggirwin 20:46We'll see all kinds of stuff we think it crazy. Just like people look at our stuff and think we're crazy. I recently remembered an old idea of mine for a CRUD targeted VID wrapper dialect: crud-view [ Name: <Aaa_________> Phone: <(###) ###-####> Amount: <$__________> [OK] [Cancel] ] gltewalt 22:09like jsonette Saturday 23th December, 2017 gltewalt 08:07I noticed that there is a %css-colors.red file in source, but it's commented out Sunday 24th December, 2017 nedzadarek 14:22How do you detect all of the possible events? We should use basebecause > This face type should be used for any custom graphic component implementation. For example, I tried view [base red on-wheel [print 'wheel]]. Boleslav Březovský in his code ( https://github.com/rebolek/gritter/blob/master/gritter.red#L161 ) re-implemented drag with up, down and over (with all-over flag). I guess you cannot detectdrag without loose keyword, right? @rebolek I see, thank you. toomasv 16:20What is the rationale to render text facet of the face blow draw facet? In this way draw facet will cover the text facet and to display text facet one has to include it into the draw facet, and calculate its position etc. Why this duplication? What is the good reason for it? dockimbel 17:02@nedzadarek If you don't get wheel event in base face, please open a ticket for that, it should be supported. 17:03@toomasv Below? Text facet should be rendered on top of draw facet output. toomasv 17:19@dockimbel view [base 50x30 "box-name" draw [box 0x0 50x30]] view [base 50x30 "box-name" draw [fill-pen red box 0x0 50x30]] And [Doc](https://doc.red-lang.org/en/view.html#_base): > Full composition of following facets is supported and rendered in following order: color, image, text, draw. Monday 25th December, 2017 dockimbel 00:45Hmm, I wonder why we didn't put the text facet on top. I will check that with @qtxie. Wednesday 27th December, 2017 mikeparr 09:06Modal popups Q: here is a pared-down program, which displays an 'alert' popup. However, when the popup is showing, I can still click the 'do-an-alert' button to display another popup. I was expecting other windows to be locked-out. Any ideas? (I'm on Win 7) Red [needs 'view] alert-popup: function [] [ view [ msg-text: text "Hello" center return OK-btn: button "OK" [unview] ] [modal popup] ] view [ do-an-alert: button "show an alert -----------" [alert-popup] ] qtxie 09:18@mikeparr Use view/flags. alert-popup: function [] [ view/flags [ msg-text: text "Hello" center return OK-btn: button "OK" [unview] ] [modal popup] ] view [ do-an-alert: button "show an alert -----------" [alert-popup] ] mikeparr 09:22@qtxie Thank-you!! toomasv 11:28@qtxie On W10 transparency seems to affect font size in draw. In following examples first and last have same-sized texts for face and draw, second differs: view [box font-size 12 "Probe" draw compose [pen red font (make font! [size: 6]) text 17x17 "Probe"]] view [box font-size 12 "Probe" draw compose [pen red font (make font! [size: 12]) text 17x17 "Probe"]] view [base font-size 12 "Probe" draw compose [pen red font (make font! [size: 12]) text 17x17 "Probe"]] Also, compare these: view [base "Probe" draw compose [pen red text 17x17 "Probe"]] view [box "Probe" draw compose [pen red text 17x17 "Probe"]] qtxie 11:32@toomasv I have noticed this issue before, cannot find a perfect solution for it. toomasv 11:34@qtxie Ok, but what about this question :point_up: [December 24, 2017 6:20 PM](https://gitter.im/red/red/gui-branch?at=5a3fd3b603838b2f2a31820f) soapdog 15:00Hi friends, I am having some trouble here getting text to wrap inside an 'area, can someone help? 15:09got it! mikeyaunish 21:03I've read that cascading style support is available. Can't seem to make this work: view [ style redbase: base red panel1: panel 100x100 white [ redbase "first" ] return button "change panel1" [panel1/pane: layout/only [ button "hello"]] button "change fails" [panel1/pane: layout/only [ redbase "second" ]] ] 21:12Oops lost my formatting somehow- I'll try again: view [ style redbase: base red panel1: panel 100x100 white [ redbase "first" ] return button "change panel1" [panel1/pane: layout/only [ button "hello"]] button "change fails" [panel1/pane: layout/only [ redbase "second" ]] ] gltewalt 21:39it isn't grabbing the style 21:39 view [ style redbase: base red panel1: panel 100x100 [redbase "first"] return button "change panel1" [panel1/pane: layout/only [button "hello"]] button "change fails" [panel1/pane: layout/only [base red "second" ]] ] mikeyaunish 22:02@gltewalt How do I bind the style to the pane? gltewalt 22:33I don't know that. I just noticed that it wasn't binding 22:35It could be something we both haven’t learned yet, or it could be a bug. Have to wait for someone else 23:56I think something to do with /parent. Docs say style is valid for current panel or child pane Thursday 28th December, 2017 greggirwin 05:57@mikeparr, I started https://gist.github.com/greggirwin/9cd640ca42bdfd56c5ff4432c4765d2c some time back. If you do more work on similar things, I can try to chime in. 05:59@soapdog, what was your solution? 06:13@mikeyaunish, styles should cascade to child panels, but layout isn't aware that it's being evaluated inside view, so your dynamically created layouts aren't really children of the parent. You can work around it, until we can get @rebolek's stylize function approved, like this: system/view/vid/styles/redbase: [ default-actor: on-down template: [type: 'base size: 80x80 color: red] ] view [ panel1: panel 100x100 white [redbase "first" ] return button "change panel1" [panel1/pane: layout/only [ button "hello"]] button "change fails" [panel1/pane: layout/only [ redbase "second"]] ] That's one way anyway. mikeyaunish 06:45@greggirwin , thanks . It's good to see some of the inner workings of style as well. qtxie 06:56@toomasv There are background color, image, text and draw in a face. I'm not sure what order is best yet. Oldes 09:07Background, image, draw and than text. toomasv 10:18@qtxie Thanks, I vote for @Oldes proposal of order. soapdog 21:02@greggirwin my solution was to add wrap to the area declaration. Still the vertical scrollbar that should be appearing is not which is odd. Friday 29th December, 2017 greggirwin 03:35The scrollbar may be a pending feature. @qtxie ? qtxie 03:38@greggirwin Yes. It is not finished yet. greggirwin 06:53Thanks. There's your answer @soapdog. gltewalt 09:32@qtxie This only captures picture from webcam occasionally. Not every time. Most files saved as just a black image. ; only intermittently captures webcam images acc: 0 image-name: does [ load rejoin [mold '% 'temp acc: acc + 1 '.jpeg] ] view [ cam: camera 800x600 select 1 button "Save picture" [save/as image-name to-image cam 'jpeg] ] 09:33Also, it doesn't save any files when ran from red --cli 09:33Or if jpg is used instead of jpegin the GUI console 09:34Windows7 Pro 09:34Am I doing something wrong? qtxie 09:36@gltewalt You're right. The current implementation is not very good. I should use COM API to capture the camera. 09:37It's a bit complicated. Please open a ticket for it, I'll improve it later. gltewalt 09:37Ok soapdog 19:38@greggirwin an @qtxie thanks a lot for the reply! Red/View (can we call it that?) is maturing sooooo well. Saturday 30th December, 2017 ldci 16:13Update for video samples according to evolution of red camera object (https://github.com/ldci/redCV) rjriv 18:03Just thought I'd pass on a Mac trick to open more than one window at a time since apparently on a Mac you need to open at least one window WITHOUT no-wait in order to start an event loop (at which point it seems to work to close the windows in order): temp: layout [ base rate 1000 on-time [unview/only temp] ] view/no-wait [ title "Window 1" size 300x300 ] view/no-wait [ title "Window 2" size 300x300 ] view temp greggirwin 18:42@rjriv it's not mac specific. You can use do-events to start the event loop on all platforms. e.g. ;not needed view/no-wait [ base rate 1000 on-time [unview/only face/parent] ] view/no-wait [ title "Window 1" size 300x300 ] view/no-wait [ title "Window 2" size 300x300 ] do-events rjriv 18:46Thank you! I guess when using the windows console (not CLI), it must start an event loop then, which is why I thought it was a Mac issue. 18:46That's much nicer... gltewalt 21:33does this work on mac? v1: layout/options [ backdrop blue button "Unview blue" [unview/only v1] button "Unview yellow" [unview/only v2] ][offset: 400x100] v2: layout/options [ backdrop yellow button "Unview blue" [unview/only v1] button "Unview yellow" [unview/only v2] ][offset: 30x100] show [v1 v2] greggirwin 21:38Nice @gltewalt x8x 23:03@gltewalt mac here gets two windows opened but mouse cursor is beachballing and no button can be clicked, have to force termination. gltewalt 23:45That might be a ticket for mac then? Sunday 31st December, 2017 rjriv 00:07Hi @gltewalt, your example is the very one that led me to try the above method (without "show"). I didn't know about "show," but using view/no-wait v1 view/no-wait v2 do-events works... gltewalt 00:19Ah, ok 00:23Works fine without do-events on windows rjriv 00:26Perhaps with the Red Console and not the CLI? gltewalt 00:27I’ll try cli in a little while when I get back to the laptop 00:34Modification of one of the gitbook examples. In the book it would produce two windows at once - then I found out about making seperate layout with options and using show 00:35Er, in the book it “Would Not” make two windows at once rjriv 00:40I just tried red-063 —cli (in Windows on Parallels) and it was unresponsive for me without do-events, i.e.: view/no-wait [ ] do-events greggirwin 00:41You always need to start an event loop. Doesn't matter which OS. rjriv 00:44It seems to work without it when using the windows "Red Console." Is that a "Red" program, that happens to start an event loop in the same way that I tried to do by showing a view and then immediately closing it? gltewalt 01:11Confirmed 01:34What's the difference between cli console and GUI console? My example works fine in GUI console 01:46This seems to work in both cli and gui: v1: layout/options [ backdrop blue button "Unview blue" [unview/only v1] button "Unview yellow" [unview/only v2] ][offset: 400x100] v2: layout/options [ backdrop yellow button "Unview blue" [unview/only v1] button "Unview yellow" [unview/only v2] ][offset: 30x100] show [v1 v2] do-events rjriv 02:01My guess is that the GUI console is a Red view, and therefore an event loop has been started already. For example, you can do this and use no-wait without do-events: view [ button [ view/no-wait [ ] ]] At which point you can close the first window first and still interact with the second window. So I thing using view without no-wait starts an event loop if one already hasn't been started. 02:05Actually, on a Mac I can close the first window and still interact with the second one, but not on the Windows CLI... 02:06But I am using the latest build on the Mac and 063 on Windows, so it might not be a fair test. gltewalt 02:10hmm rjriv 02:11No, I tried the 29-Dec-17 windows build and it still behaved the same. 02:12I'm glad I learned about do-events today, though! gltewalt 02:13Yeah, apparently I have more learning to do too :smile: rjriv 17:36@gltewalt, I forgot to mention...thanks for letting me know about show! Interestingly, show defaults to the upper left corner of the screen, whereas view-nowait defaults to the center of the screen. You can create an equivalent hide with: func [v][unview/only v] Do you happen to know how to control the visibility of individual faces (like a button, for example, that you might want to show or hide based on the current state)? view and unview seem to be for window views only... gltewalt 17:39Looks like visible? 17:39view [b: button "hi" [b/visible?: false]] greggirwin 17:49@rjriv, you can use source on both show and view to see how they work. View wraps show, and includes this line: unless spec/offset [center-face spec]. nedzadarek 17:50view [b1: base blue b2: base red on-focus [print event/type] ] should b2 get focus event, for example when I click b1 then b2? Or is it only for elements like field? Maybe there is a special flag for that kind of situations? greggirwin 17:54Base can't get focus AFAIK. rjriv 17:56Thank you @greggirwin, source is now at my beck and call (and another good source of "production" usage)! gltewalt 17:56You can dump the whole tree of something by doing something like view [b1: base blue [?? b1]] greggirwin 17:57Or use dump-face. rjriv 18:03Thank you @gltewalt, I can see where visible? comes from now! greggirwin 18:06You can also use hidden to hide a face initially: view [b: button "Show" [b2/visible?: true] b2: base red hidden] gltewalt 18:08welcome rjriv 18:12I think I need to stop asking questions now and start filling in some gaps! For example, the use of hidden above would fit nicely here: http://www.red-by-example.org/index.html#0hidden... gltewalt 18:14:+1: 19:42Let's see... how would you make a button that toggles that base? 19:51This ok? view [b: button "Toggle" [b2/visible?: not b2/visible?] b2: base red hidden] 20:11 button-text: ["Show base" "Hide base" "Show base"] view compose [b: button "Show base" [ b2/visible?: not b2/visible? b/text: select button-text b/text ] b2: base red hidden ] 20:16Circular select trick greggirwin 20:23Another way to pick the text: button-text: ["Show base" "Hide base"] view compose [ b: button "Show base" [ b2/visible?: not b2/visible? b/text: pick button-text not b2/visible? ] b2: base red hidden ] gltewalt 20:26I had no idea pick could use true / false 20:33That's cool (as long as the block is two items long) 20:42And it looks like compose isn't needed soapdog 22:02Hey friends, does Red has a solution to display rich text already or do we need to resort to _draw_ primitives like the current available markdown libraries? Is such type of display in the roadmap (I couldn't find it there)? rjriv 22:09The area face will display rich text if you paste some into it, so maybe if you could compose a rich text string it would work. You can't interact much with area yet as far as I can tell, though, which could be a problem for you. Anyway, try pasting one of the examples into this: view [ size 300x300 at 0x0 area 300x300 ] soapdog 22:16@rjriv thanks for the tips about pasting rich text into an area, my use case is mostly markdown processing which is a bit different. greggirwin 22:30text-box! is what you want, though I can never remember where @rebolek's examples are. rjriv 22:38What can text-box! do for you (It doesn't seem to be a type of face)? Maybe the underlying data object for something like area? rebolek 22:53@greggirwin @rjriv AFAIK text-box! is undergoing some changes so I'm not sure how my examples would be relevant in some time. 22:55@rjriv text-box! is object! that holds some additional informations. There's no underlying widget like area, text-box! is mapped directly to system. rjriv 23:33Thanks @rebolek. nedzadarek 23:43@greggirwin thank you @rjriv @gltewalt is it ok to just print the gui element? Is there a difference between print and ?? & dump-face? @rjriv > I think I need to stop asking questions now and start filling in some gaps! For example, the use of hidden above would fit nicely here: http://www.red-by-example.org/index.html#0hidden... Is this your site? Can other people talk about & send examples? gltewalt 23:58Experiment with the three and see which fits your needs. There are differences.``
