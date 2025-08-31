# Archived messages from: [gitter.im/red/red/welcome](/gitter.im/red/red/welcome/) from year: 2020

## Friday 3th January, 2020

kpeters58\_gitlab

[01:33](#msg5e0e99e214328863c0ffbdb0)Is there any support for one of the popular DBs yet (SQLite, PostgreSQL, MariaDB...)

endo64

[06:37](#msg5e0ee128016ca663c1807be4)@kpeters58\_gitlab Not yet. There is a SQLite binding but it might be outdated.

greggirwin

[16:14](#msg5e0f686ca769bf30fd2fc5ca)Nice to see you Kai! :^)

## Sunday 5th January, 2020

lucindamichele

[18:10](#msg5e1226901c3a592052d7dbaf)Howdy to all over here on /welcome! In case you missed it, we have a new update on the site for what's coming up in 2020: https://www.red-lang.org/2020/01/happy-new-year.html

## Thursday 23th January, 2020

Nomarian

[21:49](#msg5e2a14ff9ad22d5bd5caedd4)to install red on a raspi, you need to build from source right?

[21:49](#msg5e2a15079ad22d5bd5caeddf)armhf*

Respectech

[22:23](#msg5e2a1cd39ad22d5bd5cb220d)@khwerz No, there are pre-built binaries for Red on ARM.

Nomarian

[22:25](#msg5e2a1d3dcd53a80aac13cce5)where?

Respectech

[22:25](#msg5e2a1d68da04a624f46fa951)I always have a hard time finding them. I've been hoping that they would link to them from red-lang.org Download page (they're hosted on an external site).

[22:25](#msg5e2a1d6c44c076313cd4a2ed)Let me see if I can find them.

[22:33](#msg5e2a1f1ddc07667042df6dea)OK. Here they are: https://rebolek.com/builds/

Nomarian

[22:44](#msg5e2a21ea1a1c2739e3ea89b4)thanks!

[22:45](#msg5e2a21eef85dba0aab02e48f)I was actually looking for this

## Friday 24th January, 2020

Nomarian

[03:26](#msg5e2a63d7da04a624f471702f)there was also a website containing builds for android, but I can't tell if it was rencpp or r3

## Monday 27th January, 2020

gour

[06:40](#msg5e2e85d94c3dae24f5f7a579)morning

[06:41](#msg5e2e861e44c076313cf2dd5a)how are the terms static-typing &amp; null-safety connected with Red? i'm also interested how is one supposed to write larger apps using Red, is there some modules/importing system, iow. how does one organize one's codebase tree?

Oldes

[09:17](#msg5e2eaaba44c076313cf3ccae)@khwerz you probably mean this outdated site: https://rebolsource.net/

endo64

[11:15](#msg5e2ec63f4c3dae24f5f95dbe)@gour Modules are planned after Full IO (almost finiashed) and Android GUI tasks completed.  
You can see the plan roughly here: https://trello.com/b/FlQ6pzdB/red-tasks-overview

gour

[11:23](#msg5e2ec844f85dba0aab228540)@endo64 thank you

[21:21](#msg5e2f5477a420263e03adb773)the following \[article](https://redprogramming.com/Why%20Rebol%20and%20Red.html) says: "The ability to create new complex data types will be added as a feature in Red." what is the schedule for that feature?

## Tuesday 28th January, 2020

greggirwin

[02:26](#msg5e2f9bdb58f02e3497326fb6)That's not an official Red site, and it's not a statement we've made.

[02:27](#msg5e2f9bf6bfe65274eaad1d5e)Nick's a great guy, but that feature is not on our current roadmap.

gour

[07:17](#msg5e2fdffb73ddad4acd636117)@greggirwin ok. now wonder how does one create custom data types like e.g. C's structs or records in other languages?

rebolek

[07:19](#msg5e2fe066ea9ba00b8482262a)Custom type like struct - you can use for example `object!` for that.

gour

[08:25](#msg5e2ff015433e1d4039682c2c)@rebolek thanks. it looks that's prototype-based, looks cool

rebolek

[10:08](#msg5e30081dbfe65274eaaff890)@gour yes, Red's objects are prototype-based.

bferris413

[20:43](#msg5e309d0cf301780b833e51dc)Is there a recommended go-to tutorial or reference endorsed by the core team?

greggirwin

[20:45](#msg5e309d50ea9ba00b84877f02)Reference docs are at https://doc.red-lang.org/, but we still like the Rebol Core Guide, until we work up our own, as a general language introduction.

bferris413

[20:45](#msg5e309d64e8a8383559ee1afa)Understood, thanks

## Wednesday 29th January, 2020

gour

[07:59](#msg5e313b70f301780b83425ee6)when i became interested for Red some years ago i recall that these channels were much more active than today...just wonder if everyone is simply busy doing concrete work in Red or the traffic is simply not as it used to be? is mailing list more active?

rebolek

[08:03](#msg5e313c6ddc52c34ace226c67)If you look at the activity stats, there are peaks and valleys. Peaks are usually when a new version is released which unfortunately didn't happen for a long time. That doesn't mean there's no active development, just that there wasn't official release (personally, I'm for more agressive release schedule, but that's not the case right now).  
So I expect another peak soon, when 0.6.5 is released.

gour

[08:21](#msg5e314077433e1d40397161cb)is there any rough estimate for 0.6.5?

[08:22](#msg5e3140d8f6945f41ef36b097)@rebolek otherwise, i've met several ex-Red users stopped following Red due to "change of the dev-focus, blockchain etc."

rebolek

[08:32](#msg5e314320f301780b8342924a)I'm not sure what they mean about a change of the dev-focus, there weren't any significant changes to the roadmap. Yes, blockchain was added as it helped with financing Red development, but that's a good thing IMO, not bad.  
Rough estimate: soon™ :smile: There's \[21 open bugs for 0.6.5](https://github.com/red/red/issues?q=is%3Aopen+is%3Aissue+milestone%3A0.6.5) which can give you rough estimate.

gour

[08:37](#msg5e314431dc52c34ace22a33c)@rebolek i agree that devs have to eat &amp; pay the bills. nothing against contributing by buying some license if required as long as there is prospect to use Red as full-stack language since the it promised to bring back some humanness to programming, at least to those not being full-fledged programmers, iow. my main interest in Red is to work the hobby project (multi-platform desktop gui app) in my spare time and not being to force to learn/master zillions of different technologies/languages (here I'm mostly thinking about JS-crap)

bferris413

[13:58](#msg5e318f9d433e1d403973eb5b)How do you start in GUI mode on macOS?

rebolek

[14:52](#msg5e319c1cbfe65274eabb8162)@bferris413 I'm not sure how it works with precompiled versions, but if you compile yourself `%enironment/console/GUI/gui-console.red`, you'll get GUI mode Console.

bferris413

[15:44](#msg5e31a85f40da694c5ee904f4)ok thanks

## Thursday 30th January, 2020

bferris413

[18:40](#msg5e332308e8a8383559002285)how do you read command-line args?

rebolek

[18:43](#msg5e3323dabfe65274eac6cead)See `system/options/args` and `system/script/args`

bferris413

[18:44](#msg5e332427bfe65274eac6d07a)great, thanks

Nomarian

[19:11](#msg5e332a49159413355840c72e)So I'm getting this when I run red from another program, PROGRAM ERROR: Invalid encapsulated data.

[19:11](#msg5e332a62159413355840c7eb)code is just a print "hello", it runs from CLI, but not from non-cli

hiiamboris

[19:37](#msg5e33307cf6945f41ef452e8c)https://github.com/red/red/issues/3562

Nomarian

[19:49](#msg5e333363159413355841126d)yikes, that breaks unix, since red is a core gnu program

[19:50](#msg5e33336af301780b8350f82c)restricted ed

[19:50](#msg5e333376f301780b8350f833)basically the only program you can run if you run into a kernel panic

hiiamboris

[20:06](#msg5e333763ea9ba00b849a32dd)too bad for unix ☻

## Friday 31st January, 2020

Nomarian

[02:29](#msg5e3390fff6945f41ef47cca6)completely ruined it! I use ed all the time, especially since I can't even quit when I mistakenly use it

greggirwin

[03:18](#msg5e339c9cd9895b17c3bc239d)We completely ruined Unix because of our executable name?

Nomarian

[03:39](#msg5e33a15a58f02e34974f2a84)exagerating, sorry

greggirwin

[04:13](#msg5e33a96540da694c5ef70334):^)

## Saturday 1st February, 2020

redredwine

[02:35](#msg5e34e407dc52c34ace3b7218)I understand that this has been discussed before. When we download the red-064.exe and run it on our machine, it compiles the RED GUI console, and while doing so, it creates some files in the c:\\programdata\\red folder. and then avast blocks it because it says it is infected with win32:malware-gen. I know people are saying it is a false positive and I am reporting it as false positive. however I am very, very curious what is being used that is triggering the virus alarm? can we not use something different as part of the toolchain?

I am just wondering what about giving us the red-gui console.exe from your website. why is there a need to compile something on my machine? I must admit that I don't understand much about your program, but I don't understand why the red project is providing an exe (example red-064.exe) that needs to generate another exe(gui-console) to run on my machine? why not give me directly the gui-console.exe from your site which would have made it simpler. (also wondering if by doing this, it would also resolve the false positive, i.e could the false positive be caused by hte compiling of something that has just been downloaded by some unsigned authority/unrecognized org/project team).

Sorry for the long note and the question above :( I don't use red a lot, just playing with it randomly from time to time. So I am very puzzled about that problem.

hiiamboris

[10:33](#msg5e35540473ddad4acd8702d4)Simply put, console is only an interpreter. It does not include the compiler (written in R2 right now). And we want to be able to compile our scripts

redredwine

[15:34](#msg5e359a9d73ddad4acd87c0ae)is it possible for the red site to provide the red-guiconsole.exe directly from the site, so that the users don't need to compile it on their machine, and thus avoid triggering anti virus engines with the win32:malware-gen ? What I mean is the red site provides 2 separate executables, one is the compiler exe and the other one is the interpreter exe instead of providing one exe which then compiles and generates a second interpreter on our machine..

hiiamboris

[15:55](#msg5e359f85f301780b835d7732)You can download those from https://rebolek.com/builds/index.html

pekr

[16:02](#msg5e35a124433e1d40398cc3d1)That's ot an answer, shoul be provided out of the box imo ...

greggirwin

[19:55](#msg5e35d7baea9ba00b84a6eb71)https://github.com/red/red/wiki/%5BNOTE%5D-Anti-virus-false-positives

We are considering offering both downloads, and making the console the primary.

## Wednesday 4th March, 2020

kaltsoplyn

[12:36](#msg5e5fa0e8376d882250ce6061)Hi all, entirely new to the language and not a programmer per se. Red caught my attention through some comment somewhere, and decided to take a look. I usually do that with toy-projects, so I thought I'd try this not entirely trivial thing:  
These days I'm working on some Julia/Jupyter notebooks, and I wanted to create a GUI "palette", with some fields mirroring the fields of a Julia mutable struct of parameters I use for the calculations, and use the palette to update this struct, say upon pressing an "Update" button. So, I was looking for some way to establish a communication channel between the Red GUI and Julia, but the only means I've found so far is writing-to/reading-from a file or the clipboard. I don't particularly like neither of those paths. Is there another way to exchange messages between the two parties? Could someone throw some general pointers and directions as to how I could go about this task?

9214

[12:58](#msg5e5fa5e14eefc06dcf33ddf0)Hi @kaltsoplyn, there was some work done on Red/Julia interop a while ago, you can start by reading \[this](https://github.com/red/red/wiki/%5BDOC%5D-Combining-Red-and-Julia) wiki page and asking questions in \[`red/julia`](https://gitter.im/red/julia) room.

kaltsoplyn

[13:08](#msg5e5fa84eb873303e277ba574)Hi @9214 , yes I'm aware of the red/julia interop, which means that I found out about an hour ago, but I got the impression that I didn't want to go down that path, mainly because this needs 32-bit Julia (if I'm not mistaken), plus configuration and compiling the red lib for Julia etc., and I can't disrupt my Julia workflow right now. Question is, mainly: can I establish some message-based communication channel to the external world?

9214

[13:12](#msg5e5fa947b873303e277ba81d)@kaltsoplyn you can either use \[libRed](https://doc.red-lang.org/en/libred.html) (Julia should be capable of interfacing with 32-bit libraries, you can use \[this](https://github.com/joa-quim/Red.jl) wrapper) or rely on `call`. Both approaches are mentioned in the wiki page. OTOH I see that the wrapper requires 64-bit Julia.

[13:30](#msg5e5fad5f2e398f46abdca426)@kaltsoplyn anyway, doing FFI is a bit out of the scope of toy-project IMO and won't help you to get familiar with the language. Perhaps you have some other ideas that you want to try with Red?

kaltsoplyn

[13:36](#msg5e5faee3b873303e277bb78b)@9214 thank you for your responses.  
I was put off by this in the Red.jl readme: "WARNING: Since Red System (Alpha release) is currently 32-bit only, this package MUST be run from a Julia 32-bit version.". Was your mention of a "64-bit Julia" a typo?  
Anyway, I see that joa-quim's wrapper is quite thin, I'll see if I can ccall anything in libRed from Julia, but no time now.

9214

[13:39](#msg5e5fafa97fef7f2e899e1e32)@kaltsoplyn you're right, a typo. Give it a try and see how it goes, if nothing works you can ask for help here.

hiiamboris

[14:34](#msg5e5fbc8553fa513e286b8e00)Just a note from my recent experience, if you will take a streaming approach, do \*not* rely on `call`, rather use an input and output file pair.

pierrechtux

[14:36](#msg5e5fbce1ec379e558ea56042)@hiiamboris oops. I use `call` quite extensively... Thanks for the information, I'll pay much attention.

hiiamboris

[14:37](#msg5e5fbd3fb873303e277bdefa)Most of the troubles I summarized here https://github.com/red/red/issues/4241

[14:39](#msg5e5fbd8d2e398f46abdcd849)I'm using shell syntax to specify I/O redirection and Red simple-io functions to read from/write to the files, as nothing else really works

## Thursday 5th March, 2020

Kus3\_gitlab

[03:10](#msg5e606d8a3ca0375cb39f9429)Would it be possible to build a standalone OS using red?  
Or at least a module that enables cross platform startup.

[03:41](#msg5e6074f98e04426dd022d280)(cross platform boot-strap)

Respectech

[16:35](#msg5e612a608e04426dd024f91b)@Kus3\_gitlab A prototype has been started of a Red OS.

pekr

[16:51](#msg5e612e074eefc06dcf383c1e)Is that your experiment, or something of a Red team?

pierrechtux

[16:59](#msg5e612fd47fef7f2e89a27be0)@hiiamboris Oops... Yes, that's most worrying.  
I'll try to test that on GNU/Linux, with the secret hope that it may work better?

[17:00](#msg5e6130442e398f46abe115e7)&gt; Would it be possible to build a standalone OS using red?

Hey! That would be great!

I've been thinking of making a sort of LFS, fully coloured in Red.  
http://www.linuxfromscratch.org/lfs/

I had built an LFS, a long time ago, and it was quite fun.

[17:02](#msg5e6130902e398f46abe11706)&gt; @Kus3\_gitlab A prototype has been started of a Red OS.  
Do you have a URL concerning this project?  
(googling this doesn't help very much...)

9214

[17:03](#msg5e6130fb90a829582408f7e9)@BeardPower can elaborate if he wants to.

Respectech

[17:34](#msg5e613811ec7f8746aab59ba4)@pekr Yes, it is @BeardPower 's project.

BeardPower

[17:36](#msg5e6138a453fa513e286fd348)I started on a PoC last year to get a feeling what is possible with the current state of Red. Nenad added done features like loading descriptor tables etc. which are needed to implement a Kernel etc.

[17:45](#msg5e613acf90a8295824092113)The idea begin my OS is an exoKernel which enables the user to boot into a single application but also run apps from different OSs simultaneously. The design would need 64-bit to be able to leverage it's full potential but 32-bit is sufficient for a PoC. 64-bit is needed because the design will use the full address space as every driver will run in userspace. There is no context-switching involved as the design will utilize the MMU and virtualized IO features everywhere. This is possible because the address space of 48-/64-bit is big enough to hold everything separately, even the blocks of the hard disk.

[17:57](#msg5e613d7d4eefc06dcf38896f)This approach would offer the most performance. Speedups of up to a factor of 10x is possible. It's also tiny in size so we are talking of a few KB.

Respectech

[18:00](#msg5e613e2d8e04426dd0254468)I am looking forward to seeing it!

BeardPower

[18:10](#msg5e614084ec379e558ea9dac4)Me too :-)

pekr

[19:07](#msg5e614ddfcb91b5224f12770a)Sounds really interesting ....

## Friday 6th March, 2020

BeardPower

[12:02](#msg5e623bf1b7705f73b707470d)It takes ideas from this:

[12:04](#msg5e623c445614985c976645d9)https://code.google.com/archive/p/xomb/wikis/WhyAnExokernel.wiki  
https://www.sigops.org/s/conferences/sosp/2011/posters/summaries/sosp11-final39.pdf  
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.467.7532&amp;rep=rep1&amp;type=pdf  
https://docs.google.com/presentation/d/15KAkbwt0Rw7CcogBhSGU51TC\_noQFdmzp4dvw6Y0i3k/edit#slide=id.i0

viayuve

[12:41](#msg5e62450bf59a0a73b666878e)@BeardPower IOMMU=soft?

BeardPower

[12:42](#msg5e624534afdc1e2033d34cd4)@viayuve No, hardware.

[12:43](#msg5e62457ee92458449adfc4a8)Modern CPUs also have a IOMMU.

[12:45](#msg5e6245dce92458449adfc646)A lot of modern devices come with virtualization support so you can address them throug memory addressing instead of port IO.

[12:46](#msg5e62460f4aa9482c9ba471ac)MMIO instead of PMIO.

viayuve

[12:47](#msg5e624669a7e4a928633a655e)in red/systems?

[12:55](#msg5e6248345614985c97666f8e)@BeardPower so kind a like kernel as vm resource allocater to different apps.

[12:58](#msg5e6248faa3203e30da8ebb00)also like minimizing Attack surface area

BeardPower

[14:52](#msg5e62639a17e80330db5052c8)@viayuve Yes.

[14:53](#msg5e6263cc5614985c9766d896)The kernel is only dealing with multiplexing resources in a secure manner.

[14:53](#msg5e6263e1e92458449ae03846)Everything else is don on the user level.

[14:53](#msg5e626405f59a0a73b6670076)E.g. you would be able to boot into a game without running anything else.

rebolek

[14:54](#msg5e62641da3203e30da8f1c82)just like Amiga :-)

BeardPower

[14:54](#msg5e6264314599eb28644ba2a4)Exactly.

rebolek

[14:56](#msg5e62649317e80330db5056fb)But you still need drivers for your HW anyway. On Amiga it was easy to bang HW directly, because all Amigas were same. Now you have different video cards etc.

BeardPower

[14:56](#msg5e6264a5f953aa4499ce54c2)You could run Windows, macOS, Linux apps etc. simultaneously without using any of the OSs because the OS APIs would be implemented on the user side.

[14:57](#msg5e6264e6f59a0a73b66705bd)Yes, hardware support would be the main issue but can be resolved in a way Apple does it: only support specific hardware.

[14:58](#msg5e62650bf953aa4499ce5765)The exoKernel allows you to bang on hardware directly as well.

rebolek

[14:59](#msg5e62654a5614985c9766de06)I think this is the main problem with niche OSs. You can't install it on a spare machine because your wifi/video/... is not supported. Apple can afford it, as they're making their own HW.

BeardPower

[14:59](#msg5e6265665614985c9766de41)Yes, but we could do the same.

rebolek

[15:00](#msg5e626574e92458449ae04072)Sell our own HW?

BeardPower

[15:00](#msg5e6265774599eb28644ba768)Even Apple is using off-the-shelf hardware.

[15:00](#msg5e62657f4599eb28644ba788)@rebolek Yes.

rebolek

[15:00](#msg5e6265a1a3203e30da8f21e7)that's pretty bold plan :)

BeardPower

[15:01](#msg5e6265afe95aaa5c96a2f86f)It will be a new "Amiga" but with state of the art hardware.

[15:01](#msg5e6265dcafdc1e2033d3c924)@rebolek It is but can be done. I'm looking forward to get a custom made Mill CPU.

[15:02](#msg5e62660656bc2a78036bc770)With hardware support for Red specific needs.

rebolek

[15:02](#msg5e626607afdc1e2033d3ca4b)I knew where this was going ;-D

BeardPower

[15:02](#msg5e62660ca7e4a928633ae39e)Hehe.

hiiamboris

[15:03](#msg5e62663d56bc2a78036bc837):D :D

BeardPower

[15:03](#msg5e62664c5614985c9766e215)Maybe the Parallela guy can chime in and design some graphic accelerator.

pekr

[15:04](#msg5e6266705614985c9766e246)RISC-V is the new mantra .... well, except the revolution did not happen, yet ....

[15:05](#msg5e6266b0e92458449ae04616)But I remember, in the past, talking to Doc, his original plan - start the project, involve Carl, buy RT, resurrect Amiga, or something like that :-)

BeardPower

[15:05](#msg5e6266d0afdc1e2033d3cce8)Forget RISC-V. It still has the same issue with Meltdown etc. is nothing else but a new iteration of the same old ideas. Mill is a new architecture without any of those issues. It is designed for Micro- and exoKernels.

[15:06](#msg5e6266e1afdc1e2033d3cd2a)&gt; RISC-V is the new mantra .... well, except the revolution did not happen, yet ....

Hehe.

[15:06](#msg5e6266f456bc2a78036bc92d)Yes, that was a similar idea.

[15:08](#msg5e6267804aa9482c9ba4f131)If we can get a package out, that runs Red on dedicated new hardware architecture, that would be huge.

[15:09](#msg5e6267ade95aaa5c96a3007b)Imagine booting directly into a Red IDE within 3 seconds.

[15:09](#msg5e6267c063d3f3203463616b)Like on the C64.

[15:11](#msg5e62681e4599eb28644bae6d)That's the idea behind it. I talked to the Xomb developers some time ago and they were interested in the idea. They used D for their Kernel but it was a bad idea, so they would not use it again.

[15:15](#msg5e6268f4b7705f73b707e52b)The Red/ Kernel is currently able to boot and shows some info on the memory and CPU features. I needed to strip the red-runtime from Red/System and as the Red compiler cannot output object files, I have to do some linker-magic myself. Fixing code entry points and the like.

[15:16](#msg5e62693dc366b32c9ae0da12)Later on, there will be a Red runtime for Red/OS so you would be able to compile Red and Red/System code for Red/OS.

[15:16](#msg5e62695bb7705f73b707e648)But it's a lot of work, not so much of rocket-science but tedious work.

[15:19](#msg5e626a01b7705f73b707e919)I can post some little video of the Kernel booting with Qemu once I fixed some other stuff. I'm using Haiku for the linking magic which works out very nicely.

[15:20](#msg5e626a4656bc2a78036bd79c)It may use Blend2D for it's rendering backend.

pierrechtux

[20:18](#msg5e62b02bc366b32c9ae1cdba)@BeardPower H O L Y C O W ! !  
That seems like a \*very ambitious* project! Excellent!

Respectech

[21:22](#msg5e62bf2fa3203e30da9042e6)I'd like to see that.

rebolek

[22:24](#msg5e62cd89b7705f73b709366f)We all want to.

## Saturday 7th March, 2020

viayuve

[07:04](#msg5e634794f953aa4499d0a75a)@BeardPower where did you ordered custom mill cpu?

pekr

[17:10](#msg5e63d57bd17593652b6bd3f4)@BeardPower "Forget RISC-V. It still has the same issue with Meltdown etc. is nothing else but a new iteration of the same old ideas. Mill is a new architecture without any of those issues. It is designed for Micro- and exoKernels." .... I have just looked into Mill, and it has almost zero traction. Wikipedia article is from 2014, webpage last news something around 2017.

In comparison, have read just about our local Czech (Brno) company called Codasip. RISC-V seems to be a multi-billion business and there is strong willingness to create a competition to ARM, to avoid Huawei like cases. We are talking open hardware here (that's why I like Beagle Bone boards).

The consortium seems to have cca 420 companies and there is expected business of cca 60 billions of cpu/cores till the 2025. Does not sound like "forget RISC-V" at all ....

BeardPower

[17:12](#msg5e63d5e9a2ccef3232db0a52)There is already some beef inside the RISC-V foundation etc.

pekr

[17:13](#msg5e63d638d17593652b6bd717)We will see ... we should base our decision about realistic expectations, though :-)

BeardPower

[17:14](#msg5e63d668d17593652b6bd75a)I haven't seen anything from RISC-V yet, that can blow current Intel and AMD CPUs out of the water. RISC-V is not the only open hardware. There is OpenPower, MIPS, SPARC etc.

rebolek

[17:15](#msg5e63d6abd17593652b6bd802)When I was still at CZ.NIC, Codasip was in a room next to ours.

BeardPower

[17:15](#msg5e63d6ae8e42396957737306)Yes. Mill is currently silent because they are in a funding round for their FPGA. If you can get them 10 million USD they would be able to release it soon.

pekr

[17:15](#msg5e63d6b6e203784a55921cb0)Interesting discussion here - some Mill person in there - https://www.reddit.com/r/hardware/comments/ao2d30/mill\_cpu\_vs\_itanium/

BeardPower

[17:17](#msg5e63d71547b424792531336a)Mill is Itanium done right. If Intel would have spent a little more time and money on it and the inventor hadn't passed off, Itanium would be just the Mill.

[17:21](#msg5e63d804cc10be22a0704cf9)Current CPUs are waisting a lot of Cycles on branch predition and stuff.

[17:22](#msg5e63d838145f4d695627fc70)That hardware is also expensive, has design flaws and security issues.

9214

[17:23](#msg5e63d8ae95b8ff0bbf9ec197)@BeardPower how many non-believers have you converted so far?

pekr

[17:57](#msg5e63e072145f4d69562812ec)@9214 Do you already belong into the camp of converted? :-)

[18:05](#msg5e63e287cc10be22a07067f8)For me, the problem with some "ideal" CPU is, if it really does not deliver. Do you guys remember Transmeta? Even Linus Torwalds joined them IIRC. And the Mill is in "development" for something like 16 years ... whatever the guys are doing. I wish every project well, but I feel almost like being an IT veteran being cured by multiple potential resurrections of an Amiga, so I will calmly wait for the real life results :-)

greggirwin

[18:09](#msg5e63e35b02dbe022a1719b45)Please move CPU talk to chit-chat.

## Sunday 8th March, 2020

BeardPower

[11:12](#msg5e64d30ee203784a55942368)&gt; @BeardPower how many non-believers have you converted so far?

Not as many as I hoped for but working on it.

[11:12](#msg5e64d328145f4d695629f695)&gt; Please move CPU talk to chit-chat.

Sure.

## Saturday 14th March, 2020

cloutiy

[15:54](#msg5e6cfe4917d3e742347c31df)I believe. Amen.

## Friday 27th March, 2020

Senenmut

[20:42](#msg5e7e6532d71a6e7e8d7a1370)its not Amen. its Amun-Ra.

## Tuesday 31st March, 2020

cloutiy

[12:36](#msg5e83393f2556e77c713e8725)@Senenmut :)

## Thursday 2nd April, 2020

fedorovsergey1981

[14:35](#msg5e85f81901c85847b2cf62da)Good day.Please tell me how can convert your token on ddex?Thanks

9214

[15:00](#msg5e85fdff01c85847b2cf7efa)@fedorovsergey1981 please ask all token-related questions in a dedicated \[Telegram channel](https://t.me/redofficial).

fedorovsergey1981

[15:19](#msg5e8602876564121e659e6fe3)ok.thanks

## Friday 3th April, 2020

sq16

[10:58](#msg5e8716bc5ad4dd068674ecec)MalwareBytes flags the site "static.red-lang.org" as dangerous (Trojan Horse)

## Saturday 4th April, 2020

endo64

[18:24](#msg5e88d0d56626ab6178a76f54)@sq16 Have a look https://github.com/red/red/wiki/%5BNOTE%5D-Anti-virus-false-positives for some info on that.

## Tuesday 14th April, 2020

redredwine

[02:52](#msg5e952556e7ca460b065b5d87)quick question - does Red have encryption like in Rebol 'blowfish, AES or scramble like encloak?

greggirwin

[03:14](#msg5e952aa86823cb38accd4466)Not yet.

dsunanda

[06:25](#msg5e9557739316f34b8d9e6be7)@redredwine If you are trying to read some encrypted data in Red you could delegate that task to Rebol while writing the rest of the code in Red - eg this Red code that CALLs Rebol:

```
call/wait {rebview.exe --do "write clipboard:// mold encloak {demo-data} {demo-key}  quit"}
print read-clipboard
```

About half the recent programs I've written do something like this - Red for the better GUI; Rebol as the stunt double when the going gets hard.

## Sunday 19th April, 2020

redredwine

[13:24](#msg5e9c50ff2ff88975b4314c94)thanks @greggirwin for the confirmation , thanks @dsunanda for your advice. I have written a small program completely in rebol already and it is using encloak and encryption features from rebol, and wanted to rewrite it in red. so it will not help writing in Red and calling Rebol as there is no benefit. i will just use the rebol version for now and wait for red. When is the next stable release for Red?

greggirwin

[20:27](#msg5e9cb444d240da243385d61e)We've stopped pre-announcing releases for the time being.

## Monday 20th April, 2020

dsunanda

[13:42](#msg5e9da6a9d65bcf75b5d8f69c)@redredwine You do get a nicer GUI with Red. And converting code is a good way to learn the minor differences :)

## Monday 27th April, 2020

codenoid

[03:56](#msg5ea657d3e5ed621d4de2001a)folks, just stay home

[03:56](#msg5ea657e61e3d5e206347dcdb)don't go nowhere

## Tuesday 28th April, 2020

PrietoM

[21:02](#msg5ea899cf97338850a2d56985)Exploring Red and I do have a few questions.  
1\) Where can I find a list of the Libraries Red includes or that can be added? For example Database, HTTP, etc. I was looking around your website and I cannot find a list.  
2\) It says in the Roadmap that Android support is already included. Is there any documentation that I can take a look for Android support?

Amazing language BTW. (I am a Node.js/ Javascript programmer)  
Thanks!!

dander

[21:49](#msg5ea8a4e80b23797ec04cf472)Hi @PrietoM. Welcome! We don't yet have a package repository, and official module support is on the roadmap. That being said, Red has an incredible amount of functionality built-in (for example HTTP support). There are also lots of samples and utilities collected on \[this wiki page](https://github.com/red/red/wiki/Examples)

PrietoM

[21:55](#msg5ea8a6650b23797ec04cf8d0)Thanks for your response @dander , so is there a way to look at the different built in modules? Maybe through the REPL?

dander

[22:01](#msg5ea8a7b1adb0ec5c2bd14dd9)@PrietoM have you played with the `help` function much? It will give you basic information about lots of things. You can also use it to search for functions which mention certain things in their spec. Like `? "series"` will show things that operate on series. Otherwise, I would probably look at the \[official docs](https://doc.red-lang.org/)

## Wednesday 29th April, 2020

greggirwin

[03:27](#msg5ea8f43a22f9c45c2a59de48)You can also find example bindings (someone is playing with the SQLite binding right now) at https://github.com/red/code

PrietoM

[16:47](#msg5ea9af8ca9de3d01b1d98663)Actually I found this \[Link](http://helpin.red/HTTP.html ) which kind of gives me an idea of the different modules.

## Saturday 2nd May, 2020

ralfwenske

[05:53](#msg5ead0af13d58de7a38ed0e8b)When exploring Red we mostly use print and the console shows our results. When you have experienced other languages it sometimes may seem a long way to show your processed data in Red’s GUI. I have created for myself a GUI generator that will allow me to focus on my data processing rather then spending too much time in details of VID.  
Doing this leads to detecting more and more of the elegance of the language and thus is very enjoyable: Also this might be a showcase of what can be done with (Alpha) software being developed with such meticulous attention to detail:

If you are interested start Red in an empty folder and type:  
`do load https://raw.githubusercontent.com/ralfwenske/window/master/test-1.red`

you will end up with this view showing how it was created:  
!\[alt](https://raw.githubusercontent.com/ralfwenske/window/master/images/window-demo.jpg)

[06:25](#msg5ead125d31a6d25d7ca3f580)For your safety (of course) you better go to \[mygithub page](http://github.com/ralfwenske/window) first and verify that it can’t do any harm… :)

toomasv

[06:29](#msg5ead13489f0c955d7d9c8b67)@ralfwenske Congratulations!  
Although, there is too much "stringy code" generation for my taste :)  
On quick look I noticed that you have used `to-pair reduce [() ]` [**in %window.red. I think it would be better to use `as-pair`**]()**` ` [(besides, parens are not needed if you reduce).**  
**Also, shouldn't areas (`SOURCE` and `GENERATED VID`) be editable? On Windows they are not.]()**

**[ralfwenske]()**

**[]()**

**[]()[10:37](#msg5ead4d6831a6d25d7ca46bad)Thanks @toomasv I learn slowly - and I keep forgetting… I recently became aware of the `help "pair"` functionality where (in hindsight) I might have detected `as-pair`. I agree the code probably would be elegant and half the size if you did it. It’s a learning process: first get it to work as intended and then improve by getting to know the workings plus the ~450 helpful things you get to see when you type `what`. And also asking in red/help 'what exactly triggers `react` ' in the help forum where friendly souls give great insights. :)**  
**Btw. I had detected and applied how to make an area read-only and so it was intentional. (Even though it doesn’t seem to block entry on macOS yet it does on GTK). As you can grab the generated code that runs it as is and can use that as starting point, it would be easy to remove the on-key event that blocks it.**  
**As I got a lot of ideas how things can be done from other’s working code samples I thought to also show what can be done with not too many lines of code. Which might be helpful to other newcomers once they look a bit closer into the workings of the code. Certainly work left for me to achieve good notes regarding the \[Style Guide](https://doc.red-lang.org/en/style-guide.html) :)**

**[10:47](#msg5ead4fa79f0c955d7d9d0725)I just now realise what you meant with 'stringy code' . I linked that erroneously to my feeling that the overall code can be improved.**  
**But I guess you meant those panels coded as strings - yes I had thought about that already and I am hopeful that this code can probably also sit in a function as regular code and can be easily connected. I will work on it…**  
**When I generate the code, it -being part of the view- needs to be molded and that messes the indentations up a bit. As I don’t know a code formatter I had opted for the 'stringy' version. And I needed some functioning faces to demonstrate the workings.**

**hiiamboris**

**[12:00](#msg5ead60d87a24ff01b0f8fbd2)@ralfwenske would this formatter work for you?**  
**`prettify: function [ "Reformat CODE with new-lines to look readable" code [block!] "Modified in place, deeply" ][ new-line/all code no ;-- start flat until [ new-line code yes ;-- add newline before each independent expression tail? code: preprocessor/fetch-next code ] attempt [ ;-- in case it recurses into itself ;) parse head code [any [ thru [p: block! | paren!] ( new-line p no ;-- disable new-line before block start prettify as block! p/1 ;-- prettify the inner block/paren ) ]] ] head code ]`**

**[12:25](#msg5ead66c8d898fe7a375f9cd7)I'll upload a more advanced version with some limited function spec support later**

**toomasv**

**[13:20](#msg5ead73b80b23797ec059eb6d)@ralfwenske I agree, that to get it working first, and then refine it from there on, is a good path. :+1:**

**hiiamboris**

**[16:17](#msg5ead9d255cd4fe50a3e62932)&gt; I'll upload a more advanced version with some limited function spec support later**

**https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/prettify.red there you go**

**greggirwin**

**[20:52](#msg5eaddd9b0b23797ec05ae357)Great work @ralfwenske. Thanks for sharing. We're all on the learning path. :^)**

**[20:54](#msg5eadde097a24ff01b0fa10e2)Nice prettifier @hiiamboris ! If gitlab had stars, I'd give you one.**

****Sunday 3th May, 2020****

**ralfwenske**

**[04:10](#msg5eae444c97338850a2e3cc91)Thank you very much @hiiamboris . I will explore the formatter and also look forward to digging in to your 'mezzanines'. :thumbsup:**

****Sunday 10th May, 2020****

**seddin**

**[11:06](#msg5eb7e03ad898fe7a3779a87c)hello everyone**

**[11:07](#msg5eb7e06314b48f0698bfb3e7)how would code the drag a file into a window or on the finary load it, and image or text**

**[11:11](#msg5eb7e1705cd4fe50a3ff9b4b)i found this**

**[11:11](#msg5eb7e171d898fe7a3779ad16)http://rebol2.blogspot.com/2014/02/drag-and-drop-on-window.html**

**[11:11](#msg5eb7e17aadb0ec5c2bf7f8a1)let me see if i can code a red-lang version**

**[12:00](#msg5eb7ece07a24ff01b01337bf)ill try to see if i can pass it by argument**

**hiiamboris**

**[12:14](#msg5eb7f0127975db7ebff75e20)On Windows you can currently select files in Explorer, press Ctrl+C, then from Red call `read-clipboard` to get that list.**

**[12:14](#msg5eb7f043d898fe7a3779d3de)Drag&amp;drop uses similar or even the same structure, but not implemented yet, so you're on your own right now, writing R/S code to handle that, maybe even hacking View a bit.**

**seddin**

**[12:15](#msg5eb7f04cf0377f16317bf00f)ok thanks**

**[12:15](#msg5eb7f051347bd6163068d107)one small question**

**[12:15](#msg5eb7f05cadb0ec5c2bf81fe0)when i do this**

**[12:15](#msg5eb7f05da9de3d01b1fd6830)Red \[ title: "Image" needs: 'View 'System ]**

**[12:15](#msg5eb7f06a3d58de7a38080c25)it gives me an error**

**[12:15](#msg5eb7f06f7a24ff01b01340d9)i dont have access to system/args-count**

**hiiamboris**

**[12:16](#msg5eb7f085f0377f16317bf071)you don't need to specify 'System there**

**seddin**

**[12:16](#msg5eb7f090d898fe7a3779d463)i tried Red/System**

**hiiamboris**

**[12:16](#msg5eb7f09331a6d25d7cbf076a)just wrap R/S code in a #system directive**

**seddin**

**[12:16](#msg5eb7f0a6b6dd230697b9e3b4)ok i have seen how to do yet**

**[12:16](#msg5eb7f0aaf0377f16317bf0f4)i havent\***

**[12:17](#msg5eb7f0bc3d58de7a38080df2)is there an example somewhere?**

**hiiamboris**

**[12:17](#msg5eb7f0c23d58de7a38080e04)https://static.red-lang.org/red-system-specs.html#section-16.8 there's an example here of a Red script with R/S code inside**

**seddin**

**[12:17](#msg5eb7f0e47a24ff01b013426c)ok thanks**

**[12:17](#msg5eb7f0ed347bd6163068d210)are you the dev of red lang?**

**hiiamboris**

**[12:18](#msg5eb7f113f0377f16317bf1a4)Yes, one of**

**[12:18](#msg5eb7f11b14b48f0698bfdff8)https://gitlab.com/hiiamboris/red-alpha here's a small example too**

**seddin**

**[12:18](#msg5eb7f13397338850a2fc3908)thank you i will check it now**

**[12:34](#msg5eb7f4e397338850a2fc41af)img-place/image: load "./cena.PNG"**

**[12:34](#msg5eb7f4f0f0377f16317bfa98)i cant load an image directly?**

**hiiamboris**

**[12:38](#msg5eb7f5dd3d58de7a38081926)You mean, embed it into the code?**

**seddin**

**[12:39](#msg5eb7f61ef0377f16317bfd26)kinda**

**[12:40](#msg5eb7f62cd898fe7a3779e009)i have an image on my view**

**[12:40](#msg5eb7f6355cd4fe50a3ffd111)and i want to load one by default**

**hiiamboris**

**[12:48](#msg5eb7f82114b48f0698bfed89)You can do this once: `save %image.red compose [Red [] (read/binary %./cena.png)]` to convert the image into Red format**  
**Then #include the saved image into your script:**  
**`cena: #include %image.red cena: load/as cena 'png`**  
**`cena` will hold the image, and it will be contained inside your exe file when you compile it**

**seddin**

**[12:52](#msg5eb7f902347bd6163068e219)thanks**

**[12:52](#msg5eb7f9099f0c955d7db76262)nice**

**[13:05](#msg5eb7fc0dd898fe7a3779edfc)is there an wxample where you manage args passed to an executable ?**

**hiiamboris**

**[13:13](#msg5eb7fe11b6dd230697ba011b)Sure. https://gitlab.com/hiiamboris/red-cli/**

**[13:14](#msg5eb7fe215cd4fe50a3ffe2ca)Link to examples is in the first string of Readme ;)**

**seddin**

**[13:21](#msg5eb7fff5a9de3d01b1fd8a65)thanks**

**ne1uno**

**[13:33](#msg5eb802ab14b48f0698c00670)@seddin you can get filename\[s] with a shortcut in SendTo on commandline**

**[13:34](#msg5eb802e27975db7ebff78a2a)not sure how in linux but very easy in windows**

**hiiamboris**

**[13:34](#msg5eb802f514b48f0698c00704)Good idea too ☻**

**seddin**

**[16:51](#msg5eb83120b6dd230697ba7bed)with SendTo**

**[16:51](#msg5eb83123d898fe7a377a719b)hmm**

**[17:23](#msg5eb838827a24ff01b013ea1d)why cant i show an image with just its path ?**

**[17:25](#msg5eb838f60b23797ec074d965)**  
**`Red [] img: null #system [ args: system/args-list args: args + 1 img: args/item lf ] view [ image 300x300 img ]`**

**hiiamboris**

**[17:33](#msg5eb83aef7a24ff01b013eec2)I can't guess, what is this code supposed to do? Anyway, you should not mix R/S with Red, they live in different namespaces, and if you want to write code that connects them, you should first get yourself familiar a bit with both languages.**

**[17:37](#msg5eb83bd097338850a2fcefc9)R/S: https://static.red-lang.org/red-system-specs.html**  
**Red: https://github.com/meijeru/red.specs-public**  
**Wiki: https://github.com/red/red/wiki**

**[17:41](#msg5eb83cc7b6dd230697ba990e)At least try to look up every piece of the examples I gave you and understand what each thing in there is doing and why it's written like that ;)**

**[17:42](#msg5eb83d0531a6d25d7cbfb937)Like, what is a Red value? What is a routine? What coding practices are valid in Red and in R/S?**

**seddin**

**[17:43](#msg5eb83d427975db7ebff8162d)ok thank you very much**

**hiiamboris**

**[17:43](#msg5eb83d577a24ff01b013f4d6)You're welcome**

**seddin**

**[17:44](#msg5eb83d685cd4fe50a3007cc3)what i was trying to code is a simple img viewer, where you could drag an image to the executable and it owuld show it**

**hiiamboris**

**[17:46](#msg5eb83e1022f9c45c2a80be7e)`red-cli` library provides to you the full power of program argument handling, you don't need #system code for that. Whether or not you'll be able to drag into it, depends if such dragging operation starts your program with the image file as an argument. If so, you don't have to learn R/S or have any idea of how your OS works.**

**seddin**

**[17:51](#msg5eb83f0e9f0c955d7db80a45)nice**

**[17:51](#msg5eb83f350b23797ec074e6dd)i will have to check red-cli more thoroughly**

**hiiamboris**

**[17:53](#msg5eb83fa1347bd61630698b46)For your use case, at least on the first stage, you might not even need `red-cli`. Just work with `system/options/args` directly**

**[17:54](#msg5eb83fe7d898fe7a377a94c0)I suggest first and foremost learn how to use console and debug your code (`?`, `??`, `probe`, `help` commands)**

**[17:55](#msg5eb8400e31a6d25d7cbfc040)A lot of problems you will be able to solve yourself**

**seddin**

**[18:16](#msg5eb8450214b48f0698c0a453)thank you again, i will do what you said**

**[18:16](#msg5eb8451a22f9c45c2a80cd9c)i hope you all stay safe and healthy, see you next weekend :)**

**greggirwin**

**[18:21](#msg5eb8462fb6dd230697baac45)This is a good reminder about https://github.com/red/red/pull/2838**

****Monday 11st May, 2020****

**planetsizecpu**

**[15:52](#msg5eb974b97312422a87db5a1b)Welcome @seddin**

****Wednesday 13th May, 2020****

**ALANVF**

**[00:48](#msg5ebb43c42baa191854666c71)Just joined here**

**[00:49](#msg5ebb43fe2cf0da0ad9fbdb52)posted some stuff in red/red before realizing that this channel existed :sweat\_smile:**

**greggirwin**

**[02:27](#msg5ebb5afa3c51a11913f78378)Welcome! Will check out your other posts.**

**ALANVF**

**[02:30](#msg5ebb5bac852efc0adad53cfa)thanks!**

**planetsizecpu**

**[09:20](#msg5ebbbbc87c04b92f535e3899)Welcome @ALANVF**

****Thursday 14th May, 2020****

**cloutiy**

**[20:23](#msg5ebda8cd0fe1ce34f2e68626)Is there any reason why a comma is invalid char for a word, while a period is? Would be nice to be able to do \`load {By all means, do it.} All other punctuation are ok, so why not the comma? Just curious. To my knowledge it doesn't play any lexical role in the language.**

**greggirwin**

**[20:36](#msg5ebdabb2aac441316a7b14ca)"All other punctuation" isn't quite correct. Semicolons and colons are also punctuation, as are parens and brackets.**

**[20:38](#msg5ebdac2e19af2534f3b21838)Being able to `load` arbitrary data comes up, and did for Rebol as well. Various approaches were suggested, and John Niclasen's World lang created a special type for it. But that's not `load`'s job.**

**hiiamboris**

**[20:40](#msg5ebdacc2519b852e93f130fa)@cloutiy maybe it was reserved for future lexical forms? ;)**

**greggirwin**

**[20:40](#msg5ebdacd228b53131490718b1)Red's answers are `system/lexer/pre-load` and `load/trap`, though `/trap` needs to be updated in fast-lexer it seems.**

**[20:41](#msg5ebdaced28b53131490718ce)**  
**`>> load/trap {By all means, do it.} == [[By all means] ", do it." make error! [ code: 200 type: 'syntax id: 'invalid arg1: 'value arg2: "...`**

**meijeru**

**[21:20](#msg5ebdb6036675d830b1a79a54)Not to forget that a comma is allowed in numbers, in place of the dot as decimal point!**

**greggirwin**

**[21:21](#msg5ebdb673863019312a5d9e16)Yes, though even Rebol catches cases where it might be ambiguous, e.g., `1,a`.**

**meijeru**

**[21:22](#msg5ebdb682f3ce603074bc0294)The different use of comma and dot (decimal point vs. thousands separator) in various parts of the world is the reason that visual separators for digit groups in Red are `'`, right?**

**greggirwin**

**[21:23](#msg5ebdb6e328b5313149073499)Yes. Thank you Switzerland! :^)**

****Thursday 21st May, 2020****

**PierreChTux\_twitter**

**[20:45](#msg5ec6e85d89941d051a14d106)&gt; Not to forget that a comma is allowed in numbers, in place of the dot as decimal point!**

**Hey! I had never noticed that! That's absolutely great! The result is displayed with a decimal point, though.**  
**`>> a: 1,5 == 1.5 >> print a 1.5`**

****Friday 22nd May, 2020****

**endo64**

**[00:44](#msg5ec720804c9b0f060d170645)That is because some countries use coma for decimal point, Red supports both dot and coma.**

**greggirwin**

**[03:20](#msg5ec7451b27513a72fba5df12)@PierreChTux\_twitter Red normalizes the value, just as it does with dates.**

**planetsizecpu**

**[06:58](#msg5ec77812778fad0b131bb6b6)Here in my country we use comma as decimal point, and point as thousands separator, as 1.234.567,89**  
**So, many years ago, when I used COBOL there was a mandatory clause for programmers:**

**`ENVIRONMENT DIVISION. CONFIGURATION SECTION. SPECIAL-NAMES. DECIMAL-POINT IS COMMA.`**

**📜so parchments haha!**

**endo64**

**[07:37](#msg5ec781412c49c45f5a9546c5)1.234.567,89 format is same here in Turkey.**

**rebolek**

**[09:50](#msg5ec7a068549761730b4e507b)In Czechia we use comma as decimal separator and spaces as thousands separator. In old books you can find dot, but now mostly spaces are used.**

**endo64**

**[11:40](#msg5ec7ba497da67d06fac4befa)Using space is interesting 🙄**

**pekr**

**[11:58](#msg5ec7be673ffa6106f1c9061d)using comma as a separator is the worst thing ever :-( It almost looks like an error. A typographics nightmare. Visually the most pleasing is spaces and dot imo.**

**ALANVF**

**[17:43](#msg5ec80f2c4412600ccd5fadf5)I would honestly prefer being allowed to use `,` in place of `'` in numeric literals rather than in place of `.`**

**pekr**

**[17:51](#msg5ec811252280c80cbfc0a124)Comma as a thousands separator? That has to look weird, no? `1,234,341.12`?**

**ALANVF**

**[17:52](#msg5ec81141b101510b200ec19f)that's the standard in here in the US**

**pekr**

**[17:52](#msg5ec8116127513a72fba7d723)Comma should be forbidden in all national standards, period :-)**

**dander**

**[20:41](#msg5ec83908778fad0b131daadf)Maybe everyone should switch to Roman numerals 😈**

**greggirwin**

**[20:43](#msg5ec839752280c80cbfc10ad4)Old ideas do sometimes come back as new. :^)**

**[20:46](#msg5ec83a30ff7a920a72066e05)Fixing the world takes time. So we support some standards now on input, but normalize. Spaces may look nice, per Pekr's comment, but how do you lex them? e.g., what does this mean: `[123 456 789 .012]` Localized formatting for output can do it though.**

**pekr**

**[21:25](#msg5ec84341f0b8a2053aa95e2a) My take is, that `123'456.789`is just OK and I would left-off comma as a decimal separator. IMO it was na unnecessary addition and I am not sure it belongs to the language itself ....**

**[21:26](#msg5ec8437c9da05a060a2579b3)The reason is, that there is always more to the locale, than it might look on the surface. Like the start of the week, translation, currencies, translation of the months, days, etc.**

**greggirwin**

**[21:31](#msg5ec844c927513a72fba857ca)Yes. Since `.` is normal for me, I'm OK with losing `,` eventually, but we may never get the world to agree. By normalizing, we'll shift things slowly though.**

**theSherwood**

**[22:43](#msg5ec855954412600ccd605cd1)Hi folks. I'm new here. What I've seen of red has been really intriguing.**

**ALANVF**

**[22:44](#msg5ec855e2f0b8a2053aa9853d)awesome :thumbsup:**

**[22:45](#msg5ec8561a3ffa6106f1ca9810)hi there**

**[22:46](#msg5ec8565a2280c80cbfc1505b)Red is definitely an interesting language, so I think you've made a good choice choice coming here!**

**greggirwin**

**[22:52](#msg5ec857c6225dc25f549d31eb)Welcome @theSherwood. What intrigues you most about Red, which drew you here?**

**theSherwood**

**[23:04](#msg5ec85a75a91f120a6cb8aabc)Thanks! I'm really loving the idea of a full stack language. Red also seems terse but readable, and the mix of imperative, functional, and reactive approaches really appeals to me.**

**[23:42](#msg5ec86356225dc25f549d45bd)Regarding the idea of a full stack PL: how does the network fit into this notion.**

****Saturday 23th May, 2020****

**greggirwin**

**[00:58](#msg5ec8753c778fad0b131e324a)There will be layers. Basic networking will be easy, much like Rebol2, and as you do today with basic I/O where you can read and write HTTP:// calls directly. But there will also be an async interface, a concurrency system, and possibly more built on top of that.**

**ALANVF**

**[01:00](#msg5ec875b3a91f120a6cb8e2ce)@greggirwin do you know if there's any specs/docs for that stuff yet?**

**[01:00](#msg5ec875b989941d051a1875a8)sounds interesting**

**theSherwood**

**[01:46](#msg5ec880852c49c45f5a97b3b2)I too would be interested in finding out more about this.**

**greggirwin**

**[02:00](#msg5ec883cdf0b8a2053aa9d8cc)A lot of the underlying networking pieces work today, but the final async and concurrency interfaces are in the design stage.**

**ALANVF**

**[02:08](#msg5ec885af2c49c45f5a97bc90)oof...**

**[02:08](#msg5ec885bb2c49c45f5a97bc99)can't wait to see what comes out of it though**

**theSherwood**

**[02:36](#msg5ec88c46549761730b509ad9)I noticed that there is a garbage collector for red/system? Does that mean that manually managing memory isn't possible?**

**ALANVF**

**[02:39](#msg5ec88cf0b101510b200fda10)there probably is if you're interacting with stuff from C, but I'm not completely sure**

**theSherwood**

**[02:45](#msg5ec88e632c49c45f5a97cb3d)Okay. Interesting. Related is the question of performance. I haven't seen much about performance on the website.**

**[03:11](#msg5ec89467ff7a920a72072026)Another question I have is about security. Is there any kind of sandboxing possible in red?**

**greggirwin**

**[08:41](#msg5ec8e1a57da67d06fac75193)The GC only applies to Red. In Red/System you have to manage memory yourself.**

**[08:42](#msg5ec8e1fba91f120a6cb99fb9)There is no sandboxing in Red yet, though we will likely have something akin to the `secure` dialect. That doesn't rule out capability based systems in the future.**

**[08:44](#msg5ec8e287a91f120a6cb9a09b)Do you have specific performance questions? We tend not to focus on that because benchmarks are not always instructive. Red/System is ~4x slower than C, as we have no optimizer. Red's performance is on par with other high level languages, but you have more control over some aspects, and using `routine` or `#system` elements to drop into Red/System make leveraging Red/System easier than you might think.**

**planetsizecpu**

**[10:32](#msg5ec8fbdaf0b8a2053aaacd0f)We cannot force whole countrys to write numbers and decimals in some manner, better allow it to config their way at system/locale 👨‍👨‍👧‍👧**

**PierreChTux\_twitter**

**[10:37](#msg5ec8fcf77da67d06fac78dde)&gt; Comma should be forbidden in all national standards, period :-)**  
**I will vote for you as World Dictator. That's the way to go.**

**Personally, I only write numbers the official way when they are within a text (i.e. 19 876 765 656,33); otherwise, I always use the C convention, in programs, in spreadsheets, etc.**

**[10:43](#msg5ec8fe599da05a060a26e125)&gt; A lot of the underlying networking pieces work today, but the final async and concurrency interfaces are in the design stage.**

**Just a dumb question: as most of these features already exist and work very well since a long time within Rebol2, wouldn't there be some way to -temporarily- call these features from Red to an underlying Rebol2 thing, while those features are being implemented within Red?**

**That would definitely help to drag some people on board and to migrate bunches of existing software pieces which run smoothly now on Rebol2, but which cannot run on Red.**

**Stupid idea probably, but well...**

**[10:56](#msg5ec901684412600ccd61a144)&gt; We cannot force whole countrys to write numbers and decimals in some manner, better allow it to config their way at system/locale 👨‍👨‍👧‍👧**

**I will also vote for you as a World Democratic Dictator.**

**pekr**

**[12:21](#msg5ec9152cf0b8a2053aab0608)There is no world dictatorship related to such a stupid thing, as a comma separator. But those things are not well thought off. Have you ever faced a company with a multitude of natione offices packages? I do remember fixing CSV files in the past, because of comma vs dot problem. Don't get me even started on a spredsheet and its localised function names.**

**[12:21](#msg5ec915594c9b0f060d1b673a)In the past, I was strong proponent of localising Rebol words via the aliases, but I was not suggested to do so. Nowadays I understand that the advice was there for a good.**

**[12:22](#msg5ec9159e3ffa6106f1cc0a8e)Hence my take is, that whatver localisation options are there, could be abstracted upon the language level and not supported by the lexer. Because if you really insist, then I will protest, that for the money datatype, I don't want a CZK, but Kč being supported instead ....**

**PierreChTux\_twitter**

**[12:28](#msg5ec916ed2c49c45f5a98dbfc)&gt; There is no world dictatorship related to such a stupid thing, as a comma separator. But those things are not well thought off. Have you ever faced a company with a multitude of natione offices packages? I do remember fixing CSV files in the past, because of comma vs dot problem. Don't get me even started on a spredsheet and its localised function names.**

**;-D**  
**I was kidding...**

**Having dealt with numerous various languages, including ones that are being written right to left, or languages where orthography is simply not a notion, where a single name may have a dozen of various ways to write it, and having suffered \*much* from .csv with stupid French numbers with comma decimal separation, I know that this whole subject is \*very* complex.**

**I was just so happy to discover that Rebol and Red dealt "naturally" with those numbers.**

**[13:00](#msg5ec91e5227513a72fbaa06e1)While internal representation of numbers should just stick to C standard (which is, by far, the most commonly adopted and efficient convention, AFAIK), it would be nice if a locale system could allow input and output to be converted to (almost) any local settings.**

**planetsizecpu**

**[15:50](#msg5ec946294412600ccd623946)I'm afraid I have not explained myself well, why invent the wheel again if it is already invented? just copy the OS locale attributes to Red on boot, at system / locale, for example, in my case, these from my w10 system, and preserve the internal format at it's native format, so everyone would have their system defaults.**

**[15:50](#msg5ec9462f225dc25f549f11b9)\[!\[settings.jpg](https://files.gitter.im/red/red/welcome/vvBo/thumb/settings.jpg)](https://files.gitter.im/red/red/welcome/vvBo/settings.jpg)**

**PierreChTux\_twitter**

**[16:29](#msg5ec94f749da05a060a2793d1)@planetsizecpu yes, definitely the best way to go, and keep everyone happy as can be.**

**greggirwin**

**[18:14](#msg5ec967ef3ffa6106f1cccf6a)@PierreChTux\_twitter @planetsizecpu localization is another big topic, though we'll try to keep it simple and allow bigger pieces to be built over it. As always, we can't build everything into Red, but we also don't want people to create 50 different incompatible systems because we offered no guidance at all.**

**[18:14](#msg5ec9680d27513a72fbaaaec0)The future `format` dialect will almost certainly tie to the locale system.**

**[18:17](#msg5ec968a67da67d06fac8756e)@PierreChTux\_twitter :point\_up:\[](https://gitter.im/red/red/welcome?at=5ec8fe599da05a060a26e125) there is no way to call into R2 to use it as a library, but there is also the issue that the stable versions relied mostly on the synchronous networking features, and some protocols are so out of date that they won't work anymore.**

****Thursday 4th June, 2020****

**codenoid**

**[22:50](#msg5ed97aa7daf4cf366ee0ee5b)how you doin red folks**

**greggirwin**

**[22:51](#msg5ed97ad4f0b8a2053ad4ab00)Well, thanks.**

****Wednesday 10th June, 2020****

**RednibCoding**

**[20:42](#msg5ee145ceee693d6eb3b86902)Hey, someone there?**

**[20:48](#msg5ee1472aa85de30394070d7b)Are there any parenthesize in the red language syntax?**

**theSherwood**

**[20:49](#msg5ee14753ee693d6eb3b86c89)Yes. But far fewer than you would find in a Lisp.**

**[20:49](#msg5ee14771ef5c1c28f0164443)Parens are not used for function calls.**

**RednibCoding**

**[20:54](#msg5ee1489b5782a31278f062c8)Ah ok, thanks.**

**theSherwood**

**[20:55](#msg5ee148b92cf2f36eae507b09)Sure thing!**

**RednibCoding**

**[21:10](#msg5ee14c4d7c64f31f11529ce4)One question: on the about page ist sais: "Produces executables of less than 1MB, with no dependencies" on windows though an exe depends on the libredrt.dll. Is it possible to include this into the exe so there are really no dependencies? To have have just one file.**

**hiiamboris**

**[21:15](#msg5ee14d747c64f31f1152a163)@RednibCoding study `red --help` output ;)**

**RednibCoding**

**[21:48](#msg5ee155485dcbb760b6e0e722)Thanks for the advice but that does not give any hint on how to avoid the dependency to the libRedRt.dll.**

**hiiamboris**

**[21:52](#msg5ee1561029d8bc28f9ebb1a1)**  
**`-r, --release : Compile in release mode, linking everything together (default: development mode).`**

**[21:52](#msg5ee1563430401c1f244bbfcf)It does, although may be somewhat subtly ;)**

**RednibCoding**

**[21:54](#msg5ee1567fef5c1c28f0166efc)Oh... thank you.**

**[22:02](#msg5ee1588fef5c1c28f01672b6)Somehow windows defender always reports the compiled exe as trojan.**

**hiiamboris**

**[22:09](#msg5ee15a105dcbb760b6e0f400)https://github.com/red/red/wiki/\[NOTE]-Anti-virus-false-positives**

**[22:10](#msg5ee15a3d7a7f8d2d6329b85d)likely for compression, e.g. "OMG this file is compressed!! must be a sneaky virus there woohoo! Destroy! Destroy! Destroooy!"**

**[22:10](#msg5ee15a73013105125a299600)Try `--no-compress` and pray ;)**

**RednibCoding**

**[22:12](#msg5ee15adcee693d6eb3b89f0a)Ahh ok good to know.**

****Saturday 13th June, 2020****

**codenoid**

**[21:13](#msg5ee541907c64f31f115c26fa)hi folks, how you doing, hope everything getting better**

****Friday 19th June, 2020****

**vjay17\_gitlab**

**[10:04](#msg5eec8dc547fdfd21edd1d63b)Hi hello**

**[10:05](#msg5eec8dfa405be935cdada771) undefined reference to \`rcvfft2\_' can anyone tell me what is this error related to?**

**hiiamboris**

**[10:06](#msg5eec8e243a0d3931fa9fcc00)Hi. Welcome ;) Are you trying redCV out?**

**vjay17\_gitlab**

**[10:06](#msg5eec8e4054d7862dc4975bf6)I was googling this error and have come across redcv**

**[10:07](#msg5eec8e47b8152d34844f70eb)but it isnt the issue i guess.**

**hiiamboris**

**[10:07](#msg5eec8e56405be935cdada80e)Yeah, probably not ;)**

**vjay17\_gitlab**

**[10:07](#msg5eec8e5db8152d34844f7119)Its related to fortran. Any idea how to resolve it?**

**hiiamboris**

**[10:07](#msg5eec8e6b613d3b3394f6ba23)Not the slightest.**

**vjay17\_gitlab**

**[10:07](#msg5eec8e71bb149531edbab7fb)Okay**

****Wednesday 8th July, 2020****

**cloutiy**

**[19:14](#msg5f061b0a7a4e99049ef9e5e4)Something I don't like is that non-scalars are passed by ref to functions. I guess it's an old habit, used to functional programming paradigm that everything is passed by value. So I made a function that inserts some code to the function body to make copies of non-scalars so that I know anything I do inside the function doesn't affect the original block:**  
**`=>: function [args body] [ spec: args body: to-block body cloned-args: copy [] foreach arg args [ a: to-string arg append a rejoin [ ": either scalar? " arg " [ " arg " ] [ copy " arg " ]" ] append cloned-args to-block a] insert body cloned-args ; return a new function which has some code inserted to clone non-scalars and rebind. function spec body ] modify-list: => [l] { insert l 23 insert l {hey} print l } l: [1 2 3 4] ; Changes made to l inside this func should have no effect on l outside. modify-list l ;== hey 23 1 2 3 4 print l ;== 1 2 3 4`**

**hiiamboris**

**[19:17](#msg5f061bcb8b72655b555cbd0a)Nice @cloutiy ;)**  
**However putting words into a string and then back into block is highly inefficient and error prone way to do this ;)**

**cloutiy**

**[19:19](#msg5f061c29c7d15f7d0f7d3bcc)@hiiamboris Yes probably. I'm sure there are better ways of doing it...any suggestions welcome!**

**hiiamboris**

**[19:20](#msg5f061c778b72655b555cbe88)e.g. `compose/deep`**

**cloutiy**

**[19:41](#msg5f06216ea9378637e8b700af)@hiiamboris brillant**

****Thursday 9th July, 2020****

**williamgosse**

**[19:02](#msg5f0769bec7d15f7d0f80dfb2)I just installed red on windows 10. The install seems somewhat unconventional because I didn't get to chose an install location. I did find some red related files in progamdata. Is this all that gets install? How do I uninstall? Do I just remove the red folder from programdata?**

**hiiamboris**

**[19:05](#msg5f076a8b64ef9d04b2a22535)Yes. If you're short of those few megabytes, just remove it.**

**[19:07](#msg5f076aec7455046699eb25f8)On a side note, can you choose install location of e.g. Windows 10? Or choose all install locations of MS Office? Do you even know how many there are? ;)**

**williamgosse**

**[19:14](#msg5f076cb06e1b8050c3e3bc04)Can I move the the red folder to any location i'd like? I see only two files in it, gui-console-2018-11-22-8164.exe and crush-2018-11-22-8164.dll. Does that sound correct?**

**hiiamboris**

**[19:23](#msg5f076e9e3c217837fd8ab34c)There will be other files if you will use `--cli` and `-c` switches.**

**[19:23](#msg5f076ebf7a4e99049efdaabc)No you can't move it, but you can move `red.exe`.**

**[19:24](#msg5f076ee8dbf01050ab648564)You shouldn't even bother with those other files. Most users don't even know they exist.**

**williamgosse**

**[19:44](#msg5f0773917a4e99049efdb8c4)Thanks**

**sjpschutte**

**[20:21](#msg5f077c617455046699eb5ef5)Hello all. I am new and new some help please:**

**[20:22](#msg5f077c767455046699eb5f19)dir: read %dira/**

**[20:22](#msg5f077c847455046699eb5f4a)dirb: read %dirb/**

**[20:23](#msg5f077cd7a5ab931e4f773f40)I now have a list with directory entries and want a new list that only contains the sub directories.**

**[20:25](#msg5f077d3cbd3edf666fbda547)In perl I can do something like @newlist = map { -d$_ } @dirb**

**[20:25](#msg5f077d4af6b741628423e91e)How do I do it in rebol/red, please ?**

**hiiamboris**

**[20:27](#msg5f077d9ddbf01050ab64acbd)Hi @sjpschutte and welcome ;)**  
**How about `remove-each file dir [not dir? file]`?**

**sjpschutte**

**[20:29](#msg5f077e2c86ccb45b5996a6ef)Thanks I am checking.**

**[20:31](#msg5f077e996e1b8050c3e3f020)It worked :)**

**[20:31](#msg5f077e9e8b72655b55608571)Many thanks.**

**hiiamboris**

**[20:31](#msg5f077ea1a9378637e8bac344)☻**

**[20:31](#msg5f077ea83c217837fd8ae569)You're welcome. If you're into some serious file listing you can use https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/glob.md by the way.**

**sjpschutte**

**[20:31](#msg5f077ebf8342f46274058d56)Where can I find more information ?**

**hiiamboris**

**[20:32](#msg5f077ee6dbf01050ab64affb)Updated the link, that was an old one ;)**

**[20:33](#msg5f077f338342f46274058f19)Try e.g.:**  
**`do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/glob.red ? glob`**

**sjpschutte**

**[20:35](#msg5f077f7664ef9d04b2a2622f)I also tried to parse a csv file, but the example on the rebol site only works in rebol.**

**[20:35](#msg5f077f787455046699eb6880)http://www.rebol.net/cookbook/recipes/0018.html**

**[20:36](#msg5f077fc08b72655b556088f2)I came accross this link, but it is broken: https://github.com/rebolek/red-tools/blob/master/csv.red**

**hiiamboris**

**[20:37](#msg5f077fff86ccb45b5996abd1)It is merged into the binary already. Try `? load-csv`**

**sjpschutte**

**[20:37](#msg5f07800e64ef9d04b2a263e7)O.O**

**[20:37](#msg5f078011c7d15f7d0f812105)cool**

**[21:01](#msg5f0785a08b72655b55609af9)Sorry to bother again. I seems to be too dumb to get it working:**

**[21:01](#msg5f0785a1a5ab931e4f775645)&gt;&gt; csv: read/lines %/home/paul/ERSZ015D.csv**  
**== [{"PROCESSING DATE","WORKUNIT NO","TAPE NUMBER","TRANSACTION TYPE","SEQ NO","HOMING BRANCH","HOMING ACC...**  
**&gt;&gt; load-csv/header csv**  
**\*\** Script Error: load-csv does not allow block! for its data argument**  
**\*\** Where: load-csv**  
**\*\** Stack: load-csv**

**[21:02](#msg5f0785e88342f4627405a2aa)Never mind seems the problem was the read/lines**

**[21:06](#msg5f0786c8bd3edf666fbdc22e)But the problem was that I was using red-064 and not latest**

**hiiamboris**

**[21:06](#msg5f0786e646c75b1e5e3551ce)That is an old build. Should be problematic ;)**

**sjpschutte**

**[21:08](#msg5f078738bd3edf666fbdc452)I thought "last stable" would be a good thing ;)**

**hiiamboris**

**[21:08](#msg5f078769c7d15f7d0f813426)Yeah, right ;)**  
**It's a known issue, with a solution coming soon :tm:**

**GaryMiller**

**[21:18](#msg5f0789b93e4a827d19b60999)@sjpschutte Rebol Cookbook looks nice. Somebody should translate it into Red.**

**sjpschutte**

**[21:19](#msg5f0789d67455046699eb83e2)I have been looking at the rebol Docs a lot.**

**[21:19](#msg5f0789df7455046699eb83ff)Sadly not everything works.**

**GaryMiller**

**[21:20](#msg5f078a043e4a827d19b60aa7)Love those books that follow a cookbook format!**

**hiiamboris**

**[21:20](#msg5f078a183e4a827d19b60aae)@sjpschutte It's a good starting point though. We always recommend Rebol docs, esp. Rebol/Core manual.**

**sjpschutte**

**[21:22](#msg5f078aaabd3edf666fbdce87)I noticed that red still uses 32bit libraries on linux. This might become a problem on the newer Ubuntu versions as they are planning to drop 32bit libraries going forward.**

**hiiamboris**

**[21:23](#msg5f078adcc7d15f7d0f813e16)Then you'll have to use docker ;)**

**sjpschutte**

**[21:23](#msg5f078ae3c7d15f7d0f813e3b):(**

**[21:31](#msg5f078cb17455046699eb8c00)Thanks a lot for the help !**

**[21:33](#msg5f078d12f6b7416284241529)There is no way I would have figured out the remove-each thing.**

**hiiamboris**

**[21:36](#msg5f078dde8b72655b5560b233)(:**

**[21:37](#msg5f078dfddbf01050ab64db56)You would have figured how to iterate over your list eventually. `remove-each` is just a simpler way, but Red code is never "final". There's \*always* a room for improvement or alternative solution.**

**sjpschutte**

**[21:54](#msg5f0792068b72655b5560bf8a)I am trying to ween myself of perl for these data manipulation tasks. It served me well for many years. But there is a magnet inside rebol/red that is pulling on me ;)**

**[21:54](#msg5f079220a5ab931e4f777843)I have many :this is cool" moments. Which I rarely experience with other languages.**

**[21:58](#msg5f0792f33e4a827d19b624ae)I hope I am not a bother to anyone, but is there a quick way to do a "grep" like action on the csv data ?**

**[21:58](#msg5f0793166e1b8050c3e4266e)I know there is a name somewhere in the grid and I would like to get the record(line).**

**hiiamboris**

**[22:04](#msg5f079465a5ab931e4f777dec)After you've loaded it, just iterate on it using `foreach`. Grepping it on text level isn't reliable, is it?**

**sjpschutte**

**[22:35](#msg5f079bcb3c217837fd8b31f4)Thanks for all the help. I can see I still have a long road ahead.**

**greggirwin**

**[23:41](#msg5f07ab12a5ab931e4f77b5e8)Welcome @sjpschutte! `Help` is your friend in the console.**

**[23:47](#msg5f07ac916e1b8050c3e466c5)I keep thinking I should port \[rawk](https://gist.github.com/greggirwin/6397bdfe8e9e7dd9f3d543bc4b0e570c) and \[rgrep](https://gist.github.com/greggirwin/2dfe6bc45f596592c890b52d1d7f9475) but then hold off because they need a design rethink for standard inclusion.**

**[23:59](#msg5f07af567a4e99049efe5b21)Here's a basic grep-ish func.**  
**`basic-grep: function [ file [file!] text [any-string!] "text to find" ][ lines: read/lines file repeat i length? lines [ cur-line: lines/:i if find cur-line text [ print [i tab cur-line] ] ] ]`**

****Friday 10th July, 2020****

**greggirwin**

**[00:00](#msg5f07af86f6b7416284246e24)That should give you a few teasers for Red usage too.**

**sjpschutte**

**[01:35](#msg5f07c5efa9378637e8bb7356)Thanks @greggirwin**

**[01:40](#msg5f07c6f68342f46274064a9a)The next thing I am having trouble with is the "call" function.**

**[01:40](#msg5f07c7296e1b8050c3e4a392)&gt;&gt; call "ls"**  
**== 8734**

**[01:41](#msg5f07c74746c75b1e5e35f50a)I am unsure if it even ran.**

**[01:42](#msg5f07c77ddbf01050ab6569c6)With rebol, I get more what I was expecting:**

**[01:42](#msg5f07c77f7455046699ec1f31)&gt;&gt; call "ls"**  
**== 0**  
**&gt;&gt; AllNedbankAccounts.csv Matched.csv Partial.csv mylist outbank size.r**  
**BrokenAccounts.csv NedbankHomeBacks.csv match.pl nedbank.zip processed.zip**  
**Duplicates.csv NotFound.csv match.r old processedv2.zip**

**&gt;&gt;**

**[01:43](#msg5f07c7cfbd3edf666fbe6443)I need to invoke a utility written in C from red, but I am having trouble. Please help.**

**greggirwin**

**[03:18](#msg5f07de217a4e99049efec892)Did you try `help call`?**

**sjpschutte**

**[06:23](#msg5f08094786ccb45b59980044)yes, but was using red-064 again by accident :(. It works as expected in latest.**

**[09:41](#msg5f0837e6bd3edf666fbf7970)Last dumb question from me: Is database access possible from linux ?**

**[09:42](#msg5f0837f43e4a827d19b7c2ce)If yes, please point me in the right direction.**

**planetsizecpu**

**[09:44](#msg5f08389ba9378637e8bc9c86)@sjpschutte Not as far as I know, it's pending I / O completion**

**hiiamboris**

**[09:54](#msg5f083ad9c7d15f7d0f8300de)@sjpschutte https://github.com/red/code/tree/master/Library/SQLite**

**sjpschutte**

**[10:27](#msg5f08429e6e1b8050c3e5e4ab)Thanks**

**[11:41](#msg5f0853e8a9378637e8bce7c7)I am stuck again :( 2 hours of searching and I can't find the red equivalent of "modified? %/my/file"**

**hiiamboris**

**[13:10](#msg5f0868db64ef9d04b2a4d181)`query` I think**

**sjpschutte**

**[13:12](#msg5f0869413e4a827d19b85394)Tyvm !**

**[13:13](#msg5f086971bd3edf666fc0080e)It would be great if the red help would tell you what to use when you try to get help on a depricated rebol command.**

**[13:13](#msg5f08698964ef9d04b2a4d3d0)It is near impossible to google it.**

**hiiamboris**

**[13:14](#msg5f08699d46c75b1e5e37a407)That's why we have this chat and https://gitter.im/red/help ;)**

**[13:14](#msg5f0869bbbd3edf666fc00877)The solution is actually simpler. You want a file operation - try `help "file"` and look from there**

**sjpschutte**

**[13:15](#msg5f0869e0dbf01050ab671dd4)So, am I asking in the wrong chat room ?**

**hiiamboris**

**[13:15](#msg5f0869f13e4a827d19b855ad)It's for help too ;)**

**[13:15](#msg5f0869f9dbf01050ab671e60)Also, when googling, use "redlang" term instead of "red"**

**sjpschutte**

**[13:15](#msg5f086a03a5ab931e4f79aa0c)I do use redlang**

**hiiamboris**

**[13:15](#msg5f086a0aa5ab931e4f79aa19)okay**

**[13:16](#msg5f086a333c217837fd8d514e)https://www.red-by-example.org/ here's a great index of functions**

**sjpschutte**

**[13:17](#msg5f086a5486ccb45b59991fd7)@hiiamboris Are you one of the developers ?**

**hiiamboris**

**[13:17](#msg5f086a6064ef9d04b2a4d638)I am.**

**sjpschutte**

**[13:17](#msg5f086a77a5ab931e4f79ab71)It is amazing work, well done !**

**wallysilva**

**[13:18](#msg5f086a9964ef9d04b2a4d710)@hiiamboris All of those are great tips, maybe we could have them pinned somewhere?**  
**In the chat room description maybe?**

**hiiamboris**

**[13:18](#msg5f086a9e86ccb45b59992079)@sjpschutte Thanks ;)**

**[13:19](#msg5f086adfa9378637e8bd32c2)@waglebr I think I proposed this twice already myself - to have links to FAQ in the room's description ☻**

**wallysilva**

**[13:21](#msg5f086b5fa5ab931e4f79af96)@hiiamboris A FAQ would be really helpful!**  
**I could volunteer to help with that if you guys need extra hands**

**sjpschutte**

**[13:21](#msg5f086b7286ccb45b599922e1)I wish I knew about the 'help "file"' earlier. Could have saved me hours ...**

**wallysilva**

**[13:23](#msg5f086be346c75b1e5e37aa01)Talking about that, is there any way that I can see all the `flags` that can be used with `view`? I've tried things like `? "flags"` and `? "view/flags"` but without success**

**hiiamboris**

**[13:24](#msg5f086bf264ef9d04b2a4db46)Don't be afraid to ask @sjpschutte**

**sjpschutte**

**[13:25](#msg5f086c30a9378637e8bd3726)@hiiamboris thanks, but I try not be too much of a nuisance ;)**

**hiiamboris**

**[13:25](#msg5f086c343e4a827d19b85c00)@waglebr https://github.com/red/docs/blob/master/en/view.adoc#window**

**[13:25](#msg5f086c677455046699edec0c)View, VID and `parse` have reference documentation at the official site (the link above).**

**wallysilva**

**[13:26](#msg5f086c6f3c217837fd8d57a7)@hiiamboris Great, thank you Boris!**

**hiiamboris**

**[13:28](#msg5f086cef8b72655b5562ff5c)We have a FAQ here: https://github.com/red/red/wiki/\[DOC]-FAQ but it's missing a lot indeed. And then different kinds of people ask different questions.**

**[13:29](#msg5f086d2f6e1b8050c3e66b5a)Documentation central point is here: https://github.com/red/red/wiki . Yet it also could use some improvement.**

**[13:29](#msg5f086d527455046699edefad)If I was a beginner I would lose myself in all those links ;)**

**sjpschutte**

**[13:31](#msg5f086d956e1b8050c3e66c42)And they kind of go in a circle wihout getting to the information you are looking for.**

**hiiamboris**

**[13:31](#msg5f086da846c75b1e5e37b0e1)A bit, yeah ;)**

**[13:31](#msg5f086dcef6b7416284265a98)On the wiki, in the upper left corner there's a search input field. Although after the search you have to filter results again to only get the wiki results ;)**

**[13:34](#msg5f086e52c7d15f7d0f839a96)But wiki is a totally disorganized collection anyway. You should try it after: console help failed you, Red by Example failed you, official docs failed you, and so did Rebol/Core manual**

**[13:35](#msg5f086eb646c75b1e5e37b591)On the bright side, wiki is free for everyone to make notes. If anyone wants to use it, feel free to (ask if unsure)**

**[13:38](#msg5f086f6164ef9d04b2a4e677)Found a great collection of docs: https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources**

**wallysilva**

**[13:43](#msg5f0870906e1b8050c3e67778)@hiiamboris The FAQ is short but very instructive, it has some great insights that I hadn't seen anywhere else yet. I'd love to see it grow longer! :D**

**[13:45](#msg5f0870fe86ccb45b59993381)Also, all this information that you have just laid out shouldn't be lost. I will try to add them to the Wiki if I can.**

**[13:47](#msg5f08716d8342f46274081b7f)I can only wonder how much great insights have been shared in these chat rooms already...**

**hiiamboris**

**[13:53](#msg5f0872e4bd3edf666fc025e3)Here's also a nice list by @GiuseppeChillemi https://programming.red/wiki/Main\_Page**

**wallysilva**

**[14:00](#msg5f08746e6e1b8050c3e68320)Wow, that's a really nice list!**

**sjpschutte**

**[14:05](#msg5f0875923e4a827d19b87a9a)Overwhelming ;)**

**wallysilva**

**[14:09](#msg5f0876ab8b72655b55631eab)I agree, it is overwhelming at first. I remember that I had seen this list before when I first started with Red but I skipped it because I didn't know where to start.**  
**But now, a couple of weeks later, I can look at it and recognize what's relevant for me at this point.**

**[14:11](#msg5f08771c8b72655b55631f9c)Specially because I've actually been through most of those links related to Red (I'm ignoring the ones to Rebol for now, there are too many)**

**[14:12](#msg5f08774a46c75b1e5e37d2ba)My goal is to learn Red without having to learn Rebol first**

**GiuseppeChillemi**

**[15:05](#msg5f0883a9a9378637e8bd9000)There are at least other 200 links to add but as you have noted the first page can be overwhelming (and I thank you for reminding me this). So in the future the first page will change and will contain an introduction and some star-here! sections.**

**[15:06](#msg5f0883e186ccb45b59997f50)@hiiamboris thanks for the citation**

**wallysilva**

**[15:10](#msg5f0884d26e1b8050c3e6c1da)@GiuseppeChillemi Thank you for compiling all those links in a Wiki, it's really helpful to be able to see all of them in a single place! And if you would like some help, let me know, I would like to contribute if I can.**

**GiuseppeChillemi**

**[15:17](#msg5f08866ebd3edf666fc06f4b)Thanks Wally, it is much appreciated. If needed I will call for help.**

**[15:19](#msg5f088717bd3edf666fc07462)I confess I would like have a search engine and a navigable database for those links, like DMOZ has been in the past but it needs knowledge I don't have!**

**[15:20](#msg5f088744c7d15f7d0f8401d0)Maybe when Red.js will be ready or when I will find a way using CGI on Red.**

**bkalef88\_gitlab**

**[17:36](#msg5f08a73846c75b1e5e388af5)Carl S. wrote a really nice little Rolodex demo app that is easily converted into a custom little Knowledgebase application. I had used it the past to be a small support resource for a team I worked on. We had the main source file on the server and everyone would connect using the small client app and grab the data on startup. I currently have 3500 records in the version I use and it is searched in the blink of an eye. I know the right place for this is in a small searchable web page somewhere, but nice to have little demo apps that people can learn from... and have useful information for the community in.**

**[17:48](#msg5f08a9e3dbf01050ab680d48)the IOS version of the Rolodex was a very nice example of a custom database with customizable filters and such also baked into the tool.**

**pekr**

**[17:52](#msg5f08aac86e1b8050c3e751bc)Wasn't it Rebodex? 😀**

**bkalef88\_gitlab**

**[17:52](#msg5f08aac986ccb45b599a05bc)see the Shared Contacts Database: http://www.rebol.com/reblets.html**

**[17:52](#msg5f08aad9c7d15f7d0f847bd3)yes, the early version was Rebodex.**

**pekr**

**[17:54](#msg5f08ab718342f4627408f095)IOS was cool, I have bought one for one local project. I have IOS docs somewhere, I really liked the client server communiation protocol, app install protocol. There was just no cross app communication API.**

**[17:57](#msg5f08abfea9378637e8be1f74)I really miss Red ports and stepping up the game. Rebol services was also interestimg messaging attempt, as well as Maarten's Rugby RPC stuff ...**

**greggirwin**

**[18:00](#msg5f08aca4f6b74162842747b0)@sjpschutte @waglebr now is a \*great* time to make notes and adding to help and wikis, because you have fresh eyes, which most of us don't. What 1-3 links would be best to go in the room's header? I will try to make that happen.**

**[18:01](#msg5f08acfb86ccb45b599a0e47)IOS was cool indeed. I did a commercial project with it, along with using it in house at a client, along with Chris Ross-Gill. He did amazing GUI work, while one of the pieces I did was an IPC engine.**

**GiuseppeChillemi**

**[18:55](#msg5f08b9a47455046699eefceb)I would like to put see IOS in action but it is currently unavailable**

**[18:55](#msg5f08b9b6c7d15f7d0f84a9dd)\*to see**

**wallysilva**

**[19:45](#msg5f08c5523c217837fd8e86d2)Hi @greggirwin ,**  
**I thought about it and maybe it's not really as much about providing \*more* links as it is about organizing the information that's already available in a more concise way.**  
**For instance, there could be just one link in the room's header to a \*\*Help\** section on Red's official website. And in the \*\*Help\** section there could be links for the learning resources roughly organized in 3 section:**

**1 - Are you coming from Rebol?**  
**2 - Are you coming from other programming languages?**  
**3 - Will Red be your first programming language?**

**Honestly, I think that the "first time programmers" (like myself) will be the future of Red in the long term, so it's important that they can find their way through this information jungle that we have right now.**

**Now, one thing that definitely would be helpful to have in the room's header is what @hiiamboris mentioned above and that I wish that I knew since day one:**

**If you need help, try to find the answer through the following path:**  
**The console `help` command (it will be your best friend) \*\*-&gt;\** \[Red by Example](https://www.red-by-example.org) \*\*-&gt;\** \[Red Official Documentation](https://github.com/red/docs/blob/master/en/SUMMARY.adoc) \*\*-&gt;\** Rebol Docs, specially \[Rebol/Core manual](http://www.rebol.com/docs/core23/rebolcore.html) \*\*-&gt;\** \[Red Wiki](https://github.com/red/red/wiki) \*\*-&gt;\** Search "redlang + your-question" in your favorite web search engine \*\*-&gt;\** Ask us, we are here to help!**

**hiiamboris**

**[19:54](#msg5f08c782c7d15f7d0f84cf29)Your 1,2,3 are exactly how I envisioned it :+1: With 4 probably being "I can't find what I'm looking for. Any help?" explaining the process we outlined as "help -&gt; RbE -&gt; ... -&gt; Gitter" ;)**

**[19:55](#msg5f08c7a03e4a827d19b9a056)I agree, more links =/= better.**

**sjpschutte**

**[20:17](#msg5f08ccc1bd3edf666fc15014)I think it should start of with how to get help. In particular how to get the most out of the build in help system. Maybe a few a examples.**

**[20:17](#msg5f08cce7a5ab931e4f7b076f)I thought I could search for keywords only and had a hard time figuring that out.**

**[20:18](#msg5f08cd2c86ccb45b599a67b8)It is important that they understand that you can do almost a "grep" kind of thing on the word in quotes.**

**wallysilva**

**[20:21](#msg5f08cdb9bd3edf666fc15346)@sjpschutte If you type `help` in the console, you can actually see those examples.**

**hiiamboris**

**[20:21](#msg5f08cdcbf6b741628427a162)`> red.exe`**  
**`--== Red 0.6.4 ==-- Type HELP for starting information. >> help ... To also search in function specs, use a string: ? "pri" ? "issue!" ...`**

**[20:23](#msg5f08ce386e1b8050c3e7b781)Notice it starts with `Type HELP` ;)**

**wallysilva**

**[20:27](#msg5f08cf2c64ef9d04b2a63418)One of the things that I really enjoy in Red is how simple and efficient the built-in documentation is. When I ventured in other languages, I was completely overwhelmed and clueless about how to find what I needed in their endless built-in docs, so I never really used them. But in Red, I consult it all the time.**

**[20:29](#msg5f08cfa664ef9d04b2a63603)And talking about that, I'd love to be able to see all the sub-options for a command using something like `? "view/flags"`.**

**sjpschutte**

**[20:29](#msg5f08cfb38b72655b556445ad)My bad. I did not fully understand what I was looking at. Weird as it may sound.**

**hiiamboris**

**[20:29](#msg5f08cfc66e1b8050c3e7bb46)&gt; how simple and efficient the built-in documentation is.**

**And even then there's a lot of room for improvement. You can scroll https://gitter.im/red/sandbox up for experimental examples.**

**[20:30](#msg5f08cfe67455046699ef4122)Documenting DSLs (like View) via console help is a problem on it's own. Not yet solved ;)**

**sjpschutte**

**[20:31](#msg5f08d036c7d15f7d0f84e9cd)I think part of the problem is the mindset one developed over the years of where and how to find answers when learning a new language. It is different for red.**

**greggirwin**

**[21:15](#msg5f08da6f46c75b1e5e391947)For anyone new to Red, remember to play, have fun, explore, and give yourself time. Because it looks familiar in many ways, we want to carry over things we know from other langs. That works to some extent, then you step into the deep part of the lake and flounder around for a while. Be patient with yourself and enjoy the ride.**

**[21:44](#msg5f08e145a9378637e8beb8ea)@waglebr it's a constant struggle about where to draw lines, not just docs, but what will be included as standard, and deep lang design issues. Doc strings necessarily have to be short, but sometimes just a \*bit* more info would help a lot. You'll go a bit deep in this case, and still not find an easy answer, but `source` is another friend on your side. Shortcuts for `help` and `source` are `?` and `??` respectively. So you can `?? view` which leads you to `show`, but even there you only find `modal` as a possible flag.**

**So we should improve https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips. Even I can't find a list of flags in docs right now, so it's on to the source. I don't expect you to dive in, but here's what I learned:**  
**`window-flags: [ resize no-title no-border no-min no-max no-buttons modal popup ] show-win-using-flags: func [flags [block!]][ view/flags [backdrop sky button "OK" [unview]] flags ] spec: [ below text "You will see that not all flags combine well." button "View" [show-win-using-flags window-flags] ] lit: func [value][to lit-word! value] foreach flag window-flags [ append spec compose/deep [ check on (form flag) extra (lit flag) [alter window-flags (lit flag)] ] ] view spec`**

**[21:46](#msg5f08e1bd46c75b1e5e392c36)Posted \[here](https://gist.github.com/greggirwin/13965522516e676fe29ec9cb31e69e80) as well.**

**[21:48](#msg5f08e228a5ab931e4f7b4663)Don't worry if that's hard to understand at first sight. There's a lot going on in there, and generating GUIs dynamically should really require comments. ;^)**

**[21:58](#msg5f08e499bd3edf666fc192bc)**  
**``; What /flags does `view` support? These. window-flags: [ resize no-title no-border no-min no-max no-buttons modal popup ] ; Helper func, so the action stays small in the main GUI. show-win-using-flags: func [flags [block!]][ view/flags [backdrop sky button "OK" [unview]] flags ] ; Basic layout spec, not viewed yet. Used as data so we can build ; it up dynamically. This is the main window of the app. spec: [ below text "You will see that not all flags combine well." ; Show another window, using the selected flags. button "View" [show-win-using-flags window-flags] ] ; Quick hack because flags are words and we're dealing with them ; as data, so we want to treat them as literal words when we do. lit: func [value][to lit-word! value] ; The dynamic part. Each flag (word) is used to add a new element ; to the main window spec. That includes 3 things: 1) a checkbox ; with the flag as the label, 2) the flag as a word, in the `extra` ; field (which ended up not being needed because I changed my mind ; about how to do it), 3) the action for the checkbox, which adds ; or removes the flag from the list of window-flags to use when ; the button is clicked in the main window. foreach flag window-flags [ append spec compose/deep [ ;check on (form flag) extra (lit flag) [alter window-flags (lit flag)] check on (form flag) [alter window-flags (lit flag)] ] ; This is how I planned to use `extra` initially. ; append spec compose [ ; check on (form flag) extra (lit flag) [alter window-flags face/extra] ; ] ] view spec``**

**[22:09](#msg5f08e71046c75b1e5e393b89)There is one more flag, which I omitted because ...I was lazy. It doesn't control the appearance of the window, but how it handles mouse events. For completeness:**  
**`view/options [size 640x480] [ actors: object [ on-over: function [face event][print event/offset] ] ] view/flags/options [size 640x480] 'all-over [ actors: object [ on-over: function [face event][print event/offset] ] ]`**

**TimeSlip**

**[22:20](#msg5f08e9c68342f46274099c53)@greggirwin Thanks Gregg for sharing that.**

****Saturday 11st July, 2020****

**wallysilva**

**[02:03](#msg5f091df38b72655b55651041)I created an Wiki entry called \[Beginner's FAQ](https://github.com/red/red/wiki/Beginner's-FAQ) as a starting point to register some of what is often asked and answered here.**  
**I hope everyone will add their bit. Cheers!**

**greggirwin**

**[09:17](#msg5f0983998342f462740b0972)Thanks!**

****Sunday 12nd July, 2020****

**greggirwin**

**[20:22](#msg5f0b711a64ef9d04b2acd036)I updated the wiki home page and linked to the Beginner's FAQ from the Getting Started area.**

**[20:36](#msg5f0b744486ccb45b59a0fbee)Room header updated. Tried various formats, and it didn't like any of them for link text.**

**hiiamboris**

**[20:39](#msg5f0b74e646c75b1e5e3f985f)I remember when I joined some room, maybe red/red, it shown me a dialog box with the topic. Now tried with this one - it shows nothing, the topic only stays above.**

**greggirwin**

**[21:06](#msg5f0b7b3c86ccb45b59a10d0b)You don't suppose Gitter changed something, do you? ;^)**

**hiiamboris**

**[21:11](#msg5f0b7c7a6e1b8050c3ee4d16):D**

**[21:11](#msg5f0b7c8a6e1b8050c3ee4d52)Well, they can always break something.**

**[21:11](#msg5f0b7c9986ccb45b59a110a5)But I actually thought maybe of some room settings.**

**wallysilva**

**[23:04](#msg5f0b96f58b72655b556b4f80)@greggirwin That's great, thanks! :D**

****Sunday 19th July, 2020****

**Yamoon2018**

**[21:02](#msg5f14b4cf564e6b39f568b253)my-data: \[1 2 3 4 "A" 5 6 7 8 9]**

**insert my-data/5 11 ;Its working**  
**print my-data**

**insert my-data/6 11 ;Its not working , I dont know Why**  
**print my-data**

**9214**

**[21:06](#msg5f14b5f3724012319bb87394)&gt; I dont know Why**

**What does the error message say?**

**greggirwin**

**[23:25](#msg5f14d6625ed1d537746ee230)For another clue, look at what `my-data/6` returns.**

****Monday 20th July, 2020****

**Yamoon2018**

**[04:39](#msg5f151fe982ccdc78add4ed7d)\*\** Script Error: insert does not allow integer! for its series argument**

**[04:41](#msg5f15207e564e6b39f569980e)--------------------**  
**If you excute the code you will get**  
**\*\** Script Error: insert does not allow integer! for its series argument ,for line number 4 "insert my-data/6 11"**

**[04:42](#msg5f1520cb00ae3b3d99ff75cb)I want to insert a single item in a specific position**

**dsunanda**

**[04:45](#msg5f15216d998f15523c14ecad)Like this?**  
**`insert at my-data 3 "new third element" my-data == [1 2 "new third element" 3 4 "A" 5 6 7 8 9]`**

**Yamoon2018**

**[05:15](#msg5f15288ff8b05b39f957e618)Yes, wow, thank, I like RED**

**toomasv**

**[05:17](#msg5f1528e6724012319bb969de)@Yamoon2018 Also, look at `my-data` without `print` after inserting at `my-data/5`.**

**Yamoon2018**

**[05:19](#msg5f15295d564e6b39f569ac9f)One more issue,**

**[05:19](#msg5f15295f64b6213da14bafa5)str: "abcdefg"**  
**print find/any str "c\*f"**  
**\*\** Internal Error: reserved for future use (or not yet implemented)**

**[05:20](#msg5f152981724012319bb96c52)I'm using http://www.rebol.com/docs/core23/rebolcore-6.html#section-1**

**[05:20](#msg5f1529934a9e2578a0acf53b)as a reference to learn Red , is that OK?**

**toomasv**

**[05:21](#msg5f1529d518ddba6ef5e57683)Mostly yes, but there are differences. Use also `help` in console.**

**[05:22](#msg5f152a16564e6b39f569aea8)Some things to note https://github.com/red/red/wiki/%5BLINKS%5D-Coming-from-REBOL**

**[05:26](#msg5f152afc82ccdc78add50648)Using help you'll see that `/any` for `find` is TBD.**

**Yamoon2018**

**[05:34](#msg5f152cd4564e6b39f569b57f)TBD: To be developed?**

**endo64**

**[06:09](#msg5f15352a8a9a0a08cbac69fd)To Be Determined / Decided.**

**Yamoon2018**

**[06:25](#msg5f1538dd64b6213da14bd7fc)So until the next revision that refinement can't be used.**

**[12:53](#msg5f1593ae18ddba6ef5e693d8)I would like to know how to use "array" in Red, as it seems not supported**

**rebolek**

**[12:53](#msg5f1593e382ccdc78add6247f)There are `block!`s in Red.**

**[12:54](#msg5f1594164a9e2578a0ae0eb5)**  
**`block: ["foo" "bar" "baz"]`**

**dsunanda**

**[13:06](#msg5f1596e67b21b70c16c2df3d)@Yamoon2018 With some Rebol functions that are not (as yet) in Red, you can "borrow" the code from Rebol.**  
**That doesn't work for FIND/ANY as FIND is a native. But it will work for ARRAY as it is a mezzanine (ie written in Rebol code - which also happens to be 100% compatible with Red).**  
**Try this from a Rebol console....**  
**`source array`**  
**.....And copy what you see to a Red console.**

**rebolek**

**[13:14](#msg5f1598d0fd3832489b1ed616)@Yamoon2018 Ah, you mean `array` function, sorry. I usually just use `insert/dup` when I need that sort of functionality.**

**9214**

**[13:23](#msg5f159acc724012319bbaa36f)@Yamoon2018 \[↑](https://gitter.im/red/red/welcome?at=5f151fe982ccdc78add4ed7d) error messages tell you the cause of the problem, so don't be afraid of reading them. In your example, `insert` expected a list to insert `11` into, but got an integer.**  
**`>> data: [1 2 3 4 "A" 5 6 7 8 9] == [1 2 3 4 "A" 5 6 7 8 9] >> data/6 ; 6th element == 5 >> at data 6 ; series at 6th index == [5 6 7 8 9]`**

**Yamoon2018**

**[13:35](#msg5f159d8b5ed1d5377470cff5)source array**  
**ARRAY is an unset! value, so source is not available**

**dsunanda**

**[13:36](#msg5f159df2500223591210bacc)@Yamoon2018 I can see it in the latest versions of Rebol/View - available here: http://www.rebol.com/download-view.html**

**Yamoon2018**

**[13:37](#msg5f159e16b2dad248b6ca0c4f)I'm using Red consol not Rebol, is it wrong to use Red consol?**

**[13:38](#msg5f159e3fb2dad248b6ca0cd8)https://www.red-lang.org/p/download.html**

**rebolek**

**[13:38](#msg5f159e538e9a3a6ef0a39bf3)No, Red console is fine, but what @dsunanda meant is that `array` function is not in Red so you need to take a look at source of Rebol's version.**

**dsunanda**

**[13:38](#msg5f159e5b8ca6ec550c9d421e)I am suggesting you "borrow" the code from Rebol to patch Red. It's a useful strategy to patch some of Red's holes.**

**rebolek**

**[13:39](#msg5f159ea84a9e2578a0ae2ccc)I've copied the source to a gist: https://gist.github.com/rebolek/ae804b046359d856b9945805e9480daa**

**Yamoon2018**

**[13:41](#msg5f159ef78e9a3a6ef0a39cea)For new programmers to Red like me, to be sure i'm using the right docs for Red, is it only Red website or any other suggestions**

**hiiamboris**

**[13:41](#msg5f159f0f8a9a0a08cbad8947)^ in the room topic**

**dsunanda**

**[13:42](#msg5f159f5dee74a814bbfdbc8b)Both Red and its documentation are incomplete. So dipping into Rebol code and docs is still a quicker way to find some things.**

**Yamoon2018**

**[13:44](#msg5f159fd000ae3b3d9900c2fe)So I can't use Red to develop any software for my company as its incomplete**

**dsunanda**

**[13:46](#msg5f15a01a998f15523c14ecfb)It is certainly possible - and Red has some features that Rebol lacks. Just take care that what Red lacks is not a show-stopper for you.**

**9214**

**[13:48](#msg5f15a0b74a9e2578a0ae32a5)@Yamoon2018 the Red console itself gives you a hint in its starting prompt:**  
**`Type HELP for starting information.`**  
**And you can find the list of learning resources \[here](https://github.com/red/red/wiki/\[LINKS]-Learning-resources).**

**Yamoon2018**

**[13:56](#msg5f15a2828a9a0a08cbad92e3)@dsunanda , What do you suggest/advice to tel my team leader about Red and any docs about Red production under different platforms**

**9214**

**[14:00](#msg5f15a3728e9a3a6ef0a3ab88)@Yamoon2018 no one in this room is in a position to give you and your team a business advice. Red is alpha software, and using it in production entails certain risks, but it is you and your employer who make the final call. For the documentation — see this room's header and Red's Github repository.**

**dsunanda**

**[14:00](#msg5f15a381998f15523c14ecfe)I'd treat Red as cutting edge R&amp;D rather than a field-ready development tool.**

**rebolek**

**[16:07](#msg5f15c1415ed1d53774714027)It's possible to use Red to develop commercial software - if you know the limitations and risks of alpha software. It also depends on what kind of software you want to develop with it.**

**ldci**

**[16:18](#msg5f15c3c118ddba6ef5e728a4)This kind of professional application is now used in our hospital in Garches (France): https://twitter.com/fjephe/status/1087394756915810304**

**wallysilva**

**[17:30](#msg5f15d4bb8e9a3a6ef0a446ae)@Yamoon2018 If you would like to follow a more structured path to learn Red, I'd recommend \[Learn Red - Fundamentals of Red by Ivo Balbaert](https://subscription.packtpub.com/book/application\_development/9781789130706). It's a short book that will provide you with a good overview and starting point with Red (you can read it for free for 10 days!).**  
**And for finding the answers to your initial questions, have a look at this \[FAQ](https://github.com/red/red/wiki/Beginner's-FAQ).**

**Yamoon2018**

**[17:39](#msg5f15d6bcfd3832489b1f90d0)@rebolek, What about a paint software same as Windows paint?**

**hiiamboris**

**[17:44](#msg5f15d80a724012319bbb606f)https://github.com/honix/Redraw**

**9214**

**[17:45](#msg5f15d8435ed1d53774718128)@wallysilva I cannot in good faith recommend Balbaert's book. It's terribly written (a copypaste of community-provided material with a hefty price tag slapped on top), technically incorrect (Ivo was a newcomer just like you when he wrote the book), and already outdated.**

**rebolek**

**[17:58](#msg5f15db5500ae3b3d990180ad)@Yamoon2018 There was Paint program by @toomasv he should probably know better than me.**

**toomasv**

**[18:02](#msg5f15dc2c564e6b39f56ba60c)Well, \[it opens](https://github.com/toomasv/drawing) and some features work, but some do not. I haven't reworked it to adapt to changes.**

**wallysilva**

**[18:08](#msg5f15dda58e9a3a6ef0a4652f)@9214 I agree with everything you said and I can tell that there's some resentment from the community towards Ivo. I don't know what happened back then and I really don't want to get into that. But what makes a tool good or not is how you use it. And fact is that I got to read the book for free and despite of all its flaws, it gave me a good starting point to find my way with Red. Before reading the book, I tried to use the Rebol resources, but it didn't work for me.**

**TimeSlip**

**[18:22](#msg5f15e103fd3832489b1faec4)@Yamoon2018 I believe many of us have used Red/Rebol for creating applications for work and personal use. It depends on the context the app will be used. It is well worth the effort to learn Red/Rebol just for yourself. I think it will give you a competitive advantage even if your code never makes it to your workplace. For example, writing little tools to parse information or present information at a click of a button has saved me an enormous amount of time and effort. Another example was a few years back I was creating a website in php but also wrote all kinds of tools (in this case Rebol) that would simplify the process of ftp'ing code, help create php code for repetitive areas, send out tweets, etc.**

**[18:24](#msg5f15e15e4a9e2578a0aef30b)I have a Red app that I've been using at my work for about 5 years with great success. It's not very sophisticated but no one has ever asked what it was written in.**

**9214**

**[18:27](#msg5f15e1fba874ff08d28a5ea2)@wallysilva there is no personal resentment. Some people are just unsatisfied with the end product and the working mindset that it embodies, others find it OK but eventually need to re-learn everything if they want to go advanced.**

****Tuesday 21st July, 2020****

**mikeparr**

**[12:53](#msg5f16e55743d5173b8c0c3594)Re: Ivo's Red book - personally, I think that beginners willfind some useful material in it. (just to declare an interest, I did some grammar-checking on it, prior to publication).**

****Wednesday 22nd July, 2020****

**cloutiy**

**[13:47](#msg5f184369f583a47d15a4ac8e)I second mike's praise for Ivo's book. It's a great resource that got me started with Red. I'm much more comfortable now. Now I'm able to try to figure out things on my own and troubleshoot to try to figure out what I'm doing wrong before coming to gitter to ask for help. And if I do end up having to come to gitter, I'm in a better position to explain what I'm trying to do, what I've tried, and where I need clariication on some concept. Great book.**

**greggirwin**

**[18:03](#msg5f187f7c43d5173b8c109386)Books are hard work, really hard IMO. Having tech edited and co-authored (in the printed book age) I have a little real world experience. Anyone who can see a book through to its completion has my respect (maybe that's why I have a hard time getting rid of old manuals; someone put a lot of work into those), and I'm glad to have Ivo's book out there as a resource.**

****Friday 31st July, 2020****

**wallysilva**

**[05:47](#msg5f23b08f8d82e66252f68671)Alright, ladies and gentlemen, I have the joy to finally present my first Red creation! :D**  
**I thought I could do it in 1 day, but it took me 10, but I learned so much. Thank you all for sharing your knowledge with me!**

**[05:50](#msg5f23b13096bd3446a7c3f08e)!\[Hangman game](https://i.imgur.com/jE4Fq6x.png)**

**[05:55](#msg5f23b24aa0bdc3101d43fec4)\[Code here](https://github.com/wallysilva/red-hangman)**

**[05:57](#msg5f23b2ddb9bc40357baa1c27)I'm aware of my spaghetti code and I would appreciate any feedback in how I could write it in a more proper way. Thanks in advance!**

**rebolek**

**[06:41](#msg5f23bd088d82e66252f6a556)@wallysilva :clap: I take a look certainly!**

**toomasv**

**[06:41](#msg5f23bd1fe3160e46ba956d76)@wallysilva Very nice! :+1:**  
**Looking at your code, I think instead of patterns like `do 'something`, you can use just `something`.**  
**Also, I suggest instead of defining font at each place anew define it once and use this font later, something like this:**  
**`text-color: hex-to-rgb #6495ED Candara: make font! [name: "Candara" size: 12 color: text-color style: 'bold] view [ h3 290x35 #292929 center font Candara font-size 20 "The Hangman Game" style message: text #292929 font Candara ]`**

**[07:20](#msg5f23c63de3160e46ba958605)Also, instead of `either (find secret guess) <> false ...` use just `either find secret guess ...`.**  
**`none` is "falsy", \*ergo* if `find` does not succeed, it returns falsy value already.**

**[07:40](#msg5f23cafd36563560f2b40c3a)`display-secret` seems to be a bit too narrow. In case of six-letter word last letter disappears as soon as one letter is guessed.**

**[07:53](#msg5f23cdece3160e46ba959c6e)In `checker-button` `on-up` actor you repeat verbatim the code already contained in window's `on-enter` actor. You can reuse the code in `on-enter`with**  
**`on-up [ face/font/color: text-color face/color: hex-to-rgb #0a1526 event/window/actors/on-enter face none ]`**

**[07:58](#msg5f23cf2a61a83168462ab841)@wallysilva Clever arrangement for buttons!**

**[09:51](#msg5f23e984b9bc40357baaa341)There is one more problem - the end result text in case of failure will grow as "Sorry,..." is not copied:**

**[09:51](#msg5f23e9886334d26a7e6640b8)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/OmSV/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/OmSV/image.png)**

**[10:12](#msg5f23ee83a2be90499081dddc)With little \[modification](https://toomasv.red/images/Misc/hangman.gif)**

**endo64**

**[15:05](#msg5f243320a0bdc3101d45555e)Very nice @wallysilva**  
**If I click OK before clicking PLAY, I get an error `secret has no value`. Needs to check the game play state.**

**[15:18](#msg5f24363f8d82e66252f7eeed)Words inside functions `start` and `checker` is not local to those functions as you've used `func` instead of `function` and didn't specify them `/local` in your function specs.**  
**For a tiny script this might not be a problem but if your script gets bigger then you may accidently overwrite those words and it can be very difficult to find.**  
**And no need a function to set words in global context, you can just put them in the beginning of the script.**

**[15:26](#msg5f24380aa0bdc3101d456536)You may also use this web site to get 1000 English words: `words: parse read https://www.ef.com/ca/english-resources/english-vocabulary/top-1000-words/ [collect [some [" " newline tab keep to { } | skip]]]` (don't know if this is a legal use though)**

**wallysilva**

**[16:48](#msg5f244b4a10aa4562550a898d)@toomasv Thank you so much for all your valuable feedback, I will review all those points and make sure that I understand them well. And I love your modification! That was my initial intention, but the execution proved to be more difficult than what I expected.**  
**I think my first mistake was that I created the CLI version and GUI design first and then tried to tie them together, but that didn't work at all. Writing code for GUI is actually quite different, so I will need to practice it more.**

**toomasv**

**[16:55](#msg5f244d1096bd3446a7c58f60)@wallysilva You are welcome! Modification is \[here](https://gist.github.com/toomasv/0413ba4481f529d4f93d74f065be7fad).**

**wallysilva**

**[16:57](#msg5f244d7b8d82e66252f82ec7)Thank you @toomasv 🙏**

**[16:59](#msg5f244dfc6334d26a7e67530d)@endo64 Thank you for your feedback!**  
**I built safeguards on the CLI version, but I couldn't make them work when binding the code to the GUI. It actually took me a while to figure out how to make even the simple things to work properly in the GUI.**  
**I actually used `func` on purpose because I needed some words to be global as I didn't know how to access them when they're local. And yes, I intend to update it with a large database in the future, but as my first project I needed to keep it very small and simple so I could follow what was going on.**

**[17:06](#msg5f244f9f8d82e66252f83489)I had a lot of fun working on that project and I hope to increment it with improvements as I advance on my learnings.**

**toomasv**

**[17:17](#msg5f245228b9bc40357babd4b8)Yes, it is beautiful and interesting thing! Congratualations for your first Red project!**

****Saturday 1st August, 2020****

**greggirwin**

**[03:50](#msg5f24e68486ad126839de1b86)Thanks for posting @wallysilva. Will try to review...soon :tm:.**

**wallysilva**

**[04:10](#msg5f24eb4fe3160e46ba98896f)Thank you @rebolek and @greggirwin, any and all feedback is welcome!**

****Tuesday 4th August, 2020****

**cloutiy**

**[18:13](#msg5f29a546c6dbab65123e5a03)Is there a red/system room?**

**wallysilva**

**[18:16](#msg5f29a601107f3a0efaab308e)Yes, there is**  
**You can see all the rooms \[here](https://gitter.im/red/home)**

**cloutiy**

**[18:19](#msg5f29a6a683a82b0f059def6d)Perfect thanks!**

****Saturday 8th August, 2020****

**guaracy**

**[04:17](#msg5f2e2755fe39ca5d658aa296)\[!\[red-gtk\_069.png](https://files.gitter.im/570387cd187bb6f0eaddec47/1oIp/thumb/red-gtk\_069.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/1oIp/red-gtk\_069.png)**

**[04:24](#msg5f2e29009b76045d5b8609cb)@wallysilva**  
**I think you must review the while loop.**  
**if i hit in the 10th try i don't know if i won or i loose.**

**ams02468**

**[11:50](#msg5f2e916fa4768b68567e04e9)how can compile a console app in red ? (windwos)**

**9214**

**[13:02](#msg5f2ea26da4768b68567e3096)@ams02468 `-r -t MSDOS` or simply `-r`. Details are in \[readme](https://github.com/red/red/blob/master/README.md).**

**wallysilva**

**[16:00](#msg5f2ecc00811d3571b3b456cc)Obrigado @guaracy, I'll fix that!**

**[17:55](#msg5f2ee71fe20413052e74d48d)It's fixed now :D**  
**Thank you for your feedback! 🙏**

****Wednesday 19th August, 2020****

**ams02468**

**[02:29](#msg5f3c8e8b78f4a801801285d1)how i can clear screen in red ? {clear screen code}**

**[02:34](#msg5f3c8fa43dac53434017770f)i have problem for cmpile this is my code is simpel just test script**

**[02:34](#msg5f3c8fa6efafab7e3a83204a)Red \[]**  
**refinements: /off**  
**number: 5**  
**ams1: \["ams" "gdi" "nod" "mod"]**

**forever [**

**if number = 0 \[break]**  
**print \[{you have } number {chanse}]**  
**ams: ask "enter username:"**  
**if find ams1 ams \[ ]**  
**true number: number - 1**

**]**

**[02:35](#msg5f3c8fdfa8c17801765a8a06)error Compiling C:\\Users\\ \\Documents\\red\\test3.red ...**  
**\*\** Compilation Error: undefined word ask**  
**\*\** in file: C:\\Users\\ \\Documents\\red\\test3.red**  
**\*\** near: [ask "enter username:"**  
**if find ams1 ams \[]**  
**true**  
**]**

**wallysilva**

**[02:49](#msg5f3c931c07c30d132a9828a5)You need to add the `input.red`script to your code with something like `#include %red-source\environment\console\CLI\input.red`**

**[02:50](#msg5f3c9366ef8d4e243b496930)In my example, `red-source` is the folder where Red's source code is located**

**ghost~5e8b79d7d73408ce4fdf7e25**

**[20:23](#msg5f3d8a3eefafab7e3a85bdca)About to head to work, but is there anything I can read about live-coding / hot-code-reloading in Red? Like how possible is this-- I see that the gui system allows this, but it's not clear to me if this is a language feature or clever engineering on 'view's end**

**9214**

**[20:51](#msg5f3d90ca3dac5343401a2af2)@jsgrant there's no View-specific clever engineering, it's a synergy of language features, with venerable homoiconicity being the main working horse.**

**dander**

**[20:52](#msg5f3d911b3dac5343401a2bb1)@jsgrant have you already seen this blog post? https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html**

****Thursday 20th August, 2020****

**ams02468**

**[02:04](#msg5f3dda1ba8c17801765df08e)now i have this error**

**[02:04](#msg5f3dda1b5d0f8f244080da9e)Compiling to native code...**  
**\*\** Compilation Error: undefined symbol: init-console**  
**\*\** in file: %/C/Users/Red%20Q/Desktop/red-master/environment/console/CLI/input.red**  
**\*\** in function: exec/terminal/setup**  
**\*\** at line: 338**  
**\*\** near: [**  
**init-console**  
**]**

**9214**

**[02:13](#msg5f3ddc66e51e854133987661)@ams02468 what version of the toolchain are you using, and how do you compile your script? Also, please format code snippets using Markdown, you can find a cheatsheet \[here](https://gitter.im/red/red/welcome#markdown).**

**ams02468**

**[04:39](#msg5f3dfe6d33878e7e602e81bf)i use input.red**

**[04:40](#msg5f3dfeb08b8d4f633e02705e)and also red -c -r -t MSDOS for compile**

**[04:41](#msg5f3dfee133878e7e602e83ae)Red \[]**  
**number: 5**  
**#include %red-master\\environment\\console\\CLI\\input.red**  
**ams1: \["ams" "gdi" "nod" "mod"]**

**forever [**

**if number = 0 \[break]**  
**print \[{you have } number {chanse}]**  
**ams: ask "enter username:"**  
**if find ams1 ams \[ ]**  
**true number: number - 1**

**]**

**ghost~5e8b79d7d73408ce4fdf7e25**

**[05:29](#msg5f3e0a513dac5343401b5293)Back from work ... finally; @dander I have not; Just watched that gif linked in that post though and so-dang-cool! This kind of a system in a game-engine / 3D (maybe VR-centred) environment, would be a dream.**

**[05:33](#msg5f3e0b0e33878e7e602e9f37)@9214 Is it also like what I assume must be reflection in the prototype 'object' system, or?**

**mxdpeep**

**[10:18](#msg5f3e4de98b8d4f633e03381c)Hi!**

**[10:18](#msg5f3e4dfb5d0f8f244081fa41)I am missing a point how to run latest Red builds under Linux**

**[10:26](#msg5f3e4fec3dac5343401c10b4)/root/.red/console-2020-8-20-31013: symbol lookup error: /root/.red/console-2020-8-20-31013: undefined symbol: gtk\_menu\_popup\_at\_pointer**

**[10:32](#msg5f3e51538b8d4f633e034132)I am using: apt-get install libgtk-3-dev**

**9214**

**[11:44](#msg5f3e622d3dac5343401c3f86)@jsgrant sorry, I don't quite follow what you mean by that. Red supports reflection and has prototype-based objects, yes, but none of that is related to live-coding and hot code reloading.**

**endo64**

**[11:45](#msg5f3e6240a05e464346d8b5d4)@mxdpeep Did you check the steps https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development ?**

**mxdpeep**

**[11:52](#msg5f3e63f6e51e85413399bed4)https://github.com/rcqls/docker-red-gtk/blob/master/Dockerfile Page Not Found**

**endo64**

**[11:54](#msg5f3e6474ee58011680baee87)This one? https://github.com/rcqls/docker-red-gtk/tree/master/Distribs/Devel-GTK**

**mxdpeep**

**[11:55](#msg5f3e64b3ee58011680baef0e)so not usable with builds?**

**[11:55](#msg5f3e64c885c0f2132fde71c9)I don't want to build GTK, I just want to run latest Red CLI**

**[12:01](#msg5f3e662707c30d132a9ce33a)docker build -t rcqls/red-gtk https://github.com/rcqls/docker-red-gtk.git#:/Distribs/Ubuntu**  
**fails on TZ DATA**

**[12:01](#msg5f3e6632ef8d4e243b4e22ca)this is really fucked &gt;:{**

**9214**

**[12:09](#msg5f3e67f478f4a80180174067)@mxdpeep see \[here](https://www.reddit.com/r/redlang/comments/dzobh0/latest\_gtk\_build/f89biz3/).**

**[12:11](#msg5f3e6856750a274130304d57)&gt; I don't want to build GTK, I just want to run latest Red CLI**

**Then grab \[the latest build](https://www.red-lang.org/p/download.html) or compile from sources. GTK branch was merged yesterday AFAIK.**

**[12:13](#msg5f3e690207c30d132a9ceb3e)@ams02468 the compilation flags that you pass are mutually exclusive. Use `-r` only.**

**Senenmut**

**[19:03](#msg5f3ec91685c0f2132fdfa5fd)wanted**

**[19:06](#msg5f3ec99f07c30d132a9e1255)wanted : a dangerous programmer in red.**

**[19:06](#msg5f3ec9cbe51e8541339af99b)i forgot the name , does anyone just know it ?**

**[19:37](#msg5f3ed0fbe51e8541339b0f3b)i**

**[20:11](#msg5f3ed8fd07c30d132a9e3c79)i arnold**

****Friday 21st August, 2020****

**panvoirjy\_gitlab**

**[02:53](#msg5f3f3735efafab7e3a8a2963)does anyone managed the comunity?**

**9214**

**[11:36](#msg5f3fb1d44823780937331243)@panvoirjy\_gitlab of course.**

**xmonader**

**[23:25](#msg5f4057db9566774dfe242cba)is autocompletion broken in the vscode plugin? I keep getting**  
**`[Info - 1:23:59 AM] Connection to server got closed. Server will restart. [Info - 1:24:00 AM] Connection to server got closed. Server will restart. [Info - 1:24:00 AM] Connection to server got closed. Server will restart. [Info - 1:24:01 AM] Connection to server got closed. Server will restart. [Error - 1:24:02 AM] Connection to server got closed. Server will not be restarted.`**

****Saturday 22nd August, 2020****

**ALANVF**

**[17:41](#msg5f4158d6765d633c54a73536)@xmonader I used to get that constantly a while back. try using a newer build of Red, and it should theoretically work**

**xmonader**

**[23:07](#msg5f41a52c482378093737f623)&gt; @xmonader I used to get that constantly a while back. try using a newer build of Red, and it should theoretically work**

**isn't the latest 0.64?**

**[23:09](#msg5f41a5a0c3aa024ef994ae60)@ALANVF I redownloaded the 0.64 bin again but still the problem stands**

**9214**

**[23:09](#msg5f41a5b549148b41c9673478)@xmonader type `about` in the console and paste the output here.**

**xmonader**

**[23:21](#msg5f41a888ddc2d041c0beac76)fyi doing red-latest got me into that**  
**`➜ bin ./red-latest Compiling compression library... Compiling Red console... /home/xmonader/.red/console-2020-8-21-74203: error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory`**  
**and for 0.6.4**  
**`➜ bin ./red64 Compiling compression library... Compiling Red console... --== Red 0.6.4 ==-- Type HELP for starting information. >> about Red 0.6.4 for Linux built 22-Nov-2018/2:40:38+02:00 commit #755eb94`**

**[23:21](#msg5f41a88f5580fa092b18eb42)@9214**

**[23:23](#msg5f41a8e489cf2d584b6d008f)and also for libgtk 3**  
**`➜ wspace find /usr -name 'libgtk-3.so.0' /usr/lib/x86_64-linux-gnu/libgtk-3.so.0`**

**9214**

**[23:25](#msg5f41a97f5580fa092b18ed19)@xmonader you need a 32-bit version of `libgtk-3`. See \[here](https://github.com/rcqls/reds/blob/master/README-RedGTK.md) for instructions.**

**xmonader**

**[23:27](#msg5f41a9cb59ac794e02bcf0ce)I see, and for the 0.6.4 one? and the original error or i should go with red-latest?**

**9214**

**[23:29](#msg5f41aa719566774dfe274cef)@xmonader note that `0.6.4` is almost 2 years old. I think VSCode extension was updated to work with the latest build (to leverage the new lexer), so you should stick with it.**

**xmonader**

**[23:31](#msg5f41aad149148b41c9674044)@9214 I moved the binary to the path instead of the old one, restarted vscode**  
**`Gtk-Message: 01:30:56.716: Failed to load module "appmenu-gtk-module" [Info - 1:30:57 AM] Connection to server got closed. Server will restart. Gtk-Message: 01:30:57.563: Failed to load module "appmenu-gtk-module" [Info - 1:30:58 AM] Connection to server got closed. Server will restart. Gtk-Message: 01:30:58.176: Failed to load module "appmenu-gtk-module" [Info - 1:30:58 AM] Connection to server got closed. Server will restart. Gtk-Message: 01:30:58.766: Failed to load module "appmenu-gtk-module" [Info - 1:30:59 AM] Connection to server got closed. Server will restart. Gtk-Message: 01:30:59.292: Failed to load module "appmenu-gtk-module" [Error - 1:30:59 AM] Connection to server got closed. Server will not be restarted.`**

**[23:32](#msg5f41aaf336e6f709fdf71f3b)**  
**`➜ redlang which red64 /home/xmonader/.local/bin/red64 ➜ redlang red64 aGtk-Message: 01:31:43.841: Failed to load module "appmenu-gtk-module" bo--== Red 0.6.4 ==-- Type HELP for starting information. >> about Red 0.6.4 for Linux built 21-Aug-2020/22:36:27+02:00 commit #b3a77d3`**

**9214**

**[23:33](#msg5f41ab52a5788a3c29a75370):point\_up: maybe @bitbegin or @qtxie can comment on that.**

**xmonader**

**[23:34](#msg5f41ab745580fa092b18f11a)@9214 thank you so much for your help so far**

**9214**

**[23:34](#msg5f41ab8a9bad075eacce5360)@xmonader no problem, you are welcome!**

****Sunday 23th August, 2020****

**qtxie**

**[09:44](#msg5f423a6836e6f709fdf85ed7)@xmonader The latest build of Red cannot work with the VSCode extension. @bitbegin has been working on the newer version of the VSCode extension. It will be released next week.**

**xmonader**

**[13:30](#msg5f426f6c36e6f709fdf8dd5b)@qtxie thank you :)**

****Monday 24th August, 2020****

**wallysilva**

**[20:53](#msg5f4428b3a5788a3c29ad9a1e)@qtxie That's great news! Thank you, @bitbegin!**

****Tuesday 25th August, 2020****

**ams02468**

**[09:29](#msg5f44d9e2d4f0f55ebbdc80b6)How can I clear the command panel without using {Control + L}**

**[09:29](#msg5f44d9e649a1df0a12a60467)?**

**rebolek**

**[09:51](#msg5f44df3b5580fa092b210455)@ams02468 I don't think it's supported currently.**

**ams02468**

**[10:14](#msg5f44e47f49a1df0a12a62120)So how can I delete a line script? (console)**

**rebolek**

**[10:18](#msg5f44e58a89cf2d584b751c9c)if you want to clear screen on Linux/macOS, you can do for example `print "^[[2J^[[H"`. I'm not sure how to do this on Windows.**

**henrikmk**

**[13:26](#msg5f45118a5580fa092b2192cc)IMHO, the Windows version should support**  
**`print "^L"`.**

**toomasv**

**[13:30](#msg5f45127489cf2d584b75949b)@ams02468 May be `gui-console-ctx/terminal/clean`**

****Wednesday 26th August, 2020****

**ams02468**

**[07:41](#msg5f46122eddc2d041c0c9f0a9)this code work on console terminal but not work in script**

**[09:26](#msg5f462adb49148b41c972f271)this is example tutorial of red how i can complie it in windwos**

**[09:27](#msg5f462ae649148b41c972f28b)Red \[]**  
**user: \[ask] "Username (iwu83): "**  
**pass: \[ask] "Password (zqo72): "**  
**either all \[user = "iwu83" pass = "zqo72"] [**  
**print "Welcome back"**  
**] [**  
**print "Incorrect Username/Password"**  
**]**  
**\[ask] ""**

**9214**

**[12:14](#msg5f46522fdfaaed4ef50e9ce7)@ams02468 that was already answered to you by @wallysilva a while back. What's the show-stopper?**

**ams02468**

**[12:35](#msg5f46570189cf2d584b78fd4b)it does not work**

**[12:35](#msg5f46570749148b41c9736c18)\*\** Compilation Error: undefined symbol: init-console**  
**\*\** in file: %/C/Users/Red%20Q/Desktop/red-master/environment/console/CLI/input.red**  
**\*\** in function: exec/terminal/setup**  
**\*\** at line: 338**  
**\*\** near: [**  
**init-console**

**9214**

**[13:09](#msg5f465f0589cf2d584b791307)@ams02468 alright, are you compiling your script with an `-r` flag \*\*and\** without a `-c` flag? Here's an example script:**  
**`Red [File: %example.red] #include %./red/environment/console/CLI/input.red probe ask "? "`**  
**Here's how to compile it from Rebol2 prompt:**  
**`do/args %./red/red.r "-r example.red"`**  
**The same can be done from the system shell:**  
**`red -r example.red`**  
**And here's how it works:**  
**`$ example ? it works! "it works!"`**

**[13:17](#msg5f4660cc59ac794e02c940f7)Either way, your tutorial looks a bit strange: `ask` is never called in it because you wrapped it into a block. You probably want this:**  
**`Red [] #include %./red/environment/console/CLI/input.red user: ask "Username (iwu83): " pass: ask "Password (zqo72): " print either all [user == "iwu83" pass == "zqo72"][ "Welcome back" ][ "Incorrect Username/Password" ] input`**  
**Note that `==` is required to make a case-sensitive comparison between strings, otherwise `IWU83` or `IwU83` and `zQo72` with `Zqo72` are all valid username/password combinations.**

**Red-Beginner**

**[13:19](#msg5f4661504823780937440dab)Shouldn't you use = instead of == ?**

**9214**

**[13:22](#msg5f46621249148b41c973941c)@Red-Beginner if you want username and password to be case-insensitive:**  
**`>> "iwu83" = "IWU83" == true >> "iwu83" == "IWU83" == false`**

**ams02468**

**[14:07](#msg5f466c9f59ac794e02c96849)thx man this example is so good now is work ( mb ashamed)**

**Red-Beginner**

**[15:37](#msg5f4681bc49148b41c973f852)@9214 Thank you.**

****Thursday 27th August, 2020****

**225559**

**[09:10](#msg5f47787449a1df0a12ad5485)Hi, I'm interested in translating red/docs to Norwegian.**  
**1. How can I check if someone is already doing it?**  
**2. If it's up-for-grabs, how do I inform others that I'm doing it?**

**rebolek**

**[09:12](#msg5f4779055580fa092b282714)Hi @maksumic That's certainly a welcomed initiative!**  
**You can ask in https://gitter.im/red/docs room and also inform others there you are doing it.**  
**Start by forking https://github.com/red/docs/ and if you have some chapter done, make a pull request**

**225559**

**[09:14](#msg5f47798049148b41c976918a)Thanks :)**

****Friday 28th August, 2020****

**ams02468**

**[13:35](#msg5f49082c36e6f709fd0a741a)Hi everyone I had a question, does red have a code to clean the command line screen like cls (cmd)or clear for console ?**

**endo64**

**[13:58](#msg5f490d90d4f0f55ebbe7ca9d)See https://github.com/red/red/wiki/%5BNOTES%5D-REPL-Tips-and-Tricks#cls for CLI console. For GUI console use `CTRL-L`.**

**ams02468**

**[14:38](#msg5f491702c3aa024ef9a7f8f5)@endo64 thx**

**Red-Beginner**

**[14:48](#msg5f49194a9566774dfe3aece3)@ams02468**  
**`print "^[[2J^[[H" ; MacOS print "^L" ; Windows`**

****Saturday 29th August, 2020****

**ams02468**

**[09:18](#msg5f4a1d74d4f0f55ebbea7c2a)how we can change consoles size**  
**in red console ? for example in cmd we use**  
**this code "mode con:cols=40 lines=10"**

**toomasv**

**[10:06](#msg5f4a28a6dfaaed4ef518aacc)@ams02468 In GUI console: `gui-console-ctx/terminal/windows/1/size: 800x600`**  
**I haven't worked much with CLI terminal.**

**ams02468**

**[17:14](#msg5f4a8d0649a1df0a12b5772b)@toomasv thx but i need CLI code How can I find the CLI code tutorial ?**

**9214**

**[17:27](#msg5f4a8ffc5580fa092b30172d)@ams02468 `call "mode con:cols=40 lines=10"`.**

****Sunday 30th August, 2020****

**ams02468**

**[09:40](#msg5f4b73f89566774dfe4098dc)thx @9214**

****Monday 31st August, 2020****

**ams02468**

**[10:02](#msg5f4ccabeec534f584fd2a74c)how i can hide words in ask command like this**

**[10:02](#msg5f4ccac949148b41c9846d8b)enter the password :\*\*\*\*\*\*\*\*\*\*\***

**[10:03](#msg5f4ccae2765d633c54c4e7f4)?**

**rebolek**

**[10:03](#msg5f4ccae8ec534f584fd2a7a2)`ask/hide "Enter the password:"`**

**ams02468**

**[10:05](#msg5f4ccb62a5788a3c29c40a72)i have this error == Script Error: ask has no refinement called hide**  
**\*\** Where: ask**  
**\*\** Stack: ask**

**rebolek**

**[10:05](#msg5f4ccb84a5788a3c29c40adb)@ams02468 You are probably using old version of Red**

**ams02468**

**[10:06](#msg5f4ccb9589cf2d584b89e089)0.6.4**

**rebolek**

**[10:07](#msg5f4ccbe05580fa092b35d4b3)try automated build instead of last stable https://www.red-lang.org/p/download.html**

**ams02468**

**[10:10](#msg5f4ccca4482378093754c5dc)@rebolek thx now work ;)**

**rebolek**

**[10:10](#msg5f4cccb349a1df0a12bb4329)@ams02468 you're welcome!**

**xmonader**

**[20:16](#msg5f4d5a8dd4f0f55ebbf34224)@bitbegin Hi are there any updates on the vscode plugin :) ?**

****Tuesday 1st September, 2020****

**bitbegin**

**[00:25](#msg5f4d94ffddc2d041c0ddf3cf)@xmonader now it works with latest cli-console**

**wallysilva**

**[00:45](#msg5f4d99bb765d633c54c77d94)Yay, it's working! Thanks, @bitbegin!**

**ams02468**

**[06:49](#msg5f4def0949a1df0a12be8118)how i can return on variable in red for exampel (in bacth script we use this)**

**[06:49](#msg5f4def0a49a1df0a12be811a):a**  
**echo hi**  
**:b**  
**echo bye**  
**goto a**

**dsunanda**

**[08:21](#msg5f4e049159ac794e02dd9fcd)@ams02468 Red - like many modern languages - does not have an (easily accessible) GOTO statement. Loops are formed using various constructs - eg FOREVER, UNTIL, WHILE, FOREACH, etc. Each of which repeats a bock of code until certain exit conditions are reached.**  
**Here's a sort-of equivalent of your code using FOREVER - it'll print Hi each time you press Enter, stopping only when you type "end":**  
**`forever [ print "hi" if "end" = input [print "bye" break] ]`**

**ams02468**

**[11:04](#msg5f4e2ac859ac794e02de0814)a: ask "enter username"**  
**b: ask "enter password"**

**now i need after b goback to a**

**rebolek**

**[11:05](#msg5f4e2b03d4f0f55ebbf55ec2)@ams02468 after you have password, you want username again? An endless loop? Do I understand it correctly?**

**dsunanda**

**[11:09](#msg5f4e2bffa5788a3c29c80f02)@ams02468 Try playing with something like this - where CHECK-CREDENTIALS will be your function that returns TRUE on valid username and password, FALSE otherwise:**

**[11:10](#msg5f4e2c1a482378093758ce8d)**  
**`until [ a: ask "enter username" b: ask "enter password" res: check-credentials a b if not res [print "Please try again"] res ]`**

**[11:19](#msg5f4e2e5249a1df0a12bf442d)@ams02468 If you are mainly used to writing scripts in DOS BATCH language, then you may not have come across any looping techniques other than GOTO and recursion. Here's a quick language-neutral tutorial on the richness of other ways to manage flow of control in a script:**  
**https://condor.depaul.edu/sjost/it236/documents/structured.htm**

**ams02468**

**[11:20](#msg5f4e2e875580fa092b39d864)i no need endless loop in need just if pass wrong back to username**

**[11:21](#msg5f4e2ecc9bad075eacef34fc)i try to convert my batch script to red**

**rebolek**

**[11:35](#msg5f4e31fe9566774dfe4874a2)If you can post your batch script here, people may help you with the conversion.**

**ams02468**

**[11:47](#msg5f4e34cac3aa024ef9b55f01)is to long cod**

**rebolek**

**[11:49](#msg5f4e352f89cf2d584b8e1487)I understand. Just the relevant part should be fine, but @dsunanda gave you great advice, so you should be able to convert it. Ask any questions if you're not sure what to do, we'll be happy to help.**

**ams02468**

**[13:24](#msg5f4e4b9349148b41c988e9ec)this is my red script i need if pass wrong back to user**

**[13:24](#msg5f4e4b93d4f0f55ebbf5c200)number: 5**  
**ams1: \["ams" "gdi" "nod" "mod"]**  
**forever [**

**if number = 0 \[break]**  
**call/console pick \["cls" "clear"] 'Windows = system/platform**  
**print \[{you have } number {chanse}]**  
**ams: ask "enter username:"**  
**if find ams1 ams [**  
**break]**  
**\[]**  
**true number: number - 1**  
**]**  
**;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\***  
**forever [**

**if number = 0 \[break]**  
**call/console pick \["cls" "clear"] 'Windows = system/platform**  
**print \[{you have } number {chanse}]**  
**ams11: ask/hide "enter password:"**  
**if find ams1 ams11 [**  
**call/console "cls"**  
**print append "welcome " ams11**  
**break ]**  
**\[]**

**]**

**dsunanda**

**[13:34](#msg5f4e4dca48237809375931e4)@ams02468 Thanks - that works! - although you need to comment out the CALL/CONSOLE lines. I would guess that you either want to just use the Red console.....Or take the Red pill and use VIEW (find out how deep the redbit hole goes :)**

**ams02468**

**[15:39](#msg5f4e6b2536e6f709fd18da5e)I just want to use the red console**

**dsunanda**

**[16:49](#msg5f4e7b8c482378093759c699)@ams02468 Then remove the CALL/CONSOLE commands, and you should have some working code :)**

**xmonader**

**[23:57](#msg5f4edff189cf2d584b901359)@bitbegin thank you!! will test and give feedback!**

****Wednesday 2nd September, 2020****

**dsunanda**

**[07:46](#msg5f4f4dea89cf2d584b911f10)@ams02468 Here's some slightly more Red-ish way of converting your BATCH script to Red. It defines a FUNCTION (sub-routine) to get the credentials (user-name and password). Then it calls that function, and checks the result. Not quite the same as your code - it gives them 5 chances for each of the username and password entries:**  
**`get-credentials: func [/local username password ams1][ ams1: ["ams" "gdi" "nod" "mod"] loop 5 [ if find ams1 username: ask "enter username:" [break] username: none ] if none? username [return none] loop 5 [ if find ams1 password: ask/hide "enter password:" [break] password: none ] if none? password [return none] return reduce [username password] ] creds: get-credentials if none? creds [print "bye!" halt] print ["Welcome" creds/1]`**

**ams02468**

**[10:55](#msg5f4f7a1559ac794e02e1a6a0)@dsunanda thanks**

****Thursday 3th September, 2020****

**225559**

**[15:02](#msg5f5105695580fa092b41c91c)Is making a new website for red-lang.org high on the to-do list? The website is currently powered by Blogger, which looks a little unprofessional and makes it a bad first impression.**

**rebolek**

**[15:08](#msg5f51070136e6f709fd20296c)There is a new webpage in works.**

****Friday 4th September, 2020****

**ams02468**

**[12:49](#msg5f5237c1dfaaed4ef52e6f1e)how rename dir in red ?**

**toomasv**

**[13:17](#msg5f523e5eec534f584fe1c41f)#4307**

**dsunanda**

**[13:47](#msg5f524587d4f0f55ebb009667)One way to do renaming right now is use CALL to use your operating system's rename command. This code below is how to do it under Windows (res = 0 means it worked; other values should have an error message in res-err):**  
**`curr-name: %old-name.txt new-name: %new-name.bin res-err: copy "" res: call/error rejoin ["ren " to-local-file curr-name " " to-local-file new-name] res-err print [res res-err]`**

**ams02468**

**[14:01](#msg5f5248b59566774dfe539d26) i whant rename some folder to this " " (alt+0160)**

**dsunanda**

**[15:32](#msg5f525e1a9566774dfe53dd0e)Try this - again the CALL assumes we are under windows. Note the MOLD - that's to stop the DOS command line from misparsing the special character:**  
**`curr-name: %old-name/ new-name: to-file to-char 160 res-err: copy "" res: call/error rejoin ["ren " to-local-file curr-name " " mold to-local-file new-name] res-err print [res res-err]`**

**ams02468**

**[20:12](#msg5f529f9449a1df0a12cb89f0)@dsunanda thx**

****Sunday 6th September, 2020****

**ams02468**

**[12:33](#msg5f54d70ddfaaed4ef53496b4)hi guys i need convert this code to red**

**[12:33](#msg5f54d70e49148b41c999e148)for /f "tokens=2,\*" %%a in ('reg query "HKCU\\Software\\windows shell\\windows shell" /v "use" ^| findstr /c:"use"') do (**  
**set data=%%b**

**[12:34](#msg5f54d75ba5788a3c29d91b74)this code check registry {"HKCU\\Software\\windows shell\\windows shell} and open user "string value" and copy data and paste in value name data**

**cloutiy**

**[13:42](#msg5f54e74989cf2d584b9f6dab)@ams02468 Have you tried to solve this problem yourself already? If so could you please post your code so others can point out how it could be improved. Trying first and getting feedback is the best way to learn.**

**Palaing**

**[14:59](#msg5f54f95889cf2d584b9f970f)just added a Red version of the "Amd operator" on http://rosettacode.org/wiki/Amb#Red . Sure there must be a more Red-idiomatic way to do it. Comments welcome.**

**dsunanda**

**[15:33](#msg5f55014259ac794e02ef8d6b)@ams02468 Red can't as yet directly access the Windows registry. As with RENAME, you could use CALL to shell out to REGEDIT to do the handling.**

**theSherwood**

**[20:24](#msg5f5545809566774dfe5a89ed)@Palaing that's cool! I'd never heard of that operator.**

**ams02468**

**[23:50](#msg5f5575bc9bad075eac01dcbe)hi guys i use cd in script and in compile i have some error**

**[23:50](#msg5f5575cb36e6f709fd2af067)Compilation Error: undefined word cd**  
**\*\** in file: c:\\Users\\test\\Documents\\red\\test2.red**  
**\*\** near: [**  
**cd %./**  
**call/console "attrib +h +r desktop.ini"**  
**cd ..**  
**call rejoin**

****Monday 7th September, 2020****

**toomasv**

**[03:21](#msg5f55a75349a1df0a12d27439)@Palaing Yes, well done! Took me a while to unravel it :)**

**endo64**

**[04:25](#msg5f55b64849148b41c99bd11c)@ams02468 try using`change-dir`. cd is only available on console.**

**ams02468**

**[11:03](#msg5f56139dd4f0f55ebb096810)@endo64 thank you**

**[11:38](#msg5f561bcaa5788a3c29dc2347)hi i need add value in `change-dir` for example**

**[11:38](#msg5f561bd2ddc2d041c0f3c23d)**  
**`test: test change-dir %./ test`**

**[11:39](#msg5f561be359ac794e02f23611)something like this**

**toomasv**

**[11:47](#msg5f561dd9dfaaed4ef537c778)**  
**`>> test: %subdir/ rejoin [%./ test] == %./subdir/ >> test: %file rejoin [%./ test] == %./file >> test: "whatever" rejoin [%./ test] == %./whatever`**

**ams02468**

**[11:53](#msg5f561f1c89cf2d584ba264a4)@toomasv thx**

**toomasv**

**[12:17](#msg5f5624db9566774dfe5cbb6a):+1:**

****Wednesday 9th September, 2020****

**ams02468**

**[22:41](#msg5f5959fd49148b41c9a59ced)guys hi how i can remove or hide command line in GUI ( after compile program and run , every time run command line in back ground)?**

**wallysilva**

**[22:44](#msg5f595ad536e6f709fd3570b6)You need to compile it for Windows: `red -c -t Windows your-script.red`**

**ams02468**

**[22:45](#msg5f595b00482378093775c38e)thx**

****Friday 11st September, 2020****

**ams02468**

**[03:33](#msg5f5aeffbb190f2328e665c92)hi guys how i can remove window's buttons like {close button - maximize} in CLI {after compile program }?**

**toomasv**

**[04:15](#msg5f5af9f3f969413294da1022)https://github.com/red/docs/blob/master/en/view.adoc#window**

**ams02468**

**[06:13](#msg5f5b159c89b38d09211e2842)i think (no-border , no-title and ...) work for GUI? not CLI**

**endo64**

**[21:18](#msg5f5be9bddf4af236f9ff9355)@ams02468 It works for windows you display, not related to GUI or CLI console: `view/flags [button "OK" [unview]] [no-title no-min no-max no-buttons]`**  
**Do you want to remove windows buttons from OS command line / shell window? I don't think this possible without using OS specific APIs.**

****Sunday 13th September, 2020****

**ams02468**

**[00:52](#msg5f5d6d6bf51808513b3cd1a1)@endo64 @toomasv thx for informations**

****Monday 14th September, 2020****

**ams02468**

**[06:05](#msg5f5f0823f969413294e42463)hi guys i try to run this code on red {batch script} `for /f "tokens=2,*" %%a in ('reg query "HKCU\Software\windows shell\windows shell" /v "pass1" ^| findstr /c:"pass1"') do ( set a=%%b )`**

**[06:06](#msg5f5f084da857200e6d5c2f50)but not work this is part of my script**

**`a: [] call/console rejoin [{for /f "tokens=2,*" %%a in ('reg query "HKCU\Software\windows shell\windows shell" /v "pass1" ^| findstr /c:"pass1"') do ( set} to-local-file a {=%%b )}] print a`**

**[09:08](#msg5f5f3311ea62d70e650efdf0)how i can convert this to string `^|` ?**

**rebolek**

**[09:09](#msg5f5f3343a9c2c8511e93df5e)@ams02468 you want those two letters as a string? `"^^|"` should be fine**

**ams02468**

**[09:10](#msg5f5f33784f19dd09334a87f5)@rebolek thx**

**rebolek**

**[09:12](#msg5f5f3412d993b837e061847d)you're welcome. As `^` is an escape character, it needs to be escaped itself.**

**toomasv**

**[10:45](#msg5f5f49c3c1d1a537059fda32)Or use raw-string representation `%{^|}%`.**

**ams02468**

**[21:38](#msg5f5fe2e689b38d09212a5347)hi guys pl look this simple code (just example)**  
**`set test=hi all`**  
**this is batch script value i wanna export the value data to the red value i try this but not work for me**  
**`set 'b "" call/console rejoin ["set "to-local-file b "=""hi all" ] print b`**

****Tuesday 15th September, 2020****

**endo64**

**[04:33](#msg5f604408b468994d0d2d17a9)Try `console/output`:**  
**`>> s: make string! 10 == "" >> call/output "echo test" s == 0 >> s == "test^/"`**

**ams02468**

**[06:26](#msg5f605e9f3651184d30f00bab)@endo64 thx**

**[06:27](#msg5f605eeab468994d0d2d51a5)how i can add " in value like this**  
**`a: """ a "`**

**rebolek**

**[06:28](#msg5f605f0c3651184d30f00cbf)**  
**`a: {"} a: "^""`**

**ams02468**

**[06:29](#msg5f605f38ea62d70e6511f9aa)@rebolek thx**

**rebolek**

**[06:39](#msg5f60619f5fde567ffa4a6a59)@ams02468 you're welcome! See how to escape strings here: http://www.rebol.com/docs/core23/rebolcore-16.html#section-2.11**

**ams02468**

**[08:48](#msg5f607fdbce5bbc7ffdc7176e)how i can run red script as admin?**

**rebolek**

**[08:49](#msg5f607ffea9c2c8511e973d9a)on Linux/macOS? Just run Red with `sudo`**

**ams02468**

**[08:51](#msg5f608076ce5bbc7ffdc718a0)i wanna run this code in script as admin**  
**`call/console {for /f "tokens=2,*" %a in ('reg query "HKCU\Software\windows shell\windows shell" /v "pass1" ^^| findstr /c:"pass1"') do ( setx ams=%b /m ) }`**

**rebolek**

**[08:51](#msg5f608094d993b837e064ed62)Ah, you're on Windows. Unfortunately, I don't know much about Windows, sorry.**

**ams02468**

**[08:52](#msg5f6080b75fde567ffa4acdcb)ok thx anyway**

**ne1uno**

**[08:59](#msg5f608286f51808513b44ab15)make shortcut including path to red path to script, right click run as admin? can change properties but it will still ask ok to run as admin**

**[10:18](#msg5f60950ca9c2c8511e978453)also blanks the screen like BSOD hard crash every time. thanks billy**

**Palaing**

**[19:52](#msg5f611b67f51808513b468d22)I like this one:**  
**`palindrome: [fn: fn-1 + fn-1: fn] fibonacci: func [n][ fn-1: 0 fn: 1 loop n palindrome ]`**

****Thursday 17th September, 2020****

**ams02468**

**[10:30](#msg5f633ab65fde567ffa522684)hi everyone i have problem for this every time i use \*\*output \*\***  
**`s: make string! 10 call/console/output {cd\ && for /f "tokens=2,*" %a in ('reg query "HKCU\Software\windows shell\windows shell" /v "pass1" ^^| findstr /c:"pass1"') do cmd /V /C "set ams=%b&& cls && echo !ams!" } s`**  
**in \*\*s\** value this is answer \*\*cmd /V /C "set ams=ams&amp;&amp; cls &amp;&amp; echo !ams!"**  
**ams\*\***  
**but without `output`true answer but i cant export value**  
**answer is \*\*ams\** (is value) i wanna export this to red value**

**endo64**

**[10:44](#msg5f633e0da9c2c8511e9e9ee5)Can you try to remove `console`?**

**ams02468**

**[11:01](#msg5f6341fac1d1a53705aaa68a)ye but nothing change**

**cloutiy**

**[12:17](#msg5f6353d389b38d0921336935)I'm not sure when this happened, but the interpreter is now providing more useful error messages (like line number). This is great.**  
**`1 Red [] 2 3 a: 1 4 b: module:fun 5 c: module\fun`**  
**Shows**  
**`*** Syntax Error: (line 5) invalid character at \fun *** Where: transcode *** Stack: do-file expand-directives load`**  
**I had been running the 0.64 stable I had downloaded when it first came out. But recently downloaded a nightly build. I think I should be doing that more often!**

**ams02468**

**[16:50](#msg5f6393c14f19dd0933564735)i think problem is this code \*\*cmd /V /C "set ams=ams&amp;&amp; cls &amp;&amp; echo !ams!"\** if i input the `call` `/output` script dont run the next code**  
**and out put code like value ( i need run the code and output answer the code as value)**

****Friday 18th September, 2020****

**endo64**

**[04:21](#msg5f6435c6f51808513b4ea3ef)What if you put that code into a .bat file and call it from Red?**

**ams02468**

**[04:41](#msg5f643a8ace5bbc7ffdd125a6)Do you mean to put the code inside a bat file and use red to execute it and then transfer the code answer to red?**

**[04:45](#msg5f643b7ece5bbc7ffdd12802)No, I can not risk this value because it is important for the program. I want everything to be done within the program.**

**[04:46](#msg5f643b91a857200e6d6a1b1e)Now I'm looking for a way to convert the `call` answer in red to value**

**endo64**

**[04:51](#msg5f643cb7df4af236f915400e)Yes that was what I mean.**  
**Why do you put the first `cmd` in the beginning? It creates another console in the background, it might be the cause.**  
**Did you try `set ams=ams&& cls && echo !ams!` ?**

**ams02468**

**[04:54](#msg5f643d85b468994d0d37d3bf)open your cmd and try this`set ams=ams&& cls && echo !ams!` dont work need \*\*cmd /V /C\*\***

**[04:55](#msg5f643dc9b468994d0d37d494)i try to use \*\*setx\** but need admin access**

**[05:00](#msg5f643ef24f19dd093358023a)Whether I use \*\*cmd\** or not, the `output` command does not work correctly**

**[05:17](#msg5f6442f25fde567ffa54e51b)@endo64 lock this code**  
**`for /f "tokens=2,*" %a in ('reg query "HKEY_CURRENT_USER\Environment" /v "TMP" ^| findstr /c:"TMP"') do cmd /V /C "set ams=%b&& cls &&echo !ams!"`**  
**this code open your regedit and \*\*TMP\** string data and put in on ams(value) you**  
**can use the code in cmd (this is just example) now try to export ams value to red (With output)(dont use %temp%)**

**[09:41](#msg5f6480ce603d0b37f43d3a21)how i can print part of value?**  
**`a:123456789`**  
**i wanna find 3 and 7 and print character between them**  
**(456)**

**rebolek**

**[10:10](#msg5f64878aa9c2c8511ea220d5)@ams02468 `a` is `integer!` in your code, so you first need to convert it to string, for example using `form` and then you can get part of of that:**

**[10:11](#msg5f6487c8c1d1a53705ae03c8)**  
**`>> a: 123456789 == 123456789 >> a: form a == "123456789" >> print copy/part next find a #"3" find a #"7" 456`**

**ams02468**

**[10:25](#msg5f648b135fde567ffa55989c)thx but now i need put 456 in value**

**rebolek**

**[10:25](#msg5f648b31b190f2328e7f38f6):)**

**[10:26](#msg5f648b48a857200e6d6ae7b8)So instead of `print`, just assign it some value:**  
**`b: copy/part next find a #"3" find a #"7"`**

**ams02468**

**[10:26](#msg5f648b5cf51808513b4f794b)thx you are my hero XD**

**rebolek**

**[10:27](#msg5f648b81a857200e6d6ae7fc)documentation should be your hero ;-)**

****Saturday 19th September, 2020****

**ams02468**

**[05:23](#msg5f6595e73651184d30fdfd22)hi guys**  
**`;register username: ask "enter username:" pass: ask "enter pass:" delpass: ask "enter delete password:" ;login forever [ a: ask "enter username:" if a = username [print "hi" break] if a = delpass [ clear username clear pass clear delpass break ] ]`**  
**i wanna if he use \*\*delpass\** clear data account and back to register i need help**

**ne1uno**

**[06:34](#msg5f65a6584f19dd09335b7a78)@ams02468 you need 2 loops, some kind of state machine. lookup redbyexample for clues. about your earlier question: put `set` on line by itself. run in cmd and see when you add `&&` set is ignored. `echo %ams%` is what shows env vars not `echo !ams!` you can show call error output too.**

**dsunanda**

**[08:01](#msg5f65badba857200e6d6dd27f)@ams02468 Try this - it uses UNTIL rather than FOREVER. UNTIL \[...] runs until the last line in the \[...] block evaluates to TRUE:**

**`;register until [ username: ask "enter username:" pass: ask "enter pass:" delpass: ask "enter delete password:" ;login until [ a: ask "enter username:" find reduce [username delpass] a ] a = username ] print "hi"`**

**ams02468**

**[08:05](#msg5f65bbe63651184d30fe5375)@dsunanda @ne1uno thx guys**

****Sunday 20th September, 2020****

**Tovim**

**[18:23](#msg5f679e2df51808513b56d4ce)A little bit unexpected result for me:**  
**`>> nom: make paren! 5 == ( ) >> insert nom 5 * 3 "prý" 2 + 7 == 9 >> nom == (15)`**  
**Why (15) not 9? Thank you VM.**

**endo64**

**[18:28](#msg5f679f4bc1d1a53705b54864)Because it is evaluated as `(insert nom 5 * 3) "prý" 2 + 7`**  
**You can change it as you like: `insert nom (5 * 3 "prý" 2 + 7)` then it will be 9 (the last value in the paren).**

****Monday 21st September, 2020****

**Tovim**

**[15:30](#msg5f68c716603d0b37f44752fb)I see: insert needs a series! type as an argument. Thank you!**

****Tuesday 22nd September, 2020****

**ams02468**

**[09:00](#msg5f69bd2c0b5f3873c9e5da72)how can red script run itself ?**

**rebolek**

**[09:02](#msg5f69bd9a4002c640b5dc7a1e)With `do` or `#include`:**

**Let's have a file `%script.red`:**  
**`Red[] print "Now I will run itself" do %script.red`**  
**And `do %script.red` in console. You will end with endless loop.**

**ams02468**

**[09:04](#msg5f69be2aaaff36059b4c1c8d)no no like value in batch script we use this code `start "" "%~0"`**

**rebolek**

**[09:07](#msg5f69bedd6e85e0058c49e692)I see. The script info should be in `system/script` but it's not implemented yet.**

**ams02468**

**[09:09](#msg5f69bf2fe1dd7c19548a2f3f)ok So how can I get my file name now?**

**rebolek**

**[09:10](#msg5f69bf981c5b0d210ac35b25)I am afraid unless you hardcode it in your script you can't currently.**  
**Add something like**  
**`script-name: %myscript.red`**  
**to your script as a workaround and use this value.**

**ams02468**

**[09:12](#msg5f69bfff8fe6f11963537bf0)@rebolek thx**

**rebolek**

**[09:14](#msg5f69c05ff41f4105e4cd3e42)you're welcome**

**ne1uno**

**[09:31](#msg5f69c45b0b5f3873c9e5ed72)`system/options/script` might be different compiled**

**[09:35](#msg5f69c5555b75b305ddb9e533)I've been using it to add self running tests when I call the script directly. ignored when included. like python `__main__` `if find system/options/script "myscriptf.red" []` but do hardwire script name**

**dsunanda**

**[09:35](#msg5f69c55ee1dd7c19548a3d0f)@ams02468 Is this close to what you want?**  
**Save this as a file called test-name.red:**  
**`Red [] print ["script is called" system/script/args]`**  
**Then run it from the Windows command line like this:**  
**`red --script test-name.red test-name.red`**

**ams02468**

**[11:55](#msg5f69e62a5a56b467a5e1d0d4)let me show you example**  
**`echo off echo "%~0" pause`**  
**this code in batch file show itself if you change batch file name and path**  
**that can find and show every time is run. i need something like this**

**dsunanda**

**[14:38](#msg5f6a0c59b39cb873c0777900)Something like this then - assuming the initial source is called test-name.red:**  
**`Red [needs: 'view] alert system/options/boot call/shell/show system/options/boot`**  
**Compile it under windows with this command line, and then execute the resultant test-name.exe:**  
**`red -r -t Windows test-name.red`**

**ams02468**

**[15:18](#msg5f6a15bfaaff36059b4d0597)ye something like this but i need for CLI and i need run itself**

****Wednesday 23th September, 2020****

**luvattula**

**[06:16](#msg5f6ae83c6e85e0058c4cee43)Any Docs about paraller computation or threads ? One can read in many sources 'Provides a strong support for Concurrency and Parallelism (actors, parallel collections etc.)' .**

**endo64**

**[10:03](#msg5f6b1d5cefefe620f2434498)@luvattula It is on the roadmap. Not completed yet.**

**dander**

**[17:06](#msg5f6b80960b5f3873c9ea8f0b)@luvattula The high level task list is over here: https://trello.com/b/FlQ6pzdB/red-tasks-overview**

**ushakovs\_gitlab**

**[21:38](#msg5f6bc038aaff36059b515fb2)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/HIyk/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/HIyk/image.png)**

**[21:38](#msg5f6bc0604002c640b5e1e939)Is task list outdated?**

**dander**

**[22:01](#msg5f6bc59c1c5b0d210ac8c66e)It could be a little bit. It seems to get tidied up from time to time**

****Thursday 24th September, 2020****

**luvattula**

**[06:25](#msg5f6c3bf61c5b0d210ac9d117)&gt; @luvattula The high level task list is over here: https://trello.com/b/FlQ6pzdB/red-tasks-overview**

**Thnaks, well, may take som etime still... I had in my my mind multi-core software 3d-engine. Is there a way to integrate opengl ?**

**theSherwood**

**[06:30](#msg5f6c3cff5a56b467a5e7d7f2)Someone's got a repo with Red bindings to opengl or vulkan. But I can't remember where it is.**

**[06:39](#msg5f6c3f0a6e85e0058c50628e)Oh, here it is: https://github.com/red/code/tree/master/Library**

**[06:39](#msg5f6c3f204002c640b5e310ae)@luvattula Also this: https://github.com/ldci/glfw-red**

****Monday 28th September, 2020****

**wasamasa**

**[15:13](#msg5f71fdaeefefe620f2547fba)Hello, I remember seeing a community project providing a serialization/configuration dialect kind of like JSON/YAML**

**[15:13](#msg5f71fdb3e1dd7c19549efc55)It wasn't REDbin, that's for sure**

**9214**

**[15:19](#msg5f71feed5efe9467b11fe363)@wasamasa that kinda describes Red itself, as a serializable data format.**

**wasamasa**

**[15:20](#msg5f71ff388fe6f11963686cee)Sure, but I remember it as community project, with a light green background on its web page**

**[15:20](#msg5f71ff4ab39cb873c08b68f1)It struggled describing itself as that, too**

**[15:20](#msg5f71ff531c5b0d210ad8246c)So maybe it was for something entirely different after all**

**9214**

**[15:23](#msg5f71ffecf41f4105e4e21db7)@wasamasa perhaps it was \[Ren](https://pointillistic.com/ren/) which IIRC @greggirwin authored? It was conceived as an umbrella term and specification for data format of Rebol-like languages.**

**wasamasa**

**[15:24](#msg5f7200334002c640b5f14574)Yes indeed, thanks**

**[15:25](#msg5f720055b8a99f4519b1b24d)So what is it, textual serialization format?**

**9214**

**[15:25](#msg5f72006c8fe6f11963686fcf)Yes.**

**&gt; Ren is a lightweight data-exchange text format.**

**wasamasa**

**[15:25](#msg5f72007ef41f4105e4e21fc9)Doesn't look finished**

**9214**

**[15:28](#msg5f72011e417bf140aa1b2998)Well, it has at least 4 known implementations (Rebol2, Rebol3, Red and Red/System), and so looks quite finished to me :wink: maybe not in body but in spirit.**

**wasamasa**

**[15:29](#msg5f72014daaff36059b60f281)I mean things like the implementations list pointing to languages without an implementation and the blank links to other tooling at the bottom**

**[15:29](#msg5f7201594002c640b5f1485e)It gives it a feeling of hot air**

**9214**

**[15:31](#msg5f7201e66a6e094525c08826)I suppose these are meant to be placeholders. @greggirwin can elaborate if needed.**

**greggirwin**

**[18:05](#msg5f7225cc5b75b305ddcf143a)The current, very old, Ren pages are incomplete. I didn't push forward with it due to the various Rebol forks and not knowing what direction Red would go with some forms. Then I just didn't have time to spend on it. Maybe next year. :^)**

**[18:06](#msg5f722619e1dd7c19549f7cfd)There is always a risk of putting things out for discussion purposes.**

**jflipp**

**[21:51](#msg5f725ad28fe6f11963697e53)Hi!**  
**I discovered Red a few days ago.**  
**I find all this ... interesting. :-)**  
**I have a question.**  
**I use Red on Windows.**  
**When I run red-064.exe for the first time, I get some output**  
**Compiling &lt;this&gt; ...**  
**Compiling &lt;that&gt; ...**  
**And it takes a few moments before the GUI console appears.**  
**But on subsequent runs of red-064.exe, the GUI console appears (almost) immediately, without the "Compiling ..." output.**  
**Now I wonder what's exactly happening on the first run of red-064.exe?**  
**I have a basic idea about what is being compiled (some GUI code, and more).**  
**But where is the compilation result stored?**  
**Why is compilation no more necessary on subsequent runs of red-064.exe?**  
**What does the compilation change?**  
**I couldn't find any hidden folders created by this compilation process.**  
**Also, the binary red-064.exe is not altered by the compilation process, as far as I can tell.**  
**Could somebody please enlighten me?**  
**Thanks!**

**greggirwin**

**[22:59](#msg5f726ac4b39cb873c08c9a8d)Welcome @jflipp ! When you first run Red, without command line args, it builds the console (REPL) locally and stores it in %programdata%\\Red (e.g. C:\\ProgramData\\Red). On future runs, if the Red binary hasn't changed, it uses the existing console. If you get a new version, it builds a new console.**

**We plan to change the download in the future, so you'll get the REPL, and can then get the compiler. That will help new people get started, and not suffer the initial delay when they are anxious to try Red. :^)**

****Tuesday 29th September, 2020****

**ALANVF**

**[01:13](#msg5f728a3faaff36059b625d9c)@greggirwin / @wasamasa re: Ren, I have a (fairly) similar project on my GH if you're interested (yes, it does work): https://github.com/ALANVF/reon**

**[01:16](#msg5f728afe4002c640b5f2c6fc)I've personally been using it for writing vscode grammars, but it can really be used for anything**

**[01:16](#msg5f728b005a56b467a5f7d317)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/3xpB/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/3xpB/image.png)**

**greggirwin**

**[02:25](#msg5f729b230b5f3873c9fc5e6d)Thanks @ALANVF. :+1:**

****Monday 19th October, 2020****

**ams02468**

**[22:20](#msg5f8e1138631a250ab27ccb3b)How can I run the files (txt , exe, and etc) in red?**

****Tuesday 20th October, 2020****

**endo64**

**[04:27](#msg5f8e672b631a250ab27d86da)@ams02468 You can use `call` for executables and batch scripts. it would open txt files with associated application. if your txt file is a Red script then you can `do` it.**

**ams02468**

**[05:47](#msg5f8e79faea6bfb0a9a477171)thx @endo64**

**[23:53](#msg5f8f786961007f7d1b842789)hi guys i need help to convert this to red**  
**`echo off set a="%~0" call %a% exit`**

****Wednesday 21st October, 2020****

**greggirwin**

**[04:02](#msg5f8fb2d557fe0a4f30236ea9)@ams02468 what have you tried so far? Using the console is best, so you can play and explore. See what `system/script/args` returns, if you need to use command line parameters. Use `help call` to see what that function takes. And learn how to set words to refer to values. e.g. `a: "Hello!"` Also be sure to look at the \[`file!`](https://github.com/red/docs/blob/master/en/datatypes/file.adoc) datatype.**

**ams02468**

**[04:35](#msg5f8fba7fc7ef520fffb4621e)i try this options**  
**1.**

**`a: system/script/boot call a exit`**  
**2**

**`a: system/script/boot call/console rejoin [{call } to-local-file a] exit`**  
**3**

**`a: system/script/boot call/console rejoin [{start} to-local-file a] exit`**  
**but none work for me**

**endo64**

**[06:35](#msg5f8fd6bb7be0d67d27884bbc)`exit` should not be there, it can be used in a function body for early exit. You can put `quit` or nothing instead.**  
**There is no `boot` in `system/script`, it is in `system/options`.**

**`SYSTEM/SCRIPT is an object! with the following words and values: title none! none header none! none parent none! none path none! none args string! "" >> ? system/options SYSTEM/OPTIONS is an object! with the following words and values: boot string! {C:\Users\endo\Projects\Red\red\console.exe} home none! none path file! %/C/Users/endo/Projects/Red/red/ script none! none`**

**greggirwin**

**[17:16](#msg5f906cf47be0d67d2789dac8)@ams02468 this is me poking around in the console... (with comments added)**  
**``>> system/script/boot *** Script Error: cannot access boot in path system/script/boot *** Where: catch *** Stack: (There's no system/script/boot, so I need to use something else.) >> system/options/boot == {C:\ProgramData\Red\gui-console-2020-10-18-62609.exe} (I'm in the console, so this makes sense. Can I CALL it?) >> call system/options/boot == 33516 (Yes, but nothing happens. Hmmm.) >> ? call USAGE: ... /show ... (Ah, there's a `/show` refinement, maybe I need that.) >> call/show system/options/boot == 36784 (Yes, there it is.) >> exe: system/options/boot == {C:\ProgramData\Red\gui-console-2020-10-18-62609.exe} >> call/show exe == 3228 (Still works, using a word to refer to the boot exe) >> call/show rejoin ["start " exe] == 40948 (Still seems to work)``**  
**Just going step by step, confirming that I know what each one is doing interactively. Now that I can see `help` for `call`, I can try the various refinements to see how they interact with the system, give me info back, etc.**

**Another approach is to say what it is you're trying to \*accomplish\*, as you may get different approaches and suggestions.**

**ams02468**

**[19:33](#msg5f908cefbbffc02b582f1b50)I want my file to be able to find and execute its own name even if its name is changed**

**greggirwin**

**[19:43](#msg5f908f49ea6bfb0a9a4cd438)Does `call system/options/boot` work for you? With `/console` if you need redirection.**

**Oldes**

**[20:13](#msg5f909672631a250ab2832ee5)@greggirwin @ams02468 don't you mean `call/shell system/options/boot` instead? Simple `call` opens Red as a background process.**

**ams02468**

**[20:21](#msg5f909864955f6d78a94325a4)after compile doesn't work**

**[20:51](#msg5f909f3fa0a3072b4397bb37)I used `do` in my script to run my file and reset the program. I know I have to use `call` after compiling, but I need to run it to find my file, like a variable. I'm looking for an example inside a bat script to use this variable "% ~ f0" I'm been looking for 1 month now**

**greggirwin**

**[21:55](#msg5f90ae52631a250ab28376bc)@rebolek maybe. We could use more examples \[here](https://github.com/red/red/wiki/%5BDOC%5D-Reference-Call), but I think it still holds for OS differences. I just did this, compiled, and ran from a DOS console:**  
**`Red [] print [now system/options/boot] wait 1 call/console system/options/boot`**  
**Correctly (repeatedly) called itself and printed until I stopped it.**

**[22:02](#msg5f90afff955f6d78a94367fb)View version:**  
**`Red [needs: View] view compose [ below text (form now) text 300 (form system/options/boot) button "Run me" [call/show system/options/boot] ]`**

****Saturday 24th October, 2020****

**tinulac-leinad**

**[09:11](#msg5f93efb6a0a3072b43a04844)HI,**  
**request/filter as non effect in a fresh red-gtk. does it work ?**

**[09:11](#msg5f93efb9955f6d78a94bdbad)THanks**

****Thursday 29th October, 2020****

**greggirwin**

**[18:45](#msg5f9b0de48d286f20767964c1)Can anyone running GTK answer this? :point\_up\_2:**

****Monday 2nd November, 2020****

**ams02468**

**[13:03](#msg5fa0038bd5a5a635f2971b2c)Hello everyone, how can I change the software icon for compilation?**

**rebolek**

**[13:04](#msg5fa003c72a35440715fddf16)Hi, IIRC you should put `icon: %path/to/icon.bmp` into the script header. Someone will certainly correct me if I got it wrong.**

**XANOZOID**

**[13:20](#msg5fa007882a60f731f72e05b7)@rebolek that's right - I'm not sure if bmp is supported but I would imagine for sure `.ico` is!**  
**But just to be a little clearer -&gt;**  
**`Red [ needs: View icon: %path/to/icon.ico ] ; your "view" code here`**

**rebolek**

**[13:21](#msg5fa007d72a35440715fde893)@XANOZOID thanks, `%.ico`, not `%.bmp`. Maybe `%.png` is supported also, I'm not sure. Best way to find out is to try it :)**

**ams02468**

**[14:47](#msg5fa01bfcc10273610adf205a) @rebolek @XANOZOID @greggirwin thx guys**

****Thursday 5th November, 2020****

**nwtgthb**

**[14:07](#msg5fa40732b86f64070431daca)Hi just discovered this red and it looks interesting. Trying some of the examples but keep getting the following error, Script Error: view has no value . Using 32 bit linux.**

**9214**

**[14:12](#msg5fa4083cb4283c208a4844d2)@nwtgthb use the \[latest release](https://static.red-lang.org/dl/auto/linux/red-latest) and install \[GTK dependencies](https://github.com/red/red/wiki/%5BNOTE%5D-Linux-GTK-dependencies).**

**nwtgthb**

**[14:48](#msg5fa410d4f2fd4f60fc5629d3)checked dependencies and I seem to have them all. update the exe and tried some code. getting the following error \*\** Compilation Error: undefined word scan**  
**\*\** in file: /home/jkerr/Downloads/redTest.red**  
**\*\** near: \[scan new attempt/safer \[load new]]**  
**for the following red code Red \[needs: view]**

**view [**  
**style my-button: base 100x24**

**my-button**  
**] thanks.**

**[14:59](#msg5fa413632a60f731f738a536)the following code is successfull at the prompt &gt;&gt; Red \[needs: "view"]**  
**== \[needs: "view"]**  
**&gt;&gt; view \[ text "hello world" ]**  
**&gt;&gt;**  
**this pops up a small window with heelo world. when I run the code from a file I get the following error Compiling to native code...**  
**\*\** Compilation Error: undefined symbol: red/word/duplicate**  
**\*\** in file: %/home/jkerr/Downloads/redTest.red**  
**\*\** at line: 353**  
**\*\** near: [word/duplicate ~script**  
**~args|358: word/duplicate ~args comment "Literals"**  
**ctx48:**  
**thanks.**

**9214**

**[15:06](#msg5fa414e474152347c2172ef6)@nwtgthb try to compile in release mode instead (`-r` flag rather than `-c`).**

**[15:07](#msg5fa4152f8a236947ba88f531)And please format your code with fences (see \[Markdown cheatsheet](https://gitter.im/red/red/welcome#markdown)), that will make it a bit easier to discern the problem.**

**nwtgthb**

**[15:24](#msg5fa4191106fa0513dd94ba36)**  
**`Compiling to native code... ...compilation time : 112366 ms ...linking time : 908 ms ...output file size : 794580 bytes ...output file : /home/jkerr/Downloads/redTest`**  
**on execution still getting error**  
**`*** Script Error: view has no value *** Where: ???`**

**[15:25](#msg5fa41955dc70b5159af3a4bf)**  
**`fence test`**

**[15:25](#msg5fa41963b86f640704320a0a)'''fence test'''**

**9214**

**[15:28](#msg5fa41a208d286f20768f92d8)@nwtgthb are you sure that you are using the latest build? What's the output of `about` when you enter it at the Red console prompt?**

**nwtgthb**

**[15:32](#msg5fa41b1b8d286f20768f9604)**  
**`Red 0.6.4 for Linux built 4-Nov-2020/9:01:38 commit #277584b`**

**[15:33](#msg5fa41b4ec10273610ae9a57f)what is the fences character. i am using the backtick. is that correct.**

**9214**

**[15:38](#msg5fa41c6ab86f640704321127)@nwtgthb try to compile this:**  
**`Red [Needs: View] view [text "hello world"]`**  
**Using this:**  
**`./red -r hello.red`**  
**Note that `View` is not the same as `"view"` in your example. What likely happens is that View module simply does not get included during compilation, and then you get a runtime error.**

**nwtgthb**

**[15:47](#msg5fa41e978a236947ba890e49)success. I have been copying and pasting the examples from some web sites and they have the needs: "view" as the example. thanks for the time.**

**9214**

**[15:48](#msg5fa41ee08a236947ba890ed0)&gt; I have been copying and pasting the examples from some web sites and they have the needs: "view" as the example**

**You should report that to website owners if you can.**

**greggirwin**

**[19:27](#msg5fa4522dc6fe0131d4d9b262)@9214, looks like we should doc and vet the Red header format.**

****Sunday 8th November, 2020****

**meijeru**

**[16:09](#msg5fa818238a236947ba924aad)"My" spec doc says the following:**  
**`17. Metadata for the toolchain It is recommended to organize the metadata as <word>: <value> pairs. This will facilitate storage and retrieval of these data by the toolchain as well as the user. Certain elements of metadata, that are used by the toolchain, must be in this format: Icon: Needs: and Config:, with prescribed types for the <value> as indicated. The following is a list of suggested and compulsory elements. The ones marked * are contained in the object system/standard/header. element type description * Title: string! application title * Name: string! application name * Type: ??? Purpose: string! short description of the application purpose * Version: tuple! source code version * Date: date! date of last version * File: file! name of the source file * Author: string! source code author name Rights: string! copyrights License: [url! string!] source license (URL or full text) History: block! source modifications history Note(s): string! any special notice Language: word! language of the comments Tabs: integer! number of spaces between tab positions Icon: [file! block! word!] *.ico file(s) with icon(s) for executable, or word default/flat/old/mono indicating standard *.ico files provided by toolchain * Needs: [word! block!] module(s) that is/are to be included Config: block! set-word/value pairs for toolchain options for a list of options, see source file /system/compiler.r (object system-dialect/options-class)`**

**[16:10](#msg5fa81888d37a1a13d6940107)I have not yet incorporated the element that mentions extra currency identifiers.**

**9214**

**[16:12](#msg5fa818dfd5a5a635f2ab7133)@meijeru see \[here](https://github.com/red/docs/blob/master/en/datatypes/money.adoc#currency-list). Also https://github.com/red/red/issues/4613.**

****Monday 9th November, 2020****

**greggirwin**

**[02:00](#msg5fa8a2cec10273610af4126e)Thanks @meijeru @9214.**

**@meijeru what do you mean by "compulsory" elements? Red doesn't \*require* any elements at this time.**

**meijeru**

**[10:05](#msg5fa91472b86f6407043d8d06)I mean that there are elements that -- if they occur -- should have a prescribed format. I quote:**  
**`Certain elements of metadata, that are used by the toolchain, must be in this format: Icon: Needs: and Config:, with prescribed types for the <value> as indicated.`**

**[10:07](#msg5fa914f8c6fe0131d4e4a05b)Moreover, the ones that are in `system/standard/header` could be called "recommended", that is somewhat softer than "compulsory". I will think of a better formulation in the spec doc.**

**9214**

**[10:46](#msg5fa91e222a35440715146526)@meijeru https://github.com/red/red/issues/4155 is also worth mentioning.**

**greggirwin**

**[17:36](#msg5fa97e2e2a60f731f7456a9c)Thanks, I understand what you mean now.**

****Tuesday 10th November, 2020****

**meijeru**

**[08:56](#msg5faa55a3dc70b5159a028243)@9214 The specs doc does not document Red/System. The point you mentioned should go \[here](static.red-lang.org/red-system-specs-light.html)**

****Friday 27th November, 2020****

**WayneCui**

**[13:47](#msg5fc1036634df503cec02bd21)Hello guys, anyone know how to send HTTP request with POST in Red or Rebol?**

**rebolek**

**[13:59](#msg5fc106566ebe7532e6a67b3d)Hi @WayneCui , you can either use `write/info` or `send-request` from https://gitlab.com/rebolek/castr/ which works as a wrapper for `write/info` which syntax I don't remember :-)**

**WayneCui**

**[14:02](#msg5fc106f9e81def77d84cfdc9)👍 Thanks, I will try it.**

**rebolek**

**[14:06](#msg5fc108037f947a4e02e10963)IIRC, the syntax for `write/info` is something like:**  
**`write/info http://www.example.com [POST [] "a=b"]`**

**which would be done using `send-request` as:**  
**`send-request/data http://www.example.com 'POST [a: b]`**

**WayneCui**

**[14:09](#msg5fc1087c3afabc22f1592228)Nice! By the way, there is no info refinement in Rebol WRITE, how should I do this? I want to send some Json data**

**rebolek**

**[14:11](#msg5fc108f57850f66b6048a035)I'm not sure how Rebol does it, I haven 't used Rebol in a while but if JSON is what's you're after, `send-request` does the conversion for you, if you feed it `map!` data:**  
**`send-request/data htttp://example.com 'POST #(a: b) ; here #(a: b) is converted to JSON ; while [a: b] is converted to "a=b"`**

**[14:12](#msg5fc1093ae2abf66ae598d8ee)Another nice thing that `send-request` does is autoconversion of received JSONs to `map!`**

**[14:12](#msg5fc10961ed05c659158d0224)So if you're working with some web API, you can ignore the conversion boilerplate on both sides, that's done automatically.**

**WayneCui**

**[14:13](#msg5fc10976b12c2622f909b348)Just read send-request.md, That's what I want.**

**rebolek**

**[14:14](#msg5fc109e366dcfa77e2a7d201)Great, if you have any question, just ask me, I try to help.**

**WayneCui**

**[14:31](#msg5fc10dbaed05c659158d0e2b)**  
**`Red[] #include %../client-tools.red send-request/data http://example.org 'POST #(name: "Albert Einstein" age: 140)`**

**[14:31](#msg5fc10dd27f947a4e02e11826)**  
**`*** Script Error: to-json has no value *** Where: content *** Stack: send-request`**

**rebolek**

**[14:32](#msg5fc10e0ae81def77d84d0e0b)@WayneCui you need to get newer Red, you probably using last "stable" which is really outdated**

**[14:33](#msg5fc10e302a4f2a3d1f5afdaa)https://www.red-lang.org/p/download.html get automated build or preferrably, build Red yourself**

**WayneCui**

**[14:54](#msg5fc1132ab12c2622f909cd8e)Make it, thanks a lot @rebolek**

**[14:57](#msg5fc113be03ddd74df2fc67f8)**  
**`Red[] #include %../client-tools.red data: send-request/data http://example.org 'POST #(name: "Albert Einstein" age: 140) print data`**

**[14:57](#msg5fc113cffbce3f591ce4a0d4)**  
**`#( Accept-Ranges: "bytes" Cache-Control: "max-age=604800" Content-Type: "text/html; charset=UTF-8" Date: "Fri, 27 Nov 2020 14:51:34 GMT" Etag: {"3147526947"} Expires: "Fri, 04 Dec 2020 14:51:34 GMT" Last-Modified: "Thu, 17 Oct 2019 07:18:26 GMT" Server: "EOS (vny/0454)" Content-Length: "1256" ) code: 200 headers: #( Accept-Ranges: "bytes" Cache-Control: "max-age=604800" Content-Type: "text/html; charset=UTF-8" Date: "Fri, 27 Nov 2020 14:51:34 GMT" Etag: {"3147526947"} Expires: "Fri, 04 Dec 2020 14:51:34 GMT" Last-Modified: "Thu, 17 Oct 2019 07:18:26 GMT" Server: "EOS (vny/0454)" Content-Length: "1256" ) raw: {<!doctype html>^/<html>^/<head>^/ <title>Example Domain</title>^/^/ <meta charset="utf-8" />^/ <meta http-equiv="Content-type" content="text/html; charset=utf-8" />^/ <meta name="viewport" content="width=device-width, initial-scale=1" />^/ <style type="text/css">^/ body {^/ background-color: #f0f0f2;^/ margin: 0;^/ padding: 0;^/ font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;^/ ^/ }^/ div {^/ width: 600px;^/ margin: 5em auto;^/ padding: 2em;^/ background-color: #fdfdff;^/ border-radius: 0.5em;^/ box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);^/ }^/ a:link, a:visited {^/ color: #38488f;^/ text-decoration: none;^/ }^/ @media (max-width: 700px) {^/ div {^/ margin: 0 auto;^/ width: auto;^/ }^/ }^/ </style> ^/</head>^/^/<body>^/<div>^/ <h1>Example Domain</h1>^/ <p>This domain is for use in illustrative examples in documents. You may use this^/ domain in literature without prior coordination or asking for permission.</p>^/ <p><a href="https://www.iana.org/domains/example">More information...</a></p>^/</div>^/</body>^/</html>^/} data: {<!doctype html>^/<html>^/<head>^/ <title>Example Domain</title>^/^/ <meta charset="utf-8" />^/ <meta http-equiv="Content-type" content="text/html; charset=utf-8" />^/ <meta name="viewport" content="width=device-width, initial-scale=1" />^/ <style type="text/css">^/ body {^/ background-color: #f0f0f2;^/ margin: 0;^/ padding: 0;^/ font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;^/ ^/ }^/ div {^/ width: 600px;^/ margin: 5em auto;^/ padding: 2em;^/ background-color: #fdfdff;^/ border-radius: 0.5em;^/ box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);^/ }^/ a:link, a:visited {^/ color: #38488f;^/ text-decoration: none;^/ }^/ @media (max-width: 700px) {^/ div {^/ margin: 0 auto;^/ width: auto;^/ }^/ }^/ </style> ^/</head>^/^/<body>^/<div>^/ <h1>Example Domain</h1>^/ <p>This domain is for use in illustrative examples in documents. You may use this^/ domain in literature without prior coordination or asking for permission.</p>^/ <p><a href="https://www.iana.org/domains/example">More information...</a></p>^/</div>^/</body>^/</html>^/}`**

**rebolek**

**[15:49](#msg5fc12002fbce3f591ce4c1a4)@WayneCui great! Let me know if you run into any problems so I can fix it**

**WayneCui**

**[23:42](#msg5fc18ee7f621032cde0f2a98)Sure :-)**

****Saturday 28th November, 2020****

**planetsizecpu**

**[12:10](#msg5fc23e49afc2922cf2c3c85d)@WayneCui Welcome on board!**

****Monday 30th November, 2020****

**guibus**

**[09:34](#msg5fc4bcaf8c7c4215bb9a878f)Hello all, I'm trying to install red on linux (ubuntu budgie 20.04), and after installing 32-bit libraries, during compilation it says "error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory" any idea to solve the problem ? thank you.**

**rebolek**

**[09:36](#msg5fc4bd2bf621032cde1649a8)@guibus you are compiling something that uses View module which requires also 32bit GTK**

**guibus**

**[09:41](#msg5fc4be5d9cdc3e0d754d96fc)@rebolek thks. non I just downloaded the last build (30nov) added exec rights and ./red-latest. It compiles but returns this error.\***

**rebolek**

**[09:47](#msg5fc4bfa0226043667c244a13)@guibus ah, I see. I hope someone with better knowledge of automated builds may jump in. I build myself, I find it much easier. The only idea I have right now is to install 32bit GTK. I use View sometimes, so I have it installed on my machine, but non-GUI scripts can run without it, I use it on various servers and rPis where it runs fine (but as I said, I compile myself, so I have better control over what's going on).**

**guibus**

**[09:50](#msg5fc4c07eafc2922cf2c999ab)@rebolek thks. How do you build yourself ?**

**[09:58](#msg5fc4c25cf621032cde16576c)@rebolek thks, installing 32 bits gtk3 worked ! still some tests, but at least I get the prompt.**

**rebolek**

**[10:00](#msg5fc4c2ae223b350d80e4d573)@guibus**

**1. Clone Git repository from http://github.com/red/red**  
**2. Download Rebol from http://www.rebol.com/downloads.html (proper Linux version should be Linux x86 libc6 2.5) and extract the executable to the git repo directory**  
**3. In the git repo directory, run Rebol and in Rebol console type: `do/args %red.r "-r environment/console/CLI/console.red" 4. After ~1 minute (depends on CPU) compilation ends and you have file`console\` in the git repo directory.**

**This way you can build Red console with your modifications also.**

**guibus**

**[10:08](#msg5fc4c4968c7c4215bb9a9bee)@rebolek Thanks a lot**

**greggirwin**

**[22:14](#msg5fc56eacf621032cde18384a)There have been some recent changes, not sure if on a branch or master, so non-View builds have `image!` available. That means a new dependency IIRC. @qtxie or @bitbegin can say for sure.**

****Tuesday 1st December, 2020****

**qtxie**

**[03:07](#msg5fc5b35ea83ffc46af8735bc)@guibus Here is the libs need to be installed for GTK: https://github.com/red/red/wiki/%5BNOTE%5D-Linux-GTK-dependencies**

****Sunday 6th December, 2020****

**guibus**

**[10:24](#msg5fccb1402b3e824d8c2aaa7d)@qtxie Thanks. Still got an error : Failed to load module "appmenu-gtk-module" but view is working**

****Tuesday 22nd December, 2020****

**Slownite**

**[00:29](#msg5fe13df12084ee4b78658a19)Hi everybody, I’m trying to install red on my Mac (Mac OS Big Sur) but when I execute red I have this error « bad CPU type in executable ». It happens with the stable version and the last automated build.**  
**If anybody have any idea it will be great! Thank you!**

**greggirwin**

**[01:54](#msg5fe151cace40bd3cdbf55a5a)Welcome @Slownite. Unfortunately Red is 32-bit only at this time. People use VMs if they're on Big Sur.**

**Slownite**

**[01:55](#msg5fe1522e63fe0344960fa864)@greggirwin ok thank you very much for your help!**

**greggirwin**

**[03:02](#msg5fe161bbc746c6431ccbe3c3)Happy to help.**

****Wednesday 23th December, 2020****

**gtzip**

**[23:32](#msg5fe3d3a28bb73474694fce2c)Happy Holidays.**

**[23:33](#msg5fe3d3bece40bd3cdbfbb17d)May the final days of 2020 pass swiftly**

****Saturday 26th December, 2020****

**Sergey\_Vladivostok\_gitlab**

**[12:42](#msg5fe72fcbe7f693041f32079a)Hello. Please tell me how in the program can be access to the COM port (rs232)? Im want comunication whith Arduino.**

**greggirwin**

**[20:03](#msg5fe7970b63fe0344961e3a02)Ports are coming soon, with the full I/O work, but COM ports haven't been specifically discussed. R2 supported them, so you could start there to get some playtime in. Not saying Red will work exactly the same though. You can also seen some \[GPIO R&amp;D](https://www.red-lang.org/2019/07/gpio-port-for-raspberry-pi.html) done by @dockimbel last year.**

**Sergey\_Vladivostok\_gitlab**

**[23:35](#msg5fe7c8cade60814315461f80)R2-Rebol 2? For the "Write-IO" / "read-io"function, the port must be open. Com COM port? What argument should be in the "open" function? It seemed to me that these functions are for working with port isernet connections, such as "http://site.com:80". Or do I need to open the device's system file ( "\\\\\\. \\ \\ COM2 " or "COM2:" on Windows and "/dev/ttyusb " on Linux)?**

****Sunday 27th December, 2020****

**greggirwin**

**[00:06](#msg5fe7d01f22f12e449b140e69)I haven't used them in a long time, but did quite a bit many years ago. Here are a couple search hits:**

**- http://www.rebol.com/docs/changes-2-5.html#section-81**  
**- https://codeconscious.com/rebol/rebol-net.html#SerialPorts**

**[00:08](#msg5fe7d076ac9d8e7463d310cd)You can spec the port either as a URL or with a block scheme. Once open, the standard port actions work normally. There might be a couple gotchas, but I don't remember right off.**

**Sergey\_Vladivostok\_gitlab**

**[00:09](#msg5fe7d09c2084ee4b7874ac82)@greggirwin Thank you very much**

**[00:22](#msg5fe7d3bf4eba353cdfff0515)R2 dont see COM4 :( https://ibb.co/Y0HDsG5**

**greggirwin**

**[00:24](#msg5fe7d42e2084ee4b7874b32c)Is it built in, or via a USB adapter?**

**[00:26](#msg5fe7d49daa6bb528c37350c4)I believe I had to work around that issue at times, so it's possible.**

**Sergey\_Vladivostok\_gitlab**

**[00:33](#msg5fe7d65c2084ee4b7874b791)USB adapter.**

**[00:34](#msg5fe7d69e63fe0344961eb438)I will try.**

**greggirwin**

**[00:46](#msg5fe7d972acd1e516f8b79675)I'll post some notes to you privately, since it's not generally useful in Red right now.**

****Tuesday 29th December, 2020****

**jakubiszon**

**[17:36](#msg5feb693aac9d8e7463db208a)Hi. I have a fairly noob question https://stackoverflow.com/questions/65496326/how-do-i-set-an-icon-to-a-view-in-red-program**

**ne1uno**

**[17:44](#msg5feb6ae7ac9d8e7463db27a5)jakubiszon maybe  try `icon: %icon1.ico`**

**[17:44](#msg5feb6b1b8bb7347469609b15)I think windows ico needs to be below a minimum size too?**

**jakubiszon**

**[17:45](#msg5feb6b5593af5216fc6da1bd)the file itself is 766 bytes**

**ne1uno**

**[17:48](#msg5feb6be797312f4b6bf8b192)may be only compiled too, can't recall**

**jakubiszon**

**[17:49](#msg5feb6c2822f12e449b1c23b5)ok, I'll try compiling**

**[17:53](#msg5feb6d188bb734746960a096)Yes, it actually worked when compiled and it does require `icon: %icon1.ico` syntax**

**[17:53](#msg5feb6d1ddbb17f28c5a8da49)thanks!**

**greggirwin**

**[18:42](#msg5feb787baa6bb528c37b9a4c)There shouldn't be a size limit for the icon.**

****Thursday 31st December, 2020****

**bkalef88\_gitlab**

**[20:31](#msg5fee352c8bb73474696741a0)Let me just say Happy New Year to the Rebol/Red community as a whole. I have 'known' some of you for over 17 and maybe as long as 20 years now. And since coming back to Red have been helped out by some very talented new followers. This community has always been very helpful and welcoming. May 2021 be better for us all. May we all see some success in our Red projects, and may Red and Red Lake see lots of progress and success this year.**

**greggirwin**

**[21:12](#msg5fee3ebac746c6431ce9d648)Thanks Brock, and Happy New Year to everyone!**

**toomasv**

**[21:48](#msg5fee4739dbb17f28c5afb9ae)\[!\[HNRY](https://toomasv.red/images/Misc/HNRY.gif)](https://toomasv.red/images/Misc/HNRY.gif)**

**greggirwin**

**[21:51](#msg5fee47edde60814315554caa)Woohoo! Somehow I knew this was coming. ;^)**

**toomasv**

**[22:09](#msg5fee4bfe69ee7f0422d56cf6) :open\_mouth:**
