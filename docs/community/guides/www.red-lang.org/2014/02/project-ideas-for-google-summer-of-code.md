![Red](https://static.red-lang.org/red-logo.svg)

# [Red Programming Language](https://www.red-lang.org/)

## Pages

- [Home](http://www.red-lang.org/)
- [About](http://www.red-lang.org/p/about.html)
- [Getting Started](http://www.red-lang.org/p/getting-started.html)
- [Download](http://www.red-lang.org/p/download.html)
- [Documentation](http://www.red-lang.org/p/documentation.html)
- [Contributions](http://www.red-lang.org/p/contributions.html)
- [Roadmap](http://www.red-lang.org/p/roadmap_2.html)
- [Privacy Policy](https://www.red-lang.org/p/privacy-policy.html)

## February 6, 2014

[]()

### Project Ideas for the Google Summer of Code 2014

Red has been ramping up its recruiting efforts in 2014.  So far in January, we've done very well with our [open-source recruitment campaign](http://meta.stackoverflow.com/ads/display/210389) on StackOverflow.  Now in February, we are throwing our hat into the ring to be a mentoring organization for Google's **Summer of Code**:

[![](https://developers.google.com/open-source/soc/images/logo-2014-600x540.png)](http://www.google-melange.com/gsoc/homepage/google/gsoc2014)

If you haven't heard about Summer of Code, it pairs college students with mentors who represent an open source project.  The students work remotely and are paid a stipend... and they are expected to complete a measurable goal in the 3 months that they have.  There's an opportunity to start getting involved before the summer, and hopefully the students will have a good experience and stay involved after the summer ends!

Though Nenad will be too busy in the [new Beijing Red headquarters](http://www.red-lang.org/2014/01/year-of-horse.html) :-) to mentor, several members of the Red team have stepped up to volunteer if we are selected.  There is of course around-the-clock support in the [\[Rebol and Red\]](http://chat.stackoverflow.com/rooms/291/rebol-and-red) chat room, but Google needs commitments from specific people to fill out paperwork and reviews.  As the project "admin" Nenad should only have to be consulted if there was a disagreement between the student and the mentor (which would not happen!)  Of course he would be reviewing any pull request, as with any other code submission.

Google says the best project ideas come from students, which sounds like a good idea.  Still, they require a "starter list" of example projects to originate from the potential mentoring organizations.  So here is the one we came up with...

[]()

* * *

**Aapt &amp; Ziptool port for Red Build Chain**

**Description**

The under one-megabyte Red toolchain can output to the ARM instruction set, package an .APK, and soon will have its own JarSigner...requiring no installation of the JDK.  Yet two additional pieces will be needed for a completed standalone Red Android toolchain: that is the Android Asset Packaging Tool ("aapt") and "zipalign" optimization tool:

[![Android Build Diagrarm](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgtWDcD92xvowiCm0yz8UFgRa4hzQ7shaJc_ulblzkdvH_Tuxq44ELBKaOeqO90yj_eLbB46sGxuluEAQawWScpCUbXosnXVT3Thu_dHm0kdaGjJrGMpkdouwkcdPqdJXXnQIDip9DCoWQ/s1600/android-build.png "Android Build Diagram")](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgtWDcD92xvowiCm0yz8UFgRa4hzQ7shaJc_ulblzkdvH_Tuxq44ELBKaOeqO90yj_eLbB46sGxuluEAQawWScpCUbXosnXVT3Thu_dHm0kdaGjJrGMpkdouwkcdPqdJXXnQIDip9DCoWQ/s1600/android-build.png)

From the [Android documentation for zipalign](http://developer.android.com/tools/help/zipalign.html):

> Zipalign is an archive alignment tool that provides important optimization to Android application (.apk) files. The purpose is to ensure that all uncompressed data starts with a particular alignment relative to the start of the file. Specifically, it causes all uncompressed data within the .apk, such as images or raw files, to be aligned on 4-byte boundaries. This allows all portions to be accessed directly with mmap() even if they contain binary data with alignment restrictions. The benefit is a reduction in the amount of RAM consumed when running the application.

Some extended information on the usage of AAPT [is available on eLinux.org](http://elinux.org/Android_aapt).  Note that we will not be needing the R.java branch of the above diagram in our implementation.  But we will be needing to encode the AndroidManifest.xml file into the binary format expected by the APK, as well as the resources.asc file generation.

**Expected outcome**

A tested component, written in Rebol/Red, that can provably achieve binary parity with the output of the equivalent Java-tools.

**Potential mentor**

John Kenyon

**Skills and languages required**

- Must have a good working familiarity with Java
- Some knowledge of Android development and build process.
- *For all Red GSoC projects:* Familiarity with a [homoiconic](http://en.wikipedia.org/wiki/Homoiconicity) language such as Lisp a big plus!

**General "difficulty" level**

Although at some level this is "just porting" existing code, it's a fairly complex piece of code to translate into a language one is to pick up as they went along. Any student undertaking this should be ambitious enough to begin learning the Rebol and Red languages in advance of the summer period.

* * *

**Arduino AVR 8-bit / 32-bit Support**

**Description**

Preliminary support exists to build Red code to [AVR 8-bit](http://en.wikipedia.org/wiki/Atmel_AVR), allowing executables to run on Arduino boards.  This was largely abandoned, in part because of the belief that 8-bit AVR may not be a relevant focus given [AVR32](http://en.wikipedia.org/wiki/AVR32).  But also because Red is focused on ARM architectures and Android...so when it comes to embedded boards, favors the Raspberry Pi.

However, the goal is to spread everywhere; and Arduino is still relevant for PWM tasks or handling a lot of inputs and outputs, along with A/D and D/A converters.  So this project would be fairly specific for a student who is an Arduino enthusiast, who wants to show what they can make it do with Red.

**Expected outcome**

- A new emitter for AVR32, to add to the existing [IA32 and ARM emitters](https://github.com/red/red/tree/master/system/targets).  Would likely build on the current AVR 8-bit prototype code.
- Completion of the AVR 8-bit emitter, *if* that is determined to be relevant in 2014 *(or merely easy enough to keep working)*.
- An impressive Arduino-based demonstration of the student's choosing, showing Red's dialecting ability ([similar to Rebol](http://www.rebol.com/rebolsteps.html)) applied to the features of the Arduino.

**Potential mentor**

Bo Lechnowsky

**Skills and languages required**

- Demonstrated experience in building Arduino-based systems ... documented in webpages or YouTube videos.
- Working understanding of compilers and code generators; ideally having taken a compilers class or would read [Compilers: Principles, Techniques, and Tools](http://en.wikipedia.org/wiki/Compilers:_Principles,_Techniques,_and_Tools) *(the "Dragon Book")* in advance of the summer.
- *For all Red GSoC projects:* Familiarity with a [homoiconic](http://en.wikipedia.org/wiki/Homoiconicity) language such as Lisp a big plus!

**General "difficulty" level**

Getting the AVR32 backend to work is likely not the difficult part of this project, and given the prior work to build on should be achievable in the first month or month and a half.

The harder component is to design a compelling application, and this comes from the student's choices.  Ideally it would be a demonstration of something that an Arduino can do that would not be better done with a Raspberry Pi, justifying the investment in AVR.

* * *

**Implement Working FreeBSD Build Target**

**Description**

Red can compile executables for the major desktop operating systems: Linux, OS/X, Windows. *(It also supports some smaller players like Syllable.)*

Even though the Red compiler itself is able to run on FreeBSD platforms (due to the properties of its host language), the executables it generates cannot yet do so.

On the one hand, FreeBSD [has been an ELF platform](http://www.freebsd.org/doc/handbook/binary-formats.html) for a while and Red already contains emitters for ELF targets. This should require only some minor extension.  On the other hand, there's a few select [runtime](https://github.com/red/red/tree/master/system/runtime) [requirements](https://github.com/red/red/tree/master/system/runtime) on the platform's kernel and/or C library which will need to be adapted for FreeBSD.

There are no FreeBSD users or experts currently among the Red developers, but being able to target FreeBSD would open up Red programs to new audiences and applications.

**Expected outcome**

- First: a version of Red that can run the hello.red application, similar to [this demo from Syllable](http://web.syllable.org/images/screenshots/Desktop/0.6.7/First-Red-program-on-SyllableDesktop.png).
- Second: make sure it passes all the [18,000+ unit tests](https://github.com/red/red/tree/master/system/tests)

**Potential mentor**

Andreas Bolka

**Skills and languages required**

- Student should preferably be an experienced user of FreeBSD, or be willing to become one prior to starting the project.
- Already basically aware of what PE, Mach-O, and ELF are and how operating systems load program images.
- Comfort with hex editors like [fileobj](http://sourceforge.net/projects/fileobj/), and a strong stomach for the general ins-and-outs of binary file formats and off-by-4-byte errors.
- Familiarity with FreeBSD's kernel and C library are a plus.
- *For all Red GSoC projects:* Familiarity with a [homoiconic](http://en.wikipedia.org/wiki/Homoiconicity) language such as Lisp a big plus...although it would matter a bit less with this than the others.

**General "difficulty" level**

Certainly it's possible, since the x86 codegen works in Linux ELF and other compilers generate binaries for FreeBSD.

It [might not be that much work](https://www.youtube.com/watch?v=H4kMlOkN894#t=682), especially for a FreeBSD expert.  It would be nice to assume that getting hello.red working would imply passing the test suite would just work.  From [experiences in the Rebol 3 port](https://github.com/red/red/pull/421), that is not necessarily the case.

Should this turn out to be easy, that's great.  The same skills would probably help making Red build for [HaikuOS](http://www.haiku-os.org/)... so that could be a stretch goal if the BSD port were tied up in the first month.  :-)

* * *

**HTTP and HTTPS Runtime Support for READ and WRITE**

**Description**

Rebol-derived languages apply the "code-as-data" paradigm of Lisp, but with a richer set of datatypes.  Douglas Crockford (of JSLINT, JSON fame) said of Rebol:

> Rebol's a more modern language, but with some very similar ideas to Lisp, in that it's all built upon a representation of data which is then executable as programs. But it's a much richer thing syntactically.

One of those richer pieces of syntax are the multiple string subclasses.  e.g. any source code literal starting foo:// will register as a type known as a URL!.  The resulting value has the same abilities as a string, but reflection can distinguish it as a distinct subclass.  READ and WRITE are polymorphic when sensing their parameter is a URL!, so:

    read http://red-lang.org

That dispatches to a scheme handler, which returns a binary of the resource at that URL.

The Red runtime needs to have cross-platform implementations of READ *(an http "get")* and WRITE *(an http "post")*.  This support should be done for both HTTP and HTTPS, and mimic the basic support of TCP/TLS in Rebol.

**Expected outcome:**

- Red/System code [added to the runtime](https://github.com/red/red/tree/master/runtime) which implemented a handler for when **read** received something that was **url! = type? source**.
- Due to the difficulty of writing [transport-layer security (TLS)](http://en.wikipedia.org/wiki/Transport_Layer_Security) by hand in a C-equivalent language, the expectation would be just to show a basic demo of fetching binary data on Linux, OS/X, Windows, and Android.  *(It would be enough to show off retrieving Red's own source from GitHub, which uses HTTPS, for instance.)*
- Any time left over after achieving the basic goal could be dedicated to contributing to the design of scheme handlers, as in Rebol.

**Potential mentor**

Brian Dickens

**Skills and languages required**

- Must understand Berkeley Sockets, and would not find it too complicated to understand or port an implementation of TLS based in C (which is similar to Red/System)
- Some knowledge of cryptographic hashing, certificates, public key cryptography *(hopefully has read Schneier's [Applied Cryptography](https://www.schneier.com/book-applied.html) -- or would do so before the project)*
- *For all Red GSoC projects:* Familiarity with a [homoiconic](http://en.wikipedia.org/wiki/Homoiconicity) language such as Lisp a big plus!

**General "difficulty" level**

Hard -- particularly because the importance of this component means it will be under high scrutiny.  A working implementation may wind up being treated as exploratory work, possibly receiving a complete overhaul afterward. 

Even the basics could be highly challenging for a 3 month project, especially to get it working on all the platforms Red targets.  Scaled-back goals--such as seeing it working on Linux only for starters--would be made if progress seemed to be stalled.

On the other hand, due to the fact that the task is mission-critical, it would command a lot of attention from the team to help make it happen.  A talented contributor could wind up becoming an integral part of the project after GSoC, if they stayed on to enhance it.

* * *

**JavaScript Emitter and Build Target**

**Description**

While Red will probably continue using bridges to communicate with virtual machines like the JVM and the .NET platform, a native code generator that produces JavaScript is the best idea.  This would be somewhat similar to the way [emscripten](https://github.com/kripken/emscripten/wiki) takes LLVM instructions as input and produces a JavaScript equivalent, but without the need for any external toolchain.

The Red compiler generates code into an IL (intermediate language) called Red/System.  Red/System has a compatible syntactic structure to Red, but with lower-level semantics... more similar to C than Rebol.  It is possible to embed Red/System code into a Red program, or to code in it directly without using the higher-level Red at all.

Currently Red/System emitters exist for the ARM architecture and the x86 architecture.  These are embedded into formats like ELF on Linux, Mach-O on OS/X, or PE ("portable executable").  In addition to a JavaScript emitter, there would have to be some kind of packaging produced to get a "runnable" result... such as a webpage with an embedded terminal to interact with the resulting program, or a bridge to node.js.

**Expected outcome:**

- Another emitter JS added to the directory where there is currently an ARM and IA32.  (Note: AVR is experimental, not in main branch): [https://github.com/red/red/tree/master/system/targets](https://github.com/red/red/tree/master/system/targets)
- A new cross-compilation target.  Existing targets are MSDOS, Windows, Linux, Linux-ARM, Darwin, Syllable, Android, Android-x86.

Users should be able to type:

    red hello.red -t JavaScript

...and be given back a runnable result.  For starters this could be invoked via node.js, but if time remained it could be enhanced and packaged as a complete webpage.

**Potential mentor**

Brian Dickens

**Skills and languages required**

- JavaScript - the deeper the knowledge, the better
- Working understanding of compilers and code generators; ideally having taken a compilers class or would read [Compilers: Principles, Techniques, and Tools](http://en.wikipedia.org/wiki/Compilers:_Principles,_Techniques,_and_Tools) *(the "Dragon Book")* in advance of the summer.
- *For all Red GSoC projects:* Familiarity with a [homoiconic](http://en.wikipedia.org/wiki/Homoiconicity) language such as Lisp a big plus!

**General "difficulty" level**

Medium.  Making this task somewhat easier than it might otherwise be is that emitters for the ARM and x86 architectures already exist to study and model after.  Also, since compiling to JS is a hot topic right now, there is the ability to borrow from prior art used in things like [asm.js](http://asmjs.org/spec/latest/)

This is a uniquely good opportunity for a student who is well-versed in JavaScript to bring that talent to the Red team.  It is an important task, so much as with the HTTP/HTTPS protocol work, students would need to be prepared for a possible rewrite of the code if deeper design factors needed to be considered.

* * *

**Implement CALL to OS Interface in Red/System**

**Description**

In Rebol, it is possible to call out to the OS shell:

```
USAGE:
    CALL cmd /input in /output out /error err /wait /console /shell /info /show 

DESCRIPTION:
     Executes a shell command to run another process.
     CALL is a native value.

ARGUMENTS:
     cmd -- The shell command or file (Type: string file block)

REFINEMENTS:
     /input -- Redirects in to stdin
         in -- (Type: any-string port file url none)
     /output -- Redirects stdout to out
         out -- (Type: string port file url none)
     /error -- Redirects stderr to err
         err -- (Type: string port file url none)
     /wait -- Runs command and waits for exit
     /console -- Runs command with I/O redirected to console
     /shell -- Forces command to be run from shell
     /info -- Return process information object
     /show -- Show the output in a console window
```

The Red runtime needs a similar mechanism that works cross-platform.  Because the Red runtime is written in Red/System *(a C-like language which has access to--among other things-- syscall on Linux)* it should be possible to mimic the behavior.

**Expected outcome**

- The ability to run a CALL command line with implementation parity with Rebol on Linux, Windows, and OS/X.
- Although Android is not particularly shell-based, and antagonistic toward [setting executable permissions on files downloaded to /sdcard/](http://stackoverflow.com/questions/21518156/), it is possible to run command line programs.  So for bonus points, there could be a story for CALL on Android as well.

**Potential mentor**

Andreas Bolka

**Skills and languages required**

- Familiarity with stdin, stdout, stderr and the general nature of what an [IOCTL](http://en.wikipedia.org/wiki/Ioctl) is and what a [SYSCALL](http://en.wikipedia.org/wiki/System_call) is.
- The ability to read ["Where the printf rubber meets the road"](http://blog.hostilefork.com/where-printf-rubber-meets-road/) and not want to poke your eyeballs out with a rusty spoon.
- *For all Red GSoC projects:* Familiarity with a [homoiconic](http://en.wikipedia.org/wiki/Homoiconicity) language such as Lisp a big plus!

**General "difficulty" level**

Probably not too hard to achieve in 3 months for either the POSIX Linux+OS/X or Win32.  Yet to do both in three months could be a challenge.  Priority would be given to POSIX in that case... then Windows.  As mentioned, finding a story for Android as deemed applicable would be an interesting bonus.

* * *

**UPDATE Mar-2014:** We unfortunately weren't selected this year.  That's understandable as a relatively new project without high profile organizational usage.  But we thank Google for their consideration, and for their sponsorship of open-source development.

On the plus side, the work of putting these ideas together wasn't time wasted.  What was the "GSoC Ideas Trello" has been renamed and is now the [Ideas For Red Contributors Trello](https://trello.com/b/tCypaglW/ideas-for-red-contributors)!  We're going to be expanding it with projects that might range longer or shorter than 3 months of summer, and which may require skills a college student wouldn't be expected to have.

So go take a look at that!  And if you haven't gotten a chance to look at [our contributions page](http://www.red-lang.org/p/contributions.html), please do... and hopefully you can make time to watch the overview video *(now subtitled!)*  It may inspire you to think of a part of the project that you find interesting that we did not come up with.

Also, do come talk to us on [StackOverflow chat](http://chat.stackoverflow.com/rooms/291/rebol-and-red) or tweet us at [@red\_lang](https://twitter.com/red_lang) with your ideas!

Posted by [Brian Dickens](https://www.blogger.com/profile/01873914328480997979 "author profile") at [9:27 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=198730093251928115&from=pencil "Edit Post")

[]()

#### 14 comments:

01. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [iArnold](https://www.blogger.com/profile/07150237639041884286)[February 7, 2014 at 3:41 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1391784077567#c8093401365762322328)
    
    Thank you for this great blog entry Brian.
    
    I consider this work proof that the Red project is a Google SoC project worthy.  
    Really hope Red gets more attention and even more momentum in the already amazing progress this fine community gives it.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8093401365762322328)
    
    [Replies]()
    
    1. [Reply]()
02. ![](//resources.blogblog.com/img/blank.gif)
    
    [Bo Lechnowsky](http://respectech.com/smoothcam.html)[February 7, 2014 at 5:08 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1391789331544#c1475238253946748590)
    
    Contributing to Red, the first full-stack language, would be a great asset to anyone's resume. I enjoy using Red because it reminds me of programming in the 80's, back when programming was fun. In those days, we were the masters of our computers. Well, we still can be with the help of Red and Red/System!
    
    For instance, I think it amazing that it's possible to write a complete surveillance camera solution, from the embedded hardware that captures and processes the video to the user interface running on Windows/Mac/Android that allows review of the captured and processed video.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1475238253946748590)
    
    [Replies]()
    
    1. [Reply]()
03. ![](//resources.blogblog.com/img/blank.gif)
    
    [Greg](http://www.digicamsoft.com/cgi-bin/rebelBB.cgi)[February 7, 2014 at 11:50 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1391813404780#c6506404809833623458)
    
    All listed projects sound interesting! I wish some students will apply!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6506404809833623458)
    
    [Replies]()
    
    1. [Reply]()
04. ![](//resources.blogblog.com/img/blank.gif)
    
    [Chris RG](http://ross-gill.com)[February 8, 2014 at 7:51 AM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1391842287799#c3887325620994610234)
    
    Red is arguably the most mouth-watering language project out there—drawing from the rich vocabulary of Rebol and applying it to every level of software development, it pries open the murky depths of hardware and OS operations making it accessible to us mere mortals.
    
    While any one of the above proposals would bring us closer to realizing Red, I fancy that a prospective student would have a field day on whatever aspect of the project captures their imagination.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3887325620994610234)
    
    [Replies]()
    
    1. [Reply]()
05. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[February 8, 2014 at 9:57 AM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1391849866753#c4888810291144242872)
    
    Were I a younger man.... nice list!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4888810291144242872)
    
    [Replies]()
    
    1. [Reply]()
06. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[February 8, 2014 at 2:35 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1391866502286#c4929915832045271615)
    
    Great work on the ideas list guys! I especially would like to see the aapt/ziptool task taken by some skilled students. Also the Arduino backends would be very cool to have.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4929915832045271615)
    
    [Replies]()
    
    1. [Reply]()
07. ![](//resources.blogblog.com/img/blank.gif)
    
    johnk[February 9, 2014 at 12:49 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1391946588029#c4017631392566403828)
    
    It is an exciting opportunity to work on building a beautiful language which has so many remarkably simple and powerful concepts in such a concise and understandable package.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4017631392566403828)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[February 10, 2014 at 9:07 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1392062846176#c3244226580102783033)
    
    Uh, as a student interested in compiler implementation and low-level programming some of this project are really fascinating. The fact that i don' t know Red ( but i could learn ) could be a decisive malus xD ? How can i try to comunicate with mentors before applying ?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3244226580102783033)
    
    [Replies]()
    
    1. [Reply]()
09. ![](//resources.blogblog.com/img/blank.gif)
    
    Adrian[February 11, 2014 at 7:49 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1392144554785#c2647268336606770294)
    
    As a child of the 70's and 80's, I find Red promises the same kind of satisfaction you used to get when the number of tools needed to be understood was minimal and the programming environment was comprehensible by mere mortals. On top of this, to get such a flexible (homoiconic, expressive, targeting multiple hardware/software platforms) language as your playground, well, how can anyone who loves programming resist getting involved?
    
    Contributing to the language at this stage gives so many opportunities to show a wide variety of skills that any serious comp-sci student should seriously consider it, for the future fame, glory, and satisfaction that will come.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2647268336606770294)
    
    [Replies]()
    
    1. [Reply]()
10. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAwscySCJ8TzMkUKef4sa05w_LzGJ311_CLrGA_WW5X2rV6VRtV-B_j5zFC6BmAfB0u9aHlo7lZ_ZXDgS3FujIBFqN2EcH9Lm6x1nopl_4CVOeejXTPmVi9-DGx_mstq8/s45-c/*)
    
    [Brian Dickens](https://www.blogger.com/profile/01873914328480997979)[February 11, 2014 at 10:42 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1392154970761#c110978752732886493)
    
    @Andrea We won't know for a bit whether Google will choose us as a mentoring organization. Regardless of that, you can come learn about Red and speak to the potential mentors on the StackOverflow chat:
    
    [http://chat.stackoverflow.com/rooms/291/rebol-and-red](http://chat.stackoverflow.com/rooms/291/rebol-and-red)
    
    As mentioned above, StackOverflow's anti-spam policy is to require 20 points of reputation. Easy to get if you don't have it, and their Q&amp;A system is the best I know of as of 2014...so definitely worth knowing about!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/110978752732886493)
    
    [Replies]()
    
    1. [Reply]()
11. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [iArnold](https://www.blogger.com/profile/07150237639041884286)[February 24, 2014 at 8:28 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1393270110966#c843658673035359894)
    
    Unfortunately the Red project was not selected by the Google commission. Maybe next year. If Red development still progresses at its current pace, there will be a complete new list of possible projects needed.  
    I think it was a good effort to try this application. Learned a lot and have a set of clear and achievable goals. No time for moarning, time for action!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/843658673035359894)
    
    [Replies]()
    
    1. [Reply]()
12. ![](//resources.blogblog.com/img/blank.gif)
    
    Sam[July 4, 2014 at 12:17 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1404469048324#c3675094266681583922)
    
    Happened to run across the page describing the difference between canvas and SVG.
    
    http://en.wikipedia.org/wiki/Canvas\_element#Canvas\_versus\_Scalable\_Vector\_Graphics\_.28SVG.29
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3675094266681583922)
    
    [Replies]()
    
    1. [Reply]()
13. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
    
    [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[July 4, 2014 at 12:50 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1404471033548#c7734314777258478101)
    
    Hi Sam,
    
    Thank you for caring enough about Red to write a long proposition. :-)
    
    First, let me explain that GTK+ is a not what we intend to use for the default Red GUI backend on platforms where it is not part of the OS. The plan is to rely on the native GUI API on each platform.
    
    We care a lot about our runtime size, so even 1.7MB is just too big for us. Also, that is the size of the zipped JS package for SnapSVG, so it also relies on several MB of libs that, are provided by the browsers. Supporting in Red a SVG parser and renderer is probably more like a 10MB+ cost, so not an option for us. Compared to that, the AGG payload is less than 200KB.
    
    Another point: standards are good, but a XML-based solution is just too resource-hungry by our own standards.
    
    I am perfectly aware of the differences between a raster-based engine and a vector-based one. What I would like to find is a vector-based lib, pretty much like AGG, but more modern, with hardware acceleration support in the 100KB-200KB range. If we don't find anything suitable, we might end up building our own one, probably using the native APIs as backends.
    
    Thanks again for your inputs.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7734314777258478101)
    
    [Replies]()
    
    1. [Reply]()
14. ![](//resources.blogblog.com/img/blank.gif)
    
    Sam[July 23, 2014 at 10:27 PM](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html?showComment=1406147233822#c7576101960359296671)
    
    "...I am perfectly aware of the differences between a raster-based engine and a vector-based one..."  
    I think you might have misinterpreted my intentions so I will formally state that you are two magnitudes smarter than I am. No intention was meant to troll or in any way say you don't know what your doing. Only added the post to...ehh...complete my thoughts and make the SVG vs. Canvas info complete.
    
    Thanks for your valiant efforts.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7576101960359296671)
    
    [Replies]()
    
    1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=198730093251928115&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2014/04/042-unicode-console-and-freebsd-support.html "Newer Post") [Older Post](https://www.red-lang.org/2014/01/year-of-horse.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/198730093251928115/comments/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [►](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2025/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2024](https://www.red-lang.org/2024/) (4)
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2024/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2024/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2024/02/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2023/06/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2022](https://www.red-lang.org/2022/) (2)
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2022/07/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2021/08/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2020/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2020/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2019](https://www.red-lang.org/2019/) (10)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2019/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2019/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2019/10/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2019/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2019/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2019/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2019/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2019/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2018/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2018/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2018/10/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2018/09/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2018/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2018/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2018/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2018/01/) (5)

<!--THE END-->

- [►](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2015/01/) (1)

<!--THE END-->

- [▼](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
    
    - [Project Ideas for the Google Summer of Code 2014](https://www.red-lang.org/2014/02/project-ideas-for-google-summer-of-code.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2014/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2013/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2013/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2013/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2013/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2012/02/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2011/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2011/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2011/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2011/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2011/05/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)
