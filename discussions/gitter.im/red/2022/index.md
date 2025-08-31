# Archived messages from: [gitter.im/red/red](/gitter.im/red/red/) from year: 2022

## Saturday 1st January, 2022

Geo-7

[07:18](#msg61d000285ee4df335ac220a2)Happy New Year!

ldci

[10:40](#msg61d02f936d9ba233289da0b9)Happy New Year!

[10:41](#msg61d02fc1742c3d4b2176db8d)@greggirwin Very interesting article :)

semarie

[11:01](#msg61d03498bfe2f54b2ef84fec)Hi. I am on \[OpenBSD](https://www.openbsd.org/). What would be the better way to get Red ? If I didn't mess myself, Red needs Rebol2 interpreter (for bootstrap phase), and Rebol2 is self-hosted.  
Would trying to build \[rebol/rebol](https://github.com/rebol/rebol) is the right thing to do first ? (the \[README](https://github.com/rebol/rebol/blob/master/README#L42) has few instructions for building for "new" platform)

hiiamboris

[11:03](#msg61d035107842bd3ca924ebd0)Hi @semarie , you can't build R2 interpreter, it's closed source. Try downloading from http://www.rebol.com/downloads.html ?

semarie

[11:05](#msg61d0357ad41a5853f92be841)The OpenBSD 4.0 version is ... old. Current version is 7.0, and binary compatibility isn't provided for N to N+1. So I don't expect N to N+30 to work :-)

hiiamboris

[11:06](#msg61d035ab526fb77b315a2b36)idk, most of R2 code still works to this day :)

semarie

[11:07](#msg61d035f3742c3d4b2176e798)@hiiamboris yes, but the libc.so on OpenBSD changed a lot. It isn't the same syscalls, some key structures changed (hello `time_t`), etc...

hiiamboris

[11:07](#msg61d0360b7842bd3ca924edbe)well, the other option is to set up some kind of VM and build Red there

[11:08](#msg61d0364a9b470f389745ca97)or maybe you'll find something here? https://github.com/red/red/wiki/\[LINKS]-Unofficial-Red-images

semarie

[11:09](#msg61d0367d6d9ba233289dabea)I am expecting the VM stage at some step, but not for permanent usage

hiiamboris

[11:14](#msg61d037a55dc6213cd4be1b87)if you only need the interpreter then build it once, use anytime :)  
for compilation you'll still need R2, there's no way around that atm

## Monday 3th January, 2022

planetsizecpu

[08:56](#msg61d2ba41d143b14f83fa9a99)Great task and great post @greggirwin push hard!

## Tuesday 4th January, 2022

zentrog:matrix.org

[22:12](#msg61d4c65b9b470f38974e06a4)Nice article! I'm excited to see @hiiamboris 's CLI module getting included. It looks really really great! I'm also curious if there will be any stories about how the new tracing/debugging features help with tracking down tricky issues, or other things that are learned from those. I can imagine a lot of power higher-level tools may be built on top of them as well.

## Wednesday 5th January, 2022

ldci

[10:42](#msg61d575f96d9ba23328a74f07)Hi, for testing purpose I compiled the gui-console app under macOS. Menu doesn't work. Is it specific to macOS?

rebolek

[11:08](#msg61d57c2a46529077f56c4b64)IIRC menu wasn’t working on macOS, so yes, specific.

ldci

[12:44](#msg61d59293e1a1264f0a3f1c30)@rebolek Thanks for information :)

greggirwin

[17:20](#msg61d5d36b6d9ba23328a81679)@qtxie, do you know if there was a big showstopper for that, or just work that didn't get done?

## Thursday 6th January, 2022

qtxie

[07:05](#msg61d694c59b470f3897519384)A regression? I remember it was working before.

greggirwin

[20:17](#msg61d74e4cf5a3947800f0e787)I thought it worked as well. @toomasv we test compiled DG for Mac, didn't we?

[20:26](#msg61d7508b2a210c38c1b6360a)And there's an old View demo/test app that uses menus.

## Sunday 9th January, 2022

hiiamboris

[15:39](#msg61db01b3e1a1264f0a4999bf)I thought DG is Win10-only. Not anymore?

rebolek

[15:57](#msg61db05f39a3354540613d32a)I believe there was some problems on Mac with missing scrollers.

toomasv

[16:17](#msg61db0aabbfe2f54b2e0cd2bc)Yes, scrollers were the problem, DG is exclusively Windows due to some Win-specific R/S code there.

## Monday 10th January, 2022

ldci

[03:30](#msg61dba8556d9ba23328b34ebe)Old demo app with menu works with macOS, but gui-console does not work.

greggirwin

[04:11](#msg61dbb1ef5ee4df335ad82e8e)Interesting. Thanks for testing.

ldci

[04:13](#msg61dbb255e1a1264f0a4ad563)@greggirwin I mean menus do not work with gui-console, but the console does.

greggirwin

[17:15](#msg61dc69babfe2f54b2e0f797c)Ah, so the menus in the old View demo also don't work?

ldci

[17:40](#msg61dc6f7b82a4667b256bbdef)@greggirwin No.menus work in old View demo:)

greggirwin

[19:11](#msg61dc84dbf5a3947800facf72):+1:

chasecrum:matrix.org

[22:32](#msg61dcb3e67842bd3ca93cd269)Hi guys, I'm chase from SUSE. I'm having some challenges getting a compile on a new install and I was wondering if I could get some help from anyone who may have installed this on opensuse before

## Tuesday 11st January, 2022

gltewalt:matrix.org

[00:30](#msg61dccf939a33545406177e24)Not on suse here, but I've installed it on Linux Mint

[00:33](#msg61dcd06af5a3947800fb7c2a) Have you looked here?  
I know SUSE isn't specifically listed, but perhaps the red hat section

[00:33](#msg61dcd06d7842bd3ca93d0b21)https://www.red-lang.org/p/download.html?m=1

chasecrum:matrix.org

[00:47](#msg61dcd39f46529077f57ac8c4)yeah I saw that - not much help fo rthe problems I'm seeing. I want to use the language but if I can't get it to work I'll need to pick another

gltewalt:matrix.org

[01:00](#msg61dcd69c82a4667b256ca0ba)What problems are you seeing?

chasecrum:matrix.org

[01:01](#msg61dcd6d182a4667b256ca12d)I think red is installed correctly, I can enter the red shell. but when I try to compile a sample hello world with red -c... it tells me red isn't installed.

greggirwin

[01:10](#msg61dcd8efd143b14f830e9074)Do you have 32-bit libs installed? Red is 32-bit only at this time.

rebolek

[06:28](#msg61dd23852a210c38c1c168fa)@chasecrum:matrix.org are you trying it with `red -c` or with `./red -c`? Red doesn’t install into `/bin` or something similar, if you want it there, you need to manually copy it.

[06:28](#msg61dd239d9b470f38975e67ce)@greggirwin I believe that it’s not 32bit problem as they can enter the red shell.

ldci

[10:13](#msg61dd583fd41a5853f94516c3)for eample, `chmod +x red | sudo cp red /usr/local/bin`

chasecrum:matrix.org

[14:57](#msg61dd9ad9526fb77b31740924)Let me give that a shot

[14:59](#msg61dd9b65d143b14f831043c2)ok - so.... red -c wasn't working.... ./red -c wasn't working..... ./red-064 -c seems to be working. I got a compiling error on a hello world, but at least it's trying to compile :)

[15:02](#msg61dd9bf25ee4df335adc7327)it fails at writing to a location in a user directory (odd) but sudo cleared that up and now it compiles.... is it common to have to compile as sudo?

hiiamboris

[15:03](#msg61dd9c33f5a3947800fd4bca)never had to, on ubuntu

chasecrum:matrix.org

[15:05](#msg61dd9ca8526fb77b31740d3d)nm - turns out I set everything up as root in that folder (dumb) and all the permissions and ownership are set to root.....

[15:06](#msg61dd9cdb46529077f57c9e49)(sorry, i've been at this a while)

hiiamboris

[15:06](#msg61dd9cfe742c3d4b2190ca7f)glad you figured it out

[15:06](#msg61dd9d0d5ee4df335adc7638)will still recommend using automated builds, for 064 is like 3 years old

chasecrum:matrix.org

[15:07](#msg61dd9d169a33545406193add)well the mention above for the ./ reall helped - so thanks to you guys

[15:07](#msg61dd9d426d9ba23328b7ba0a)I don't mind using it - I just couldn't get it running for who knows what reason..... now that I understand the process I'll go back and give it a shot

[15:09](#msg61dd9d9fe1a1264f0a4f228f)now on to my next problem... every time I think I have the view has no value issue beat - it is still there....

[15:09](#msg61dd9dba6d9ba23328b7bb30)I'll figure it out... fresh day and all. thanks for all the help guys

hiiamboris

[15:10](#msg61dd9df746529077f57ca0dd)sure, welcome to reducing btw :)  
for View module you'll need to put `needs: view` into the header (also 064 doesn't have GTK support, so only automated builds)

[15:11](#msg61dd9e125dc6213cd4d7f4d0)any more questions you have, there's a https://gitter.im/red/help room for that ;)

chasecrum:matrix.org

[15:11](#msg61dd9e257842bd3ca93ed534)now that's helpful - thanks :)

[15:13](#msg61dd9e8b742c3d4b2190cf30)(my apollogies for clogging up the room here, I didn't know there was a help channel)

hiiamboris

[15:13](#msg61dd9ea782a4667b256e6d83)np :+1:

chasecrum:matrix.org

[15:21](#msg61dda07bf5a3947800fd5673)latest worked as you said (just as an update) - using latest, thanks so much

greggirwin

[18:08](#msg61ddc7ac526fb77b317477b8)@chasecrum:matrix.org we have a \*lot* of rooms. See https://gitter.im/red/home, but only a few get most of the traffic. You'll find your way around soon enough.

## Friday 14th January, 2022

gltewalt

[01:08](#msg61e0cd2682a4667b257555a2)Red package or module = `pigment`

gltewalt:matrix.org

[01:11](#msg61e0cdadf5a394780004381f)Or `hue`

greggirwin

[03:08](#msg61e0e92182a4667b25758ecf)If you give permissions to that package, is it Hue Grant, or That'll Do...Pigment?

gltewalt:matrix.org

[03:14](#msg61e0ea82526fb77b317b21e3)Yes

## Tuesday 18th January, 2022

ldci

[10:15](#msg61e693276d9ba23328c9c1b5)Hi. For the fun I reactivated an old Ubuntu Touch phone. with armf. Compilation -t RPI is ok, but some libs are missing `error while loading shared libraries: libcrypto.so.1.1: cannot open shared object file: No such file or directory`. Any idea?

hiiamboris

[10:17](#msg61e693c7f5a39478000f4379)install those libs?

ldci

[10:19](#msg61e694215dc6213cd4e9efde)apt-get failed

[16:26](#msg61e6ea22bfe2f54b2e24e9bc)@hiiamboris : the libcrypto.so.1.1 file is placed in libssl1.1 package in Ubuntu 18.04 LTS (and newer versions).So cannot be used with older versions ...

hiiamboris

[16:30](#msg61e6eb397842bd3ca9519977)@qtxie may say if there's a way to override default choice of libcrypto in build config

## Wednesday 19th January, 2022

qtxie

[01:13](#msg61e765d246529077f590b1b0)&gt; @qtxie may say if there's a way to override default choice of libcrypto in build config

Nope. @ldci Did you try to create a symbol link to the older version with this name libcrypto.so.1.1?

ldci

[08:30](#msg61e7cc327842bd3ca953673b)@qtxie Under progress :)

[14:25](#msg61e81f539b470f389774eb42)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/pM6N/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/pM6N/image.png)

[14:25](#msg61e81f5646529077f5920cc3)Rebol3 is running under Ubuntu Touch

planetsizecpu

[15:21](#msg61e82c839b470f38977507f0)Good job @ldci 😃

toomasv

[15:22](#msg61e82cd39b470f3897750904):+1:

ldci

[15:32](#msg61e82f18e1a1264f0a647b18)Thanks folks :)

[15:33](#msg61e82f42526fb77b31895d33)But only in console mode. No gui support

Respectech

[19:22](#msg61e864e846529077f592a1fc)!\[alt](https://cdn.shopify.com/s/files/1/1884/2123/files/20220119\_111432.jpg?v=1642620074)

[19:23](#msg61e865147842bd3ca9549f09)!\[alt](https://cdn.shopify.com/s/files/1/1884/2123/files/20220119\_111637.jpg?v=1642620074)

[19:23](#msg61e8653e5dc6213cd4eddcbe)I can run R3 on Mobian on the Pinephone, including GUI, but as you can tell, the window doesn't come up in the right place on the display.

[19:26](#msg61e865e0bfe2f54b2e27ff93)Looking forward to seeing Red run on the Pinephone.

greggirwin

[19:46](#msg61e86aa25dc6213cd4ede7d5)Hey, @gltewalt, you and I need to connect on that. I think you got it working, and I have a pinephone here for you to walk me through.

chasecrum:matrix.org

[19:47](#msg61e86abc46529077f592ae3d)we've got a pine phone on our team here too

greggirwin

[19:48](#msg61e86b1bbfe2f54b2e280a99)@chasecrum:matrix.org, if you can get to Idaho, he can train us both and I'll buy the coffee. :^)

chasecrum:matrix.org

[19:53](#msg61e86c3dd41a5853f95bb722)nothing is impossible\\

gltewalt

[20:16](#msg61e8719746529077f592bc29)I have mobian on a card that @Respectech helped me out with, so I've set up pinephone with default o.s., and with mobian.

gltewalt:matrix.org

[20:45](#msg61e878842a210c38c1d88910)I haven't gotten red running on it, but then again I haven't tried with mobian yet

Nuc1eoN\_gitlab

[22:57](#msg61e89762bfe2f54b2e286879)@greggirwin hey Gregg I just now read the new article on red-lang.org :) Congrats it is a very well written article and was well worth reading whole! :D

[22:58](#msg61e897987842bd3ca95509d8)And it seems red is on a good course.

[22:58](#msg61e8979f5ee4df335af2d1b4)For 2022

[22:59](#msg61e897b4bfe2f54b2e28693a):)

greggirwin

[22:59](#msg61e897ca2a210c38c1d8cb1f)Thanks!

rubble\_monkey:matrix.org

[23:29](#msg61e89ef0526fb77b318a4bbc)Greetings, complete n00b here. Does anyone know why IME on Linux doesn't seem to work in Red GUI applications? I figured since it uses GTK under the hood it would "just work". I tried fcitx-mozc, fcitx-anthy and ibus-mozc.

## Thursday 20th January, 2022

gltewalt:matrix.org

[00:42](#msg61e8affc2a210c38c1d8f9be)Any errors printed to a terminal?

rubble\_monkey:matrix.org

[00:45](#msg61e8b0c0bfe2f54b2e2899d6)Gtk-Message: 19:45:04.616: Failed to load module "appmenu-gtk-module"  
Gtk-Message: 19:45:04.617: Failed to load module "canberra-gtk-module"

[00:48](#msg61e8b15d46529077f59337ea)Unfortunately Ubuntu 20.04 (LTS) doesn't seem to have 32-bit versions of those packages, which I would assume Red requires.

gltewalt:matrix.org

[00:50](#msg61e8b1bd6d9ba23328ce43f0)Any 32 bit versions from debian that might work with it?

rubble\_monkey:matrix.org

[00:50](#msg61e8b1d5d41a5853f95c4df5)I'll see if I can dig some up

[01:05](#msg61e8b5539b470f38977621a1)was able to get 32-bit canberra-gtk-module and that error went away, unfortunately trying to install 32-bit appmenu-gtk3-module seems to conflict with the currently installed 64-bit version... If that's the problem I'm not sure if there is a reasonable solution. Was worth a try at least.

[01:05](#msg61e8b577526fb77b318a768f)Thanks for the fast response BTW!

[01:13](#msg61e8b731742c3d4b21a755ab)I really should just switch to Debian at this point, Ubuntu is not what it used to be...

[01:14](#msg61e8b787f5a394780013ddfd)Regardless, I must say Red's GUI is by far the most pleasant one I've ever used!

gltewalt:matrix.org

[01:22](#msg61e8b95b7842bd3ca9554b27)I'm using Mint but haven't tried IME

[01:25](#msg61e8ba2246529077f59347a3)Issues are present with gtk backend. So if you're a gtk programmer you could chip in :-)

rubble\_monkey:matrix.org

[01:28](#msg61e8baba526fb77b318a8163)Unfortunately I tried using that monster a while back and just gave up.

[01:29](#msg61e8bb052a210c38c1d90fc1)I honestly find the Windows GUI easier to work with, but that may just be me...

[01:30](#msg61e8bb3e5ee4df335af3166d)Win32 I mean, not .NET

[01:36](#msg61e8bcbb2a210c38c1d912ff)and I'm not even sure how you are supposed to use Qt outside of Qt Creator. The choices for Linux GUIs... well, they aren't great. Needless to say, you guys have my respect and gratitude for making things so much simpler to work with!

greggirwin

[01:54](#msg61e8c0bc2a210c38c1d919f9)Welcome @rubble\_monkey:matrix.org. Glad you got at least one problem solved.

rubble\_monkey:matrix.org

[01:55](#msg61e8c12fd41a5853f95c6748)Thanks! Seems to be a nice and welcoming community!

[01:56](#msg61e8c1545dc6213cd4ee961a)And Red seems to be very interesting language too

qtxie

[02:10](#msg61e8c4856d9ba23328ce682b)@rubble\_monkey:matrix.org IME was working on Red GTK backend. We use native GTK controls, so they should support IME already. The edit control in the gui-console is a custom control, but IIRC it has IME support, unless there is a regression.

rubble\_monkey:matrix.org

[04:09](#msg61e8e087e1a1264f0a65e6bd)I also made sure to do a clean build of my project when switching compiler versions just in case.

[05:29](#msg61e8f322526fb77b318ae596)I'm gonna get a couple of different Linux distros and desktop environments and try them in VMs to see if I can narrow down the problem, (my internet is excruciatingly slow, so it may take a while).

ldci

[10:52](#msg61e93ef77842bd3ca95651b2)Trying to compile some basic code for android, but does not work `Target: Android Compiling to native code... *** Warning: OS_TYPE macro in R/S is redefined *** Compilation Error: invalid path value: image/extract-data *** in file: %/Users/fjouen/Programmation/red-master/tests/datatypes/binary.reds *** in function: red/binary/to *** at line: 1 *** near: [1031x7 proto: image/extract-data as red-image! spec EXTRACT_ARGB ]`

pekr

[11:03](#msg61e94171f5a394780014e19f)Isn't Android branch too old? IIRC there was supposed to be a new one, probably hidden?

chasecrum:matrix.org

[13:59](#msg61e96aa7d143b14f83284b3e)I have opensuse and SLES servers here if there's something I can help you test

greggirwin

[15:33](#msg61e980dfbfe2f54b2e2a44b8)@ldci Android will get some love soon. A lot of unmerged work is out there.

## Friday 21st January, 2022

GiuseppeChillemi

[19:46](#msg61eb0d9a526fb77b318f2ad9)@greggirwin I prey for this at least once a day.

Respectech

[20:30](#msg61eb17d87842bd3ca95a228b)!\[](https://cdn.shopify.com/s/files/1/1884/2123/files/20220121\_121313.jpg?v=1642796932)

[20:30](#msg61eb17f25dc6213cd4f34fb5)Incidentally, R2 also runs on the Pinephone (Mobian). But none of the icons or menu options worked on the Viewtop.

rebolek

[20:30](#msg61eb17f7742c3d4b21ac31ac):D

Respectech

[20:30](#msg61eb180182a4667b2589e7ee)!\[](https://cdn.shopify.com/s/files/1/1884/2123/files/20220121\_121536.jpg?v=1642796324)

[20:31](#msg61eb18259a3354540634a258)!\[](https://cdn.shopify.com/s/files/1/1884/2123/files/20220121\_122052.jpg?v=1642796731)

[20:31](#msg61eb1831742c3d4b21ac3201)!\[](https://cdn.shopify.com/s/files/1/1884/2123/files/20220121\_122045.jpg?v=1642796731)

[20:32](#msg61eb18529b470f38977b044b)But simple `view` seems to work fine. I was able to click on the button and get it to print output to the console and then unview the window.

greggirwin

[21:04](#msg61eb1fe49a3354540634b0f1):+1:

## Saturday 22nd January, 2022

ldci

[09:34](#msg61ebcf9b2a210c38c1df0fcd)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/HXlt/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/HXlt/image.png)

[09:36](#msg61ebd0049a3354540635ee35)Rebol-R3 running on my new M1 Apple iMac:). So waiting for Red 64-bit version :)

[09:45](#msg61ebd232526fb77b319092db)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/6yJ8/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/6yJ8/image.png)

[09:45](#msg61ebd24dd143b14f832cfc6a)R3 with GUI on new iMac

[09:46](#msg61ebd28ee1a1264f0a6bd0f2)XQuartz required.

GalenIvanov

[10:07](#msg61ebd74f9b470f38977c560b):+1:

planetsizecpu

[10:32](#msg61ebdd42d143b14f832d104a)Amazing @Respectech well done! @ldci looks very well, the M1 has to be so fast!

ldci

[11:14](#msg61ebe702742c3d4b21ada1fe)@planetsizecpu Yes really impressive for native ARM apps and rosetta allows to use intel-based applications with a really good performance :)

hiiamboris

[11:22](#msg61ebe8e8526fb77b3190ba05)5 years forward you'll be thinking "damn our computers became so much slower than they were in 2022" ☻

ldci

[11:25](#msg61ebe9a0d143b14f832d2588)@hiiamboris Good point :)

[11:26](#msg61ebe9e39b470f38977c74c6)For testing: https://mac.getutm.app/gallery/

planetsizecpu

[12:11](#msg61ebf4727842bd3ca95badb8)In fact 3yr are enough, as they come out with a few OS updates, is this stressing bussiness world.

cloutiy

[14:08](#msg61ec0ff82a210c38c1df7cf8)Objects have a `on-change*` that gets triggered on values changing. But if the value is a block, it doesnt trigger if a value inside the block is changed. For example `data: object [ values: [ a b c ]] data/values: [ e f g] data/values/2: "this doesnt trigger on change"`

gltewalt:matrix.org

[14:14](#msg61ec112f742c3d4b21adef34)"event is generated only when words are set using a path access (so inside the object, you can set words safely)"

[14:15](#msg61ec119e5dc6213cd4f51539)Just in case you aren't using path notation

hiiamboris

[14:16](#msg61ec11a9742c3d4b21adf014)you need on-deep-change for that @cloutiy

gltewalt:matrix.org

[14:16](#msg61ec11c3bfe2f54b2e2f4d67)Crap, I can't even read at 7 in the morning and

[14:16](#msg61ec11d06d9ba23328d4de31)I'm not focusing

[14:17](#msg61ec11f7d143b14f832d6e64)Sorry about that

hiiamboris

[14:17](#msg61ec12037842bd3ca95be389)have some more sleep :)

gltewalt:matrix.org

[14:17](#msg61ec120fd143b14f832d6e7e)👍

cloutiy

[15:05](#msg61ec1d2e82a4667b258bb3ee)@hiiamboris ok thanks. My reference is the red book by ivo balbaert. I guess its a bit dated now.

[15:20](#msg61ec20c7742c3d4b21ae0afd)Where can i find docs for `on-deep-change`?

hiiamboris

[15:20](#msg61ec20d19b470f38977cdc91)https://github.com/red/docs/blob/master/en/ownership.adoc

[15:20](#msg61ec20dabfe2f54b2e2f6a7f)took me a while to find it myself

[15:21](#msg61ec20ec5dc6213cd4f5303e)for some reason it's not on the `w.red-lang.org`

[15:21](#msg61ec2105bfe2f54b2e2f6abf)and I haven't seen @x8x around for long time

[15:22](#msg61ec21465ee4df335af9c371)be sure to check out https://w.red-lang.org/en/reactivity/ maybe deep reactors are what you actually need?

[15:25](#msg61ec21ef9b470f38977cdeb8)on-deep-change is supposed to be used when reactors do not fit your use case and involves quite a lot of work

[15:27](#msg61ec225b6d9ba23328d4fc76)it is also very complicated design and as a result, very buggy

cloutiy

[15:47](#msg61ec27215dc6213cd4f53c2b)@hiiamboris Thanks for the reference documentation. The arguments for `on-deep-change*` are a bit differen than `on-change*`... Well, I'm not sure which one fits better as I just have an idea I trying to experiment with. For example when there is a web server and a database, having a layer on top of the database as a collection of red objects, where if data changes, it notifies a list of subscribers. Something like that. Just experimenting. What I like about Red...the brain just lights up with ideas.

## Monday 24th January, 2022

ldci

[18:12](#msg61eeec1f5dc6213cd4fa48c8)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/wcIM/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/wcIM/image.png)

[18:14](#msg61eeec736d9ba23328da1711)@Oldes Due to your excellent works, R3 is natively supported on Apple M1 processor :)

greggirwin

[19:47](#msg61ef0241e1a1264f0a719e1a)Woohoo! Big congratulations @Oldes!

planetsizecpu

[20:26](#msg61ef0b9346529077f59f2ef6)Good news! François

## Tuesday 25th January, 2022

GiuseppeChillemi

[05:25](#msg61ef89e49a335454063cc73a)@ldci with GUI?

ldci

[07:38](#msg61efa8fb2a210c38c1e61fb0)@GiuseppeChillemi, No gui actually but Oldes is working on Blend2D. Waiting for a complete version.

GiuseppeChillemi

[14:07](#msg61f0043b9b470f38978405d4)His one man work is admirable.

pekr

[14:35](#msg61f00a982a210c38c1e6ec40)@greggirwin You've mentioned the Animation dialect being possibly part of the next release. This one, took me by a surprise and is a very nice addition to Red. Always wished to have Scala multimedia in Redbol :-) Might I ask, what was the motive to have it? I really did not see it coming, so thanks for that! .....

greggirwin

[20:33](#msg61f05e87f5a3947800227bf0)@pekr, the work started out to see what might be possible, but kept relatively simple. There are a number of use cases that made it seem worth the R&amp;D effort.

\- A showcase feature that is highly visible. Much of what makes Red special is hard to see. But the GUI aspect is an eye-catcher. I think this will be as well.

\- Simple animations during app startup, can be very engaging. As can subtly changing backdrops. We may not think they're important, but do need to consider what appeals to users and a wider audience. Things like that can make an app look slick and polished, even if the guts are exactly the same.

\- Much less jarring when async events happen that are shown in a UI.

\- Presentation app that takes %show.r to the next level (Code Name: RedPresent)

\- RAPIDE, and maybe even DiaGrammar. For RAPIDE I think it could be a key feature on the UI side, where it can offer a great, live visualization for requests and responses in a flow of API calls.

[20:49](#msg61f0623dbfe2f54b2e377600)Of course, it will also make simple games possible, that are much more fun to watch in action. And while we're not going to display Unity or other tools that people use for visualization and cool youtube videos like \[this one about Bezier curves](https://www.youtube.com/watch?v=aVwxzDHniEw), maybe it will give some people a new tool for creating visual explanations.

gltewalt:matrix.org

[21:02](#msg61f0656ebfe2f54b2e377c26)Appearance and experience go together

[21:07](#msg61f066792a210c38c1e7b181)There are plenty of stories of a shiny skin on an incomplete solution having more influence on the suits than a complete solution in drab clothes

greggirwin

[21:21](#msg61f069d85dc6213cd4fd4e5c)What really made this happen, though, was @GalenIvanov. He stepped up and championed the project, so it didn't take time away from the core team. He did a huge amount of research on other systems, then developed a very clean, idiomatic system. If you haven't looked at the examples, I encourage everyone to do so. Galen has created a wonderfully readable dialect. e.g.

```
fly-in: start 0.0 duration 2.0 ease :ease-in-out-elastic
...
start 2.0 after fly-in starts duration 2.0 loop two-way 3 times
```

The particles demo shows how he made the design data driven.

Because it's a new feature, feedback will be important, and may drive changes before too much user code is written in it.

## Wednesday 26th January, 2022

GalenIvanov

[07:43](#msg61f0fbb446529077f5a2fe32)@greggirwin I'm close to finishing the last animation effects I'm working on and then I'll revise all the examples, as well as I'll document the dialect.

ldci

[08:16](#msg61f10374526fb77b319a5fcc)@GalenIvanov Really nice wok :)

[08:19](#msg61f10404742c3d4b21b75f71)work (sorry)

pekr

[09:29](#msg61f1149082a4667b2595191c)I always liked Scala multimedia on Amiga. I was surprised, when I saw the source for the nice animations, being just a short script. I have Scala Script 2.0 docs somewhere. Myself being in the realm of LCD TV, kiosks, and LED screen business, I always wished for the Rebol based solution. I can even see some business oportunity there. With such system, you are paying for each screen (player). And what was missing with Powerpoint presentation turned into video, was interactivity, not being able to display simple stuff, like daily updated data, etc.

[09:31](#msg61f11508e1a1264f0a75b562)I also do remember talking to few ppl in the past, about Rebol and its values. It was like - ok, and? And once I have started the Rebol Desktop and showed few demos and its sources, the reaction was always like - man, this is impossible, right? So please - go ahead, visual showcase is always psychologically appealing. At least to end users, not necessarily to the hard coders living in realms of consoles .....

ldci

[11:01](#msg61f12a1382a4667b25954594)A really interesting Gui C lib: https://github.com/andlabs/libui

[11:01](#msg61f12a22742c3d4b21b7adb2)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/p3Uy/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/p3Uy/image.png)

[11:02](#msg61f12a3546529077f5a3604a)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/TqHz/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/TqHz/image.png)

GalenIvanov

[11:35](#msg61f131e75ee4df335a0344bc)Thank you, @ldci !

ldci

[11:54](#msg61f136602a210c38c1e94b5f)@GalenIvanov, Compiled with Apple Silicon M1: works fine. Next step : connect to R3-ARM:)

rebolek

[12:59](#msg61f145bb5ee4df335a036f37):+1:

ldci

[13:16](#msg61f149aa46529077f5a3a1c3)@rebolek Need help for R3. Too busy actually in hospital.

pekr

[13:24](#msg61f14b7ed41a5853f96ceebd)@greggirwin one question. Some time ago you've mentioned "table", IIRC. Is that in terms of the future Red Spaces project, or something separate? I think that inability to easily display columnar data (even without fancy features), might be crucial to many users and small ad-hoc display tools. And I don't expect finding a cross platform native OS widget to bind to?

hiiamboris

[14:20](#msg61f158aa5ee4df335a0395db)From the amount of interest in Red Spaces since March I can tell that table widget is more of a theoretical need than practical. People seem to live just fine without it.

pekr

[14:28](#msg61f15a979b470f389786b834)Or ppl stop using Rebol and resort back to R2 or R3-GUI, whatever ....

[14:29](#msg61f15aced41a5853f96d0e82)One things seems to be clear. Those effort does not seem to be coordinated enough, which popped-up with the xml codec and especially CLI module.

hiiamboris

[14:45](#msg61f15e6c5dc6213cd4ff30aa)well, cave mode has it's drawbacks :D

GiuseppeChillemi

[16:46](#msg61f17ae69a3354540640b459)@hiiamboris I think the reason lies in the lack of elements like "Table-Table". People will adopt Red Spaces when it will give them advantages in their day to day work. I am currently stuck on Rebol2 beacuse List-View in VID let me create the interfaces I need. If red-spaces has it and /r other widgets, I would immediately drop Rebol2 in favor of Red + Red Spaces. If a languages has the instruments you need to realize what you want, it will be adopted.

hiiamboris

[16:49](#msg61f17bb05dc6213cd4ff6e8d)&gt; elements like "Table-Table"

what is this?

GiuseppeChillemi

[16:50](#msg61f17bc7bfe2f54b2e39b691)Text-Table, a Typo.

[16:50](#msg61f17bdad143b14f8337d7e8)Also called List-View in Vid Extension Kit

hiiamboris

[16:55](#msg61f17d189a3354540640b8c0)well, I already told you that the element is there and it's actually one of \[the demos](https://gitlab.com/hiiamboris/red-spaces/-/tree/master/tests#grid-tests), and that to code selection capability you will only need like a day (less if you consult with me), so the real reason is something else

[16:56](#msg61f17d335ee4df335a03e4e8)I guess it simply doesn't make sense to move to a new concept when you already have it working

[16:59](#msg61f17df3526fb77b319b639f)another reason is probably fear that underlying code might change (it's alpha after all), and I understand that

GiuseppeChillemi

[17:01](#msg61f17e795ee4df335a03e879)Hiiamboris, the demos do not resemble an usable component but something to show that some parts are there. Looking at something like this would give you a totally different result for Red Spaces:

[17:01](#msg61f17e7dd41a5853f96d5a4e)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/BrH2/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/BrH2/image.png)

[17:04](#msg61f17f185dc6213cd4ff7609)If Red Spaces has usable widgets, you should give an aspect which let people think they are usable. The pink demos give the idea of you exeprimenting with code. I think no one has understood Red Spaces is usable.

[17:07](#msg61f17fb75dc6213cd4ff77ab)If it is ready to be used, we all have lost about one year, because the tool we need was here but no one knew this.

hiiamboris

[17:09](#msg61f18047bfe2f54b2e39c07c)well, it's all within your grasp if you're willing to spend some time adding functions you need ;)  
I'm not yet writing filters or sorting, because bells and whistles are not a priority for me as a designer, and because I'm working on other projects right now, and because I know if someone wants additional features they will have no problem writing them

GiuseppeChillemi

[17:11](#msg61f180d1d41a5853f96d5ea9)We can start without filters, but please, could you change a couple of demos to let us see something more similar to the interfaces humans currently uses?

hiiamboris

[17:13](#msg61f18120f5a394780024c882)without filters and column sorting your screenshot is a reduced version grid-test4

GiuseppeChillemi

[17:13](#msg61f1812d9a3354540640c318)Just a couple: a Text List filled with relevant data and normal colors, a button and a field togheter...

[17:14](#msg61f1815b5ee4df335a03ef39)This:

[17:14](#msg61f1815ee1a1264f0a769b2c)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/mv4T/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/mv4T/image.png)

[17:15](#msg61f1819482a4667b2596038b)To me is the alien ancestor of this: :point\_up: \[January 26, 2022 6:01 PM](https://gitter.im/red/red?at=61f17e795ee4df335a03e879)

hiiamboris

[17:15](#msg61f181ae742c3d4b21b861b2)why?

GiuseppeChillemi

[17:15](#msg61f181cb5ee4df335a03f067)Because it does not resemble an usable component.

hiiamboris

[17:16](#msg61f181e7f5a394780024c9e0)how is it not usable?

GiuseppeChillemi

[17:16](#msg61f181f3d41a5853f96d610c)I am undestanding know it could be a working component but I have never thought this in one YEAR

[17:17](#msg61f182265ee4df335a03f115)I have believed it until know because of demos aspect

hiiamboris

[17:19](#msg61f182bf7842bd3ca9665221)sorry, I don't understand "demo aspects"

GiuseppeChillemi

[17:21](#msg61f1833282a4667b2596065e)The look of the demo let everyone think it is a wire-frame test and not an usable component.

pekr

[17:23](#msg61f1837c82a4667b259606bb)To put it simple - white background, black letters, dark grey lines / grid, combined display of text, numbers, if cells can or can't contain buttons, images, other elements? :-)

[17:24](#msg61f183b8d41a5853f96d65b3)Hiiamboris might be right, that if anyone would REALLY need it, he/she would adapt it. I wanted to, but could not find proper time to do so. And Hiiamboris will surely not fix the lack of my free time for me :-)

GiuseppeChillemi

[17:24](#msg61f183dd742c3d4b21b8669f)One column with name, another with surname, then age, city and Order ID and Amount.

hiiamboris

[17:24](#msg61f183e19a3354540640c884)&gt; if anyone would REALLY need it, he/she would adapt it.

EXACTLY! at the very least they would run the demo and see that their colors are different

GiuseppeChillemi

[17:25](#msg61f18415bfe2f54b2e39c936)Its not how people work.

pekr

[17:25](#msg61f184199b470f3897871295)Reading Doc's reaction to your CLI module, one has to wonder though, what is the chance Red will adapt it one day? And hence my further question - how big is basic infrastructure, to have it as an addon to VID?

hiiamboris

[17:28](#msg61f184b55dc6213cd4ff81b5)we'll see.. I haven't even planned it as a module because so much tooling is lacking in Red currently, not to mention Nenad is very strict about code size

GiuseppeChillemi

[17:29](#msg61f184ffd41a5853f96d6855)You have to show what let people think your product is usable and ready. I think quite all have dropped thinking you were just showing some drawing capabilities.

hiiamboris

[17:31](#msg61f185692a210c38c1e9f023)@pekr in my own project I have the freedom to experiment, but if it becomes a part of the language, any addition may be considered harmful because we won't likely be able to take it out or redesign, so it will stay like this for quite a while

GiuseppeChillemi

[17:31](#msg61f1857f7842bd3ca9665731)Please believe me, the aspect of thing is very important and you project is not being adopted because people don't see examples similar to the one I have posted.

hiiamboris

[17:32](#msg61f185c9742c3d4b21b86aa8)no, people are all different, so don't speak for everyone

[17:33](#msg61f185e8e1a1264f0a76a504)I know simple and practical demos are appealing, and are planned, just left for better times

GiuseppeChillemi

[17:36](#msg61f1869246529077f5a426b4)&gt; no, people are all different, so don't speak for everyone

If people are in front of the skeleton of a building, would they think it is ready to use or it is not complete and no one could live in it?

hiiamboris

[17:40](#msg61f18770e1a1264f0a76a7a0)it really depends on how enterprising they are and whether they want to understand what they're looking at

[17:41](#msg61f187e67842bd3ca9665d05)if you show me a few panels and other components that I can in one day mix to create my own building, that would amaze me

[17:42](#msg61f18807f5a394780024d55f)but we're flooding the chat, so let's not

GiuseppeChillemi

[18:03](#msg61f18cdbd41a5853f96d7a92)This chat needs this topic. Red Spaces is a great RED project made by you that could boost the usage of our language. It is also something you have worked on for months and I believe that could be an essential community tool. It needs to be presented the right way. I make filled pasta like Tortellini and Ravioli as my day to day job. If I send to my potential restaurant owner: ham, flour eggs and water for a demo, he will think nothing is ready and he must mix everything and prepare Tortellini by himself, which is not what he wants as he needs a ready made pasta to cook and serve to his customers. The same for your project: if you show just the wireframe with technical infos like 4x3, you are communicating that the project is not ready and no widget is really usable. I am writing this because real friends say the truth even if they know it is an unconfortable topic that could create adverse emotions. You are free to not being convinced by my words but if you are afraid Red Spaces not being adopted, I feel obliged to say that those pink demos are enemies and not friends of your project.

planetsizecpu

[18:08](#msg61f18e04bfe2f54b2e39ddd4)To me it is important it will be a native as other widgets like drop-down etc, not an add on as include or so. I think it does not need to support all these advanced features as cell graphics and buttons, just text or rich-text, well I'm thinking on some excel features: cell/grid resizing, coloring, fonts... More important IMO is cell navigation and cell access by code. The most common use cases I think.

[18:13](#msg61f18f372a210c38c1ea06fc)Maybe that fit better with the stakeholders point.

hiiamboris

[18:42](#msg61f19628e1a1264f0a76c59d)well obviously you're not gonna get a native grid because the OS does not have it

greggirwin

[18:46](#msg61f1971df5a394780024f475)Thanks for your feedback @GiuseppeChillemi. And for your thoughts as well @hiiamboris and others.

I agree that the color scheme and showing only advanced demos makes Red Spaces look very experimental. Note that I'm one of those people that hasn't tried to build anything with it. Because of the advanced nature of the demos, it looks intimidating from the outside, even having read the docs.

Why I haven't pushed people toward it is that there are a lot of outstanding questions and priorities to consider. Mixing the table from Red spaces into native GUIs may not be best, but will surely work. Do we focus on just that, or address the full non-native GUI system with focus when that time comes. If we do that, knowing that people \*do* need trees and tables, do we extract the table style, or build something else that covers only the basic needs?

To @pekr's question about "table", naming is hard. We have the UI element, the grid/table/spreadsheet, and we have the idea of a `table` module that handles the data aspect, potentially including pivots, summaries, etc., inspired by what Excel calls a "table" that you can have inside a sheet. That underlying data model, if we do it right, should be able to map automatically (or almost) to a UI.

&gt; One things seems to be clear. Those effort does not seem to be coordinated enough, which popped-up with the xml codec and especially CLI module.

CLI will be merged soon, unless something unexpected happens. We try hard to keep the team on the same page(s), and make the best use of everyone's time, but it's not easy. Remember, a lot of what we do is exploratory in nature.

[18:49](#msg61f197a07842bd3ca9668221)@hiiamboris there \*are* controls that native apps use for lists. e.g. https://docs.microsoft.com/en-us/windows/win32/controls/list-view-controls-overview

[18:50](#msg61f197db5ee4df335a041f54)But wrapping those complex controls and interfacing to them for the user is going to be a world of compromises.

[18:50](#msg61f19802526fb77b319b9811)Same for TreeView.

pekr

[18:52](#msg61f198835dc6213cd4ffa962)Well, all those design decisions are tricky. I do remember having some tree-views and menus for Rebol too. But they always behaved differently to native widgets. I think that ppl might be more forgiving for the look (typical OS look is kind of old-school, unless you are on something like Win 10-11 for e.g.), but not for a different behaviour. Especially proper shortcut / keayboard control makes it even more complex ....

greggirwin

[18:54](#msg61f198c8742c3d4b21b8921a)Henrik's amazing `list-view` style for R2 is ~100K of code, while R2's standard `list` style was quite limited in some ways, but very small and usable. The main issue there had to do with a couple design issues with iterated faces. But I'd be up for something like that in Red. The trickier issue, then, may be dealing with native controls inside the lists sub-layouts, which brings us back to non-native.

pekr

[18:55](#msg61f19934e1a1264f0a76cc38)Gregg, I like e.g. look of table in terms of the nanosheet demo. Just listing some data with scroller. But you know how those things go. Next user will want column sorrting, then column ordering, then column freezing, then selections / keyboard navigation, then multiselection, then in-place edits etc :-)

greggirwin

[18:56](#msg61f19952742c3d4b21b892e8)Exactly.

pekr

[18:57](#msg61f1998cbfe2f54b2e39f614)What is also interesting is the following things - why have most rebollers in the past moved to RebGUI? It provided few of missing elements - table, tabs, was compact enough, so many users switched over.

[18:58](#msg61f199c1bfe2f54b2e39f687)OK, Ashley was great programmer too of course and provided stuff like SQLite driver IIRC, or even Rebol based database ....

greggirwin

[18:58](#msg61f199d5bfe2f54b2e39f702)This is why I encouraged @hiiamboris to really push the limits, which he exceeded greatly, in designing Red Spaces. It's not a simple system, but should allow people to build anything. You may remember that some VB grid controls came out of failed commercial spreadsheet products. Those components were a huge investment.

[19:00](#msg61f19a509a3354540640f63f)&gt; why have most rebollers in the past moved to RebGUI?

I don't know if we can say "most". Ashley's tools are some of the best, and targeted and borne from, real business needs and uses. For those needs, RebGUI was a great choice. I personally went with `list-view`, and didn't have commercial DB needs.

[19:01](#msg61f19a9e2a210c38c1ea1f95)It would be nice to avoid too many different UI kits but, at the same time, specialized tools are what we do and I also hope we \*do* see people build for maximum leverage and minimum pain and complexity.

hiiamboris

[19:02](#msg61f19aca2a210c38c1ea1fff)&gt; @hiiamboris there \*are* controls that native apps use for lists. e.g. https://docs.microsoft.com/en-us/windows/win32/controls/list-view-controls-overview

riiight thanks for correction :)

## Thursday 27th January, 2022

zentrog:matrix.org

[01:17](#msg61f1f2a85ee4df335a04df41)I considered experimenting with Spaces for a small utility I was working on, but the comments about it having been broken by changes in `forall` pushed me over my limit of what I wanted to deal with for that, considering that the native widgets were sufficient for my use in this case.

planetsizecpu

[07:54](#msg61f24fa39a335454064262e7)&gt; well obviously you're not gonna get a native grid because the OS does not have it

Ah my mistake. I meant built-in.

henrikmk

[13:57](#msg61f2a4ac46529077f5a67dde)about list views: has Red's graphical performance increased since about a year ago? I was experimenting with a list view, but the performance was so terrible, I gave up.

pekr

[14:14](#msg61f2a8aa526fb77b319dc437)What was your methodics to test the required performance? We know, that Red might be slower generally, mostly due to compiling down to R/S and then to native with yet not optimised compiler. Another thing might be, if Red VID (I am not sure) uses base, which is wrappend OS widget, then having many objects might have relatively bad performance . But - we also know, that we've got HW accelerated Draw, ok?

Interesting thing in terms of Rebol's GUI history was the experience of initial Rebol gfx stack, later on with added Draw engine using AGG library. That made Rebol closer to multimedia and all those AGG demos were simply - impressive. Let's keep in mind, AGG was only a software renderer.

Then came R3. Original Rebol's gfx engine was removed and replaced by pure AGG. And face, as kind of big object, was mapped to gob! type, hence much smaller objects. Whereas R2 GUI has allocated 12+MB of RAM, IIRc R3 was something like 2-3 MB or RAM? I know that @qtxie has some experimental gob! branch, but also remember some notes, that for Red gui it might not be all that useful.

Anyone?

GiuseppeChillemi

[14:25](#msg61f2ab4e7842bd3ca968a5f3)@pekr

henrikmk

[14:25](#msg61f2ab596d9ba23328e18346)I admit I don't know the tricks for maximizing speed of the Red GUI, but even this was slower than doing the same thing in R2 with deliberately no optimization efforts. That was around 500-1000 faces in a grid, that I simply updated the text contents and background colors in with SET-FACE.

A lot of problems in this area isn't directly related to the draw engine itself, but how it's called with needless redrawing or draw block parsing.

GiuseppeChillemi

[14:26](#msg61f2ab9746529077f5a68c0d)@pekr  
VID List-View currently handles over 150K records in a breeze. It is made of block of objects where 1 row = 1 object.

hiiamboris

[14:32](#msg61f2acf75dc6213cd401ed21)Red Spaces handle unlimited number of records.

pekr

[15:28](#msg61f2ba1e9a33545406434fe3)@henrikmk Does Red parse Draw block differently than Rebol? What's the main difference?

hiiamboris

[15:39](#msg61f2bca1f5a3947800275006)IIRC he wanted it to cache unchanged parts automatically somehow.

henrikmk

[15:48](#msg61f2bed9d41a5853f96fe571)@pekr yes, unless it has been changed, DRAW commands in Red are parsed directly one-by-one into draw calls and draw parameters are not bindable to contexts. This means DRAW in Red runs at Red's PARSE speed rather than native speeds. Changing a parameter means reparsing the whole DRAW block. In R2, you can skip the parsing by simply changing bound parameters, call SHOW and greatly speedup drawing that way (though it's still far from optimal).

pekr

[15:50](#msg61f2bf359a33545406435ac4)Thanks. That should be noted somewhere in the wiki, as possible way to improve on things. Of course, if the problem is not somewhere deep in Red implementation internals.

hiiamboris

[15:54](#msg61f2c023d143b14f833a72a9)https://github.com/red/REP/issues/103

pekr

[15:58](#msg61f2c126e1a1264f0a7926fa)Perfect, thanks :-)

greggirwin

[18:47](#msg61f2e8d5526fb77b319e570e)\[draw-data-grid.red](https://files.gitter.im/5565a1d415522ed4b3e10094/lH28/draw-data-grid.red)

[18:53](#msg61f2ea32d41a5853f9704295)This is a really old example I did in R2, and just spent a few minutes porting to Red. Vert slider is reversed, so ignore that. :^) If you drag a slider you get multiple redraws. Ignore that too. Under R2 this ran in real time, with a hint of lag with a grid this size.

Note how the window appears instantly, with the data there, but then drawing, even from the button I added to test that it wasn't slider events overloading it, is slllooooowwwww. `Auto-sync?` has no effect. Just thought to try that.

[18:56](#msg61f2eacc526fb77b319e5b36)What happens is that every change to the draw block triggers a refresh, so it seems (need to read the ticket I guess). If you set the face's `draw` to something else, update the draw commands, then set it back. Boom! Super fast, but flickers.

[18:58](#msg61f2eb5c7842bd3ca96932d9)To trick it, and be a tiny bit wasteful, cache a copy of the existing draw block into `face/draw`, then swap. No flicker.

planetsizecpu

[18:58](#msg61f2eb5dd143b14f833ad502)Just enjoyed reading that ticket and seeing @dockimbel still alive and kicking after long time without reading anything from it, draw discussion has gone to background for me 😀

greggirwin

[19:00](#msg61f2ebb782a4667b2598db48)\[draw-data-grid.red](https://files.gitter.im/5565a1d415522ed4b3e10094/6dA5/draw-data-grid.red)

hiiamboris

[19:00](#msg61f2ebdf9b470f389789fe8c)auto-sync makes it realtime for me

greggirwin

[19:01](#msg61f2ec0a46529077f5a719fe)Hmmmm. Interesting. That's what I expected.

[19:02](#msg61f2ec2c9b470f389789ff45)DOH! Typo. :^\\

hiiamboris

[19:02](#msg61f2ec3b9b470f389789ff4e)☻

greggirwin

[19:06](#msg61f2ed505dc6213cd40279ac)\[draw-data-tree.red](https://files.gitter.im/5565a1d415522ed4b3e10094/f1hO/draw-data-tree.red)

[19:07](#msg61f2ed5f742c3d4b21bb481f)Tree/outline version.

planetsizecpu

[19:12](#msg61f2ee92d41a5853f9704c21)I'm on cell now tomorrow will test.

pekr

[19:20](#msg61f2f06a526fb77b319e667d)Nice, thanks for an example. What a difference in speed with auto-sync turned off. Now I will opt for turn it off by default :-)

## Friday 28th January, 2022

planetsizecpu

[07:39](#msg61f39db4d143b14f833c2214)Yes, auto-sync off makes things go as the user expects.

olivier\_lp\_twitter

[14:29](#msg61f3fde5d143b14f833ce5c6)Hi every one, i 'm used to rather scripting than compiling. One reason i went on rebol. But i'm making some tries with red compilation ,it's quite nice, and for red/system it's compelled.  
I wanted to measure performance gain with compilation, and the simple benchmark on read and write functions shows that with compilation it's faster. But the disappoint is when i did the same benchmark on rebol 2. Rebol is between 2 and 4 times faster than red on the read function

hiiamboris

[15:04](#msg61f406165dc6213cd404a3bc)try `read/binary`

[15:07](#msg61f406aee1a1264f0a7baba5)also if `read` and `write` shows different times when compiled and interpreted, 99% that your benchmark is flawed

[15:09](#msg61f407155dc6213cd404a5c7)probably OS just cached your file and that's all

gltewalt:matrix.org

[21:48](#msg61f464c86d9ba23328e4e6f7)rebol is made with C language

## Saturday 29th January, 2022

hiiamboris

[09:21](#msg61f5072ae1a1264f0a7d7e02)Both R2 and Red simply make an OS call to read the file. It doesn't make sense to benchmark it.

kermitaner

[18:36](#msg61f58912bfe2f54b2e41855e)for text files i use "foreach line split read %file newline" and for writing i buffer all lines in a string and write only once... that way its faster than processing in line mode

hiiamboris

[18:48](#msg61f58c037842bd3ca96e2fc7)try `read/lines` and `write/lines`

greggirwin

[18:55](#msg61f58db4526fb77b31a35095)@hiiamboris +1. My request for examples is to see what is actually slow.

## Sunday 30th January, 2022

gltewalt:matrix.org

[18:16](#msg61f6d5e746529077f5ae34d7)DESCRIPTION: Destroys time.

[18:55](#msg61f6df0f5ee4df335a0df21d)If rebol and red use a different algorithm for a function, that can make a big difference. How far do we want to investigate?

pekr

[18:57](#msg61f6dfb0d143b14f834200dd)I think that it was already kind of proven, that it might not be related to the read/write speed. User used a loop of 10K iteration, where the loop itself (even empty), is 6x slower in Red.

greggirwin

[19:03](#msg61f6e0fa7842bd3ca9708bc6)@gltewalt:matrix.org a lot of things come into play. I care much more about the big picture than micro-benchmarks.

pekr

[19:04](#msg61f6e147d143b14f8342030b)It will be interesting to test file IO, once switched to IO branch. Or is IO branch recently addressing only a networking?

greggirwin

[20:23](#msg61f6f3b1d143b14f8342205c)File I/O is included as well.

olivier\_lp\_twitter

[20:59](#msg61f6fc1782a4667b25a048fc)Good to read

## Monday 31st January, 2022

GiuseppeChillemi

[00:05](#msg61f727e6e1a1264f0a813c31)Have you switched of the garbage collector?

uwbwsvd

[14:43](#msg61f7f582d143b14f8343f8cb)\[!\[grafik.png](https://files.gitter.im/5565a1d415522ed4b3e10094/0Kae/thumb/grafik.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/0Kae/grafik.png)  
I want to work with red and Visual Studio Code. What does "path to the Red toolchain" mean?

hiiamboris

[14:45](#msg61f7f612d143b14f8343f9c2)path to `red.exe` file

uwbwsvd

[14:55](#msg61f7f8662a210c38c1f604f7)\[!\[grafik.png](https://files.gitter.im/5565a1d415522ed4b3e10094/LzJW/thumb/grafik.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/LzJW/grafik.png)

hiiamboris

[14:56](#msg61f7f885526fb77b31a78d96)yes

uwbwsvd

[14:56](#msg61f7f8b1742c3d4b21c47000)Have to rename to red.exe?

hiiamboris

[14:58](#msg61f7f8f8d41a5853f979847e)no reason

[14:58](#msg61f7f91a526fb77b31a78eb6)well, just guessing though, never used this editor

uwbwsvd

[15:04](#msg61f7fa919b470f389793567b)Thanks! Get a little further.

[15:05](#msg61f7facdd143b14f834403ab)\[!\[grafik.png](https://files.gitter.im/5565a1d415522ed4b3e10094/N3Ox/thumb/grafik.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/N3Ox/grafik.png)

[15:05](#msg61f7fad35dc6213cd40bc2e3)No it stucks with this

hiiamboris

[15:07](#msg61f7fb489b470f38979358c1)it takes a while, just wait

[15:08](#msg61f7fb6be1a1264f0a82bf8e)do you need to compile though?

uwbwsvd

[15:10](#msg61f7fbfe46529077f5b05534)I'm an Newbie of a Newbie. Try something that may work with VSCode. Wanna play around.

[15:15](#msg61f7fd1f5dc6213cd40bc73e)\[!\[grafik.png](https://files.gitter.im/5565a1d415522ed4b3e10094/US87/thumb/grafik.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/US87/grafik.png)

[15:16](#msg61f7fd3b526fb77b31a798e9)Did this. Works better!

hiiamboris

[15:43](#msg61f803a8f5a3947800312658):+1:

pekr

[19:11](#msg61f83444526fb77b31a80d25)I would like to ask something re maps, and the fact that those use parens, which I consider being visually unpleasant experience in Red in relation to datatypes. But you already know that.

So here goes - why map has to use a special sigil `#` to denote a `map!`. At first sight, it of course looks logical, so maybe the real question si - why `object!`, as a first class datatype, does not need any?

hiiamboris

[19:14](#msg61f834fa9a335454064d8489)As a result you can't have objects \*as data\*, but can have maps.

[19:14](#msg61f835152a210c38c1f683f4)What would be Red's equivalent of some JSON file if not for this?

giesse

[19:16](#msg61f8357abfe2f54b2e464a9f)

```
REBOL/Core 2.7.6.4.2 (14-Mar-2008)
Copyright 2008 REBOL Technologies

>> mold/all make object! [a: 1]
== "#[object! [^/    a: 1^/]]"
```

hiiamboris

[19:16](#msg61f83596526fb77b31a81046)Nenad doesn't want construction syntax at all ;)

giesse

[19:16](#msg61f835abd143b14f8344842f)That's a terrible, terrible idea. \*Shrug\*.

pekr

[19:17](#msg61f835b27842bd3ca972fbe8)there is many possible sigils to use `#[ ] @[ ] o[ ] ![ ]`etc. :-)

hiiamboris

[19:17](#msg61f835c99b470f389793de9a)Well, `#{}` `#""` are already there, so `#` is natural choice. `#[]` is planned but deferred.

pekr

[19:17](#msg61f835cb6d9ba23328ebc2f3)Gabriele - what is terrible idea?

[19:18](#msg61f835ff5ee4df335a106a7f)I would like data being presented in a block structure, not parens. I can't stand, how seeing map in the code ruins my day :-)

[19:18](#msg61f83621bfe2f54b2e464bd1)what is #\[ ] reserved for then?

hiiamboris

[19:19](#msg61f836339b470f389793df10)`#[]` for maps, `#()` for construction syntax.

[19:19](#msg61f836426d9ba23328ebc416)But this discussion led us nowhere so far :)

pekr

[19:21](#msg61f836a646529077f5b0d1c5)Why? :-) I still think it is still quite early in the process to switch maps to #\[ ] .... Does Nenad object against the change?

hiiamboris

[19:21](#msg61f836d3f5a3947800319714)Against construction syntax :) We couldn't present a single strong enough argument to support it.

[19:22](#msg61f836e65ee4df335a106d08)Maybe @giesse has one? ;)

pekr

[19:23](#msg61f8372346529077f5b0d301)Any example of construction syntax? You mean the thing to serialise a datatype?

hiiamboris

[19:23](#msg61f837325ee4df335a106dc6):point\_up: \[January 31, 2022 10:16 PM](https://gitter.im/red/red?at=61f8357abfe2f54b2e464a9f) this one

pekr

[19:24](#msg61f8376ebfe2f54b2e464ebb)so #\[ ] is reserved for a construction syntax?

hiiamboris

[19:24](#msg61f837885ee4df335a106e22)It's currently partially implemented as construction syntax.

pekr

[19:25](#msg61f837bc9a335454064d8a60)what is construction syntax for images for e.g.? Or is that something else?

```
>> make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
```

hiiamboris

[19:26](#msg61f837d882a4667b25a29fad)It's not designed.

[19:28](#msg61f838687842bd3ca9730258)@pekr --&gt; https://github.com/red/red/issues/4126

pekr

[19:37](#msg61f83a687842bd3ca9730742)" Gregg: I would still like dockimbel to confirm that we want to keep #(...) for maps, because #\[...] is really a better fit.

Doc: So you want to swap map! and construction syntaxes? I have nothing against that."

greggirwin

[19:48](#msg61f83d16d41a5853f97a18c0)We're agreed on the syntax change for maps, but not for construction syntax. Today only `[none unset true false]` use it, which is also key for maps (which don't evaluate) and, lesser, avoiding `reduce` allocations where they're used in blocks or with funcs like `switch` and `find`. The big question, though, is construction syntax use cases, now that we have `redbin`. We can also use one syntax for the literal values above, which leaves the door open for a more general construction syntax using `#(...)` later.

There has been a \*lot* of team chat about it.

pekr

[19:53](#msg61f83e4f5dc6213cd40c518a)OK, thanks, so the chance of change for maps still lives on :-)

## Tuesday 1st February, 2022

giesse

[19:11](#msg61f985de526fb77b31aa9d07)I'm not sure arguing about it leads anywhere. It's all opinions at this point (because nobody can agree on what's important).  
I would like `mold/all` to be the default, because you almost never want to not use `/all`. (For things like `probe`, maybe, but even then it can be more bad than good.) If redbin is the answer, that means that `save`, `mold` etc. would have to use redbin by default, which is a big change. I don't doubt that there are a ton of cases where redbin is the best choice, but is it \*always\*?

hiiamboris

[19:21](#msg61f9884e742c3d4b21c78d6a)I very rarely use `mold/all`. Usually it's `mold/flat` or `mold/flat/part`. Sometimes, with `/only`.

greggirwin

[19:36](#msg61f98ba37842bd3ca9759578)@giesse yup. All opinion. Makes things really hard. On a related note: https://www.vidarholen.net/~vidar/An\_Empirical\_Investigation\_into\_Programming\_Language\_Syntax.pdf

[19:39](#msg61f98c695dc6213cd40eeeba)Which came to me via https://quorumlanguage.com/evidence.html

[23:44](#msg61f9c5e0ced11857f98c3292)Coming from https://gitter.im/red/bugs?at=61f9024df5a394780033201f

@Oldes @hiiamboris (and everyone else) I hope you realize by now that in cases where we disagree, you can win, you can have your way, and I \*will* concede. All you have to do is provide concrete use cases (existing cases in old code count), show value, address concerns and issues I point out, and make a strong case for what you want. Easy. ;^)

&lt;pedantic rant redacted&gt;

Where you suggest `append/part buffer tail b -2` my first instinct was this:

```
last-part: func [
	"Return the last N items from a series"
	series [series!]
	count [integer!]
][
	copy skip tail series negate count
]
append buffer last-part b 2
```

But wait! `Last` is a mezzanine function! It could support `/part` directly. Complicates it a bit though, given `tuple!` support there. Has anyone ever used `last` on a tuple? I don't think I have, and would vote to remove it unless someone has a good use case. I can't think of any. That leads me to this:

```
last: func [
	"Returns the last value(s) in a series."
	series [series!]
	/part "Specify a number of values."
		length [number!] 
][
	either part [
		copy skip tail series negate length
	][
		pick series length? series
	]
]
b: [1 2 3 4 5 6 7 8 9 10]
print last b
print last/part b 1
print last/part b 2
print last/part b 10
print last/part b 11
print last/part b 0
print last/part b -1
```

And your example becomes: `append buffer last/part b 2`, which I think expresses the intent much more clearly \*and* makes it so you don't have to remember or research the details of how negative parts work; but I hope everyone will weigh in on that. Which do you all prefer?

```
A) append/part buffer tail b -2
; or
B) append buffer last/part b 2
```

## Wednesday 2nd February, 2022

planetsizecpu

[05:42](#msg61fa19b21fe6ba5a97056dab)I see B more readable and understandable

pekr

[05:48](#msg61fa1b101fe6ba5a9705705a)That does not address REPs claims, that handling /part amongst many places is a mess and should be replaced by some R/S code, which would unify the aproach.

Oldes

[06:59](#msg61fa2bd0dc191b3d698f20e0)@greggirwin of course.... we can write mezzanine function for everything

[07:01](#msg61fa2c53d410244480406a8a)

```
>> profile/times [[append/part clear "" tail b -2] [append clear "" last/part b 2]] 100

Running 2 code blocks 100 times.
----------------------------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (2μs)         | 5      | 1      | 0      | 8           | [append/part clear "" tail b -2]
1.69x (3μs)        | 15     | 2      | 0      | 104         | [append clear "" last/part b 2]
----------------------------------------------------------------------------------------------------
```

[07:05](#msg61fa2d23b8b082448213d171)Btw... my taking from tail was just an example... one may want to copy from the middle. I think that we can agree, that there should be at least \_feature not available_ error, where now the \_negative range_ is completely ignored.

hiiamboris

[09:30](#msg61fa4f46dc191b3d698f689c)IMO this is an adhoc design that nobody will use because of the extra copy. Solution to that may lurk in making the interpreter smarter as I described previously, but is it going to happen? Doubtful.

[09:31](#msg61fa4f88a41d896a20763daf)And yes, I think this should be approached with a general native, and every other part supporting native would dispatch into it.

[10:16](#msg61fa5a151fe6ba5a9705e7c6)Also, negative part starts here:

```
>> p2: skip p1: next "abcde" 3
== "e"
>> f: func [a b] [copy/part a b] ;) what comes before a or b?
== func [a b][copy/part a b]
>> f p1 p2
== "bcd"
>> f p2 p1
== "bcd"
>> f2: func [a n] [copy/part a n] ;) sometimes the only thing we have is offset
== func [a n][copy/part a n]
>> f2 p1 offset? p1 p2
== "bcd"
```

[10:20](#msg61fa5ae34164105ab07938db)I'm sure we can all agree that we're not removing `p1`/`p2` symmetry.

[15:32](#msg61faa406e4c979478d59f584)\*Explicit* integer negative parts are very rare. I've only found one \[occurrence](https://gitlab.com/hiiamboris/red-spaces/-/blob/e047003b777b534415d1c07d42eddc03e0aaad69/events.red#L432) in my code, and I remember vaguely having used it one or two times in golf-like tasks.

gltewalt:matrix.org

[17:13](#msg61fabbb36e4c1e1c8445118f)Any of you with Docker expertise, please see the red/chit-chat room

greggirwin

[18:12](#msg61fac978708e9c3dd75c27bb)&gt; there should be at least feature not available error, where now the negative range is completely ignored.

Yes, that was my original suggestion.

I also found very few cases of `append/part`, mostly in Boris' code, but a couple in the JSON codec. I doubt it will go away, as an optimization, and may be used more over time. People just have to watch the implied `copy`, and know when you use an explicit `copy/deep` if needed.

@hiiamboris agreed on positional symmetry. Though I do remember some chat in the past about `copy/part p2 p1` returning the values reversed. No to that.

Thanks for weighing in @planetsizecpu.

[18:13](#msg61fac9c81fe6ba5a9706cd60)&gt; IMO this is an adhoc design that nobody will use because of the extra copy.

Do you mean `last/part`?

hiiamboris

[18:15](#msg61faca2841e3293d65d23e7b)Yeah.

greggirwin

[18:18](#msg61facae303f2704782162cd1)So, when you say "nobody \*will* use it", you mean "a small number of people \*won't* use it"? ;^)

The important question, though, is whether it has enough value to be standard. How often do we need to copy more than one value from the end of a series? It's not a pattern I recall using a lot.

hiiamboris

[18:22](#msg61facbd2dc191b3d69906026)consider also intersection with `take/last/part`

greggirwin

[18:25](#msg61facc85e4c979478d5a4926)Can you be more specific?

planetsizecpu

[18:25](#msg61faccb0708e9c3dd75c2cfa)The thing that caught me on Rebol and Red was the flow of relative expressions, everything is at hand. IMO option B is better aligned with this essence, sometimes one have to try the option that fits better the mainstream despite the result.

hiiamboris

[18:32](#msg61face37d41024448041bbc3)&gt; Can you be more specific?

`take/last/part` does almost the same, but also removes. How do we deduplicate the logic?

[18:33](#msg61face96e4c979478d5a4d73)This whole discussion IMO is another artifact of not having slices.

[18:35](#msg61facee951bd8b580c83ee97)Maybe add a comment to REP 97 that it should be extended with `last/part` ? (or `part/last` or `part/tail`)

greggirwin

[18:40](#msg61fad0193e52f56a26e4fc64)`take/copy` are the final stage, after finding the position. `last/part` could just return the position, leaving the `copy` to the user. But that makes it quite different from `last` (I do have an old `at-last` func which did return the `back tail` position).

We have big picture questions, and small ones. `Part` is big. `Last/part` is small. Just a matter of whether it's useful enough to be standard, because it could be done now.

hiiamboris

[18:43](#msg61fad0e7dc191b3d69906a84)No. It's part of the big question. Instead of focusing on general solutions we stuff runtime with incoherent mess of small designs.

greggirwin

[18:44](#msg61fad0feb8b082448215258c)I understand your position.

toomasv

[18:50](#msg61fad2673e52f56a26e50149)My 2 cents:

```
>> probe get-refinements /part
[
    load /part "Limit to a length or position" 
    show /part "?" 
    react /part "?" 
    on-face-deep-change* /part "?" 
    parse-trace /part "Limit to a length or position" 
    uppercase /part "Limits to a given length or position" 
    lowercase /part "Limits to a given length or position" 
    parse /part "Limit to a length or position" 
    transcode /part "Translates only part of the input buffer" 
    remove /part {Removes a number of values, or values up to the given series index} 
    copy /part "Limit the length of the result" 
    insert /part "Limit the number of values inserted" 
    find /part "Limit the length of the search" 
    select /part "Limit the length of the search" 
    change /part {Limits the amount to change to a given length or position} 
    append /part "Limit the number of values inserted" 
    move /part "Limit the number of values inserted" 
    reverse /part "Limits to a given length or position" 
    sort /part "Sort only part of a series" 
    take /part "Specifies a length or end position" 
    read /part {Partial read a given number of units (source relative)} 
    write /part "Partial write a given number of units" 
    form /part "Limit the length of the result" 
    mold /part "Limit the length of the result"
]
```

greggirwin

[19:41](#msg61fade4f4164105ab07a44c1)More to come @toomasv ?

[20:01](#msg61fae31841e3293d65d276f4)Or just pointing out the number of places `/part` is used?

pekr

[20:16](#msg61fae6b04164105ab07a586b)For me, redbol was always about the correct abstraction at the certain level. Schemes, ports for stuff like files, crypto, networking, sound, databases, etc. So, please, if we can find some pattern as hiiamboris mentioned, we should adress that with a proper design. Maybe not right ahead, but at least admit, than in the long run the change should happen.

GiuseppeChillemi

[22:17](#msg61fb03143349fe1c71f12165)My 2 cents on construction syntax. Redbol languages have always been human readable ones, so if redbin is not, I would like to have it toghether with construction syntax. This way you can store as text and not as bunch of characters.

greggirwin

[22:34](#msg61fb06f8a41d896a2077b45d)Thanks for the feedback @GiuseppeChillemi and @pekr.

GiuseppeChillemi

[22:37](#msg61fb07b9708e9c3dd75caff6)It is so nice storing blocks with `save` and be able to read everything as text...

## Thursday 3th February, 2022

toomasv

[12:52](#msg61fbcff2a41d896a20793913)@greggirwin \*More to come @toomasv ?*  
Initially I thought that's all, but as you asked, looked further. First thing I tried was `load/part s: "wordstop" find s "stop"` and BOOM! error!: \*"zero? does not allow string! for its value argument"* Looking at `load` source I saw that cases for part should be switched, so that `zero?` is checked only after `string?` is checked. Changed, tried again, and BOOM! next error! \*"transcode/part does not allow string! for its length argument"\*. Checked, indeed, `transcode` allows only `integer!` and `binary!` for `length`. So, \*\*there is no way currently for `load/part` to have `string!` as `length`\*\*. Changed `load`'s code for `part` from

```
if part [
        case [
            zero? length [return make block! 1] 
            string? length [
                if (index? length) = index? source [
                    return make block! 1
                ]
            ]
        ]
    ]
```

into:

```
if part [
        case [
            string? length [
                either (index? length) = index? source [
                    return make block! 1
                ][
                    length: offset? source length
                ]
            ]
            zero? length [return make block! 1] 
        ]
    ]
```

which seems to work.

hiiamboris

[13:00](#msg61fbd1e36e4c1e1c84473a72)and it also doesn't accept binary for /part

[13:02](#msg61fbd25b3349fe1c71f2a133)updated table https://github.com/red/red/issues/4106#issuecomment-546711381

toomasv

[13:03](#msg61fbd284dc191b3d69926d2a):+1:

hiiamboris

[13:05](#msg61fbd31a3349fe1c71f2a33c)why is there `show/part` in your list?

[13:05](#msg61fbd337ced11857f9903fbb)it's a /local in `show`

toomasv

[13:08](#msg61fbd3bd03f2704782182fba)Thanks, must be error in my `get-refinements` func. Will check.

[13:28](#msg61fbd8801fe6ba5a9708dc11)Corrected:

```
[
    load /part "Limit to a length or position" 
    parse-trace /part "Limit to a length or position" 
    uppercase /part "Limits to a given length or position" 
    lowercase /part "Limits to a given length or position" 
    parse /part "Limit to a length or position" 
    transcode /part "Translates only part of the input buffer" 
    remove /part {Removes a number of values, or values up to the given series index} 
    copy /part "Limit the length of the result" 
    insert /part "Limit the number of values inserted" 
    find /part "Limit the length of the search" 
    select /part "Limit the length of the search" 
    change /part {Limits the amount to change to a given length or position} 
    append /part "Limit the number of values inserted" 
    move /part "Limit the number of values inserted" 
    reverse /part "Limits to a given length or position" 
    sort /part "Sort only part of a series" 
    take /part "Specifies a length or end position" 
    read /part {Partial read a given number of units (source relative)} 
    write /part "Partial write a given number of units" 
    form /part "Limit the length of the result" 
    mold /part "Limit the length of the result"
]
```

hiiamboris

[13:34](#msg61fbd9fce4c979478d5c6144):+1:

greggirwin

[19:34](#msg61fc2e3f6e4c1e1c84480d10)Coming from red/chit-chat. Thoughts on `slice`:

On `slice` ... so many thoughts.

\- My old \[R2 bounds+range](https://gist.github.com/greggirwin/20f11d27bfe8a46075a09264a179f7d1) I was going to do a Red port, but missing `for`, thought about `new-for/new-loop`, and got distracted.

@toomasv did a much more advanced version, but I only have it locally. Toomas, did you ever put it in a repo or gist? It's quite complex, so probably more than I'd want to include, but worth looking at.

It doesn't need to be an `op!`, it doesn't need to be new special syntax. If someone wants laziness and infinite generators, that's nice to think about but not worth complicating the simple and common use cases too much.

It lines up a bit with \[step](https://gist.github.com/greggirwin/1f8c1a7f59b4d47cefd9267ae0ccb0af) and a new `loop/repeat` interface. That will be a tough sell, but `for`, as I've learned, is not a good word (we're just used to it, and `foreach` too).

For me, this space is almost like Carl looking for universal path notation, and where that led.

[19:38](#msg61fc2f3241e3293d65d517e7)Thanks for digging @toomasv. I agree that `/part` is ripe for design review, and @hiiamboris' research is the foundation for that. I just don't know where it should fall on the priority list, or when we could get @dockimbel to look at it. I'm far behind on things myself, so can't dive in.

ne1uno

[19:47](#msg61fc316b1fe6ba5a9709a00f)\[!\[toomasv / range.red]( https://gist.github.com/toomasv/0e3244375afbedce89b3719c8be7eac0)]

[19:47](#msg61fc316b51bd8b580c86c34e)range with pair! needs addition of a way to specify what to increment, his lazy range and `thru` op! are on his gist

[19:47](#msg61fc316b3349fe1c71f382b7)related copy/part s1 s2 discussion, https://gitter.im/red/help?at=5df94e83578ecf4b1fbfda35

greggirwin

[19:58](#msg61fc33f53349fe1c71f387f8)Thanks @ne1uno.

[20:00](#msg61fc344251bd8b580c86c82d)Go to https://gist.github.com/toomasv and search for `range`. I missed it by searching for `bounds`. :^\\

pekr

[20:00](#msg61fc345ba41d896a207a16eb)Wasn't range supposed to to have something like `1..9`notation?

gltewalt:matrix.org

[20:04](#msg61fc355c41e3293d65d52518)That's a common notation, but we should remember that charset ranges use -

greggirwin

[20:04](#msg61fc35674164105ab07cff22)Not necessarily @pekr. Did you look at the links? Lots of options to consider.

gltewalt:matrix.org

[20:05](#msg61fc35783349fe1c71f38b8c)I'm for using pair!

greggirwin

[20:06](#msg61fc35b0d41024448044966c)A big issue with `1..9` is that it gets ugly, or impossible, as soon as it's not literal numbers. That is, when your range is based on variables.

[20:06](#msg61fc35c31fe6ba5a9709aada)`Pair!` has the same issue.

gltewalt:matrix.org

[20:08](#msg61fc3625a41d896a207a1a1b)Then \[1 9] is the laziest

hiiamboris

[20:10](#msg61fc36bf51bd8b580c86cd8e)We also have this which IMO is yet another incoherent adhoc design

```
>> copy/part "abcdef" 1x5
== "abcd"
```

ne1uno

[20:11](#msg61fc370d41e3293d65d5280a)range of dates might be in more common use, if they were it easier to construct

greggirwin

[20:17](#msg61fc3846d410244480449e4e)For those who want to suggest syntaxes, I'll ask that you first review the various gists, \[This for-loop REP](https://github.com/red/REP/blob/master/REPs/rep-0101.adoc) and \[Boris' \*each design doc](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/foreach-design.md).

We may not be able to unify them completely, but if we make that a goal, we stand a better chance at consistency and leverage than if we think of them separately.

pekr

[20:26](#msg61fc3a6db8b082448217fbea)I like `for`proposal, except for C-like variant. I hope though, that `foreach`stays? So - why was not it accepted yet? We can see ppl here looking for `for`function and asking why it is not supported.

toomasv

[20:31](#msg61fc3b8e3349fe1c71f39a13)@greggirwin I think you meant \[this](https://gist.github.com/toomasv/097b92820f3e7a9d2bbf97dbd2cb304a#file-range-pre-load-red).

greggirwin

[20:32](#msg61fc3bc46e4c1e1c84482bb2)As I noted (not in the REP, which is old), `for` is not a good name, just familiar. It should be `loop` or `repeat`, but that's a bigger change.

[20:32](#msg61fc3bdb6e4c1e1c84482bbb)@toomasv you have a lot there, so I told them to search. :^)

pekr

[20:37](#msg61fc3d0c1fe6ba5a9709bbf6)As for \*-each proposal, I somehow find it too complicated and can't imagine, what even simple code like `map-each/self/eval [a b c] srs [[a a + c / b c]]`does, without consolting the docs. Good for gurus, probably, but overloaded with refinements ....

hiiamboris

[20:39](#msg61fc3d73b8b08244821802bb)Are `/self` and `/eval` not self explanatory names?

pekr

[20:39](#msg61fc3d79a41d896a207a2b83)@greggirwin so the `for`proposal would replace both loop and repeat?

[20:41](#msg61fc3e03a41d896a207a2c39)Not to average users. There are more refinements ... /case /reverse /drop /only. OK, maybe average user does not need to use them for simple cases.

hiiamboris

[20:42](#msg61fc3e391fe6ba5a9709be01)Average user doesn't have to bother with `map-each` at all. Everything can be done upon `forever` loop ;)

greggirwin

[20:44](#msg61fc3ebed41024448044acaa)@hiiamboris with no object in sight, `/self` is a new concept. What does it apply to? And where most loops that take a body evaluate by default, `/eval` tells me that's not the case for `map-each`. I have to understand (yes, we all have to read docs sometimes) that `/self` is like `/into` and that I have to know a block result is the only thing `/eval` applies to. Our goal is to find a balance between ease of use and power.

[20:49](#msg61fc3fde4164105ab07d1635)@pekr, we \*could* have a single loop construct. The main argument against that will be performance. We also have `while/until`, but don't have `forskip` that Rebol has.

[21:06](#msg61fc43c4708e9c3dd75f398c)It's also about identifying the core pieces, general cases, and what is built on top of those and specialized. e.g. in R2 `forall` is a special case of `forskip`, with a skip size of 1. So the entire body of `forall` is `throw-on-error [forskip :word 1 body]`. But there is a cost. Red's `forall` is ~8x faster than R2's \*if no work is done in the body\*. Do just a small amount of work in the body and that dwarfs the loop overhead.

hiiamboris

[21:08](#msg61fc444903f2704782193962)Well, you can see what happens to those who never read the docs in Redbol ;)  
They struggle for years or drop it.

greggirwin

[21:23](#msg61fc47c0dc191b3d69936ba9)I don't know if that's the case @hiiamboris. Yes, \*we* may think our ways are more elegant, or less work overall, but we all view things differently. In Python, for example, everyone's code looks mostly the same. Is that good or bad? In Red, all bets are off, because it's so flexible. That doesn't mean boring, imperative code is bad, just different. In some cases maybe much better. Our challenge is that we can't be \*just* Haskell or Clojure, used by advanced devs. Nor can we be \*just* VB, COBOL, or PHP.

JS, for all its faults, is dominant in many ways. There are people doing advanced things with it, but the vast majority of users are probably (I don't have stats to hand, if they even exist) writing quite dull, line of business stuff for the web. That daily grind of code may depend heavily on the few advanced users writing deep code, but it has to be exposed in a way that more people can use and understand, without blowing their foot off too often.

You are right that some people my struggle or drop Red over time. But another real possibility is that they will find Red, be intimidated, and never find the joy of what if offers, which they can use on their terms, not ours.

hiiamboris

[21:32](#msg61fc49fcb8b0824482181c84)Let's throw away Parse and see what happens? Clearly it's hundred times more complex.

greggirwin

[21:34](#msg61fc4a746e4c1e1c84484d6e)That's not helpful or constructive @hiiamboris. Take a break and have some tea. :^)

gltewalt:matrix.org

[22:06](#msg61fc520241e3293d65d56149)The gifted can't easily judge whats best for the average user. Unfortunately.

ne1uno

[22:10](#msg61fc52e6a41d896a207a5869)every project depends on fresh eyes to point out the obvious (to them).

## Friday 4th February, 2022

gltewalt

[02:49](#msg61fc942e3349fe1c71f440a6)@GalenIvanov why does python slice have step, and what do py people use it for? How often is it used?

uwbwsvd

[05:49](#msg61fcbe77ced11857f9921737)  
every project depends on fresh eyes to point out the obvious (to them).

My work is MS-Access and VBA (almost 20 years). Learned by my self. No study. No course. No certification. Read a lot. Books, later internet. But Access fit my needs from the first second. I am a "data man". Started with MS-Works, big spreadsheets. Difficult to handle. For me MS-Access was my solution. Because after very short time I knew the goals. If I had had to understand functions, procedures, API calls, Error handling, SQL UNION, Sub SELECTION etc. etc. I wouldn't work with MS-Acess/VBA today. But now I know all these things, because it was necessary to get work done.&gt;

GalenIvanov

[07:53](#msg61fcdb7cd41024448045d3c5)@gltewalt I don't know why does Python slice have step. It's used to extract the elements of a list at offset defined by the step, just like Red's `extract`.

chazu

[13:33](#msg61fd2b29d4102444804678e8)hey all - experienced SWE here starting to learn about red - reading Ivo's book rn. I see above someone had a question about docker - i know docker, not sure how to join other rooms in gitter though

Oldes

[13:54](#msg61fd302f3349fe1c71f560a0)@chazu just follow the rainbow... https://gitter.im/red/chit-chat

planetsizecpu

[14:25](#msg61fd375fb8b082448219d6f7)Welcome btw @chazu 😃

greggirwin

[19:36](#msg61fd805a41e3293d65d7b381)Thanks for the info @uwbwsvd !

[19:37](#msg61fd808c4164105ab07fafe6)Welcome @chazu ! Thanks for any suggestions.

GiuseppeChillemi

[22:46](#msg61fdacc81fe6ba5a970c95da)@uwbwsvd  
&gt; My work is MS-Access and VBA (almost 20 years). Learned by my self. No study. No course. No certification. Read a lot. Books, later internet. But Access fit my needs from the first second. I am a "data man". Started with MS-Works, big spreadsheets. Difficult to handle. For me MS-Access was my solution. Because after very short time I knew the goals. If I had had to understand functions, procedures, API calls, Error handling, SQL UNION, Sub SELECTION etc. etc. I wouldn't work with MS-Acess/VBA today. But now I know all these things, because it was necessary to get work done.

I have a similar background, we work with the same type of data/technologies, apart VBA! The latter is something I wish to learn.

## Sunday 6th February, 2022

greggirwin

[04:27](#msg61ff4e4b6e4c1e1c844e0327)&lt;this entire message should paste and run in a Red console&gt;

`>>: ==:`: none ; console paste prep`; In red/help @Moppy_gitlab asked a question: comment { > How does text meaning different things in different "contexts" create uniquely Red effects? Let's say you have some data: }`  
users: reduce [  
object \[name: "Alice" color: 255.0.0]  
object \[name: "Bob" color: 0.255.0]  
object \[name: "Carol" color: 0.0.255]  
]  
stats: reduce [  
object \[name: "Alice" last-seen: 01-Jan-2022]  
object \[name: "Stall" last-seen: 01-Jan-1970]  
object \[name: "Maxim" high-score: 12'345'678]  
]

```
comment {
And your boss says she wants simple report dumps, rows and fields, she can control. You say "No problem boss. Set up your reports like this, where each row is a list of field names:"
}
```

user-info: [  
\[name color]  
\[name color]  
\[name color]  
\[name color]  
]  
stats-report: [  
\[name last-seen high-score]  
\[name last-seen high-score]  
\[name high-score last-seen]  
\[name last-seen high-score]  
]

```
"This is the reporting engine, but you don't have to understand it boss. I added it as an extension for you in your admin console. I just wanted you see how hard it was."
```

build-list: func \[recs \[block!] rows \[block!]][  
collect [  
foreach row rows [  
if empty? recs \[break]  
keep/only bind row recs/1  
recs: next recs  
]  
]  
]  
show-list: func \[rows \[block!]][  
print \["Showing" mold new-line/all rows on]  
foreach row rows [  
foreach fld row [  
prin \[fld if value? fld \[get fld] tab]  
; Omit empty fields entirely?  
;if value? fld \[prin \[fld tab get fld tab]]  
]  
print ""  
]  
print '----------  
]

```
"Now you can do the following in your console to run the reports."
```

show-list build-list users user-info  
show-list build-list stats stats-report  
`"I can abstract the`build-list\` function out so you don't have to use it, and add paging or repeat counts for rows, but I seem to recall your datasets are already sorted and filtered so you can just see the top 5 or so most important records. Oh yeah, every row can be custom in what fields it contains"

## Tuesday 8th February, 2022

greggirwin

[01:24](#msg6201c6550779373db8d32145)I had no idea my last message would stop all chat dead in its tracks here.

Let's see if I can get it going again, with a simple question. You only need to answer if it's `Yes`, and then you can add notes about how often, how important, use cases, etc. If your answer is `No`, don't respond. It's not a "Do you think it might be useful?" question. I'm specifically and intentionally posing it this way. If the chat stays dead, that tells me what I want to know. Lurkers please also answer if it's in the affirmative. Everybody counts.

Here's the question:

Have you ever used/encountered UUIDs/GUIDs in production code? Not just in Red, but in any language, at any time.

gltewalt:matrix.org

[02:03](#msg6201cf5b41e3293d65dfb42f)Yes. VBA apps using COM

zentrog:matrix.org

[02:10](#msg6201d1123349fe1c71fe2999)Yes, C# all the time with the System.Guid class (always type 4). They are often used as database indexes, and identifiers for disambiguating objects, instead of name or some simpler id

mikeyaunish

[03:16](#msg6201e0734164105ab087e8fc)Yes, currently using in the newest version of Direct Code.

[03:17](#msg6201e0d0ced11857f99bde76)Correction - current development version.

toomasv

[04:27](#msg6201f1493349fe1c71fe615a)Yes, I remember encountering these in database work, but don't remember details any more.

Oldes

[06:22](#msg62020c2c3e52f56a26f30157)Yes.

rebolek

[06:24](#msg62020c98e4c979478d68455b)Yes.

endo64

[06:38](#msg62020ffd0779373db8d3aa1a)I use GUID/UUIDv4 for distributed databases, like half of the data is on MongoDB and the rest is on Postgres, and some data refers the others so auto increment integer IDs are not useful.  
It is also used in replication scenarios in databases to uniquely identify a row, it is replicated or not, again auto-increment integers don't work.

loza:matrix.org

[09:37](#msg620239d3dc191b3d699ecb92)Yes, Exercism uses UUIDs a lot.

hiiamboris

[10:58](#msg62024cbb6e4c1e1c8453c21a)are we considering a new datatype here? ;)

gurzgri

[14:49](#msg620282ecb8b082448223df27)Yes, I have encoutered UUIDs/GUIDs used as filenames for logfiles and in data interchange over FTP.

greggirwin

[16:13](#msg620296a94164105ab0895855)Given our usual sample size, that's a resounding YES. Thanks all!

@hiiamboris &lt;buzzer&gt; I have some other things to address this morning, but will post more about this soon.

ne1uno

[16:14](#msg620296e43e52f56a26f42165)`checksum none 'uuid`

hiiamboris

[16:28](#msg62029a321fe6ba5a9715fab9)`make uuid! #{123e4567e89b12d3a456426614174000}`

[16:31](#msg62029ae0d41024448050e775)how to generate though? `random uuid!`?

greggirwin

[16:31](#msg62029affdc191b3d699f94ea)I have UUID gen code already. v4 is really easy, and most common today.

hiiamboris

[16:35](#msg62029bd341e3293d65e15059)4 random/secure calls should do it, yes, but I'm thinking about the interface

[16:36](#msg62029c196e4c1e1c845468ec)as a scalar it doesn't fit our cell size :(

rebolek

[16:37](#msg62029c65ced11857f99d59a2)Another reason to move to 64bit ;)

gltewalt:matrix.org

[16:39](#msg62029cb03349fe1c71ffb973)Uuid is about exciting as stale bread, though

ne1uno

[16:46](#msg62029e7f41e3293d65e15504)force random/seed?

ldci

[18:23](#msg6202b5283e52f56a26f46369)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/v47O/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/v47O/image.png)

[18:23](#msg6202b5293e52f56a26f4636e)@ldci  
Still playing with Rebol R3 on Apple Silicon M1 processor. Intel 64-bit apps are supported due to Rosetta 2. Really urgent to get a Red 64-bit version:)  
BTW, a comparison between Red, R3 and R2 here: https://github.com/ldci/Red-System/blob/main/doc/comparaisons.xlsx

rebolek

[18:29](#msg6202b66c3349fe1c71fff194)That UI brings back some memories :)

ldci

[20:13](#msg6202ceef3349fe1c71002556)@rebolek Yes but functional :)

cloutiy

[21:18](#msg6202de1b41e3293d65e1e25a)Uuid no. cm m mm px em en...yes

## Wednesday 9th February, 2022

ldci

[12:17](#msg6203b0c6708e9c3dd76d92df)Have a look here: https://www.ephe.psl.eu/actualites/projet-serenite-remettre-le-conducteur-au-centre-du-vehicule-autonome-et-connecte. Red language will be used for developping the digital twin:)

hiiamboris

[12:27](#msg6203b3393e52f56a26f65b7f)what exactly will this digital twin do?

ldci

[12:31](#msg6203b40f1fe6ba5a971828a9)@hiiamboris : assits the driver for basic tasks:)

hiiamboris

[12:32](#msg6203b475a41d896a2088a92d)can you give an example?

ldci

[12:51](#msg6203b8bbdc191b3d69a1d8d7)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/BkBc/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/BkBc/image.png)

[12:52](#msg6203b929dc191b3d69a1d9ba)@hiiamboris : under progress. Just a sample of Petri network to decompose a task. More to come :)

[12:54](#msg6203b9943e52f56a26f6690c)@hiiamboris : the idea iq to show that Red can be used for RT tasks.

## Thursday 10th February, 2022

pekr

[09:58](#msg6204e1cb3e52f56a26f8d427)@GalenIvanov, @hiiamboris I can see some changes being done in terms of an animation dialect, namely exposing it to the VID level, instead of its initialisation in terms of the `on-create`handler. But my question is - why do we chain the keywords? `draw animate [code here]`. Why not to have them separate? More so, if effect will come. I can imagine having it like this `base 100x100 red draw [code here] animate [code here] effect [code here]`. Is there a problem having a separate draw and animation code segments? I would like to see `animate`being a first class citizen in VID :-)

hiiamboris

[10:00](#msg6204e246e4c979478d6e1aaa)&gt; Is there a problem having a separate draw and animation code segments?

How do you envision them working together?

pekr

[10:06](#msg6204e39f0779373db8d980ad)Don't know. Could animation and draw go separately? But that most probably does not make sense. But I can find the need to use `draw animate` incorrect. Then draw block itself should contain an animation block. E.g. you might want to animate only certain elements.

hiiamboris

[10:08](#msg6204e408ced11857f9a1ffeb)`animate` only animates elements that have `from` and `to` defined.

pekr

[10:08](#msg6204e41aced11857f9a20028)Or we would make then mutually exclusive - you either use simple draw, or you use animation at the VID level?

hiiamboris

[10:11](#msg6204e4c2b8b082448228c85b)that might make sense, just more work

pekr

[10:11](#msg6204e4d96e4c1e1c845923fa)... frequent from - to usage, does not make a code a pleasant experience. Maybe we should go back to a "drawing board" and decide:

\* how do we add an effect pipeline?  
\* shouldn't draw use something like frames? (btw - Carl made a prototype, but scrapped it)

[10:13](#msg6204e54f708e9c3dd7700c5f)Some ppl proposed having only `draw`at the VID level, having `text`, `effect` being part of the draw dialect. We already have a `shape`as a subelement there. Could contain `animate` keyword too. Design wise, I can see the system rushed without those deeper questions being asnwered.

[10:15](#msg6204e5d1708e9c3dd7700dd7)Wonder if some guys here remember those discussions ...

hiiamboris

[10:16](#msg6204e5f84164105ab08e0e12)I agree all these deep questions have to be answered first.

[11:51](#msg6204fc31708e9c3dd7703e26)Here's why we should NOT make animation part of Draw itself.

Part of what I want for Spaces is dynamic layouts. Imagine you rotate your android 90 degrees and every UI item starts moving into a new geometry (place + size). Not necessarily linearly but e.g. via rotational movement. Then you may rotate your device back again in the middle of the animation and it will also stop at once and start animating back into original geometry.

That movement can be facilitated by an external mechanism, like `animate`. I designed so UI core would not need to be bloated with these details. All spaces will automatically adapt their display based on size, e.g. turn from text into icons upon reaching some size threshold.

Right now the only thing helpful to me in animation DSL is `tween` func. It's written too inefficiently for me to use it instead of writing my own 3 lines version, but that can be improved. But later I will push for creating a general animation pipeline exposed to the programmer, so I would be able to just explain it what I need animated and how and let it do the rest. Fancy FX should then leverage this pipeline.

My point is I don't want to be locked inside Draw, as it seriously limits the possibilities.

Another consideration is the amount of effort it will take to extend the low-level Draw code versus performance improvements that we might not even need. Besides as far as performance improvements go, we'd better target them with profiling and turning critical parts into routines. 95% of improvement at 5% of effort.

GalenIvanov

[14:36](#msg620522eedc191b3d69a4ca5a)Thanks for your comments @pekr and @hiiamboris. I'm not so experienced programmer and that's visible in my code and design choices I've made. All that you say means that I have much yet to learn.

&gt; I can imagine having it like this base 100x100 red draw \[code here] animate \[code here] effect \[code here]. Is there a problem having a separate draw and animation code segments?

Right now one can only use set-words in draw before the commands and not before the parameters. How we will reference the parameters needed to be animated? In `animate` I keep track of the target draw command and the offset of the parameter in the draw block (something like translate5/2) and feed them to `tween` function. If `animate` is separated from `draw`, now you need to count the words by yourself. (but maybe I'm too deeply preoccupied with my approach).

hiiamboris

[14:42](#msg620524633349fe1c7104f336)Any block at any index is already a reference, isn't it enough?

[14:45](#msg62052511dc191b3d69a4cf2f)

```
>> b: [a 1 2x3]
== [a 1 2x3]
>> ref: at b 2
>> ref/1: 2
>> b
== [a 2 2x3]
```

GalenIvanov

[14:47](#msg6205257541e3293d65e699b9)Of course it is :smile:

pekr

[14:52](#msg620526a76e4c1e1c8459ae09)@GalenIvanov You are 1000x more experienced programmer, than I will ever be, so don't worry - this is not a criticism, I just try to ask about concepts, bigger picture, as I am a long time reboller and remember some historical attempts etc. As for a `draw`, there is some discussion with Henrik about how it could be possibly improved on the low level - dunno where it was - some PR, REP, or so.

GalenIvanov

[15:24](#msg62052e2341e3293d65e6af6f):+1:

greggirwin

[19:24](#msg62056685ced11857f9a31e16)&gt; Design wise, I can see the system rushed without those deeper questions being answered.

This is why we want to get `animate` out for wider comment. It's an exploratory piece that I asked @GalenIvanov to pursue for that reason.

We know from experience that even a deeply talented creator like Carl, given infinite time, will produce imperfect designs. What I hope we can do with Red going forward, is find a balance where 1) A working foundation is laid enough for comment. 2) We revise that based on actual use and input from more than just a single designer. 3) The time comes to lock down a design, no matter how much we want to keep tweaking it, and it becomes "stable".

This is a tough sell, because both some of the team and some users want things frozen and perfect upon release. Others feel we need to build momentum and be willing to make mistakes and fix them, because we can't predict the future and stagnation means death.

[19:27](#msg6205671e1fe6ba5a971bb94c)There is always going to be a dynamic tension between these groups, and we'll each fall in a different camp at different times. That process is as hard as the technical work.

## Friday 11st February, 2022

justinthesmith

[00:16](#msg6205aac5708e9c3dd771bf3e)Yes, I encounter GUIDs almost every day as well. Mobile advertising identifiers like Apple's IDFA and IDFV are some examples, and we use them in our internal databases for user identifiers.

greggirwin

[00:16](#msg6205aae4a41d896a208cd045)Thanks @justinthesmith!

justinthesmith

[00:18](#msg6205ab6ea41d896a208cd0ec)Will be glad to see Red handle GUIDs/UUIDs!

[00:19](#msg6205ab8441e3293d65e7cb6b)Been doing a lot of graph database stuff lately, so I'm going to have to take a deeper look at the proposed Node! datatype.

ldci

[15:25](#msg62067ff851bd8b580c9b2605)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/NdBH/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/NdBH/image.png)

[15:26](#msg6206800adc191b3d69a7b838)While I'm waiting for a 64-bit Red, I'm still playing with Rebol 3 which can talk with Pashua to create nice graphical interfaces and all in 64-bit :)

[15:26](#msg6206801fb8b08244822c31f0)Of course only on macOS

greggirwin

[16:47](#msg6206932f0779373db8dd22d2):+1:

## Saturday 12nd February, 2022

pekr

[07:39](#msg6207643441e3293d65eb501e)Why was the PR re XML-codec reverted?

rebolek

[08:04](#msg62076a0141e3293d65eb5a9b)It’s not going to the main repo but will be part of Red/Code.

pekr

[08:24](#msg62076eb71fe6ba5a971fdf29)Do you really mean it? Why bother with JSON, CSV then? Ppl don't need them, no? Maybe even a jpeg codec is not needed by default, because - who would like to use images in your terminal scripts?

rebolek

[08:42](#msg620772ffdc191b3d69a9a8d1)¯\\\\\\\_(ツ)\\\_/¯

pekr

[09:07](#msg620778e0d4102444805af9a0)Well, then I am mostly the Rebol/Command guy, so hopefully there are going to be various packages of functionalities available, or we will push users to build that themselves. When you will ask yourself a rhetoric question about most used interfacings, at least for me, based on a daily corporate usage with over tens of partners, to:

\* Reading http(s) and parsing info  
\* JSON  
\* CSV (Excel output in general)  
\* XML (as a base of SOAP / webservices)  
\* Direct database access (ODBC is fine)

So for me, we have excluded maybe one of the three most being used element for interfacing. The question is why? I have noticed, that Doc was kind of versed upon the aproach taken, but I am bit disappointed it ended like this.

hiiamboris

[09:34](#msg62077f18ced11857f9a767a2)I agree with @pekr 100%. This is getting weird :)

pekr

[09:48](#msg620782703349fe1c7109d90f)Well, there's a Red Team to make design choices. The general answer might be, that Red is open source and I am free to do whatever I like with the code (of course not breaking a license terms). What we should understand though, is, that we can see some newcomers here, who look for a solutions. Even a simple push to compile some modules themselves, might mean some level of stopping a show for them or at least being an unnecessary obstacle.

ldci

[18:10](#msg6207f8324164105ab094736a)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/NsA2/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/NsA2/image.png)

[18:11](#msg6207f866a41d896a20917448)A simple but efficient binding to Pasha: https://github.com/ldci/Pashua

[18:13](#msg6207f8c41fe6ba5a9720ecd1)Pashua, sorry

gurzgri

[18:20](#msg6207fa55d4102444805bef12)Looks great and looks like even a VID solution wouldn't be way shorter then the examples source code, impressive!

greggirwin

[18:22](#msg6207faeaced11857f9a85b4e)Very nice @ldci. I've built a number of systems that worked on similar principles, so there wasn't a monolithic exe, but a bunch of cooperating processes, some of which were basically just dialogs. e.g. customer editor.

ldci

[18:24](#msg6207fb453349fe1c710ac5d1)@gurzgri @greggirwin Thanks, but it’s a solution while waiting for a 64-bit Red :)

## Sunday 13th February, 2022

luce80

[08:18](#msg6208becd708e9c3dd777e1a9)@GalenIvanov about set-words in draw see #4661 . @hiiamboris about set-words in draw do you really suggest dropping out all Red power and using numbers to reference single draw block elements (even if "aliased" and dereferenced using ad-hoc created words) ?

GalenIvanov

[08:26](#msg6208c0be1fe6ba5a97226854)@luce80 Thanks for the link! set-words still work only between commands and not between parameters.

hiiamboris

[08:36](#msg6208c3013e52f56a2600bc9f)@luce80 I don't see any win in this approach. Just an overhead of new words creation, risk of getting over words limit and global context pollution. What am I missing?

luce80

[08:42](#msg6208c4670779373db8e154d9)@hiiamboris not all user will pollute the global context with thousands of words just those who wish to more easily address a few elements of their draw (or animate) block. I am not an expert here so I ask do strings or something else that is not a word create a tremendous overhead or pollute the global context?

hiiamboris

[08:48](#msg6208c5f0d4102444805d6f15)I see. No I'm not saying user provided set words should not be supported. I'm saying internal mechanics of animation dialect should not spawn them in big numbers, and use simple references instead, else it's design abuse.

greggirwin

[18:44](#msg6209519f41e3293d65eef240)It's a fine line between leverage and abuse. :^)

ldci

[18:50](#msg620952fb51bd8b580ca0b49a)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/tqOi/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/tqOi/image.png)

[18:51](#msg620953360779373db8e264f1)Another way to generate interfaces for Rebol 3 and Red: https://github.com/ldci/CocoaDialog

greggirwin

[19:50](#msg620960fab8b082448231ddf2)Here's an idea. Write a generic Red app that does what these tools do. It can just expose VID directly for the GUI aspects, and then just needs I/O piped. But it could even use straight files for that. Obviously it's use is limited to where Red GUI support is strong.

Anyone want to tackle that for fun?

Oldes

[21:20](#msg62097622ced11857f9ab2c4f)It's not much fun, when you cannot run Red on the current macOS versions :-/

greggirwin

[22:56](#msg62098cb0ced11857f9ab5943)Of course. What percentage of all macs in use are on the current version?

zentrog:matrix.org

[23:02](#msg62098dfca41d896a20948154)Looks like a bit over 80%

https://gs.statcounter.com/os-version-market-share/macos/desktop/worldwide

https://www.statista.com/statistics/944559/worldwide-macos-version-market-share/

greggirwin

[23:10](#msg62098fd83e52f56a26024b07)Wowza! I wouldn't have guess that much, but it is mac people. I suppose old hardware that doesn't support it just gets retired. I know that's what I had to do with an old mac mini.

[23:10](#msg62098fe7e4c979478d7769e6)Thanks for looking that up @dander.

## Monday 14th February, 2022

rebolek

[07:03](#msg6209feacd4102444805fcc90)@greggirwin Don't forget that Mojave, the first 64bit-only version was released in 2018, 4 years ago. That version supports HW from 2012, so 10 years old HW.

ldci

[07:38](#msg620a07066e4c1e1c84636db6)@rebolek Mojave is the last macOS version that supports 32-bit code, including Red. However xCode in 64-bit only.

rebolek

[08:26](#msg620a1237ced11857f9ac52f6)@ldci right, Catalina is the first 64bit only version. Sorry for the confusion.

ldci

[10:11](#msg620a2ad5dc191b3d69aee873)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/XMoI/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/XMoI/image.png)

[10:14](#msg620a2b8dd4102444806025bc)Based on Ashley Truter’s old R2 code (http://www.rebol.org/view-script.r?script=mac-requestors.r), you can get a lot of macOS native requestors for Rebol 3 . I’ve added some new funcctions such as request-file.

[10:17](#msg620a2c50e4c979478d789cfb)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/c0yS/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/c0yS/image.png)

planetsizecpu

[16:40](#msg620a8600ced11857f9ad44b9)Superb @ldci good job!

ldci

[17:42](#msg620a9479e4c979478d7978de)@planetsizecpu Thanks:)

greggirwin

[18:10](#msg620a9b1a1fe6ba5a972618c9)Back to my initial idea of doing this in Red, the thought being that for Windows and Linux, it \*might* be useful to some people (how do you add a GUI to non-GUI apps?) but would also be a nice demonstration of Red's power in this area.

[18:17](#msg620a9cbb3349fe1c710fe580)@ldci where are the best docs for those projects? cocoaDialog.com didn't respond for me, and Pashua's are in DocBook form. :^\\

ldci

[19:08](#msg620aa8983e52f56a26048584)@greggirwin : You’ll find on Github :)

greggirwin

[19:23](#msg620aac29708e9c3dd77baf18)I did try that, but came up lacking.

[19:23](#msg620aac414164105ab099bbd2)I can see your examples, of course, but was interesting in their reference docs.

ldci

[19:31](#msg620aae04b8b08244823478d8)@greggirwin, for Pashua: https://www.bluem.net/pashua-docs-latest.html

[19:32](#msg620aae47708e9c3dd77bb2f5)@greggirwin and cocooaDialog: https://shawnrice.github.io/bundler-docs/wrappers/cocoadialog-reference.html

[19:36](#msg620aaf39d4102444806154bf)@greggirwin, and for osascript: https://ss64.com/osx/osascript.html

greggirwin

[19:48](#msg620ab20241e3293d65f1ac2b)Thanks!

ldci

[20:01](#msg620ab515a41d896a2096e8bb)@greggirwin We’re welcome:)

[21:12](#msg620ac5d20779373db8e56290)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/Xa7Z/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/Xa7Z/image.png)

[21:13](#msg620ac608ced11857f9addf43)With Red on Intel 32-bit macOS. Under progress :)

[22:47](#msg620adc12d41024448061b6c6)Done for Red :)

greggirwin

[22:47](#msg620adc1f6e4c1e1c84653b62):+1:

ldci

[22:48](#msg620adc3f3349fe1c71107773)I’ll update a new repo tomorrow :)

## Tuesday 15th February, 2022

ldci

[09:36](#msg620b7417b8b0824482360dfd)osascript for Rebol and Red is here: https://github.com/ldci/Osascript.

hiiamboris

[11:43](#msg620b91dfd4102444806324fe)bot?

BuilderGuy1

[20:58](#msg620c13f91fe6ba5a9729219d)I "think" I found a bug (feb 9th RED on MacOS)

[20:58](#msg620c1409e4c979478d7c9ef9)

```
>> mycsv: load-csv/as-records mydata
*** Script Error: append does not allow map! for its series argument
*** Where: append
*** Near : value char
*** Stack: load-csv
```

[20:59](#msg620c1439e4c979478d7c9f38)I had just used /flat /header /as-columns successfully.

[21:10](#msg620c16d7e4c979478d7ca4ab)I had "read" in my csv file into "mydata" successfully too

hiiamboris

[21:15](#msg620c17d40779373db8e80ae9)well, prepare a minimal data snippet to reproduce this and create an \[issue](https://github.com/red/red/issues/new?template=bug\_report.md)

BuilderGuy1

[21:17](#msg620c187e4164105ab09caad9)ok. I'll do that up a little later today :-)

hiiamboris

[21:35](#msg620c1c8cdc191b3d69b2fe50):+1:

greggirwin

[22:47](#msg620c2d730779373db8e83891)`value char` occurs only once in the code, which helps. It's inside the `quoted-value` rule. I can't dupe it with simple mock data here, so the data is the key. Thanks @BuilderGuy1.

## Wednesday 16th February, 2022

BuilderGuy1

[04:19](#msg620c7b5641e3293d65f55093)Issue submitted with data file #5075

## Thursday 17th February, 2022

hiiamboris

[17:49](#msg620e8aa1b8b08244823c8490)Anyone on W7 having problems starting GUI console in recent builds?

ne1uno

[17:51](#msg620e8b1f708e9c3dd783a08b)I tested animation dsl build W7, seemed ok

pekr

[18:12](#msg620e901bb8b08244823c8daa)Just don't try running Windows executable under Linux. Will not start 🙂

ne1uno

[18:16](#msg620e90eaa41d896a209ef58c)anyone tried win11?

hiiamboris

[18:23](#msg620e9284dc191b3d69b807f7)@ne1uno your is 64 bit?

ne1uno

[18:23](#msg620e92ad4164105ab0a1d0c6)yea. I've never seen 32bit home

[18:24](#msg620e92e3dc191b3d69b808fd)looks like some code page chars in path too

hiiamboris

[18:26](#msg620e934c3349fe1c71182c33)yeah, tried just in case - works with unicode chars for me

ne1uno

[18:27](#msg620e937b1fe6ba5a972e6a8f)fresh build seems ok

hiiamboris

[18:27](#msg620e938a708e9c3dd783b4ea)thanks

ne1uno

[18:33](#msg620e950641e3293d65f9cddf)could be dx2? may need that update

hiiamboris

[18:36](#msg620e95a351bd8b580cab693c)what update?

ne1uno

[18:39](#msg620e967a1fe6ba5a972e733f)https://github.com/red/red/discussions/4764

[18:39](#msg620e967a41e3293d65f9d1ee)Platform Update for Windows 7 is required. https://www.microsoft.com/en-us/download/details.aspx?id=36805

[18:40](#msg620e96a003f27047823ddc86)`DxDiag Version: 6.01.7601.17514 64bit Unicode DirectX 11`

hiiamboris

[18:42](#msg620e972cd410244480697b9d):+1:

## Saturday 19th February, 2022

pekr

[07:16](#msg6210994af43b6d783fc36fa6)@greggirwin There is a #5080 bug related to reactivity. I was just wondering, why a PR, which was supposed to make reactivity cca 10 times faster and more robust, was never accepted? https://github.com/red/red/pull/4529

## Sunday 20th February, 2022

greggirwin

[05:13](#msg6211cdfc8db2b95f0a2f01dc)@pekr it just hasn't been accepted \*yet\*, which I know is a problem for a lot of long-standing PRs. We do try to keep processing them, and prioritizing.

ldci

[09:39](#msg62120c46c435002500b591fd)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/hXz1/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/hXz1/image.png)

[09:45](#msg62120dca0909252318eb1340)Still testing. Today some test with Apple Swift langague : sone clear similarities with Red and Rebol. Fur the fun this code does not require Xcode, but a simple text editor. The code can be compiled as in Red. SwiftUI is less complicated that Objective-c UIKit. Based on Qingtian’s macOS backend, we could create an IOS or macOS backend with swift communication.

## Tuesday 22nd February, 2022

ldci

[18:38](#msg62152d8b3ae95a1ec168eee4)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/s7RU/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/s7RU/image.png)

[18:39](#msg62152dee161ffc40d7827504)Red code vs. swift code

```
#!/usr/local/bin/red
Red  [
]
App: layout [
	below
	text "Hello, Red!" center
	pad 15x0
	button "Print" [print "Hello Red Language!"]
	button "Quit"  [quit]
]
view App
```

[18:40](#msg62152e09257a357825f8ee70)

```
#!/usr/bin/swift
import SwiftUI
struct App: SwiftUI.App {
	var body: some Scene {
  		WindowGroup {
      		VStack {
      			Text("Hello, Red!")
				Button("Print") {print("Hello Red language!")}
				Button("Quit") {exit(0)}
      		}
    		.padding()
    	}
      	.windowStyle(.automatic)
  	}
}
App.main()
```

[18:41](#msg62152e680909252318f18039)For the same result :)

rebolek

[18:43](#msg62152ebc99d94f5f0c1b4dae)That Swift code is actually not that bad.

ldci

[18:46](#msg62152f880909252318f18279)@rebolek Without Xcode for better comparaison :)

rebolek

[18:46](#msg62152f94f43b6d783fcc8152)Ah, OK :)

ldci

[18:48](#msg62152fe0c435002500bbe9ff)BTW: this Swift code is 64bit :)

## Thursday 24th February, 2022

GiuseppeChillemi

[19:24](#msg6217db6cddcba117a2f2f525)reminder: https://progress.red-lang.org/ has stopped at november

greggirwin

[20:56](#msg6217f1099bd1c71eca749970)Thanks @GiuseppeChillemi.

GiuseppeChillemi

[21:42](#msg6217fbb0d1b64840db3a5f38)You are welcome. I have forgotten to write the date because I have been called but the message has arrived.

## Tuesday 1st March, 2022

greggirwin

[17:34](#msg621e593f9bd1c71eca80e560)Coming from red/bugs on error handling in codecs.

@rebolek do you think codecs should work differently, as far as errors, based on whether they're standard or not? I don't have an answer myself, since I haven't thought what all might be done as a codec. That's why I suggest making a plan and documenting it.

Today you can use `/as` on a PNG file, but spec `jpeg` or `bmp` and not get an error? You can also chop data out of a PNG and it still doesn't error. You get back an image with bad data. Is that because of PNG's format, or the decoder's choice?

Structured data \*may* be a different story, but also depends on the use case. HTML can be viewed as strictly correct, but we all know browsers are very forgiving of errors. In CSV, one record being malformed doesn't affect others. In JSON or XML, one bad element/record/object/value in a serial list of thousands isn't as important as when that element is a top level structure. If we do streaming codecs, users can propagate errors how they want, but there is still the issue of what error system they counter during the loading process.

Personally, I don't know right now if it's best to be completely consistent, or if it's better to tailor the approach to the type and context. I'll guess that there's no single answer, or it would have been agreed upon by now. Just design choices.

rebolek

[17:53](#msg621e5d83161ffc40d7949a2d)@greggirwin  
&gt; do you think codecs should work differently, as far as errors

no, I think they should work the same, that's why I think they shouldn't throw `user error` but a different one.

&gt; You get back an image with bad data.

IMO you should get an error. It's easy to test for valid PNG.

&gt; Structured data may be a different story.

Expecting strictly correct HTML is naive. Browsers are rather forgiving because the net is full of incorrect HTMLs. It's easier to expect correct JSONs and XMLs as they're usually generated by a machine. CSV---you can't expect much from CSV.

hiiamboris

[20:11](#msg621e7deed1b64840db46eb13)&gt; @greggirwin  
&gt; &gt; do you think codecs should work differently, as far as errors  
&gt;  
&gt; no, I think they should work the same, that's why I think they shouldn't throw `user error` but a different one.

Yeah, they should be `IO` errors or something. `access` maybe but that's a bit off

[20:15](#msg621e7ee7161ffc40d794dcd0)

```
invalid-utf8    block!        length: 2  ["invalid UTF-8 encoding:" :arg1]
  bad-media       block!        length: 1  ["bad media data (corrupt image, sound, video)"]
```

these are totally not "access" errors in the catalog

[20:17](#msg621e7f4999d94f5f0c2db9ec)We need a fully custom error in each category.

zentrog:matrix.org

[22:53](#msg621ea3f90909252318042670)What does `user` mean for that type? Is user the source of the error, or it should be surfaced to the user? Is user the developer writing the app? What about a `module` or `codec` error type?

## Wednesday 2nd March, 2022

gltewalt:matrix.org

[00:56](#msg621ec0d89a09ab24f3841d45)I assume 'use is because a human made the error with make

[00:57](#msg621ec0e53ae95a1ec17bb985)'user

ldci

[03:48](#msg621ee9133ae95a1ec17c0150)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/9Pny/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/9Pny/image.png)

[03:51](#msg621ee9d8f43b6d783fdfca8e)Some tests with Swift 5.6 under macOS. A little bit more complicated than Red, but with very intresting UI ideas.

```
#!/usr/bin/swift
import SwiftUI

struct ContentView: View {
    let languages = ["Rebol", "Red", "Swift"]
    let names = ["Carl Sassenrath", "Nenad Rakocevic", "Chris Lattner"]
    @State var selectedLanguage = 0
    
    var body: some View {
        VStack(spacing: 20) {
        	Text("Languages")
            Picker("", selection: $selectedLanguage) {
                ForEach(0..<languages.count) {
                    Text(self.languages[$0])
                } 
            }
            
			Label ("\(names[selectedLanguage])", systemImage: "person")
			.border(Color.red)
			.font(.largeTitle)
			.imageScale(.large)
			
			Button("Quit") {exit(0)}
        }
        .padding(10)
        .frame(width: 300, height: 180)
        .navigationTitle("Picker Control")
    }
}

struct PickerControlApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

PickerControlApp.main()
```

Oldes

[06:42](#msg621f11e2090925231804f8cd)I wonder what exactly is \_very interesting_ on it?

rebolek

[06:49](#msg621f13749a09ab24f384c387)@zentrog:matrix.org  
&gt; What does user mean for that type?

It’s "user code" - not a standard error, but an error created by user. And because codecs are now part of main distro, their errors shouldn’t be user error, IMO.

ldci

[07:52](#msg621f222d3ae95a1ec17c732f)@Oldes : What's interesting is the variety of options for setting the visual interface objects. By the way, I will be happy when Red will allow to write this kind of application in less than 40 lines of code :)

[07:52](#msg621f223b3ae95a1ec17c733b)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/deIf/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/deIf/image.png)

hiiamboris

[11:29](#msg621f5515257a3578250d25b1)that's 5 labels, drop-list, 2 buttons and 1 image - 9 lines of VID code

pekr

[11:30](#msg621f554f0466b352a4fc1757)The code is effective, but ugly. How many LOCs do you expect with the VID based equivalent? Or is your remark mostly about VID missing some styles?

hiiamboris

[11:33](#msg621f561f161ffc40d7967b25)I suppose lacks webview :)

pekr

[11:40](#msg621f57b18db2b95f0a4a0123)And 64 bit support, we know. I try to compare concepts. But, I can agree that using Swift might be more comfortable than barebones Win32 API.

Oldes

[15:34](#msg621f8e9ff43b6d783fe11348)@hiiamboris it looks more like a 1 weview and 1 button.

ldci

[17:22](#msg621fa7dd161ffc40d79724b8)Hello guys. This the code I wrote with Swift

```
#!/usr/bin/swift
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: String
    func makeNSView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let webview = WKWebView()
        let request = URLRequest(url: url)
        webview.load(request)
        return webview
    }
    func updateNSView(_ nsView: WKWebView, context: Context) { }
}

struct ContentView: View {
    var body: some View {
        	WebView(url: "https://www.apple.com")
            .padding()
            .frame(width: 480, height: 600)
            .navigationTitle("www.apple.com")
            Button("Quit") {exit(0)}
    }    
}

struct WebViewLoadUrlApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

WebViewLoadUrlApp.main()
```

djrondon

[21:58](#msg621fe89199d94f5f0c30a949)I could make Red run on BigSur and Monterrey using Wineskin Winery

[21:59](#msg621fe8b7d1b64840db49c866)there are some problems with the network functions such as 'read/binary url

[21:59](#msg621fe8c4d1b64840db49c882)but everything works well

greggirwin

[22:00](#msg621fe906c435002500d1662f)Good to note on the related wiki pages as an option, but also not easy for average users who just want to run apps. Still good info @djrondon, thanks. :+1:

djrondon

[22:17](#msg621fed05161ffc40d797b2cc)&gt; Good to note on the related wiki pages as an option, but also not easy for average users who just want to run apps. Still good info @djrondon, thanks. :+1:

Yes. Just install it and create an installation for Red. https://github.com/Gcenx/WineskinServer

## Thursday 3th March, 2022

mikeyaunish

[04:09](#msg62203f6e257a3578250f04db)@ldci Thought I'd try a red version of your Swift UI.

```
Language: text "Languages" 100x25 center font-size 14
return
language-drop-list: drop-list 100x25 select 1 data ["Rebol" "Red" "Swift"]
return
text-list1: text-list 100x52 data ["Carl Sassenrath" "Nenad Rakocevic" "Chris Lattner"] 
return 
space 10x4
b1: button "Quit"
```

Although there seems to be a small rendering error on the version of  
Red I am running.

ldci

[07:57](#msg622074d8f43b6d783fe2d931)@djrondon Could you explain how to create an installation for Red? Thanks

[10:54](#msg62209e72e9cb3c52aefa0a3f)@mikeyaunish

```
Red[
]
names: ["Carl Sassenrath" "Nenad Rakocevic" "Chris Lattner"]
languages: ["Rebol" "Red" "Swift"]
win: layout[
	title "Picker"
	Language: text "Languages" 300x25 center font-size 14
	return
	pad 100x0 language-drop-list: drop-list 100x25 data languages
	select 1 
	on-change[name/text: names/(face/selected)]
	return
	name: H2 "Carl Sassenrath" 300 center
	return 
	pad 120x4
	button "Quit" [Quit]
]
view win
```

mikeyaunish

[17:03](#msg6220f4c8d1b64840db4bd5d2)@ldci - Yes I see what you were trying to do there. I know zero about Swift so wasn't sure what was happening. It looks like it is below 40 lines of code. But more importantly (as I start to do some comparisons with other languages) is the "cognitive load" that the language puts on the programmer.

ldci

[17:31](#msg6220fb65c435002500d38ae6)@mikeyaunish Yes you’re right Swift is rather complicated, less than Objective-C, but still complex.

Oldes

[18:43](#msg62210c45257a35782510a70e)My experience is, that Objective-C is a nightmare. Swift is a little bit better indeed.

dsunanda

[18:52](#msg62210e6e161ffc40d79a03ec)@ldci Minor tweak to your code to avoid typing Carl Sassenrath twice .... Change these two lines:

```
win: layout compose [
        name: H2 (names/1) 300 center
```

Technically, I think the code is now 1 character longer - but quicker to amend if Carl changes his name :)

ldci

[21:52](#msg622138b26b91242320187d54)@dsunanda Definitive code

```
Red[
	Needs: 'View
]
names: 		["Carl Sassenrath" "Nenad Rakocevic" "Chris Lattner"]
languages: 	["Rebol" "Red" "Swift"]
win: layout compose [
	title "Picker"
	text "Languages" 300x25 center font-size 14
	return
	pad 100x0 drop-list 100x25 data languages select 1 
	on-change[name/text: names/(face/selected)]
	return
	name: H2 (names/1) 300 center
	return 
	pad 120x4
	button "Quit" [Quit]
]
view win
```

[21:54](#msg62213929f43b6d783fe4774b)Most elegant than Swift. I do appreciate Red :)

Oldes

[23:11](#msg62214b180466b352a4002682)Red doesn't have \[`bellow`](http://rebol.com/docs/view-guide.html#section-25) keyword?

dsunanda

[23:15](#msg62214c18e9cb3c52aefb78ce)'below - one L :)

## Friday 4th March, 2022

ldci

[08:05](#msg6221c8438db2b95f0a4ef64b)@Oldes @dsunanda : Yes with below keyword we can suppress return keywords

```
Red[
	Needs: 'View
]
names: ["Carl Sassenrath" "Nenad Rakocevic" "Chris Lattner"]
languages: ["Rebol" "Red" "Swift"]
win: layout compose [
	title "Picker"
	below
	text "Languages" 300x25 center font-size 14
	pad 100x0 drop-list 100x25 data languages select 1 
	on-change[name/text: names/(face/selected)]
	pad -100x0 name: H2 (names/1) 300 center
	pad 120x4
	button "Quit" [Quit]
]
view win
```

Oldes

[08:36](#msg6221cf86161ffc40d79b7cff)Now just to remove the ugly manual padding and it will be ok ;-)

toomasv

[09:13](#msg6221d85709092523180a8af9)

```
win: layout compose [
    title "Picker"
    below center
    text "Languages" center font-size 14
    drop-list data languages select 1 
        on-change [name/text: names/(face/selected)]
    name: H2 300 (names/1) center
    button "Quit" [quit]
]
```

hiiamboris

[09:19](#msg6221d998c61ef0178e587c3a)And use react ideally ;)

Oldes

[09:21](#msg6221d9fc99d94f5f0c34801e)If there is any inspiration from the Swift code, than we should consider, if it would not be better to use \_refinements_ for the options... like `text "..." /center /size 14`

toomasv

[09:22](#msg6221da5a161ffc40d79b94e3)^ Or without `compose`, but `name: H2 300 center with [text: names/1]`

[09:31](#msg6221dc88ddcba117a206760d)@hiiamboris You mean this?

```
win: layout [
    title "Picker"
    below center
    text "Languages" center font-size 14
    drop: drop-list data languages select 1 
    H2 300 center react [face/text: names/(drop/selected)]
    button "Quit" [quit]
]
```

Oldes

[09:40](#msg6221de9df43b6d783fe5b594)Is the `select 1` needed? Should not it be by default?

toomasv

[09:43](#msg6221df40d1b64840db4da7ed)By default, `selected` is `none`.

ldci

[09:52](#msg6221e174c435002500d54bf7)@toomasv : Very elegant with react :)

toomasv

[10:07](#msg6221e4cb8db2b95f0a4f3733)Indeed :)

hiiamboris

[10:40](#msg6221ec9899d94f5f0c34a82d)&gt; @hiiamboris You mean this?

Yes, thanks ;)

gltewalt:matrix.org

[11:54](#msg6221fde509092523180ad2a8)`bellow` inserts a nerve-wracking sound clip

BuilderGuy1

[17:13](#msg622248cb09092523180b7985) Evolving the code like this makes an AWESOME mini tutorial !! It really illustrates the features and philosophy of RED.

## Saturday 5th March, 2022

GiuseppeChillemi

[19:34](#msg6223bb533ae95a1ec1859b97)@Oldes using refinements is having an alternate words rapresentation for convenience. I have thought about having this "side domain" when creating parse dialects to avoid lowering the namespace of each wordlike datatype. I like the idea but I would prefer having another wordlike type to use in such situation to avoid conflicts that could arise composing and joining. Actually red does not support objects and paths in VID dialect but later it could amd composing and joining could become a nightmare.

mikeyaunish

[20:38](#msg6223ca4f161ffc40d79f4ce2)Since my last little code sample seemed to generate some interesting discussions, here I go again. I've run into this true/false/none scenario before. Can't help but think there is a better way than this.

```
check "Yes" 105x36 true tri-state 
    on-change [
        selection: either (face/data = none) [ 'none ][ (to-lit-word face/data)]
        face/text: select [ 'true "Yes" 'false "No" 'none "Undecided" ] selection
    ]
```

ldci

[20:39](#msg6223ca73257a357825160572)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/5SVA/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/5SVA/image.png)

[20:39](#msg6223ca7f99d94f5f0c384345)Red is really fantastic. I succeed in extracting faces and landmarks form thermal images (300 loc)

[20:39](#msg6223ca8b8db2b95f0a52de82)and this one

[20:40](#msg6223caa79a09ab24f38dfd99)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/0q9q/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/0q9q/image.png)

[20:40](#msg6223caced1b64840db515d45)Of course I use redCV :)

hiiamboris

[20:54](#msg6223cdfe09092523180e5766)@mikeyaunish `on-change [face/text: select ["Yes" "No" "Undecided" "Yes"] face/text]`?

[20:55](#msg6223ce5df43b6d783fe96aed)assumes toggling though, no programmatic changes

dsunanda

[21:08](#msg6223d14ee9cb3c52ae005a3d)@mikeyaunish Slightly less code for (I think) the same result:

```
check "Yes" 105x36 true tri-state 
       on-change [
	      e/text: select reduce [true "Yes" false "No" none "Undecided"] face/data
         ]
```

greggirwin

[21:18](#msg6223d38f9bd1c71eca8ba591)Really great @ldci!

mikeyaunish

[21:19](#msg6223d3ff99d94f5f0c3853e5)@dsunanda That was what I had in mind to do. Didn't have the reduce in there to have `none` select properly . @hiiamboris - I love the circular thinking. Thanks for the great ideas.

ldci

[21:28](#msg6223d5e9c435002500d90ab3)@greggirwin Thanks, but it was difficult. I use redCV for face segmentation and then dLib C++ for finding face and extratcting 68 landmarks. However this demonstrates the fabulous capacities of Red for specificit applications. Thanks for improving Red :)

## Sunday 6th March, 2022

GiuseppeChillemi

[16:23](#msg6224e0023ae95a1ec1878de3)Red is near the 14.000 commits milestone:

[16:23](#msg6224e006e9cb3c52ae02353e)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/VXhT/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/VXhT/image.png)

## Monday 7th March, 2022

planetsizecpu

[08:12](#msg6225be81d1b64840db54ded3)Last automatic build don't work for me on w10 with no AV active:

```
PS C:\redlang> .\red
Compiling compression library...
Compiling Red GUI console...
*** Compilation Error: missing argument
*** in file: %/C/ProgramData/Red/GUI/gui-console.red
*** in function: exec/f_ctx||272~on-change*
*** at line: 1
*** near: [true
    #script %/C/ProgramData/Red/GUI/gui-console.red
]
```

ne1uno

[10:11](#msg6225da3e6b91242320211b8c)@planetsizecpu https://www.red-lang.org/p/download.html shows all builds pass tests. I got same error here win10 nothing still running in memory. directories excluded in AV

[10:13](#msg6225dae5e9cb3c52ae041906)&gt;#script %/C/ProgramData/Red/GUI/gui-console.red

[10:13](#msg6225dae59bd1c71eca8f4237)doesn't like something in the config file but why at compile time?

chasecrum:matrix.org

[17:02](#msg62263ab2c61ef0178e60c576)Sorry to interrupt again guys - Any idea where I can find a link for the source (as opposed to the binaries) for RED?

ne1uno

[17:04](#msg62263b30c435002500dd832b)@chasecrum:matrix.org https://github.com/red/red/

chasecrum:matrix.org

[17:05](#msg62263b41e9cb3c52ae04eb8c)hey thanks!

ldci

[17:06](#msg62263ba199d94f5f0c3cd4bf)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/Y2L5/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/Y2L5/image.png)

greggirwin

[17:33](#msg622641d58db2b95f0a576bf2)@planetsizecpu, seems to be a regression from a change yesterday, per @dockimbel.

planetsizecpu

[18:07](#msg622649e80466b352a4099df6)NP @greggirwin Im used to save some old downloads for these occasions 😉

## Tuesday 8th March, 2022

planetsizecpu

[07:29](#msg622705e5090925231814628e)@greggirwin I added comment to#5092 for @dockimbel as he does not show here btw 🙄

[07:33](#msg622706d86b91242320237270)Wow @ldci really amazing!

pekr

[09:16](#msg62271ef09bd1c71eca91b2df)Hi guys. My English is not a top notch and sometimes there are some words, which sound strange to me, but maybe other find them quite ok. One of those words is `wrote`, when I look into an IO branch. I think I know what it means - basically, that something has been written already. My question is - is there a separate `write` action? And if not, could not it be changed and interpreted like - the write action just happened?

rebolek

[09:27](#msg622721940466b352a40b3d8e)`wrote` event happens after you write something to the port

pekr

[09:37](#msg622723e6c435002500df3a44)It does not matter imo and that is the point of my post :-) I can imagine it is just a "write event, which happens after the data hes been written" :-) But I am not storng on that point, just dislike the word. It is probably still better than using `before-write`, `after-write`

ne1uno

[09:40](#msg62272497257a3578251c4c3a)written

pekr

[09:47](#msg6227261e8db2b95f0a5912a3)`written`came to my mind too, but ppl might object, that it is 2 letters longer :-) Most probably, english wise `wrote` is correct, but I would still prefer `written`

[09:48](#msg622726620466b352a40b46f0)The thing is, that it came with the R3 async, so here Red just took it over. My overal impression though is, that async IO is still quite new even to old time rebollers ....

djrondon

[12:40](#msg62274ea4ddcba117a210d48d)Hi Folks, where are the system/schemes/http or system/schemes/https in Red ? I'd like to define some HTTP headers

gltewalt:matrix.org

[13:15](#msg622756fec61ef0178e62f95b)If used directly after the noun, then wrote is OK.  
port wrote

pekr

[13:43](#msg62275d8be9cb3c52ae07204f)Shouldn't `connect`be `connected` then?

rebolek

[13:44](#msg62275dba0909252318151330)@djrondon this will come with the new IO branch. However, it’s possible to set HTTP headers when using `write/info`:

```
write/info http://example.com [POST [header:  "value"] "data"]
```

or use my `send-request` function that takes care of a lot of this stuff.

djrondon

[13:48](#msg62275e913ae95a1ec18c64ce)thanks @rebolek . I was looking at your http-tools.red ;-)

rebolek

[13:49](#msg62275ef89bd1c71eca923dab)@djrondon here’s the latest version https://gitlab.com/rebolek/castr/

[13:50](#msg62275f3b161ffc40d7a62d8b)let me know if you have any questions, I am currently updating some functions there and it’s possible there may be something broken because of that.

djrondon

[13:51](#msg62275f48090925231815161a)if I'm gonna use read/binary someurl\[POST \[header: "value"] "data"], Can I use this ?

[13:53](#msg62275fe6c61ef0178e630e4a)I saw the curl.red now, is that an option too to convert curl requests? I was using call/shell, call/output

rebolek

[13:58](#msg622760ef09092523181518e0)`curl.red` isn’t wrapper for `curl`, it takes curl string and translates it into Red data for `send-request`. I use it when converting APIs to Red. I probably should choose a better name for it :)

[13:58](#msg62276106257a3578251cc62d)when I need to use `curl`, I use `call/output` also.

[13:59](#msg62276129c435002500dfb848)&gt; if I'm gonna use read/binary someurl\[POST \[header: "value"] "data"], Can I use this ?

if you use this, you don’t need my http tools.

djrondon

[14:02](#msg622761feddcba117a210fcfe)@rebolek I'm gonna try yours. I'm scraping Amazon.com with scraper API, there are some pitfalls there.

rebolek

[14:06](#msg62276301161ffc40d7a6347f)ok. let me know if you have any questions. I’ll post an update for it in a few minutes

[14:12](#msg622764588db2b95f0a599108)updated, it should work fine now

djrondon

[14:19](#msg622765ec99d94f5f0c3f1ab9)Ok. My friend.. Thank you very much

pekr

[14:19](#msg622765fdf43b6d783ff02249)@rebolek there will be no write/info with the IO branch?

rebolek

[14:22](#msg6227668f9a09ab24f394cddd)Why? I don’t think it would go away.

gltewalt:matrix.org

[15:00](#msg62276f98d1b64840db58442e)connected if it's post action, ya

greggirwin

[22:59](#msg6227dfc80909252318161be3)@pekr, a difference between `wrote` and `written` is that the former is active, while the latter is passive. Active voice is preferred...rather, I prefer active voice. :^) `before-write` and `after-write` are good declarative names, e.g. for defining callbacks or hooks.

## Thursday 10th March, 2022

m\_a\_j\_ch\_rz\_a\_k\_twitter

[14:57](#msg622a11e36b91242320297611)Hello there. How it is going with the 64bit version and ports? :)

pekr

[15:14](#msg622a15ea09092523181a72e9)And how does it allign with event types like : `accept`, `close`, `connect`? I think, I will make a wish ticket for `wrote`being changed to just simple `write` anyway, we will see :-)

[15:15](#msg622a161a161ffc40d7ab7923)@m\_a\_j\_ch\_rz\_a\_k\_twitter Ports are being worked on in terms of the IO branch. There can be seen some activity in last two months. Just not sure when it is going to be merged ....

m\_a\_j\_ch\_rz\_a\_k\_twitter

[15:18](#msg622a16b799d94f5f0c44902d)I see. How about 64bit version?

pekr

[15:28](#msg622a190c257a3578252236ab)Not sure, that's the question for the Red Team to answer. If there are any related activities related to this topic, those are not public.

greggirwin

[18:35](#msg622a450fd1b64840db5ddd22)&gt; I think, I will make a wish ticket for `wrote` being changed to just simple `write` anyway

:+1: Good to have it noted in any case, for review with Nenad.

@m\_a\_j\_ch\_rz\_a\_k\_twitter there has been a lot of design work done on 64-bit, and some experiments as well, but it's not the top item on our priority list at the moment.

ldci

[22:28](#msg622a7b88f43b6d783ff659a8)@greggirwin 64-bit is really important for macOS users:)

m\_a\_j\_ch\_rz\_a\_k\_twitter

[22:48](#msg622a8035161ffc40d7ac5928)true :D

rebolek

[22:57](#msg622a82430466b352a412098b)Absolutely.

greggirwin

[23:16](#msg622a86c399d94f5f0c457994)We do understand that, but Mac users are a small percentage, and we don't have research to support it from a business standpoint. If it were easy, we'd do it as quickly as possible, but it's not. It's a huge task, and is going to be critical for all platforms in the next 2-3 years. We are prioritizing accordingly.

rebolek

[23:28](#msg622a89b899d94f5f0c457efb)I guess with 64bit version the number of Mac users would be higher ;)

greggirwin

[23:50](#msg622a8ee2f43b6d783ff67e4f)Yes. @dander posted stats that 80% of mac users are on the latest OS.

## Friday 11st March, 2022

pekr

[05:39](#msg622ae0ad257a35782523c238)It's definitely NOT about the number of mac users only. Imagine about the need to release multiplatform apps. In last two years we were in need of a mobile app for e.g. Even if Red Android would be released back then, we could not use it, as we needed iOS too. Hence we went with the Flutter :-(

[05:42](#msg622ae13dddcba117a217d9ab)Nowadays, working as a head of IT for a big corporation, the HW choice is less tight - especially some members of management have Macs. We can't release an app not supporting both platforms. Hence we need to do a web apps. It's not a complaint, just providing a different perspective to those percentages.

[05:46](#msg622ae2180466b352a412ba06)As the cause is lost for for my team, my wish of priorities is - finish the IO, merge the CLI as an add-on, decide if XML codec should not be there by default, get rid of the Red.exe - provide Red-GUI download instead ... go towards the 64 bit and pray, that MS does not cut 32 bit support anytime soon too :-)

dsunanda

[14:11](#msg622b58848db2b95f0a614e1d)  
It's definitely NOT about the number of mac users only

True...We're seeing a similar thing (at least where I am) wth vegan food.

Even just five years ago fast-ish food having a vegan option was unheard of - after all, there were way too few wanting it to make it worth while.

But now there's been a phase change - most places have a choice of vegan options. The math now is that a significant number of parties of three or more diners include at least one vegan; attracting those parties is suddenly essential business practice.

And, as you say Petr, even the smallest group we deploy software to is likely to contain a Mac user.&gt;

zentrog:matrix.org

[17:37](#msg622b88ec257a35782525221a)Yeah, I think it's more complicated. It's probably necessary to look at individual market areas. For instance, Go seems really popular in the area of cloud services, and I think Red could compete well with it. Both offer small self-contained native executables, but Red would be a higher-level option. But if you look at developers working on that stuff, even though it's close to 100% Linux as the target, I wouldn't be surprised if 50% of those developers are working on a Mac. I don't know if the ability to run natively vs in a container would be a deal breaker or not, but it's an interesting question. There are probably other things like tooling that are also blockers for that demographic. I just wanted to give another example.

rebolek

[18:45](#msg622b98b43ae95a1ec194baad)@zentrog:matrix.org I agree, a lot of devs I know are working on mac/Linux and targeting Linux (as a server platform). On the question of container vs native: this is a complicated question. A lot of people are now running everything in a container, so 32bit shouldn't be a problem theoretically, however, there would need to be first-class support for such a container. Which Red doesn't have.

CodingFiend\_twitter

[18:58](#msg622b9bdb99d94f5f0c479766)There are a lot of Mac-based developers. The Mac dev platform offers the following advantages:

1\) the OS is much less troublesome from a tech support point of view. People have fewer problems. One typically doesn't wrestle with driver updates on the mac, and it is simpler esp. for non technical staffers  
2\) if you develop on the mac, you can use VMware Fusion, and run a sub-window with Linux, and a subwindow for Windows, all with drag and drop / file sharing. Way more convenient than running multiple machines with a KVM. You cannot run a Mac inside a windows machine (legally), nor can you run Mac inside Linux. So the Mac is the only dev platform that lets you test all 3 desktop realms in one box.

Macs are also cheap; i use a Mac Mini, and it allows you to have your favorite keyboard, mouse, and display. Yes their laptops are horribly expensive and difficult to repair. But the Mac Mini is a winner for stationary developers like me who can't live without a 32 inch monitor and an ergonomic keyboard.

## Saturday 12nd March, 2022

m\_a\_j\_ch\_rz\_a\_k\_twitter

[09:53](#msg622c6db48db2b95f0a633ed4)To be honest (I have been an IT consultant in Germany, Switzerland, Denmark, Poland) most of the modern IT teams were 100% mac-based. The speed of M1 is incredible. 9hours on a battery, no fans, speed which you can compare with i7/i9. For the IT managers, it is a safe choice...one standard, one system. So you can develop on mac and then use Dockers to host the software wherever you want. Personally, I hate it...but I can see the Apple impact. They have designed and created a perfect tool for developers.

pekr

[10:03](#msg622c700ee9cb3c52ae10e4c0)I don' find anything lacking with the Win 10 or 11. IT guys using Macs are mostly about being a hipster, rebel, different to the mainstream, whatever 🙂

hiiamboris

[10:11](#msg622c71db99d94f5f0c4910d7)In some regions Mac \*is* mainstream.

m\_a\_j\_ch\_rz\_a\_k\_twitter

[10:31](#msg622c769299d94f5f0c491954)@pekr yes, maybe 10 years ago. Most of the western world is using Macs. I see Linux/Win as the tools of the old generation. But now is the question...how we would like to shape Red? Be modern, on the edge, or be part of the "older" world. If the second one then I would die sooner than it would be finished. To be honest, as someone involved in the "crypto" thing (for the last 4) years I don't know anyone with Windows :D But maybe this is my bias.

[10:36](#msg622c77938db2b95f0a634e86)We should also define the mainstream. My mom is using Windows...but she is not our persona. She would never use Red. In my opinion, Mac is mainstream in the IT world.

[10:42](#msg622c792a0466b352a415a6b7)The next question, what would bring more people to Red? Another feature? Or having the possibility to run Red on modern devices? In my opinion, the ratio between the first one and the second one is like 1:50. Damn...guys, having the possibility to write GUI apps on mac in Red would be a $$$$ choice.

ldci

[11:06](#msg622c7eabf43b6d783ffa1942)@m\_a\_j\_ch\_rz\_a\_k\_twitter +1

pekr

[11:09](#msg622c7f51161ffc40d7b009ab)By Mac you mean iOS or macOS? Still two different things, aren't they?

planetsizecpu

[11:36](#msg622c85c9257a35782526d728)In my country the main stream is w10/w11, linux later and MacOs is very marginal. In my work we have 115 w10 users vs 4 macs and one linux, but they already know that we just don't support linux/mac, it's company policy. I must note they are researchers, not developers.

cloutiy

[17:38](#msg622cdaa18db2b95f0a64076c)What would bring more ppl to red woukd be more blogs, videos, screencasts...etc...in my opinion.

m\_a\_j\_ch\_rz\_a\_k\_twitter

[19:30](#msg622cf4e29bd1c71eca9cfcb2)@cloutiy sure ...but how I can blog about Red if I can not run it on my 64 bit Macs :D

[19:34](#msg622cf5b79bd1c71eca9cfe02)as a typical user If I have to install 32-bit libs on Linux then I would try something else instead of Red

[19:35](#msg622cf6029a09ab24f39f69d4)@pekr I mean macOS ...but each developer which is developing on IOS have Mac :) You can not escape this even with Flutter.

Respectech

[21:36](#msg622d126199d94f5f0c4a396a)Here in California, our IT team is (like most IT teams in California) running on mostly Windows. We have a mix of Windows servers and Linux servers in our office, and there are three people here who run Linux as their main systems (including me). We do have a Mac specialist, but even he hates Macs because they are impossible to repair and Apple dictates how they are used and how long they will last.

If wanting a computer that I am free to use however I wish makes me part of the older generation, then so be it. I feel sorry for the younger generation who are making themselves subservient to a corporation that is mostly interested in squeezing as much money out of users as they can.

hiiamboris

[21:37](#msg622d129ee9cb3c52ae120d3a):100:

Respectech

[21:37](#msg622d12a38db2b95f0a646b3b)By the way, we are only 2 hours away from Silicon Valley, so we are pretty close to the tech hubs. Stating that "most of the Western World uses Macs" is simply not correct.

[21:41](#msg622d139addcba117a21be619)According to this chart, OSX has been holding steady at around 16% worldwide for the past year. Windows is between 73-76%, and Linux is between 2-3% (not counting ChromeOS which is also basically Linux): https://gs.statcounter.com/os-market-share/desktop/worldwide/

greggirwin

[23:57](#msg622d33853ae95a1ec197859c)We appreciate the input, but none of this is news to us. When we talk about market share and how Red may be used, what \*developers* use is only one piece. What do they deploy on? What do businesses run on? Even that is only one piece, right? Because there is business use, and there is direct consumer use. That's changed a lot, and now "Applications" need to be "apps". Those need to run on different OSs than developers use. So it's a similar problem to developing on Mac and deploying on Linux, or developing on Linux and deploying on Android. And then there's Windows.

So who should we target? If our goal is sustainability (and it is), what gives us the best ROI? Adoption doesn't help unless it also brings revenue. We have to grow by magnitudes upon magnitudes to be mainstream and considered an option against established languages. And if you think that more people mean more contributors, I'm afraid that's wishful thinking. We'll get some, sure, but we'll also get that many more tickets if Red isn't solid on any given platform, because we've spread ourselves too thin.

Why don't we have Android or IOS devs clamoring for Red? Is it because you can't actually develop on thost platforms? Yes, I know some tools try, but how limited are they? Does that mean people don't want a better way to build IOS and Android apps, of course not.

Back to Mac. If we have full GUI support, will people use it, and can they sell desktop mac apps in a way that helps Red? Or do they use XCode and Swift today, so we need to target IOS as well to be a viable option? Perhaps they're using their Mac as a Shiny Unix (not an insult), and deploying to Linux. And why \*hasn't* Linux won? It has, of course, but not on the desktop. It won on servers because it's "free". Not entirely, but that definitely played a big part.

@m\_a\_j\_ch\_rz\_a\_k\_twitter, in your work, is the Mac stuff all used in house? What do most project typically deploy against?

The key question, as always, is: what gives us the best chance of becoming sustainable?

## Sunday 13th March, 2022

pekr

[06:04](#msg622d8976c435002500eb68af)I just wonder why a migty Mac can't provide a 32 bit layer or at least emulation? 32 bit on Win64 was never a problem.

greggirwin

[06:23](#msg622d8dcc99d94f5f0c4b06db)It's not a technical problem, it's a business decision.

ldci

[09:17](#msg622db6bbe9cb3c52ae131b73)@greggirwin : You’re right for buisness decision. For macOS users, have a look here: https://mac.getutm.app . Very efficient :)

Oldes

[10:57](#msg622dce1f8db2b95f0a65a37e)I think that they left 32bit to simlify things.. now when they must count also with arm macs

[11:05](#msg622dcfddd1b64840db6457e0)And as a mainly Windows user I must say that the arm powered macs are really good devices.

gltewalt:matrix.org

[15:26](#msg622e0d3ff43b6d783ffccab1)Why hasn't it won on desktop? Appearance, and advertising.

hiiamboris

[15:49](#msg622e1285ddcba117a21d9700)no, because it's an expensive locked-down hardware platform  
plus, software is not customizable too, and OS and hardware is unfit for gaming

gltewalt:matrix.org

[16:00](#msg622e1510c61ef0178e6fa83f)linux?

hiiamboris

[16:01](#msg622e154f161ffc40d7b2d013)linux may yet win, as open source doesn't just die by an economic fluke

[16:02](#msg622e159e99d94f5f0c4bf746)also mac embodied fear of all thinking world, because freedom of internet and of software was based on freedom of hardware  
close the hardware and you control the rest of it, leading humanity towards a dystopia of global surveillance and one-click detachment from processes involving technology

greggirwin

[16:53](#msg622e2199c435002500ec771f)&gt; Why hasn't it won on desktop? Appearance, and advertising.

1\) Ease of use 2) Ease of use 3) Marketing.

By "Ease of use" I don't mean how a GUI works, but how easy it is, overall, to get a system up and running, maintain it, install programs, etc. The next evolution of this was phones, where you don't have a choice about anything, apps are limited in their functionality (back to no dev capabilities), and people trust that if it's on an app store they can install it, it will run, and not mess up anything else on their phone.

There will always be some people who want to customize, tinker, and understand their "machines", but most people just want them to work. Analogize it with cars. It used to be that you \*had to* know certain things, or it benefitted you more, to maintain it. Now you really can't maintain a modern car without expensive and specialized equipment. No longer just a spark plug wrench, gapping tool, and a few things to change the oil. But that's OK because you have quick change oil places on every corner. Those places, and dealers, understand that oil changes are bait for more services, even if they themselves are expensive.

hiiamboris

[17:01](#msg622e234e257a35782529a5c5)iphone is easy to use and preferred by blondes, while google dominates the market because everyone can make the hardware, just as was the case with PCs

gltewalt:matrix.org

[21:42](#msg622e653f161ffc40d7b36002)I dont know, Gregg, windows has always been kind of cantankerous. It's just that when average people started buying PCs, windows is what was on it, and it looked decent

## Wednesday 16th March, 2022

GiuseppeChillemi

[21:35](#msg623258193ae95a1ec1a1507e)@greggirwin As ODBC is here and also other data related projects, we need a space to talk about them. Could a red/database area be created in Gitter?

## Friday 18th March, 2022

greggirwin

[21:52](#msg6234ff108db2b95f0a73a941)https://gitter.im/red/database created. I thought we had a room for it already, but I guess not.

## Tuesday 22nd March, 2022

mikeyaunish

[21:54](#msg623a457e161ffc40d7ca38bb)After looking up some simple ouTube tutorials about how to make a temperature converter program in various languages, I thought about creating something in Red (using Direct Code) just to see how we compare at this point. The various other languages ranged in size from 10 minutes to 50 minutes in length. (Java, Python, SwiftUI). \[My Red GUI App](https://www.youtube.com/watch?v=G\_qY2jqVFAc) clocks in at 3:30. I can't help but think it might be time to poke the bear and start doing some benchmark comparisons to let people know where Red stands in relation to other languages. It feels like we may finally be back to the simplicity and fun that I felt when firing up Basic on my PC Jr. back in the day.

greggirwin

[22:55](#msg623a53d89a09ab24f3b8c550)If you want to do videos of some others, the \[7 GUIs](https://eugenkiss.github.io/7guis/tasks/) project already has some Red implementations. No "See it happen" videos though, which would be cool.

[23:12](#msg623a57efc43500250003e643)@rgchris et al, has anyone done OAuth2 in Red?

[23:13](#msg623a5806c43500250003e652)I know Chris' old stuff has OAuth, but I think it's v1.

## Wednesday 23th March, 2022

pekr

[10:03](#msg623af08dc61ef0178e885078)oAuth2 would be handy. O365 backend (and I can bet many other systems) are using it, if I am not mistaken. Would be willing to spend some money on a bounty for that :-)

greggirwin

[15:38](#msg623b3ee0e9cb3c52ae2d4450)Yes. It's kind of a mess, as a design, IIRC, but required for a lot of things.

rebolek:matrix.org

[18:16](#msg623b64076b912423204a77ec)It's not that bad. I've implemented it quite fast.

GiuseppeChillemi

[21:19](#msg623b8ed7e9cb3c52ae2de9fe)@mikeyaunish 2 years ago I was a total rookie in Redbol Now, 2 weeks ago I have started to code a program that modifies a label .PRN (Print) file used as a base and sends it to an industrial batch/due data printer. It has an internal product database, query, auto list-view resizing, manual and automatic mode, on-screen keyboard, batch number calculation via Rebol Expression... I have just completed it. Took a bout 6 nights 3 hour per night, 18 hours total.

[21:19](#msg623b8eea9a09ab24f3bb3044)Redbol languages are great

[21:19](#msg623b8efdd1b64840db7ec447)Here is my program:

[21:20](#msg623b8f300466b352a4320e6e)\[!\[Scadenze1.jpg](https://files.gitter.im/5565a1d415522ed4b3e10094/PqhN/thumb/Scadenze1.jpg)](https://files.gitter.im/5565a1d415522ed4b3e10094/PqhN/Scadenze1.jpg)

[21:21](#msg623b8f4b8db2b95f0a802f79)In a WINDOS 10 tablet connected to the thermal image printer (on the back)

greggirwin

[21:23](#msg623b8fe76b912423204ad07f)That's great @GiuseppeChillemi ! Congratulations.

GiuseppeChillemi

[21:25](#msg623b90520466b352a43210c4)@greggirwin Thank you, I have another couple of pictures:

[21:25](#msg623b90606b912423204ad164)\[!\[IMG\_20220323\_145429.jpg](https://files.gitter.im/5565a1d415522ed4b3e10094/7tBN/thumb/IMG\_20220323\_145429.jpg)](https://files.gitter.im/5565a1d415522ed4b3e10094/7tBN/IMG\_20220323\_145429.jpg)

[21:26](#msg623b906b9bd1c71ecab8d26a)\[!\[Producs.jpg](https://files.gitter.im/5565a1d415522ed4b3e10094/yq83/thumb/Producs.jpg)](https://files.gitter.im/5565a1d415522ed4b3e10094/yq83/Producs.jpg)

[21:27](#msg623b90b66b912423204ad242)I am waiting for the Red data-grid/table component to port my panels to Red.

[21:30](#msg623b916c9bd1c71ecab8d4a4)...and the ANDROID version to use a cheaper and more modern tablet with the capability to take screenshots and use image BARCODE reading via API.  
Red could be used on lower-end hardware.

[21:31](#msg623b919a09092523183bd0df)This could open a door to cheap solution for companies that need interactive panels in production line.

Respectech

[22:26](#msg623b9e8f161ffc40d7ccdfc4)Great job, @GiuseppeChillemi !

GiuseppeChillemi

[22:34](#msg623ba06f3ae95a1ec1b30bbf)@Respectech Thank you.

[22:42](#msg623ba26e9bd1c71ecab8f57d)The first picture is the printer in my pruduction line. I work in an environment where I am creating what Atronix has already made on very large scale. This is the reason why I have written my message on chit-chat. I see a great future and market disappearing with Atronix leaving our world, as they can enter literally in every company in this world. The core of my work life is represented 100% from their solution and.. they are gone 😔

mikeyaunish

[22:58](#msg623ba60009092523183bf780)@GiuseppeChillemi That is fabulous. Nice to see production level code in the wilds.

## Thursday 24th March, 2022

ldci

[08:07](#msg623c26c6e9cb3c52ae2f0be5)@GiuseppeChillemi Congratulations:)

planetsizecpu

[08:55](#msg623c320309092523183cf7b5)Good job @GiuseppeChillemi, how is the printer performing?

Years ago I worked with Intermec printers, had twelve machines, they were easy to program with their own IPL dialect and performed really well &amp; fast, but the thermal heads wore out after two years of intensive use, so the ROI was never good because they where half the cost of the printer.

GiuseppeChillemi

[11:17](#msg623c534e257a35782545087c)@planetsizecpu The printer is a Tank. It is on production machine from 10+ years. Last year we have faced a major problem and replaced some boards. In the next days we will replace the headings which cost about 1/20 of the original price of this old printer. As we currently don't have enough money to spend for a new one (about 11.000 USD). I have spent my nights upgrading it in the old fun way.

[11:19](#msg623c53d03ae95a1ec1b45992)Now I need to monitor high temperatures, pressures and power consumption but I don't know where to start with the right industrial level components. I need a mentor or a consultant with experience (or Atronix :) )

rebolek

[13:41](#msg623c7505e9cb3c52ae2fa9f5)@greggirwin I’ve been playing with OAuth2 today, I rewrote it to use Red webserver instead of a third-party one and it works OK. There are still some problems to be solved, the biggest being that I’m currently not able to open a new Red instance from Red due to some bug and also I need to make the OAuth flow universal. Current code is written to work with Spotify, so I’m looking at how to make it universal and easy to use with other services.

rgchris

[14:07](#msg623c7b35c43500250008133d)General requests should be universal, the auth flow may not be.

rebolek

[15:24](#msg623c8d1c8db2b95f0a820c45)yes, the flow is the thing that I want to optimize somehow

Respectech

[16:38](#msg623c9e6ff43b6d783f18e11d)@GiuseppeChillemi  
\- Temperatures: https://ameridroid.com/products/shelly-temperature-add-on-sensor-controller \[Measures Temperatures from -55°C to +125°C (-67°F to +257°F)]

\- Power Consumption: https://ameridroid.com/products/shelly-em-120a-50a-wifi-operated-energy-meter-and-contactor-control

\- Pressures: I don't have any recommendations

greggirwin

[17:33](#msg623cab7fc435002500087d2e)Thanks @rebolek!

GiuseppeChillemi

[18:16](#msg623cb57ce9cb3c52ae302ef6)@Respectech Thanks but I need three-phase 150KW measurement and 5/15KW three-phase ones.

ldci

[19:45](#msg623cca65ddcba117a239cfa0)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/TSM4/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/TSM4/image.png)

[19:46](#msg623cca7f257a35782545fc27)Rebol View on mac silicon :)

greggirwin

[19:50](#msg623ccb7fddcba117a239d247):+1: Via what 32-bit support system?

ldci

[19:55](#msg623ccccd09092523183e3c91)@greggirwin Wineskin Winery

mikeyaunish

[21:25](#msg623ce1e3c61ef0178e8c2c2d)Whenever I compile a program then run the executable a black DOS like window pops up first, then my program. Is there a way to get rid of this preliminary black window?

ldci

[21:29](#msg623ce29d09092523183e6374)@mikeyaunish red -t windows your program

## Friday 25th March, 2022

rgchris

[00:19](#msg623d0a8b9bd1c71ecabbb11a)&gt; yes, the flow is the thing that I want to optimize somehow

That will be a challenge—there are only a handful of different auth flows but even then the options for different services are handled in different ways.

The other part that is helpful for auth flow is a lightweight HTTPD service—for me that was a motivation for my HTTPD scheme (for R2/R3) and how I'd suggest anyone handle it now\*. Although you can do OOB with some services or use an HTTP/HTML client (😬)

\*also a good reason for delineating basic HTTPD from file-based WebServers

Respectech

[00:20](#msg623d0ab0257a35782546720d)@GiuseppeChillemi Like this one? https://ameridroid.com/products/shelly-3em-wifi-operated-3-phase-energy-meter-and-contactor-control

GiuseppeChillemi

[09:17](#msg623d888e9a09ab24f3befdaa)@Respectech Yes, good one. My only fear is the wifi problem I have had with my shelly temperature monitors but it is worth a try. Also, I have already made the interface with the Shelly API

## Sunday 27th March, 2022

GiuseppeChillemi

[22:34](#msg6240e66fddcba117a2414b59)It would be great to have a way to express the arguments of a function as object when using a special syntax:

```
myfunc: func [a b c /local d] []

myfunc 1 2 3  ;as usual

!myfunc make object!  [a: 1 b: 2 c: 3]; ! instructs Red to accept an object 

;Or even/also

!myfunc [a: 1 b: 2 c: 3]
```

`!` or any other suitable character / syntax

[22:40](#msg6240e7c1d1b64840db88a0b5)This would add a lot of f readability and also will let you work with single arguments that are easier to use in certain situations.

hiiamboris

[22:45](#msg6240e90ac435002500101ebc)Join the fight for `apply` func inclusion, @GiuseppeChillemi :)  
I'm losing it all the time  
https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/new-apply.red

GiuseppeChillemi

[22:55](#msg6240eb638db2b95f0a89fe2f)Here I am my friend, where should I APPLY for enrollment?

[23:02](#msg6240ecfc9a09ab24f3c520c8)(and why are they refusing it?)

## Monday 28th March, 2022

Dobeash

[04:54](#msg62413f76f43b6d783f214bfe)Object arguments. This is already supported, no?

```
>> myfunc: func [obj [object!]] [print obj/text]
== func [obj [object!]][print obj/text]
>> myfunc make object! [text: "Hello World!"]
Hello World!
```

GiuseppeChillemi

[07:44](#msg6241676599d94f5f0c708f3b)@Dobeash Yes but I have requested something different: if a function has N arguments, I would like to a have SWITCH to pass these arguments inside an object. So, the same function could accept either N arguments or them in one object, just changing the syntax.

[07:46](#msg624167ed99d94f5f0c709041)However, it is nice to have you here. We have just created a red/databases group and there is also an ODBC red in case it is of your interest.

hiiamboris

[08:42](#msg624174ed0466b352a43cd93f)@GiuseppeChillemi no idea why it always gets pushed back 😅 but you can probably write something supportive in #4854 ticket.

## Thursday 7th April, 2022

laturk

[05:05](#msg624e712bc43500250029f532)Does anyone here have REBOL View 2 running on Archlinux? If yes, please tell me how to do the same.

[05:11](#msg624e72883ae95a1ec1d697c3)I once had it working, but after an update a few months ago it quit working.

[05:12](#msg624e72b5ddcba117a25b31f2)Now I get: \** User Error: Bad face in screen pane!  
\** Near: size-text self

[05:51](#msg624e7be49bd1c71ecadc7e17)The xfonts package for Archlinux seems to have been removed. At least I can't find it.

[14:57](#msg624efbc56b912423206fa935)OK, I just learned that xfonts is called xorg-fonts-75dpi and xorg-fonts-100dpi. And they are installed. So, something else must be causing the problem. Is there any way to debug?

[18:35](#msg624f2ef8e9cb3c52ae533d54)Are there any differences between rebol 2 view code and red view code?

greggirwin

[20:27](#msg624f49389bd1c71ecade1d18)Yes. We aim for a high degree of compatibility, and VID is largely the same dialect, but because Red uses native widgets (for now), there are many differences in how things work and what styles are available.

## Friday 8th April, 2022

laturk

[02:44](#msg624fa181d1b64840dba4eb8f)I wrote a double-entry fund accounting package using Rebol View 2. Is there anyone willing and able to convert this package to RED if I make the source code available?

gltewalt:matrix.org

[02:52](#msg624fa3740466b352a4581a4e)For BTC, yes

[04:09](#msg624fb588d1b64840dba50d2b)I think community members would convert it.

greggirwin

[05:09](#msg624fc38699d94f5f0c8c2017)If someone from the community doesn't step up, you can contract Redlake to do it. We know all the best people. :^)

GiuseppeChillemi

[23:06](#msg6250bfe3c4350025002e8833)@laturk will you make it open source?

## Saturday 9th April, 2022

laturk

[16:59](#msg6251bb78161ffc40d7f6b759)@GiuseppeChillemi Yes, I'll make it open source. All I ask is that any modules/features added to it be made available to me free of charge. Also, I want data file encryption to be a choice (not mandatory). Can I make it open source with those two restrictions?

[17:00](#msg6251bbbee9cb3c52ae5827e7)Of course, I want the red code to be open source also.

GiuseppeChillemi

[17:15](#msg6251bf25161ffc40d7f6becf)Yes, you can. There are 2 choices: #1 you go all GPL and no one could close the source, #2 otherwise use a MIT with the clause that any module or derivative work will be available to you at no charge.

[17:17](#msg6251bf9cd1b64840dba8ec73)Someone alse with more knowledge than me on this topic could give you better help.

laturk

[17:19](#msg6251c02e99d94f5f0c8fec70)Should I put the source code on github?

GiuseppeChillemi

[23:09](#msg6252121709092523186672a2)Github or Gitlab, the first is more famous.

[23:09](#msg62521225c61ef0178eb46f0a)But you should do it after choosing a license.

[23:16](#msg625213b19bd1c71ecae35dba)If you want to publish it right now, I suggest using AGPL3.0. It will protect your right as a coder, prohibiting any software reuse without sharing with everyone and you, even additional modules code. You may later change it for another one more "free" like MIT but keeping the right on additional modules. The opposite is not possible: published code keeps the freedom you have already given and you can't remove it from anyone who is using that released code (as far I know).

## Sunday 10th April, 2022

pimgeek

[21:49](#msg625350ee6b9124232077c8f5)Is it possible to Compile red-lang on Apple M1 Computers? 😊

## Monday 11st April, 2022

rebolek

[05:12](#msg6253b8cb9a09ab24f3e8c5d6)Not yet :(

## Friday 15th April, 2022

pimgeek

[17:57](#msg6259b20fc61ef0178ec340e6)Thanks~ 😃

## Thursday 21st April, 2022

Geo-7

[13:28](#msg62615c0f090925231883ce40)

```
3.5M Apr 21 17:42 hi-rust
1.7M Apr 21 17:46 hi-go
600K Apr 21 17:54 hi-red
569K Apr 21 17:37 hi-v
 17K Apr 21 17:30 hi-chibicc
 16K Apr 21 10:59 hi-c-gcc
 16K Apr 21 17:33 hi-clang
 16K Apr 21 17:15 hi-llvm
8.7K Apr 21 17:15 hi-nasm
4.7K Apr 21 17:15 hi-asm-gcc
2.6K Apr 21 10:58 hi-tcc
 229 Apr 21 17:15 hi-fasm
```

[13:29](#msg62615c41090925231883cea0)Hi, Just for fun it is size of "Hello word" app with different language.

[13:30](#msg62615c66f43b6d783f5ec679)and compilers

[13:42](#msg62615f5bd1b64840dbc6e18c)forget to include v native

[13:43](#msg62615f7c257a3578258b904e)

```
183 Apr 21 18:08 hi-v-native
```

[14:22](#msg626168ba161ffc40d714b831)I'm on Arch linux tried some optimizatio for V

```
83K Apr 21 18:38 hi-v-optimized
```

hiiamboris

[14:36](#msg62616bec090925231883ed37)

```
Red/System []
#syscall [
	write: 4 [
		fd		[integer!]
		buffer	[c-string!]
		count 	[integer!]
		return:   [integer!]
	]
]
write 1 "hello world^/" 12
```

`red --no-runtime -t linux -r "hw.reds"` -&gt; 472 bytes

pekr

[14:39](#msg62616cbe8db2b95f0ac88fb7)Hi, is there already a channel already set-up for networking, or maybe more generally called IO?

Geo-7

[14:43](#msg62616dac0466b352a47a1712)I think you should check https://github.com/red/red/tree/IO

[14:44](#msg62616dbf090925231883f19c)IO branch

pekr

[14:45](#msg62616e20090925231883f2c7)I know, I meant here on Gitter, to discuss the topic :-)

Geo-7

[14:46](#msg62616e30f43b6d783f5eee2e)my bad sorry

[14:46](#msg62616e32090925231883f2e1):)))

pekr

[14:46](#msg62616e576b91242320932072)Never mind :-)

## Friday 22nd April, 2022

rebolek

[05:06](#msg626237e59bd1c71eca023955)@pekr I believe there’s no such channel. @greggirwin can we have one?

pekr

[05:08](#msg6262383d0466b352a47ba1ac)I have asked, because it was requested already cca few months ago and I thought I somehow can't find the link. So - let's create one, please, IO is going to be a big topic imo ....

greggirwin

[06:18](#msg626248b1ddcba117a2810738)I thought we had one as well. Will set it up now.

[06:19](#msg626248fe161ffc40d716617e)https://gitter.im/red/IO

rebolek

[06:24](#msg62624a2ee9cb3c52ae77d52a)great, thanks!

pekr

[06:56](#msg626251bb0466b352a47bd1ba)Super 🙂

## Saturday 23th April, 2022

GiuseppeChillemi

[17:34](#msg6264388e161ffc40d71a1287)Yuppiii

## Friday 29th April, 2022

hiiamboris

[19:18](#msg626c39f189dcc96e9cdbd435)### \[Spaces](https://codeberg.org/hiiamboris/red-spaces) have automatic sizing now.

To test and demo I mocked up the \[easings.net](https://easings.net/#) layout, which seemed quite tricky and at the same time, logical:  
!\[](https://s7.gifyu.com/images/GIF-29-Apr-22-21-59-52.gif)

Source \[here](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/tests/resize-test.red)

Of course layout itself is generative. But sizing is done simply by \[switching the minimum width of each triple](https://codeberg.org/hiiamboris/red-spaces/src/commit/0ea3951cdc09f8d810033c6178e7ef81dd3ce8ef/tests/resize-test.red#L138) when window size changes.

[19:21](#msg626c3ab2d30b6b44ebc6040c)Funny, bezier approximation used on the website is quite \[visibly off the real curve](https://i.gyazo.com/6af3280729ce9558dd3a1b1d7f02af50.png) (also ease-in-out-back)

greggirwin

[20:27](#msg626c4a2e14df4e44f2010777)Nice update @hiiamboris, thanks! The GIF in your message disappears for me though. Strange.

## Saturday 30th April, 2022

pekr

[03:46](#msg626cb0fceaf3267f853a9915)I can still see the GIF. Looks nice. Hope it is smooth in real test, the GIF seems to be a big jerky/laggy :-) I am so glad, that Spaces is being considered as a future GUI - I can see lot's of innovative ideas Rebol GUIs never tried to envision! :-)

ldci

[08:35](#msg626cf4cbeaf3267f853b05fc)@hiiamboris I get a violation access when trying red-spaces

GalenIvanov

[08:50](#msg626cf854eaf3267f853b0c9a)@hiiamboris I think %scoping.red is missing in `common` (Red mezz warehouse)

[08:52](#msg626cf8c014df4e44f20237ce)Nevertheless the GIF looks great - I'm looking forward to trying Spaces!

hiiamboris

[08:52](#msg626cf8cb89dcc96e9cdd2b6a)@GalenIvanov thanks! pushed a fix

[08:53](#msg626cf912eaf3267f853b0da9)@ldci I'll get my hackintosh and test later

GalenIvanov

[08:54](#msg626cf95c9db19366b2078240):+1:

ldci

[08:59](#msg626cfa8ceaf3267f853b0fba)@hiiamboris Tested on Win 11

hiiamboris

[09:04](#msg626cfb9c949ae94006846d12)Then sorry, no W11 around :)

[09:05](#msg626cfbeed4ef6e15af238eec)@ldci does `hello-space` test crash as well? What about `everything.red` itself?

ldci

[09:12](#msg626cfd72cd35b566afc265a4)@hiiamboris I’ll test :)

GalenIvanov

[09:22](#msg626cffc0bb0de60c7218da84)@hiiamboris `hello-space` crashes for me, Win 8, `Red 0.6.4 for Windows built 27-Jan-2022/15:21:11+03:00 commit #008f815`

hiiamboris

[09:24](#msg626d005aa687887f8d823994)You should try a current build. A lot of critical bugs were fixed since.

ldci

[09:39](#msg626d03bca687887f8d823f6a)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/x2C5/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/x2C5/image.png)

[09:39](#msg626d03ec949ae9400684796c)@hiiamboris : works fine on macOS Mojave. Thanks

toomasv

[10:50](#msg626d145b61f5ca3feedc89d3)"Hello" works ok on W10.

ldci

[11:00](#msg626d16c6d4ef6e15af23baca)I confirm for W10

flw-cn

[12:25](#msg626d2aaf14df4e44f2028ed7)Excuse me, is there a version that works after macOS Catalina now?

[12:27](#msg626d2b45949ae9400684b9d3)I downloaded this version from website, but it can't execute on my MacBook yet.

```
macOS	red-30apr22-38b42610d	1.5 MB
sha256: 691e3767290e34dfd6592cc2e10cb14b9bb710dd9d12aa7c1872bb7c9d93b02b
```

```
zsh ❯ red
zsh: bad CPU type in executable: red
```

hiiamboris

[12:30](#msg626d2bd09db19366b207dade)No 64-bit Red for now.

flw-cn

[13:03](#msg626d33a1cd938f6ea224e051)That's too bad. When will there be a 64-bit version?

hiiamboris

[13:23](#msg626d3837fa846847c9427177)# 🤷

ldci

[13:33](#msg626d3a9aeaf3267f853b8224)@flw-cn The last version supporting 32-bit apps is macOS Mojave.

hiiamboris

[13:34](#msg626d3afabb0de60c721944d8)@flw-cn you can use docker meanwhile https://github.com/red/red/wiki/\[LINKS]-Unofficial-Red-images

flw-cn

[14:06](#msg626d428246495f47cfbba11c)okay. thanks

GalenIvanov

[18:28](#msg626d7fd341f4560c6f7b5e97)@hiiamboris Yes, of course! `resize-test.red` works fine now. I'll test the others too.

hiiamboris

[18:32](#msg626d80b3949ae94006855084):+1:

greggirwin

[19:02](#msg626d87d2cd938f6ea22574d1)I can see the GIF now. Great stuff!

hiiamboris

[19:04](#msg626d8829cd938f6ea2257522)Thanks ☻

## Monday 2nd May, 2022

ALANVF

[20:13](#msg62703b7cd30b6b44ebcd0ce3)ok so question, why do `encode`/`decode` need to support base58?

hiiamboris

[20:53](#msg627044e2d4ef6e15af2964c3)because it's widely used and more portable than base-64 (e.g. filenames, urls)

greggirwin

[21:26](#msg62704c8dd30b6b44ebcd2b12)I don't know if I'd say more widely used, but it is used in the blockchain space, which is one reason for us to support it natively.

ALANVF

[22:08](#msg6270564bcd938f6ea22a79cf)ah ok

## Wednesday 4th May, 2022

rebolek

[07:51](#msg6272307889dcc96e9ce6979d)the question is why it doesn’t support even more encodings :) For example base64url. I know that it’s easy to turn base64 to base64url with simple replace, but it would be nice to have it built-in. It’s a must when dealing with HTTP.

greggirwin

[18:10](#msg6272c1a1d4ef6e15af2e0a92)Base64 is a standard. Base58 has an IETF draft. Is Base64url standardized or doc'd anywhere? I hadn't heard of it before, so don't know how much agreement there is on it, or if we say "It's URL safe", do half the users complain that it doesn't map correctly to their uses.

hiiamboris

[18:13](#msg6272c24acd938f6ea22efaa8)https://datatracker.ietf.org/doc/html/rfc4648#section-5

greggirwin

[18:27](#msg6272c5a2eaf3267f8545999f)Cool. All it should take is new tables in %binary.reds and a switch to those if the URL version is used. But as @rebolek notes, it's a simple replace. If it's a must for HTTP, it makes sense to include, but also easy to wrap with mezz's in the meantime. My thinking here is that `enbase/base '64url` means other changes as well, making the `base` arg not just a radix integer, and that expression isn't as clear as `to-base-64-url` or something like it. So wrapping it isn't bad in any case.

@rebolek can you link to where it's used today, for context?

hiiamboris

[18:29](#msg6272c600a687887f8d8cbaea)`'64url` isn't valid, maybe `'url-64`?

greggirwin

[19:05](#msg6272ce64fa846847c94c82ae)Thanks. I edited and whacked it. Same problem but, yes, that reads even worse.

rebolek:matrix.org

[19:54](#msg6272d9f1d4ef6e15af2e3d12)@greggirwin: I use this: https://gitlab.com/rebolek/castr/-/blob/master/common-tools.red#L258

greggirwin

[19:57](#msg6272da97bb0de60c72238fb1):+1: So the padding also has to be adjusted. I didn't read that in the RFC spec.

rebolek:matrix.org

[19:57](#msg6272daaf46495f47cfc5df8e)It deals with padding also. Padding rules in base 64 is a gray area. But the decoder should be able to deal with both variants (I'm on phone, so I can't test it right now if it does)

[19:58](#msg6272dafdd4ef6e15af2e3ef9)The `/json` refinement is unnecessary. That's just a laziness on my side :)

[19:59](#msg6272db35bb0de60c722390fe)I believe there's a nice table on the wiki, let me find it

greggirwin

[19:59](#msg6272db3a9db19366b2122d94)How does it work at call sites? That is, how do you know when you need to use it?

rebolek:matrix.org

[20:00](#msg6272db789db19366b2122df4)https://en.m.wikipedia.org/wiki/Base64

[20:01](#msg6272db9941f4560c6f852feb)See the "variants summary table"

[20:04](#msg6272dc49d30b6b44ebd20715)It's optional, so I don't include it when encoding, but need to add it when decoding (so Red requires it after all, no need to test it 😄)

[20:07](#msg6272dcfccd35b566afcd24fa)The encoder probably would be fine with leaving the padding there, but when I was looking for example, all of them discarded the padding, so I removed it also. And it saves up to three bytes 😄.

greggirwin

[20:09](#msg6272dd829db19366b2123272)Dang, so base64 is kind of a mess like other things. e.g. IMAP. My gut says it's worth including as standard, as mezz is fine, because having it be both URL and filename safe has benefits. Not perfect though, since you can't encode an entire URL with scheme into a Windows filename.

## Thursday 5th May, 2022

rebolek

[07:39](#msg62737f35cd938f6ea2305972)I’m not against mezzanine, but if we have a function that’s designed to deal with such encodings, I would prefer extending that function(s).

hiiamboris

[15:38](#msg6273ef7841f4560c6f8733c1)should we open a REP?

Oldes

[16:00](#msg6273f4afeaf3267f8547e988)In my R3:

```
>> ? enbase
USAGE:
     ENBASE value base

DESCRIPTION:
     Encodes a string into a binary-coded string.
     ENBASE is a native! value.

ARGUMENTS:
     value         [binary! string!] If string, will be UTF8 encoded.
     base          [integer!] Binary base to use: 85, 64, 36, 16, or 2.

REFINEMENTS:
     /url          Base 64 Encoding with URL and Filename Safe Alphabet
     /part         Limit the length of the input
      limit        [integer!]
```

[16:02](#msg6273f503bb0de60c7225b021)Also when I see it now, maybe the `/url` could be removed, and same functionality could be used when the input `value` would be a `file!` or `url!`.

hiiamboris

[16:04](#msg6273f587a687887f8d8f0599)what if input is a binary?

Oldes

[16:12](#msg6273f772949ae940069123c1)Hm... I can see that I'm using it only \[on one place](https://github.com/Oldes/Rebol3/blob/master/src/modules/spotify.reb#L59) and the input is a `binary!`, so I will keep it as I have it now.

greggirwin

[20:14](#msg62743040fa846847c94f3de8)This particular functionality falls in a gray area for me, and has already led to more questions on how to do it, and even what to call it if it's also filename safe. So let's come back to this:

&gt; It’s a must when dealing with HTTP.

How is it used? Because I've never dealt with it, I'm in a position of ignorance at the moment about its importance and where it's required.

## Friday 6th May, 2022

ALANVF

[00:13](#msg6274682acd35b566afd02d85)I just noticed that the spec for `new-line?` is incorrect

[00:14](#msg62746877bb0de60c72269255)it currently says

```
new-line?: make native! [[
		"Returns the state of the new-line marker within a list series"
		position [any-list!] "Position to change marker"
		return:  [any-list!]
	]
	#get-definition NAT_NEW_LINE?
]
```

but it should say

```
new-line?: make native! [[
		"Returns the state of the new-line marker within a list series"
		position [any-list!] "Position to check marker"
		return:  [logic!]
	]
	#get-definition NAT_NEW_LINE?
]
```

greggirwin

[04:25](#msg6274a31e949ae94006926230)Good catch. Will be a quick merge for anyone who PRs it.

rebolek

[05:22](#msg6274b0a8cd938f6ea232a841)&gt; How is it used?

For example, file upload can be done in base64url, authentication credentials are encoded with base64url, etc. It’s not visible on the user level, but on the protocol level, it has many uses.

GiuseppeChillemi

[16:03](#msg627546d361f5ca3feeebbabe)I think binding is a time consuming project and when you bind a block, in case you have to bind only a couple of words, you endup checking every bindable element while another approach could save time. Why not create a virtual binding, so the interpreter checks the virtual context of a block for a word, before checking the system context?

hiiamboris

[16:07](#msg627547dbbb0de60c72283ce1)Sorry, as usual, no idea what you're proposing. What virtual context of a block?

rebolek

[16:14](#msg62754983cd938f6ea233cf62)I’m in the dark too. What is the virtual context?

GiuseppeChillemi

[16:18](#msg62754a6a46495f47cfca97d3)I mean that if I have to `DO` a block with 100 words, and I have to bind it to a context, all 100 word are checked for rebinding. If you create a way to connect the block to the context you want to bind, you could check this context only when you encounter a word. Then if you find it, you take the value from the virtual context anche change the binding of the word to it, otherwise you check for the word on `system/words`

hiiamboris

[16:22](#msg62754b359db19366b216e48d)words do not carry any info on the blocks they appear in

[16:23](#msg62754b8aa687887f8d919a79)this will slow down the interpreter and lead to a lot of bugs

GiuseppeChillemi

[16:32](#msg62754d9bfa846847c951619b)Yes, but I think the interpreter carries info on the blocks and the blocks nesting. So if you tie a context to a block, the interpreter will know if the virtual context must be used for it and its nested blocks.

hiiamboris

[16:33](#msg62754dd4fa846847c951621f)which adds checks into the interpreter that will be unnecessary for 99.99% of code

also nested blocks will know nothing of it's parent block virtual context, unless `bind` recursively modified them

not to mention it would create the same problems that current ownership system creates, but on a larger scale

zentrog:matrix.org

[16:33](#msg62754ddfd4ef6e15af3305d9)It sounds like you would like to introduce block-based scoping

GiuseppeChillemi

[16:53](#msg627552a3a687887f8d91a65d)@hiiamboris you have seen under the clothes not me. So I have to rely on your words.

hiiamboris

[16:59](#msg627553efbb0de60c72285377)## 👀

GiuseppeChillemi

[16:59](#msg6275540eeaf3267f854a9723):-D

[17:01](#msg6275547a10cfc315bc681e0e)@zentrog:matrix.org I mean a context that is scanned until all the words of the blocks have been bound. But I think that the word "all" carries on of the most complication because of the mutability of the block

ne1uno

[17:07](#msg627555c914df4e44f211a996)under the hood?

GiuseppeChillemi

[17:12](#msg62755708d30b6b44ebd6d290)@ne1uno What you mean?

ne1uno

[17:13](#msg62755744bb0de60c72285a91)sorry, not trying to step over your mixed metaphor

GiuseppeChillemi

[17:15](#msg6275579541f4560c6f89e19d)I do not know if mine is right, I have already changed it one time. If it could be better expressed in another way, I am here to learn!

hiiamboris

[17:17](#msg6275580d46495f47cfcab537)initial wording was funnier ;)

ne1uno

[17:18](#msg6275587dfa846847c951772f)https://www.macmillandictionary.com/dictionary/american/under-the-hood

GiuseppeChillemi

[17:21](#msg62755932949ae9400693cc52)@hiiamboris Yes, everyone like to looks under Red pants and suggest how things should be done! ;-)

[17:22](#msg6275595c9db19366b2170054)@ne1uno Thank you!

zentrog:matrix.org

[17:23](#msg6275598eeaf3267f854aa149)It might be an expression that doesn't quite translate. It sounded to me like \[open kimono](https://idioms.thefreedictionary.com/open+kimono), but \[under the hood](https://encyclopedia2.thefreedictionary.com/under+the+hood) is probably more appropriate. I like this definition a bit better than the Macmillan one. But you can tell us whether that was the meaning you intended 😊

ne1uno

[17:24](#msg627559b961f5ca3feeebe0ae)refers to looking at the engine of car, ok. everyone knew what you meant.

zentrog:matrix.org

[17:26](#msg62755a28fa846847c9517a58)The fun thing about language is that everyone can assume they understand what is meant, and still be wrong 😉

GiuseppeChillemi

[17:30](#msg62755b1ccd35b566afd1fdc2)But the other good thing is that our brains are capable of guessing what someone really want to say, even if he uses a phrase with partially uncorrect terminology.

zentrog:matrix.org

[17:32](#msg62755bc0949ae9400693d166)Yeah, most of the time it works pretty well. For some folks more than others though

GiuseppeChillemi

[17:36](#msg62755cba61f5ca3feeebe5c2)Ok, let's change topic. I have another question. Why functions like `pick` do not accept multiple targets? I mean like `pick [a b c d e f g] [1 4] >>> [a d]`. Is it a deliberate choiche with a reason?

hiiamboris

[17:39](#msg62755d3ecd938f6ea233f587)nobody designed it I guess

[17:39](#msg62755d559db19366b2170757)for example, it can be `pick [a b [c d] e f g] [3 2] >>> d`

[17:40](#msg62755d9214df4e44f211b70c)what's the use case?

GiuseppeChillemi

[17:41](#msg62755de1a687887f8d91bf63)I am working with these choices right now. Your is more a `select` with split path (as it can't have integer on first item)

[17:42](#msg62755de989dcc96e9cecbfe1)Use case?

[17:44](#msg62755e7f41f4560c6f89eea5)In a `table`context (not Red context! :), pick one or more columns:

```
table: [[a b c d] [x y z w] [5 6 7 8]]`
pick at table 2 [1 3]
>>  [x z]
```

hiiamboris

[17:48](#msg62755f5241f4560c6f89f019)I think it's a valid but rare need. Can't remember where I would want this off the top of my head.

GiuseppeChillemi

[17:55](#msg6275611fd30b6b44ebd6e7c0)It is a long time I am playing creating functions for tables in Red. We have talked about such topics about 3 years ago. One of the functions I have created is `select-skip` which takes as argument `size` `value-index` `key-index` to select on a different key than the first one and also get one ore more columns.

[18:05](#msg6275635341f4560c6f89f8f5)About the wildcards, is the `/with` refinement of `select` available as function? So I can use it to check if a value matches.

hiiamboris

[18:14](#msg6275656b14df4e44f211c6b9)No it's not.

[18:17](#msg6275664089dcc96e9cecd4db)you can rip off \[this one](https://codeberg.org/hiiamboris/red-common/src/commit/345e1d8a508fc24b4b60b9ffd8971de1d7e836f2/glob.red#L113) though

greggirwin

[18:48](#msg62756d6f949ae9400693f273)On multi-pick, it's very easy to do as a mezz, though I would like to see \[hits](https://github.com/red/red/issues/3665) addressed, and narrow the `index` spec to the minimum for now, while we decide if multi should be native.

[18:52](#msg62756e8310cfc315bc685396)Don't take `multi` as a standard naming recommendation. That's another can of worms for @GiuseppeChillemi to open. :^)

```
pick-multi: function [
	"Returns multiple values picked from a series or other value."
	value   [series!] ; date! time! tuple! map! pair!
	indexes [any-block!] "Block of PICK-compatible index values"
][
	collect [
		foreach index indexes [keep/only pick value index]
	]
]
```

hiiamboris

[18:53](#msg62756ec5a687887f8d91e1e5)`-many` works too

greggirwin

[18:56](#msg62756f609db19366b2172958)Yes, which is used in R/S for things. Though I hesitated on that, as it leads to "does many require the selection block not to be empty, or is many really any, and the block can be empty." `Multi` is just the old name I used.

GiuseppeChillemi

[18:56](#msg62756f6a89dcc96e9cece56a)Thank, I already have it. I will add your to my collection! 😂

[20:18](#msg627582a046495f47cfcb066d)@hiiamboris (you have to know I have redone it many times: accepting words as column names and words inside blocks for tables, and support for custom datatypes... and different versions of each one. @greggirwin you talk about can of worms here but think about me opening can of worms being alone and trying to make choices!😱)

## Tuesday 10th May, 2022

hiiamboris

[16:45](#msg627a968f14df4e44f21b2f7f)### Spaces now have a basic popup support

!\[](https://s8.gifyu.com/images/GIF-10-May-22-19-38-04.gif)  
\[Test source](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/tests/popups-test.red)

No multi-level menus or drop-downs for now, until \[wish 118](https://github.com/red/REP/issues/118) is addressed.

[16:53](#msg627a988bbb0de60c7231cba9)Hmm. Gitter seems to truncate the gif at random moment. Full gif \[here](https://s8.gifyu.com/images/GIF-10-May-22-19-38-04.gif)

rebolek

[17:00](#msg627a9a2fbb0de60c7231cf24)Nice!

greggirwin

[17:02](#msg627a9a8c9db19366b22088bd)@hiiamboris WOW! :+1: :+1: :clap: I admit the jittering in the demo gets to me, but the radial menu is very cool. For themes, it makes sense to me to start with Solarized, and a generic light theme. I don't know if there's a standardized dark theme, or if @rgchris or @henrikmk know. And you can include your high color version for yourself. We need a good name for it though, unless it's also standard somewhere.

GiuseppeChillemi

[17:03](#msg627a9ad689dcc96e9cf64ea0)@greggirwin Which the page to post request? I would like to write the `pick` one

hiiamboris

[17:03](#msg627a9addfa846847c95af321)Theme is basically just `system/view/metrics/colors/panel` and `/text`. Even that is only supported on Windows so far.

GiuseppeChillemi

[17:03](#msg627a9af2cd938f6ea23d7d83)@hiiamboris Great, and I also like the pink reduced version of the demo.

rebolek

[17:06](#msg627a9ba9cd35b566afdb8285)Solarized has both light and dark themes.

[17:07](#msg627a9bbad30b6b44ebe05692)https://ethanschoonover.com/solarized/

greggirwin

[17:07](#msg627a9bebcd35b566afdb8347)@rebolek yes it does, but it's dark theme, IIRC, isn't as dark as most dark themes today. Or maybe I just don't remember how dark it is.

rebolek

[17:09](#msg627a9c47d30b6b44ebe0575a)see the link, there are screenshots.

greggirwin

[17:09](#msg627a9c5289dcc96e9cf651ae)Ah, I guess it is pretty dark, just leans a little more toward green than blue/gray to me.

rebolek

[17:11](#msg627a9cb589dcc96e9cf6524e)Interesting, because it has more blue than green in it: `$base03: #002b36;`

greggirwin

[17:11](#msg627a9cb6d4ef6e15af3cb469)@GiuseppeChillemi use the red/rep repo and make sure there isn't already an issue there for it, then add a new one if that's the case.

[17:13](#msg627a9d1ecd35b566afdb85df)@rebolek I don't know color perception rules, just how it looks to me, compared to the many other dark themes out there. It's a great place to start though. Heck, I still haven't got all my color space math right for this other project.

rebolek

[17:13](#msg627a9d4e14df4e44f21b3c0c)I understand. It can also depend on how your monitor shows the colors, etc.

toomasv

[17:58](#msg627aa7c889dcc96e9cf66935)Cool popups and tooltips! :+1:

pekr

[18:35](#msg627ab08ecd35b566afdbacb4)The gif is awesome. Would like to see support for the Spaces gui being implemented. I have also seen eome discussion about lagginess, leading to the conclusion, Draw might not be culprit, but manipulating hash structures?

[18:36](#msg627ab0b8949ae940069d7d7b)I alao remember some past debates with Henrik, suggesting stuff like nodes, buffering, clipping, etc.

GalenIvanov

[18:55](#msg627ab51710cfc315bc71e2be)Impressive, @hiiamboris !

hiiamboris

[19:00](#msg627ab646fa846847c95b30ec)thanks :)

[19:10](#msg627ab88aeaf3267f8554569f)@pekr good news is Red itself is stable enough that it doesn't crash randomly anymore (in like 2 months! ;)

Bad news is https://github.com/red/red/issues/5130 and probably other memory leaks slow it down and even cause random View heisenbugs to pop up, so constantly updating your layout like I do in my demo is not an option. For example, the above demo slowed down in ~1 minute from 60 to 10 fps and started to trigger errors somewhere inside View code which I reproduced 2-3 times and then never again.

Spaces will cache everything that's possible to cache and will not initiate a redraw unless something changed, so programs with more or less static layouts should be possible to write already.

zentrog:matrix.org

[21:06](#msg627ad3c261f5ca3feef5cea1)@greggirwin: Humans are supposed to be the most sensitive to green, though I don't know if that explains why it appears that way. Usually that means using more bits for it because we are able to discern more greens. If you want more color inspiration, there are \[palette generators](https://colorhunt.co/palettes/dark) too

greggirwin

[21:27](#msg627ad8d246495f47cfd4b159)Thanks @dander!

hiiamboris

[21:44](#msg627adcdbbb0de60c7232532b)But displays should be calibrated so that blue is actually brighter, but is perceived equally bright as green at 255 level. Simple explanation could be the "night mode" that dims the blue color.

Respectech

[23:41](#msg627af81c41f4560c6f9426e4)@hiiamboris Very impressive! I'm looking forward to using it. Is there documentation anywhere?

## Wednesday 11st May, 2022

ldci

[04:46](#msg627b3fb6cd35b566afdcb1c7)@hiiamboris Great!

pekr

[05:04](#msg627b43f846495f47cfd572cb)@hiiamboris thanks. The note about the cache is interesting - is that Red or R/S level though? I do remember Cyphre (old time Rebol guru, bringing AGG to R2) stating, that caching or even te ability to create a snapshot at certain node level would be useful. But not sure snapshots are all that useful with Draw, it might be mostly useful for bitmap stuff, when you know that the area did not change since the last redraw, so you don't need to redraw each displayed element .... or something like that :-)

hiiamboris

[09:25](#msg627b80ff46495f47cfd5ef48)Spaces are 100% pure Red. No RS. To understand why caching makes sense, for example tube-test.red contains circa 8000 spaces, and when you're just scrolling it, there is no need to redraw them all. By caching draw code of the list that integrates them all, resources are saved. Still about 8 fps only, but that's 99% due to the mentioned ownership system bug.

[09:27](#msg627b816810cfc315bc736b89)@Respectech docs are there on codeberg, but a little out of date already with my new developments.

## Friday 13th May, 2022

snotbubble

[06:54](#msg627e00b9cd35b566afe230e9)@hiiamboris Spaces look very promising.  
I've always wondered if View could replace html...  
Anyway great work. I'm struggling with a Cairo UI at the moment, to avoid direct exposure to GTK madness (via Vala). Was thinking 64-bit Red with a native view-based UI would be perfect.

ldci

[07:58](#msg627e0fbc41f4560c6f9a27ed)@snotbubble +1

hiiamboris

[08:29](#msg627e16dafa846847c961e2fd)Replacing HTML is one of the goals of Spaces.

BuilderGuy1

[14:27](#msg627e6ac610cfc315bc793da0)@hiiamboris Fantastic !!

GiuseppeChillemi

[14:44](#msg627e6eda41f4560c6f9aeec2)I have found a curious difference:

```
Rebol
>> to-integer ""
== 0

Red
>> to-integer ""
*** Script Error: cannot MAKE/TO integer! from: ""
*** Where: to
*** Near : ""
*** Stack: to-integer  

>>
```

In Rebol, an empty string converts to ZERO

ldci

[15:33](#msg627e7a3a949ae94006a505e0)For Rebol 3

```
>> to-integer ""
** Script error: content too short (or just whitespace)
** Where: to to-integer
** Near: to integer! :value
```

rebolek

[15:34](#msg627e7a71949ae94006a50650)TBH, `to integer! "" = 0` doesn’t make much sense IMO.

hiiamboris

[15:35](#msg627e7ad0fa846847c962b182)most likely an implementation artifact

ldci

[15:35](#msg627e7adc10cfc315bc795d1f)@rebolek I agree:)

## Sunday 15th May, 2022

GiuseppeChillemi

[08:08](#msg6280b4f1d30b6b44ebec0f7c)  
Other investigations and Rebol Vs. Red :Sameness and Equalness

REBOL:

```
>> (to-block make object! [a: 22 b: 33]) == (to-block make object! [a: 22 b: 33])
== false
>> (make object! [a: 22 b: 33]) == (make object! [a: 22 b: 33])
== false
>> (to-block make object! [a: 22 b: 33]) = (to-block make object! [a: 22 b: 33])
== false
>> (make object! [a: 22 b: 33]) = (make object! [a: 22 b: 33])
== false

>> same? (to-block make object! [a: 22 b: 33]) (to-block make object! [a: 22 b: 33])
== false
>> equal? (to-block make object! [a: 22 b: 33]) (to-block make object! [a: 22 b: 33])
== false
>> same? (make object! [a: 22 b: 33]) (make object! [a: 22 b: 33])
== false
>> equal? (make object! [a: 22 b: 33]) (make object! [a: 22 b: 33])
== false
```

RED:

```
>> (to-block make object! [a: 22 b: 33]) == (to-block make object! [a: 22 b: 33])
== true
>> (make object! [a: 22 b: 33]) == (make object! [a: 22 b: 33])
== true
>> (to-block make object! [a: 22 b: 33]) = (to-block make object! [a: 22 b: 33])
== true
>> (make object! [a: 22 b: 33]) = (make object! [a: 22 b: 33])
== true

>> same? (to-block make object! [a: 22 b: 33]) (to-block make object! [a: 22 b: 33])
== false
>> equal? (to-block make object! [a: 22 b: 33]) (to-block make object! [a: 22 b: 33])
== true
>> same? (make object! [a: 22 b: 33]) (make object! [a: 22 b: 33])
== false
>> equal? (make object! [a: 22 b: 33]) (make object! [a: 22 b: 33])
== true
>>
```

Further on Red

```
>> equal? (make object! [b: 33 a: 22]) (make object! [a: 22 b: 33])
== false
>> equal? (to-block make object! [b: 33 a: 22]) (to-block make object! [a: 22 b: 33])
== false

>> (to-block make object! [b: 33 a: 22]) = (to-block make object! [a: 22 b: 33])
== false
>> (to-block make object! [b: 33 a: 22]) == (to-block make object! [a: 22 b: 33])
== false

>> (make object! [b: 33 a: 22]) == (make object! [a: 22 b: 33])
== false
>> (make object! [b: 33 a: 22]) = (make object! [a: 22 b: 33])
== false
>>
```

&gt;

[08:13](#msg6280b64110cfc315bc7d6ce3)Summary: in Rebol objects/blocks with identical content are never `equal` or `same`  
In Red objects/blocks with same content are not `same` but they `equal`

[08:14](#msg6280b681d4ef6e15af4878fc)`equal?` seems identical to `=`

[08:17](#msg6280b70c14df4e44f226feb1)I don't see a way to compare is two contents are equal in one word in both languages

[08:17](#msg6280b72914df4e44f226fef3)I have to use:

```
> (sort values-of make object! [b: 33 a: 22]) = (sort values-of make object! [a: 22 b: 33])
==
```

[08:18](#msg6280b76289dcc96e9c023e93)is there but I don't know it?

hiiamboris

[09:34](#msg6280c930cd938f6ea24978d2)

```
>> (body-of make object! [a: 1 b: 2]) = (body-of make object! [a: 1 b: 2])
== true
```

GiuseppeChillemi

[09:37](#msg6280c9c7eaf3267f856009e0)You are right, I should use `body-of` instead of `values-of` but I was in hurry...

[09:38](#msg6280c9fdcd938f6ea2497b06)But does this work even if the Keys of the one block are inverted?

hiiamboris

[09:50](#msg6280cce8cd938f6ea2498002)Why are they inverted in the first place?

GiuseppeChillemi

[11:03](#msg6280de18949ae94006a9689d)Because I have tried to find if Rebol and Red have a way to ckeck if two objects have the same keys and values couple but in different order.

hiiamboris

[11:08](#msg6280df4614df4e44f2274731)Sort it.

GiuseppeChillemi

[11:38](#msg6280e64ceaf3267f85603ceb)Yes, done it. So it's not a standard function.

[11:39](#msg6280e66510cfc315bc7dc088)

```
>> (sort/skip/all body-of make object! [b: 33 a: 22] 2) = (sort/skip/all body-of make object! [a: 22 b: 33] 2)
==  True
```

hiiamboris

[11:40](#msg6280e6c546495f47cfe0421b)It's not a standard need

[11:41](#msg6280e6e6949ae94006a978c3)No reason to use /all btw

GiuseppeChillemi

[11:42](#msg6280e719eaf3267f85603e2a)Maybe `/stable`

hiiamboris

[11:45](#msg6280e7e09db19366b22c9acb)Also no reason

GiuseppeChillemi

[11:46](#msg6280e7fceaf3267f8560403c)My mistake, I had in mind the attempt on blocks where I could have duplicated keys.

[14:35](#msg62810fc3949ae94006a9c467)Do you have a way to return `body-of make object! [b: 'c]` is returned as `[b: c]` insted of \[b: 'c]?

[14:36](#msg62810ffa949ae94006a9c4a3)I mean: a Red standard command

[14:37](#msg6281100dcd938f6ea24a00de)Because otherwise I could make it by myself

hiiamboris

[15:02](#msg6281161041f4560c6f9fe633)you'll have to mix keys-of with values-of

[15:02](#msg6281161d14df4e44f227ac51)though personally I consider this a bug

GiuseppeChillemi

[15:02](#msg62811621fa846847c9678a96)@hiiamboris:  
We can't use the `SORT` method in RED using `BODY-OF` because it is "lossy"  
Red

```
>> probe body-of make object! [a: 22 b: 'b]
[
    a: 22 
    b: 'b
]
```

Rebol

```
>> probe body-of make object! [a: 22 b: 'b]
[a: 22 b: b]
```

`Words` and `lit-words` are returned in the same way.

hiiamboris

[15:03](#msg6281165814df4e44f227ad3b)yeah I got it

[15:04](#msg6281169946495f47cfe09aab)

```
>> type? last to [] object [a: 'b]
== lit-word!
```

@greggirwin what do you think?

[15:05](#msg628116b8a687887f8da7c75e)to me it looks like a mold kludge ruining the consitency

GiuseppeChillemi

[15:05](#msg628116bb949ae94006a9d1ef)I personally consider it a bug too. But the solution is easy:  
1\) Red should change its implementation: one of `to-block` or `values-of` should return the maker format.  
2\) Having a specific accessor like `maker-of`

[15:06](#msg62811701fa846847c9678c39)(note: we have discussed it one year ago in red/bugs without a conclusion but now things are clearer, at least to me)

[15:09](#msg628117bdbb0de60c723e42f3)It could hav been implemented this way on purpose to have the creation block, but the correct form for `lit-words` should be `quote 'b` or `to-lit-word 'b` or maker format.

hiiamboris

[15:15](#msg628119009db19366b22cfe1a)In R2 `mold` is rightly different from `body-of`.

GiuseppeChillemi

[15:21](#msg62811a6541f4560c6f9fef4e)Yes, it returns the maker block too, loosing resolution:  
\*\*REBOL:\**

```
>> mold make object! [a: 22 b: 'b]
== {make object! [
    a: 22
    b: 'b
]}
>> mold make object! [a: 22 b: quote 'b]
== {make object! [
    a: 22
    b: 'b
]}
```

[15:22](#msg62811a9fd4ef6e15af493664)\*\*Red\**

```
>> mold make object! [a: 22 b: 'b]
== {make object! [^/    a: 22^/    b: 'b^/]}
>> mold make object! [a: 22 b: quote 'b]
== {make object! [^/    a: 22^/    b: 'b^/]}
```

Both are lossy

meijeru

[16:41](#msg62812d2f89dcc96e9c031e50)I notice slow progress on the main branch, but even slower progress on the IO branch. Shouldn't that have some priority now? Who else among you is waiting for complete I/O?

greggirwin

[18:01](#msg62813febcd938f6ea24a626a)Personally I'm waiting for I/O to be merged, and am pressing for it internally.

[18:01](#msg6281401214df4e44f227ff49)@hiiamboris let me check tickets and the wiki. My dusty memory says there's existing material on this design aspect.

[18:34](#msg628147c2d4ef6e15af498d10)Can't find any notes, but IIRC the change was because of this behavior in R2.

```
>> body-of make object! [b: 'c]
== [b: c]
>> context body-of make object! [b: 'c]
** Script Error: c has no value
** Where: context
** Near: b: c
```

You get around this with `construct`.  
Red:

```
>> construct [a: 22 b: b]
== make object! [
    a: 22
    b: 'b
]
```

R2:

```
>> probe construct [a: 22 b: b]
make object! [
    a: 22
    b: 'b
]
```

But now you have this in R2:

```
>> o: construct [a: 22 b: b]
>> type? get in o 'b
== word!
>> o: construct [a: 22 b: 'b]
>> type? get in o 'b
== word!
>> body-of o
== [a: 22 b: b]
```

I don't see a perfect solution, just choices. The best we may be able to do is to have `body-of` work like R2 and implement `spec-of` for objects to return a `make`able spec.

hiiamboris

[18:35](#msg628147f89db19366b22d5e08)`spec-of` is a lost cause without `mold/all` (or rather some intermediate de-evaluator)

greggirwin

[18:35](#msg62814802cd35b566afe878c5)This puts the choice in the user's hands, in a way that seems reasonable.

[18:36](#msg62814829949ae94006aa3014)One thing leads to another. :^\\

[18:36](#msg62814843cd938f6ea24a7225)Because @GiuseppeChillemi can't help but open Pandora's Box of Worms. :^)

hiiamboris

[18:38](#msg628148aebb0de60c723ea029)So, a ticket?

greggirwin

[18:39](#msg628148fc61f5ca3fee023a05)I hate to say we'll change it later, as that will break more code. But I also can't weigh the use cases for the R2 behavior, as I don't know if I've ever hit them. I do know I had to do some horrible workarounds with `mold` to serialize object specs there.

Yes, a ticket, and we can add a note to https://github.com/red/red/wiki/%5BDOC%5D-Object-Notes

[18:42](#msg6281499e10cfc315bc7e7d9c)I don't know where all the construction/serialized syntax notes are.

GiuseppeChillemi

[20:05](#msg62815d1661f5ca3fee02679d)@greggirwin my talent 😇

[20:07](#msg62815d7bbb0de60c723ed58a)Why not `to-block`?

greggirwin

[20:18](#msg6281602610cfc315bc7ec012)@GiuseppeChillemi add that note to the ticket please. :+1:

GiuseppeChillemi

[20:46](#msg62816688d4ef6e15af49ec06)I think that this is not a correct behaviour of REBOL2:

```
>> type? get in construct [a: 22 b: 'c] 'b
== word!
```

Construct does not reduce, so the implementation is wrong.

While RED act correctly:

```
>> type? get in construct [a: 22 b: 'c] 'b
== lit-word!
```

But this: `[a: 22 b: 'c]` is a block for `construct`, not for `make object!`  
This is a block for it: `[a: 33 b: quote 'c]`

So we have NO BLOCK RETURNED for `make` syntax, just for `construct` syntax

hiiamboris

[20:48](#msg6281672acd938f6ea24ab857)`construct` is also way too smart, can't be relied upon

GiuseppeChillemi

[20:49](#msg6281674346495f47cfe14e18)What you mean for "too smart"?

hiiamboris

[21:02](#msg62816a53d4ef6e15af49f265)https://github.com/red/REP/issues/100

GiuseppeChillemi

[21:13](#msg62816d05eaf3267f8561552c)I think you should mention it inside the ticket.

hiiamboris

[21:16](#msg62816dadfa846847c96840b2)I'm a lazy person

GiuseppeChillemi

[21:25](#msg62816fd610cfc315bc7ee51f)@greggirwin

[21:25](#msg62816fda9db19366b22db021)\[!\[CanOfWorms.png](https://files.gitter.im/5565a1d415522ed4b3e10094/h98a/thumb/CanOfWorms.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/h98a/CanOfWorms.png)

## Monday 16th May, 2022

rebolek

[05:17](#msg6281de7ffa846847c969013c)@greggirwin personally, I still would like to solve a few things before merging IO, although we are really close IMO.

GalenIvanov

[06:50](#msg6281f441eaf3267f85623f01)\[!\[WAEkFaNLbjTlhLu0BSrK1u1a7c1EpbUd03znSvyobAI.png](https://files.gitter.im/5565a1d415522ed4b3e10094/RvwH/thumb/WAEkFaNLbjTlhLu0BSrK1u1a7c1EpbUd03znSvyobAI.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/RvwH/WAEkFaNLbjTlhLu0BSrK1u1a7c1EpbUd03znSvyobAI.png)

GiuseppeChillemi

[07:43](#msg628200b6949ae94006ab92ab)😁

## Tuesday 17th May, 2022

ALANVF

[17:23](#msg6283da2610cfc315bc83934a)ok so I had a thought about Parse

[17:24](#msg6283da40bb0de60c7243b0b2)I made bytecode specification for my language's VM using a Parse-like format https://github.com/ALANVF/star/blob/master/vm/format.txt

[17:25](#msg6283da6cd30b6b44ebf231a8)in it, I use the convention

```
size: uint16
(size) rule
```

a lot

[17:25](#msg6283da7e46495f47cfe6268d)would... this actually be possible, or would I have to use a `while` rule instead?

[17:26](#msg6283dadabb0de60c7243b212)(assuming I'm using `copy size uint16` instead of `size: uint16` or whatever)

hiiamboris

[17:39](#msg6283dddfa687887f8dad463d)smth like `copy size uint16 (size: to integer! size) size skip`

ALANVF

[17:40](#msg6283ddffd4ef6e15af4ebbdc)oh interesting, so I can use `size` just directly to repeat a rule `size` # of times?

hiiamboris

[17:41](#msg6283de3f949ae94006af4ae0)yep, when it refers to an integer

ALANVF

[17:41](#msg6283de46d4ef6e15af4ebc62)oh nice

greggirwin

[17:42](#msg6283de85cd35b566afedab9e)https://github.com/red/docs/blob/master/en/parse.adoc#iteration-count

ALANVF

[17:42](#msg6283de99d4ef6e15af4ebcd5)ahhh ok

[17:43](#msg6283dec4eaf3267f8566152e)completely unrelated, why does vscode say that Red's rebol source files use "Windows 1250" text encoding? lol

greggirwin

[17:44](#msg6283def6eaf3267f856615b4)R2 doesn't understand UTF-8.

ALANVF

[17:45](#msg6283df40d30b6b44ebf23e4a)ah

[17:45](#msg6283df4e46495f47cfe63208)that's weird

greggirwin

[17:47](#msg6283df9dd4ef6e15af4ebee3)No unicode support at all. 25 years ago it wasn't as important, and it comes with a lot of overhead and pain.

ALANVF

[17:47](#msg6283dfb2d30b6b44ebf23f50)yeah that makes sense

[22:09](#msg62841d2ba687887f8dadc51e)any thoughts on adding Rebol's am/pm time format to Red? being able to do stuff like `1:00pm` would be useful for someone who doesn't use 24hr time

hiiamboris

[22:18](#msg62841f4ea687887f8dadc8cf)https://github.com/red/red/pull/5069

rebolek

[22:18](#msg62841f5010cfc315bc841f24)If it wouldn’t confuse the lexer, why not. At the first sight, I don’t think there should be a conflict with other datatype.

ALANVF

[22:19](#msg62841f84cd35b566afee30cc)it could even support `1pm`, I don't think the lexer would have issues with that

hiiamboris

[22:21](#msg62841feb14df4e44f22da81d)`am/pm` standards differ across the world and what makes sense for an american, will not for japanese, so adding it to the lexer might be tricky

ALANVF

[22:21](#msg62841ffa10cfc315bc841fc2)oh?

greggirwin

[22:36](#msg6284237610cfc315bc842633)L10N/I18N comes to bite many things, as @hiiamboris notes. It's appealing in a narrow view, but this is what high level dialects and interfaces can also handle. Red, as a data interchange format, is already huge and complex. There are even some things from Rebol that we could probably drop without issue.

ALANVF

[23:02](#msg62842985eaf3267f8566a636)how exactly is am/pm not universal? I know some areas of the world use 24 hour time, but I don't see anything else about it

[23:02](#msg62842997cd938f6ea250290f)since Red already supports 24 hour time, supporting 12 hour time would also make sense

greggirwin

[23:17](#msg62842cef61f5ca3fee07ed3d)@ALANVF use a translator to convert `1:00pm` to other langs. Is it universally the same? We \*do* want to be as expressive as possible, but also have to weigh the options and consider lexical space. e.g. if we add `units` to Red, should they use path format, or just a &lt;number&gt;&lt;unit&gt; syntax? Could there then be a conflict of another quantity type for `1p`?

It's often a fine and blurry line between convenience and value.

ALANVF

[23:19](#msg62842d9010cfc315bc84369b)it seems some languages just translate it to 24 hour time for me (lol), but I see what you mean. I didn't know am/pm was english-specific

[23:20](#msg62842daafa846847c96da122)so then, why was it included in Rebol?

greggirwin

[23:20](#msg62842dc0fa846847c96da157)What we have to ask is where the value lies. In this case, does it help to be able to write `1:00pm` in \*Red data\*, if it's only going to be normalized anyway? Sometimes yes, as in config files we give to users. But is time always local, or do we need to account for the machine or recipient's timezone? Is it still a win there, when maybe the recipient uses a different locale?

ALANVF

[23:21](#msg62842e0810cfc315bc8437ae)given that normal time literals are absolute (and ignore the locale), I would expect am/pm ones to do the same

greggirwin

[23:21](#msg62842e11cd35b566afee4be2)As to why it was included in Rebol, only Carl can say. He did the best he could, and got a lot right. Even this isn't \*wrong* in Rebol. It all comes down to choices and how much syntax sugar is good before we become syntax resistant to it. ;^)

ALANVF

[23:22](#msg62842e36d30b6b44ebf2da88)ok

greggirwin

[23:25](#msg62842ef9bb0de60c724455ed)You would, yes, as I might. But 13:00 \*is* universal (or as close as we can get), where the English locale version is not. There are many times I miss the ASCII days and only having to care about U.S. users. But that time is past. For the good of mankind we must all now suffer Unicode, DST (or not), funny timezones that change through the years, leap seconds, and so much more.

ALANVF

[23:31](#msg6284303eeaf3267f8566b1c3)I suppose so

## Wednesday 18th May, 2022

GiuseppeChillemi

[07:29](#msg6284a04241f4560c6fa6dec4)&gt; `am/pm` standards differ across the world and what makes sense for an american, will not for japanese, so adding it to the lexer might be tricky

I agree, let's leave this task to a localization library.

[10:02](#msg6284c44c1308e56363adfb3f)Another difference between Rebol and Red, but it maybe a Bug:

Rebol

```
>> select/skip [a b c d] 'a 2
== [b]
```

Red

```
>> select/skip [a b c d] 'a 2
== b
```

pekr

[10:03](#msg6284c484bd487e746b5ca3c6)Red might be actually correct, unless /only is used?

GiuseppeChillemi

[10:04](#msg6284c4a974eb0971abcc602f)`/Only` was not used in Rebol

pekr

[10:09](#msg6284c5d092865155b8c9f8e3)So it is bug in Rebol actually ....

GiuseppeChillemi

[10:09](#msg6284c5f5bd487e746b5ca5f6)I quite sure it is.

hiiamboris

[10:13](#msg6284c6dc74eb0971abcc64d6)R2 returns whole row except the key, that is a block of `skip - 1` values

[10:14](#msg6284c7011308e56363ae0186)Red follows key/value store model

GiuseppeChillemi

[10:15](#msg6284c74aaf3c8355c0b01a01)So Rebol manages it like flat blocks.  
`[key val1 val2 val2 key2 val1 val2 val3]`

[10:15](#msg6284c74ffd12f01bddb1ae83)Interesting.

[10:16](#msg6284c77a16c31238c374cc13)As a side effect, if skip size is 2, it seems a bug!

greggirwin

[16:05](#msg6285194477bd5538bd96c78b)Just a design choice in R2, which makes the common case less convenient unfortunately.

Oldes

[17:31](#msg62852d5bfd12f01bddb28e8c)There is a related issue for R3 https://github.com/Oldes/Rebol-issues/issues/730. Currently R3 is same like Red, but I think it could work like in R2 with `/only` refinement.

greggirwin

[17:32](#msg62852dbcfd12f01bddb28f3f)`/only` is already used for the key though.

[17:33](#msg62852de7af3c8355c0b0f73f)There was quite a bit of chat about this somewhere, just don't know where right now.

Oldes

[17:35](#msg62852e63978f8b71a7d6a63e)And also http://www.rebol.net/r3blogs/0194.html

[17:38](#msg62852f1dbd487e746b5d8a95)Yes... `/only` is not usable for this:/

greggirwin

[17:39](#msg62852f4a16c31238c375af46)I recall doing some analysis, and there were not that many cases where `/skip <> 2`.

Oldes

[17:41](#msg62852faec5aac73747c56793)Question is, if one should not use `map!` instead of `block!` for simple key/value data

greggirwin

[17:42](#msg62852ff174eb0971abcd439d)Limits on what can be a key in maps, and no possibility of duplicate keys, so different possible use cases.

Oldes

[17:43](#msg6285303092865155b8cae54d)If you have duplicate keys, you would not want `select` anyway... but `find` instead (so one could find more than one result).

GiuseppeChillemi

[17:44](#msg62853087c5aac73747c568db)I have `select-skip` created function which returns any key position other than the second and also multiple selections in the block of .

[17:45](#msg628530cca726cf495bb70122)Also it is able to select not only on `pos1` but also in any of inside the  range

[17:46](#msg6285310e74eb0971abcd4604)Rebol version is nice for flat data, which I remember someone told me it is many times faster that the same version redone in Rebol.

greggirwin

[18:19](#msg628538c4f90a08496251777a)@Oldes true.

hiiamboris

[18:45](#msg62853ec78e47ce374abfe219)I think 80% of the time I'm using key/value storage, the key is an object :)

GiuseppeChillemi

[18:47](#msg62853f4caf3c8355c0b11dc7)@Oldes But if you work with unique IDs, `select/skip` is perfect!

[19:04](#msg62854359c5aac73747c5905a)Gitter is giving me "inception" like problems:

[19:05](#msg6285435e92865155b8cb0e95)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/bqOY/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/bqOY/image.png)

[19:05](#msg6285437bbd487e746b5db6f7)This chat message have been mixed with RED/BUGS

hiiamboris

[19:06](#msg628543d11308e56363af18eb)Happens all the time

[19:07](#msg628543f1bd487e746b5db7d3)Click on a room name then another name before first is loaded

GiuseppeChillemi

[19:09](#msg6285447077bd5538bd972254)But thanks to this I have found you have already talked about this 3 months ago:  
https://gitter.im/red/bugs?at=6203e89b41e3293d65e40631

[19:09](#msg6285448177bd5538bd972260)We are old shoes which forgets what we have done!

Oldes

[20:11](#msg628552fa16c31238c375f931)At least we know, that Gregg preferred R2 version in year 2009 and Red/R3 version 13 years later ;-)

GiuseppeChillemi

[20:14](#msg6285539c1308e56363af3a0b)🤣🤣🤣

[20:15](#msg628553d616c31238c375fb5b)I have the same problem but worse: sometime I change my preference on a design in a couple of weeks.

Oldes

[20:15](#msg628553f71308e56363af3acd)I think that current version may be more useful.. it allows to select from flat blocks not just by first column... this can be used to select third value according the key in the second column:

```
>> select/skip next [a a x  b b y  c c z] 'b 3
== y
```

In R2 it would return a block with a value \_from the next row_

greggirwin

[20:21](#msg6285553ec5aac73747c5b734)I try to keep an open mind. It may be slow, but it's open.

GiuseppeChillemi

[20:29](#msg628557438e47ce374ac018c2)In this situation I would like `forskip` to be implemented so we can check and pick any column and then `break`

Oldes

[20:31](#msg628557891308e56363af40f5)It would be much slower.

[20:35](#msg6285587afd12f01bddb2ea3f)In R3:

```
Running 2 code blocks 10 times.
---------------------------------------------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (1μs)         | 4      | 0      | 0      | 0           | [select/skip next tbl 'b 3]
2.75x (3μs)        | 8      | 0      | 0      | 0           | [forskip tbl 3 [if tbl/2 = 'b [break/return tbl/3]]]
---------------------------------------------------------------------------------------------------------------------
```

GiuseppeChillemi

[20:37](#msg628558f574eb0971abcd9dae)Yes, but I like functions that are more readable as:  
`select/skip/pos [a a x b b y c c z] 'b 3 2x3` (search on 2, pick on 3)

[20:38](#msg6285595816c31238c3760668)&gt; It would be much slower

I see

Oldes

[20:39](#msg6285597ef90a08496251c047)I can imagine `select/skip tbl 'b 3x2`

GiuseppeChillemi

[20:40](#msg628559b5af3c8355c0b15bbb)3 = size, 2 = column returned?

Oldes

[20:41](#msg628559f2af3c8355c0b15c39)Yes.. but I'm not sure if it is so needed. Btw.. all these selects on data should be done by the database in your case.

GiuseppeChillemi

[20:43](#msg62855a6892865155b8cb40d4)Are you referring to my needs for ODBC or to some Red block usage?

Oldes

[20:53](#msg62855cb6af3c8355c0b16294)On your ODBC.. but I don't know what all you do... I just wanted to say, that it should be always faster to use correct query to get just filtered data than get 10000 lines of data and do manual filtering on it. The database should be optimised for the task.

GiuseppeChillemi

[20:54](#msg62855cfa74eb0971abcda6ab)You are right but by now I am experimenting a lot inside red/rebol with data extractions. It's funny!

[22:00](#msg62856c808e47ce374ac04280)However, I have seen the blog chat a `slice!` datatype was planned.

## Thursday 19th May, 2022

Nuc1eoN\_gitlab

[10:15](#msg628618be4aa6c31dca0c8ea5)Hello, it has been a long time since Ive looked into red! Wasnt there supposed to be a new website?

greggirwin

[12:45](#msg62863be8c61b987d33b7e454)It's still in beta, but we're doing some new server work now so we can make it live. Thanks for remembering!

ldci

[18:57](#msg62869306db6f627d258e27e0)Hi all. Is there a way to save console settings on Red Windows?

hiiamboris

[19:01](#msg628694124aa6c31dca0d959d)`_save-cfg`

ldci

[19:13](#msg628696cdda330517ff843dce)@hiiamboris. Thanks, this should be added in the setting menu :-)

hiiamboris

[19:21](#msg628698b5da330517ff844090)what's the need?

ldci

[19:24](#msg62869958c9382316a611f9ba)@hiiamboris. I’m a macOS user and I appreciate to create different terminal settings according to my needs :-)

[19:26](#msg628699dac9382316a611faa7)But it’s OK for me

hiiamboris

[19:43](#msg62869dd9db6f627d258e3ce1)## \[Spaces](https://codeberg.org/hiiamboris/red-spaces) now support \[VID/S](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/vid.red) - visual interface dialect for spaces

Something @pekr was dreaming about all the time ☻ It is somewhat similar to VID, but also has big differences given completely different architecture it's based on.

\[popups-test](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/tests/popups-test.red) is still the biggest showcase of it, but all other \[tests](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/tests) were rewritten as well, and are hopefully clear enough for humans.

One limitation I deliberately left is the mandatory declaration of `host` face on which spaces are rendered. My previous idea was to replace constructs like `host [vlist [...]]` with just `vlist [...]` but given general incompatibility of VID and VID/S one may write `VID/S` facets after `vlist [...]` in VID and get confused why it doesn't work. So `host` stays as an explicit portal from VID into VID/S.

[19:48](#msg62869f184aa6c31dca0dacd9)Of note, it uses a modular design, where each style defines the supported set and meaning of flags and datatypes that can be used to alter it in the layout block.

greggirwin

[19:56](#msg6286a0fa7df86c141e92beba)Thanks for the update @hiiamboris. It will be a bit before I can review it. Maybe in some downtime next week.

GiuseppeChillemi

[20:12](#msg6286a4c77df86c141e92c74a)@hiiamboris there are some missing GIF in the demo section

hiiamboris

[20:19](#msg6286a63cda330517ff845b20)Where?

[20:20](#msg6286a676c61b987d33b8caab)Oh I see

[20:20](#msg6286a695da330517ff845c10)I should use another gif hosting then, or maybe the repo

GiuseppeChillemi

[20:32](#msg6286a94df8daa71e078a0770)Great Work, looking ahead to use your creature

ALANVF

[21:14](#msg6286b31a67db9a59dbd993a7)is there a reason why a leading `|` doesn't work as expected in Parse?

[21:14](#msg6286b346e393a31806161617)for example

```
parse "abc" [
	| "abc"
	| "def"
]
```

[21:15](#msg6286b36cc9382316a6122fd5)currently it's interpreted as being an "empty" branch, which is what ends up getting matched

[21:15](#msg6286b377da330517ff8473b8)I'm not sure why one would want this behavior

hiiamboris

[21:23](#msg6286b54eef00bd1dc6ec859e)It works as expected. An empty rule, same as `none`, which always succeeds.

ALANVF

[21:25](#msg6286b5b067db9a59dbd99847)I'm fully aware it works as expected, I'm just wondering \*why* it's even a thing in the first place

[21:25](#msg6286b5d9ef00bd1dc6ec8707)like, I see a much better use case for having a leading `|` be, uh, leading and not create an implicit empty rule

[21:25](#msg6286b5e4c9382316a6123587)if you want an empty branch, use `none` explicitly

[21:26](#msg6286b610c9382316a61235d4)trying to format the whitespace for the first branch is otherwise ugly, and this would be more of a QoL feature than anything

hiiamboris

[21:26](#msg6286b610c61b987d33b8ea08)How can it not be a thing? What's the difference between parser states between explicit `[]` and e.g. `[skip]` after matching `skip`?

ALANVF

[21:27](#msg6286b63467db9a59dbd998f9)I'm not sure what you're asking here

hiiamboris

[21:27](#msg6286b64606a77e1e18452446)Think on it. Parse is a state machine.

ALANVF

[21:27](#msg6286b65ac9382316a6123619)like, are you talking about the difference between `[] skip` and `[skip]`?

[21:28](#msg6286b68def00bd1dc6ec88af)I'm specifically referring to the behavior of `[ | ... | ... ]` as opposed to `[ ... | ... ]`

hiiamboris

[21:29](#msg6286b69dd126691416a5cfc6)No. Evaluation of `[skip]` rule when `skip` succeeds ends up in `next [skip]` which equals `[]`. If it fails, how can parse ever match anything?

greggirwin

[21:29](#msg6286b6a94e38f759e27b2960)&gt; trying to format the whitespace for the first branch is otherwise ugly

Special case semantics in order to support formatting preferences is probably not something we want to do. I get it though, because I want things to line up and we still have religious wars in tabs vs spaces.

ALANVF

[21:30](#msg6286b6d8da83520ac33c319d)in many parsing DSLs that I've used, a leading `|` (or whatever is used for alt branches) is ignored and is just used for formatting code

[21:30](#msg6286b6f94e38f759e27b29d9)I would argue that it's more intuitive for those who've used other DSLs anyways

hiiamboris

[21:30](#msg6286b70d06a77e1e18452592)Have an example?

ALANVF

[21:31](#msg6286b716c9382316a6123718)example of a DSL that does this?

greggirwin

[21:31](#msg6286b719db6f627d258e7301)Curly braces and parens around args would be more intuitive for them as well.

ALANVF

[21:31](#msg6286b72fdeea5616bbb7176e)sure, but this isn't specifically about Red's core syntax

[21:31](#msg6286b73edeea5616bbb7178c)Parse is a DSL that has similar functionality to existing tools

greggirwin

[21:32](#msg6286b754da83520ac33c3229)But you just made that your argument. :^)

[21:32](#msg6286b761deea5616bbb717dd)i.e. "They do it, so we should too."

ALANVF

[21:32](#msg6286b7734e38f759e27b2a5e)it just goes back to the "unintuitive" thing

[21:32](#msg6286b789c9382316a61238c6)and the fact that there's no reasonable use case for the existing behavior

greggirwin

[21:33](#msg6286b79cdeea5616bbb7180d)Intuitiveness doesn't really exist. Only prior experience and familiarity.

hiiamboris

[21:33](#msg6286b7a4deea5616bbb71812)Exactly

ALANVF

[21:33](#msg6286b7bd09eea00adea1fc6f)then what about the use case?

[21:34](#msg6286b7d2deea5616bbb718a5)obviously Red has a good reason for its function argument syntax and mechanics

hiiamboris

[21:34](#msg6286b7dc09eea00adea1fca0)Less special cases, less complexity

ALANVF

[21:34](#msg6286b7e9da330517ff847d0a)however I have never seen `[ | ... ]` used intentionally, not even in Red's entire codebase

hiiamboris

[21:34](#msg6286b80106a77e1e18452773)Not all rules are written by hand

ALANVF

[21:35](#msg6286b828d126691416a5d390)then could you think of a use for this? even for autogenerated grammars?

[21:36](#msg6286b8694e38f759e27b2c6c)I just find it strange to continue supporting such a thing, that's all

greggirwin

[21:36](#msg6286b8704aa6c31dca0de17d)&gt; and the fact that there's no reasonable use case for the existing behavior

See, now you're jumping too quickly. ;^) We \*could* argue that any empty rule is not allowed. Or we can say that the design of `parse` is that an empty rule matches like it does now, and that's OK too. Feel free to make the explicit `none` rule a wish ticket. What you're proposing, though, is an \*exception* strictly for formatting purposes, which is not something we want to do.

ALANVF

[21:38](#msg6286b8c94e38f759e27b2d5e)noted

greggirwin

[21:41](#msg6286b98bdeea5616bbb71be2)@ALANVF here's my teaching moment for the day. As you dive into Red, and also the community, listen to others and show in your responses that you're considering what they said. When new people say right off that "Red is wrong", it's easy for us to dig our heels in. Some arguments are won on technical merit and solid defense of a position. Others are trickier, because there is no clear right or wrong in some design choices.

hiiamboris

[21:41](#msg6286b9a6da330517ff847f6a)Use case is e.g. short circuiting some condition block when composing it. E.g. if first condition is known to always succeed. But I just made that up. Real reasons as I see them were, again, simplicity (e.g. for me it would be un-intuitive for empty rule to behave differently depending on context), and performance (otherwise each alternative would have to make a look-behind).

greggirwin

[21:43](#msg6286b9f306a77e1e18452b6e)It's often the case that @hiiamboris will note an issue, and I want to tell him he's wrong. But then the SOB has already written a full analysis and shown he's tried to see things the way they are, and I \*can't* tell him he's wrong, totally ruining my day.

hiiamboris

[21:43](#msg6286ba11db6f627d258e78f6):D :D :D

greggirwin

[21:44](#msg6286ba4c06a77e1e18452c30):^)

ALANVF

[21:45](#msg6286ba5dd126691416a5d75e)I suppose I have a thing for designing things from the user's perspective

hiiamboris

[21:45](#msg6286ba7d4e38f759e27b3099)Users are different ;)

ALANVF

[21:46](#msg6286baa64e38f759e27b30fb)they are, and that's part of it

[21:47](#msg6286bad57df86c141e92f1e7)say there are some users who would want the feature I'm proposing, and the majority of others who want the feature that already exists

[21:47](#msg6286baf1c9382316a6123f7e)even though the majority clearly wins, there are still the users in the minority who are often ignored

greggirwin

[21:47](#msg6286bafce393a31806162512)Most of us do, at least sometimes. The problem is that most times "the user" is us, and we can't see our own bias clearly. My code, of course, is always clear and designed properly...for simple-minded users, while Boris' code (again, as an example, since he's here) is for users with a more diabolical, er, "advanced" perspective.

ALANVF

[21:48](#msg6286bb1e4aa6c31dca0de5e7)of course

greggirwin

[21:48](#msg6286bb26ef00bd1dc6ec9177)@ALANVF absolutely. We will never please everyone.

ALANVF

[21:48](#msg6286bb4906a77e1e18452e0b)however I find it important to consider all sides, and sometimes even compromise, rather than saying "this is how it's been done, and many people are fine with it, so it's here to stay"

[21:49](#msg6286bb6267db9a59dbd9a385)this is of course how I designed my language

[21:50](#msg6286bba6c9382316a6124129)though I did go off the rails a bit before, I still think it's important to look at all sides of any design issue

greggirwin

[21:50](#msg6286bbba09eea00adea203f8)Yes, and you will find that we are generally open to alternate views. Changes do have to be strongly defended though, because so much thought has gone into many aspects already. There are always gaps of course, and things done for expedience or even accidentally.

hiiamboris

[21:51](#msg6286bbd006a77e1e18452f3a)On style, here's how I write alt-rules https://codeberg.org/hiiamboris/red-common/src/branch/master/composite.red#L60

greggirwin

[21:52](#msg6286bc164e38f759e27b3430)It can be hard work, struggling with these choices, but also rewarding and enlightening. If it weren't for all the people I've debated with and learned from, I wouldn't be much of a programmer, or a person.

ALANVF

[21:53](#msg6286bc634e38f759e27b34af)@hiiamboris sure, but it still doesn't look as great because `|` often acts not only as a divider or "indentation", but also as a way to identify the beginning of a branch

[21:53](#msg6286bc72ef00bd1dc6ec93f6)yeah I get that

greggirwin

[21:54](#msg6286bc95e393a31806162873)Ah, `composite`. When Boris and I are old men we will still debate and change sides on the macro-or-not view. Just when he \*almost* had me, he said "But there is a use case..." ;^)

[21:59](#msg6286bddac61b987d33b8f928)Here's a fun thought experiment for you @ALANVF, which you can tinker with in code. Could you add a "begin" operator to do what you want? e.g.

```
parse "abc" [
    ! "abc"
    | "def"
]
```

ALANVF

[22:00](#msg6286bdfa7df86c141e92f934)well I've thought about doing this, something like `!: []` would probably work for that just fine

greggirwin

[22:00](#msg6286be06da83520ac33c40a2)You're quick. :^)

ALANVF

[22:01](#msg6286be21e393a31806162b98)I mean it works, but it's a workaround for a simple feature (which is something I highly despise in languages)

[22:02](#msg6286be5ae393a31806162bf4)I feel like there are better solutions

greggirwin

[22:04](#msg6286bed1da330517ff8489ba)It's not a workaround, it's Red being flexible enough to let you do what you want to do, even though it disagrees.

If you feel like there are better solutions, by all means, write them up.

Try not to judge languages too harshly. Workarounds are the compromises of programming, and without some level of compromise it's hard to accomplish anything.

[22:05](#msg6286bf23c61b987d33b8fc69)To be clear, you do understand that your view is not "right" here, yes? It's just your view, and a different choice. Not better, just different.

ALANVF

[22:05](#msg6286bf2e7df86c141e92fcaa)yeah

greggirwin

[22:05](#msg6286bf4209eea00adea209bd):+1:

ALANVF

[22:06](#msg6286bf6506a77e1e1845352c)it's just how I see things. I do try not to judge design choices to harshly, but in the case of languages like Haxe, there becomes enough "workarounds" and such that it becomes painful to accomplish anything

greggirwin

[22:07](#msg6286bf8fda330517ff848b5e)You'll find agreement here that not all languages are equally well designed. ;^)

ALANVF

[22:07](#msg6286bf95f8daa71e078a3192)of course

[22:07](#msg6286bfa2f8daa71e078a31ab)Red can get away with it because it's a very powerful homoiconic language, however many languages are not and still try to act like it's no biggie

[22:08](#msg6286bfde06a77e1e18453622)however it can get to a point where you spend more time working around the language than working with it

## Friday 20th May, 2022

GiuseppeChillemi

[09:18](#msg62875ccb4e38f759e27c5e84)So, the rule is: if the function is on the stack, its context is available to other functions, otherwise you get a `context not available error`

```
f1: func [arg] [f2: func [x][probe (get x) * 2] f2 'arg] 
>> f1 22
44
```

```
f1: func [arg] ['arg] 
f2: func [x][probe (get x) * 2]
>> f2 f1 22
*** Script Error: context for arg is not available
*** Where: get
*** Near : x
*** Stack: f2 probe  

>>
```

Oldes

[09:25](#msg62875e93ef00bd1dc6edb8b9)I don't understand, what you want to do, but in your case, first is evaluated `f1 22` with result `arg`, which has no context.

[09:26](#msg62875ee14aa6c31dca0f17f3)

```
>> f1: func [arg] [:arg]
>> f2: func [x][probe (get x) * 2]
>> f2 f1 22
44
== 44
```

[09:27](#msg62875f17da83520ac33d737b)(at least in R3, does not work in Red, but you probably want something totally different anyway)

GiuseppeChillemi

[10:52](#msg628772ea06a77e1e1846823b)I simply want to underline when the context of ARG is available, as rule. If the function has not returned, you can pass one of it words to another one, otherwhise, no context is available.

[10:53](#msg6287733cc9382316a6139f84)I have written this, so if there is an error in this rule, someone will correct me.

greggirwin

[19:16](#msg6287e91d7df86c141e954b98)Not everyone here monitors the red/gui-branch room, but check this out: https://gitter.im/red/red/gui-branch?at=628754784aa6c31dca0f02e4

GiuseppeChillemi

[19:50](#msg6287f11dda330517ff86ef8b)Yes, there are a lot of subtle differences between Red and Rebol.

Red

```
>> a: ["hello" world]
== ["hello" world]
>> a/"hello"
== world
>>
```

Rebol

```
>> a: ["hello" world]
== ["hello" world]
>> a/"hello"
** Syntax Error: Invalid path -- a/
** Near: (line 1) a/"hello"
>>
```

A lot are really nice!

ALANVF

[19:51](#msg6287f1474aa6c31dca1045a5)wait, that's a thing in red? I thought that was only for `hash!`s

GiuseppeChillemi

[19:52](#msg6287f1887df86c141e955c70)Yes, in Rebol you must use: `a/("hello")`

[19:52](#msg6287f196ef00bd1dc6eef1a1)In Red you have more freedom

ALANVF

[19:59](#msg6287f32ac61b987d33bb62fc)ah ok

[21:16](#msg6288053fef00bd1dc6ef1bd0)curious, what's the purpose of the `more` member for `function!`s? https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L263

[21:17](#msg6288056d7df86c141e958360)is it the body of the function?

[21:17](#msg628805827df86c141e95838d)ohhhh it's a node of other fields

mosee101

[23:07](#msg62881f357df86c141e95b64e)hello, is there a way for Red/Rebol to detect a keypress down on keyboard, and after detecting the keypress, have red press another keyboard key...can i also do this with the mouse clicks?

## Saturday 21st May, 2022

gltewalt:matrix.org

[01:39](#msg628842e967db9a59dbdca474)Yes, maybe, yes

gltewalt

[02:18](#msg62884c0df8daa71e078d4940)

```
view [base 300x300 "Type some keys, and view your console." on-key-down [print mold event/key]]
```

[02:31](#msg62884eeb7df86c141e96109b)

```
view [
    base 300x300 "Type some keys, and view your console." 
    on-key-down [if event/key = #"L" [print "You found the L key!"]]
]
```

[02:49](#msg6288532ac9382316a615691f)Here are the event names:  
https://github.com/red/docs/blob/master/en/view.adoc#event-names

[02:50](#msg6288537cc9382316a61569d6)An `actor` is a function for an event.  
https://github.com/red/docs/blob/master/en/vid.adoc#actors

[02:51](#msg62885396e393a31806194d7e)Example: `on-key-down`

[02:52](#msg628853de4aa6c31dca10ffc0)If you mean something like SendKeys, I believe @toomasv had made someting for Windows

[02:53](#msg62885420d126691416a8e709)Check out the `red/help`, and `red/gui-branch` rooms for more help

## Sunday 22nd May, 2022

GiuseppeChillemi

[12:01](#msg628a261edeea5616bbbdb743)Another interesting discovery today:

Rebol:

```
a: [b c]
get 'a/b

** Script Error: get expected word argument of type: any-word object none
** Where: halt-view
** Near: get 'a/b

a: make object! [b: 'c]
get 'a/b

** Script Error: get expected word argument of type: any-word object none
** Where: halt-view
** Near: get 'a/b
```

Red

```
a: [b c]
get 'a/b
== c

a: make object! [b: 'c]
get 'a/b
== c
```

So, in Red you can `get` path while in Rebol you must use `do`

The only thing I don't like is the error I receive is I try to access a non existent element:

```
a: [b c]
get 'a/c
*** Script Error: cannot access c in path a/c
*** Where: get
*** Near : 'a/c
*** Stack:  

>>
```

[12:02](#msg628a265e4aa6c31dca145b53)It is incongruent with paths result on non existent paths, which `none`. Also forces me to use the slow `try` method.

hiiamboris

[12:03](#msg628a2677ef00bd1dc6f30440)https://github.com/red/REP/issues/113

GiuseppeChillemi

[12:04](#msg628a26d006a77e1e184b9bab)We are facing the same problems...

## Tuesday 24th May, 2022

Oldes

[08:42](#msg628c9a79e393a31806218fe6)@GiuseppeChillemi In Rebol3 it works same like in Red btw.

[08:45](#msg628c9b0d09eea00adead54bd)I quickly checked what could be done to have the `get/safe` functionality (in Rebol, not in Red) and unfortunately I think, that the needed additions would slow down every path access, so I'm not sure, if it would be a good change.

[08:48](#msg628c9bdff8daa71e079579dd)Also... for your last case `a: [b c] get 'a/c` I have `none` in both Red and in R3 as expected.

[08:50](#msg628c9c4ac9382316a61da9a2)I bet, the error message is for: `a: make object! [b: 'c] get 'a/c`

hiiamboris

[09:00](#msg628c9eb8da330517ff8feb19)&gt; needed additions would slow down every path access

[09:01](#msg628c9eda67db9a59dbe51074)Just add a catch and enter `get` again. Why would it affect other gets?

GiuseppeChillemi

[09:01](#msg628c9f0209eea00adead5df0)I remember you are right, maybe I have made a mistake copying/pasting, as you have noted for Hiiamboris on issue 113. 😁

[10:49](#msg628cb848da330517ff901cbd)Things I didn't know in both Rebol and Red:

```
>> get make object! [a: 22 b: 33]
== [22 33]
```

[11:13](#msg628cbdbddb6f627d259a11f0) Having `none!` returned by `get` in case of a non-existent context word in object, forces you into a further problem: it you `get` a word that has `none` as a value, you can't make a distinction between it and a path which leads to nowhere. In series, you still can still do it as it is a word.

`Series!`

```
>> s: [a b none]
== [a b none]

>> type? s/b
== word!
>> 

>> type? get 's/b 
== word!
>> 

>> type? get 's/c
== none!
>>
```

`Object!`

```
>> s: make object! [b: none]
== make object! [
    b: none
]

>> type? s/b
== none!
>> 

>> type? get 's/b
== none!
>> 

;--- And when implemented:

>> type? get 's/c
== none!
```

[11:17](#msg628cbec5e393a3180621d9ba)My personal proposal: implement `exists? 's/b` so it will return `true` or `false`.

hiiamboris

[11:21](#msg628cbfb44e38f759e286b5bf)make a rep

GiuseppeChillemi

[11:21](#msg628cbfd0da83520ac347fa18)Do you think it is a valid proposal?

hiiamboris

[11:23](#msg628cc02fda83520ac347fac4)well, I had a \[shot at it](https://codeberg.org/hiiamboris/red-common/src/commit/c4f42f423308d9688f2b293aa219fc9ece5765f2/sift-locate.red#L29)

[11:24](#msg628cc089c61b987d33c4924a)of course it would be better to extend `exists?` routine to paths

[11:25](#msg628cc0c667db9a59dbe555c7)still, it won't replace `get/safe` since this is where we want max juice

GiuseppeChillemi

[11:45](#msg628cc56fe393a3180621e718)`get-safe` should be even faster as you don't process the refinement.

[11:46](#msg628cc597ef00bd1dc6f81bf6)However, I am for `exists?` to check for paths.

hiiamboris

[12:25](#msg628cced306a77e1e1850e29f)you can combine gets for none case: `all [get-safe 'path none <> get 'path]`

GiuseppeChillemi

[12:55](#msg628cd5a9db6f627d259a43e4)Yes, it is another way but `exists? 'Path` is more human readable.

greggirwin

[16:52](#msg628d0d4cc61b987d33c53032)Returning `none` for non-existent keys is always a tricky choice. Red decided to expand that behavior, because you still have the option to check if keys exist, e.g. using `in` for objects or `find` for series. `Find` was extended to maps, which returns the key, so it could do the same for objects. I'm all for `exists?` being a mezzanine, so it's easier to play with in this regrard, but `find` on objects seems enough for now.

ALANVF

[17:39](#msg628d183d4e38f759e2877291)are there any docs for understanding how the lexer transitions work in the R/S Red lexer?

GiuseppeChillemi

[17:46](#msg628d1a0667db9a59dbe61c04)I think only Doc can answer your question about this topic.

ALANVF

[18:00](#msg628d1d26d126691416b25f00)who?

GiuseppeChillemi

[18:00](#msg628d1d354e38f759e2877d20)The creator of Red

ALANVF

[18:00](#msg628d1d3be393a31806229ef2)ah

toomasv

[18:03](#msg628d1de4deea5616bbc3857d)@ALANVF Do you mean something like \[this](https://raw.githubusercontent.com/red/red/master/docs/lexer/lexer-states.txt)?

ALANVF

[18:03](#msg628d1df8c9382316a61ebe0f)ah that's very helpful, thanks!

toomasv

[18:04](#msg628d1e1b06a77e1e18518843)You are welcome!

ALANVF

[18:14](#msg628d206fe393a3180622a579)@toomasv curious, how are the transitions listed there mapped to \[this](https://github.com/red/red/blob/master/runtime/lexer-transitions.reds#L112)?

[18:14](#msg628d209209eea00adeae6c82)I'd like to fix an issue related to set-paths (#5137), but I'm not sure how to edit the transitions

toomasv

[18:17](#msg628d212e4aa6c31dca1a4819)

```
_     _
 \(ö)/
```

ALANVF

[18:17](#msg628d2137f8daa71e07968cfd)excellent

[18:17](#msg628d213b06a77e1e18518e36)time to do it the hard way

[18:18](#msg628d21627df86c141e9f6110)or perhaps... nenad knows?

toomasv

[18:19](#msg628d219cdeea5616bbc38e91)Sure he knows.

ALANVF

[18:20](#msg628d220be393a3180622a8a8)@dockimbel would you happen to know how \[the lexer transitions](https://github.com/red/red/blob/master/runtime/lexer-transitions.reds#L112) are mapped to \[this](https://raw.githubusercontent.com/red/red/master/docs/lexer/lexer-states.txt)? I'm looking to fix #5137 and I think I know how to fix it, but idk how to edit the transitions

hiiamboris

[18:27](#msg628d237dda83520ac348cfde)he hasn't visited gitter in a year or more

ALANVF

[18:27](#msg628d238ec61b987d33c55bb6)hmm

hiiamboris

[18:28](#msg628d23b609eea00adeae7275)thought everything is easy here? ;)

GiuseppeChillemi

[18:37](#msg628d25ebda330517ff9102a0)@greggirwin on mezzanine level it would be a lot slower, while on R/S level `exists?` would go really fast. If you use it tied to a `get` or `pick` function on strict loops, it will be the turtle attached to the Ferrari.

toomasv

[19:34](#msg628d33364e38f759e287ac3e)@ALANVF I forwarded your question, let's see...

greggirwin

[19:48](#msg628d36a6e393a3180622d233)@GiuseppeChillemi as a mezz `exists?` would just dispatch to datatype actions. It may be a bit slower, but you can still go around it, directly to the action if you need the speed. Right now it only works for files, which means file system access, which \*should* be slower than any mezz overhead.

toomasv

[20:08](#msg628d3b4cc61b987d33c58a62)@ALANVF @dockimbel pointed to the end of the \[blog article](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html).

ALANVF

[20:14](#msg628d3c8cc9382316a61ef4fe)@toomasv that's very helpful, thanks :+1:

GiuseppeChillemi

[20:55](#msg628d465de393a3180622f20a)Could someone suggest good documentation to state machines, to understand how they work?

[21:00](#msg628d4755da330517ff914a77)@greggirwin  
&gt; @GiuseppeChillemi as a mezz `exists?` would just dispatch to datatype actions. It may be a bit slower, but you can still go around it, directly to the action if you need the speed. Right now it only works for files, which means file system access, which \*should* be slower than any mezz overhead.

Oh, yes, the file system is the real turtle if the path belongs to a file. But I don't know internally how many steps and code `exists?` would take to decode the path to the context it points or to the destination of other series.

[21:01](#msg628d479c4aa6c31dca1a95a0)So I suppose it would be at least 10x for internal structures.

hiiamboris

[21:07](#msg628d4923d126691416b2b771)@GiuseppeChillemi just draw a graph of state transitions and conditions when it happens and here's a state machine

[21:08](#msg628d4939da330517ff914e60)consider tri-state button as simplest example

GiuseppeChillemi

[21:09](#msg628d4975da330517ff914ef4)What represents a "state"?

hiiamboris

[21:09](#msg628d498cc61b987d33c5a857)any discrete thing - bit, integer, word

GiuseppeChillemi

[21:10](#msg628d49a8db6f627d259b396e)So the translation is based on the flow of the text stream?

hiiamboris

[21:10](#msg628d49c44aa6c31dca1a998b)binary stream, but yes

GiuseppeChillemi

[21:11](#msg628d4a1ac9382316a61f111b)Could you make just one example of how a stream event (please describe it) trigger the change and the target of the change?

[21:12](#msg628d4a204aa6c31dca1a9a10)(please!)

hiiamboris

[21:14](#msg628d4aa5ef00bd1dc6f9336d)e.g. you get `,` char in a stream (an event!), which would switch `integer` state into `float` state, but would switch `word` state into `error` state

GiuseppeChillemi

[21:15](#msg628d4b04deea5616bbc3e398)Ohhh, finally the topic is clear, tomorrow I will rewrite the whole Red lexer state machine!

hiiamboris

[21:15](#msg628d4b0c4aa6c31dca1a9b7c):)

GiuseppeChillemi

[21:16](#msg628d4b1806a77e1e1851e386)Thank you for your time.

[21:16](#msg628d4b284aa6c31dca1a9c09)This mechanism resembles me the Amiga HAM mode.

[21:16](#msg628d4b4af8daa71e0796e145)Do you know how it works?

hiiamboris

[21:17](#msg628d4b50c61b987d33c5aadb)nope

GiuseppeChillemi

[21:27](#msg628d4dbcdb6f627d259b4127)On Amiga, you had 4bit RGB levels, totaling 12bit: 4096 colors. Due to the low bandwidth of the memory bus, you were able to see 64 colors max. With HAM (Hold And Modify), the display chip was able to display all 4096 colors using 6 bits. The trick was to retain the previous color "state" (12bit) of the last pixel and then change only one component in the next pixel, using 6bit(4+2 for target) per memory fetch cycle. This was needed to decrease because the change of just 4 bits of a component, would nearly match the new target color needed to display photographic images.

[21:30](#msg628d4e92c9382316a61f19bf)Obviously for a full color change, you need 3 pixel.

[21:32](#msg628d4ee7da330517ff915859)It was terrible for images containing text, but fantastic for photos. no one had 4096 colors images in 1995

[21:37](#msg628d502509eea00adeaec8fb)Here is a full explanation of the \[HAM Mode](https://www.markwrobel.dk/post/amiga-machine-code-letter12-ham/) and \[here](https://retrocomputing.stackexchange.com/questions/151/did-any-amiga-500-games-or-programs-apart-from-paint-programs-use-more-than-32)

## Wednesday 25th May, 2022

greggirwin

[00:38](#msg628d7a9e67db9a59dbe6d936)@GiuseppeChillemi remind me in a week or so, and I will post something on FSMs.

[00:39](#msg628d7ac64aa6c31dca1af947)&gt; I don't know internally how many steps and code exists? would take to decode the path to the context it points or to the destination of other series.

This is often the case, and why the default should be "don't optimize \*anything* until you know it's worth it."

toomasv

[03:42](#msg628da5bbda83520ac349c666)@GiuseppeChillemi

&gt; Could someone suggest good documentation to state machines, to understand how they work?

Any program you write is a kind of state machine. You consider what happens and what changes when that happens. \[View](https://github.com/red/docs/blob/master/en/view.adoc) system is a state machine \*par excellence\*. You set up a machine to wait for events and then handle these by actors.

\[Finite State Machine](https://en.wikipedia.org/wiki/Finite-state\_machine)  
\[State Machines](https://www.itemis.com/en/yakindu/state-machine/documentation/user-guide/sclang\_state\_machine\_basics)  
\[Statecharts](https://www.wisdom.weizmann.ac.il/~dharel/SCANNED.PAPERS/Statecharts.pdf)

GiuseppeChillemi

[13:32](#msg628e2fd84e38f759e28998f3)Thank you everyone

[13:32](#msg628e2fe4db6f627d259cee2b)Ok @greggirwin I will remind you

## Friday 27th May, 2022

GiuseppeChillemi

[21:37](#msg629144a67df86c141ea7c2f0)I don't know who is the writer, but I have just found a thesis from \*Dr. Thomas C. Royko* entitled \*The Dynamic Mapping Architecture\*. With Red and Rebol being the main actors, together with DSL and Parse, \[look at it!](https://etd.ohiolink.edu/apexprod/rws\_etd/send\_file/send?accession=toledo1639760375713532&amp;disposition=inline)

hiiamboris

[22:09](#msg62914c234e38f759e28fe48d)Wow, academia recognizes Redbol

ALANVF

[22:10](#msg62914c43da330517ff996f30)I've heard it mentioned in the PL&amp;D community, so I'm not completely surprised

GiuseppeChillemi

[23:57](#msg62916570deea5616bbcc2645)After a little investigation, I have found our \[hero](https://stackoverflow.com/users/3314921/iceflow19) thanks to \[this](https://stackoverflow.com/questions/36603785/when-do-red-looping-structures-require-interpretation)

Here is how he describes himself:  
\*On the side I often like studying linguistics (both natural and programmatic) which is what started my interest in the Rebol, and later Red, programming languages. I'm an outspoken proponent of the languages and the concepts they embody. I've been quietly following their development for several years*

In fact, \[he](https://stackoverflow.com/users/3314921/iceflow19) is totally unknown to me but if Thomas will read this, he will know that the community has \[discovered](https://gitter.im/red/red?at=629144a67df86c141ea7c2f0) his \[great work](https://etd.ohiolink.edu/apexprod/rws\_etd/send\_file/send?accession=toledo1639760375713532&amp;disposition=inline)!

## Saturday 28th May, 2022

GiuseppeChillemi

[00:04](#msg629166f606a77e1e185a41de)Hello @iceflow19, if you want, it would be great to read from you about your thesis and how the Red/Rebol languages have been perceived by the academy and your colleagues. But if your wish is to remain silent, I(/we) will undestand (and please excuse my intrusion in your life!)

pekr

[06:09](#msg6291bcb2c61b987d33ce871c)I think that Thomas is a long time Redbol community member, as well as Rudolf Meimer. Now find more about him. Prior to them, there was Ladislav Mecir from Czechia, a college professor too :-)

## Sunday 29th May, 2022

canyonblue77

[18:28](#msg6293bb30d126691416bf646d)"I've been quietly following their development for several years"; Me too, hit the red-lang blog almost daily for a "quarterly" update. :P:D

greggirwin

[18:34](#msg6293bcaaf8daa71e07a37b09)Yeah, we really need to improve...a lot of things. :^\\

GiuseppeChillemi

[19:53](#msg6293cf34ef00bd1dc60611d3)@canyonblue77 now we have great news? Have you seen the Table Widget on red/gui-branch working together to Red-ODBC?

[19:55](#msg6293cf95deea5616bbd0abe5)@greggirwin what about writing them one complete? They are worth an entire blog post!

[19:55](#msg6293cf9dc61b987d33d26f2f)\*about them

hiiamboris

[21:06](#msg6293e068deea5616bbd0c9a3)Not part of Red yet, and undelivered promises are worse than the absence of.

GiuseppeChillemi

[21:08](#msg6293e0e506a77e1e185eec2e)Only when complete

## Monday 30th May, 2022

pekr

[07:36](#msg62947415d126691416c0b12c)I would not mind seeing blog aprticles much more frequently. In fact, recent aproach of very very long articles is a bit difficult to read.

[07:40](#msg629474d5db6f627d25a929f0)Why not to blog even on work in progress? Spaces, Table, ODBC? It does not even matter, if those are released in thee long run.

[07:42](#msg6294754c06a77e1e185ffc69)Would really improve Red perception, would feel dynamic, which is good marketing wise.

GiuseppeChillemi

[08:46](#msg62948478d126691416c0d1f6)@pekr I totally agree with you. This timing gives a sense of a dead o slow going project

greggirwin

[16:41](#msg6294f3a0deea5616bbd2d8b8)I agree as well.

[16:43](#msg6294f43f7df86c141eaeaf85)We planned to do monthly blog posts, but clearly we haven't made that happen.

GiuseppeChillemi

[17:10](#msg6294fa894aa6c31dca29aac4)You don't need to write big and great quality content. Just 50 lines announcing new developments is enough, and prepare the 6 months big blog article in the meantime.

greggirwin

[17:30](#msg6294ff29ef00bd1dc6085d25)It sounds easy. :^)

hiiamboris

[17:38](#msg629501134aa6c31dca29b6c3)post screenshots from gitter ;)

giesse

[18:26](#msg62950c3d4aa6c31dca29cad2)&gt; I don't know who is the writer, but I have just found a thesis from \*Dr. Thomas C. Royko* entitled \*The Dynamic Mapping Architecture\*. With Red and Rebol being the main actors, together with DSL and Parse, \[look at it!](https://etd.ohiolink.edu/apexprod/rws\_etd/send\_file/send?accession=toledo1639760375713532&amp;disposition=inline)

"Language-oriented programming" is a good way to put it. :)

gltewalt:matrix.org

[20:02](#msg629522cfda330517ffa0b45c)I suppose if you had one member sit in on a meeting or update, and take notes (meeting minutes), those notes could be fashioned into short blog updates

cloutiy

[20:25](#msg6295283d06a77e1e18615e6c)I've been wanting to blog about red on hashnode and other blogs for a while. On twitter as well. But i think what has held me back is waiting for io for ability to make web applications.

GiuseppeChillemi

[20:45](#msg62952ceadeea5616bbd345b3)I/O is really near

canyonblue77

[23:41](#msg62955617db6f627d25aaec2b)@greggirwin Doh, I feel bad now, I was just being tongue in cheek. @GiuseppeChillemi Haven't seen the Table Widget but I did read Thomas's paper. Found it fascinating, even if a bit dry for my level.

GiuseppeChillemi

[23:45](#msg62955700c61b987d33d55d80)You can see the table widget in action \[here](https://gitter.im/red/red/gui-branch?at=628fdd8409eea00adeb3ccca)  
In this demo it is joint working with RED-ODBC, interrogating many data sources.

## Tuesday 31st May, 2022

canyonblue77

[00:33](#msg62956271ef00bd1dc6091d45)@GiuseppeChillemi @toomasv Thanks that was cool to see and read about! Random Unasked for Ideas: Tie the "Next" button function to the scrollbar instead and have it fire when its near the bottom? How much to keep loaded for back scrolling? Make loaded row count decisions based on predefined memory amount? Will appending new rows and deleting previous rows cause pauses in GUI rendering?  
Next Cool Feature: A text window that allows Red or DSL to interact with data in the cells and then send a write to the data source ??? :D:D:D  
@greggirwin What about synopsis articles about what folks are doing with Red, or even just Titles that are links to conversation sections like @GiuseppeChillemi sent me? The Synopsis articles could be written by the folks working a particular project and just given a review?

greggirwin

[02:00](#msg629576d8e393a3180632ef7e)Don't feel bad @canyonblue77. This is on us.

[02:10](#msg6295790bda330517ffa14ccd)There are many aspects to this, some of which relate to my own limitations and choices. Every day is a new list of choices to make, best guesses at priorities, and what feels like it will be the best use of our (in this case my) time. Perhaps most honestly, it's what I can and can't make myself do, or how I do it. Ask almost anyone here and they'll say "Gregg rarely gives a short answer." :^) This applies to blog posts too. The logical part of my brain understands that short, snappy articles are what people want, and pictures too. But my wetware CPU is very inefficient when it comes to context switching. I could go on at length, but will stop here, at 1/10th of what I would normally write.

[02:11](#msg62957943ef00bd1dc60944c3)This is why we desperately need a marketing person.

gltewalt:matrix.org

[02:21](#msg62957b904e38f759e297bfe8)I used to make up commercials when I was a kid.

GiuseppeChillemi

[21:08](#msg629683ced126691416c4d136)I have another proposal. I am starting to use generic paths, where you have `get-word` inside them. When I need part of the data structure, I simply change the corresponding word value.

```
table-configuration: [
   a [size: 40x100 type: 'box color: 'red]
   b [size: 40x100 type: 'box color: 'green]
   c [size: 40x100 type: 'box color: 'yellow]
]
```

I use this form to read the data:

```
value: table-configuration/:column-name/:property
```

Now, I am finding myself reusing paths very often and moving them around. So I have created a container block where I select them. They will need to be copied and rebound.

```
my-paths: [read-property table-configuration/:column-name/:property]
```

But BIND does not accept paths, despite they are a series of words. You need to convert to block, rebind and convert to path again.

```
ctx: make object! [column-name: 'a property: quote size:]
get-safe to-path bind copy to-block my-paths/read-property ctx
```

It would be nice to express:

```
pt: copy my-paths/read-property
ctx: make object! [column-name: 'a property: quote size:]
bind pt ctx
```

```
get-safe pt ctx
```

So, if I have to process all columns for a value( full code):

```
table-configuration: [
   a [size: 40x100 type: 'box color: 'red]
   b [size: 40x100 type: 'box color: 'green]
   c [size: 40x100 type: 'box color: 'yellow]
]

pt: copy my-paths/read-property
ctx: make object! [column-name: none property: quote size:]
bind pt ctx

columns: words-of ctx

foreach [name] columns [
   ctx/column-name: name
   value: get-safe pt
   ...do code on value...
]
```

ALANVF

[21:09](#msg629683f967db9a59dbf8981f)interesting, maybe we could just have `bind` accept paths?

[21:09](#msg629683fc06a77e1e1864081c)I don't see why not

GiuseppeChillemi

[21:11](#msg62968480f8daa71e07a8cf43)(Completed, I have hit return before the end)

[21:11](#msg6296848e4aa6c31dca2caa87)@ALANVF This is what I am asking

ALANVF

[21:16](#msg629685b1c61b987d33d7a46b)yeah that sounds reasonable

[21:16](#msg629685c1ef00bd1dc60b57f4)maybe open a REP for this if one doesn't already exist?

GiuseppeChillemi

[21:19](#msg62968658f8daa71e07a8d3de)I will wait until tomorrow to collect opinions and then open it.

[21:22](#msg629686f906a77e1e18640e2d)There is an error in my code:

```
columns: words-of ctx
```

Should be:

```
`columns: [a c]`
```

hiiamboris

[21:22](#msg62968723c61b987d33d7a760)`bind as block! pt ctx` solves your problem (already told you)

[21:23](#msg62968734e393a318063518d8)but I also agree with Alan

ALANVF

[21:23](#msg62968760da330517ffa37808)yeah it theoretically wouldn't even be that hard to add

GiuseppeChillemi

[21:25](#msg629687b309eea00adec0d06c)@hiiamboris But `as block! pt` rebinds the original path or makes a copy of it?

ALANVF

[21:25](#msg629687c667db9a59dbf89eba)`as` doesn't copy

GiuseppeChillemi

[21:26](#msg6296880009eea00adec0d120)Ok, I have thought it works like `load/as`, decoupling the original data from the new version.

ALANVF

[21:26](#msg6296880ef8daa71e07a8d76e)it works like a bitcast/pointer cast in lower-level languages

[21:28](#msg62968876da83520ac35b2473)e.g.

```
RedPath* path = ...;
RedBlock* block = (RedBlock*) path;
```

GiuseppeChillemi

[21:28](#msg62968889da330517ffa379ed)It seems to me that `as` let view the original data as something else, with routines changing the target coordinates to the original structure

ALANVF

[21:28](#msg6296889406a77e1e18641110)basically yeah

GiuseppeChillemi

[21:29](#msg629688a3c61b987d33d7aa86)It impersonates another structure.

ALANVF

[21:29](#msg629688a9e393a31806351d0b)yep

[21:29](#msg629688bedb6f627d25ad5a55)(making it hard to add to red.js -\_-)

GiuseppeChillemi

[21:30](#msg629688e5ef00bd1dc60b5c16)You could do it the lazy way: convert, write and reconvert to the original DT ;-)

[21:30](#msg6296890767db9a59dbf8a180)Do not do this on gigabyte data in a strict loop.

ALANVF

[21:31](#msg62968916f8daa71e07a8d9a7)it's more about making sure both values share the same data

[21:31](#msg629689394aa6c31dca2cb35b)for example, `as path! block` will retail the newlines when you do `as block! ...` on it afterwards, which simply isn't possible in red.js without excessive overhead

GiuseppeChillemi

[21:34](#msg629689cada83520ac35b2770)However, I think `bind` should really accept `paths` to express this action directly, as this does not alter `bind` but completes its targets DT, managing one that has binding too but it is not handled.

ALANVF

[21:34](#msg629689e406a77e1e18641303)yeah

GiuseppeChillemi

[21:35](#msg62968a0dc61b987d33d7acdb)&gt; for example, `as path! block` will retail the newlines when you do `as block! ...` on it afterwards, which simply isn't possible in red.js without excessive overhead

Yes, I have not considered this particular working.

[21:35](#msg62968a3c7df86c141eb1c7ff)It should have been a difficult task to implement the `AS` functionality.

ALANVF

[21:35](#msg62968a3dda83520ac35b280e)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/57C1/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/57C1/image.png)

GiuseppeChillemi

[21:36](#msg62968a61e393a31806352137)I see

ALANVF

[21:36](#msg62968a6cdb6f627d25ad5ce4)not too concerned either way, if you're using this quirk intentionally you deserve to have your code break lol

GiuseppeChillemi

[21:36](#msg62968a7a7df86c141eb1c887):-D

## Thursday 2nd June, 2022

TimeSlip

[00:55](#msg62980a96da330517ffa68f07)@giesse That paper was interesting. Thanks for finding and posting the link.

## Monday 6th June, 2022

meijeru

[17:11](#msg629e352dda83520ac369d83b)Progress on IO is eagerly awaited! The IO branch is not updated since end of April.

GiuseppeChillemi

[17:52](#msg629e3ee8da330517ffb278b8)@rebolek told us there are just a couple of pending decision to make. But I agree it is now very important

## Wednesday 8th June, 2022

dukereg:matrix.org

[07:04](#msg62a049e3c61b987d33ea8937)Hi there. I was just reading the December blog post, with a large section on how there are too many libraries for small tasks (YES!) and then tripped over this casual comment: "The problem I see is that the trend has become for everything to be outsourced \[to libraries], including simple features like logging".

Now, previously, after a ridiculous log4j bug swept panic through the Java programming industry a while back, I thought to myself "Why does log4j even exist? Why do you need a library for something so simple?" but then I thought through all the different concerns we had to deal with for logging (with filename formats, filesystem issues, optional pre-existence of files, file size limits with rollover changing the filename, etc) and thought "actually I'm underestimating how fiddly and error prone it would be to do this from scratch each time. I would definitely want to use a simple library for this".

Please tell me that I was wrong and that you wizards have managed to tame that kind of fiddly, error-prone task to the point that you don't need a library! I'd love to see examples.

rebolek

[10:58](#msg62a080e74e38f759e2ad1938)Anyone running Red/View on Linux?

gltewalt

[15:45](#msg62a0c41f67db9a59db0c7077)You mean Rebol/View ?

ALANVF

[15:45](#msg62a0c42ee393a3180648f491)no, Red/View is definitely a thing?

gltewalt

[15:46](#msg62a0c44c4e38f759e2ada43d)It is?

ALANVF

[15:46](#msg62a0c4544aa6c31dca406e2f)it has been for quite a while

[15:46](#msg62a0c45967db9a59db0c715c)it's Red's GUI system/dialect

hiiamboris

[15:46](#msg62a0c4637df86c141ec59fb8):D

gltewalt

[15:47](#msg62a0c48a4e38f759e2ada4f0)You mean using View with linux? Then yes.

ALANVF

[15:48](#msg62a0c4b1c9382316a644ed25)yeah Red/View got linux support last year iirc

rebolek

[17:18](#msg62a0d9f84aa6c31dca409cd1)@gltewalt yes, I mean using View with Linux. I compiled GUI console with latest sources and I get just some trash output. So I wonder if anyone can confirm it.

[17:19](#msg62a0da12db6f627d25c1756d)\[!\[Screenshot\_20220608\_122920.png](https://files.gitter.im/5565a1d415522ed4b3e10094/hdN7/thumb/Screenshot\_20220608\_122920.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/hdN7/Screenshot\_20220608\_122920.png)

[17:19](#msg62a0da18da330517ffb7966c)\[!\[Screenshot\_20220608\_122433.png](https://files.gitter.im/5565a1d415522ed4b3e10094/VheI/thumb/Screenshot\_20220608\_122433.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/VheI/Screenshot\_20220608\_122433.png)

[17:19](#msg62a0da39da330517ffb796dc)First picture is GUI console compiled from the `master` branch, second is GUI console compiled from the `IO` branch.

[17:20](#msg62a0da4cc61b987d33ebb4ee)I am using Ubuntu Studio 22.04

gltewalt

[18:00](#msg62a0e3ac09eea00aded4f305)Works fine with Linux Mint 20

[18:00](#msg62a0e3c3e393a31806493582)I only compiled master branch

[18:02](#msg62a0e41ee393a31806493635)Using -t Linux ?

[18:03](#msg62a0e454ef00bd1dc61f7467)Anyway, I noticed no issues with linux mint 20 cinnamon

greggirwin

[19:50](#msg62a0fd71db6f627d25c1b953)@dukereg:matrix.org you're not missing anything. First, there is simple logging, and then there is \*LOGGING\*. The latter is filled with lots of decisions and questions (log4j, as an end-game example, is ~30M and ~4K files). The former has just a few questions, and what should be a small number of moving parts. It doesn't mean a standard logging system will do \*everything\*, but it should cover a lot of use cases, so maybe 90% of projects can use it and not need something else. Those other libs can and \*should* exist eventually.

I have an old logging lib that is 6kb. It was designed for a specific need. Apps that need 3 basic logs: startup, session, and error. Here's an excerpt from its test suite:

```
log-tags-are-dirs
nest-log-dirs-by 'month
set-max-log-size 50'000
LOG_SIZE_CHECK_INTERVAL: 250    ; since our log size is small.

set-base-log-dir %/d/_logging-lib-test/tag-dir-logs/

start-startup-log

prn-log "Starting up..."
prn-log "Step 2..."
prn-log "Startup complete..."

start-session-log

turn-logging off
repeat i 10 [
    prn-log ["NO Session entry" i]
]
turn-logging on

; This should rotate us into 4 logs with a 50K limit.
repeat i 5'000 [
    prn-log ["Session entry" i]
]
```

`log-tags-are-dirs` sets the config so session/startup/error logs each go into separate dirs. `nest-log-dirs-by 'month` can use `day/month/year` as an arg, to control dir size. The rest should be self-explanatory. Internally, all it does is use an ISO8601 naming system for the dirs and files, and handles names and size-based rollover.

So we start with something like that and ask "What else does it need to be generalized?" Can it be opaque to content? Can we redirect to things other than files? Do we use an observer pattern for that? Can we safely target APIs for logging before those are async? You really don't want your app pausing because your network is slow. Should it be a daemon using IPC to avoid that?

But if we do \*something\*, just this simple, how far does it get us, and avoid third party library explosions.

[19:54](#msg62a0fe7f67db9a59db0cee24)Config files are another good case. I don't have a dialected interface for my logging lib, but I do for configs.

dukereg:matrix.org

[20:51](#msg62a10be7c61b987d33ec1949)@greggirwin: Thanks for the explanation

## Thursday 9th June, 2022

rebolek

[06:14](#msg62a18fd6db6f627d25c2cfc2)@gltewalt I'm compiling on Linux, so `-t Linux` is automatic.

[06:14](#msg62a18fe2da83520ac3706c67)Can you share your exe, please?

[06:21](#msg62a19183ef00bd1dc620bac4)@gltewalt nevermind. I recompiled libRed with `-u`, compiled the GUI console again and now it works. What was the problem? I don't know.

gltewalt:matrix.org

[06:23](#msg62a191d1da330517ffb8fdd7)away from computer until tomorrow. 😞 (it's 12:23AM here)

rebolek

[06:25](#msg62a19268e393a318064a7d70)Good night! And no problem, I got it working now.

gltewalt:matrix.org

[06:26](#msg62a1927bda330517ffb8ff5b)good to hear

robbie83217916\_twitter

[17:14](#msg62a22a67d126691416db7da1)Hello - newbie here, with an old MacBook Pro - 2012, Mac OS Catalina 10.15.7, 2.5 GHz Dual-Core Intel Core i5. Red-064 won't run because of "bad CPU type in executable". 32-bit library problems perhaps? Could you point me in the right direction please? Many thanks!

hiiamboris

[17:16](#msg62a22aee09eea00aded791ab)You need 10.14 MacOS. Or \[docker](https://github.com/red/red/wiki/\[LINKS]-Unofficial-Red-images)

robbie83217916\_twitter

[17:18](#msg62a22b5bdb6f627d25c41677)Ah - thank you - will get on to it. Have I missed something on the Download page saying that?

hiiamboris

[17:30](#msg62a22e21d126691416db8790)No, it wasn't updated for a while I think

robbie83217916\_twitter

[17:33](#msg62a22effda330517ffba505b)Yes, it could do with a note re MacOS. Thanks again.

hiiamboris

[17:35](#msg62a22f51db6f627d25c41d72):+1:

[17:35](#msg62a22f7ad126691416db8b16)I agree, it totally needs an update

ldci

[18:37](#msg62a23def67db9a59db0f82ba)+1

ALANVF

[20:09](#msg62a25378deea5616bbecd06c)had a thought after talking to gregg the other day: should `money! * time!` be allowed?

[20:10](#msg62a2539cd126691416dbd35c)ideally it also returns `money!`

## Friday 10th June, 2022

riprwwa

[08:34](#msg62a30201deea5616bbee2801)time is money

Oldes

[13:53](#msg62a34ccc09eea00aded9c4cb)You must be more concrete with the request. Would it be money per hour or some other time interval?

[13:59](#msg62a34e4cda330517ffbc92ab)In my Rebol3:

```
>> per-hour: make op! func[a b][a * ((to integer! b) / 3600)]
>> $100 per-hour 2:0
== $200

>> $100 per-hour 2:12
== $220.0

>> $100 per-hour 2:10
== $216.6666666666666500
```

In Red there seems to be some issue:

```
>> $100 per-hour 2:0
== $200.00
>> $100 per-hour 2:12
== $220.00
>> $100 per-hour 2:10
*** Script Error: cannot MAKE money! from: 2.1666666666666665
```

[14:04](#msg62a34f7bda330517ffbc952f)Actually in Red:

```
>> to money! 1.11111
== $1.11
>> to money! 1.111111
*** Script Error: cannot MAKE money! from: 1.111111
```

So before introducing new functionality, it would be better to fix all bugs.

hiiamboris

[14:29](#msg62a3554cdb6f627d25c66721)I think Vladimir considered this a feature

greggirwin

[18:33](#msg62a38e6cc9382316a64aabd4)It's not a bug, but a design limitation. It's doc'd in https://github.com/red/docs/blob/master/en/datatypes/money.adoc.

[19:06](#msg62a3962b67db9a59db123d46)`Money! * time!` seems like a very useful feature, and I remember this coming up in the R2 days. It just needs to be a clear semantic choice, because `time!` when converted to an atomic numeric value (integer or float) is seconds-based. I just tried this, expecting an error, but it works too:

```
>> to percent! 1:0:0
== 360000%
```

That makes no sense, and I think it should cause an error, but this is useful:

```
>> 1:0:0 * 50%
== 0:30:00
```

So there are some actions where we have to weigh what makes sense to people and what makes for a completely consistently and logical language. Those are less usable in general, because we are human after all. But it \*is* a balancing act. @meijeru is one of the most well-versed in the area of consistency, helping to keep us in check. I'd like to hear his view on `money!/time!` math.

My quick thoughts right now:

1\) Money-time math is based on hours: `$5 * 1:30:0 == $7.50`  
2\) You can't `add/subtract`  
3\) You can `multiply`  
4\) You can divide money by time, resulting in money (an hourly rate): `$100 / 4:0:0 == $25`  
5\) Dividing time by money could either be disallowed, or could \*also* return an hourly rate: `4:0:0 / $100 == $25` That makes for some funny thinking mathematically, so we have to ask how useful it is and what problems it could cause. If we disallow it now, we can allow it later without breaking code, so that my suggestion. It only limits how people write the expression. If we don't see any problems with it, I'm also OK with saying that's the behavior, and the added value is worth it. That's why we have all these types, so we can leverage them.

hiiamboris

[19:18](#msg62a398f2ef00bd1dc624e695)Disallow 5 please.

[19:18](#msg62a3990309eea00adeda6b08)Division is never commutative.

greggirwin

[19:34](#msg62a39caec9382316a64ac87d)See, that's a good clarification for us, in the language design in general. Do we \*say* that division is never commutative, no matter what types? If we make that a hard and fast rule, we never have to think about it again. But if we take a deep breath, do any benefits appear that balance breaking that rule?

hiiamboris

[20:20](#msg62a3a771deea5616bbef874c)Nope :)

[20:23](#msg62a3a834deea5616bbef8889)Same as this abomination

```
>> 2 / make vector! [1 2 3 4]
== make vector! [0 1 1 2]
```

greggirwin

[20:50](#msg62a3ae81deea5616bbef9335)Well, now we have a precedent. ;^)

hiiamboris

[21:05](#msg62a3b221db6f627d25c72e83)of the most confusing feature ever created :)

greggirwin

[21:43](#msg62a3baf4f8daa71e07c2c36c):^)

[21:44](#msg62a3bb25da83520ac374db3c)It's a precedent we can to argue against as well, if we say division is never commutative.

GiuseppeChillemi

[23:40](#msg62a3d68967db9a59db12ba1b)Habemus abominatio.

## Sunday 12nd June, 2022

meijeru

[13:45](#msg62a5ee02c61b987d33f57775)I was invoked by @greggirwin on money/time math. Whatever we allow, it can only be with ONE choice of "unit" for time. I agree with point 1). It comes down to an implicit conversion of time! to float! dividing the time! value by 1:00:00. With that being understood, I also agree with 2) 3) and 4) and with @hiiamboris on disallowing 5), because these follow logically from the notion of implicit conversion.

[13:46](#msg62a5ee43c9382316a64f04c9)On division in general, I think there may be lingering other abominations in the source. I suppose it would take some effort to hunt them all down.

greggirwin

[17:32](#msg62a62347d126691416e2fe44)Thanks @meijeru !

## Monday 13th June, 2022

lnxw37d4:matrix.org

[01:26](#msg62a6925def00bd1dc62a6e9e)5, Dividing time by money in real life produces the length of time needed per unit of money. If it is allowed, it should produce this result, not money per unit of time.

greggirwin

[01:31](#msg62a6935edb6f627d25cc74ed)@lnxw37d4:matrix.org thanks for weighing in. Can you give an example and a use case? My mind isn't seeing it right now.

lnxw37d4:matrix.org

[01:35](#msg62a6945ec9382316a6503b2f)The only use I could imagine is finding out how many hours of work it takes to earn the money that an item costs. Probably not something that would be commonly used, certainly not in any program I've ever written or used.

greggirwin

[01:36](#msg62a694a567db9a59db17b667)That's what I'm not seeing. You already have the hours.

[01:39](#msg62a695414aa6c31dca4bac9b)To get what you want, you need an hourly rate.

lnxw37d4:matrix.org

[01:39](#msg62a69569d126691416e3ce27)You're right. I mentally skipped a step.

greggirwin

[01:40](#msg62a69575deea5616bbf4daa6)NP. We all do that at times.

[01:42](#msg62a69607d126691416e3cf39)So it would look something like this:

```
how-much-time: func [cost rate][to time! 3600 * (cost / rate)]
== func [cost rate][to time! 3600 * (cost / rate)]
>> how-much-time $100 $25
== 4:00:00
```

[01:43](#msg62a69653c9382316a6503da1)And if we can multiply time and money, it looks like:  
`how-much-time: func [cost rate][1:0:0 * (cost / rate)]`  
which is nicer.

gltewalt:matrix.org

[02:04](#msg62a69b3a09eea00adedff950)You can multiply it. Decimal form

gltewalt

[02:05](#msg62a69b7ff8daa71e07c8307c)Like 8.34 hours

greggirwin

[02:13](#msg62a69d3b7df86c141ed0edb8)There are use cases for both time values and decimals.

Oldes

[08:33](#msg62a6f656deea5616bbf587e3)@meijeru when `$5 * 1:30:0` would be supported, does it make sense to also support `1:30:0 * $5`?

[08:42](#msg62a6f85b7df86c141ed19aeb)(I think so)

duskhorn:matrix.org

[09:07](#msg62a6fe4f67db9a59db18786c)It would make the most sense

hiiamboris

[09:41](#msg62a7064806a77e1e1884000b)that was implied

dockimbel

[10:01](#msg62a70b00da330517ffc38c50)Hi all! Math operations are defined over `numbers` that are \[precisely defined](https://en.wikipedia.org/wiki/Number#Classification) (basically, the ℂ set). Outside of that, classic operations like addition or multiplication need to be defined with their own set of properties and they don't automatically follow the rules from math operations on numbers. For example, matrix multiplication is not commutative.

So when using math operators on quantities of different types, it's up to us to define the rules (validity, commutativity,...).

[10:03](#msg62a70b7c7df86c141ed1c0c9)&gt; Same as this abomination  
&gt;

```
> >> 2 / make vector! [1 2 3 4]
> == make vector! [0 1 1 2]
>
```

That one is a bug.

hiiamboris

[10:53](#msg62a71728c61b987d33f7a585)I was thinking, is there a system to determine the resulting type of a math expression?

[10:54](#msg62a7174fe393a31806550cbf)Guessing, some types take priority over others, but on the same priority the 1st argument type wins.

dockimbel

[11:13](#msg62a71be24aa6c31dca4caf3e)Dimensionality of operands should influence priority. Another rule we already use in R/S is that the left operand type dictates the resulting type (or the invalidity of the operation).

meijeru

[13:47](#msg62a73ff067db9a59db1903c0)@Oldes Others have already answered positively, and I can add that it follows from the notion that there is implied conversion to float! -- since float! * money! is already allowed. It follows also that time! / money! is disallowed like float! / money!.

GiuseppeChillemi

[16:29](#msg62a765feda330517ffc448b9)@dockimbel Hi Doc, welcome back. It's nice to read you.

## Wednesday 15th June, 2022

planetsizecpu

[06:15](#msg62a97914d126691416e99951)@dockimbel good to see you here, what a long trip!

ALANVF

[19:53](#msg62aa38ab06a77e1e188a7a0f)I made a simple timer demo using Red/View: https://gist.github.com/ALANVF/28c7cbd85a143c26dd416dab1c6e5a84

hiiamboris

[20:18](#msg62aa3e7cc9382316a657ba05)better use `now` or it gets out of sync fast

ALANVF

[20:18](#msg62aa3e957df86c141ed86086)well I was thinking about that, but it seemed kinda expensive?

[20:18](#msg62aa3ea0da330517ffc9ff80)the desync issue is a windows issue afaik

hiiamboris

[20:20](#msg62aa3f2be393a318065b87a5)is this a demo for linux users only? ;)

ALANVF

[20:21](#msg62aa3f35d126691416eb4a98)no I wrote this on windows lol

hiiamboris

[20:21](#msg62aa3f397df86c141ed861ce):D

ALANVF

[20:21](#msg62aa3f49c61b987d33fe3910)until the desync issue is fixed there isn't a clean solution afaik

hiiamboris

[20:21](#msg62aa3f60d126691416eb4aee)`now/precise` is clean enough

ALANVF

[20:22](#msg62aa3f79d126691416eb4b23)wouldn't that be kinda slow being called every 10-100ms though?

hiiamboris

[20:22](#msg62aa3f9fe393a318065b8887)

```
>> clock/times [now/utc/precise] 1000000
0.43 μs	[now/utc/precise]
```

ALANVF

[20:23](#msg62aa3faaf8daa71e07cfb562)hmm

[20:23](#msg62aa3fb3c61b987d33fe39fe)I'll have to experiment with that later

hiiamboris

[20:23](#msg62aa3fc74aa6c31dca531802)don't optimize preemptively :)

[20:23](#msg62aa3fcb4e38f759e2c07065)measure!

ALANVF

[20:24](#msg62aa3fefc9382316a657bce5)yeah sure, I specifically chose to only go to 100ms precision because anything else was noticeably slow

hiiamboris

[20:25](#msg62aa402667db9a59db1f1dea)it shouldn't be, it should just be misaligned with 10ms step

ALANVF

[20:26](#msg62aa4066da83520ac3817961)maybe that's what I meant? dunno

[20:26](#msg62aa4071deea5616bbfc52a9)either way the 100ms precision was more accurate

hiiamboris

[20:26](#msg62aa4083db6f627d25d3f6e8)if you read the REP, it's not that Red slows anything down, Windows simply doesn't fire the timer often enough

[20:26](#msg62aa409109eea00adee741fc)if you use `now`, it will always be accurate

ALANVF

[20:26](#msg62aa4091e393a318065b8aae)yes that's the sync issue

[20:27](#msg62aa4094da330517ffca03e4)hmm

[20:27](#msg62aa409eda330517ffca03eb)I'll still have to look into it then

hiiamboris

[20:40](#msg62aa43bf09eea00adee7489d)`dt: 0 r: reactor [mark: 0] view [below button "start" [r/mark: now/utc/precise - dt t/rate: 99] button "stop" [t/rate: none] t: text on-time [face/text: copy/part form dt: difference now/utc/precise r/mark 10]]`

ne1uno

[20:44](#msg62aa449709eea00adee74a3e)no consumer OS is realtime, even with tight driver control.

## Friday 17th June, 2022

ALANVF

[01:51](#msg62abde05fe909e3ec7d3ea41)I made this neat text editor demo in Red/View: https://gist.github.com/ALANVF/79250fa7741021999d1401aab57d5b6c

greggirwin

[04:17](#msg62ac00411227f62be3a23f1a)Nice. :+1: Fired it up, and skimmed the code.

Where you have `unless none?`, consider just `if`. See how it reads, and where being explicit still has value.

hiiamboris

[07:51](#msg62ac328f22c53438bca582a3)Nice @ALANVF !  
A few notes from me too:  
\- it's interesting that you would bother to `remove back tail title-text` right before calling `unview/all` :)  
\- title text could be just made reactive for less bookkeeping  
\- even such simple project like this already yells "why don't we have apply?"  
\- `either none? found [none][...]` is just `if found [...]`  
\- I agree with Gregg, usage of `none?` all around is totally unnecessary  
\- pairs can be accessed as `/1` and `/2`, not just `/x` and `/y` (where X and Y goes against the 2D meaning)  
\- `with [set-focus self]` is just `focus` in VID  
\- `found: find-text to-find/text current-pos case-check/data yes(no)` contradicts DRY principle a lot :) need to reevaluate your internal API

ALANVF

[20:55](#msg62acea5e9a314a3ec4b31966)@greggirwin ah I forgot you can do that lol

[20:57](#msg62aceab0904f20479a0a500b)@hiiamboris I noticed that `focus` doesn't actually do the same thing as `with [set-focus self]` on subwindows. not sure if it's a bug or what. last point is noted though

[20:57](#msg62aceac6904f20479a0a5016)I think I meant to go back and optimize a lot of repeated code, but I ended up forgetting to

hiiamboris

[21:39](#msg62acf4749a314a3ec4b330a1)If focus is buggy, should be reported.

ALANVF

[21:58](#msg62acf918904f20479a0a6ba9)yeah I just ran out of time yesterday and was busy today

## Sunday 19th June, 2022

hiiamboris

[18:23](#msg62af69a3904f20479a0ef45e)After numerous design battles and bug hunts, I'm happy to announce

\## First program written using \[Spaces](https://codeberg.org/hiiamboris/red-spaces)

\### \[Red Inspector](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/red-inspector.red)

Binaries: \[Windows](https://codeberg.org/hiiamboris/red-spaces/raw/branch/master/programs/red-inspector.exe) \[Linux](https://codeberg.org/hiiamboris/red-spaces/raw/branch/master/programs/red-inspector) \[Mac 32-bit (untested)](https://codeberg.org/hiiamboris/red-spaces/raw/branch/master/programs/red-inspector-mac)

It can inspect system state at any moment, you just:  
\- run your script as `red-inspector script.red`  
\- in your script you can call `inspect word` or `inspect some/path` to pause evaluation and look around

GIF demoing it's use on \[`example.red` script](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/example.red):

!\[](https://s8.gifyu.com/images/111111f26fd6c0330689e.gif)

greggirwin

[22:49](#msg62afa7e28fe56a38b5a44503)Woohoo! Can't wait to check it out. Thanks @hiiamboris ! :clap:

## Monday 20th June, 2022

qtxie

[02:51](#msg62afe0a0568c2c30d3d6fb76)Nice work! @hiiamboris :+1:

toomasv

[03:33](#msg62afea91ab6b634f73511e7c):+1:

gltewalt

[03:37](#msg62afeb78568c2c30d3d70e8a)well...

[03:37](#msg62afeb7c9a314a3ec4b8a85e)https://imgur.com/a/gPYisDY

[03:41](#msg62afec63fe909e3ec7db9374)The binary for:

```
name: "Linux Mint 20"
arch: 'x86_64
version: 5.4.0
build: "#132-Ubuntu SMP Thu Jun 2 00:39:06 UTC 2022"
```

planetsizecpu

[06:21](#msg62b011dc8fe56a38b5a50488)Good job @hiiamboris push hard!

rebolek

[06:29](#msg62b013d8d3c8894f7192f1f3)@gltewalt same here

[06:38](#msg62b016019a314a3ec4b8f639)I'm trying to run it from sources and I got this error:

```
*** Script Error: quietly has no value
```

GalenIvanov

[06:48](#msg62b0183d3bbb384889875afb)Nice work, @hiiamboris ! Strangely it doesn't work on my Windows 10 Pro machine, but I was able to run it on another WIn 10 machine where it works fine.

hiiamboris

[06:52](#msg62b0193a9a314a3ec4b8ff23)Now we have windows to windows incompatibility :D It just gets better and better.

[06:55](#msg62b019ebab6b634f7351788e)@gltewalt @rebolek Linux consoles were crashing on exit for half a year or so

[07:00](#msg62b01b1776cd751a2f499fbf)@GalenIvanov maybe AV issue?

GalenIvanov

[07:09](#msg62b01d19568c2c30d3d7687a)It's possible, although Defender didn't give any message.

ldci

[08:14](#msg62b02c79fe909e3ec7dc1216)@hiiamboris Impressive :)

GalenIvanov

[08:19](#msg62b02d92b408e830dc1d4be0)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/4WYF/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/4WYF/image.png)

ne1uno

[08:20](#msg62b02de20a52264798579bd9)or elide, I saw that too

hiiamboris

[09:03](#msg62b037e50a5226479857b20e)UX feedback is welcome btw.

I'm planning to try to add `console-on-demand` to it on Windows, so it will be able to both give CLI output and won't spawn the "black window" when not asked to.  
Also, BS &amp; Alt keys are broken, needs fixing.

But other than that, what would make it more useful?  
I can't use it myself much yet, because debugging spaces using spaces-based tool.. that just won't work :)

toomasv

[16:39](#msg62b0a2d79f29d42bed88ccef)It comes up ok, but buttons ("&lt;&lt;" "&gt;&gt;") are not reacting, and where should I "Jump to"? (W10)

[16:40](#msg62b0a316ab6b634f7352a972)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/fcj4/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/fcj4/image.png)

hiiamboris

[16:48](#msg62b0a4fb9f73251a2c632443)like on my gif, enter some path

[16:49](#msg62b0a5128fe56a38b5a647a1)&lt;&lt; &gt;&gt; do nothing when history is at head/tail

[16:49](#msg62b0a52a904f20479a1165c1)Should I rename them to "back"/"forward"?

[17:16](#msg62b0ab6fef5ee44882b98f29)I've updated binaries with aforementioned fixes

## Tuesday 21st June, 2022

rsheehan

[08:55](#msg62b187699f29d42bed8a92c0)Does anyone use the VS Code Red extension on Windows 11? I keep getting crashes on the Red Language Server. I have tried all sorts of things, renaming daily builds to red.exe and playing with paths etc. Editing and syntax highlighting is fine but without the language server I don't get the ability to jump to definitions and other extras.

riprwwa

[08:58](#msg62b188249f73251a2c64e4c5)what error are you getting? mine was killed multiple times by the overzealous antimalware software

hiiamboris

[09:08](#msg62b18a889f73251a2c64e8d9)Side note: CudaText supports Red with it's native lexer file (syntax, defintions), and has no need for language server.

rsheehan

[09:48](#msg62b193f99f29d42bed8ac449)@riprwwa I keep getting "Connection to server got closed. Server will restart." I hadn't thought of anti-malware. I will look into it. @hiiamboris I will have at look at CudaText too. Thanks both.

pekr

[13:13](#msg62b1c3e89a314a3ec4bc76e7)I like the BW look of the Spaces more than Red / yellow combination :-)

hiiamboris

[15:15](#msg62b1e0810a522647985b4424):)

[15:16](#msg62b1e0b7b408e830dc20f155)I'm planning to write a shiny stylesheet, but time may not permit.

[15:49](#msg62b1e894fe909e3ec7dfbb7b)(and GTK will uglify it anyway ;)

greggirwin

[16:16](#msg62b1eefbfe909e3ec7dfc97c)@rsheehan I know at least a couple people use the VSCode plugin, though it did have some issues in the past.

## Wednesday 22nd June, 2022

GiuseppeChillemi

[00:20](#msg62b260379f29d42bed8c6b59)Is there a way to bind only a slice of a block?

[00:20](#msg62b2606522c53438bcb1d193)I mean, from a starting point to an ending point.

greggirwin

[00:42](#msg62b26565904f20479a1502ea)No. You'd have to copy that part out.

[00:42](#msg62b2657b904f20479a15030b)It's an interesting thought though.

ldci

[06:23](#msg62b2b5451227f62be3af5237)@GiuseppeChillemi : have a look here https://github.com/red/red/wiki/Red-functions-for-Python-programmers

GiuseppeChillemi

[10:13](#msg62b2eb50ab6b634f73576b3d)@ldci Are you referring to slicing?

hiiamboris

[10:17](#msg62b2ec3def5ee44882be3389)@GiuseppeChillemi you can iterate over part of the block and `change` words to bound ones, and bind blocks in place. Less efficient but achieves the goal.

greggirwin

[10:17](#msg62b2ec5676cd751a2f4f7820)Good point @hiiamboris. :+1:

GiuseppeChillemi

[10:41](#msg62b2f1c8d3c8894f7198cf95)@greggirwin I am just working with reusable VID panels and dynamically build ones. I am facing limits because I can't `bind/part`, so if I have 2 elements which represent the same data with different content, I am forced to stack content using `append` after having bound the data.  
Here is a minimal and very simple example:

```
ctx-config: make object! [size: 200x100 display-text: "Hello Word"]

Panel: [
   txt1: text display-text size
   txt2: text display-text size   
   txt3: text display-text size   
]

Bind-part find/match panel quote txt1: find quote txt2: ctx-config
Bind-part find/match panel quote txt2: find quote txt3: make ctx-config [text: "Dear"]
Bind find/match panel quote txt3:  make ctx-config [size: 200x 200 text: "Red Programmers"]
```

Instead I must work as follow:

```
Panel-parts: [
   one [txt1: text display-text size]
   two [txt2: text display-text size]
   three [txt3: text display-text size]
]
panel: copy []

append panel bind panel-parts/one ctx-config
append panel bind panel-parts/two make ctx-config [text: "Dear"]
append panel bind panel-parts/three ctx-config [size: 200x 200 text: "Red Programmers"]
```

It seems easy when you have a couple of elements but try it when you have to work with a panel with many similar parts and actors

@hiiamboris It is a good proposal but It forces you to replace each `word`, `set-word`, `lit-word` and `path` you have in a range inside a block. Not the best for speed and to easily search the source of a bug when something goes wrong.

[10:48](#msg62b2f369b408e830dc230a34)To be clear, while dynamically build a panel and bind each part is possible, the purpose and structure of the whole panel is more clear when you do not assemble it and you see it in its final structure and bind in place.

hiiamboris

[11:37](#msg62b2ff09d3c8894f7198ecd5)Speed is not an issue for you. VID+View will take 99.9% of the time, bind - less than 0.1%.

[11:39](#msg62b2ff5c22c53438bcb303d6)You can even `parse` that block and replace words with values (text, size).

[11:43](#msg62b300721227f62be3afebd2)Also, you can use native bind like this and it will be faster:

```
bind panel ctx-config
bind find panel 'txt2 ctx-config2
bind find panel 'txt3 ctx-config3
etc
```

GiuseppeChillemi

[12:15](#msg62b307d576cd751a2f4facf3)For long panel definitions, everything between `txt2` and the last binding, will be bound multiple times. Not a quick way of working when the number of elements scales up.

[12:17](#msg62b30860d3c8894f71990562)It is also destructive, because if you have a panel with already bound elements (for example, buttons at the end) you will destroy their binding if they have the same words in their context

toomasv

[14:04](#msg62b32175ef5ee44882beab24)@GiuseppeChillemi Something like this?

```
bind-part: function [what where with][
	yep: false
	beg: where/1
	fin: where/2
	parse what [any [s:
	  if (s/1 = fin) thru end
	| if (s/1 = beg) skip (yep: true)
	| if (all [yep attempt [with/(s/1)]]) change skip (bind s/1 with)
	| skip
	]]
]

ctx-config: make object! [size: 200x100 display-text: "Hello Word"]

panel: [
   txt1: text yellow display-text size
   txt2: text sky display-text size   
   txt3: text pink display-text size   
]

bind-part panel [txt1: txt2:] ctx-config
bind-part panel [txt2: txt3:] make ctx-config [display-text: "Dear"]
bind-part panel [txt3:  'end] make ctx-config [size: 200x200 display-text: "Red Programmers"]

view panel
```

[14:09](#msg62b322af904f20479a167da2)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/S1b5/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/S1b5/image.png)

[14:17](#msg62b32494ab6b634f7357e373)The `attempt [...]` part is probably superfluous

GiuseppeChillemi

[14:27](#msg62b326d8fe909e3ec7e236cf)Yes, that's the idea and I like the way you have coded starting and ending position inside the block.

greggirwin

[18:03](#msg62b359730a522647985e45f2)Very nice @toomasv. Don't lose that code. :^)

toomasv

[18:12](#msg62b35ba8fe909e3ec7e2ab25):) https://gist.github.com/toomasv/df04e859aea1f1fd0e6920efb0d682d9

greggirwin

[18:35](#msg62b360e09f29d42bed8e5ef1):+1:

## Thursday 23th June, 2022

hiiamboris

[17:32](#msg62b4a3bb1227f62be3b33f81)## \[Documentation for VID/S layout dialect is now available (click me)](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/vids.md)

Also there's now a little layout exploration tool which I'm personally using for debugging, but it's also great for understanding Spaces - \[VID/S Polygon](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/vids-polygon.red)

!\[](https://codeberg.org/hiiamboris/media/raw/branch/master/spaces/vids-polygon.gif)

pekr

[17:46](#msg62b4a70a76cd751a2f530043)Carl once ran the poll to find a name for VID. Many options. MS had nice name for one of their subsystems - Viveri, we came up with VIDA etc., but it stayed as VID. Not sure VID/S is needed. Let's just call it VID and replace old one. Seen a note, that Doc planned a virtual coordinaty or some other bigger changes to VID anyway?

GiuseppeChillemi

[17:49](#msg62b4a78ed3c8894f719c56f5)VID+

pekr

[17:49](#msg62b4a7c51227f62be3b348da)Found the blog :-) http://www.rebol.net/cgi-bin/r3blog.r?view=0148#comments

[17:51](#msg62b4a82d0a5226479860d90d)It is really weird to read own opinions you don't remember you once had :-)

[18:06](#msg62b4abadb408e830dc2676db)Hmm, VIDA (advanced) or VIVID - Vastly Improved VID :-)

hiiamboris

[18:07](#msg62b4abdf9f29d42bed90fbac)Funny thread :)

GiuseppeChillemi

[20:15](#msg62b4c9ded3c8894f719d0b73)@hiiamboris Is there any documentation on "differences" between VID and VID/S?

hiiamboris

[20:17](#msg62b4ca3cd3c8894f719d0ca9)Have you opened the link? ;)  
It starts:  
&gt; Quick VID to VID/S and faces to spaces comparison

greggirwin

[20:18](#msg62b4ca879f29d42bed91a30c)I've just opened it, and wow! Great stuff @hiiamboris.

@GiuseppeChillemi I think the opening bit says it all: "VID/S is different from VID because it serves a completely different design." :^)

hiiamboris

[20:18](#msg62b4caafb408e830dc2720bd):D

[20:19](#msg62b4cac39a314a3ec4c2ed0b)Thanks @greggirwin

GiuseppeChillemi

[20:19](#msg62b4cacc904f20479a1a4886)Yes, but some "succinct ones" that explains "VID does this, VID/S does that"

[20:20](#msg62b4caf1b408e830dc272294)Here we have 40 degrees, don't ask too much to me!

greggirwin

[20:21](#msg62b4cb360a52264798618890)I'll say "too soon", as the amount of work is already huge. But now others can contribute as well, and I'm sure @hiiamboris will be on hand to help facilitate that.

GiuseppeChillemi

[20:21](#msg62b4cb52904f20479a1a4c8c)Will it replace VID?

greggirwin

[20:23](#msg62b4cbb73bbb384889914df6)Maybe another way to say it is, don't look at it right now as 'what do I need to change to get my VID scripts running there?' Play with it on its own.

Also too soon to talk of replacing VID. They are different front ends for different back ends.

GiuseppeChillemi

[20:23](#msg62b4cbc48fe56a38b5af4062)@hiiamboris @greggirwin Please Excuse me, I have just missed the tittle above of the columns. The document does really what I have asked!

[20:23](#msg62b4cbc7ef5ee44882c27437)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/ErSP/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/ErSP/image.png)

greggirwin

[20:23](#msg62b4cbdc1227f62be3b40038):+1:

GiuseppeChillemi

[20:24](#msg62b4cc06d3c8894f719d1c95)Too hot for me here, I am surely in energy-saving mode.

[20:24](#msg62b4cc14d3c8894f719d1ca1)Ehm.. "Brain Saving"

hiiamboris

[20:33](#msg62b4ce0776cd751a2f53c8b6)I hope it's not your volcano coming close! ;)

greggirwin

[20:39](#msg62b4cf94ef5ee44882c29561)Not again!

dockimbel

[20:42](#msg62b4d0269a314a3ec4c31b99)@hiiamboris Your doc is confusing VID and View:

[20:42](#msg62b4d048568c2c30d3e1a3c5)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/I3Bd/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/I3Bd/image.png)

greggirwin

[20:44](#msg62b4d09176cd751a2f53dde3)A bit of conflation. Good catch.

dockimbel

[20:44](#msg62b4d0af3bbb384889917102)The tree you are describing there is View. View is the graphic engine which "API" is a tree of `face!` objects. VID is only a dialect that gets compiled to such tree of faces. VID is optional, it's there just for convieniently build the tree.

greggirwin

[20:45](#msg62b4d0f89f73251a2c6c2641)So the header could say "VID maps to" and "VID/S maps to" or something along those lines.

hiiamboris

[20:47](#msg62b4d14aab6b634f735bf6df)Thanks, I'll think how to rephrase

[20:49](#msg62b4d1df1227f62be3b42b0b)I started it as VID to VID/S then added more fundamental aspects and forgot to change the headers

greggirwin

[20:50](#msg62b4d1fcab6b634f735bfc94)Hey, I'm just deliriously happy to see all those docs!

[20:54](#msg62b4d2fb22c53438bcb74ccf)The resizing GIFs are fantastic to see too, though I've seen `spaces` work in the past, it's a thrill every time, to see something new. Like with @toomasv 's `table` or @GalenIvanov 's `animate`. Can't wait to play more, and also with @rebolek 's and @qtxie 's HTTP work on I/O.

GiuseppeChillemi

[22:32](#msg62b4e9f59f73251a2c6cd185)@greggirwin ODBC and the new DEBUGGER are also great. Red is about to make a giant jump forward into a new world.

dockimbel

[22:55](#msg62b4ef4b8fe56a38b5b03c38)Just a simple poll: is anybody using the debugger, tracer and profiler we included in Red last year? If so, what is your experience with those tools?

greggirwin

[23:08](#msg62b4f2709a314a3ec4c41463)@GiuseppeChillemi agreed.

GiuseppeChillemi

[23:42](#msg62b4fa6cd3c8894f719e6b32)@dockimbel  
Profiler is the first tool I use to find slow parts of my code.  
I am adding debugger and tracer to my daily work. I have started last month when Toomas created his `Table` Style, so I am porting my code from Rebol to Red. The difficulty I find is that they are very detailed at a low level and I am trying to find a way to not get overwhelmed by such precise information and use them only in specific parts of my code. I would need more aggregated information.

[23:44](#msg62b4fac5d3c8894f719e6c63)But It may be meand I am just too joung into using them

## Friday 24th June, 2022

toomasv

[06:32](#msg62b55a96b408e830dc2b17be)@hiiamboris Great documentation! :+1:

hiiamboris

[07:27](#msg62b5676976cd751a2f5822a2)Thanks.

[07:34](#msg62b569039f29d42bed9617d7)@dockimbel never used the debugger unfortunately. Used tracer and profiler a few times. Tracer is good when it's needed, but too limited by exception handling issues, so the main place where I'm tracing - assertions - still have to be done the other way. 99% of time I'm using my own profiler, for it's much better fit for my needs.

[08:27](#msg62b5756c76cd751a2f588c5b)Spaces profiling example:  
!\[](https://i.ibb.co/V9cbNyZ/GIF-24-Jun-22-11-25-44.gif)  
first report is startup, second report is operation

jpaquim:matrix.org

[10:13](#msg62b58e539f29d42bed971c57)Hey everyone 👋 just getting started on the Red/REBOL ecosystem, coming primarily from a Web background professionally, but doing a lot of systems programming on the side as well. I love LISPs, and I'm getting a lot of the same kind of vibe  
A few questions:  
\- How is the M1 Mac support for Red and REBOL? I haven't found any M1-specific binaries, and not having much success with Rosetta 2 for some reason, getting an error 86 when trying to run the Intel binaries  
\- Has anyone tried to build Red for WebAssembly? Either browser or WASI runtime compatible? I've seen https://github.com/ALANVF/Red.js but not sure if the focus will ever be on Wasm as a target

[10:22](#msg62b5907bfe909e3ec7eb7ef0)And a couple of others more tangentially related:  
\- Looking through the Red website, my inner webdev is constantly screaming a bit at the "classic" Google blogger/blogspot look 😛 would there be any interest in migrating the content to something like a simple static generator and some styling, or using one of the various documentation generators out there? In terms of usability, I'm mostly missing highlighting on the source code snippets, I think that would make the examples richer and easier to follow  
\- Is it common in the community to "write your own Red/REBOL", like it is within the various LISPs/Schemes? Is there any existing guide/overview to the main implementations?  
Thank you 🙏

rebolek

[10:38](#msg62b5941cef5ee44882c80ad8)Hi @jpaquim:matrix.org and welcome!

\* Current Red is unfortunately 32bit only, so no M1 version yet. There are some plans to move forward but it'đ going to take some time. Red.js is separate implementation, as there is no Wasm emitter from the compiler currently. But the situation is going to get better hopefully.  
\* Regarding the website, there is a new one that is in beta currently.

jpaquim:matrix.org

[11:04](#msg62b59a3db408e830dc2ce5f8)Thank you! So I guess developing on a Mac for now requires a 32 bit ARM/x86 Linux VM or similar, right?  
Concerning the Wasm target for the compiler, I guess writing something like that would involve something similar to `red/system/targets/IA-32.r` or `ARM.r`, right?

[11:08](#msg62b59b319f73251a2c71d238)From what I can tell it emits native code directly, rather than performing an intermediate assembly -&gt; binary directly, for webassembly I guess it would directly emit bytecode as well, or would it make sense to have an intermediate step converting to webassembly's text format?

[11:33](#msg62b5a1009a314a3ec4c8e6f6):point\_up: \[Edit](https://gitter.im/red/red?at=62b59b319f73251a2c71d238): From what I can tell it emits native code directly, rather than performing an intermediate assembly -&gt; binary conversion. For webassembly I guess it would directly emit bytecode as well, or would it make sense to have an intermediate step converting to webassembly's text format?

GiuseppeChillemi

[11:39](#msg62b5a27bab6b634f736205f7)This morning I have moved my library of functions, which contains a lot of experiments, to RED. I have encountered a couple of errors concerning things working differently:

1\) In Rebol I have had some functions with a malformed specs block:

```
myfunc: func [
   arg1 "This is arg1" [block!]
] []
```

Red warns there is a problem while Rebol doesn't

Same for:

```
myfunc: func [
   "This is a description"
   [catch]
   arg1 [block!] "This is arg1" 
] []
```

The \[catch] must be before the function description

[11:41](#msg62b5a3079a314a3ec4c8f595)Red also ha warned be about this word which is illegal `='` while in Rebol it is a valid one.

[11:43](#msg62b5a35cd3c8894f71a32a24)Just a couple of notes of this little journey

greggirwin

[13:33](#msg62b5bd1b3bbb38488998066b)Thanks @GiuseppeChillemi. There are times when we want to be a little less forgiving, in order to allow future extensions more easily. We'll try to find the right balance.

[13:41](#msg62b5befc8fe56a38b5b618e2)Welcome @jpaquim:matrix.org !

Here's the beta site: https://beta.red-lang.org/about/ We haven't pushed to finish it, which is mainly content related, but that's something I'd like to see done. Ping me if you're interested in helping.

Red's back end can emit anything, as you've seen. Nobody in our team is a WASM expert, so we have to look at the tradeoffs. The reason Red works the way it does today is so it doesn't require \*any* other tooling. But that superpower comes with a pretty high cost as well, which is why we're not 64-bit yet. To contribute to the deep core, step one is to see what @dockimbel thinks, and then there will be a \*very* high bar for quality acceptance.

We don't have people writing their own variations on the language, but I've always wanted to see teaching projects build micro versions of \*other* langs in Red. One of my early `parse` experiments was a little Logo, and it blew me away to see that I could just dynamically add to my rule block to extend the language when the user defined a function.

Red really lets you think about problems in new ways.

Happy Reducing!

GiuseppeChillemi

[14:02](#msg62b5c3ff0a52264798686d81)@greggirwin until you will permit having `strings` and `blocks` after `/local`, I will be happy because I have same prototype ideas which are really interesting...

[14:02](#msg62b5c40c3bbb384889984018)... but!

[14:09](#msg62b5c5b722c53438bcbe09dc)...While experimenting to show you something, I have found the following:  
I have supposed I could use a block after `/local` thinking it could be ignored because the following code works:

```
x: func [a [string!] /local z []] []
```

When I have tried to fill the block to use it to store default values, I have received a strange result:

```
>> x: func [a [string!] /local z [a: 22]] []
*** Script Error: invalid type specifier: a:
*** Where: func
*** Near : []
*** Stack: x
```

I have then filled it with a type specification and discovered the local words are parsed as the args.

```
>> x: func [a [string!] /local z [string!]] []
== func [a [string!] /local z [string!]][]
>>
```

Shouldn't the parsing of such information stop after `/local`

greggirwin

[14:10](#msg62b5c5f09f73251a2c7302b8)For those who haven't seen it, there's a new room: https://gitter.im/red/rethink

Oldes

[14:12](#msg62b5c639d3c8894f71a431fb)@GiuseppeChillemi `/local` is as any other refine, so there must be same rules. It is just `help` which hides what follows after `/local`!

greggirwin

[14:12](#msg62b5c6680a52264798687fd3)&gt; Shouldn't the parsing of such information stop after `/local`

No, it shouldn't. The func spec only ends at the end of the spec block. Everything \*inside* that block is part of the func spec dialect. So we \*can* make the rules whatever we want, but the thing to do in this case is to create a new wrapper mezz and experiment there.

Oldes

[14:12](#msg62b5c66a9f29d42bed98c444)

```
>> f: func[a /local b [integer!]][ print [a b] ]  f/local 1 2  f/local 1 "2"
1 2
*** Script Error: f/local does not allow string! for its b argument
```

GiuseppeChillemi

[14:14](#msg62b5c6dd9f29d42bed98c828)Wow, so you can pass values via `/local`? Amazing!

greggirwin

[14:15](#msg62b5c715904f20479a213221)You \*can\*, but since it's not a documented "by design" behavior, I wouldn't depend on that. :^)

GiuseppeChillemi

[14:16](#msg62b5c739ab6b634f73630c6f)You always block my dreams! :-(((

[14:28](#msg62b5ca0e3bbb384889986ef9)However, I really would like to have subsequent blocks, other than the datatype specifier, that are simply ignored by RED, so you can put inside them whatever you want. But the body of function is free from such constrains, so I can use it to extend the function's specs.

[14:36](#msg62b5cc063bbb384889987b24)I am experimenting while writing. There are still some differences between Rebol and Red but I don't understand this one. (I would have expected a similar output of Rebol)  
\*\*Rebol:\**

```
>> x: func [a [integer!] /local z] [print "ctx: " probe bound? 'z]
>> x 1
ctx:
make object! [
    local: none
    z: none
]
```

(Missing `a`, but I don't understand the reason)

\*\*Red:\**

```
>> x: func [a [integer!] /local z] [print "ctx: " context? 'z]
== func [a [integer!] /local z][print "ctx: " context? 'z]
>> x 1
ctx: 
== func [a [integer!] /local z][print "ctx: " context? 'z]
```

It is not an usable context what it is returned, but Rebol one is.

[14:37](#msg62b5cc220a5226479868a826)(@Oldes How does this work in REBOL3 by Oldes?)

Oldes

[14:44](#msg62b5cddeb408e830dc2e5f93)My Rebol3 has same result like Red. R3-alpha was returning just `true`.

greggirwin

[14:48](#msg62b5cec3d3c8894f71a47744)@GiuseppeChillemi simply different implementations with different tradeoffs. What you may want is something like closures, of which there are existing mezz level examples.

Oldes

[14:54](#msg62b5d02922c53438bcbe4ecf)@GiuseppeChillemi as usually, I don't know what you want to do, but in Rebol3 is for example:

```
>> o: object [data: 0] x: function/with [a [integer!] /local z] [print data: data + a o] o
>> x 1
1
== make object! [
    data: 1
]

>> x 10
11
== make object! [
    data: 11
]
```

[14:57](#msg62b5d0ddab6b634f73634f74)Also see, what `context? data` returns in above case:

```
>> o: object [data: 0] x: function/with [a [integer!] /local z] [print data: data + a context? 'data] o
>> x 1
1
== make object! [
    data: 1
]
```

[14:59](#msg62b5d13e76cd751a2f5b1836)I was never good in \_bindology\_, but I think that you cannot expect to get `context? 'a`, because `a` exists only on stack. (But I may be wrong... I never dived in this ancient cave)

GiuseppeChillemi

[15:22](#msg62b5d6c08fe56a38b5b6c83f)I am just experimenting. My idea was to let the function have knowledge of itself using `spec-of` or `body-of` on `self` but since it is not available in functions, I have tried `spec-of context? 'z`.  
In Rebol2 this does not work properly, `body-of` returns a context instead of the body, and `spec-of` returns `none`  
In Red it WORKS and both specs and body are returned:

```
>> x: func [a [integer!] /local z] [print "ctx: " probe spec-of context? 'z probe body-of context? 'z]
== func [a [integer!] /local z][print "ctx: " probe spec-of context? 'z probe body-of context? 'z]
>> x 1
ctx: 
[a [integer!] /local z]
[print "ctx: " probe spec-of context? 'z probe body-of context? 'z]
== [print "ctx: " probe spec-of context? 'z probe body-of context? 'z]
>>
```

[15:35](#msg62b5d9b976cd751a2f5b5375)I have later tried to access the context to modify itself using `context` so I have learned that in REBOL2 you get the an usable context with just the local words, while in RED something else.

But further experimenting, there is a way to access the function's context and it is `words-of`

It is not straightforward to use as an regular object but you can manipulate the context using FIND and SET on the returned block

\*\*Getting and manipulating the Function's Context in RED:\**

```
>> x: func [a [integer!] /local z] [
  print "ctx: " 
  probe spec-of context? 'z 
  probe body-of context? 'z 
  probe words-of context? 'z 
  probe reduce words-of context? 'z 
  set first words-of context? 'z 555 
  probe reduce words-of context? 'z
]

>> x 1 ()
ctx: 
[a [integer!] /local z]
[
    print "ctx: " 
    probe spec-of context? 'z 
    probe body-of context? 'z 
    probe words-of context? 'z 
    probe reduce words-of context? 'z 
    set first words-of context? 'z 555 
    probe reduce words-of context? 'z
]
[a local z]
[1 false none]
[555 false none]
>>
```

[15:39](#msg62b5da950a5226479869140a)In REBOL2 you do not have such introspection and full context modification capabilities.

Oldes

[16:03](#msg62b5e0553bbb384889990dbf)In my Rebol3 it is \*\*by design\** not allowed to modify function's spec and body. The `spec-of`, `words-of` and `body-of` returns deep copies. My opinion is, that such a \*\*hacking\** can make more problems than advantages.

GiuseppeChillemi

[16:07](#msg62b5e1358fe56a38b5b71062)Actually I am experimenting READING them. I don't want to WRITE those blocks.

Oldes

[16:08](#msg62b5e1749a314a3ec4caceef)You are modifying it using `set first words-of context? 'z 555`

GiuseppeChillemi

[16:10](#msg62b5e1f49f29d42bed99850b)But there you modify the word in its context, taking it from: `[a local z]`, not the specs and body parts. (It is a separate block, not the specs one!)

Oldes

[16:11](#msg62b5e228d3c8894f71a4f75c)In Rebol3 is the `words-of` block unbound (\*\*by design\*\*).

GiuseppeChillemi

[16:12](#msg62b5e2619f73251a2c73d9db)You are putting a doubt in my mind, wait a minute.

[16:14](#msg62b5e2e076cd751a2f5b9a8b)No, changes are happening in the word bound to the function's context, not at global level, so I can confirm you are modifying the context.

Oldes

[16:16](#msg62b5e37276cd751a2f5b9ec8)Still don't see, what is it good for?

GiuseppeChillemi

[16:18](#msg62b5e3d9fe909e3ec7ede58f)Passing the context around to a child function

[16:20](#msg62b5e44ad3c8894f71a50bdc)Otherwise you must mention each word in a new context, setting its values using a `make object! compose/only [a: (a) z: (z)]` syntax, and then pass it.

[16:29](#msg62b5e66b8fe56a38b5b736e6)&gt; In Rebol3 is the `words-of` block unbound (\*\*by design\*\*).

About this:

As far I know, RED does not allow to `load` a block without adding each word to the global context. Because REBOL3 has such possibility using `load/unbound`, `word-of` task is to return an unbond block.

Oldes

[16:42](#msg62b5e95b568c2c30d3e9affa)When I need to pass a context to a child function, I use a regular argument. But I know that you are happy with cryptic solutions ;-) Anyway, as I said... I'm not binding expert and don't want to dive in this abyss with you now.

GiuseppeChillemi

[16:45](#msg62b5ea1422c53438bcbf1570)Yes, but here we are talking about passing the function's context, not a generic context. Without `WORDS-OF context? 'my-local-word`, the child function has totally no access to the caller context words. (In RED)

Oldes

[16:47](#msg62b5eabb9a314a3ec4cb16af)

```
with: func [ctx body][do bind body ctx]
f1: func[ctx][
	with ctx [data: uppercase data]
	f2 ctx
]
f2: func[ctx][
	append ctx/data " World"
	ctx
]
f1 context [data: "hello"]
;== make object! [
;    data: "HELLO World"
;]
```

GiuseppeChillemi

[16:49](#msg62b5eb2c3bbb3848899961a6)Is it R3 or RED?

Oldes

[16:50](#msg62b5eb6cef5ee44882ca9483)Both.

GiuseppeChillemi

[17:04](#msg62b5eead568c2c30d3e9dd41)If I have read correctly, it is not the same situation I have described. You are modifying a `make object! []` context, using it as argument of a function. I am talking about passing the function context itself with all of its data, and make modifications

```
f1: func [/local data1 data2] [
   data1: "hello" data2: none
    f2 words-of context? 'data1
   probe reduce [data1 data2]
   ]
f2: func [ctx] [
   set next ctx reduce [uppercase get ctx/2 " world!"] ;next avoids /local
   "DUMMY RETURN"
]
```

```
>> f1
["HELLO" " world!"]
```

Oldes

[17:17](#msg62b5f1a09f73251a2c7444ed)Of course... and I don't think it is good to do something like that... in Red you can even do:

```
>> clear skip body-of :f1 2  f1
== "HELLO"
```

[17:18](#msg62b5f1d522c53438bcbf4cee)Make a complex app using such a hacks and enjoy nice debugging sessions once there will be something wrong.

[17:21](#msg62b5f29e0a5226479869ce61)Not mentioning, that I still don't understand, why you want to mess with function's specs. In such a non transparent way.

[17:25](#msg62b5f380d3c8894f71a570d4)Heh.. you even don't need a complex app ;-) :point\_up: \[June 24, 2022 7:22 PM](https://gitter.im/red/bugs?at=62b5f2bd9f29d42bed9a0e05)

GiuseppeChillemi

[17:26](#msg62b5f3c9fe909e3ec7ee6057)Red is Alpha ;-)

[17:26](#msg62b5f3dc9a314a3ec4cb59ff)But powerful even in this state

jpaquim:matrix.org

[17:31](#msg62b5f4e68fe56a38b5b79b3d)How do Red/Rebol compare to other homoiconic languages they've inspired, like https://arturo-lang.io and http://sprylang.se ?

Oldes

[17:32](#msg62b5f5190a5226479869df36)What you are doing is a spaghetti code power imho. But you are Italian, so probably ok for you ;-)

GiuseppeChillemi

[17:33](#msg62b5f556d3c8894f71a582ca)However, the best would be to have full path access to the function's context so you can access it in `F2` using `ctx/data1: "HELLO"`

[17:36](#msg62b5f63576cd751a2f5c263b)I like spaghetti but not in coding. The final goal, in a D.R.Y. perspective, is to move some contexts manipulation patterns to external functions for code sharing and call it from multiple root ones.

Oldes

[17:43](#msg62b5f7ba9f29d42bed9a3164)In my Rebol3:

```
>> f1: function/with [] [data: random "abcd"  f2 context? 'data  data] ctx: context [data: none]
>> f2: func[ctx][uppercase ctx/data]
>> f1
== "ADBC"

>> f1
== "DCBA"
```

GiuseppeChillemi

[17:47](#msg62b5f8b7ab6b634f73646a4a)`Function` is auto localizing in R3 too, isn't it?

Oldes

[17:48](#msg62b5f8fdab6b634f73646c96)Yes

[17:49](#msg62b5f927d3c8894f71a5a0de)But I could also use:

```
f1: closure/with [] [data: random "abcd"  f2 context? 'data  data] ctx: context [data: none]
```

As it is the same. As \[Gregg told you](https://gitter.im/red/red?at=62b5cec3d3c8894f71a47744) already. Closure is what you need.

GiuseppeChillemi

[17:55](#msg62b5faa61227f62be3bc7e8d)Now the situation is better. I like the first version with `f2 context? 'data`, because it has the working I would like to see in RED: the ability to use path notation on function context. In this scenario, it is easily understandable why `words-of ctx` returns just the unbound words, because there is another way to work on the context words via path. But there is a way to have bound ones too?

hiiamboris

[17:58](#msg62b5fb2afe909e3ec7ee942e)@jpaquim:matrix.org those are just for-fun projects

greggirwin

[18:22](#msg62b600cab408e830dc2fb589)@jpaquim:matrix.org compare to then in what way(s)? I just glanced again and both seem to be written in Nim, which I have only glanced at a few times. There are so many details in projects like these that comparisons are either vague and broad, or time consuming.

## Saturday 25th June, 2022

G8nes

[09:31](#msg62b6d5ee1227f62be3c29305)Ho guys i’m new (in programming in general also, i’ll ginna start going to university soon…) i realy get interested by feel of this language… there is someone that can give me some sort of handbook where i can starting learn how to use it?

hiiamboris

[09:41](#msg62b6d8331227f62be3c2a4a3)Hi and welcome @G8nes :)  
Maybe take a look at the topic in https://gitter.im/red/red/welcome  
Rebol/Core manual is particularly a must read for you ;)

G8nes

[09:44](#msg62b6d91bab6b634f736ab615)Thx!

GiuseppeChillemi

[18:55](#msg62b75a3ed3c8894f71af8491)@Oldes today I have installed your Rebol3. I like the multicolor gui and the github readme graphic. I have experiment a little because I was curious about `function/with`

[18:59](#msg62b75b0122c53438bcc93b9e)You have no access on `args`from the function context but you have a separate `self`object (the `with` one). I have not understood if it is shared in all function calls or you have a separate stack frame on each one but I suppose the former.

[19:00](#msg62b75b53fe909e3ec7f87ad5)However, nice work! Thank you for keeping our roots alive and preserving Rebol3 the way Carl has created it. (I will try to support you on Patreon as soon as possible)

## Sunday 26th June, 2022

ALANVF

[00:33](#msg62b7a9468fe56a38b5c3e56d)hey @jpaquim:matrix.org I saw your comment on the Red.js (I am the owner of the project). I'd eventually like to support a WASM target, but I am waiting until Red.js is more mature and WASM gets more features like GC. "eventually" is the main goal though

[00:35](#msg62b7a9c4ab6b634f7370636d)however for now, WASM is not viable as a target until it gets more essential features

[00:35](#msg62b7a9e1d3c8894f71b1b51f)there's also a chance we can figure out how to run/compile R/S to wasm

## Monday 27th June, 2022

GiuseppeChillemi

[09:24](#msg62b97761568c2c30d303087b)@gltewalt we have a spammer

[09:25](#msg62b97775ef5ee44882e3c618)Pardon @greggirwin

greggirwin

[17:31](#msg62b9e95eb408e830dc4b6e26)Thanks @GiuseppeChillemi.

## Wednesday 29th June, 2022

meijeru

[17:19](#msg62bc89a722c53438bcee9ee0)There was some irritation noticeable recently on duplicated issues or wishes. The main reason these duplications keep cropping up is of course that there is no action. Progress has slowed down to a minimum and the major enhancement: that of a full-fledged I/O, seems almost stalled. What can be said to give those that wish to use Red in earnest some perspective? Or is everybody making do with the current flaws and limitations?

jpaquim:matrix.org

[22:07](#msg62bccd270a522647989a4c3b)Is https://stackoverflow.com/questions/48178976/compile-red-and-red-system-compilers-from-source still up to date? Is there any way to build the full tool chain from source in a reproducible way without needing to trust an existing red or rebol binary?

ALANVF

[22:40](#msg62bcd4f8b408e830dc608b04)any rebol 2 binary should work?

jpaquim:matrix.org

[23:19](#msg62bcddf122c53438bcf103ed)Hm, I mean how do you build Rebol itself in the first place, using only a C compiler? Is it feasible in any of the implementations? From looking through the project READMEs, they all seem to assume an existing binary, is there any way to avoid a chicken and egg, trusting trust kind of problem, by fully bootrapping from another language like C?

## Thursday 30th June, 2022

Oldes

[05:04](#msg62bd2ec3d3c8894f71d9e5b9)It is not using any C compiler. Just Rebol2.

[05:04](#msg62bd2ef8904f20479a5665ec)Which is not opensourced

rebolek

[08:12](#msg62bd5af79f73251a2ca93d16)@meijeru it's unfair to describe IO progress as stalled. I don't know when it's going to be merged to main, but there's a lot of progress on IO. @qtxie did fix a lot of bugs, I have fully working async HTTP(S) scheme and server and also other protocols are in various state of completion as well (Redis, MySQL, MQTT, websockets, ...).

IO branch is fully usable today. I'm not saying there aren't bugs but when I find one, @qtxie usually fixes it in hours, maybe 1-2 days.

So to sum it up, IO is alive and well and I would like to invite others to play with it. If you don't know where to start, just let me know, I'll be happy to help. I am working on a guide how to write schemes, the code is available at https://gitlab.com/rebolek/schemes/-/blob/main/guide/scheme-template.red . I'm not good at documentation but I'm doing my best. If you have any ideas or any questions, just let me know, I'll update the guide so it would be helpful for others.

meijeru

[09:31](#msg62bd6d73904f20479a58252e)This is good news, that should perhaps have come sooner and from the team as a whole (blog?). My obvious frustration came from inspecting the official IO branch, where there is frankly very little activity visible. But I presume there is another branch in another repository which we don't normally see. If you could point people to it, that would help a lot.

GiuseppeChillemi

[09:37](#msg62bd6edeab6b634f73995d64)@rebolek In the past, I have encountered some workers that go back and forth in their workplace to simulate they were working but without doing anything concretely, but it seemed to many they where working a lot. Red is doing a lot of concrete things but as we don't see it and there is no communication, to the people it seems that everything has stalled. I know you all are working a lot but it does not seem that way and people fear that they beloved language/project has stopped. We do not need the very long and well written @greggirwin blog posts ;^) just a couple of lines...

[09:39](#msg62bd6f460a522647989ecb6d)Please note, this means we are alive, with you and hungry for news!

[09:41](#msg62bd6fdb568c2c30d31f8b20)(It like when someone near you is sleeping from too much time and you go near him to see if he/she is still alive. Hearing the person snoaring, prevents this fear!)

rebolek

[09:51](#msg62bd7204ab6b634f73996d89)@meijeru the low activity on IO branch is understandable, as only the fixes are done there. My schemes are developed in a separate repo, we haven't talked about including them yet. Most of my code is on Gitlab, this is the most recent version of the HTTP scheme https://gitlab.com/rebolek/castr/-/tree/rbdt

[09:52](#msg62bd72513bbb384889cf754f)Scheme link is posted above and more schemes are going to appear there soon, I am merging the code so everything is easily accessible from one repo.

[09:53](#msg62bd729322c53438bcf534d7)Blog would be nice but that's probably not up to me.

pekr

[10:44](#msg62bd7eaab408e830dc654387)The main problem is (lack of) the communication. I know that Gregg knows that, it was few weeks ago, when he admitted, that apart from the infrequent blogging, it is slipping schedules, which seem to be problem too.

For quite some time, I am suggesting (most probably not being alone with such an opinion), that blog articles don't need to be that long. It might be just few lines of text. I tried to create a notion of such a "news feed" on the Facebook Red group, but it is tricky to promote new stuff, which I can't be sure, if / when it materializes - IO, animation dialect, spaces, table, etc. Or I could just post it anyway, no matter what ....

dockimbel

[11:32](#msg62bd89b70a522647989fbf3b)FYI, we are well aware of the current issues and we have spent the last weeks discussing about all the root causes and possible paths. We are now drawing the conclusions and reorganizing the team, processes and priorities top to bottom.

GiuseppeChillemi

[11:44](#msg62bd8c81fe909e3ec724c7a5)We are with you.

meijeru

[13:35](#msg62bda69c9f29d42bedd16b5f)I can ask no more than that the team reconfirms its dedication to making Red the complete (full-stack) solution it has the promise to be. I know no other programming language (and I have tried so many...) that I would rather program in.

dockimbel

[13:40](#msg62bda7bd8fe56a38b5eecbf9)@meijeru We are all on the same boat. ;-)

pekr

[13:43](#msg62bda879b408e830dc667e4b)I saw a "boat" and thought you are sailing somewhere on the vacation :-)

greggirwin

[16:31](#msg62bdcff576cd751a2f948aca)That would be for @toomasv to lead @pekr. :^)

toomasv

[16:49](#msg62bdd3ff0a52264798a1de6b)Well, I am struggling to work on the boat and off the boat.

GiuseppeChillemi

[16:58](#msg62bdd61bfe909e3ec726f3fb)@meijeru  
&gt; I can ask no more than that the team reconfirms its dedication to making Red the complete (full-stack) solution it has the promise to be. I know no other programming language (and I have tried so many...) that I would rather program in.

Same situation here, I have invested everything in Red. I know no other language and every single free moment I have I sit and code.

## Friday 1st July, 2022

planetsizecpu

[05:51](#msg62be8b639a314a3ec40907fd)Wow!, happy to see the sailors are steering the oars, much encouragement.

ALANVF

[23:33](#msg62bf84661227f62be3013d7a)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/lPxK/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/lPxK/image.png)

[23:34](#msg62bf846f9f73251a2cb8cd2e)kinda sus

[23:34](#msg62bf84868fe56a38b5fbf99a)any particular reason why this logic exists? https://github.com/red/red/blob/master/runtime/datatypes/block.reds#L614

[23:35](#msg62bf84a88fe56a38b5fbfcc3)might open an issue for this

## Saturday 2nd July, 2022

qtxie

[00:39](#msg62bf93cefe909e3ec7334112)@ALANVF Please open an issue for it. I think this code was written before the percent! datatype been added.

ALANVF

[00:49](#msg62bf961d8fe56a38b5fc78fb)yeah probably lol

[01:30](#msg62bf9fc03bbb384889df1c39)opened #5156

greggirwin

[21:25](#msg62c0b7e31227f62be309a488)For the time being, I (Gregg) will work as a regular team member, to support the new plan and direction. Questions related to project and team management should be directed to Nenad.

GiuseppeChillemi

[21:29](#msg62c0b89f8fe56a38b5047b4d)I have not understood which question will Nenad manage

greggirwin

[21:32](#msg62c0b950904f20479a6f8ae9)Features, timelines, and goals, for example.

GiuseppeChillemi

[21:41](#msg62c0bb91fe909e3ec73b2bd9)Ok, at the moment I have no questions. I just suggest to complete what we already have, just to finalize each project and start using it. My priorities are Table Style, I/O, Tree Style, Android, VID/S. Then Modules and 64 bit Red could start.

[21:42](#msg62c0bbd49f29d42bede78f26)Focusing at what already exists let you maximize the results with minimal effort and everyone will benefit.

## Sunday 3th July, 2022

meijeru

[08:12](#msg62c14f750a52264798ba0a12)My priorities are just Table style and I/O. What is VID/S??

ldci

[08:15](#msg62c1500776cd751a2fad5283)@meijeru Hiiamboris’s VID/Space I think. My priority is a Red 64-bit version :)

hiiamboris

[08:16](#msg62c15043b408e830dc8081cb):point\_up: \[June 23, 2022 8:32 PM](https://gitter.im/red/red?at=62b4a3bb1227f62be3b33f81)

meijeru

[08:17](#msg62c15098904f20479a73b8bf)The recent #5156 issue was spotted as a (partial) duplicate of #4456. I am somewhat dismayed by the fact that it was not the team that spotted it.

GiuseppeChillemi

[09:24](#msg62c1606922c53438bc117ac8)VID/S could be moved just before Android if it is needed to support Custom UI elements and animated scenes.

[09:25](#msg62c1607f9f29d42bedebf2d7)(in my priorities list)

[09:27](#msg62c1610f76cd751a2fadcc75)@meijeru to me its a good thing, we have another developer capable of looking at inner Red code, understand and fix it. (But he is not the only one who has joined having these capabilities).

cloutiy

[19:08](#msg62c1e936568c2c30d33f6a57)I/O is a must. Fullstack without http to communicate with the web is a challenge.

## Monday 4th July, 2022

meijeru

[11:51](#msg62c2d4551227f62be3186843)Further to my recent comment on commit e3b646b (which was promptly reacted on by qtxie, thanks for that!) and to the latest issue #5157, I cannot help wondering if the team does some form of \*\*code review\** now and then -- with the increasing volume of code, this is admittedly going to take off some time from programming itself, but might well be worth it. What do others think?

GiuseppeChillemi

[16:37](#msg62c3173c0a52264798c67fe0)I think such refinement work is not useful at the current state of resources but it would be good. In the meantime: 1) We developer could catch the problem during our work and signal it, this is more efficient than reviewing the code ATM, and leave Red developers full time engaged into the current projects 2) I suppose, a giant code review will be done during the development of Red64. After that event when the number of resources will permit a constant code review, it could be done systematically. (EDITED)

## Tuesday 5th July, 2022

meijeru

[12:53](#msg62c434450a52264798ce2367)I suppose the rewriting to Red64 will be done in Red(32). Confirmation anyone?

pekr

[13:50](#msg62c441ae9f29d42bed003152)I hope so. No more R2 dependency, please ...

GiuseppeChillemi

[22:47](#msg62c4bf9eef5ee4488234ac74)It needs a very stable Red release I suppose.

## Wednesday 6th July, 2022

henrikmk

[13:35](#msg62c58f859f29d42bed0960ae)Is VID/S going to be the official UI bundled with Red?

pekr

[14:09](#msg62c5977c9a314a3ec43b1ad9)That's probably not decided yet? There is also nice animation dialect, but those codebases need probably a code review by Doc. I think in the end it is his call anyway, as a mastermind behind the Red.

## Thursday 7th July, 2022

hiiamboris

[12:30](#msg62c6d1e622c53438bc389914)#### \[Documentation for Spaces](https://codeberg.org/hiiamboris/red-spaces) is now all up to date with recent developments

GiuseppeChillemi

[18:09](#msg62c72173904f20479a9d1847)Nice!

hiiamboris

[19:19](#msg62c731d1568c2c30d36511c5)Vote into this thread who's interested:  
1\. Spaces go into `host` face as now (\[open the meaning](https://i.gyazo.com/f71226bd06a7ad72c0f5c224857bac4a.png), esp. funny parallel from biology) - what seemed natural to me  
2\. They go into `spaces` face. @pekr's wish: "because - ppl will know the project by the name". How does style `spaces/list/button` read vs `host/list/button`? And what about possible confusion of `spaces` face type and `spaces` context?  
3\. Your own idea

ALANVF

[19:34](#msg62c7353676cd751a2fd739fd)yo I did thing https://github.com/red/VScode-extension/pull/53

## Friday 8th July, 2022

greggirwin

[17:32](#msg62c86a261227f62be33fd18b)As a side note, the status section in the docs is very helpful. :+1:

[18:50](#msg62c87c5f9f73251a2cf81eae)Thanks for that VSCode work @ALANVF. :+1:

gurzgri

[20:59](#msg62c89aa576cd751a2fe0f61d)### odbc:// scheme improvements

\* auto blob/clob column retrieval up to configurable maximum size  
\* full blob/clob column retrieval with cursor  
\* possibility to change window size after statement execution / between fetches  
\* new option to retrieve column names a strings  
\* improved stability and interim own memory handling to better shielded against crashes  
\* \[documentation](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md) updated to reflect recent development

GiuseppeChillemi

[23:27](#msg62c8bd629f29d42bed206cd4)@gurzgri What to say? it is a great job.

[23:27](#msg62c8bd65904f20479aa8a033)Thank you

## Saturday 9th July, 2022

GiuseppeChillemi

[07:34](#msg62c92f79904f20479aabbdd0)@gurzgri I have not understood if you could write blob columns.

gurzgri

[09:36](#msg62c94c069f73251a2cfdef90)Yes, you can.

## Sunday 10th July, 2022

ldci

[18:04](#msg62cb14bbab6b634f73fa67c1)I need help

```
#!/usr/local/bin/red
Red [
]
hexa: [8Ch 2Dh 99h 87h 2Ah 1Ch DCh 33h A0h 02h 75h ECh 95h FAh A8h DEh 60h 8Ch 04h 91h 4Ch 01h 00h]
data: [140 45 153 135 42 28 220 51 160 2 117 236 149 250 168 222 96 140 4 145 76 1 0]

;--calculate integer from binary string
stringToInteger: function [
	bits [string!]
][
	p2: copy []
	n: length? bits
	if n < 8 [ct: 8 - n repeat i ct [insert bits "0"]]
	i: 7 
	until [append p2 to-integer 2 ** i i: i - 1 i = -1]
	sigma: 0
	repeat i 8 [sigma: sigma + (p2/:i * to-integer bits/:i - 48)]
	sigma
]

getCode: function [
	number	[integer!]
	p		[integer!]
	n		[integer!]
][
	c: enbase/base to-binary number 2
	c: skip c 24 ;--24 for 32-bit integer and 56 for 64-bit integer
	cc: copy/part at c p n
	stringToInteger cc
]

getLZWCodes: function [
	data	[block!] ;--imageData values
	return:	[block!]
][
	blk: copy []
	lzwCode: 2						;--minimal LZW code size [2..8]
	bsize:  lzwCode + 1				;--3
	maxHBit: to-integer 2 ** bSize	;--8
	codeSizeLimit?: false			;--Flag			
	clearCode: 2 << (lzwCode - 1) 	;--4 Clear Code
	eoiCode: clearCode + 1			;--5 End of Information Code
	nextCode: clearCode + 2 		;--internal code for Code Table reading/writing, not the code

	n: length? data i: 1
	while [i < n] [
		;print rejoin ["#" form nextCode " " to-binary data/:i]
		;--Find code Size Limit 
		if nextCode = maxHBit [
			bSize: bSize + 1 
			maxHBit: to-integer 2 ** bSize 
			codeSizeLimit?: true
		]		
		either bSize = 3 [
			;--print data/:i
			c1: getCode data/:i 6 3
			c2: getCode data/:i 3 3  
		] 
		;--switch to 4-bit groups after reading the highest 3-bit code
		[
			c1: getCode data/:i 5 4
			c2: getCode data/:i 1 4 
			
		]
		append append blk c1 c2
		nextCode: nextCode + 1
		i: i + 1
	]
	blk
]
probe getLZWCodes data
;--we must obtain
;[4 1 6 6 2 9 9 7 8 10 2 12 1 14 15 6 0 21 0 10 7 22 23 18 26 7 10 29 13 24 12 18 16 36 12 5]
;--we get
;[4 1 5 5 9 9 7 8 10 2 12 1 12 13 3 3 0 10 2 0 5 7 12 14 5 9 10 15 8 10 14 13 0 6 12 8 4 0 1 9 12 4 1 0]
```

hiiamboris

[18:48](#msg62cb1efb9f73251a2c0aaf21)@ldci it will help if you isolate the part you need help with ;)

qtxie

[22:27](#msg62cb5251d3c8894f713e9801)@ldci In `getCode`, did you check the byte ordering of `c`? Is it expected?

In `stringToInteger`, `until [append p2 to-integer 2 ** i i: i - 1 i = -1]`, why you need a `to-integer`, IIRC, `2 ** i` is an integer already.

## Monday 11st July, 2022

ldci

[06:44](#msg62cbc6bcfe909e3ec788dccf)@qtxie @hiiamboris .Thanks for comments. GIF packs LZW codes into bytes in LSB-first order. The first code is stored as the 3 least-significant bits of the first byte; the second code as the next 3 bits; and so on. The first 2 codes are thus 100 (clearCode) and 1 (Red color code in table). This correct for this image. Then, data are split into codes (switch to 4-bit groups after reading the highest 3-bit code maxHBit value). I don't understand why some values are correctly decoded and other not.

hiiamboris

[08:11](#msg62cbdb4bd3c8894f71425d13)My advise is to `trace` your code until you get to a particular wrong value and inspect every step of how it was created.

ldci

[08:15](#msg62cbdc04568c2c30d386200f)@hiiamboris Thanks. Under progress :)

GiuseppeChillemi

[08:52](#msg62cbe4c4568c2c30d3865fb9)@ldci Please, write down your debugging experience and share it with us!

## Tuesday 12nd July, 2022

gltewalt

[00:06](#msg62ccbb070a522647980a8c55)@hiiamboris Where's that binary again? That you wanted tested

[00:29](#msg62ccc05f8fe56a38b559bcb7)Ah, I found it. Nevermind.

[00:41](#msg62ccc31c9a314a3ec46d9521)This might be a stupid question (it has been awhile), but why will it not Inspect `help` or `what` ? They're function! values. Special context?

[00:44](#msg62ccc3d0ef5ee448826d8767)@hiiamboris On error when clicking "Go", can you have it clear the screen and print something like "Error not found" ?

[00:44](#msg62ccc3e4904f20479ac54740)

```
*** Failed to evaluate button/on-up!
*** Script Error: help has no value
*** Where: get
```

[00:44](#msg62ccc3f38fe56a38b559d0d2)Is there a talking place for Red Inspector?

hiiamboris

[07:56](#msg62cd293d9f73251a2c194e4d)`help` and `what` are parts of the console unfortunately

GiuseppeChillemi

[14:58](#msg62cd8c050a52264798107321)I see that Red `write` works differently than Rebol one. It use:

```
[14-May-1974 "001S000" "tortellini al prosciutto" "999999-99" "now" "operator" 1][14-May-1974 "001S000" "Product1" "999999-99" "now" "operator" 1]
Red^
14-May-1974001S000tortellini al prosciutto999999-99nowoperator114-May-1974001S000Product1999999-99nowoperator1
Rebol^
[14-May-1974 "001S000" "tortellini al prosciutto" "999999-99" "now" "operator" 1][14-May-1974 "001S000" "Product1" "999999-99" "now" "operator" 1]
Rebol^ Mold
```

So it writes as `mold`.  
Which is the equivalent of the Rebol version in Red?

Oldes

[15:19](#msg62cd91140a52264798109712)Red is correct in this case. Why the hell you need the Rebol2 result?

[15:22](#msg62cd91c40a52264798109aa0)If you really need it, you may use:

```
>> write %rebol2-compatible-result probe to-string ["a" "b"]
"ab"
>> read %rebol2-compatible-result
== "ab"
```

GiuseppeChillemi

[16:32](#msg62cda2159a314a3ec4741248)Thank you for answering Oldes, I am just asking to learn the differences and understand what is the result, how things work that way and why.

## Wednesday 13th July, 2022

ldci

[17:15](#msg62cefdbb9f29d42bed4d0513)Still trying to understand https://stackoverflow.com/questions/14203731/parsing-gif-raster-data-lzw.

## Thursday 14th July, 2022

dockimbel

[16:42](#msg62d0475f9f73251a2c2f9ec2)https://www.red-lang.org/2022/07/the-road-to-10.html

hiiamboris

[16:50](#msg62d0495cef5ee4488286f688):rocket: :rocket: :rocket: :rocket: :rocket:

ldci

[17:02](#msg62d04c16568c2c30d3a639df)@dockimbel Great news :)

GiuseppeChillemi

[17:34](#msg62d053bc76cd751a2f180fcc)I agree with the whole plan. One year ago I would have preferred to have the android backend before 64 bit but know I see this transition as a priority. I have personally experimented too many "not enough memory" and stack overflows in production real world enviromnent. So, the timeline is perfect!

[17:42](#msg62d055689f29d42bed5691af)(But I hope our @toomasv will complete the table style before version 0.7 if possible. It's really a priority for many of us)

pekr

[20:02](#msg62d0764afe909e3ec7aa36e2)Please help me to understand the blog article - no Red stage compiler - does it mean we will lose R/S and hence the ability to create tiny apps without the Red runtime?

hiiamboris

[20:04](#msg62d076dc0a522647982569ec)Don't confuse R/S compiler with Red compiler.

gurzgri

[20:05](#msg62d07701ab6b634f7320de58)I think it just means that only code in Red/System will be compiled, and all Red code will only be "encapped" and always be interpreted.

pekr

[20:13](#msg62d078ee76cd751a2f1928db)Ok, understood, thanks

GiuseppeChillemi

[22:08](#msg62d093c222c53438bc7e2c97)The speed gain is postponed to JIT

pekr

[22:13](#msg62d09519ef5ee44882890934)Yeah, thanks to above comments I now have at least a feeling, that I might understand it :-)

GiuseppeChillemi

[22:20](#msg62d096b8fe909e3ec7ab2602)I have read that there will be a Kickstarter campain at 1.0 as funds seems to be enough to reach 1.0 and sometimg more. The plan is to have a stable 64 but release to be presentable for the funding campain. (please, correct me if I have made any error).

## Friday 15th July, 2022

pekr

[06:56](#msg62d10fb8ef5ee448828c71e2)Btw, I do remember some Fast Mandelbrot demo, it was compiled and speedup was nice. Is that an example of Red compiler benefits, or not necessarily so? We will still be able to resort down to R/S via routines, and / or to external libraries, right? If so, I am fully supporting the model simplofication, especially, if one day JIT is available ...

qtxie

[07:00](#msg62d11095ef5ee448828c7db0)@pekr The Fast Mandelbrot demo use R/S to accelerate the calculation. Not related to Red compiler.

pekr

[07:07](#msg62d1121f8fe56a38b5789622)Perfect, thanks.

ldci

[07:48](#msg62d11bcbd3c8894f7168036c)@qtxie `Routines and #system directives will still be supported, but probably with some restrictions .` Any idea about these restrictions? I use many routines in redCV.

qtxie

[08:10](#msg62d120fd76cd751a2f1dbb4a)@ldci IIUC, Should be no impact on redCV.

ldci

[08:11](#msg62d1213fab6b634f73259fad)@qtxie Thanks for you response :)

qtxie

[08:52](#msg62d12adc568c2c30d3ac5e3a)@ldci I remember you use a few runtime APIs in redCV. Some of them may be changed.

ldci

[09:17](#msg62d130b01227f62be37ec020)@qtxie mainly image! datatype

planetsizecpu

[12:59](#msg62d164ad9a314a3ec48ee7df)Good news! much encouragement @TheRedTeam

meijeru

[15:14](#msg62d184498fe56a38b57bb7ac)I welcome the intentions behind the new plan. But as I wrote in a comment on the blog, do we not get View in 1.0?

dockimbel

[15:15](#msg62d184950a522647982d163a)@planetsizecpu Thank you for your kind support!

gltewalt

[15:53](#msg62d18d5eef5ee44882901704)For user friendly documentation, I suggest a licensing agreement to use the REBOL Guide, edited for Red

greggirwin

[17:57](#msg62d1aa89d3c8894f716c1212)&gt; For user friendly documentation, I suggest a licensing agreement to use the REBOL Guide, edited for Red

We've tried to accomplish that in the past, with no luck.

ldci

[19:00](#msg62d1b930ab6b634f7329e8b7)Hi guys. My tests with redCV: http://redlcv.blogspot.com/2022/07/gabor-filter-in-redcv.html

greggirwin

[19:06](#msg62d1bad0904f20479ae8f7ca)Really nice explanation. The link isn't active, but I followed it and the early (visual) examples made the intersection of the sinusoid and Gaussian accessible. The deep math, not so much for me. ;^)

GiuseppeChillemi

[21:49](#msg62d1e0feab6b634f732b0a2e)&gt; &gt; For user friendly documentation, I suggest a licensing agreement to use the REBOL Guide, edited for Red  
&gt;  
&gt; We've tried to accomplish that in the past, with no luck.

It is better if you have not been successful. Red should not be taught as in that book, otherwise, we will have the same results we had the last 20 years.

ldci

[21:51](#msg62d1e145904f20479aea0d3e)@greggirwin. Link updated, and for redCV implementation: https://github.com/ldci/redCV/blob/master/libs/imgproc/rcvGabor.red

gltewalt

[23:06](#msg62d1f30476cd751a2f23af9e)How would you teach it then?

qtxie

[23:08](#msg62d1f3833bbb384889609d84)A series of videos with nice animation is good way. Like what 3B1B does. https://www.youtube.com/watch?v=v68zYyaEmEA

[23:09](#msg62d1f3bf0a52264798305f7a)I think the tools to build those kind of video are open source.

GiuseppeChillemi

[23:13](#msg62d1f4858fe56a38b57ef3c5)The Red Pill should not be needed. Contexts should be taught first before anything and developers must see data that becomes code and not code that becomes data. If you introduce Red with concepts that resemble the other languages, then the previous logic will automatically emerge in the coder's mind and you will need to break this Matrix. Reverse the order of things and you should solve the problem.

[23:21](#msg62d1f68276cd751a2f23c411)@qtxie Thank you, it is a very interesting link. I will search for such tools.

qtxie

[23:25](#msg62d1f7739a314a3ec4931409)@GiuseppeChillemi It's a python lib. https://github.com/3b1b/manim

GiuseppeChillemi

[23:25](#msg62d1f7859a314a3ec493144e)Grazie!

## Saturday 16th July, 2022

cloutiy

[01:44](#msg62d2180d0a52264798316959)@greggirwin thanks so much for the blog post and uodated roadmap. Great to see the team's focus on these final steps towards 1.0.

temperfugit

[03:40](#msg62d23348904f20479aec69a8)Re: documentation, https://helpin.red hasn't been updated in a few years, but I've found it to be very useful. Its license lets you distribute and make derivatives of it so long as it stays non-commercial. If you're cool with the license, maybe you could use it as a base to build further documentation on.

greggirwin

[04:54](#msg62d2449e904f20479aecdda7)@cloutiy I can't take any credit for this one. It's all @dockimbel.

pekr

[07:05](#msg62d263368fe56a38b582142e)I do support the refreshed strategy. More so, because I do remember my discussion with Carl, when he wondered, why ppl did not switch to R3 and still resorted to R2. The reason was simple - incomplete Core language functionality, period.

R3 was released with weak windows console, db protocols including odbc were missing, many networking protocols were missing too, inability to call libraries, weak CALL, incomplete GUI, missing sound.

Other thing were absolutly unneeded distractions - 3-4 months spent in a cave mode, designing bug database. Another half a year spent designing R3 embedded messaging system ....

So please - keep focus on delivering a Core feautures first ....

[07:08](#msg62d2640a1227f62be387440f)The above summary is an example, that you might have cool new language features, but those alone might not be enough to make it ....

GiuseppeChillemi

[09:05](#msg62d27f49fe909e3ec7b8a87a)Petr, people have code into production. Red ODBC is starting to be at the core of a lot of my work. Guess when will be for me the moment to move to Red64?

[09:06](#msg62d27faad3c8894f7171e227)More than "all the features" in a programming language, or any other product, it is important to have the features that are used by the coders for their work. If they have them, the jump will be done.

[09:14](#msg62d28181fe909e3ec7b8b430)Take @dsunanda Sunanda's work as an example. He is not jumping onto Red train because he can't convert some of his work because the garbage collector does not recycle images. Do you think he will adopt Red 1.0 without full garbage collector and VID?

[09:23](#msg62d283acab6b634f732f6578)To not repeat the mistakes of Carl, the real target should be Red64/IO+VID , otherwise, we risk a dangerous "stop and evaluate" moment, where you stop and raise your head when you will 100% think "no one is adopting Red64", because all of us will continue using Red 0.7 "more complete" features.

dsunanda

[10:02](#msg62d28cad1227f62be3886eba)@GiuseppeChillemi I have contingency plans of course....But I am also quietly confident in the Red team's priorities. The last time I had a show-stopper, Nenad responded by totally rewriting the lexer:  
https://www.red-lang.org/2019/10/a-deeper-dive-into-fast-lexer-changes.html

pekr

[11:19](#msg62d29ea50a52264798351ddb)You are mixing various things together. My message was completly different. It was upon Carl as a designer releasing product, which was not on parity with the previous generation. That is not the situation of Red, as Red was never there. 64bit version is a Core technology stuff. In many cases though, you can still deal with 32bits, unless you target Mac. Also - noone is taking View away, it is going to be remberged in cca 3 months, according to the plan.

I am not sure how much money e.g. Diagrammar brought to the Red, but I regard it being a distraction. Well, at least I expect lots of GUI related bugs being fixed or View generally improved.

If it would be for me, I would merge IO if complete, Release 0.7 without the planned toolchain changes, and fully focus on 1.0 / 64 bit.

GiuseppeChillemi

[12:33](#msg62d2b0239f73251a2c409f34)Petr, I am building over your topic. Carl asked himself "why people are not using Rebol 3.0" and he has stopped and asked this question too early, giving himself a sense of project failure. As you have written, and I agree with you, people have not jumped over Rebol 3.0 because of the lack of many features. Which ones? The features they use in their daily work! Those features are not on Red1.0 but on Red1.1 with IO and VID. Mine is a warning: people will jump in at 1.1, not at 1.0; so, don't judge the result of your work until 1.VID, or you will lose the faith as Carl has.

meijeru

[16:17](#msg62d2e49cab6b634f7332064a)I couldn't agree more!

[16:49](#msg62d2ec3422c53438bc8eeb4c)I couldn't agree more!

gltewalt

[17:40](#msg62d2f7f322c53438bc8f4756)With what?

pekr

[17:44](#msg62d2f90b568c2c30d3b9340d)Most probably with the claim, that language should support features, which would allow programmers to support their needs and expand the language ecosystem by practical usage .... or something along the lines :-)

gltewalt:matrix.org

[21:58](#msg62d334843bbb38488969772a)&gt; &gt; &gt; For user friendly documentation, I suggest a licensing agreement to use the REBOL Guide, edited for Red  
&gt;  
&gt; We've tried to accomplish that in the past, with no luck.

&gt; It is better if you have not been successful. Red should not be taught as in that book, otherwise, we will have the same results we had the last 20 years.

In my (not so) humble opinion... The lack of going "mainstream" was because REBOL was on an island. It had its own self-contained chat, and "worlds". Users didn't interact with the general tech internet, and the general tech internet was largely unaware of REBOL.

stevejr0

[23:18](#msg62d34745904f20479af404b1)@GiuseppeChillemi : " I would merge IO if complete, Release 0.7 without the planned toolchain changes, and fully focus on 1.0 / 64 bit. " As a long time mostly lurker since about 2014, I decided to break silence and risk flames by suggesting this suggestion has a lot of merit. If 0.7 would result in a red which is feature complete, clean, and documented at least to the level of Rebol2, that would have been enough to have, at least, drawn the remaining Rebol community together.

[23:29](#msg62d349e23bbb3848896a0380)I admire @dockimbel , @qtxie, and many of you enormously, for all the work to get this far. My concern is that reworking the existing 32 bit codebase, could become a quagmire. This is a dangerous time, in many ways, and the world is moving on in quite unpredictable fashion. Might it not be wiser to turn set it aside earlier -- complete and documented as best you reasonably can -- and take a clean canvas and fresh eyes to design red 64 with the benefit of

[23:59](#msg62d350d8ab6b634f73352b05)all you've learned+created on the 32 bit initial iteration? I will likely not post again, but the success of this project means a lot to me—and I think, in time, to the world. It seems to me the 32 bit version is brilliant and revolutionary enough, already, to be polished, documented, and released TRIUMPHANTLY ASAP. Save as many of the new features, time, money, and energy as possible for the 1-year sprint to 64 bit!

## Sunday 17th July, 2022

gltewalt:matrix.org

[00:09](#msg62d3532aab6b634f733539a3)Why be a lurker?

GiuseppeChillemi

[00:11](#msg62d353a39a314a3ec49cade3)@stevejr0 No flames and thank you for giving your opinion so clearly. I agree with you: let's merge I/O and let Red 0.7 be our full-featured and stable house. Then, all energy should be spent to make Red64 and let it be on par with version 0.7.

[00:12](#msg62d35408fe909e3ec7be5e45)@gltewalt:matrix.org It is another valid reason why Rebol has not been adopted.

gltewalt:matrix.org

[00:43](#msg62d35b3376cd751a2f2d93b9) I'm sure they had many discussions and debates before settling on the new road map.

GiuseppeChillemi

[06:18](#msg62d3a9a81227f62be3906a4a)Yes, I am just giving the point of you from my side, as a developer inside a company.

[08:39](#msg62d3cacf9f73251a2c485944)* point of view

## Monday 18th July, 2022

Dobeash

[02:21](#msg62d4c39cd3c8894f7181eeff)The domain I operate in, backend ETL, essentially uses Rebol (Atronix 64-bit) as a microservice architecture pattern language. It excels at this due to its small footprint stand-alone nature. In 10+ years of ETL processing I've transformed billions of rows of data from a large number of Fortune 500 companies. Over that time I've had to deal with Windows server issues, SQL Server bugs, PowerShell quirks, and the occasional script error ... but not a single Rebol bug.

The ability to use something "out of the box" that "just works" and doesn't need constant updates / patches is massive and I've had many discussions with the senior IT folks I engage with about Rebol's central role in processing their data. When clients want to know how a particular aspect of their ETL is setup, we just send them the relevant Rebol script which they find more useful than any documentation we could provide.

I'd love to be able to switch to Red but for that I'd need 64-bit, I/O, and GC. I can see how GUI is important for consumer-level, but for corporate use I'd suggest REBOL/Base (plus call) type functionality is all that's needed.

riprwwa

[04:52](#msg62d4e6fb8fe56a38b5939999)Hi, I've been following Rebol for a while, then Red, and I'd love to see them more widely recognized and used.  
If you're considering making videos for learning - could the nice animations be written in VID or Draw? then they could be versioned in GitHub, either next to Red or rather in a different repo, but still close by. Surely drawing and animating a few texts, boxes and arrows should be possible, and enough to grasp the different concepts Red brings to the table.

pekr

[05:16](#msg62d4ecb4904f20479affc90b)@Dobeash what I also found interesting, was @hiiamboris CLI enhancement. And IIRC, he also created someting for stand-alone parse? Maybe he can provdie links ....

[05:17](#msg62d4ecf7ef5ee44882a7def4)@riprwwa there is a PR for an animation dialect. It is imo very advanced, but not sure it is being accepted to te mainline, maybe a module, who knows ....

GiuseppeChillemi

[05:24](#msg62d4ee89ef5ee44882a7e805)@Dobeash have you seen Oldes is continuing R3? He has removed more than 500 errors from the code and added some functionality

[05:25](#msg62d4eedf0a52264798457cc6)This without modifying the language and preserving Carl's work.

Dobeash

[08:38](#msg62d51c229f29d42bed78abd8)Yes (it's what I'm using on my home iMac). Really appreciate the variety of compiled assets and small executable sizes.

meijeru

[09:25](#msg62d526eeef5ee44882a981be)I am delighted to see that my ageeement to @GiuseppeChillemi 's post got some more discussion about future directions going. As expected there are two schools, one who needs VID and one who doesn't. How much work is it really to upgrade VID?

pekr

[09:37](#msg62d529e622c53438bc9e9d72)According to blog it is cca 2-3 months, not much of a deal imo ...

GiuseppeChillemi

[09:55](#msg62d52e033bbb384889777ca1)@meijeru Ashley agrees with us. He has a very specialized application which does selection and number crunching on tables called `Munge` that has helped me a lot until yeasterday, when ODBC was added to Red. He is on Rebol3 because Red does not have what he needs for his work: the support for 64 bit to manage big tables. The rule "you use the language which has the features you need for your work" governs here to.

[09:58](#msg62d52ec79f29d42bed7936f7)@Dobeash Ashley, you are the author of one of the most used Rebol GUI systems, which has influenced even Rebol3. Have you ported some of your work there?

Oldes

[10:16](#msg62d5330f3bbb384889779da7)64 bit does not help you with big tables in R3 actually... because it still uses 32bit for its series sizes. I'm not sure if it is worth to extend it to 64bit, because it would enhance memory usage significantly. Also when you want to parse 6GB file of data, it would be more efficient to do it in multiple parts (using something like `read/seek/part`) instead of loading complete file into the memory (which would not be possible now anyway).

GiuseppeChillemi

[10:32](#msg62d536d3904f20479a01e0ad)Oldes, even on smaller sizes, I have reached Red memory/stack limits using `difference` and `unique`(and Gregg has gently provided some slower but working mezzanine). Maybe on Rebol3 this does not happen or he needs 64 bit form some calculations (but we have money datatype which should be able to handles such needs).  
For my own curiosity, I will try on Rebol3, the same operation that exausted Red memory.

hiiamboris

[10:40](#msg62d5388d9f29d42bed7983cd)Gosh. You're mixing a bug in set operations, stack size and 32-bit memory addressing.

GiuseppeChillemi

[10:41](#msg62d538beb408e830dc0e5060)Bug? I didn't know it was a bug, it has not been written when the discussion took place.

[10:42](#msg62d539249f73251a2c52bd0a)And I am very happy to read this! It means it could be fixed and I do not need to wait RED64 to manage my data.

Oldes

[10:45](#msg62d539ca8fe56a38b595e8f4)Btw... if you need to filter output from a database using in-memory `difference` and `unique`, than you are not using your database correctly. It is usually job of the database to do it for you in the most efficient way.

GiuseppeChillemi

[10:48](#msg62d53a863bbb38488977d258)They were batch codes from 2 databases, queried with Red.

hiiamboris

[10:49](#msg62d53a9eb408e830dc0e5d49)&gt; Bug? I didn't know it was a bug, it has not been written when the discussion took place.

I'm pretty sure I advised you to add your case to https://github.com/red/red/issues/5123 at that time.

GiuseppeChillemi

[10:49](#msg62d53a9e1227f62be39b9d72)I have used Red as "glue" and data processors of the data sets.

[10:51](#msg62d53b4ffe909e3ec7cb9d3d)@hiiamboris In Red/Help you only gave me the "super badass" suggestion for deep coping objects without series truncation at current index! ;-)

hiiamboris

[10:52](#msg62d53b7e0a5226479847a252)that was another topic, but ok nvm

GiuseppeChillemi

[10:53](#msg62d53bae76cd751a2f3ae6e9)(I will write in the issue in the afterrnoon)

Oldes

[14:44](#msg62d571ce8fe56a38b597881f)Currently in Red it is possible to use `read/info` with an url to get page result and also status code and headers... but there is no way how to do it, when posting some data (using `write` instead). Any idea how to deal with it?

hiiamboris

[15:24](#msg62d57b2c9f29d42bed7b70e7)`write/info` works fine, see Bolek's http-tools

[15:24](#msg62d57b490a5226479849703b)info argument is `[POST ]` or other http verb

Oldes

[15:30](#msg62d57c908fe56a38b597d5b3)Ah... I overlooked it.. as it has no doc-string

[15:30](#msg62d57ca3ab6b634f73444723)I still prefer `/all` instead of `/info`

rebolek

[15:41](#msg62d57f0dd3c8894f71871b72)Yup, it works with the new HTTP scheme. Let's hope it will be merged into `IO` and then `main`.

[15:42](#msg62d57f5c904f20479a03eb52)I'm fine with both `/all` and `/info`. If this is going to be an incompatibility between Red and R3, it's sad and unnecessary, but not such a big problem.

## Tuesday 19th July, 2022

rebolek

[08:40](#msg62d66e038fe56a38b59eb9d9)I'm going to do some breaking changes to `%common-tools.red` found in Castr repo. One area that the common-tools deal with are conversions. There's lot of them. base64url, percent-encoding, www-form, RFC5322 dates. Which means two functions for each conversion (encoder and decoder). Do we have something that can be used for conversions in Red? Yes we do, codecs. So I'm going to change all these conversion functions into codecs.  
If you think it's not a good idea, let me know why. Otherwise be warned that if you use any of these functions, they're going to be codecs now.

GiuseppeChillemi

[09:41](#msg62d67c45904f20479a0ae8af)I don't see where it could be the problem, apart having them inside Red, means you have to recompile if you need some modifications.

hiiamboris

[09:56](#msg62d67fdcb408e830dc178ca7)Hmm looks like design abuse to me ;) Too small things for a codec. And do you expect `save` &amp; `load` to support these too?

[09:57](#msg62d67ff0ab6b634f734b8a61)Date formats are in the formatting PR btw.

rebolek

[09:59](#msg62d68072904f20479a0b0f87)If you add codec, you get `save` and `load` support.

[09:59](#msg62d6809b9a314a3ec4b35626)It would be nice if the formatting PR would be accepted.

[10:00](#msg62d680c122c53438bca858bd)@GiuseppeChillemi no, you don't need to recompile, codecs can be added on the fly.

[10:04](#msg62d681af22c53438bca85fc5)It may look like abuse, but is it?  
\* Base64url - of course it would be better if this was supported directly by `enbase` and `debase`.  
\* Percent-encoding and www-form - IMO it's a perfect fit this for codec, it even has it's own MIME type.  
\* Dates - I agree it would be nice to have a formatting function for it, but we currently don't. BTW, does your PR also handle loading of such dates?

Oldes

[10:04](#msg62d681b3d3c8894f718e72d4)My opinion is, that it is good to have all codecs in one place.

rebolek

[10:04](#msg62d681c09f29d42bed82cc88)Yes, agreed.

pekr

[10:08](#msg62d6829e76cd751a2f4419ca)Why enbase and debase can't support Base64url? Isn't it a good fit here?

Oldes

[10:08](#msg62d682a0904f20479a0b1edc)And a module/function, which uses the codec extensively may use something like:

```
qp-decode: :system/codecs/quoted-printable/decode
qp-decode some-data
```

hiiamboris

[10:10](#msg62d6831ad3c8894f718e8096)&gt; BTW, does your PR also handle loading of such dates

No, scanning is a task for another day.

rebolek

[10:10](#msg62d683219f29d42bed82d7dc)@pekr of course they can, they just don't support it right now.

Oldes

[10:10](#msg62d6832f22c53438bca86b0e)@pekr it can and it should, but Red development has lags in accepting pull requests.

dockimbel

[10:17](#msg62d684c9ef5ee44882b37620)&gt; Hmm looks like design abuse to me ;) Too small things for a codec. And do you expect `save` &amp; `load` to support these too?

I agree. The purpose of codecs is to add a conversion layer for data (de)serialization when doing I/O.

rebolek

[10:32](#msg62d6884d9f29d42bed82fa4c)Ok, but do you agree that codec is a good fit for `application/x-www-form-urlencoded`?

dockimbel

[10:42](#msg62d68a9bfe909e3ec7d54b89)No, that encoding is specific to HTTP while codecs are independent of the transportation layer. Such specific format should go into a specific lib.

rebolek

[10:43](#msg62d68ad522c53438bca89ed7)Ok.

GiuseppeChillemi

[11:36](#msg62d6974a9f29d42bed8357e3)I don't see the whole picture, my ignorance but in my vision I would like to have a conversion library whose functions you can call for conversion purpose. Then all other players, like `load/as` ,`encode/decode`, `to` or the coder, may use when needed

fergus4

[14:53](#msg62d6c5871227f62be3a6da16)How close is I/O Merge ... v0.7?

dockimbel

[15:58](#msg62d6d4a79f73251a2c5e460f)@fergus4 I need to do a full review in the next days, so I'll know when we can merge it. Most probably in August.

GiuseppeChillemi

[16:01](#msg62d6d56fab6b634f734ddc2d)A question about modules. I see in Rebol 3 functions like `protect` and `hide`, will such kind of functions be implemented in `Red` module system?

rebolek

[16:44](#msg62d6df89fe909e3ec7d7be9e)I can't speak for Nenad, but my guess is that without similar mechanism modules won't be very useful.

GiuseppeChillemi

[17:50](#msg62d6eef7ab6b634f734ea82b)I am interested because I have this kind of structure:

```
make object!  [
   ;protected
   clear:  func [] [clear head data]
   append: func [] [....]
   pick: func [] [....]
   type: func [] [get _type]
   ;invisible 
  _type: 'mycustom-type
   data:  [mydata]
]
```

And I would like to hide and protect its members and have them read or write only

gurzgri

[20:03](#msg62d70e2a8fe56a38b5a35c69)@GiuseppeChillemi Eventually you can use object‘s `on-change*` to kind of protect those words. You can‘t hide others that way, but limit if and to what values selected words can be set. Not a bullet-proof method but it probably it‘ll do okay.

GiuseppeChillemi

[21:22](#msg62d7208bab6b634f734fff82)It's a start. I'll explore these features now that I am fully on Red, together with pre-lexer to build custom DT without requiring to modify the language. Let's see where is the ceiling.

[21:23](#msg62d720cefe909e3ec7d9a327)I am giving a look even to Lua metatables and metamethods. An interesting concept.

## Wednesday 20th July, 2022

GiuseppeChillemi

[00:02](#msg62d746109f73251a2c615465)@dockimbel I have just \*one request* for Red 64:

This is the same script erroring on Red and Rebol2

\*\*Red\**

```
*** Syntax Error: (line 16611) missing ] at [
*** Where: transcode
*** Near : script
*** Stack: load
```

\*\*Rebol2\**

```
;** Syntax Error: Missing ] at end-of-script
;** Near: (line 6916) ] [
;>>
```

Please, give us a more precise error line number, this really makes the difference when lines count is high.

XANOZOID

[00:43](#msg62d74fb8d3c8894f719442ba)how do you read on a port? I looked into open/read - but there's nothing on ports

rebolek

[05:05](#msg62d78d001227f62be3ac6b3b)@XANOZOID https://github.com/red/red/wiki/%5BDraft%5D-Ports

hiiamboris

[07:45](#msg62d7b2901227f62be3ad6f5b)@GiuseppeChillemi https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/bmatch

[08:47](#msg62d7c11d9a314a3ec4bc751f)the spammer is back

pekr

[08:50](#msg62d7c1c9ef5ee44882bc540e)@rebolek Who wrote the doc? It is really a nicely written introduction ...

[08:51](#msg62d7c1fd9a314a3ec4bc7c45)I am more and more having mental problem with the `wrote` name, whereas I think that simple `write` might be good enough ...

[08:53](#msg62d7c2721227f62be3adefc8)In the Client ping example `wrote` section - why do we need to peform a copy on a port?

[08:54](#msg62d7c2cad3c8894f71979956)My gut feeling is, that terms like `send` / `receive` (ot their past tenses) would be more imaginable, what is actually happening. Unfortunately, those don't work so well with other port types, like files, sound, crypto, etc.

rebolek

[08:59](#msg62d7c3efd3c8894f7197a1ff)@pekr that's @qtxie's work

[08:59](#msg62d7c4009f29d42bed8bcbf9)`copy` reads port

[09:00](#msg62d7c43e22c53438bcb137f2)I'm fine with `wrote`. You do `write` action, so you receive `wrote` event.

qtxie

[09:13](#msg62d7c72176cd751a2f4cdc3b)Is it `inserted` and `copied` better? You get an `inserted` event after the `insert` is done. The current event name are copied from Rebol 3, but we don't use `write` and `read` as Rebol 3 does.

GiuseppeChillemi

[09:38](#msg62d7cd27ef5ee44882bca242)@greggirwin SPAM: :point\_up: \[20 luglio 2022 10:34](https://gitter.im/red/red?at=62d7be013bbb38488989f0d4)

Oldes

[09:43](#msg62d7ce279a314a3ec4bcd573)@qtxie are you sure that this is correct?

[09:43](#msg62d7ce2b3bbb3848898a6e11)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/ocVT/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/ocVT/image.png)

[09:52](#msg62d7d06676cd751a2f4d1dbe)Also why do you prefer `insert/copy` instead of `write/read`?

pekr

[11:31](#msg62d7e7a8ab6b634f73557b0d)@rebolek - I have written down my wish here: https://github.com/red/red/issues/5112 .... Simply put, recent naming is inconsistent anyway - we don't say - closed, opened, accepted, just close, open, accept. In R/S code there is e.g. IO\_STATE\_CONNECTED, and it is not IO\_STATE\_CONNECT, as most probably it relates to some underlying OS wrapper ....

[11:33](#msg62d7e7f78fe56a38b5a97533)While HF thinks the worst Rebol naming decision was `/only`, I think it is actually `wrote` - noone needs that, noone wants that and if the `write`action is not reserved for another purpose, I don't want to see it in any of my code :-)

GiuseppeChillemi

[11:58](#msg62d7edea0a522647985ab7ab)The word `close` is ambiguous and heavily depends on the context, the query, and the premise before you use it. While `closed` only has a couple of interpretations possible, as it speaks by itself.  
If you have an `on-closed` actor , this means an action to be performed when the connection has been closed, at the end of the event. While `on-close` could mean 1) An action to be performed at the start of the closing event 2) an action to be performed at the END of the closing event. Close is also a verb, other than an event or a state, so you run the command `close port` and you query it for the last event and the port returns `close` you can't say if we are talking about the command issued, the event, or the state without additional words. So I think that we should maintain the difference where `close` is a verb and `closed` is a state. In this way we can also distinguish between `on-close` when the closing starts and `on-closed` when the port has been closed, and so for all the other command which fall in this category.

Oldes

[12:00](#msg62d7ee4b3bbb3848898b56c1)@pekr it is a nonsense that `wrote` is not needed. Actually it is one of the most important events in the async networking!

GiuseppeChillemi

[12:02](#msg62d7eed90a522647985abfdf)As written before for close: `on-write` could mean either the start or the end of the event, while `on-wrote` means only the event where write action has already be performed.

[12:03](#msg62d7ef008fe56a38b5a9a42d)So `wrote` speaks by itself., while `write`... depends from the context!

Oldes

[12:33](#msg62d7f60376cd751a2f4e244b)But it is true, that `wrote` is the only event type, which is in past tense. One can easily consider all these awake events to be as done and so no need to use past tenses. `on-write` and `on-wrote` belongs to actors, and not event's awake processing.

GiuseppeChillemi

[12:55](#msg62d7fb53ef5ee44882bdf4f6)I have meanr that you can have in the future an event which awake at start of an action, like start of writing, so `write` could mean either the event at start or at end.

Oldes

[13:00](#msg62d7fc54d3c8894f719943dc)I don't think so.

[13:02](#msg62d7fcf076cd751a2f4e5b3b)Purpose of these low level events is to decide, if `wait` should end AFTER some action.. not before.

GiuseppeChillemi

[13:07](#msg62d7fdf822c53438bcb2dd29)I should see a complete pictures the words, the events, the actions and the words where they are used, otherwise there are to many possible scenarios here. Is there a list or a document?

Oldes

[14:21](#msg62d80f7c9f29d42bed8de75f)Here is old Rebol3 documentation on \[ports](https://github.com/r3n/rebol-wiki/wiki/Ports). (It's actually content of the very old \[DocBase](https://web.archive.org/web/20150430135751/http://www.rebol.net/wiki/Table\_Of\_Contents), converted into GitHub format.)

pekr

[15:24](#msg62d81e1aef5ee44882bf05e8)Oldes, nothing against the event type, what is imo not needed is a past tense, as it is an exception. Otoh Giuseppe might be right, that distinction on before / after state could be useful. We should be consistent though imo ...

gltewalt

[15:25](#msg62d81e609a314a3ec4bf040e)`fin`

Oldes

[15:58](#msg62d8262fd3c8894f719a725a)I would be fine with renaming it to `write`, because in this case it really is the event, which just ended and is asking what to do next.

pekr

[16:08](#msg62d828819a314a3ec4bf4ce7)+1

greggirwin

[16:54](#msg62d8335676cd751a2f4ff29d)@GiuseppeChillemi I don't see that spam message. I deleted one not too long ago.

GiuseppeChillemi

[17:03](#msg62d835689f29d42bed8f1a8d)@greggirwin Probably, someone else with high privilege access to the chat has deleted it.

greggirwin

[18:53](#msg62d84f2cfe909e3ec7e219e9)Coming from \[this message](https://gitter.im/red/chit-chat?at=62d848ba0a522647985d80d2) in a red/chit-chat thread.

`Spaces` is @hiiamboris' work, which uses something called `VID/S` as it's own interface dialect. Quite some time back there was chat about the value and need for a non-native GUI system. Native GUIs have both strengths and weaknesses, so we had Boris do some experiments. Those went well and he pursued it so that `spaces` now has an enormous amount of effort put into it, and some amazing functionality with exciting future possibilities. But...

Its future is not certain or set at this time. Given the new roadmap, and the current codebase being deprecated as things transition, as I see it, it will be up to the community to use it on their own or not. Any other predictions will be wild guesses because the new View isn't planned until v1.1.

dockimbel

[19:17](#msg62d854d4ef5ee44882c0909d)People are free to create as many GUI systems for Red as they want. We'll have soon a proper module system and package manager, so users can choose which one they want to use on a per-project basis. Red provides by default a GUI system with native backends, which in the future will be extended to also have a custom cross-platform one. Maybe it will be that one built by @hiiamboris or another one (e.g. implemented as a semi-virtual backend for View), that's certainly not a concern for me until v1.1 as Gregg said.

GiuseppeChillemi

[21:03](#msg62d86d979f73251a2c6966e1)@greggirwin personally, I have thought it was the foundation to have styles that are platform agnostic like in Rebol.

## Thursday 21st July, 2022

planetsizecpu

[06:16](#msg62d8ef3bef5ee44882c4d376)* Gregg's quote  
&gt; But...  
&gt; Its future is not certain or set at this time.

\* Sarah Connor's quote  
&gt; There's no fate but what we make for ourselves

😁

pekr

[06:46](#msg62d8f6419f73251a2c6d1c59)@Oldes I did not know, that any such document existed back in R3 days. Looks like there were actually some (many) thoughts after the port redesign in R3. Will Red follow those directions too, or adopt different model / philosopy? https://github.com/r3n/rebol-wiki/wiki/Ports

XANOZOID

[06:47](#msg62d8f6659f29d42bed949388)@rebolek for some reason the ping pong examples don't work

[06:47](#msg62d8f683ab6b634f735cefa4)"scheme is unknown make object \[]" - maybe ports aren't implemented yet

pekr

[06:50](#msg62d8f71e0a522647986241e4)Have you downloaded / compiled console from the IO branch?

XANOZOID

[06:52](#msg62d8f79cab6b634f735cf5c7)I only downloaded the nightly build from the red website. I haven't compiled the IO branch, but that's good to know, thanks

rebolek

[11:45](#msg62d93c5722c53438bcbbf645)@XANOZOID as @pekr wrote, you need to compile IO branch to get it running. Let me know if you need help with compilation, but it's very easy

Oldes

[11:55](#msg62d93eaf9f29d42bed96a29e)I guess that to compile IO branch is not enough as it does not contain @rebolek 's schemes and other work. Although for the raw tcp example it should be enough.

rebolek

[13:05](#msg62d94eff1227f62be3b94f81)@Oldes I believe what @XANOZOID was trying is my RBDT ping pong example and for that he just needs to compile IO console and cloning the Castr repo. The `scheme is unknown` error is caused by non-IO console, where the TCP scheme is missing.

Oldes

[13:05](#msg62d94f2bb408e830dc2b9b1d)&gt; Although for the raw tcp example it should be enough.

rebolek

[13:12](#msg62d950b0fe909e3ec7e93f52)and?

pekr

[13:16](#msg62d951a1ef5ee44882c7ab6f)Oldes imo just said, that you don't need Castr to run basic ping-pong demo?

Oldes

[13:19](#msg62d95268904f20479a1f20e4)Yes... I said that console from IO branch should be enough for the ping-pong (tcp only) example.

rebolek

[13:20](#msg62d95294ef5ee44882c7b262)Of course, for the TCP ping-pong, you need IO console and Red repo with the demo and for the RBDT ping-pong you need IO console and Castr repo.

Oldes

[13:30](#msg62d954e8b408e830dc2bc3b0)I don't know what is RBDT:)

pekr

[13:44](#msg62d9582c9f73251a2c6fea26)It is a Really Big Data Transfer imo :-D

XANOZOID

[21:44](#msg62d9c8affe909e3ec7eca648)I saw there's a bson format, per in rebolek's red-tools. . . There should be something like for Red, probably called bred (bread) lol

[22:14](#msg62d9cfcf9f29d42bed9ae006)@rebolek I did get red compiled for the IO branch - this is the error I got trying to run the Ping client

```
*** Access Error: port action not supported
*** Where: write
*** Near : "ping!"
```

iceflow19

[23:27](#msg62d9e0d59f73251a2c73cf6a)&gt; Hello @iceflow19, if you want, it would be great to read from you about your thesis and how the Red/Rebol languages have been perceived by the academy and your colleagues. But if your wish is to remain silent, I(/we) will undestand (and please excuse my intrusion in your life!)

Hey @GiuseppeChillemi @pekr ! Long time no talk, finally got out from under years of over-working myself (I actually have freetime - scary right?). I see you all caught wind of my thesis, lol. Gitter didn't notify me when I got mentioned.

## Friday 22nd July, 2022

tomzcn

[01:06](#msg62d9f81b9a314a3ec4cc4132)https://github.com/tomzcn/talking-structured-like-program-code input notes and information by rebol

[01:15](#msg62d9fa293bbb3848899a0dc7)Use the rebol form to enter notes and information

x8x

[13:24](#msg62daa50cab6b634f73693bd5)Latest IO branch console builds can be found here:  
windows: https://static.red-lang.org/dl/branch/IO/win/red-latest.exe  
linux: https://static.red-lang.org/dl/branch/IO/linux/red-latest  
mac: https://static.red-lang.org/dl/branch/IO/mac/red-latest

hiiamboris

[14:23](#msg62dab2d43bbb3848899f62fe)these links would have much more sense if they were discoverable somehow

cloutiy

[21:08](#msg62db11c49a314a3ec4d3fecd)Are there any docs for io branch soecific features?

## Sunday 24th July, 2022

GiuseppeChillemi

[01:17](#msg62dc9dae8fe56a38b5cb9bfd)@iceflow19 HI, it is nice to read you. You have made a great work.

[22:48](#msg62ddcc4922c53438bcdc63f4)

## Monday 25th July, 2022

meijeru

[12:30](#msg62de8cff9f73251a2c949dae)"Latest IO branch console builds can be found here:" I downloaded the .exe for Windows, but it is in fact not a build of the IO branch, since it has the hash #d09220b which belongs to the master branch. Or am I confused?

hiiamboris

[12:36](#msg62de8e313bbb384889bb129c)you seem correct, it's a stale build of master branch

meijeru

[12:47](#msg62de90e2ef5ee44882eca29f)@x8x See above. Your initiative of making them available seemed very positive. I am sure you will have many downloads, so I would appreciate if you could notify us here once the builds are there.

## Friday 29th July, 2022

meijeru

[10:07](#msg62e3b166cf6cfd27af4224b3)"FEAT: removes console auto-building by the toolchain." may we learn the reason for this?

hiiamboris

[10:22](#msg62e3b4f711a6a83d046b4593)We plan to have consoles directly downloadable and toolchain auto-downloaded on demand.

[10:22](#msg62e3b501458f823ce039f9e6)No worries ;)

meijeru

[10:25](#msg62e3b5a1f4d7a323de89167c)What about my earlier question about the IO branch console builds? Those are very interesting for me (and others, I suppose) to test.

hiiamboris

[10:28](#msg62e3b6353a42316d33a4f94b)@dockimbel to ask

meijeru

[10:31](#msg62e3b7066837563d1c8acb56)I notice one GabbieDemberck messed up the wiki and hiiamboris had to revert this. Is there a way to exclude somebody from messing with the repo? I know we can ban people from the chat...

hiiamboris

[10:40](#msg62e3b902b16e8236e32ef13e)Technically there's a 'report' button on user's profile, but I don't think M$ gives any damn about it.

dockimbel

[10:50](#msg62e3bb6511a6a83d046b7717)FYI: as we are doing some changes on the DNS records, the website might not be reachable in the next 24 hours.

[16:24](#msg62e409da72ad51741f9754bc)New Red Binaries  
https://www.red-lang.org/2022/07/new-red-binaries.html

[17:01](#msg62e41278d020d223d3f2b6e9)I'll update the README page accordingly. It's about time we clean up the dust from it.

meijeru

[17:41](#msg62e41bdc11a6a83d046e45d3)You may wish to adapt the download page and remove the links under "Direct links to latest builds" because these lead nowhere (404). Or else ( and this would be my preference) provide "latest" for each of the three versions. This would e.g. help my automation of the download, having a fixed filename instead of one which contains the hash.

## Saturday 30th July, 2022

nc-x

[09:51](#msg62e4ff3e458f823ce0435b7b)Hello,  
The recently published roadmap blog post got me interested in Red again after all these years. I plan to be a silent lurker mostly due to lack of time, but any plans to update the detailed roadmap as per the new plan as that would help to follow red development more easily? -  
\* https://www.red-lang.org/p/roadmap.html  
\* https://trello.com/b/FlQ6pzdB/red-tasks-overview

[09:56](#msg62e5003fb16e8236e3385d39)also from the downloads page -

&gt; GUI Red : Red interpreter + View + GUI console  
&gt; CLI Red : Red interpreter + CLI console  
&gt; Red Toolchain : Encapper for Red + Red/System compiler

am i correct in assuming that if i want both the console and the compiler, then i have to download 2 of these things (GUI Red/ CLI Red + Red Toolchain)?

EDIT: nvm i downloaded all 3

## Monday 1st August, 2022

gurzgri

[08:22](#msg62e78d5b05ad4a3701c1fa56)https://doc.red-lang.org still seems to be inaccessible after the recent DNS changes

hiiamboris

[10:39](#msg62e7ad627ccf6b6d45a98ee5)and https://w.red-lang.org is no longer working ;(

[10:40](#msg62e7ad953a42316d33c1e54e)https://beta.red-lang.org down too

dockimbel

[22:37](#msg62e8558f458f823ce05b9196)FYI:  
\- Red repo main page (README) significantly updated.  
\- About, Getting Started and Roadmap website pages updated.  
\- Privacy Policy page added.  
\- R/S online docs updated (they were lagging more than 15 revisions behind).  
\- the CI has still some hicups but they should be resolved soon.

greggirwin

[23:08](#msg62e85cd999949962933d7ece):+1:

cloutiy

[23:45](#msg62e8659a9d3c186299d863db)Amazing🔥

## Tuesday 2nd August, 2022

hiiamboris

[07:27](#msg62e8d1c67ccf6b6d45b1d049)@dockimbel I think most `red` command lines should be replaced with `red-toolchain`

meijeru

[07:45](#msg62e8d62c05ad4a3701cb60c3)Impressive! This will give people a much better impression of what is/will be available, and will help to build confidence in the project. Small nag: the links at the bottom of the download page still lead nowhere ;-).

hiiamboris

[08:03](#msg62e8da40647d633cf6fb97bd)!\[](https://i.gyazo.com/c07b5e4de53cfecda0b1f5b47aa575d2.png) site's logo has become pixelated

qtxie

[09:39](#msg62e8f0ebf4d7a323deaf9a51)Updated the VS Code plugin, for testing: https://github.com/red/VScode-extension/releases/tag/0.4.4

[09:44](#msg62e8f1fc6837563d1cb13579)Update it to work with the new Red binaries. No new features. Here is the doc:  
https://github.com/red/VScode-extension/blob/master/README.md

dockimbel

[13:49](#msg62e92b81cf6cfd27af69df60):+1:

koba-yu

[13:51](#msg62e92bda9d3c186299de2aa1)@qtxie  
Thank you for your test release. I have tried your new vsix.

Intelligence working when CLI Red placed at normal path like `D:/temp/red-29jul22-95f4da55a.exe`. But not working at `C:/ProgramData/Red/red-29jul22-95f4da55a.exe`. (not sure why for me right now)

Also, when I use plugin's `Compile Current Script (GUI release mode)` command, the path of the `red.redToolChainPath` must be seperated by `\` now. If I use `/`, the compilation fails, though CLI Red path can be separated by both `\` and `/`

Though there is a way to get it works, I appreciate if you check the behavior is OK so far for you.

[13:54](#msg62e92c8a6837563d1cb2d94b)P.S. I am working on Windows 11 x64

qtxie

[14:02](#msg62e92e7c443b7927a7f33af7)@koba-yu Thanks for testing it. I'll check the issues tomorrow.

[14:11](#msg62e930946837563d1cb2f711)BTW. The searching rules for CLI Red on Windows is as follows. 1. red.redPath 2. System's PATH (need to rename red-xxx-xxxxxx.exe to red.exe) 3. old red console

ldci

[14:12](#msg62e930cc7ccf6b6d45b4836b)@qtxie Under MacOS `Access Error: cannot open: %-psn_0_68088043`but the console works

qtxie

[14:14](#msg62e9315d05ad4a3701ce2551)On linux there is a `red` program in the PATH already. So you need to set the red.redPath.

[14:16](#msg62e931b89994996293437346)@ldci Thanks. I'll try to test it tomorrow.

ldci

[14:19](#msg62e93258b16e8236e357440f)@qtxie It’s running now after a move to a red-new directory :)

## Wednesday 3th August, 2022

planetsizecpu

[07:47](#msg62ea28083a42316d33d4414b)Good job @TheRedTeam guys

koba-yu

[11:31](#msg62ea5c8a6837563d1cbb9423):point\_up: \[2022年8月2日 22:51](https://gitter.im/red/red?at=62e92bda9d3c186299de2aa1)

@qtxie Sorry, though I could reproduce the issue once today, I could not reproduce it anymore. Everything is working on my PC regardless of file path and seperating character. There might be remaining process or something wrong on my PC...

fix

[16:47](#msg62eaa6ac05ad4a3701d8c71f)@fix  
hi guys, Discovering red lang, and looks promising.  
as test run, i am trying to bind libsecp256k1.

```
#import [
  "libsecp256k1.so" cdecl [
    context_create: "secp256k1_context_create" [
      flags [integer!]
      return: [pointer! [byte!]] 
    ]
    pubkey_create: "secp256k1_ec_pubkey_create" [
      ctx [pointer! [byte!]]
      pubkey [pointer! [byte!]]
      seckey [pointer! [byte!]]
      return: [integer!]
    ]
  ]
]

create: func [
  /local ctx pubkey seckey
  return: [c-string!]
][
  ctx: context_create 1
  pubkey: declare pointer! [byte!]
  seckey: declare pointer! [byte!]
  pubkey_create ctx pubkey seckey
  ctx
]
```

compilation is giving a "undefined word" issue

```
*** Compilation Error: undefined word context_create 
*** in file: /usr/share/redlang/test.red
*** near: [context_create 1 
    print ctx 
    pubkey: declare pointer! [byte!]
]
```

any idea where things are going wrong?

gurzgri

[17:24](#msg62eaaf46d020d223d3232a7b)@fix Answered in red/red/system

## Saturday 6th August, 2022

koba-yu

[09:36](#msg62ee362cb16e8236e37bc544)Hi, I have written a new article about Red coding. Hope it is fun.

https://dev.to/kobayu/my-red-story-3-converting-legacy-japanese-encoding-to-utf-8-31d6

ldci

[10:24](#msg62ee415a7ccf6b6d45d92fc7)@koba-yu. Have a look here: https://github.com/ldci/Unicode. Some tests I did.

koba-yu

[10:36](#msg62ee443f6837563d1cd7a2f7)@ldci Thank you. Seems helpful when I create a program using emoji or Unicode characters!

rebolek

[10:58](#msg62ee4958d020d223d33d23ae)@koba-yu Nice! I have a \[codepage convertor](https://gitlab.com/rebolek/castr/-/blob/master/codepage.red) that I use for reading web pages, it supports 10 non-CJK codepages, maybe I can add your conversion table to it to support more languages.

koba-yu

[11:13](#msg62ee4cd86837563d1cd7e472)@rebolek Thank you. I’ll check your repo too. Feel free to use my conversion table! :smile:

ldci

[11:13](#msg62ee4ce8f4d7a323ded6a785)@koba-yu You’re welcome

dockimbel

[12:37](#msg62ee606df4d7a323ded73435)@koba-yu That's great, thanks for sharing it! :+1:

koba-yu

[13:05](#msg62ee670d72ad51741fe2d7da)@dockimbel Thank you! I am so glad if you like it. :smile:

greggirwin

[18:13](#msg62eeaf5111a6a83d04bb4a9e)Great article @koba-yu. :+1:

koba-yu

[21:46](#msg62eee12c9d3c186299075283)@greggirwin Thanks :smile:

## Sunday 7th August, 2022

meijeru

[11:13](#msg62ef9e3d647d633cf62c205f)The new `README.md` contains a wrong link for explaining Parse: it should be https://github.com/red/docs/blob/master/en/parse.adoc

[11:13](#msg62ef9e56d020d223d346cf12)But it points to an old blog entry about macros.

hiiamboris

[11:14](#msg62ef9e853a42316d33fb7b59)Blog article is a better introduction than a reference.

meijeru

[11:21](#msg62efa04a72ad51741feb81ea)Maybe, but then it should be the Parse blog article, not the Macro one!

[11:22](#msg62efa09272ad51741feb8549)Also, the powerful preprocessor dialect (including macros) deserves a mention in that same list of links.

[12:40](#msg62efb2b0b16e8236e3865a51)The link on "data-format" (second bullet of main features) leads nowhere.

gltewalt:matrix.org

[17:51](#msg62effba5458f823ce0925344)At a glance of Unison examples, why wouldn't you just use haskell or erlang ?

hiiamboris

[17:55](#msg62effc7af4d7a323dee2a016)I suppose Unison has distributed computing layer built in, compared to others.

greggirwin

[18:01](#msg62effe0b7ccf6b6d45e570ee)I looked at it some time back, but the syntax didn't click for me, as with the two @gltewalt:matrix.org mentioned. Still, I'm all about distributed thinking, so kept a tab open to keep reading about it.

meijeru

[21:47](#msg62f032ed7ccf6b6d45e6e4c2)@gltewalt:matrix.org Unison interests me chiefly because of its totally different paradigm from Red, and because it has a novel approach to program development (codebase management), so it has something extra over Haskell or Erlang. For everyday programming I would choose Red anytime.

[21:48](#msg62f0331a11a6a83d04c5dcdc)Still, it is good from time to time to realize why one makes such choices.

greggirwin

[21:52](#msg62f0341ecf6cfd27af9cdb86)The codebase aspect also caught my eye @meijeru, reminding me of how M/MUMPS and PickOS worked in some ways. As I'm thinking about Red module and package design right now, ecosystems and platform support are on my mind.

GiuseppeChillemi

[23:55](#msg62f050e3999499629376eb20)@greggirwin desire: please create the package manager with some extensibility

## Monday 8th August, 2022

greggirwin

[00:08](#msg62f053fa3a42316d330078cf)"Extensibility" is a very broad term. Can you be more specific?

Dobeash

[13:52](#msg62f1152b647d633cf636a323)The following parse statement prints 2 lines on other Rebol distributions, but only one on Red:

```
parse "," [any [copy s to [#"," | lf | end] (print mold s) skip]]
```

Is this a bug, or by design (I may have missed some of the subtle changes in Red's parse implementation).

gltewalt

[16:12](#msg62f135edaa091774292508de)Ok, the hashing idea is good from Unison. Just borrow that part.

greggirwin

[16:48](#msg62f13e4711a6a83d04cd62f8)You can't just lift that out. It's integrated into Unison's grand design. I have ideas for how we can use hashes in a couple ways as part of versioning, and to help tooling catch problems.

gltewalt:matrix.org

[17:03](#msg62f141db11a6a83d04cd8076)Packages and versioning

[17:04](#msg62f14213f4d7a323deebaf39)"Can't never did anything cuz he didn't try"

## Wednesday 10th August, 2022

greggirwin

[20:33](#msg62f41633647d633cf64be41a)@meijeru I'll be interested to hear your thoughts on Unison, especially their new code sharing feature. When I first looked at it, the proprietary nature of the binary blobs was a deterrent for me, so at least this makes it easily accessible. Pretty slick in their intro video.

## Friday 12nd August, 2022

meijeru

[11:06](#msg62f6345311a6a83d04f0d4e5)Since the latest change in making downloads available, the GUI console does not set `system/build/git`. I rely on his quantity to check against https://api.github.com/repos/red/red/commits to see if I have the latest version.

[12:05](#msg62f64214647d633cf65b4882)Another thing: what must I think of

```
SYSTEM/BUILD/CONFIG/MODULES is a block!
 value.  length: 3  [View JSON CSV]
```

There is only one module in the source, namely View.

hiiamboris

[12:07](#msg62f6428db16e8236e3b5a3c9)In what source?

[12:08](#msg62f642b172ad51741f1ade5a)Look for `load-csv` and `load-json`

meijeru

[13:34](#msg62f656df7ccf6b6d45129db6)I know that the contents is there, it is just that it is not located in `https://github.com/red/red/tree/master/modules` as `system/build/config/modules` would have us believe, naively.

[13:39](#msg62f65824aa091774294a01c8)But I see that there is `%modules.r` which gives the location -- rather confusing: why are these codecs not in `/modules` when they are CALLED modules?

hiiamboris

[15:31](#msg62f6724511a6a83d04f2a515)Does it matter where is it located?

meijeru

[17:11](#msg62f689da9994996293a35701)Not really, but the current arrangement is a bit too arbitrary for my consistency-loving mind: one major module (`View`) as only folder inside `/modules`, two largish codecs as "modules" inside `/environment/codecs` and the other codecs not listed in `%modules.r` (why not?).

hiiamboris

[18:03](#msg62f695d6b16e8236e3b8105b)Evolution is wayward ;) Until mind interferes, when the time is due.

meijeru

[18:55](#msg62f6a21ecf6cfd27afcad274)I suppose due time is 1.0 ;-)

dockimbel

[19:04](#msg62f6a43eaa091774294c283a)@meijeru Currently those "modules" are only meant for handling optional parts in the Red runtime. Such optional part can be located anywhere in the codebase. For parts that don't fit anywhere else, we put them in that `%modules/` folder. All that is temporary until we get proper "modules" definition and a module/package manager.

## Saturday 13th August, 2022

hiiamboris

[10:47](#msg62f781259d3c18629944e09a)Since toolchain is now a separate binary, how do we specify it's version in the tickets? `redc -V` only says `0.6.4`

## Sunday 14th August, 2022

hiiamboris

[12:23](#msg62f8e94d72ad51741f2daf50)I've uploaded some \*\*automation tools\*\*: to \[auto-download latest red binaries](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/reddl) and to \[auto-build latest Red console](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/redbuild) which I'm using to keep the tedious update process non-interactive. Let me know if anyone else is interested in these.

ldci

[16:26](#msg62f922419d3c186299506cd9)@hiiamboris Thanks a lot.

meijeru

[17:23](#msg62f92f85443b7927a765db76)Interesting! I have something similar, which was the reason of my recent post :point\_up: \[August 12, 2022 1:06 PM](https://gitter.im/red/red?at=62f6345311a6a83d04f0d4e5) It did rely on `system/build/git/`

hiiamboris

[18:31](#msg62f93f959d3c186299513fe8)@meijeru so you list commits and if it's not the last, you download a new build? but when do you do that check?

meijeru

[18:34](#msg62f940367ccf6b6d452720b9)It is in a `%init.red` file that is argument to my copy of the executable. So it is executed whenever I start Red. It puts the question: you are xx builds behind, do you want to download the last one? Are you interested in the source?

hiiamboris

[18:36](#msg62f940b16837563d1c25a4a4)I see. Need really fast internet for that kind of check at every run ;)

meijeru

[18:38](#msg62f9412472ad51741f302a72)I have, luckily. The main code is as follows:

```
use [git s c i][
	git: system/build/git
	prin [
		"Red" system/version 
		"for" system/platform 
		"built" any [all [git git/date] system/build/date]
	] 
	unless git [print "" exit]
	s: to-string git/commit
	prin rejoin ["  commit #" copy/part s 7]
	; read commit history from github site
	unless c: load https://api.github.com/repos/red/red/commits [exit]
	; this yields a block of maps, the first component being the most recent
	prin ", "

	; count commits later than installed one
	i: 0
	forall c [
		if c/1/sha = s [
			i: index? c
			either i = 1
			[
				print "you are up-to-date"
			][
				prin ["you are" i - 1 "commit"]
				unless i = 2 [prin "s"]
				print " behind"
			]
			break
		]
	]
	if i = 0 [
		print ["no history for commit, or you are >" length? c "commits behind"]
	]
	unless i = 1 [do %down-loader.red]
```

hiiamboris

[18:43](#msg62f942557ccf6b6d452730b0)Got it, thanks

GiuseppeChillemi

[20:02](#msg62f954e1443b7927a766e174)I have done some speed test to understand how the order of datatypes influences the speed of a function.  
I have used this code on 10 million function calls:

```
recycle/off
Probe "Testing Speeds" wait 1
test-func1: func [
	data [object! block! string! number! word!]
] [
	
]
test-func2: func [
	data [word! object! block! string! number!]
] [
	
]

Probe s1: dt [loop 10000000 [test-func1 'aword]]
wait 1 
Probe s2: dt [loop 10000000 [test-func2 'aword]]

;s1: to-decimal s1
;s2: to-decimal s2

Print ["Difference: " 100 - ((s1 / s2) * 100)]
```

Having the passed datatype moved from the fifth to the first position, you have an average 7% speed increase.  
Here is the result:

```
"Testing Speeds"
0:00:03.82462
0:00:03.57934
Difference:  -6.8527052985051
```

(Note, the `wait`s in the code are there to let end any async print to screen OS function)

[20:06](#msg62f955d005ad4a37014189c3)I did this test on a mobile PC. Maybe the processor makes the difference. Could you please run this code on your system?

[20:15](#msg62f957e511a6a83d04073776)I have also tried a very long datatype block:

```
test-func1: func [
	data [object! block! string! number! object! block! string! number! object! block! string! number! object! block! string! number! object! block! string! number! object! block! string! number! object! block! string! number! object! block! string! number! word!]
] [
	
]
```

But the time difference has not changed. So, what makes it is elsewhere.

[20:30](#msg62f95b5811a6a83d0407505b)I have rerun the test with no CPU speed balancing at all. And there is actually quite no difference between long and short version:

```
"Testing Speeds"
0:00:03.14517
0:00:03.05363
Difference:  -2.997692253914863
(halted)
```

I have also run the same script on Rebol ad I am not surprised from the results:

hiiamboris

[20:35](#msg62f95c92458f823ce0d54928)Typesets are bitsets. You're catching a fluke.

GiuseppeChillemi

[20:36](#msg62f95cd5b16e8236e3cbc71e)

```
"Testing Speeds"
0:00:01.829
0:00:01.131
Difference:  -61.7152961980548
>>
```

Rebol pure loop speed is about 2.8x than Red: 1.1 seconds vs Rebol 3 seconds. I suppose it is caused because Red is more powerful than Rebol, having pre-lexer and debugger.

But Rebol is more affected from datatype position with up to 80% speed difference.

[20:54](#msg62f96100458f823ce0d565bc)&gt; Typesets are bitsets. You're catching a fluke.

Tests are needed just to discover things like this.

[20:55](#msg62f96140d020d223d38c69b5)But as you can see, we have found a difference with Rebol 2, so any comparison with it in the future, should take into consideration the datatype position too.

hiiamboris

[21:02](#msg62f962f33a42316d334141d1)Maybe you should learn \[this concept](https://en.wikipedia.org/wiki/Standard\_deviation) before jumping to conclusions.

GiuseppeChillemi

[21:22](#msg62f967ad6837563d1c26c0fe)I am reading it. In the meantime, I have other interesting results...

[21:38](#msg62f96b4b6837563d1c26dbc0)Which is the fastest method to get a value?

```
recycle/off

;This code is from Ashley Graham
platform?: case [
	2 = system/version/1 ['Rebol]
	not rebol ['Red]
	system/product = 'atronix-view ['Atronix]
]

Probe "Testing GETTING Speeds" wait 1

o: make object! [a: 22]

Probe s1: dt [loop 10000000 [get in o 'a]]
wait 1 
Probe s2: dt [loop 10000000 [o/a]]
wait 1 	
Probe s3: dt bind [loop 10000000 [get 'a]] o 


if platform? = 'rebol [
	s1: to-decimal s1
	s2: to-decimal s2
	s3: to-decimal s3
]

Print ["Difference: GET IN vs PATH (s1/s2): " 100 - ((s1 / s2) * 100) "%"]
Print ["Difference GET IN vs GET (s1/s3): " 100 - ((s1 / s3) * 100) "%"]
Print ["Difference PATH VS GET (s2/s3): " 100 - ((s2 / s3) * 100) "%"]
```

REBOL RESULTS:

```
"Testing GETTING Speeds"
0:00:02.841
0:00:02.12
0:00:01.407
Difference: GET IN vs PATH (s1/s2):  -34.0094339622642 %
Difference GET IN vs GET (s1/s3):  -101.918976545842 %
Difference PATH VS GET (s2/s3):  -50.6751954513149 %
```

They are proportional and the pure `GET WORD!` wins as expected

RED RESULTS:

```
"Testing GETTING Speeds"
0:00:06.41235
0:00:01.55011
0:00:02.92526
Difference: GET IN vs PATH (s1/s2):  -313.6696444688536 %
Difference GET IN vs GET (s1/s3):  -119.2062059990165 %
Difference PATH VS GET (s2/s3):  47.00935663759561 %
```

`GET IN` performance in RED is terrible (compared to REBOL), but what jumps to my eyes is that RED paths are faster than a `GET WORD!` on a bound `block!` And also are EQUAL to Rebol pure `GET` speed. It seems paths are the most efficient way to get a word value in a context.

[22:42](#msg62f97a47647d633cf671e685)(I have deleted this message by mistake, so I write it again)

Here are the results of the script using Rebol3 3.9.0 by @oldes

```
"Testing GETTING Speeds"
0:00:02.171988
0:00:00.605983
0:00:01.036778
Difference: GET IN vs PATH (s1/s2):  -258.423916182467 %
Difference GET IN vs GET (s1/s3):  -109.494028615576 %
Difference PATH VS GET (s2/s3):  41.551325356055 %
```

Rebol3 wins over everything with paths speed about 2.5x than Rebol and Red.  
`Get word!` Speed is about 1,5x than Rebol and 3.0x times than Red.  
As Red, `paths` are faster than `GET WORD!`  
I will do these test again in a couple of years, when the optimization backend will be ready or if any major advancement which could infliuence the result, will be implementd  
(Here: * REBOL/View 2.7.8.3.1 1-Jan-2011; Red 0.6.4 for Windows built 3-Aug-2022/14:10:46 and Rebol3 3.9.0\*)

[23:26](#msg62f984bbf4d7a323de261e46)Gists here for: \[DT-Position](https://gist.github.com/GiuseppeChillemi/56981a59cb74f5d57119ced529808f79)  
and \["Getting" Speed](https://gist.github.com/GiuseppeChillemi/69b83e4f3f8f74b3599dd25212e851b2)  
Getting test includes a fourth more test for direct word reducing from by the interpreter

## Monday 15th August, 2022

luce80

[17:59](#msg62fa899605ad4a37014a00c0)\[WISH]:  
if `read` accepted also string! and binary! by simply passing them as is, instead of:

```
decode: func [text [string! binary! file!]] [
	if file? text [text: read text]
	if binary? text [text: to string! text]
	load-json text
]
```

I could write:

```
decode: func [text [string! binary! file! url!]] [
	load-json to string! read text
]
```

For me this is a quite common pattern.

meijeru

[19:17](#msg62fa9bc505ad4a37014a85c0)`load` itself does accept values of all 4 types; and `load-json` is indirectly called by `load/as`. So does that not solve your problem?

## Tuesday 16th August, 2022

rebolek

[06:26](#msg62fb389daa091774296d1168)I wouldn't rely on `load-json` as it may get removed. `load/as ... 'json` is preferred solution.

pekr

[07:59](#msg62fb4e549994996293c4bff6)I am just trying to compile new GUI console from sources, using the following code in R2 console: `do/args %red.r "-r -t Windows %environment/console/gui/gui-console.red"`, and it seems to be hung on getting some git information? The last console output is: `"Get git version data." (none)` ... sorry, if I am supposed to use the toolset differently nowadys, it is just that this aproach worked few days ago ....

rebolek

[08:01](#msg62fb4ef59d3c186299601fdb)IIRC @dockimbel made some Git-related change recently, maybe it's caused by it. I build console yesterday and it worked fine, I'll get latest sources and try again.

[08:04](#msg62fb4fa0458f823ce0e3276e)@pekr after the `Script: "Get git version data" (none)`, Rebol asks for a permission to execute shell command. Maybe the window is hidden somewhere? I'm running it from the Rebol/Core, so I just need to press Y or A.

luce80

[08:10](#msg62fb51099d3c186299602ee8)@meijeru `load` does not simply `read` a file, that is it does not the same thing. But most importantly what I am saying is that having a polymorphic function that reads all 4 types is my "problem" that is the common pattern that I think is useful to solve and that is not (directly) related to load-json. P.S.: that is not \*my* function , it is`system/codecs/json`.

pekr

[08:15](#msg62fb52179994996293c4dc6d)@rebolek It asked for the permission at the beginning, as it always did. I selected "All". No hidden window here ....

rebolek

[08:17](#msg62fb52adb16e8236e3d9c3f5)@pekr I see. I was able to build the console on Linux. I guess that you probably may not have `git` installed on Windows and there's no error checking of the shell call, so it hangs.

[08:20](#msg62fb53547ccf6b6d45360850)@luce80 `load` does not simply `read` a file, but does exactly what you want - it's a polymorphic function that reads all 4 types.

[08:21](#msg62fb53a1aa091774296dd937)

```
>> load/as {["hello","world"]} 'json
== ["hello" "world"]
```

pekr

[08:25](#msg62fb5481b16e8236e3d9d0ba)@rebolek right, I use Github Desktop app, not sure what it installed and where ....

[08:28](#msg62fb5544443b7927a7750b96)I can see some instructions / changes in readme.md, will read it ....

rebolek

[08:28](#msg62fb5549458f823ce0e3506d)Also, there's a bug in `%build/git-version.r`.

[08:29](#msg62fb55569d3c186299604c7d)But it probably shouldn't affect building.

luce80

[08:32](#msg62fb5606458f823ce0e3550a)@rebolek I do not want to `load` a file! or a string!, I want to `read` them so that the result is still a string! or a binary! in a way similar to the one used by `system/codecs/json/decode` , and I think that this (reading those 4 types) is a common pattern, in which also `system/codecs/json/decode`occurred.

rebolek

[08:35](#msg62fb56cb443b7927a77516f2)@luce80 sorry, but I am getting confused. What four types?

luce80

[08:36](#msg62fb56faf4d7a323de330b26)@rebolek `[string! binary! file! url!]`

rebolek

[08:37](#msg62fb5742f4d7a323de330cc1)I see. So you just want to be able to pass `string!` and `binary!` to `read`. No conversion needed. Right?

luce80

[08:39](#msg62fb57c66837563d1c348055)@rebolek Right. And so also no type check needed.

rebolek

[08:41](#msg62fb583e9994996293c507e7)Well you can either write your own function to do this or write a dummy codec (for example `raw`) that would pass `string!` and `binary!` and read `file!` and `url!`. And the you could use `load/as ... 'raw`

luce80

[08:47](#msg62fb59b49d3c186299606f83)@rebolek Of course I can write my own function as I always did, I think that is implicit. The idea of a dummy codec seems interesting, not sure is the "Good Thing (TM)" to do but probably will give it a try. And why not hack my own version of gui-console's `read` while I am at it ;) ?

rebolek

[08:49](#msg62fb5a067ccf6b6d4536342d)@luce80 well, you're free to do whatever you want :) but at least you can add codecs on runtime and don't need to compile them in.

dockimbel

[10:51](#msg62fb76c26837563d1c355f02)&gt; Also, there's a bug in `%build/git-version.r`.

Where?

## Wednesday 17th August, 2022

GiuseppeChillemi

[19:34](#msg62fd42ddaa091774297b8cdd)@dockimbel :point\_up: SPAM

greggirwin

[19:51](#msg62fd46d105ad4a37015d9311)Thanks @GiuseppeChillemi, I deleted it.

[21:21](#msg62fd5bf79994996293d37660)Coming from https://gitter.im/red/help?at=62fab5dd9994996293c07d8b

I'm against `+=, *=, etc.` 1) They are historical artifacts better served in other ways. 2) Their syntax is predicated on `=` being assignment, which isn't the case in Red.

hiiamboris

[21:46](#msg62fd61c09994996293d39fcd)`+: *:` will work fine in a dialect

greggirwin

[21:55](#msg62fd63df3a42316d335e1fdd)They work fine technically, but \*look* like `set-word!`s. Like some series-related dialects for ordering operations (`pipe, walk`), I think there may be a better way.

hiiamboris

[21:57](#msg62fd6434cf6cfd27affa9b0b)Of course. Better way is computer should do this (`x: x + a` -&gt; `x +: a`) for humans. Not the other way around ;)

## Thursday 18th August, 2022

GiuseppeChillemi

[08:00](#msg62fdf190647d633cf691e0fc)I see in the Redbol journey the usage of `?` at the end of words has taken 2 paths: `?` is used as an interrogation of a condition, like `equal?` or `same?` and also in words that returns some data like: `words-of?`, `specs-of?`. I remember having read that there has been changes on the latter use. Which is the current standard to have returned values?

rebolek

[08:01](#msg62fdf1c9f4d7a323de4592e1)`words-of` and `spec-of` don't have question mark at the end.

GiuseppeChillemi

[08:02](#msg62fdf206aa09177429805697)Thank you, sometime my brain goes short-circuit.

rebolek

[08:02](#msg62fdf210cf6cfd27affe7ed5)You probably meant `length?`. There was a discussion (in R3 times) that functions returning data instead of `logic!` should use `-of`, so `length?` would become `length-of`.

GiuseppeChillemi

[08:03](#msg62fdf237d020d223d3ad0aab)Yes,I have mixed the elements while building the post.

[08:03](#msg62fdf25811a6a83d04280946)And thank you for writing the precise scenario and rule.

[08:03](#msg62fdf265f4d7a323de4595e0)How has ended the discussion?

[08:05](#msg62fdf2ccf4d7a323de4596c0)(I mean, has been written a precise rule on this kind of naming?)

rebolek

[08:19](#msg62fdf6053a42316d3362426c)No precise rule. There was a clash between purists and rationalists who argued that people are used to `length?`.

hiiamboris

[08:52](#msg62fdfdd972ad51741f51e891)https://github.com/red/REP/issues/68

loziniak

[09:43](#msg62fe09d27ccf6b6d45498fbd)Red track in Exercism just got launched: https://exercism.org/tracks/red

[09:46](#msg62fe0a87458f823ce0f68b06)Any suggestions, errors or requests, please file an issue: https://github.com/exercism/red

[09:52](#msg62fe0be7647d633cf6929062)And, of course, all die-hard Red hackers, feel invited to mentor: https://exercism.org/mentoring

[09:54](#msg62fe0c5305ad4a37016332f7)or anyone - get involved at any level, even if it's just testing or learning :-)

[09:55](#msg62fe0c7d443b7927a7889f02)Exercism talk mainly on \*\*training\** channel: https://gitter.im/red/training , let's celebrate there.

GiuseppeChillemi

[10:08](#msg62fe0f869d3c18629973946a)@hiiamboris Thank you, I was searching for it but it has no definitive answer. There is not a common rule but I see that most of ending with `?` return numerical values. This may have a reason in our depths of thought, or may be just tied to the era of Rebol having mostly numerical answers to questions.

ldci

[11:13](#msg62fe1ef611a6a83d04295159)@loziniak Thanks for the links :)

dockimbel

[12:03](#msg62fe2a8c05ad4a3701640b7b)@loziniak Amazing, congrats!

jpaquim:matrix.org

[12:13](#msg62fe2ce66837563d1c48c1fd)I've been fascinated with https://github.com/remko/waforth lately  
Design notes: https://github.com/remko/waforth/blob/master/doc/Design.md  
https://el-tramo.be/blog/waforth/  
Would it be feasible to implement Rebol/Red using the same kind of dynamic linking approach? i.e. compiling words/functions to Wasm functions, loading them into a function ref table, and immediately having them available for further use?

## Saturday 20th August, 2022

hiiamboris

[12:46](#msg6300d7c3443b7927a79c5b16)## I've made an example \[alternate stylesheet for Spaces](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/stylesheets/glossy.red)

Mainly to evaluate the styles design limitations and show what's possible (also because some people hate sepia color :)

It's totally not an example of a \*simple* or \*efficient* stylesheet. Sometimes it transcends the bounds of what styling was designed for, and it wastes a lot of Draw commands to achieve it's look.

Here's how it looks on it's test script:  
!\[](https://codeberg.org/hiiamboris/media/raw/branch/master/spaces/demo-glossy-test.gif)

Test also \[shows](https://codeberg.org/hiiamboris/red-spaces/src/commit/c079d3052bc655153cb12be0b59cb9ec54bbab69/tests/glossy-test.red#L10) how to include it properly 🤷.

And here's Red Inspector with it included (though Inspector declares it's own styles which replace those from the stylesheet so it's not fully styled, and has a glitch with `hscroll`):  
!\[](https://i.ibb.co/0YJTpcw/GIF-20-Aug-22-15-29-52.gif)

Of course for full effect one would need to remove the OS frame and draw one's own on a borderless window.

GiuseppeChillemi

[12:49](#msg6300d866aa0917742995056c)WOWOWOWOWOW! GREAT!!!

dockimbel

[12:49](#msg6300d870443b7927a79c5fc1)@hiiamboris Could you implement a \[Material Design](https://material.io/design) skin?

hiiamboris

[12:50](#msg6300d8ad72ad51741f664831)@dockimbel Should be easy enough (it's just font and color choices, some offsets maybe too). But MD has a lot of high level widgets not yet implemented by me. Also shadows do not work yet in Draw.

dockimbel

[12:51](#msg6300d8cb9994996293ec8961)Shadows and animations also.

hiiamboris

[12:51](#msg6300d8ee647d633cf6a697a2)Animations are TBD for now ;)

greggirwin

[16:36](#msg63010d8772ad51741f67cd1c)Great work @hiiamboris.

Respectech

[22:12](#msg63015c47458f823ce00e3b71)Amazing! I could see using Spaces for my slideshow program if I port it to Red.

## Sunday 21st August, 2022

pekr

[03:40](#msg6301a94b458f823ce0104ddb)re Animations - let's not forget, there is a PR for a complex VID animation system already, where lots of effort was put into ....

hiiamboris

[07:22](#msg6301dd33d020d223d3c8b8df)@Respectech if images were garbage collected ;)

GiuseppeChillemi

[15:23](#msg63024dfeaa091774299f39ac)About the design of `pick` and ordinal and returning `none` or `error!`, I have found this: http://www.rebol.net/r3blogs/0008.html

greggirwin

[18:31](#msg63027a18443b7927a7a791c3)@hiiamboris, thanks for the build tools. Just checking them out now. I set up RedBulidGUI but get this error in the R2 console:

```
*** Preprocessor Error in #do
*** Syntax Error : Invalid file -- %/D/Red/_redbuild/bin/redgui-master-%cs-1079d93.exe
*** Where: [#do]
*** Near:  {(line 10) build-basename: %/D/Red/_redbuild/bin/redgui-master-%cs-1079d93.exe}
```

Guessing the `%cs` in the middle is the issue.

hiiamboris

[18:33](#msg63027a82458f823ce015f4a9)hmm how to reproduce?

greggirwin

[18:35](#msg63027af6458f823ce015f6b2)Another note. I typed in a branch name, then reselected `master`, but it still picked up what I had typed on the next build.

[18:36](#msg63027b40458f823ce015f9a6)Can't predict how to dupe yet, since I haven't done more than glance at the code.

[18:38](#msg63027baa9d3c186299932a33)Hmmm. Git handling issue perhaps?

```
call/wait/output `"(gitcmd) log -1 --format=%h/%cs"` commit: clear {}
```

hiiamboris

[18:39](#msg63027be1b16e8236e30cf5f3)&gt; Another note. I typed in a branch name, then reselected `master`, but it still picked up what I had typed on the next build.

https://github.com/red/red/issues/5008#issuecomment-1214207229

greggirwin

[18:40](#msg63027c007ccf6b6d45696bbf)Ah, maybe a change in your `common` repo that I haven't synced.

hiiamboris

[18:40](#msg63027c10aa09177429a06cbc)&gt; Hmmm. Git handling issue perhaps?

I wonder if your git doesn't understand `%cs` format?

[18:40](#msg63027c319994996293f85865)Can you run `git log -1 --format=%h/%cs` manually?

greggirwin

[18:41](#msg63027c4311a6a83d044829e2)And back to your repos being moved when I try to sync that. :^\\

[18:41](#msg63027c747ccf6b6d45696d8e)That command returns `1079d93ee/%cs`.

[18:54](#msg63027f4d443b7927a7a7b630)Updated to use `common` from codeberg.org.

hiiamboris

[18:59](#msg63028086f4d7a323de65d1cb)Maybe try updating `git`. I've no idea what formats each version supports, just used the one that I won't have to convert.

greggirwin

[18:59](#msg630280a0458f823ce01626b4)I can look, but what does %cs do in this case?

hiiamboris

[18:59](#msg630280a0d020d223d3cd4077)

```
D:\devel>git --version
git version 2.28.0.windows.1
```

here

greggirwin

[19:00](#msg630280bed020d223d3cd40a0)`git version 2.17.0.windows.1`

hiiamboris

[19:00](#msg630280d272ad51741f72212c)https://git-scm.com/docs/git-log#Documentation/git-log.txt-emcsem

[19:00](#msg630280ea443b7927a7a7c2c3)just short date

greggirwin

[19:01](#msg630280f19994996293f872a7)So why we need `format`. :^)

hiiamboris

[19:01](#msg63028100f4d7a323de65d4e2)indeed ;)

[19:01](#msg6302811f6837563d1c6740e6)lol those abbreviations are so for humans... remind me of our formats discussions

[19:24](#msg63028653aa09177429a0c287)Is it fine now?

[19:24](#msg63028663458f823ce0164b13)I will add an error if git is too old

greggirwin

[19:28](#msg63028761d020d223d3cd6d63)I updated, but won't know if it took until I reboot apparently. I hate rebooting.

hiiamboris

[19:30](#msg630287d3d020d223d3cd7043)why reboot?

greggirwin

[19:32](#msg63028847f4d7a323de66069d)As some installers do, it said so. And the version still reports the same.

[19:33](#msg6302887e72ad51741f72573b)Why any non-integrated tool should require that, I have no idea.

[19:34](#msg630288cb6837563d1c6772f9)I'll try doing it outside Tortoise.

[19:37](#msg630289947ccf6b6d4569cb0b)That seems to have fixed it.

hiiamboris

[19:38](#msg6302899df4d7a323de66108e)Never believe when they say Reboot, unless it's a driver ;)

greggirwin

[19:38](#msg630289aed020d223d3cd7ff7)Agreed.

[19:43](#msg63028ae49d3c186299938e6b)Two more notes:

\- Should it use `-qs` when launching Rebol, so you don't have to allow access each time?

\- Needs to check for/make %bin/ in the output dir. Build fails, after the compile, if it doesn't exist.

[19:44](#msg63028b029994996293f8c215)Minor issues. Really helpful tool. :+1:

hiiamboris

[19:56](#msg63028ddc7ccf6b6d4569e8c2)Thanks

biaocy

[20:03](#msg63028f97f4d7a323de663cb4)Hi everyone, I'm new on redlang

[20:04](#msg63028fb9cf6cfd27af1f8f17)Does anyone know how to get return value from a button event inside a view?

[20:05](#msg63029008d020d223d3cdae53)Tried `catch & throw` , didn't work out

hiiamboris

[20:05](#msg6302901172ad51741f7296de)Hi an welcome @biaocy :)  
Just assign it to a word? `view [button "click" [result: "return value"]]`

## Monday 22nd August, 2022

GiuseppeChillemi

[16:14](#msg6303ab653a42316d338ace5a) Do you confirm that `write` on objects is unimplemented?

[16:15](#msg6303ab94458f823ce01e46bd)(In the file I obtain a `make object! [ ]` with nothing inside)

hiiamboris

[16:17](#msg6303ac1a7ccf6b6d4571dadc)looks like a bug to me

[16:18](#msg6303ac39d020d223d3d5ae5b)raise an issue

GiuseppeChillemi

[16:35](#msg6303b04faa09177429a91fa6)Also I see that `SAVE` has saved my objects truncating them at index position, wherever it is, it would be nice to put a warning somewhere in the documentations.

[16:36](#msg6303b0a66837563d1c6fb1e2)(Or a way to save them with series at head position)

hiiamboris

[16:42](#msg6303b1f3443b7927a7aff2db)There's no index in an object.

[16:42](#msg6303b20905ad4a37018b8345)Use Redbin if you want to save series as is.

GiuseppeChillemi

[16:42](#msg6303b20c458f823ce01e75eb)Pardon, I have speed written.

[16:43](#msg6303b2353a42316d338afb0e)I meant: `blocks` inside `objects`, and I suppose other series.

[16:44](#msg6303b26c11a6a83d0450b023)Blocks in saved `objects` are truncated at their position, and so you loose the previous elements of the series. You must manually reposition each `block` element at head and then save.

cloutiy

[17:13](#msg6303b952d020d223d3d619d7)Can a function take an argument that is string! or none! ?

[17:14](#msg6303b96ccf6cfd27af28007b)Saw this in exercism and was my first time encountering this.

hiiamboris

[17:16](#msg6303b9e011a6a83d0450e6e5)`f: func [s [string! none!]] [probe s]`

[17:16](#msg6303b9e611a6a83d0450e702)what's the problem?

cloutiy

[17:16](#msg6303b9f1d020d223d3d61ce9)But giving the function no arguments gives an error

hiiamboris

[17:17](#msg6303ba2c9d3c1862999bd38a)in that case try `f: func ['s [string! unset!] [probe s]`

cloutiy

[17:18](#msg6303ba713a42316d338b3782)Ok will try. I basically copied the function from exercism and pasted in my repl and tried to call with no args and gave an error. Will try what u suggest

## Tuesday 23th August, 2022

GiuseppeChillemi

[00:14](#msg63041bd772ad51741f7d910f)@dockimbel About `find/deep` I have made some research on the various `find` methods.  
I have made 8 tests, each with a different method.  
The first group of 6 tests is made on data organized as a table of block of blocks.  
The last tests are on data organized as single column flat and 5 columns flat, and I have used native `find` and `find/skip` without sub-searching.  
There is even a dynamic change to avoid one `get` in `path`

Here is a gist with the \[code](https://gist.github.com/GiuseppeChillemi/96790bbfba304e5a9ab346b3a33a5c8d)

Here are the test results:

```
Nested-find: 0:00:00.116006 ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u 99999 ltlk444rj3vk2ga3u
Double-path: 0:00:00.0970079 ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u 99999 ltlk444rj3vk2ga3u
single-path: 0:00:00.0720084 ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u 99999 ltlk444rj3vk2ga3u
dynamc-code: 0:00:00.0700026 ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u 99999 ltlk444rj3vk2ga3u
     repeat: 0:00:00.0780061 ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u 99999 ltlk444rj3vk2ga3u
repeat-find: 0:00:00.0980084 ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u ltlk444rj3vk2ga3u 99999 ltlk444rj3vk2ga3u
       Flat: 0:00:00.0030003 99999
       Skip: 0:00:00.0030014 99999
```

Single `find` or `find/skip` are always about 25x faster than my code (which doesn't even do type checks for speed reason)  
I think that implementing a kind of sub searching as native/or nested r/s code, could maintain a great advantage over interpreted one. I guess it could keep speeds over 12x than interpreted code. This would greatly benefit database like operations.

[01:13](#msg630429cecf6cfd27af2b3151)Note, I have run this test on R3 and R2 too and compiling the script on Red.  
\* Red Compiled is 2x faster than Red on all test but the last 2  
\* Rebol2 is slower, it runs half the speed of Red interpreted and it is 4x slower than the compiled Red Script, apart native find which is on par  
\* R3 is faster than Red, being 2x its speed  
\* R3 shines in the `flat` (no skip) test on single value: it is 5x faster than Red.

```
Flat: 0:00:00.000632
```

Test results are as comment at the end of the \[gist](https://gist.github.com/GiuseppeChillemi/96790bbfba304e5a9ab346b3a33a5c8d)

[01:24](#msg63042c5e9994996293047642)Note: I don't know how to write faster loops than those in the gist or if parse has some special r/s optimizations and would be faster. It's your turn to show if a speed up is possible, I have reached my actual limits.

hiiamboris

[07:43](#msg63048539999499629306f5fe)Giuseppe and his profiling results ;)

[07:44](#msg63048565647d633cf6c09f28)Your random string is not copied btw. Oh it was already reported..

GiuseppeChillemi

[08:26](#msg63048f22d020d223d3dc0961)Does this undermine the timing results?

hiiamboris

[08:36](#msg630491a79d3c186299a209fb)If you're looking for the \*same* string, then yes. Absolutely.

[08:37](#msg630491d4d020d223d3dc1de3)Equality will prematurely exit when it detects string is the same.

[08:38](#msg6304920a9d3c186299a20b86)But profiling is an art in itself. Not to be taken as lightly as you do.

[08:39](#msg63049243cf6cfd27af2e2999)So you've measured \*something\*. First questions anyone will ask:  
\- what's the error?  
\- is your result reproducible?  
\- does it represent real world scenarios and which ones? how closely?

[08:46](#msg630493f8f4d7a323de74a292)Usually we either profile specific working code (to find bottlenecks), or just compare raw operations (like `find` on some series). Or we model known edge cases and test those (to understand edge case performance). Otherwise you just can't draw any conclusions from the result.

GiuseppeChillemi

[09:06](#msg63049896aa09177429afbf1b)I have not modified the test on purpose, because I was not searching for the string but for the IDX number 999999 on 4th column. I was assuming that having the same string on the others, would make absolutely no difference on the column where the number progression is. There is only one chance the test could be undermined: in the FLAT test; it could have a speed gain because the other columns are always the same data, in the case the series buffer could act like a caching mechanism (I don't know the internals but I assume it does this). But having the `find/skip` test a similar result I doubt that this is happening.

hiiamboris

[09:12](#msg63049a0872ad51741f80fe4f)If it's a number you're looking for, string shouldn't affect it, yes.

GiuseppeChillemi

[09:13](#msg63049a3505ad4a370191e982)Just for curiosity, series buffers does act like a cache?

hiiamboris

[09:14](#msg63049a6e647d633cf6c131f2)Just holds the series itself.

[09:25](#msg63049d0d458f823ce0250093)In any case, you're misusing `find` by giving it an O(n) task over long `n`, and demanding a few times speed increase as if that would matter. You should create and maintain (hash) indexes of your data if you want fast O(1) search over it, if you can't organize it as a single hash. (but hash is in a very bad state for profiling right now too)

GiuseppeChillemi

[09:29](#msg63049dedcf6cfd27af2e7d97)So I would expect the pure `find` test on a flat block, to be influenced by having all the strings being the same one and in buffer. In this case, the real time could be longer and, at the same time, the `find/skip` could show the same result just because it is skipping 4 elements and not checking them.

[09:29](#msg63049e06999499629307b411)But I have doubts! :-)

[09:45](#msg6304a1d2cf6cfd27af2e9af3)@hiiamboris  
&gt; In any case, you're misusing find by giving it an O(n) task over long n

Yes, I know but in this way, I could measure the real performance of just the `find` code and other loops without intermediaries.  
I was amazed how `REPEAT` + PATH approach is faster than `FORALL` but I suspected it from the previous tests made some days ago where get/set operation where slower than paths. Also I was amazed how a simple check `all [block? column find column value]` is able to halve the speed of the loop.

[17:14](#msg63050afd72ad51741f84338e)@hiiamboris I have converted all tables to `hash!` and published the results in the gist. Everything is slower using hash! but native `find` and `find/skip` have NO MEASURABLE time at all. The slowing is a natural result as I suppose hash! has a little overhead and it should, and not including block the block content in the `hash!`, you have the overhead head but not the advantage. But on flat data, we are going at the speed of light. Here a snapshot of the result set. All zeroes!

```
....
repeat-find: 0:00:00.0960044
       Flat: 0:00:00 
       Skip: 0:00:00
```

greggirwin

[18:26](#msg63051beb7ccf6b6d457c2bb6)As @dander said in red/help, I would start with use cases and performance \*requirements\*, to see what design paths those lead to.

Oldes

[18:55](#msg630522aaf4d7a323de78c169)@GiuseppeChillemi it is logical.. in the ideal case find on hash is O(1) operation while on block it is O(n). You just have to pay for the building a hash table when using a hash.

GiuseppeChillemi

[20:44](#msg63053c2105ad4a370196854c)@greggirwin I have taken some notes:  
`find/skip` is the most important scenario for me.  
I would need to search inside a series (a block/hash!)  
The inner search should accept an apply block or object, the parameter of the inner search could be preconfigured and the inner native find could run immediately at each upper target type.

```
into-condition: make object! [
    series: the-series 
    value: the-value 
    any: true 
    skip: true 
    size: skip-size
]
find/skip/any/into data any-condition|datatype! skip-size into-condition
```

[20:46](#msg63053cb9647d633cf6c5e111)Also, `into-condition` could be a block with multiple into-condition `object!s`

```
[into-condition1 into-condition2 into-condition3]
```

[20:51](#msg63053db6cf6cfd27af33035b)An option could be to have bound block of code and condition interleaved to manage the specific occurrence like:

```
[
  into-condition1 [block-of-code1]
  into-condition2 [block-of-code2]
  into-condition3 [block-of-code3]
]
```

[20:53](#msg63053e477ccf6b6d457d2e2e)Where `[block-of-codeX]` has the word `value` bound and containing the search result which has led to the sub search to start.

## Wednesday 24th August, 2022

greggirwin

[20:43](#msg63068d876837563d1c845ca3)@hiiamboris when I use `redbuild` to build the consoles, the CLI version seems normal, at ~1.3M, but the GUI console is ~2M, where prior to the new release process was ~1.5M. Is this expected?

hiiamboris

[20:46](#msg63068e2205ad4a3701a01478)That's suspicious. Could you have included `view` module twice or smth?

greggirwin

[20:47](#msg63068e503a42316d339f3ed6)`Modules to add` is empty in `redbuild`.

[20:47](#msg63068e5ff4d7a323de82dd47)I thought something must be doubly included as well.

hiiamboris

[20:47](#msg63068e67647d633cf6cf2a20)Hm. I don't know what could be the reason...

dockimbel

[21:55](#msg63069e439d3c186299b09b6c)&gt; but the GUI console is ~2M, where prior to the new release process was ~1.5M. Is this expected?

That looks like a missing /Library component in the Rebol kernel, so that Redbin payload compression cannot be achieved (as it requires loading our CRUSH compression library).

greggirwin

[22:00](#msg63069f86999499629315e1a2):+1:

[22:01](#msg63069fb1cf6cfd27af3cfd08)I tried with a fresh instance of `redbuild` as well, just to be sure there wasn't a double include from a previous run.

## Thursday 25th August, 2022

GiuseppeChillemi

[15:51](#msg63079a7b443b7927a7cbf801)Any chance progress.red-lang.org could be reactivated. It was so positive to read all the github news there there.

meijeru

[16:49](#msg6307a80099949962931d5dc6)@x8x See the above plea. For me :+1:

[16:50](#msg6307a858f4d7a323de8aa45e)Especially since I see -- to my delight -- very much increased activity, with many outstanding issues being tackled and resolved.

GiuseppeChillemi

[17:27](#msg6307b114cf6cfd27af4490b5)@meijeru I am delighted too. I see all the hard work put in our beloved language from the team and it makes me happy. Once I have written that the news feed on the upper right side was important. Well, now I have understood it is also the activity column on the right side of this chat: every additional activity I see added, it makes me feel more and more positive and the hope for a bright future increases.

## Saturday 27th August, 2022

GiuseppeChillemi

[23:35](#msg630aaa39aa09177429db0d6e)@greggirwin I have "reported" a message to test If we can signal spam via this feature. Do you see any warning in your managing console? @hiiamboris , I have reported a messsage from you :D

## Sunday 28th August, 2022

hiiamboris

[07:12](#msg630b157872ad51741faf5e32)MS once contacted me when I reported someone, for more clues.

[07:22](#msg630b17c6cf6cfd27af5ce45e)Oh but that was when I reported user's page, not the message.

[07:30](#msg630b19a411a6a83d0485bc43)As gitter is matrix's toy now, I doubt it's "report" button is even connected to anything ;)  
Especially since with OAuth2 most accounts are not on the gitter itself.  
(all my attempts to contact matrix.org staff when I needed it were futile)

greggirwin

[17:37](#msg630ba7f27ccf6b6d45aa4fbd)No warning here @GiuseppeChillemi.

## Monday 29th August, 2022

GiuseppeChillemi

[18:33](#msg630d066e6837563d1cab44a8)@hiiamboris Could you add to VID/S a way to use vectorial or bidmap images as or in buttons (considering a clicked state too)? Or as background filling of shapes?

[18:33](#msg630d0676aa09177429e4684e)Are they already there?

hiiamboris

[18:43](#msg630d08d072ad51741fb5e4a8)What Red supports is already there for over a year. \[image](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/reference.md#image) \[button](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/reference.md#button)

[18:47](#msg630d09b7f4d7a323dea96ece)VID/S is just a convenience layer. It only adds syntactic sugar.

## Tuesday 30th August, 2022

dockimbel

[15:58](#msg630e33c299949962933ed142)@hiiamboris The "base self" tests are failing again: https://github.com/red/red/runs/8095880504?check\_suite\_focus=true

Note that the Rebol version used is 2.7.6. If the 2.7.8 version is needed, I can give you the link to download it from the setup script.

hiiamboris

[16:14](#msg630e3749cf6cfd27af657fa8)I have both

[16:22](#msg630e39627ccf6b6d45af60cb)It's a Red test anyway

[16:45](#msg630e3ea16837563d1cadb38a)@dockimbel I'm 99% certain it's a heisenbug. There's just no other way collected color tuples could have become `none` and not failed the other tests.

dockimbel

[18:27](#msg630e56a772ad51741fb879a1)The Rebol internal bugs are giving the worse heisenbugs I have experienced.

GiuseppeChillemi

[21:42](#msg630e845c443b7927a7ede532)This is the reason why it is better to remove a layer of things the team does not control.

## Wednesday 31st August, 2022

hiiamboris

[13:19](#msg630f5fdd9d3c186299dbb567)For @GiuseppeChillemi and other profiling fans: `clock` mezz is now in the official build:

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> clock/times [1 + 2] 1e7
0.14 μs	[1 + 2]
== 3
```

GalenIvanov

[14:33](#msg630f711f6837563d1cb0021e):+1:

planetsizecpu

[15:32](#msg630f7f28cf6cfd27af6803ba)Great! @hiiamboris

pekr

[16:11](#msg630f8844647d633cf6fae61e)Does `clock` replace `dt`?

GiuseppeChillemi

[16:12](#msg630f88689994996293417924)@hiiamboris Thank you, I have already seen it this morning. Nice addition, it goes down to microsecond. I have read that going down to nanosecond, nearly doubles the execution time.

hiiamboris

[17:08](#msg630f95a105ad4a3701cc05dc)@pekr no, uses it

## Thursday 1st September, 2022

bgrossot

[09:01](#msg631074cfb16e8236e3572b7a)Hello, I want to contribute to the red project. So I try to compile it but I have a 64bit Mac, so rebol does not start on it. Have someone an idea, how to solve this problem ?

rebolek

[09:52](#msg631080c8aa09177429eb2a1a)@bgrossot unfortunatelly, Red doesn't support 64bit :( But you can use docker for example, that's what I'm using.

bgrossot

[10:00](#msg631082c2aa09177429eb2de0)I will use virtualbox and linuxmint, hope it works

rebolek

[10:11](#msg63108539443b7927a7f1ccea)If you install 32bit libs on Linux, it should work without a problem

bgrossot

[10:24](#msg6310885b72ad51741fbcb4e9)Thanks for the advice

## Saturday 3th September, 2022

meijeru

[12:56](#msg63134efb999499629348a0b5)IO branch is brought up-to-date. Does that promise more work on it?

dockimbel

[15:59](#msg631379d311a6a83d04989e5e)IO branch is a work in progress.

gsw945

[16:23](#msg63137f907ccf6b6d45b98eb7)how to make window keep topmost on windows platform?

hiiamboris

[16:53](#msg6313867b05ad4a3701d3678d)@gsw945 not implemented https://github.com/red/red/issues/4736 so your only way is via OS API

GiuseppeChillemi

[18:48](#msg6313a16ef4d7a323deb6287a)Also it would be great to have drag and drop here.

## Monday 5th September, 2022

ldci

[10:18](#msg6315ccff647d633cf6068a54)Some notes about image datatype in Red  
In REBOL/View 1.3 it was necessary to redesign the image datatype in order to make image  
operations more consistent and less system dependent.The image datatype is structured as a standard REBOL series. It has a head, a tail, and can be positioned to any point in-between. In additional, the new image datatype allows two dimensional positioning and sizing through the use of an X Y pair. (http://www.rebol.com/docs/image.html#section-1)

Attention: first pixel coordinate is 0x0 and first pixel index is 1!

In Red, image datatype is a series-like. This means that some series functions are not working.

Making images  
img1: make image! reduce \[200x100 red] :--yes  
img2: make image! reduce \[50x50 green] ;--yes

img3: make image! reduce \[50x50 blue 128] :--no  
If you want add transparency on image:  
img3: make image! reduce \[50x50 blue]  
img3/alpha: 128 \[0..255] ;--same value for all pixels  
OR  
imgSize: 2500 (50x50 pixels)  
rgb: make binary! 3 * length? imgSize ;--3 bytes/pixel  
alpha: make binary! 1 * length? imgSize ;--1 byte/pixel  
(you need to populate the rgb and alpha channels with byte values)  
img3: reduce \[imgSize rgb alpha]

Copy images  
The COPY function works in the standard way as it does with all series, making an exact  
copy of the image provided.

i1: make image! reduce \[200x100 red]  
i2: copy i1 ;--yes  
i2: copy/part i1 5x5 ;--yes  
i2: copy/part skip i1 4x4 5x5 ;--yes  
i2: copy/part skip i1 2x2 (i1/size - 4x4) ;--yes

Traversing Images (Indexing)  
You can use all the standard series functions to index to any position within an image series. The functions include: HEAD, TAIL, NEXT, BACK, SKIP, AT, and others.

i2: next i2 ; move to next pixel ;--yes  
i2: back i2 ; move to prior pixel ;--yes  
i2: head i2 ; move to first pixel :--yes  
i2: tail i2 ; move just past the last pixel ;--yes  
i2: back tail i2 ; move to the last pixel ;--yes

Modifying Images  
Images can be modified in two ways. They can be modified as individual pixels (with poke function) or they can be modified as a series of pixels.

change at img1 1x1 img2 ;--yes  
change/dup at img1 10x20 blue 40x30 ;--no  
append img1 img2 ; uses insert ;--no  
remove/part img1 img1/size/x ;--no  
remove/part tail img1 negate img1/size/x ;--no  
insert/part img1 blue img1/size/x ;--no

Searching Images  
pos: find img1 red ;--no

Image Comparison  
The EQUAL?, NOT-EQUAL?, and SAME? series comparison functions work for images in the same way as they do for other series datatypes.

ANDing, ORing, and XORing Images  
Partially supported by Red  
img1 AND img2 ;--no  
img1/rgb AND img2/rgb ;--yes

hiiamboris

[10:30](#msg6315cfae3a42316d33d6b335)&gt; If you want add transparency on image:  
img3: make image! reduce \[50x50 blue]  
img3/alpha: 128

`img3: make image! reduce [50x50 blue + 0.0.0.128]`

ldci

[10:41](#msg6315d25b7ccf6b6d45bdc077)@hiiamboris Thanks :)

[12:50](#msg6315f08872ad51741fc6bddf)`to image!`retuns `none`

dockimbel

[15:07](#msg631610ac72ad51741fc6fd54)@qtxie ^---

ldci

[15:35](#msg63161752647d633cf6072226)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/Cw7z/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/Cw7z/image.png)

[15:37](#msg631617b9aa09177429f5909b)Some tests with lastest version of Red. Under macOS 32-bit, red console is active, but menu does’nt work. No problems on Win 11. Red toolchain is very strict : do not use reserved words in objects! This generates an error related to the redefinition of the word. Under win11, compilation of redCV lib works, but I need to test ALL samples to be certain.

[16:05](#msg63161e59b16e8236e361c381)A question even compiled with -t Windows, libRedRT.dll is required for execution: how add libRedRT.dll in exec?

hiiamboris

[16:10](#msg63161f93443b7927a7fc6b00)

```
-r, --release                  : Compile in release mode, linking everything
                                     together (default: development mode).
```

ldci

[16:11](#msg63161fc699949962934dc06b)@hiiamboris Thanks, I’m tired :)

hiiamboris

[19:56](#msg63165462cf6cfd27af74b375)What's up with the `#()` to `#[]` swap?

pekr

[20:15](#msg631658e011a6a83d049de8a1)I have just today thought about it, seeing a json loading result. Did not felt redbolish at all :-)

## Tuesday 6th September, 2022

hiiamboris

[11:04](#msg6317294e99949962934fba9b)@dockimbel have you considered locking all loaded series to avoid "why do I have to copy" kind of problems?

dockimbel

[12:20](#msg63173af4cf6cfd27af767408)That would change the fundamental semantics of series and change the language itself. So, no, I haven't. Moreover, `"why do I have to copy" kind of problems?` is not a design issue, but a user learning issue. Many newcomers start with a different mental model built from very different languages, and have issues learning something different (like code/data equivalence).

hiiamboris

[12:22](#msg63173b9a7ccf6b6d45c07f54)What do we gain from it (except for function-local caches which are doable in other ways)? Or what would we lose if we locked the loaded series (meaning that `copy` would produce an unlocked one, or even `unlock` native)?

dockimbel

[12:29](#msg63173d1972ad51741fc93c0e)

```
lisp
str: "hello"
append str " world!"
*** Error

list: [1 2 3]
append list 4
*** Error
```

So one would need to write:

```
str: "hello"
str2: copy str
append str2 " world!"
```

or

```
str: "hello"
unlock str
append str " world!"
```

Seems like a great improvement, indeed. :+1:

hiiamboris

[12:30](#msg63173d4911a6a83d049f9b9b)why not

```
str: copy "hello"
append str " world!"
```

[12:30](#msg63173d7105ad4a3701da44da)or `append copy "hello" " world!"` which is what one wanted

[12:31](#msg63173d917ccf6b6d45c082c1)Reason I'm asking is because even C now in this aspect is higher level than Redbol. Modern compilers put literal arrays into read-only memory (even deduplicate them).

[12:33](#msg63173e033a42316d33d98920)And if anyone asks "why Redbol's designed like this" I don't have an answer ;)

dockimbel

[12:33](#msg63173e0c9d3c186299ea9b33)So a C literal array is equivalent to a Redbol series?

hiiamboris

[12:34](#msg63173e50647d633cf6095af8)In a way:

```
#include <string.h>
#include <stdio.h>

void main() {
	int i;
	for (i = 3; i --;) {
		puts( strcat( "hello\x00_____________________________", " world" ) );
	}
}
```

In a more old-school compiler:

```
hello world
hello world world
hello world world world
```

[12:34](#msg63173e6111a6a83d049f9d88)Of course, C won't resize it for you.

dockimbel

[12:35](#msg63173e846837563d1cbea8e1)Then we are wasting time building Red, we should drop it and use C instead, as that's pretty much the same thing, right?

hiiamboris

[12:35](#msg63173eabaa09177429f7c5ef)That's not constructive ;)

dockimbel

[12:36](#msg63173ed211a6a83d049f9efc)Nor is your C example as an answer to my question.

hiiamboris

[12:37](#msg63173eee6837563d1cbea94b)I've shown the similarity.

dockimbel

[12:38](#msg63173f2af4d7a323debcea62)You've shown that C arrays are mutable like Redbol series. That certainly is not enough to make them equivalent, so that same general reasoning can be applied to both.

hiiamboris

[12:41](#msg6317400499949962934fe7f3)Let me put it this way. Pointers are a hard to grasp concept for many people, but necessary for performance. I wish we could live without that, but it's not feasible. But having literally loaded data modifiable makes learning even harder. It's not a critique, it's a matter of fact. So we as designers must justify the design with reasoning.

dockimbel

[12:50](#msg6317421e647d633cf609645f)&gt; Pointers are a hard to grasp concept for many people

That is because some people try to learn system programming before learning CPU and hardware architecture. That's like learning web programming without ever having used a browser, then complaining it's too hard to grasp...

Many people are too lazy when it comes to learning, especially complex abstractions like programming languages. They learn one language and struggle with learning anything different, because they are too lazy to add another mental model, they just want to reuse the same one. We, as designers, should make our learning materials adjusted to deal with such mental blocks and not destroy features just to appeal to the lazy minds.

hiiamboris

[12:53](#msg631742ce9d3c186299eaa39c)I agree, but the question of justification (what we gain/lose) stands.

[12:53](#msg631742e03a42316d33d994ab)I'd like to have the answers for myself if nothing else. Right now it seems like it was just a simpler thing to do.

pekr

[12:59](#msg6317441905ad4a3701da5462)@dockimbel I don't want to necessarily bother you with maybe not so important stuff, though to me even a "cosmetic" things like brackets instead of parens for maps, or `wrote` async event, are kind of important :-) I have created a wish (dunno where exactly though), asking to replace `wrote` by just `write`, from the reasons stated below:  
\* It came from the R3 async stuff, which never really took-off anyway, so no risk of a compatibility issues  
\* We don't use past tense for `connect`, `accept` anyway  
\* Going even deeper (R/S), I can see both past and present tense ...  
\* Apart from the priority - is that a change you can imagine would be acceptable?

Found a ticket - https://github.com/red/red/issues/5112

dockimbel

[12:59](#msg6317441a6837563d1cbeb44c)Here are two reasons, one practical and one from a design perspective.

Oldes

[13:01](#msg6317449705ad4a3701da5530)I may be wrong, but I think that HF once did exactly what @hiiamboris requests in his Ren-C and removed it again after some time, because it was too annoying.

dockimbel

[13:01](#msg631744bfb16e8236e36400df)Practical (scenario: all literal series are immutable by default):

```
str: copy "hello"
append str " world!"

str: make string! 1
append str "hello"
```

Go explain to newbies why they need to `copy` the `"hello"` string in the first place and not copy `"hello"` in the other case. Have fun with that. It's just shifting the need to explain why copying mutable data is needed in some cases and not others. It's part of learning programming.

hiiamboris

[13:04](#msg6317455e11a6a83d049fac97)We're already explaining that. Trying anyway.

dockimbel

[13:05](#msg631745b43a42316d33d99b7c)I was meaning in the immutable literal series by default scenario (edited the post above to explicit that context). See, that would not solve the "need to explain why copy", just shift it to another place.

Oldes

[13:06](#msg631745bc647d633cf6096ba0)I was right... Ren-C from year 2019

```
>> x: "aaa"
== "aaa"

>> append x "b"
** Access Error: value is CONST (see MUTABLE): "aaa"
** Where: append console
** Near: [append x "b" ~~]
** Line: 1
```

hiiamboris

[13:07](#msg63174605cf6cfd27af768bc1)Great. Now I need to find his design ramblings about that ;)

Oldes

[13:07](#msg63174611d020d223d3246238)Good luck.

dockimbel

[13:13](#msg6317479511a6a83d049faffd)Design (scenario: all literal series are immutable by default):

Redbol are homoiconic languages. All code is represented as literal series (at least before evaluation, except for literal maps, which are breaking the model). Locking all series on load would break the language, as most of the literal data-structures need to be modified in some ways during the evaluation process. It would prevent binding from working. To circumvent that, one would need to use copying pretty much everywhere in the interpreter and standard library. It would affect performances and memory usage massively.

It would be a nightmare also for end users as many actions/natives are modifying in-place, so would require an explicit `copy` everywhere. In order to make it work without requiring that, the semantics would need deep changes which would result in a quite different language than Redbol.

[13:22](#msg63174982458f823ce06d18c5)Breaking pre-conceived mental models should be the purpose of the introduction section of a Red/Core manual. I've planned since years an article (that could later be re-used for such introduction) about that called "No variable, no scope, no code".

hiiamboris

[13:23](#msg631749b505ad4a3701da5ccf)Thanks. Binding as modification is the piece I forgot to think about. Very solid argument ☻

pekr

[14:25](#msg631758646837563d1cbedf22)The article name reminds me of Matrix - there's no spoon :-)

ldci

[14:54](#msg63175f2b458f823ce06d4837)@dockimbel. Thanks for this very interesting discussion. We have to insist : in Redbol, evertyhing is a word. Variables, functions, objects, structures, symbols and words are just words ...

hiiamboris

[14:57](#msg63175fe29994996293502d41)Although the more I think about it, the less convinced I become. Certainly not a "quite different language".

Just literal caches will be affected semantically, e.g. `buffer: clear []` in functions or that /into thingy `reduce/into [...] clear []`. Both can go into an anonymous context or be composed with a created block (we do that anyway when we want a hash! instead). Such cases are rare, and though I value them, but not much.

Console will be affected, but console could go one step further and unlock everything it loads, so no issue there.

Binding is the biggest issue. All context bodies and all function bodies will have to be copied deeply. Quite an overhead, esp. since those copies will overlap many times. But in the grand scale, a few megabytes copied, so what? We won't even notice except for edge cases like creating millions of functions (who does that?).

Load-modify-save cycle is switched to Redbin because otherwise it's too limited. Redbin doesn't have to lock anything. So that is ruled out as well.

And are those few megabytes worth the bugs they cause? I can for example recall a bug when `react` was binding it's paths in place, leading to very hard to debug situations. So don't tell me that pros don't make mistakes ;) They make more because they write much more code, and often they are caused by refactorings when code was designed for one case but was extended for another.

[15:10](#msg631762e6d020d223d324a2ca)`do with [contexts] [code]` will require a `copy` or `unlock`, which is a pity for "blazing fast" code. Can be worked around with compose, but that loses readability.

[15:35](#msg631768d1458f823ce06d5da6)&gt; Go explain to newbies why they need to `copy` the `"hello"` string in the first place and not copy `"hello"` in the other case.

This can be countered too. One thing is getting an error that says `Access Error Mah Man! You gotta copy [] cuz it was locked and loaded!` and saying "Okay, I'd do everything to make it happy at this hour". Another thing is when \*I believe* that writing `pane: []` clears the pane. Because I \*saw* it working (once) I would not even suspect it to be the problem! Then I need much deeper therapy session.

dockimbel

[16:19](#msg631772f6d020d223d324c4c0)&gt; One thing is getting an error that says ...

My point still stands: the user will be baffled by such error. Why do `"hello"` literal string behave differently depending on where I use it? Both strings are literals! In the immutable by default scenario, it will be as challenging as the current mutable way, to explain it easily to beginners, while costing massively more in performance and memory usage (making the whole language implementation significantly more complex and heavy).

[16:21](#msg6317737172ad51741fc9b41a)&gt; Another thing is when I believe that writing `pane: []` clears the pane.

That's a different point, that's a lack of understanding the language basics, like words vs variables (as François pointed out above), and trying to use idioms from totally different languages in Redbol, expecting they'll work the same way.

[16:24](#msg63177437aa09177429f839cd)&gt; Console will be affected, but console could go one step further and unlock everything it loads, so no issue there.

So the console would run a different language than the one used when launching a script directly from the shell? Sounds great! ;-)

[16:24](#msg63177447d020d223d324c71a)&gt; Load-modify-save cycle is switched to Redbin because otherwise it's too limited.

I can't make sense of that.

hiiamboris

[16:28](#msg63177528443b7927a7fefc61)I mean Red as data format case. Load a file, modify, save. Not going to be popular without construction syntax.

dockimbel

[16:39](#msg631777b7d020d223d324ce7f)That would change the language totally. Red is a data format first and you would kill that.

Construction syntax is a broken concept anyway.

GiuseppeChillemi

[16:43](#msg631778b8d020d223d324d0a6)How do you call the world where objects are created, and so functions. I mean where they are no more in data form but in their "active" (after `make`) one. I have always searched for a definition without success.

hiiamboris

[16:46](#msg6317795fcf6cfd27af76fc78)I don't see how an extra `unlock` call totally changes the language. Neither in load-modify-save case, nor in console. Console doesn't expand macros. Does that make it a different language? Did anyone even notice it?

[16:48](#msg631779c67ccf6b6d45c10586)But IIUC, HF also didn't want to make an exception for the console, so people complained. Yet it seems to me that the real reason for abandoning lock-on-load design was to \*attempt something more flexible\*.

dockimbel

[16:58](#msg63177c2872ad51741fc9c72d)&gt; I don't see how an extra unlock call totally changes the language.

Immutable vs mutable literal series. If literal series are mutable when used from console and immutable otherwise, their semantics are different, therefore, it's a different language. E.g:

```
a: object [s: [] push: func [v][append s v]]
a/push "hi"
```

would work from the console and error out otherwise.

hiiamboris

[17:02](#msg63177d43b16e8236e3647392)Same as `#include %file` works from the script, but not from the console ;)

[17:03](#msg63177d51cf6cfd27af770427)I hope it's an oversight though, yes? ;)

dockimbel

[17:04](#msg63177dbb11a6a83d04a02d72)Compiler directives have no meaning from the console.

hiiamboris

[17:07](#msg63177e576837563d1cbf315a)And macros?

dockimbel

[17:09](#msg63177edd9d3c186299eb29d9)Just for convience. They are allowed in the interpreter only for the sake of being able to test your scripts before encapping/compiling them. We can disable them from the interpreter if they cause you trouble.

[17:21](#msg63178195647d633cf609f13b)We'll probably change that in the future. The preprocessor was introduced as a tool for preparing scripts before generating an executable from them. I think that adding also "macros" was a mistake, at least in their current form. The preprocessor shouldn't have been built in, but provided as an additional tool, like in Rebol/SDK.

hiiamboris

[17:31](#msg63178409d020d223d324ec9e)One tool is easier to use than two. And without the default preprocessor we would see a sprawl of crappy adhoc preprocessors.

dockimbel

[17:40](#msg631785fb11a6a83d04a03f0b)There's value in the preprocessor, but I want to restrain its usage (mostly for generation of libraries/executables) and not as a general feature of the language. Either as an internal module (should have been that from the start), or an external library that can be easily imported. We'll see that once we get to the work on modules.

hiiamboris

[17:43](#msg631786d53a42316d33da29ea)What do you have \*against* it?

dockimbel

[18:00](#msg63178ad3647d633cf60a046d)Same as macros in Lisp, they tend to make the source code unreadable for others. Given that Red scripts are already "hard to read for others" if you start using funky dynamic constructs, macros just make things worse.

hiiamboris

[18:02](#msg63178b2672ad51741fc9e941)I guess I'll then gather use cases for macros in some REP :)

dockimbel

[18:02](#msg63178b4a05ad4a3701daf151)Sure, make a good case for them, so we can review that during the language specs work.

hiiamboris

[18:02](#msg63178b53647d633cf60a05ba):+1:

dockimbel

[18:05](#msg63178bce458f823ce06daae3)You are ready to break Red to make literal series immutable for the sake of beginners not having to learn the basics of code/data equivalence, but are happy to promote macros... that's almost contradictory, you know. ;-)

hiiamboris

[18:06](#msg63178c0faa09177429f86e1b):)

[18:11](#msg63178d61aa09177429f870fa)I'm actually just exploring. I don't think binding or console issue justifies not-copying behavior, but even though I'm playing a devil's advocate, I'm not really convinced myself that limited immutability is worth it. It's tradeoffs either way.

GiuseppeChillemi

[18:55](#msg6317979005ad4a3701db0ab0)I prefer the current model. Even a nested block could become difficult. Also you have to add a way to visually distinguish the locked and unlocked state.

[18:59](#msg631798a1999499629350a494)The `a: []` can be resolved introducing the concept of independent container with its own internal ID, so each one is different. It would be nice to have such ID visible at `probe` for learning purpose, so that different blocks area easily identifiable during the language learning state.

[19:03](#msg6317999605ad4a3701db0eff)Also, it is a lot better if we have `a: make []` at the starting of red learning and then remove it because this emphasized the making of a container, while `a: []` is read as "clear"

[19:04](#msg631799b43a42316d33da5298)(pardon any error, I am on mobile)

[19:18](#msg63179d0f458f823ce06dcd3b)On my personal wishlist, I would prefer having an optional context for each value/literal, and a way to instruct Red to use my own functions to override internal actions, including the `set` one associated to the `:`

gurzgri

[19:42](#msg6317a2add020d223d3252b7b)@GiuseppeChillemi  
&gt; How do you call the world where objects are created, and so functions ... in their "active" \[form] ...

I'd say you're looking for the world of values. Everything there is a value: objects are, functions are, integers are, words, datatypes, plain integers ... These values are values of different "types", a.k.a. datatypes. An unevaluated "function-to-be" is just loaded code in the form of spec and body block values with words and other values in it, evaluating that code makes a value of type function! out of that.

GiuseppeChillemi

[20:16](#msg6317aaafb16e8236e364d443)@gurzgri functions and objects, when they are transformed into values, they split from their data rapresentation, it like having a 2 layers world, while blocks and other values seems to have the data firm coinciding with the loaded one. You can modify a function's body and the value remains the same, while it is not the same for block. So it seems functions are made in a secondary "dimension" and I was searching a name for it.

hiiamboris

[20:19](#msg6317ab37cf6cfd27af77600f)The underworld. The other side. Myrran realm. The astral plane. Kingdom of the dead.

## Wednesday 7th September, 2022

greggirwin

[00:36](#msg6317e7a272ad51741fcaa18f)Let's make notes about immutability here: https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)

We can argue the technical merits of mutability, but let's start with questions. Those are often easier and save time on work that turns out not to be worth pursuing.

1\) Is mutability \*proven* to be an improvement for \*every* language? No. Here we can say that almost \*nothing* is proven in the realm of programming language design, even with the few studies that have been done. Given that it's not proven for every language...

2\) Is it a better fit for some languages, given their overall designs (one element of which may be that data is mutable by default)? Sure, but likely because it fits \*with* the overall language design and goals. Like static typing, there are costs and benefits.

3\) How many people complain about it? Mostly new people or those experienced with the language? Trick question? You get used to things, but sometimes a feature aggravates experienced users even more. Do the same percentage of people using immtuable langs complain that they want to relax things sometimes, or improve performance? Do user leave the language over it, once they get used to it?

4\) Is what Redbol langs do now simple to implement and easy to reason about, even if you have to learn the rules? That is: series are mutable and you need to use `copy`. What else is there to learn?

5\) Is it a likely improvement, a lateral move, or will it make things worse? All opinion and conjecture, right?

6\) If we want to build immutablity-oriented dialects in Red, can we? How hard is that? Just wrap things and `copy` internally, yes? We can even make funcs that have custom specs to copy their mutable args if so denoted. It's also something an analyzer can check and tooling can help with. If we are immutable at the core, how hard is it to go the other way, either at the mezz level or using some unlock/copy-on-write internals? I'll wait while you figure it out. Where is our time best spent?

7\) Immutability is the poster child for functional programming (FP). Has FP won? Is it widespread? No, I don't mean trendy with the cool kids. I mean, how much software in the world runs on it, as a percentage? How many people understand it well and use it effectively? OH! You got me! Spreadsheets. Doesn't count here. Important in the grand scheme, at the application and conceptual level, but a constrained paradigm suited for...a dialect. Still, they're data too, and I think people think that seeing a cell change means the cell changed.

8\) Is it a good fit for Red? My gut says no, but I have a lot of history and bias. That still counts, as does others' experience. Do those who use Redbol langs develop software effectively? Do we know what \*kinds* of systems it's better suited to? Is it likely that some architectures play well with mutability and we can suggest those to people? Yup, a large team working on a monolith wants more guarantees and less trust. A modular system where pieces are potentially ad hoc and done quickly...that's what dynamic, high level languages are for right? To get out of your way.

N) The key question is: WHY WOULD WE DO THIS? The leading reason was `avoid "why do I have to copy" kind of problems?`, but there is no free lunch. You can't ask that question in isolation. Problem X goes away. Problems Y and Z surface to take its place.

N+1) Is mutability \*better* than immutability? Of course not. It's just different. Context is everything.

N+2) Have I personally been bitten by mutability? If it were a snake, I'd be long dead; but it's not. I've been nipped a lot, and bitten hard a few times. My bias right now is that I'd rather do that than suffer the death by a thousand cuts every time it \*wouldn't* have hurt me but I still had to suffer. But it's the Devil I know. For me, mutability fits with Red's overall design as a data oriented language.

[00:39](#msg6317e8326837563d1cc0078c)Ultimately, new people will always trip over syntax and semantics, as  
will experienced authors. Our goal, as I see it, is to find the balance  
between ease of use for neophytes and limitless power for experts. I  
think immutability by default will add pain for both (except some devs  
coming from other langs who are new to Red).

NP) Don't get me started on macros.

Dobeash

[01:48](#msg6317f87a443b7927a70003cf)I swap between JavaScript and Rebol a lot, and generally find the Redbol approach easier to grok:

```
replace/all string ";" " "
lowercase string
```

versus:

```
string = string.replaceAll(';', ' ');
string = string.toLowerCase();
```

The comments I get from non-Rebol folks who see Rebol code for the first time are along the lines of, "Wow! I can actually \*read* that", "Gee, I never realised how much boilerplate language X had", etc

greggirwin

[01:54](#msg6317f9e5443b7927a70006a8)Thanks for the input @Dobeash. :+1:

jasongrossman:matrix.org

[06:45](#msg63183e0e9d3c186299ec8cb0)I like your notes greggirwin (Gregg Irwin). I'm a newbie, so not entitled to strong opinions yet, but I think the burden of proof should be on anyone who thinks Red should change (when it comes to fundamental design features) - otherwise all languages will end up the same and we may as well give up on Red.

hiiamboris

[07:07](#msg63184336f4d7a323debee88f)@greggirwin relax ;) nobody questioned general mutability

greggirwin

[17:15](#msg6318d1a9f4d7a323dec00639)&gt; And if anyone asks "why Redbol's designed like this" I don't have an answer ;)  
&gt; ...the question of justification (what we gain/lose) stands.  
I'd like to have the answers for myself if nothing else. Right now it seems like it was just a simpler thing to do.

Sounds kind of like questioning it, but also thoughts for us to consider for the wiki, so the answers, or justification are written down.

hiiamboris

[17:17](#msg6318d2367ccf6b6d45c3ae14)Question was only about loaded literal series.

greggirwin

[17:19](#msg6318d2a6cf6cfd27af799ad6)&gt; have you considered locking all loaded series to avoid "why do I have to copy" kind of problems?

So here you mean literal when you say "loaded"?

[17:20](#msg6318d2ec7ccf6b6d45c3af75)Thanks for the input @jasongrossman:matrix.org. :+1:

hiiamboris

[17:20](#msg6318d2f0f4d7a323dec00892)Yes. If it's literal, it can be loaded. If it's a result of `make`/`copy` then it was generated, not loaded.

greggirwin

[17:25](#msg6318d414aa09177429fae518)Then I suggest using `literal`, as in "literal form". `Loaded` would be a new term we need to define clearly, because all Red values are loaded.

hiiamboris

[17:26](#msg6318d45f05ad4a3701dd78c2)No. A lot of values are a result of evaluation.

[17:27](#msg6318d48d443b7927a701ad1c)You don't for example load `object!`s (excluding Redbin which I was not touching).

greggirwin

[17:28](#msg6318d4a6f4d7a323dec00c6d)But you can't evaluate anything without values, which have to be loaded. I understand your point, but it's a term I've never heard used, which is why we need to define it if we're going to use it.

[17:28](#msg6318d4c29d3c186299edbfdf)&gt; You don't for example load `object!`s.

Where does that put construction syntax?

hiiamboris

[17:28](#msg6318d4d17ccf6b6d45c3b281)We don't have construction syntax ;)

greggirwin

[17:30](#msg6318d5277ccf6b6d45c3b2f0)We do (arguably) for a few values, and I think it's still worth considering in general.

[17:31](#msg6318d58f72ad51741fcc727e)If there are no objections, I'll use my above thoughts to prime the immutability section in the Red Should... wiki page.

hiiamboris

[17:34](#msg6318d63999949962935309e8)By the way:  
&gt; That would change the language totally. Red is a data format first and you would kill that.  
Construction syntax is a broken concept anyway.

Isn't lack of construction syntax making the "Red is a data format \*first\*" argument much less true? It seems to me that Redbin becomes primarily a data format, while Red becomes primarily a format of source code description. After all Red cannot represent most of it's own values anymore.

greggirwin

[17:43](#msg6318d853f4d7a323dec01522)Redbin is simply a more efficient representation, at the expense of being unreadable. It is \*currently* more capable as well, and may be forever, but if we're going to promote its use, I think we also need to promote a plan for how to use it, and how to live with it long term. i.e. when a change in Red breaks old redbin data.

I think we can also say that Red, as a text format, has limitations people may have to work around, same as with JSON or others. I would not say that Red is a source code format though. That's far too limiting.

meijeru

[19:00](#msg6318ea4672ad51741fcc9d4b)"Construction syntax is a broken concept anyway." I haven't seen proposals for the missing constructs yet, or statements to the effect that these cannot be made, so I for one would still have hope that we can make Red more complete in this respect. Rebol2 had more construction syntax than Red has currently! One way of approaching this could be to look at Redbin, which is supposed to have full coverage, and see if we can "abstract" certain of its constructs into a more Red-like format. I do hope this makes sense...

hiiamboris

[19:07](#msg6318ebfef4d7a323dec03ab1)@meijeru if you wanna have a glance at the abyss, read \[this comment](https://github.com/red/red/issues/4126#issuecomment-902281364)

greggirwin

[19:18](#msg6318ee777ccf6b6d45c3e515)One thing we can do is hold off on construction syntax, and use redbin in the real world. Find out what issues we run up against and how to work around them. Redbin has a couple outstanding issues, but should be almost complete.

[19:20](#msg6318eeffaa09177429fb1b8b)My need have almost always been quite simple. Config files with nested objects/specs historically being a pain point. That domain is on my list as well, so will keep it in mind.

Oldes

[19:29](#msg6318f10f647d633cf60ccf2f)\_Config files with nested objects?_ If it is pain for you, than you are doing probably something wrong. I was able to describe multi MB large SWF files in plain Rebol like dialect without any issues. \[hint](https://github.com/Oldes/Starling-timeline-example/blob/master/Assets/TimelineSWFs/Mlok.txt)

hiiamboris

[19:35](#msg6318f28611a6a83d04a31630)looks like your own dialect :)

[19:35](#msg6318f296443b7927a701e743)I think Gregg wants it out of the box

dockimbel

[19:38](#msg6318f33172ad51741fccb092)&gt; Config files with nested objects/specs historically being a pain point.

You should be using maps for that and not objects. Or just blocks, like Oldes does.

[19:42](#msg6318f431647d633cf60cd4eb)&gt; if you wanna have a glance at the abyss, read \[this comment](https://github.com/red/red/issues/4126#issuecomment-902281364)

Live editing has nothing to do with Redbin format, usage and purpose. Your proposition there is a leaky abstraction, that's certainly not the way to get to live editing. Live editing does not require a serialization roundtrip.

[19:45](#msg6318f4ee458f823ce0706e7d)@meijeru You should be asking yourself: what is the purpose of the so-called "construction syntax". Are people supposed to write it? Read it? I can give you many examples of totally unreadable "construction syntax"...

hiiamboris

[19:47](#msg6318f555d020d223d327c444)&gt; Live editing does not require a serialization roundtrip

How else you edit a live system without breaking it?

greggirwin

[19:47](#msg6318f563647d633cf60cd732)I do want config support out of the box, though other features come into play as much as nesting there, which does make it a dialect. My old one looked like this:

```
my-config: configuration compose [
    auto-load auto-create required
    app file (rejoin [%config/ PROCESS_NAME %.config])
    settings [
        image-count-threshold: 30
        startup-delay: 00:30:00
        ; How often to check image counts
        check-interval: 00:15:00
    ]
    
]
```

I've done it with blocks as well, and Red solved a big part of this already, but a key aspect for users is spec block format, which is very friendly.

dockimbel

[19:53](#msg6318f69eb16e8236e3676799)&gt; Isn't lack of construction syntax making the "Red is a data format first" argument much less true?

You're confusing different concepts. Red data format is the subset of the Red language constituted by all datatypes with a first-class literal format. In addition to being a data format, Red is also a language for doing general computations. In order to achieve that, we add to Red datatypes for "computing" purposes.

greggirwin

[19:53](#msg6318f6b8443b7927a701f10a)An approach I used to maintain granular configs, but aggregate them, was a wrapper function.

```
; The idea here is that this guy maintains the latest configuration data, 
; loading it only if it's more than a ##:## old when requested. So the
; acts as a cache. We could also just load it from disk every time, since
; the OS will likely cache it, but we still have the overhead of making
; the objects. If an app wants to do that, for very frequent updates, they
; still can. They would just use load-all-configs and not worry about it.
; This is intentionally an anonymous context, because it's just a container.
context [
    data: none
    time-mark: none
    
    set-time-mark: does [time-mark: now/precise]
    time-since-mark: does [difference now/precise time-mark]
    
    set 'sys-config func [
        /system "Return only the system config"
        /sub-xx "Return only the sub-xx config"
        /sub-yy "Return only the sub-yy config"
        /on-change action [block!] "If the config data has changed, do the action block"
        /local tmp
    ][
        if any [none? data  none? time-mark  time-since-mark > 00:00:30] [
            if on-change [tmp: copy/deep :data] ; copy/deep is important here.
            data: load-all-configs
            set-time-mark
            if all [on-change  not-equal? mold tmp mold data] [do action]
        ]
        if system [return data/system]
        if sub-xx [return data/sub-xx]
        if sub-yy [return data/sub-yy]
        data
    ]
    protect 'sys-config
]
```

dockimbel

[19:58](#msg6318f7d1b16e8236e3676a3d)&gt; How else you edit a live system without breaking it?

Structured editing.

[19:58](#msg6318f7fb458f823ce0707414)@meijeru A simple example of construction syntax not being for "humans" as you might think:

```
>> s
== "at."

>> print mold/all s
#[string! {Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra interdum eros, vitae malesuada ante lacinia in. Nunc malesuada suscipit odio eu convallis. Vestibulum ac risus nec nisl hendrerit dictum. Fusce nibh mauris, pharetra sed ex sed, vehicula elementum lorem. Nunc vehicula lacus et quam blandit laoreet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque eget tortor augue. Proin commodo tellus velit, a mattis purus blandit ut. Vestibulum consectetur vestibulum orci, nec convallis risus condimentum at.} 570]
```

greggirwin

[19:59](#msg6318f81e458f823ce070743b)Note that this also aligns with the recent chat on merging, templates, and vetting data against specs, as well as optionality and such in composing data. e.g. given a default template, you should be able to say what's optional, and recreate a minimal version when saving. Some extra work there, and maybe not worth it, but depends on how it's done.

[19:59](#msg6318f82705ad4a3701ddbc5e)Sorry for the overlapping topic chat.

dockimbel

[20:01](#msg6318f898aa09177429fb3088)The Red data format \_is_ the HCI we want to use, not construction syntax. It's not perfect, but it's simple and convenient for humans to read/write, which is what a good HCI strives to be.  
Construction syntax was brought in Rebol to solve the lossy \_serialization_ roundtrip. It was still missing a lot of information, making it a half-complete solution. Carl's Rebin proposal was the "full" solution to that need. Rebin didn't see the light, but Redbin is there. You should be happy to have it instead of throwing stones at it.

Oldes

[20:03](#msg6318f8fdb16e8236e3676bae)On the other side I prefer to write: `#[f32![1 2]]` instead of `make vector! [decimal! 32 2 [1.0 2.0]]`

greggirwin

[20:05](#msg6318f97772ad51741fccbcc3)@Oldes that's just a shortcut. Syntactic sugar.

Oldes

[20:05](#msg6318f980458f823ce070779e)And when I go back to my textual SWF data, there is a reason, why it has extension TXT. I wanted to see, what is there. If I would use something like redbin, than it would be smaller and faster, but without any control.. just another binary file.

hiiamboris

[20:05](#msg6318f9a0b16e8236e3676cd8)&gt; &gt; How else you edit a live system without breaking it?  
&gt;  
&gt; Structured editing.

So in essence, an R/S-backed GUI tool that knows internals of every value and can reflect it and construct back with no help from the standard runtime?

greggirwin

[20:06](#msg6318f9d372ad51741fccbd64)@Oldes agreed. Redbin is great, if you're using Red and can do `print load/as rb 'redbin`, but outside tooling it's completely opaque.

dockimbel

[20:07](#msg6318fa02b16e8236e3676d50)&gt; If I would use something like redbin, than it would be smaller and faster, but without any control..

For solving your "big" problem:

```
show-me: func [file][print load/as file 'redbin]
```

Enjoy!

greggirwin

[20:08](#msg6318fa3d99949962935357f6)I will say that I didn't use `mold/all` a \*lot* in R2, but when I did I was really glad it was there, as a time-saving device. Something we can largely solve for many use cases with simple mezz wrappers.

Oldes

[20:10](#msg6318fab3458f823ce07079ab)Textual data has great advantage, when you work with something like git. To see, what was really changed... printing multimegabyte file into console is not a win.

[20:11](#msg6318fad89d3c186299ee10d4)I think that something like redbin is great, but plain text data are also useful.

greggirwin

[20:11](#msg6318faeb458f823ce0707a32)Plain text is still the longest-lasting, most universal format.

dockimbel

[20:11](#msg6318fb019994996293535939)&gt; I think that something like redbin is great, but plain data are also useful.

Then store is in "plain data", just respect the Red data format.

greggirwin

[20:12](#msg6318fb4bcf6cfd27af79eaa1)It's another case where we need to provide guidelines and note known limitations, with helpers, so people can make good choices.

dockimbel

[20:15](#msg6318fbfb9994996293535afd)There's a big number of intermediary (because incomplete) data format that could be defined between the Red data format and the Redbin one (if we consider Redbin to perfectly represent the values that were in memory). The R2 and R3 construction syntax (not sure they are identical) are just one (or two) example(s) of them. You could move the cursor in either direction a bit and define a bit different "construction syntax", because the exiting one does not fit your "need of the day"... that's endless and that's why I said that the construction syntax is a broken concept. People will keep asking for additional support to the construction syntax... until it becomes Redbin, but in text format... and no, I don't even want to imagine such atrocity.

[20:19](#msg6318fcea9d3c186299ee151f)@hiiamboris  
&gt; So in essence, an R/S-backed GUI tool that knows internals of every value and can reflect it and construct back with no help from the standard runtime?

Absolutely not. You can do structured editing at Red level and use a text/CLI interface if you want to. @rebolek did an experimental simple structured editor called "Value" a few years ago.

greggirwin

[20:20](#msg6318fcf1647d633cf60ce588)Which is why I suggested \[this](https://gitter.im/red/red?at=6318ee777ccf6b6d45c3e515)

[20:22](#msg6318fd7f72ad51741fccc384)The "easy" question and task is whether we change `map!` syntax from `#()` to `#[]`, which is still a big change but defers everything else.

hiiamboris

[20:22](#msg6318fd86b16e8236e3677433)&gt; @rebolek did an experimental simple structured editor called "Value" a few years ago.

Except his editor can't possibly edit a live system unless edits can be loaded without breaking it ;)

[20:22](#msg6318fd9ccf6cfd27af79f02d)Which takes us to the beginning again.

Oldes

[20:28](#msg6318fee69994996293536116)@greggirwin I would vote for the change.

[20:30](#msg6318ff5a9d3c186299ee19eb)`#(none)` makes more sense, than `#[none]`, when parens are usually evaluated.

greggirwin

[20:31](#msg6318ffbc458f823ce07082d0)That's the main argument. Maps, like blocks, are not evaluated.

dockimbel

[20:32](#msg6318ffd872ad51741fccc887)&gt; Which is why I suggested \[this](https://gitter.im/red/red?at=6318ee777ccf6b6d45c3e515)

That's my current position as well. I have no intention of extending the scope of current construction syntax for now. Eventually, we might give objects a literal form though. I'm still reluctant on that one (and still have a bad feeling about literal maps) as we keep cluttering the lexical space with new esoteric delimiters.

Oldes

[20:32](#msg6318ffd905ad4a3701ddcb57)It would be nice to provide a tool for automatic conversion, because there would be \*\*a lot\** of code requiring editation.

dockimbel

[20:33](#msg631900017ccf6b6d45c407b4)&gt; The "easy" question and task is whether we change `map!` syntax from `#()` to `#[]`, which is still a big change but defers everything else.

We'll see that during the work on the language spec.

[20:33](#msg6319000ff4d7a323dec06420)@hiiamboris  
&gt; Except his editor can't possibly edit a live system unless edits can be loaded without breaking it ;)

I don't get what you mean there by "breaking it" nor why edits should necessarily be "loaded", nor do I remember the internals of that editor. There are structured editors out there for other languages that work fine. I don't see why we couldn't do as well or better given how "flexible" is Red.

[20:37](#msg6319011672ad51741fcccb05)Was the old Anamonitor in R2 capable of doing editing also?

greggirwin

[20:40](#msg631901a83a42316d33dd18dd)@dockimbel literal maps are, IMO, a necessary concession because of JSON. The alternative is to provide stricter key-value helpers for blocks in Red, along with guidelines for use from other langs that make them as easy to use alongside straight blocks as JSON is. I think the extra `#` is a small price to pay for adoption.

[20:42](#msg63190234647d633cf60cef72)Anamonitor was not, IIRC, though I played with that in my old Object Browser in R2. Smalltalk has done it all these years, but being entirely object based has an effect there as well, as the foundation.

hiiamboris

[20:42](#msg6319024a3a42316d33dd19d8)&gt; I don't get what you mean there by "breaking it"

Again I must point you to \[the comment](https://github.com/red/red/issues/4126#issuecomment-902281364) ;)  
I can imagine limitless scenarios, from editing a live View face (how do you edit a handle?), to a block with references to live series, to infinitely more complex data structures interlinked with each other and the live system.

dockimbel

[20:43](#msg6319025ad020d223d327dd16)There are alternative ways to represent such data in Red as you mention, so it's not a "necessity", but just a choice based on a "trendy" exchange format... what happens when JSON falls out of trend? We change the Red lexical rules?

[20:44](#msg631902a86837563d1cc23554)@hiiamboris  
&gt; (how do you edit a handle?)

You don't edit an handle. The purpose of an handle is precisely to avoid anyone touching it, it's opaque on purpose. I really need to get rid of that datatype, as I see people are totally misunderstanding it...

greggirwin

[20:44](#msg631902aacf6cfd27af79fb0e)I hardly think JSON can be called trendy anymore. It's about fundamental data structures and how we address things. The two basics there are by name and position, next by content matching (which has to be active). Can we agree on that?

hiiamboris

[20:46](#msg631903183a42316d33dd1bf9)@dockimbel okay, edit this:

```
>> append/dup/only b: [] b 2
== [[...] [...]]
```

greggirwin

[20:48](#msg63190388458f823ce0708aad)What JSON did was a) Define a lowest common denominator that was widely useful and relatively easy to parse. b) Got very lucky. :^) We \*can* do everything just with blocks, but then more metadata is required to \*document* that something is key-value. Saying just that is about as simple as you can get as far as specs go. We even call it a spec block sometimes. I don't even love the name `map` myself, but can live with it.

dockimbel

[20:51](#msg6319043c3a42316d33dd1ded)&gt; @dockimbel okay, edit this:

I don't see where's the problem there. You have a block with two values, each value being a reference to the parent block. Why do you think it would be a problem to manipulate it? You can easily construct and manipulate it using Red actions, you would have the same power in a structured editor. You are not limited to the text representation that `mold` outputs, nor limited to 1D representation.

hiiamboris

[20:55](#msg63190538d020d223d327e271)Hmm I see your point now too.

dockimbel

[21:03](#msg6319071aaa09177429fb4e39)The real challenge is the bijective text&lt;=&gt;values mapping. ;-) That can be "easily" solved in a classic static language, but that's a really difficult task for Redbol. Most users are not aware to what length the toolchain has to go just to be able to report at which \_line_ of which \_file_ a compilation error occurs in R/S!

hiiamboris

[21:17](#msg63190a87443b7927a70219d5)Just stores the address of each loaded token, or there's more to that?

dockimbel

[22:42](#msg63191e5c05ad4a3701de0605)The compiler is written in Rebol, the loaded R/S is Rebol data, no access to any memory address. ;-)  
If you meant the index, you still need a way to reference from which any-block series is that index from. ;-)

## Thursday 8th September, 2022

ldci

[03:21](#msg63195fcad020d223d3288cab)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/p2sY/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/p2sY/image.png)

[03:22](#msg6319600911a6a83d04a3e7ce)Just for fun: probably the best compiler, except Red

jasongrossman:matrix.org

[03:33](#msg631962769994996293541a8a)Totally agree. I've been more productive in Pascal than in anything else, and I'd probably be very happy still using it ... if only there hadn't been so many developments in language design since then!

ldci

[03:47](#msg631965da72ad51741fcd879f)@jasongrossman:matrix.org Very found of modula-2 too

pekr

[05:27](#msg63197d319d3c186299ef01b8)JSON is here to stay. It almost entirely replaced XML for APIs and data exchange. Interesting to see Carl's thougt about possible redbolish aproach called Ason - he compares it wit Rebol and JSON as well - https://altscript.com/?page\_id=16

GiuseppeChillemi

[06:42](#msg63198eb8d020d223d328e2d2)In the link I have found something on immutability for ASON: "All loaded values are constant by default. This includes strings, blocks, and objects. They are all protected from modification. However, they can be copied and modified. In addition, they can be loaded as modifiable by using a load option."

hiiamboris

[06:58](#msg631992a4443b7927a7031422)Carl sure learned his mistake.

pekr

[07:14](#msg6319966f458f823ce071990a)No. He did not imo, if you dont consider Reboo being a mistake in itself. Ason is just an exchange format to get next gen json, not a full language.

[07:29](#msg631999e9d020d223d328f7f7)Looking into the syntax you can see it is another try to conquer the world by making it to adopt basically rebol like block message exhange format, no matter what the transport layer is. We could ir should have identical longbterm goap imo ...

[07:50](#msg63199edc3a42316d33de42f0)Ah, sorry for typos you can't edit on a smartphone .... while driving :-)

Oldes

[08:34](#msg6319a91e72ad51741fce0778)I don't think ASON will materialize from nowhere. I take it that Carl had nice Christmas holiday in year 2020 and spent some time with wine &amp; keyboard to write some ideas. That is all. But I may be wrong and Roku is already using it internally.

GiuseppeChillemi

[08:37](#msg6319a9af3a42316d33de58dc)@Oldes I agree with you

pekr

[08:40](#msg6319aa76d020d223d3291c3c)I think so too, but creating next gen version of JSON is tempting. And who knows, it might got adopted ;-) IIRC, we had in ming a REN specification, which was supposed to have similar goals, no?

dockimbel

[09:31](#msg6319b6809d3c186299ef70f4)&gt; Carl sure learned his mistake.

And of course, \_you_ know what are the mistakes... If design choices must to be decided based on familiarity and popularity, then we should just take down all languages trying to bring disruptive changes, and enjoy C-like syntax and static languages forever... Good mindset :+1:

[09:50](#msg6319bafb3a42316d33de7d12)&gt; creating next gen version of JSON is tempting. And who knows, it might got adopted

I very much doubt that. Such \_de facto_ standards like JSON are born out of empirical needs and constraints (needs for servers to send JS data to clients in the easiest way). As web/JS grew up, it became a standard and spread on web API as every other language added support for it. Chances to impose a new JSON alternative standard without that standard being backed by a popular software or hardware solution are dramatically close to zero.

rebolek

[09:54](#msg6319bbe8443b7927a7036890)true

dockimbel

[10:12](#msg6319bff93a42316d33de850d)Carl's ASON website and concepts are...weird, to the point I thought the first time that it was a fake site ("Post a comment to Carl on this website."... you don't talk about yourself in the 3rd person). He turned his back on many of his principles (e.g. using WordPress instead of MakeDoc...), which by itself looks very odd. Most of the features and the many \_ad populum_ justifications seems like he was either drunk as Oldes said, or someone else was holding the pen while he was writing, or it was an attempt at pranking the Rebol-derivated projects to lure them away. ;-) Though, the scope of AltScript, from the few things Carl mentioned when I last met him, was specific to embedded systems and close-to-OS (maybe even in-kernel) usage. He gave up on the series concept and focused on resource optimization. The semantics and syntax are not compatible with Rebol. So, it's even further away from Rebol than what MicroPython is to Python.

[10:20](#msg6319c1e6cf6cfd27af7b5c49)@hiiamboris  
&gt; For example “+” can be used to join strings and blocks.

You will surely appreciate the mathematical correctness of that AltScript feature. Commutativity? Who cares! ;-)

hiiamboris

[10:24](#msg6319c2c9cf6cfd27af7b5df0):)

[10:24](#msg6319c2e211a6a83d04a4aaca)I'll borrow `~` from D ;)

dockimbel

[10:26](#msg6319c346999499629354d050)Much better choice, though for the visually impaired, that looks like `-` without proper glasses. ;-)

hiiamboris

[10:27](#msg6319c388d020d223d3294c85)I'll find them a font with zigzag in place of tilde ;)

[10:28](#msg6319c3b6999499629354d0fb)JK though, not much need in this concatenation. I used `|` once but just as an experiment.

dockimbel

[10:29](#msg6319c414f4d7a323dec1d004)What about `><` ;-)

hiiamboris

[10:30](#msg6319c43911a6a83d04a4ad71)Used that for swapping two words' values! :)  
Hmm but maybe `>_<` for more anime-like look?

[10:32](#msg6319c4ba6837563d1cc39ba4)`pointer! [pointer! [pointer! [pointer! [byte!]]]]` possible now?

dockimbel

[10:32](#msg6319c4bf7ccf6b6d45c57329)I think I saw once a toy language created from text-based japan-style emoticons only.

hiiamboris

[10:33](#msg6319c4ecaa09177429fcb780)Must be real kicker lang ;)

dockimbel

[10:34](#msg6319c543b16e8236e368edfc)&gt; `pointer! [pointer! [pointer! [pointer! [byte!]]]]` possible now?

Unfortuntately, not yet. I added that feature quickly yesterday night, as we missed it many times. Not sure how much work would it be to support the fully expandable syntax, will have a look tonight. Also, in the past, I was reluctant to add it until we come up with a nice syntax for it, but we are out of time now, so nested blocks will do. ;-) Anyway, I don't remember ever seeing in C more than 3 levels (`***p`) being used.

[10:56](#msg6319ca40cf6cfd27af7b6a9c)@hiiamboris  
https://levelup.gitconnected.com/5-most-amusing-programming-languages-you-can-code-using-emojis-4bfd43bc7614  
and  
https://www.emojicode.org/docs/reference/basics.html

hiiamboris

[11:06](#msg6319cca611a6a83d04a4bdba)Someone's always ahead of us! :p

greggirwin

[18:54](#msg631a3a683a42316d33df7b1a)I still think `~` is a good sigil for floats, though @dockimbel's point about misreading it is valid. `≈` would be a pain to type, but people may not type it much. Any middle horz symbol will also make negative floats less readable. All tradeoffs.

jasongrossman:matrix.org

[22:36](#msg631a6e7f443b7927a704e31d)Those emoji languages remind me of how funny it is when people translate the keywords of programming languages into other natural languages and then have to release their work as a whole new language. That's one reason why I love languages that don't have keywords - in fact, languages that do have keywords strike me as primitive (in a bad way!)

## Friday 9th September, 2022

hiiamboris

[12:36](#msg631b335a999499629357b6bb)By the way, closely related to the immutability chat: https://github.com/red/red/issues/5149 (locking or copying some series types in the hash is a solution to it, as well as pub-sub ownership model, all solutions with more problems though)

GiuseppeChillemi

[20:53](#msg631ba7bed020d223d32d07ee)It would be easier if parallel immutable datatypes are created, letting coders use it them if needed, or adding a LOCK mechanism to the existing ones.

Oldes

[21:02](#msg631baa03443b7927a70745ea)The mechanism has name `protect` in Rebol btw.

greggirwin

[22:28](#msg631bbe0d999499629358ca7d)https://gist.github.com/numberjay/3df8f13044145c6dde1918ea2cdfe3b8 I haven't played with it in a long time, but people could do that and report back on their experience.

@maximvl also did some really cool experiments in mezz versions of features, e.g. from Common Lisp.

## Saturday 10th September, 2022

Dobeash

[02:47](#msg631bfacab16e8236e36d4d58)I've been thinking about usage patterns in Redbol and Javascript, and whilst most are simpler to express in Redbol, I find these two common ones much cleaner in JS:

```
s = `x="${x}" y="${y}"`

const sub = {';': ' ', ':': ' '}
s = 'a;b c:d'
s = s.replace(/;|:/g, matched => sub[matched])
```

I suppose the Redbol equivalents would be:

```
s: ajoin [{x="} x {" y="} y {"}]

s: "a;b c:d"
foreach [a b] [";" " " ":" " "] [replace/all s a b]
```

but these seem a bit clunky to me. Anyone think of a more elegant approach?

gltewalt

[03:10](#msg631c001e458f823ce076598f)`replace/all s [";" | ":"] space`

[03:11](#msg631c0056d020d223d32da569)`pattern` in the spec is either a specific value or a parse rule

hiiamboris

[06:47](#msg631c331d9d3c186299f43fc3)@Dobeash I couldn't think of a way in plain Rebol, but in Red I have https://github.com/red/red/pull/5085:

```
s: #rejoin {x="(x)" y="(y)"}

s: "a;b c:d"
replace/all s charset ";:" " "
;) or for more complex patterns:
s: mapparse [";" | ":"] s [" "]
```

[07:04](#msg631c36f5aa091774290162ce)\[mapparse here](https://codeberg.org/hiiamboris/red-common/src/branch/master/mapparse.red)

Oldes

[07:50](#msg631c41dcd020d223d32e1865)@Dobeash for the first one you can use `reword` in R3:

```
>> reword "x=$x y=$y" #(x: 10 y: 20)     
== "x=10 y=20"

>> reword "x=$x y=$y" [x: 10 * 10 y: 20] 
== "x=100 y=20"

>> y: x: 200 reword "x=$x y=$y" self
== "x=200 y=200"
```

Extending `rejoin` native to accept `any-string!` is an interesting idea. But not, when you want speed imho:)

hiiamboris

[07:58](#msg631c4397f4d7a323dec6b15e)That's why it's a macro ;)

Oldes

[08:01](#msg631c444f647d633cf6133327)What you will do, once Nenad reduces the macro support? :point\_up: \[September 6, 2022 7:40 PM](https://gitter.im/red/red?at=631785fb11a6a83d04a03f0b)

hiiamboris

[08:02](#msg631c44a772ad51741fd32d72)Will have to include and invoke preprocessor manually then ;)

pekr

[08:12](#msg631c46fa11a6a83d04a98d12)@hiiamboris Ren-C take on (im)mutability - https://forum.rebol.info/t/the-beta-one-mutability-manifesto/1062/3

hiiamboris

[08:14](#msg631c4770647d633cf6133889)Yeah I've read that already

Dobeash

[09:24](#msg631c57b06837563d1cc89306)OK, good info on my 2 questions; and certainly a few extra things to look at now. In regards to:

```
replace/all s [";" | ":"] space
```

that's great for multiple patterns that map to a single pattern, but what if the key / value pairs are all different with regards to content and size? For example:

```
foreach [a b] ["One" "Single" "Two" "Double" "Three" "Triple"] [replace/all s a b]
```

GiuseppeChillemi

[09:49](#msg631c5d8d458f823ce0770077)@pekr I have read. A like the idea of having read-only elements when needed, that are protected from modifications. Also this would act as safeguard, when newbie make mistakes like altering series belonging to a function, where they should have been constanct. But everything should be optional and on request, as I prefer Red data being malleable until I declare it otherwise.

gurzgri

[10:16](#msg631c6401f4d7a323dec6f117)@Dobeash Sometimes `foreach replace/all` as you suggest, because it's right there at the keyboard. Sometimes `parse change` thru some kind of wrapper like

```
inject: func [str [any-string!] map [block! map!]] [parse str reduce ['any next collect [foreach [key val] map [keep reduce ['| 'change rejoin ["#[" to word! :key "]"] val]] keep [| skip]]] str]
>> inject <fo:block linefeed-treatment="#[lf]" font-size="#[size]pt"> #(lf: "preserve" size: 12)
== <fo:block linefeed-treatment="preserve" font-size="12pt">
>> inject <fo:block linefeed-treatment="#[lf]" font-size="#[size]pt"> [lf "preserve" size 12]
== <fo:block linefeed-treatment="preserve" font-size="12pt">
```

hiiamboris

[10:18](#msg631c6475999499629359f1ec)@Dobeash Current `replace` design supports that via:

```
>> s: "One + Two"
== "One + Two"
>> replace/all s [copy token ["One" | "Two" | "Three"]] func [] [select ["One" "Single" "Two" "Double" "Three" "Triple"] token]
== "Single + Double"
```

But I should add that it's suboptimal and the whole `replace` function is a mess patched together by different people, so it can't even do the simple thing it's made for: replace any-type value with any-type value:

```
>> f: does [print 1] g: does [print 2]
== func [][print 2]
>> b: reduce [:f :f]
== [func [][print 1] func [][print 1]]
>> replace/all b :f :g
2
2
== [unset unset]
```

greggirwin

[16:49](#msg631cc02305ad4a3701e4f1d3)@Dobeash I have a few `replace` wrappers as well.

## Sunday 11st September, 2022

rgkirch

[17:18](#msg631e1871443b7927a70bab3e)Hey! I'm trying to get started with red. I'm on windows and I have red.exe, red-view.exe, and red-toolchain.exe. I'm using emacs and I set a keybinding to call red-view on the current file. That's not very ergonomic but I'm not sure how to make it easier. I've been learning web development with clojurescript and that workflow isn't too bad; I can evaluate one expression and get one result or I can save the file and the whole ui updates. In red, I'd at least like the new window to replace the old one but I'm not sure how to do that. Can anyone share their experience or offer a suggestion?

greggirwin

[17:30](#msg631e1b476837563d1ccbb264)&gt; set a keybinding to call red-view on the current file. That's not very ergonomic

What would be \*more* ergonomic? I think many of us use hot-keys for common tasks.

&gt; In red, I'd at least like the new window to replace the old one but I'm not sure how to do that.

It sounds like you want to behave like a browser, where the page updates with your new code. i.e. hot reloading. Red doesn't work like that. There is no host process that Red UIs run in, other than the OS itself. Every time you run your script, it's a new instance. If you want it to work like a browser, you have do build that yourself. Since you're just starting out, I recommend against that. Get used to Red first.

rgkirch

[18:47](#msg631e2d3e3a42316d33e6c0ab)Thanks. I don't know my away around emacs and I get discouraged pretty quickly with how difficult things are that I think should be easy. The ergonomics that I was missing was that I had to close the red window myself. I wasn't sure if I should look for something in red or look for something in emacs. I appreciated your answer and have something that works as a solution.

```
(defun red-view-current-file ()
  "call red-view.exe on the current file"
  (interactive)
  (when (get-buffer-process (get-buffer "*red-view*"))
    (kill-process (get-buffer-process (get-buffer "*red-view*"))))
  (start-process "red-view.exe" "*red-view*" "red-view.exe" (buffer-file-name)))

(defun my-red-mode-keys ()
  "my keys for red-mode"
  (interactive)
  (local-set-key (kbd "C-c C-k")
                 #'red-view-current-file))

(add-hook 'red-mode-hook
          #'my-red-mode-keys)
```

[18:48](#msg631e2d8d3a42316d33e6c118)Now I just want the new window to start in the same place as the old one instead of in the middle of my screen.

greggirwin

[19:02](#msg631e30b99d3c186299f7ca11)You can tell the windows where to appear: `view/options [size 640x480 button "OK" [quit]] [offset: 20x20]`

[19:05](#msg631e317a458f823ce07a40d7)If you use `quit` at the end of your script, the process will terminate. But if you have a window open that won't happen until you close the window (which you can work around if it's a notification window or somesuch, where the user doesn't interact with it).

[19:06](#msg631e31d39d3c186299f7ccd2)If emacs isn't killing the process by name correctly, that's a different problem, and not Red's fault.

rgkirch

[19:11](#msg631e32c672ad51741fd6a5e3)Wonderful, thank you!

## Tuesday 13th September, 2022

meijeru

[16:05](#msg6320aa49aa0917742909d8d9)I am delighted to see so many issues resolved and closed in the last few days! And even among the open issues there are ones that have `status.built`. Closing those would improve the record even more!

dockimbel

[16:10](#msg6320ab75aa0917742909dbda)\[Indeed!](https://github.com/red/red/issues?q=is%3Aopen+is%3Aissue+label%3Astatus.built). Let's see which one of them can be closed.

GiuseppeChillemi

[17:33](#msg6320bed8b16e8236e3765335)The long requested feeling that advancements are being made is here, thank you.

## Wednesday 14th September, 2022

meijeru

[17:19](#msg63220d14f4d7a323ded1c9e1)I also notice the occurrence of fixes for deficiencies that are not signalled in issues. Is a general review going on?

dockimbel

[20:49](#msg63223e4a9d3c186299ffde52)@meijeru No, just doing some easy fixes as we stumble upon them while working on other tasks.

## Thursday 15th September, 2022

dockimbel

[12:10](#msg63231632f4d7a323ded3e8c8)Actually, I am doing a limited review of the core tickets, as many don't have proper label or are fixed but not labelled as such nor closed. I'm only fixing the tickets that are either easy/quick to fix or that are core bugs (design-related ones are deferred after the language spec work).

## Friday 16th September, 2022

hiiamboris

[17:57](#msg6324b917f4d7a323ded731b3)### Spaces now support automatic column width estimation in grids

!\[](https://i.ibb.co/0M28qJj/GIF-16-Sep-22-20-53-46.gif)

GalenIvanov

[18:35](#msg6324c1e6f4d7a323ded741e5):+1:

## Saturday 17th September, 2022

GiuseppeChillemi

[22:59](#msg6326515f7ccf6b6d45ddcd96)Nice!

## Sunday 18th September, 2022

ldci

[06:39](#msg6326bd387ccf6b6d45de90d2)Great!

[18:52](#msg63276909d020d223d343c9a6)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/bzFD/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/bzFD/image.png)

[19:00](#msg63276ac46837563d1cde00ac)Due to Oldes’s impressive works, we get a fast Gif animated reaser for Rebol3. We need something similar for Red:

```
#!/usr/local/bin/r310
REBOL [
]
gif: image/load/frame %../Examples/animation.gif 1
image/save %img1.png gif
gif: image/load/frame %../Examples/animation.gif 2
image/save %img2.png gif
gif: image/load/frame %../Examples/animation.gif 3
image/save %img3.png gif
call/shell rejoin ["open img1.png img2.png img3.png »]
```

[19:01](#msg63276aee647d633cf628c5e9)Oups reader :)

greggirwin

[22:55](#msg6327a1f1d020d223d3443a54)Very nice. :+1:

## Thursday 22nd September, 2022

biaocy

[08:11](#msg632c18c29d3c186299130f4f)Hi, does anyone know how to kill all the processes in the background called by the program when the program closes?

I have an idea to find the program's PID and kill all the child processes in the `on-close` event when the program closes. Is this the only way to do it?

hiiamboris

[08:28](#msg632c1ca272ad51741ff1e33e)I had to use some R/S for that:  
https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/proc-win32.red  
https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/sys-proc-win32.red

[08:29](#msg632c1cee3a42316d330227b7)Normally I think `call` should "own" the processes it starts (as an option). But it doesn't.

[08:35](#msg632c1e3b7ccf6b6d45e8df4a)Well, nor does shell for that matter. If you kill it, the child stays...

[08:35](#msg632c1e67443b7927a726faf5)There must be a way to "own" whole process tree for this to work.

biaocy

[08:46](#msg632c20d1458f823ce0959184)&gt; I had to use some R/S for that:  
&gt; https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/proc-win32.red  
&gt; https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/sys-proc-win32.red

Thanks for the reply, it seems to be the only way to do it for now.

greggirwin

[19:21](#msg632cb5cd9d3c18629914541b)Under R2 I did things a number of ways. Using APIs was one. But you can also do it by saving the PID you get back from `call`, and then use `taskkill`.

```
kill-windows-process: func [pid [integer!] "Process ID"] [
    call reform ["taskkill /pid" pid "/f"]
]
```

## Friday 30th September, 2022

plegoff

[07:38](#msg63369d0b7ccf6b6d45fca1b0)Hello, I have downloaded the latest release of Red-View (same for red-cli) for Windows 10 Enterprise 20H2. My anti-virus (McAfee) removes the executable as soon as it is executed. Is there a solution to use red on Windows?

ldci

[07:44](#msg63369e6f647d633cf6459a19)@plegoff Have a look here : https://github.com/red/red/issues/2399

plegoff

[07:52](#msg6336a02f3a42316d3315dc7c)@ldci Merci François :-)

ldci

[07:59](#msg6336a1d5458f823ce0a94904)@plegoff Philippe Content de voir sur Red

## Monday 3th October, 2022

GiuseppeChillemi

[11:41](#msg633aca6134982518bddf8023)I write here a thought... On the road for Red64, why don't you add multithreading?

henrikmk

[11:51](#msg633accb50b8c9518d7d63059)I'm sure multithreading is very simple to do :-)

GiuseppeChillemi

[12:23](#msg633ad457fbade7016ea4d20a)Who knows, Red Team has now accumulated great knowledge, maybe they have already a model and some ideas.

[12:26](#msg633ad4e734982518bddf96ed)Also, by doing it now, we could avoid another long wait caused by the new rewriting of core parts.

zentrog:matrix.org

[17:57](#msg633b228a9a0ad66a76f08663)Though multithreading would be nice, it isn't worth disrupting the existing road map. With async IO, it will be possible to do concurrent processing using multiple processes, which could solve many of those use cases. I think CPU bound workloads are a pretty small minority anyway

ldci

[18:06](#msg633b248b683a5c58c71affcf)@zentrog:matrix.org. Some tests: https://github.com/ldci/Red-System/blob/main/Threads/thread.red

greggirwin

[19:51](#msg633b3d4835c5276a7213fbe6)Like @ldci and others, I've done some cooperative tasking tinkering. Cooperative isn't as problematic, but suffers some of the same problems, and has its own limitations. Adding \*support* for threading isn't the main issue. The main issue is that it's hard to use correctly and often leads to problems. That's not Red's fault, but Red users will suffer. Can it offer benefits? Of course? Nobody wants their UI to freeze while a long document prints or while waiting for a server response.

There is plenty of prior art to learn from, and we have to pick which problems we're solving and how best to do that.

## Tuesday 4th October, 2022

loziniak

[06:42](#msg633bd5d2773e7e5c7bbb900f)Hey, isn't multithreading included in Red32 roadmap already, just called \*Concurrency\*? BTW it would be nice if parallel model in Red allowed cooperation with parallel code in other languages through FFI, like Rust `async`/`await`.

pekr

[09:10](#msg633bf886cb3b243528fcbbba)I think those are things, which are still about to be decided. E.g. there is an IO branch, which was supposed to be close to be merged, but IIRC Doc stated lately, that he is thinking about a different model to IO, than R3 and experimental Red IO branch, used.

GiuseppeChillemi

[09:36](#msg633bfe93cbfe685c8811795a)Let's see, I have written out my thoughts with an optimizing perspective because I have supposed that while concentrating on the core part, concurrency could be added with less delay than later. Also, having it together with Red64 would be a nice coding and marketing weapon.

pekr

[10:49](#msg633c0fb42a06f4566b1e40a3)But concurrency might be a deep topic in itself. Do you go with just an OS threads? Or you use a green threading? Or a mixture? And what about an event loop, message passing (if used) ... I believe concurrency is not easier topic, than IO - you need to think, evaluate, test ....

henrikmk

[12:36](#msg633c28e864f29419bfc23058)Keeping it exceedingly simple would be a start. You might not have full threading, but you could at least run/query/kill background tasks. If multiple tasks write to globals and get into a fight, that's your problem.

Out of my imagination (because I'm not a threading programmer and am very naive about it):

```
>> chew-task: make task! [loop 100000 [chew bubble gum]] ; could also be a script file that is possible to run as a separate Red script
>> walk-task: make task! [loop 10000 [walk down the street]]

>> handle-task walk-task make object! [
	steps: none
	start: func [<whatever>] [steps: 0 print "let's go"]
	kill: func [<whatever>] [print "stopping"]
	running: func [<whatever>] [steps: steps + 1]
	killed: func [<whatever>] [print "Hey, I was walking here."]
	completed: func [<whatever>] [print rejoin ["Done walking, took " steps " steps"]] ; when completed, this gets printed. might not be convenient.
]

>> handle-task chew-task make object! [
	bubbles: none
	start: func [<whatever>] [bubbles: 0 print "start chewing"]
	kill: func [<whatever>] [print "stop bubbling"]
	running: func [<whatever>] [bubbles: bubbles + 1]
	killed: func [<whatever>] [print "Where's my gum?"]
	completed: func [<whatever>] [print rejoin ["Done chewing, made " bubbles " bubbles"]]
]

>> do-task [chew-task walk-task] ; start both tasks in specified order on arbitrary cores (however that is managed)
"start chewing"
"let's go"

>> walk-task/state ; get state of task
== 'running ; START, KILL, RUNNING, KILLED, COMPLETED

>> get-task walk-task
== make task! [
	code: [walk down the street] ; I didn't carefully consider private values in this part, oops.
	state: 'running
	rate: none ; repeat task at this rate, but I didn't use that in this example. could be used for cron-jobs.
	handlers: make object! [
		steps: 375 ; all private task values stay in here
		start: func [<whatever>] [steps: 0]
		kill: func [<whatever>] [print "stop walking"]
		running: func [<whatever>] [steps: steps + 1]
		killed: func [<whatever>] [print "Hey, I was walking here."]
		completed: func [<whatever>] [print rejoin ["Done walking, took " steps " steps"]]
	]
	started: 16-jan-2022/12:23:44.412
	duration: 123.63 ; seconds since START
]

>> get-tasks ; make a task overview from running tasks
== [make task! [...] make task! [...]]

>> find get-tasks chew-task ; find running task
== [make task! [...]]

>> kill-tasks/only walk-task
stop walking
Hey, I was walking here.
>> kill-tasks ; stops all tasks (one chew task was remaining)
stop bubbling
Where's my gum?

>> remove-task chew-task ; another way to kill a task?
stop bubbling
Where's my gum?
== [make task! [...]]

>> loop 64 [do-task chew-task] ; chew 64 bubble gums at the same time on your fancy 64-core CPU. probably need an ARGS block for DO-TASK to specify gum brand.
start chewing
start chewing
start chewing
...
== [make task! [...] make task! [...] ...]
>> remove-task/all chew-task ; too much bubble gum, let's stop
stop bubbling
Where's my gum?
stop bubbling
Where's my gum?
stop bubbling
Where's my gum?
....
```

luce80

[18:00](#msg633c74a76f104f353085af84)the `remove-task` name reminds me of `series!` actions so there could be `insert`, `copy` and so on... to add polymorphism.

greggirwin

[18:51](#msg633c80c74fad22566124c3e5)`[concurrency threading async parallelism]` all fall under the domain of multitasking, but are not all the same. Some of the differences are conceptual, some are technical, and there is overlap between them. How data is protected or shared (message passing versus shared memory) is a critical element that often draws a line about what term to use. Also `[process task thread]` distinctions. Then there is the critical, but often neglected aspect of coordination `[semaphore mutex channel space]`. Finally we have locality to consider. Distributed systems take many forms.

Are you solving for CPU-bound or IO-bound problems? Is it beneficial to expose the lowest levels to the user, all the way down to a thin layer  
over OS threading? Can we all agree that multithreaded programming as it has historically been done may become Hellish due to the burden on the programmer to handle shared memory and debugging non-deterministic systems? Do we task at the process level? Is that enough, or do we need to handle tens of thousands of lightweight tasks, ala Erlang? Do we run one core per processor (new processors have a LOT of cores).

For my part, I hope we can build a high level coordination system that  
makes it easy to glue things together, because that's still a gap and  
major pain point. As soon as you use someone else's code, and we have a package system, low level approaches become nightmares in this realm.

The lines will, and should, blur between elements, but they won't go  
away entirely. You may need to know when you're making a local function call versus an IPC cross-process call versus an API call going across the internet. But that doesn't mean those things should all look wildly different or make you jump through different hoops that lead to mistakes.

Think big and simple, then provide an escape hatch for those who really think they can and need to squeeze out more performance.

## Sunday 16th October, 2022

hiiamboris

[16:43](#msg634c34b2f3e9f037584122ae)What is the reason `none` is invalid in map paths and as a key in general?

E.g. maps can't have a `none` key: `put #() none 'value`, `extend #() [#[none] value]` and `m: #() m/(none): 'value` are errors.

I can only use `none` as key in (any-)blocks by appeding `none` to the block, then using `select block none` (but not `put` or set-path).

greggirwin

[19:21](#msg634c59bcbad3c73752dbeca9)Works on blocks for me.

```
>> blk: [#[none] 1]
== [none 1]
>> select blk none
== 1
>> blk/(#[none])
== 1
>> k: none
== none
>> blk/:k
== 1
>> blk/:k: 2
== 2
>> blk
== [none 2]
>> blk/(#[none]): 3
== 3
>> blk
== [none 3]
```

It may be that maps didn't allow it because of the old behavior for removing items, though that applied to values rather than keys.

I've never used `none` as a key, so my first question is whether that may lead to more subtle bugs because `none` can be produced a number of ways, which would all map to that default key. Next is to ask if it adds enough value over just not having the item in the structure or using a synthetic key.

hiiamboris

[19:38](#msg634c5d9a88e38704c015506c)Behavior for removing items relates to values, not keys.

greggirwin

[22:16](#msg634c82a7f00b697fec45776b)That's what I said.

hiiamboris

[22:30](#msg634c860caa210536d614ce4a)Right :)

## Monday 17th October, 2022

zentrog:matrix.org

[23:38](#msg634de788cf41c67a5cb72071)https://www.wired.com/story/null-license-plate-landed-one-hacker-ticket-hell/

## Tuesday 18th October, 2022

greggirwin

[03:37](#msg634e1f94f00b697fec4879fa)Wow. At a gathering recently I made an off-hand joke about doing stitches at home, which led to one inebriated person telling lots of other people that I was both a doctor \*and* a dentist. I was then made to look in a child's mouth at their cavity, and told I `could @#$% fix it`, because they wouldn't believe I \*wasn't* those things. Now I'll have to say I lost my licenses or something when I see those people again. :^\\

## Friday 21st October, 2022

Dobeash

[05:39](#msg63523097f00b697fec501c7a)Which of the following is "correct":

```
Red> split "" ","
== [""]

R3> split "" ","
== []
```

rebolek

[06:16](#msg6352392a21df5f7a54af8596)IMO R3 is right.

henrikmk

[09:58](#msg63526d3588e38704c0208913)The implementations of SPLIT between them are vastly different.

hiiamboris

[10:42](#msg6352777bdcbf067fdca50380)I don't think there's a correct answer, just choices. I prefer the Red version because:  
\- it strictly follows the rule: `number-of-segments = 1 + number-of-delimiters", no exceptions, so it's easier to reason about - it should be able thus to preserve the type in case one wants to rejoin it later (that it doesn't is a bug, try`split %"" ","\`)

[10:43](#msg635277bbf3e9f037584cb064)But there's a much more powerful split implementation waiting, we just can't merge it.

greggirwin

[17:22](#msg6352d55ccd9a8436d129cc49)I agree with @hiiamboris.

[18:07](#msg6352dfe6f3e9f037584d7d25)Made me look at my `split`, where many tests fail now. Likely a change to `parse`, after the end of June it seems.

[18:09](#msg6352e040bad3c73752e7fba0)Delimited `split` results get an extra empty element at the end.

[18:44](#msg6352e88c0a8c6e22a1d29b21)Seems to be the 10-Aug change: https://github.com/red/red/commit/9de5e5909bdea30a0e13441fe614eca580556cd9

The associated test produces the same result before and after that change, so I'm not clear on the details yet.

Here's the extract of what `split` does:

```
rule-core: [
	keep copy v [to [delim | end (print 'end-a)]] (print 'v)
	delim
	[end (print 'end-b) keep (make series 0) | none (print 'none)]
]
series: ","
delim: comma
parse series compose/only [collect any (rule-core)]
```

Previously this produced

```
v
end-b
== ["" ""]
```

Now it produces

```
v
end-b
end-a
v
== ["" "" ""]
```

hiiamboris

[19:06](#msg6352edb59ee3ec22b4d3673b)makes sense

[19:10](#msg6352ee88f00b697fec518de1)make delimiter optional and get rid of the 3rd line?

greggirwin

[19:13](#msg6352ef70880fe76caa0682db)Yeah, I can reformulate, but want to make sure the change is doing what @dockimbel wants, since the test changed but the behavior didn't seem to.

hiiamboris

[19:22](#msg6352f16e0a8c6e22a1d2ab39)Change is evaluating loop's body until it fails, even if it's entering at tail

greggirwin

[20:00](#msg6352fa65f3e9f037584daf45)Thanks.

## Saturday 22nd October, 2022

dockimbel

[11:22](#msg6353d279aa210536d6224e88)&gt; Yeah, I can reformulate, but want to make sure the change is doing what @dockimbel wants, since the test changed but the behavior didn't seem to.

It's not what I would like, but it's what we need as it allows a better and more accurate control on `end` handling.

greggirwin

[18:00](#msg63542fd827f328266d4f4606)OK, thanks.

[21:36](#msg6354627a880fe76caa090a19)Updated my `split`. Back in business.

[22:02](#msg6354688abad3c73752eabfab)Everyone needs to test their `parse`-based code for the effect this change has. e.g. I have places where the last rule catches errors, which now need an `| end` before them. e.g.

```
rule: [
	; valid input element rules...
	'a
	; ...
	;| end		; needed for new parse behavior
	| pos: (
		print [
			"Unexpected value in format string:" newline
			tab "Where:" mold pos newline
			tab "Index:" index? pos newline
			tab "Value:" mold pos/1 newline
			tab "Code Point:" any [attempt [to integer! pos/1] 'Unknown]
		]
	) reject
]
prin "[a] >> " print [parse ['a] rule newline]
prin "[]  >> " print [parse []   rule newline]
prin "[b] >> " print [parse ['b] rule newline]
```

GiuseppeChillemi

[23:09](#msg635478250a8c6e22a1d557bf)Top 20 Languages:  
https://developers.slashdot.org/story/22/10/21/239244/javascript-still-tops-python-and-java-in-redmonks-latest-rankings-while-go-and-typescript-rise

## Sunday 23th October, 2022

GalenIvanov

[07:46](#msg6354f138cd9a8436d12d79dd)Strange - no Perl, no Haskell...

luce80

[07:55](#msg6354f35e86407c265b86bfb0)No Cobol, no any-kind-of-Basic...but there are nice comments. When will Red enter that list ?

dsunanda

[09:13](#msg635505d0dcbf067fdca9a28c)You'd be unlikely ever to see something like Cobol on that list - it's a list of languages active on Github and Stackoverflow.

Cobol may well still be powering a large percentage of the deep back end of our modern world; but it is not a natural match for the type of projects seen in githib etc (mainly developer tools, compilers, web 3.0 apps etc).

On stackoverflow, there are 2 million questions tagged \[javascript], 1600 tagged \[cobol] and under 250 tagged \[red].....Although, maybe Red is self-explanatory :)

hiiamboris

[09:15](#msg6355063bf3e9f03758514463)Indeed, the more esoteric the language is, the more questions it raises.

GalenIvanov

[09:59](#msg63551071f3e9f037585155cf):+1:

## Wednesday 26th October, 2022

GalenIvanov

[10:54](#msg635911d088e38704c02cb158)I've updated my \[Combinatorics](https://github.com/GalenIvanov/Combinatorics-Red) project. I'll be glad to see your feedback after testing it.

hiiamboris

[11:06](#msg635914a886407c265b8e5687):+1:

[11:07](#msg635914da0a8c6e22a1dde664)Do you use it in programs, in code golf, or just as an educational project?

GalenIvanov

[11:09](#msg63591563cf41c67a5ccbe0b8)I haven't used it yet - I suppose it should be qualified as an educational project.

greggirwin

[18:14](#msg635978f927f328266d5927c9)Very nice @GalenIvanov. The cartesian product reminded me about Martin Sustrik's article on it, which I adapted to Red, and played with extending, when I saw it.

[18:17](#msg635979b6bad3c73752f46195)

```
x: [[♠ ♣ ♥ ♦] [A K Q J 10 9 8 7 6 5 4 3 2]]
print mold new-line/skip cartesian-product x on 13
```

:+1:

GalenIvanov

[19:25](#msg635989b0f00b697fec5dc746)Thanks, @greggirwin ! I think we have to be ready for the times when Red will have modules.

## Monday 7th November, 2022

hiiamboris

[18:32](#msg63694f2b88e38704c04ab33e)## Deep changes to Spaces

I have committed a few important changes to Spaces. These decisions were not made lightly, but were evaluated for a long time, and now are finally live:

`1`. Switched to \*\*single-parent model\*\*, so using the same space in multiple spots on the tree is not a good practice (you'll get a warning if you try that). Though it is a requirement for self-containing grid demos, so not entirely forbidden for foot shooters. Designer's comments \[here](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/design-cards/single-vs-multiple-parents.md)

`2`. Where \*\*names\** of spaces (as words) were used, now space \*\*objects\** are used everywhere (even in paths), and those space objects have a `/type` facet with their style name. Designer's comments \[here](https://codeberg.org/hiiamboris/red-spaces/src/branch/internalized-name/design-cards/words-or-objects.md)

`3`. Every space has \*\*type/range checks\** now, leveraging \[`classy-object`](https://codeberg.org/hiiamboris/red-common/src/branch/master/classy-object.red) design. So an attempt to assign to a facet a value not supported by it will raise an error:

```
>> list: make-space 'list []

>> list/size: -1x0
*** User Error: Failed (0x0 +<= size) for pair value: -1x0
*** Where: do
*** Near : do make error! info/2 :new
*** Stack: run on-change-dispatch  

>> list/type: none
*** User Error: Word type can't accept none value: none, only [word!]
*** Where: do
*** Near : do make error! info/2 :new
*** Stack: run on-change-dispatch
```

`4`. \*\*Custom\** `mold` implementation is used, which I will keep tuning for better debug output. Should you find the output unsatisfying in some cases, please report. Unfortunately, I cannot switch console command output to this new mold, so anything after `==` is still the native `mold`, and `print mold` has to be used instead:

```
>> lt: lay-out-vids [vlist [text "1" text "2"]]
>> render lt/1
>> ?? lt
lt: [list:26x62]       ;) not an url, but abbreviated space object!
>> ?? lt/1/map
lt/1/map: [text:6x16 [offset 10x10 size 6x16] text:6x16 [offset 10x36 size 6x16]]
>> print mold hittest lt/1 15x15
[list:26x62 15x15 text:6x16 5x5]
```

Attempt to `form` a space however will most likely freeze the program, so beware.

Risk of breaking changes should be considered much smaller from now on!

Documentation was updated accordingly.

pekr

[19:22](#msg63695b0c21df5f7a54da49c5)What are the "classes" - real classes, kind of OOP, or just some kind of classifying of face types?

hiiamboris

[19:25](#msg63695bc3dcbf067fdccf38a7)Classification, type and equality info, range checks, per-word on-change handlers.

[19:26](#msg63695bed27f328266d7657af)E.g. `host` is a class of base faces, and `list` is a class of spaces. Each with their own set of the above.

pekr

[19:49](#msg63696132880fe76caa2fa846)I went thru some of the Spaces materials over the weekend. It really looks, like you're cooking a next gen system, but I can find the code a bit complicated.

OK, that's not necessarily for ordinary users to care about, but one aspect I really did not like - the `facet=`syntax .... I can spot code like `=below=:`, or code like `@(m + 1x4)`, `facets: [#align]`- why a hash sign here and not a litword?

hiiamboris

[19:52](#msg636961f55b0dbc04b8bdf7f2)`#macro [#align] func [s e] [[ ... ]]`

[19:53](#msg636962305b0dbc04b8bdf842)I assure you code is \*immensely* complicated ;)

pekr

[19:53](#msg63696253bad3c7375211cdb4)Thanks, forgot about macros and did not find it being a preprocessor either :-)

greggirwin

[20:27](#msg63696a310513b562e89d29d2)Thanks for the update @hiiamboris.

## Tuesday 8th November, 2022

GalenIvanov

[08:12](#msg636a0f572cb6570240197c26)Thanks for sharing the designer's comments, @hiiamboris - it's a good read!

meijeru

[09:08](#msg636a1c80655bc46025b9217e)There are 5 issues with label `status.tested` which are still open. What could be the reason? If there is none, this underrepresents the performance of the team.

hiiamboris

[09:17](#msg636a1ec5a34b5112111f25aa)Thanks for the feedback @GalenIvanov. Wasn't sure anyone will be reading it :)

## Saturday 12nd November, 2022

WayneCui

[00:35](#msg636eea49b1a759643669cf45)I'm trying to write a Hessian client (http://hessian.caucho.com/) with Red，can I make it like the Python way like below? But obj/some-unexists-func will report error。If not, It may need some pre-created API obj, but how to know which function has been called?

[00:35](#msg636eea6015a3885c70e8cc1b)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/ny2F/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/ny2F/image.png)

[00:40](#msg636eeb6818f21c023baa5e17)The idea is, when call some func on some obj, the the client will make a RPC call, it send the func name and params through net to the RPC provider, so I need know which func has been called

hiiamboris

[09:17](#msg636f64a4473cf96648e0e88d)Red has no Hessian module.

[09:19](#msg636f651e473cf96648e0e932)You may write your own dialect that will follow non standard evaluation rules. Check function existence with `select`.

## Sunday 13th November, 2022

WayneCui

[02:01](#msg63704fecf9491f62c9af6b74)@hiiamboris Thanks for reply. I'll try it. :-)

## Wednesday 23th November, 2022

hiiamboris

[20:23](#msg637e8154bcdb0060b835eeb5)Happy to announce...

\## A new demo program written with Spaces - RedMark :)

A rather basic markdown viewer (take this web stack! :)

Description and binaries \[here](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/#red-mark-redmark-red)

!\[](https://i.gyazo.com/548ce314237cf14e8daea7fd77503e13.gif)

[20:28](#msg637e8274655bc46025de62fd)\[GIF here if it doesn't load for you as well](https://i.gyazo.com/548ce314237cf14e8daea7fd77503e13.gif)

## Thursday 24th November, 2022

toomasv

[05:04](#msg637efb452cb65702403fa362)Looks very nice! It didn't crash on `reference.md` even on resizing, although it took some time.  
\[!\[redmark](https://toomasv.red/images/Varia/hiiamboris-redmark.gif)](https://toomasv.red/images/Varia/hiiamboris-redmark.gif)

I tried also the `inspector`, very cool! Noticed a small glitch on resizing though:  
\[!\[inspector](https://toomasv.red/images/Varia/hiiamboris-inspector.gif)](https://toomasv.red/images/Varia/hiiamboris-inspector.gif)

planetsizecpu

[07:27](#msg637f1cd625ca105c88ce295b)Good job @hiiamboris 😀

hiiamboris

[08:46](#msg637f2f6525ca105c88ce4a1d)Thanks! @toomasv will look at it.

[12:13](#msg637f5fd60513b562e8c567b2)I broke ellipsization too as I see :)

[16:21](#msg637f9a11326f06602c62b99a)Bugs are fixed.

toomasv

[17:34](#msg637fab1515a3885c7006de59)I confirm for `red-inspector` :+1:

But differently from what I saw in morning `redmark` now crashes on `reference.md` when scrolling :(  
Did you do something with it too?

hiiamboris

[17:38](#msg637fabf9ff5546644b5d1714)The crash is a random one. Try to let it cool down after loading for 5 secs or so, before you scroll it. Don't scroll too fast too as it seems to crash more readily when lag increases.

[17:38](#msg637fac09326f06602c62da8c)I get it to crash 3 times out of 5 or so.

[17:38](#msg637fac1aa34b51121146a09c)Sometimes even without any message! :)

[17:40](#msg637fac88326f06602c62dbbe)My hunch is it's related to big images being drawn (they're downscaled).

toomasv

[17:42](#msg637facfa655bc46025e080d3)OK, lazy scrolling seems to work :)

hiiamboris

[17:42](#msg637fad0cabfb5860bb2eff92):+1:

## Friday 25th November, 2022

GalenIvanov

[08:11](#msg638078a9ff5546644b5e70a9)Impressive work, @hiiamboris !

hiiamboris

[10:12](#msg63809529abfb5860bb309abd)Thanks, @GalenIvanov

dockimbel

[16:54](#msg6380f3482cb6570240434348)FYI, `on-deep-fixes` branch has been merged, here's the changelog:

\* Bitset! values can now trigger deep reactions.  
\* Now compound scalar datatypes (pair!, date!, time!, tuple!) will emit `on-change` events when one of their component is changed using an access path (both in compiled and interpreted code).  
\* Much safer reactions code static analysis (no more accidentally triggering function calls resulting in hard-to-track bugs).  
\* Compiled access path! values now trigger proper reactions when needed.  
\* Compiled access path! values are now correctly reported in errors (no more `none` placeholders).  
\* Setting a value to a reactor's field will now allow value being rewritten by incoming chain reactions (also improves reactions checking performance).  
\* Fixes for `on-deep-change` unwanted firing.  
\* Fixes for `is` registering same reaction twice (resulting in unwanted firing).  
\* Other reactivity-related fixes.

hiiamboris

[16:57](#msg6380f3e318f21c023bcaf9e9):+1:

[16:57](#msg6380f3f1326f06602c652da4)time to update

dockimbel

[17:02](#msg6380f52fff5546644b5f5c8f)I've noticed a minor regression in the `%picosheet.red` demo in red/code repo, looking into it...

hiiamboris

[17:08](#msg6380f6a6326f06602c653149)do you plan to address https://github.com/red/REP/issues/115 before 0.7?

dockimbel

[17:09](#msg6380f6cf655bc46025e2d54b)No, that's for the work on the language specs.

hiiamboris

[18:29](#msg63810998426f9311ffbfb3a7)red-lang.org still serves yesterday's binary under the name of today's

## Saturday 26th November, 2022

ldci

[12:01](#msg6381ffff0513b562e8ca2cb0)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/vFJC/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/vFJC/image.png)

[12:03](#msg6382007cff5546644b61351a)Due to Oldes’s excellent work, we can now process thremal images without using ffmpeg for splitting raw data. I like:)

[12:03](#msg638200ad2cb6570240451173)Oups, thermal images

Irwin1985

[12:41](#msg638209610513b562e8ca3f87)Hi there, I'm trying to compile `hello.red` from the "getting started" page but I got this error after `redc -c hello.red` \_PROGRAM ERROR: Invalid encapsulated data._

ldci

[13:01](#msg63820e1615a3885c700b1417)Probably you need to rename tour red-toolchain as redc

[13:01](#msg63820e22426f9311ffc171d8)your

Irwin1985

[13:04](#msg63820eebb1a75964368c50c8)@ldci Yes, I did it as a first step but still doesn't work..

[13:05](#msg63820f102cb6570240452ce0)I'm on windows BTW

dockimbel

[13:28](#msg63821480326f06602c671cde)@Irwin1985 May be a downloading issue leading to a corrupted binary. Try deleting the binary and download it again from the Download page. That error is caused by Rebol's encapper when the binary executable's path cannot be guessed properly or the payload data is somehow corrupted. Also, check that your antivirus is not interfering.

Irwin1985

[13:29](#msg638214c9655bc46025e4c510)@dockimbel Thanks, I'll do it...

[13:32](#msg63821574a34b5112114ae471)Same error :(

hiiamboris

[13:47](#msg63821909426f9311ffc18430)@Irwin1985 https://github.com/red/red/issues/543

pekr

[14:20](#msg638220a2a34b5112114af7e0)Small glitch in a recently compiled gui console. When I go to the menu, About, and click a link to red-lang.org, I get the following error in the console: `*** Script Error: browse does not allow none! for its url argument`

hiiamboris

[14:24](#msg638221a3abfb5860bb3356dc)confirmed

## Monday 28th November, 2022

zentrog:matrix.org

[01:10](#msg63840a70473cf96648061c5e)It also works to put a ‘shim’ to the red executable in the PATH, like script that redirects to the red exe

## Tuesday 29th November, 2022

Oldes

[18:03](#msg63864965bcdb0060b843f9f4)In Rebol and Red when using bitwise operation on binary, the result has length of the longest series:

```
>> #{FF} xor #{0000}
== #{FF00}
```

I wonder if it would not be more practical to have the result with the shortest length and so just: `#{FF}` in above case.  
I don't know if anybody is using it `xor` like that, but I found it practical when working on websocket implementation, where the input must be demasked.. currently I have to remove the additional bytes.

rebolek

[18:08](#msg63864a9eabfb5860bb3b0706)I can imagine that for a longer argument, the shorter one would be used repeatedly. It would make encryption easier.

greggirwin

[19:37](#msg63865f92abfb5860bb3b30d8)So it would shrink and grow based on the minimum number of bits needed? That seems like it could make things harder to reason about, because the value is changing size based on its contents.

Would the same behavior apply to bitsets, tuples, and vectors?

hiiamboris

[19:50](#msg6386627bff5546644b6946fe)Just implement https://github.com/red/REP/issues/97 and `xor` trick will be automatically supported ;)

greggirwin

[19:54](#msg63866391326f06602c6f03c3)We definitely want to localize that logic, but `part` in your design is not content-sensitive, is it? And the question stands about whether that's the behavior we want in this case.

hiiamboris

[19:56](#msg638663ef25ca105c88db7af4)I don't see Oldes asking about content sensitivity.

[19:57](#msg6386641315a3885c7013153d)He's just put into a corner by the limitations of the historical adhoc /part design.

greggirwin

[19:57](#msg63866443326f06602c6f056f)Maybe I didn't understand his request then. I thought he wanted it to minimize the result, based on the number of required bytes. i.e. trailing zeros would be truncated.

Oldes

[20:59](#msg638672aef9491f62c9d7978f)No, I'm not in any corner. I think that ideally it could work like @rebolek said. This is my current code:

```
while [not tail? payload][
	append result mask xor take/part payload 4 ;; not ideal, because it creates a lot of series
]
clear skip result len ;; removes the padding bytes added by xor
```

I wonder if there are any other xor use cases on series. If it would work like @rebolek said, than I could just write:

```
result: payload xor mask
```

[21:07](#msg6386748cb1a75964369466c9)I have checked 1238 script from rebol.org (that I have locally) and it looks that all `xor` usage are with integers and chars. No binary `xor`... the most close of my use is this script: http://www.rebol.org/view-script.r?script=gps-xor.r

[22:07](#msg638682bbf9491f62c9d7b5a5)Regarding tuples, I am also not sure, how useful is this:

```
>> 200.200.200.200.200 and 100.100.100
== 64.64.64.0.0
```

greggirwin

[22:40](#msg63868a7b655bc46025ed1713)@dockimbel do we have a working list or place to put questions we want to remember when spec work starts?

## Wednesday 30th November, 2022

dockimbel

[10:35](#msg638731e2ff5546644b6acd36)We can use the red/red wiki for that.

greggirwin

[17:48](#msg638797620513b562e8d48cbe)OK.

maturin2048:matrix.org

[18:10](#msg63879c964fee72663c9ca189)@greggirwin: Not trying to bother ya'll. I've been interested in this project for several years. Just exploring. Please forgive.

hiiamboris

[18:15](#msg63879da4abfb5860bb3d96c7)Hi and welcome @maturin2048:matrix.org ;)  
Let us know if you need any help.

maturin2048:matrix.org

[18:17](#msg63879e23f9491f62c9d9db5d)@hiiamboris: Thank you.

greggirwin

[18:20](#msg63879edd426f9311ffcbc80f)Welcome @maturin2048:matrix.org !

maturin2048:matrix.org

[18:58](#msg6387a7d625ca105c88ddf284)@greggirwin: Hey, I do have a question. Is it possible to use the higher level red languages on the debian 10 system built on to the chrome os developers mode. This the only language I've ever really wanted to learn. Would save me tons of money.

ne1uno

[19:16](#msg6387ac1c25ca105c88ddfb16)too bad the demo android v5 app didn't have a REPL

greggirwin

[19:29](#msg6387af09b1a759643696b4ee)@maturin2048:matrix.org I don't know about the Chrome Dev Mode, but it's easy enough to try it. Just download one exe and see if it runs. :^)

endo64

[22:21](#msg6387d75d655bc46025ef9171)I removed colon and question mark characters from some Wiki pages to make it possible Red/Wiki cloneable on Windows.  
Better to put this info on Home page like "Do not use invalid filename characters in the title: : \\ / ? ..." (here is some info https://stackoverflow.com/a/31976060/333153)

greggirwin

[22:23](#msg6387d7fd25ca105c88de5326)Thanks.

## Thursday 1st December, 2022

planetsizecpu

[07:12](#msg638853e0426f9311ffcd0d6f)Welcome @maturin2048:matrix.org

maturin2048:matrix.org

[15:16](#msg6388c540b1a759643698b0e1)@planetsizecpu: Hello to you. Thank you.

## Friday 2nd December, 2022

dockimbel

[12:15](#msg6389ec44bcdb0060b84ab6d2)Does anyone know what happened with the early binding to Rust made by @nc-x (the repo is now gone)? Cf. https://twitter.com/red\_lang/status/818367642989785089

greggirwin

[19:10](#msg638a4db477e04454154c0b7c)Nope.

## Saturday 3th December, 2022

henrikmk

[14:59](#msg638b64562305cb4ed708d62d)Oh, wow, OpenAI's ChatGPT understands and generates REBOL code. I did not expect that.

[15:12](#msg638b6754f0973a41eb2467c5)ok, it's not very good at it, but it's at least a start

## Tuesday 6th December, 2022

Oldes

[07:10](#msg638eead8f07f3970c0600972)Let's say, that I have a series, which has index &gt; 1 and I want to remove the skipped part.. how to call such a function? Currently I have to do this:

```
x: next "1234"
;; now I want to remove the 'already processed' part
remove/part head x x
;; and I must reset the index
x: head x
```

hiiamboris

[08:28](#msg638efd47bdd9d94eca3f1a1c)truncate or flush

greggirwin

[08:39](#msg638effbe4abb3f4684a79e1c)I have an old `chop` function, which trims the tail. `chop/head` isn't bad as a name.

Oldes

[09:08](#msg638f068b2305cb4ed70f761e)What about `crop`?

greggirwin

[09:10](#msg638f07010fa448470ebef798)That sounds more 2D to me.

Oldes

[09:11](#msg638f073ff07f3970c0603f65)Hm... than I would choose the `truncate`. Where `truncate/part` could shorten the series from the tail.

[09:17](#msg638f08a6bdd9d94eca3f2fc2)Or maybe `truncate/size` or `truncate/tail`?

greggirwin

[17:18](#msg638f79541bcd2b7078778f53)We already have `trim`, which is a nice word. But it's an action and doesn't take an arg, which I forgot to mention my `chop` does for the size to chop off. Trimming to the implied offset is a much more specific need, so probably shouldn't use a general name we want for other things like this that take args. I generalized in my head automatically.

This is a tricky behavior to name.

[17:21](#msg638f7a2d4abb3f4684a88f03)How about `lop`, like "lopping of its head"? Could also be `lop-head` for clarity, and still be shorter than `truncate`.

toomasv

[17:43](#msg638f7f3f85045441f8b5df2c)`behead`?

greggirwin

[17:43](#msg638f7f4dc27b3d278f269f36)Nice. :^)

Oldes

[18:00](#msg638f835b1bcd2b707877a32f)Thanks, I'm already using `truncate`.

greggirwin

[18:12](#msg638f86162305cb4ed7107224)12 hour old legacy code. :^)

zentrog:matrix.org

[21:58](#msg638fbb220fa448470ec05f63)Woah, the series index works differently than the mental model I had (maybe from using things like `find`). I had the impression that it would be somehow pointing to the actual item, instead of just a fixed index from the head.

hiiamboris

[22:29](#msg638fc22fc00c002797ba3fa9)It's an array, not a linked list.

zentrog:matrix.org

[22:57](#msg638fc8d389c38775e74cdb67)It's hard to know from the interface, since you can use `insert` and `remove` on them. Do they just copy? Or is there something a bit more fancy going on?

hiiamboris

[23:01](#msg638fc9d0967c830584207234)Copy moved part up to the tail, yes. Although I've seen some head insertion optimization placeholders, don't know if they are used at all.

## Wednesday 7th December, 2022

dockimbel

[11:00](#msg6390724d83b5463b6ef02a91)Head insertion optimization placeholders: not used yet, I'm not sure if it's worth keeping them.

## Saturday 10th December, 2022

hiiamboris

[15:31](#msg6394a654a8211f623d77cd96)I wonder, why `bitset!` is not a series?

[15:33](#msg6394a6d38bdea01368acb4f1)It looks like a nice format for bit-packing things. But without bit-addressing it will be painful to do that.

rebolek

[17:28](#msg6394c1a983b5463b6ef84cf4)It is. I tried a lot of tricks but eventually, it will bite you anyway. If it was a series it would be \*soooooooooo* useful. Bloom filters and other stuff would be a piece of cake.

## Sunday 11st December, 2022

Oldes

[09:55](#msg6395a92a8bdea01368ae8329)I wonder how it should work like.. any examples of use cases?

hiiamboris

[10:38](#msg6395b313865cc926ae564fe7)Like all series work.

Oldes

[11:23](#msg6395bdb5967c8305842b5f1a)Could you be more specific? For example how to handle complemented bitsets?

[11:24](#msg6395bde3b9b68753418c795c)And how useful it would be?

[11:30](#msg6395bf4aa151003b5a6354bc)What would be result of: `next make bitset! 2#{00000001}`?

hiiamboris

[11:45](#msg6395c2e883b5463b6efa0d68)&gt; how to handle complemented bitsets?

Not sure what you mean. If you mean how to mold them, they're molded fine already.

[11:48](#msg6395c39fdbde086250da94c2)&gt; What would be result of: `next make bitset! 2#{00000001}`?

`make bitset! 2#{0000001}` ? or `make bitset! 2#{0000000}` ? I agree mold is backwards right now, we need clear definition of where's the head and where's the tail first.

[11:50](#msg6395c41d2b937b1a2eb6ecf3)Again, this question is more about "how to mold it", not "how to work with it". I understand molding them in radix-2 may be unwieldy, and if we mold in radix-16 we need to somehow denote bit-precise length.

[11:55](#msg6395c52769ce3c533821e5a0)As to how to work with it, `pick` currently works on it almost as if it was a series (except returning logic, not 0-1 integer). So addressing is kind of there, just not leveraged enough.

[11:58](#msg6395c60189c38775e757eccc)A few observations:

```
>> b: make bitset! 2#{01010101}
== make bitset! #{55}
>> pick b 0
== false
>> pick b 1    ;) picking is 0-based unlike series
== true
>> poke b 0 true b      ;) poke works on bytes, not bits - huge inconsistency
== make bitset! #{D5}
>> enbase/base to #{} b 2
== "11010101"
```

[14:09](#msg6395e4b32b937b1a2eb7281b)Actually, disregard "poke works on bytes" comment. I'm mistaken.

Oldes

[14:49](#msg6395eddfa1ba3e75d8f0f077)Complemented bitset: `complement make bitset! #{}`

[14:49](#msg6395edf683b5463b6efa5a1a)`2#{0000000}` is not valid binary.

[14:51](#msg6395ee57dbde086250dadeaf)Again... what is your real life usage example? @rebolek mentioned \_bloom filter\_, but to be honest, I don't think that it is something what should be implemented in a higher level.

[14:54](#msg6395ef248bdea01368af0364)I don't know if it is same in Red, but in Rebol the bitset is used internally in the \_parse_ DSL quite a lot, and I'm sure that the need to handle indexed bitsets (even when these would be used only in really rare situations) would slow the \_parse_ down.

hiiamboris

[14:58](#msg6395f00e3daaa326ba7d029d)How can one addition operation possibly slow it down?

Oldes

[14:58](#msg6395f022967c8305842bb810)So if there is something, what I would change with bitsets, than it is now missing conversion to string.

```
to string! charset "abc" ;== should return "abc"
```

[15:01](#msg6395f0d00c89e71a33742de4)But than there is again the issue with the complemented bitset and so the feature is not there.

## Monday 12nd December, 2022

greggirwin

[04:10](#msg6396a99c07ac190597eb770e)&gt; I wonder, why `bitset!` is not a series?

Thinking out loud.

Bits are not Red values, so semantics are going to be quite different in some cases. Even today, with actions that are supported you have to think about them differently. e.g. appending to a bitset may not change it and, even if it does, the length may not change. Remove has the same issue.

You can index-address bits, though no `foreach`.

## Friday 16th December, 2022

meijeru

[09:04](#msg639c349907ac190597f5fbcd)Some differences between bitsets and vectors of 1-bit integers:  
\- bitsets are addressed with 0-origin indexing  
\- individual bits can be set with true/false and 1/0  
\- on retrieving they yield only true/false, and they can't be compared with 1/0

## Sunday 18th December, 2022

loziniak

[17:18](#msg639f4b80967c8305843d158f)I have an idea – perhaps `set` could be recursive, when destructuring? that would allow `path!`s inside first argument block, and even other blocks, like:

```
b: copy #()
msg: none
v: [123 "abcde" ["jklm" "ok!"]]
set [a b/3 [b/1 msg]] v
```

hiiamboris

[17:34](#msg639f4f4283b5463b6e0bba91)Why bother?

loziniak

[17:35](#msg639f4f728bdea01368c0517c)paths are very useful, I'm struggling at the moment.

[17:36](#msg639f4fa92b937b1a2ec88d6d)being limited to words makes destructuring less useful.

hiiamboris

[17:37](#msg639f4fd68bdea01368c051d9)Make a mezz

loziniak

[17:37](#msg639f4fec69ce3c5338337fc9)why bother with destructuring at all then?

[17:37](#msg639f4ff369ce3c5338337fd1)ok :-)

hiiamboris

[17:38](#msg639f501aa8211f623d8b8e40)Because it's a common case - to process a data row or return multiple values from a function

Oldes

[17:38](#msg639f5032a151003b5a74f1e1)

```
>> m: #() set 'm/a 1 m
== #(
    a: 1
)
```

loziniak

[17:39](#msg639f504f07ac190597fb7af0)@Oldes that's not destructuring

[17:39](#msg639f5055a8211f623d8b8e83)only 1 value here

[17:42](#msg639f5101a8211f623d8b8f4a)@hiiamboris isn't putting data from a row into object/map/block a common case? that's when paths could be useful in destructuring.

[17:42](#msg639f5120b9b68753419e3dca)in fact, recursion was a follow-up in my thought stream after paths :-)

[17:44](#msg639f516c07ac190597fb7cf7)if we have code that sets a path, why not re-use it for a block of paths!

hiiamboris

[17:46](#msg639f5205865cc926ae6803e8)

```
set-many: function [spec values] [
	repeat i length? spec [
		either block? spec/:i [
			set-many spec/:i :values/:i
		][
			set spec/:i :values/:i
		]
	]
	:values
]
```

All it takes

loziniak

[17:50](#msg639f52f3967c8305843d210e)sweet! this covers a block-of-words case nicely as well, which by analogy makes me wonder why it is natively in Red, since it can be done with mezz?

[17:50](#msg639f52f70c89e71a33858b0b)whatever

hiiamboris

[17:51](#msg639f53242b937b1a2ec89494)Because it's so common that speedup is significant.

loziniak

[17:53](#msg639f537e07ac190597fb7ff3)hmm I've never used destructuring, and when I need it, I need it with paths. from my point of view paths are 100% more common than words for destructuring :-)

hiiamboris

[17:53](#msg639f53a2a151003b5a74f6df)Maybe you're doing something \*non-idiomatically\*? ;)

loziniak

[17:53](#msg639f53b6dbde086250ec44c3)hahaha probably!

[17:54](#msg639f53cf4a6ed51383628975)and \*non-magically* ;-)

hiiamboris

[17:54](#msg639f53d3b9b68753419e42b3):)

[17:55](#msg639f53ff865cc926ae68076c)Once we make `set-many` native, people will start asking why `foreach` doesn't support it too ;)

loziniak

[17:55](#msg639f5417dbde086250ec458c)and perhaps that's a good question?

hiiamboris

[17:57](#msg639f547fa1ba3e75d8023f59)Perhaps, but it can only be justified with data that proves cases are common enough to complicate the runtime.

loziniak

[17:59](#msg639f54f7967c8305843d237d)and where to get data on destructuring into maps? Red code that does not allow it?

hiiamboris

[18:00](#msg639f554b69ce3c5338338a33)Analyze your and other people's code. Find these patterns and how they can be rewritten. Show stats and side by side comparison.

[18:01](#msg639f558d2b937b1a2ec89887)Personally, I remember wanting it to accept paths maybe twice or so. Maybe had a thought on the inner block destructuring once, not sure ;)

loziniak

[18:03](#msg639f55e669ce3c5338338bee)aaah, welcome to the club!

[18:03](#msg639f560f83b5463b6e0bc6e5)let's just wait for the rest of the crowd :-)

[18:05](#msg639f566fa1ba3e75d80242e9)until then, I'll try to code something.

## Monday 19th December, 2022

greggirwin

[04:31](#msg639fe93189c38775e76a80b7)@loziniak if you can post your actual use cases, that will aid the discussion. It's not something I've ever needed personally.

## Tuesday 20th December, 2022

Kazzum

[14:55](#msg63a1cce08f8df4262ab4d725)Hello everyone, I've wanted to code in a real programming language for a while now and I just ran into a limitation of batch scripting (pseudo array are not cutting the mustard). what documentation section should I start with to learn how to move files using RED.

hiiamboris

[15:01](#msg63a1ce3a7de82d2616ee20fe)Hello and welcome @Kazzum  
On how to learn Red, there's a tip in the topic of the \[welcome room](https://gitter.im/red/red/welcome).  
In any case it's best to run Red console and type `help`. You'll figure it out from there ;)  
Any further question you'll have while you learn we'll be happy to answer in the welcome or \[help room](https://gitter.im/red/help)

Kazzum

[16:26](#msg63a1e244c4fec572d6485be3)Ah I see, Thanks so much @hiiamboris

## Wednesday 21st December, 2022

yx:periwinkle.sh

[16:27](#msg63a333ea51d2482e91cf58d9)hello, everyone. I'm an openbsd user and was interested in checking out this language. From my understanding red does not support running on openbsd, but the build from source instructions had information about a rebol interpreter for openbsd, so i thought it was worth the shot. However, it appears that the most recent release of rebol for openbsd was back in openbsd 4.0, which means that openbsd is effectively not able to run rebol from this binary. If there are plans to eventually port the language to openbsd, there will likely be issues from this, unless i'm missing something obvious. Has anyone been working on this or know if there's a way to potentially build rebol from source for a newer version of openbsd?

hiiamboris

[16:33](#msg63a3355851d2482e91cf5b33)Hi @yx:periwinkle.sh

[16:33](#msg63a3355b7de82d2616f0bdde)See https://github.com/red/red/discussions/5107

yx:periwinkle.sh

[16:34](#msg63a335a20cd40c2e899c6fd2)got it

[16:35](#msg63a335d57de82d2616f0bed9)well, thank you! the language looks very interesting even if i'm unable to try it right now

hiiamboris

[16:37](#msg63a3363dbe2c3c20c7109da0)You're welcome. Sorry we have not enough hands to catch on with the 64bit-only platforms, yet. You'll have to be patient ;)

## Thursday 22nd December, 2022

greggirwin

[19:14](#msg63a4ac8e410c633d48ee40d5)

```
>> ?? true?
true?: func [
    {Returns true if an expression can be used as true.} 
    value [any-type!]
][
    not not :value
]
```

Is there any reason not to use `to logic! :value` for the body? More efficient and more meaningful.

dockimbel

[20:25](#msg63a4bd313b37dd2c11447dbc)Probably a bit faster too as there would only be one call instead of two. Seems like it was copy/pasted from R3. So go for the change, open a PR.

greggirwin

[20:30](#msg63a4be60d8678973f979b390):+1:

[20:51](#msg63a4c3657de82d2616f3c5b6)Ha! The joke is on me. It's not standard in Red yet. I just have it in my local mezz loader. So the next question is whether it should be standard.

[20:52](#msg63a4c3813b37dd2c11448888)Clearly I just copied it from Rebol long ago.

GiuseppeChillemi

[21:14](#msg63a4c8c8ff1fd121b30dbbd3)@Kazzum LOL, never show your Alias to Italian People or in Italiano Forums.

## Sunday 25th December, 2022

endo64

[08:43](#msg63a80d22c4fec572d65364fe)@greggirwin same for `found?`, very simple, but I like to have it.

hiiamboris

[13:55](#msg63a8564d51d2482e91d851f7)Problem with `found?` is it can be used apart from `find` where it makes zero sense ;)

greggirwin

[21:30](#msg63a8c0ecd8678973f98078ef)@hiiamboris many functions suffer that. What happens if we eliminate all funcs that can be used out of context?

[21:32](#msg63a8c15a3b37dd2c114b5502)I don't use `found?` as much as I used to, but let's address `alter` first. :^)

hiiamboris

[21:33](#msg63a8c19c3b37dd2c114b5563)&gt; funcs that can be used out of context?

What's the other function you have in mind?

greggirwin

[21:36](#msg63a8c24140557a3d5c45e7b8)I would have to review and make a list. The point is that it's a meaningful name for its intended use \*with* `find`.

[21:37](#msg63a8c2918f8df4262ac12544)Does `form` qualify? No need to ever use it on a string, right?

[21:39](#msg63a8c3043b37dd2c114b571c)And `found?` \*can* be used for cases other than where `find` is used, which I wouldn't say makes zero sense.

hiiamboris

[21:58](#msg63a8c77063c9fc72d3f90c45)

```
>> found? 1 + 1
== true
```

[21:58](#msg63a8c77a378d512c182fae0f)I wouldn't compare it to `form`.

greggirwin

[23:06](#msg63a8d7868f8df4262ac147f7)

```
>> NaN? ""
== false
```

[23:07](#msg63a8d7ae40557a3d5c46080e)A string is not a number, is it?

[23:10](#msg63a8d87d0cd40c2e89a656cb)

```
>> found? any [select [a 1 b 2] 'a select [a 1 b #[none]] 'b]
== true
>> found? any [select [a 1 b 2] 'c select [a 1 b #[none]] 'b]
== false
```

Can you, and perhaps should you, formulate something like this differently? Maybe. `Found?` isn't standard, I haven't added it to my loader personally, so others will have to weigh in on the value and how/how much they use it.

## Tuesday 27th December, 2022

endo64

[10:48](#msg63aacd8ac4fec572d658330c)`found?`could use `find` then `is-admin?: found? admins user` would be possible.

## Saturday 31st December, 2022

meijeru

[14:35](#msg63b048c5be2c3c20c727b6bb)I recently became aware that (in)equality is not defined between `function!` values. Not even when two values are letter-by-letter identical, e.g.

```
>> f: func [x][x + 1]
== func [x][x + 1]
>> g: func [x][x + 1]
== func [x][x + 1]
>> :f = :g
== false
```

[14:36](#msg63b048f17de82d261607cdbb)What is the feeling about this?

hiiamboris

[14:47](#msg63b04b64410c633d4802a5b8)

```
>> :f = :f
== true
```

meijeru

[14:58](#msg63b04df940557a3d5c531a86)Yes, but that does not yield very much.

hiiamboris

[15:02](#msg63b04eea0dba357423533096)I suppose it just yields more performance, since comparing functions is an esoteric use case

[15:02](#msg63b04efaff1fd121b321b728)Behavior seems inherited from R2

[15:05](#msg63b04fa6c9591d20d37ec7e3)I mean consider objects comparison. They have to compare all their functions.

greggirwin

[17:41](#msg63b0745151d2482e91e6a212)Docs say they can be compared, but I doubt anyone has tried it, except for `same?`. Design question. In the meantime you can do `>> equal? mold :f mold :g == true` or `>> equal? body-of :f body-of :g == true` types of comparisons if you need it. Do you have a specific use case @meijeru ?

gurzgri

[17:51](#msg63b076afbe2c3c20c7280d18)Even `mold :f` comparison wouldn't be a very reliable way to tell equality ;-)

```
>> equal? mold :f mold :g ;== true
>> source f  ;== f: func [x][x + x] 
>> source g ;== g: func [x][x + x]
>> f 1  ;== 2
>> g 1 ;== fireworks!
```

with

```
bind body-of :g context [x: does [form first reverse [works! fire]] +: make op! func [a b] [load rejoin [a b]]]
```

greggirwin

[18:43](#msg63b082ea7de82d26160834d3)Of course, you can intentionally break anything in Red. :^)
