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

## December 26, 2011

[]()

### [ARM support released](https://www.red-lang.org/2011/12/arm-support-released.html)

We are pleased to announce that Red/System [v0.2.3](https://github.com/red/Red/tags) is out, extending Red to the mobile world with a complete support for Linux on ARMv5+ processors. The new port supports 100% of Red/System features and passes successfully the 8537 unit tests.

For those of you interested in more details, our ARM port targets the v5 family, with 32-bit instructions (no Thumb support) and optional literals pools (use -l or --literal-pool command-line option when compiling) that implement a global allocation strategy (unlike gcc's function-local allocations).

New compilation targets have been provided for Linux and derivative OS running on ARM:

- Linux-ARM
- Android

Android support is using the same code as Linux-ARM, only differing in libc and dynamic linker names.

Currently, as Red/System only works on command-line in Android, you need a special loader to download the executable and run it. This can be achieved using the [NativeExe app](http://gimite.net/en/index.php?Run%20native%20executable%20in%20Android%20App). You will need to allow temporary installing apps from non market sources (Settings &gt; Applications &gt; Unknown sources). Also, your local 3G provider might be filtering out executables downloaded this way, you can workaround that by either manually loading the NativeExe-0.2.apk file with [adb](http://developer.android.com/guide/developing/tools/adb.html#move), or share a wired Internet connection with your mobile device.

You can easily install NativeExe app by just typing the following URL in your Android web browser:

http://gimite.net/archive/NativeExe-0.2.apk

or by scanning this QR-code instead:

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_vw0z7LbwLaEwjjawRhFxnZCc8qy9ndQxuTpgmMWiUd3QxR6q7ootkcC5zsDz6lJ1IqpOjYOoT5mJgBYSI4pgSMgPPv50X5FJZhdfKxHhgqmDBBHw=s0-d)](http://static.red-lang.org/native-exe-qrcode.png)

Once done, input in the second field: http://sidl.fr/red/hello and hit \[Run]. 

Here are a few screenshots of HelloWorld tests:

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_uLL8TSkFdtIkvMFiGR-OqgpBZu1DLc1vVf7GHCm6iZ-R6T0JXeQwYCUR3Ibo1PsmsPbXUlI5eTLtn5CdG_1bDOB6qsux33i1JzahHLVtDeUT36Dcw-ZfCOoQ=s0-d)](http://static.red-lang.org/hello-arm-android.png)

hello.reds script on Android 2.2

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_vkz2xQFvJquPjtkg7bZ5LHgaUAPavv3dayb5B1kCk9Fee4dJZryLI0F1hX04vcu7QBNgsF9Vp0LP0Wm2Efk9HpUUf1vsCIgMrWfdyafakRXAo8Qp8KqA=s0-d)](http://static.red-lang.org/hello-arm-qemu.png)

hello.reds script on Linux Debian 6.0 in QEMU

Andreas has also [reported](http://twitter.com/#!/xearl/status/138413355126886400/photo/1) that it's working fine on Nokia N9 devices.

Supporting Android and iOS API

The next steps to enable building full apps on Android and iOS are:

1. Support [**PIC**](http://en.wikipedia.org/wiki/Position-independent_code) compilation mode: indirect access to all global variables and data. This is a requirement for building shared libraries on UNIX (but optional on Windows).
2. Add **shared library** generation to file format emitters. This will require some new compilation directives to mark the exported code parts.
3. Build a **bridge** with Java for Android and Objective-C for iOS/OSX. This generic bridge would allow accessing all the objects and methods of the host and send back to Red all I/O events.

Such approach will allow us to build easily Android or iOS apps without having to write a single line of Java or Objective-C code, while providing the full power of  Red. At least, that's the theory, we'll see in practice if it's up to our expectations. Also, cross-compilation should be fully available for Android (producing Android apps from any OS), but code signing and app publishing requirements might make it impossible for iOS and require a MacOS X with Xcode for producing apps (if you know workarounds, let us know).

The PIC support should be doable in a few days, the support for shared library generation might take a bit more time. Anyway, theses tasks will need to be multiplexed with Red runtime &amp; compiler implementation, so don't expect significant progress before a month.

In the meantime, you are welcome to test the ARM port of Red/System and hack Android and upcoming [Raspberry Pi](http://www.raspberrypi.org/) devices using it. ;-)

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [5:22 PM](https://www.red-lang.org/2011/12/arm-support-released.html "permanent link") [5 comments:](https://www.red-lang.org/2011/12/arm-support-released.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6664863342948627807&from=pencil "Edit Post")

Labels: [Android](https://www.red-lang.org/search/label/Android), [announce](https://www.red-lang.org/search/label/announce), [ARM](https://www.red-lang.org/search/label/ARM), [bridge](https://www.red-lang.org/search/label/bridge), [iOS](https://www.red-lang.org/search/label/iOS), [java](https://www.red-lang.org/search/label/java), [objective-c](https://www.red-lang.org/search/label/objective-c), [release](https://www.red-lang.org/search/label/release), [shared libraries](https://www.red-lang.org/search/label/shared%20libraries)

## September 21, 2011

[]()

### [Red/System v0.2.2 released](https://www.red-lang.org/2011/09/redsystem-v022-released.html)

This release is mainly a bugfix release that solves several old issues. It is also now correctly synchronized with all the [current bindings](http://www.red-lang.org/p/contributions_21.html) done for Red/System. The main changes are:

- Internal compiler refactoring of: expressions compilation, type casting and ANY/ALL support.
- Greatly improved runtime error reporting: now it reports both source line number and source file name where the error occured. It works in debug mode only (-g command-line option).
- Aliased struct names can now be [tested separately](http://static.red-lang.org/red-system-specs.html#section-13.6.7) in typed (RTTI) functions.
- Callback function attribute removed. It is no more needed and any function can now be used as a callback. In addition a new [cdecl](http://static.red-lang.org/red-system-specs.html#section-6.3.2) attribute is now accepted to allow the switch to C calling convention, when passing a function as argument to an imported C function.
- [21 issue reports](https://github.com/red/Red/issues?milestone=2&state=closed) closed.
- More than 2000 new unit tests were added (mostly generated using scripts wrote by Peter WA Wood) for a total of now 8613 tests.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:30 PM](https://www.red-lang.org/2011/09/redsystem-v022-released.html "permanent link") [7 comments:](https://www.red-lang.org/2011/09/redsystem-v022-released.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3652294343559411059&from=pencil "Edit Post")

Labels: [alias](https://www.red-lang.org/search/label/alias), [bugfixes](https://www.red-lang.org/search/label/bugfixes), [callback](https://www.red-lang.org/search/label/callback), [compilation](https://www.red-lang.org/search/label/compilation), [red/system](https://www.red-lang.org/search/label/red%2Fsystem), [release](https://www.red-lang.org/search/label/release), [runtime errors](https://www.red-lang.org/search/label/runtime%20errors)

## September 20, 2011

[]()

### [Red at Software Freedom Day 2011](https://www.red-lang.org/2011/09/red-at-software-freedom-day-2011.html)

I have been invited at the [Software Freedom Day 2011](http://www.softwarefreedomday.eu/) (September 14th) to give a talk about Red. Here are the presentation slides and the video.

If you are experiencing issues seeing the slides in flash format, here's a [PDF version](http://static.red-lang.org/Red-SFD2011-45mn.pdf).

I am not a great speaker, so you might want to go through the slides first, and eventually have a look at my corresponding comments in the video (it is too long anyway). I need to make shorter and faster presentations in the future.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [10:50 PM](https://www.red-lang.org/2011/09/red-at-software-freedom-day-2011.html "permanent link") [11 comments:](https://www.red-lang.org/2011/09/red-at-software-freedom-day-2011.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2996933761279574070&from=pencil "Edit Post")

Labels: [conference](https://www.red-lang.org/search/label/conference), [presentation](https://www.red-lang.org/search/label/presentation), [SFD](https://www.red-lang.org/search/label/SFD)

## August 10, 2011

[]()

### [Red/System v0.2.1 released](https://www.red-lang.org/2011/08/redsystem-v021-released.html)

This new release is bringing a lot of important bug fixes and some new features for Red/System. The new PRINT function might break some existing scripts, but should be easily fixable.

**New features**

- Variable-arguments function [support](http://static.red-lang.org/red-system-specs.html#section-6.3.3)
- [RTTI](http://en.wikipedia.org/wiki/Run-time_type_information) function limited [support](http://static.red-lang.org/red-system-specs.html#section-6.3.4)
- Polymorphic and variadic [PRINT](https://github.com/red/Red/blob/master/red-system/runtime/utils.reds) function
- Command-line arguments [access](http://static.red-lang.org/red-system-specs.html#section-13.6)
- Added stack low-level manipulation native [functions](http://static.red-lang.org/red-system-specs.html#section-13.4): push, pop
- [Access](http://static.red-lang.org/red-system-specs.html#section-13.6.4) to stack pointer and stack frame pointer (reading/writing)
- Subtracting two pointers is now possible
- Preprocessor improved to solve macros recursively
- New built-in hexdump debugging [functions](http://groups.google.com/group/red-lang/browse_thread/thread/328574b2a776f24?hl=en)
- External library access unit tests (thanks to Peter)

PRINT function examples:

`print 123 123 print "hello" hello print [123 "hello"] 123hello print [123 tab "hello" lf "world" lf] 123 hello world a: 1 < 2 b: "hello" print [a tab b/2] true e`

**Bugfixes**

- Complex arithmetic expressions involving pointers, path access and type casting are now much more reliable. [89 new unit tests](https://github.com/red/Red/blob/master/red-system/tests/source/units/math-mixed-test.reds) were written to help fix the bugs and track regressions.

<!--THE END-->

- Complete list of fixed issues available in [Github's tracker](https://github.com/red/Red/issues?milestone=1&state=closed).

**Specification document**

- Updated to match all new and changed features

**Red runtime**

- Memory allocator [implemented](https://github.com/red/Red/blob/master/red/runtime/allocator.reds) in Red/System, documentation is pending.

As you can see, no vacation this summer for Red project!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:51 PM](https://www.red-lang.org/2011/08/redsystem-v021-released.html "permanent link") [6 comments:](https://www.red-lang.org/2011/08/redsystem-v021-released.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7799987888046136764&from=pencil "Edit Post")

Labels: [bugfixes](https://www.red-lang.org/search/label/bugfixes), [features](https://www.red-lang.org/search/label/features), [red/system](https://www.red-lang.org/search/label/red%2Fsystem), [release](https://www.red-lang.org/search/label/release), [stack](https://www.red-lang.org/search/label/stack), [tests](https://www.red-lang.org/search/label/tests)

## July 17, 2011

[]()

### [Mac OS X port released!](https://www.red-lang.org/2011/07/mac-os-x-port-released.html)

Red/System Mac OS X port is now completed and on par with Windows and Linux ports. The new Mach-O file emitter supports all current Red/System's features including [#syscall](http://static.red-lang.org/red-system-specs.html#section-9.2) and [#import](http://static.red-lang.org/red-system-specs.html#section-9.1) directives.

Now that all major 3 OS are supported, I can say that the Mac OS X [file ABI](http://developer.apple.com/library/mac/#documentation/DeveloperTools/Conceptual/MachORuntime/Reference/reference.html) and [function call ABI](http://developer.apple.com/library/mac/#documentation/DeveloperTools/Conceptual/LowLevelABI/130-IA-32_Function_Calling_Conventions/IA32.html%23//apple_ref/doc/uid/TP40002492-SW4) are really the most complicated one to support from scratch, the Windows one ([PE/COFF](http://msdn.microsoft.com/en-us/windows/hardware/gg463119)) being the simplest (with its own set of oddities, but simpler) and Linux's [ELF](http://refspecs.freestandards.org/elf/) somewhere in between. Among the issues we had to identify and deal with:

- Stack alignment on 16 bytes constraint at the point of every library call (meet with the infamous ["gate keeper"](http://blogs.embarcadero.com/eboling/2009/05/20/5607) code causing segfaults and bus errors on misaligned calls)

<!--THE END-->

- Extra stack entry for each [BSD system call](http://www.freebsd.org/doc/en/books/developers-handbook/book.html#X86-SYSTEM-CALLS).

<!--THE END-->

- Working around dynamically linked libraries [info extraction](http://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/MachORuntime/Reference/reference.html#//apple_ref/doc/uid/20001298-dylib) that need to be copied from each library header to the generated executable image. This could have prevented cross-compilation.

<!--THE END-->

- The need for direct CALL opcode in the generated IA-32 code instead of indirect ones used for PE and ELF library function callings.

After a lot of efforts spent mostly in debugging, here is the result:

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_uAn0bCDZw8VYhXInm4c3ZkoeTma7e0bwhB6wHHCze2-le6bhBXrFudtpStjGT3o--aJpTSbJ_FIB_GtQXuBA_vzGFgr_u8y8fo639oniFEbFW4sg=s0-d "Click to zoom")](http://static.red-lang.org/MacOSX-hello.png)

As you can see, it is fully functional and all unit tests are passing!

A couple of notes about usage:

- The library you declare in #import definition needs to be located in /usr/lib/ or else, you need to provide a full path to the library.

<!--THE END-->

- The file emitter should support up to 255 imported libraries (Mach-O limit), but it has been tested only with one so far (libc.dylib), so if you have anything odd happening with more than one imported library, please fill a bug report in [github's tracker](https://github.com/red/Red/issues), or post a message to the mailing-list.

Enjoy!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [7:52 PM](https://www.red-lang.org/2011/07/mac-os-x-port-released.html "permanent link") [3 comments:](https://www.red-lang.org/2011/07/mac-os-x-port-released.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2028995277217897490&from=pencil "Edit Post")

Labels: [announce](https://www.red-lang.org/search/label/announce), [MacOSX](https://www.red-lang.org/search/label/MacOSX), [port](https://www.red-lang.org/search/label/port)

## July 4, 2011

[]()

### [Red/System goes beta!](https://www.red-lang.org/2011/07/redsystem-goes-beta.html)

This is a major milestone reached on the Red [roadmap](http://www.red-lang.org/p/about.html). Red/System is now in a beta state, which means that it is good enough, both in design and implementation to be used for building applications.

A huge collective effort has been made by all contributors to reach that state during June, in a single month, we produced:

- 190 new commits (total = 354 now), more in a month than in the three previous ones!
- 3600 more unit tests (total = 6230 now)
- 2800 more LOC (total ~ 6000 LOC now)
- 70 issues closed on github's [tracker](https://github.com/red/Red/issues)
- 8 more revisions of specification document

This is what can be called an "intense" month of work!

There are still a lot of features that are lurking in the corner for inclusion. Red/System features are not set in stone, the language will evolve to match our needs, as a support tool for building Red. It will now follow a bit more organized release cycle to help users and contributors have a more stable base to work with.

The version number has been bumped to v**0.2.0**. From now on, only non-disruptive changes will be pushed on the main branch, other changes will go into a separate development branch until we decide to make a new release, merge new features and increment the version number. This cycle should be short, on a weekly basis (each week or two, depending on the development branch content). If this organization does not fit well the development progress, we will adapt to a more adequate one.

I cannot resist to show you the new unit testing output when running the complete tests suite (just run the %tests/run-all.r script):

```
Quick-Test v0.5.0
REBOL 2.7.6.3.1
Red/System Test Suite

ok - logic.............................76 / 76
ok - integer............................0 / 0
ok - byte..............................40 / 40
ok - c-string..........................20 / 20
ok - struct...........................116 / 116
ok - pointer...........................68 / 68
ok - cast..............................66 / 66
ok - alias.............................22 / 22
ok - length............................11 / 11
ok - null..............................11 / 11
ok - not...............................24 / 24
ok - size..............................36 / 36
ok - function...........................2 / 2
ok - exit...............................9 / 9
ok - return............................24 / 24
ok - modulo............................20 / 20
ok - infix..............................2 / 2
ok - conditional.......................13 / 13
ok - byte-auto.......................3492 / 3492
ok - integer-auto....................2106 / 2106
ok - alias-compile......................3 / 3
ok - cast-compile......................16 / 16
ok - comp-err...........................4 / 4
ok - exit-err...........................3 / 3
ok - int-literals-err...................1 / 1
ok - output.............................3 / 3
ok - return-err.........................5 / 5
ok - conditions-required-err...........23 / 23
ok - inference-err......................1 / 1
ok - callback-err.......................3 / 3
ok - infix-err..........................2 / 2
ok - not................................1 / 1

ok - Red/System Test Suite...........6230 / 6230
  in 0:00:16.3
```

A big thank to all the following contributors who are working hard each day to help me bring Red to life:

Andreas Bolka

Rudolf W.Meijer

Kaj de Vos

Peter W A Wood

Cheers!

**EDIT**: for those coming here for the first time and willing to test Red/System, please follow the link to Github's [repository](https://github.com/red/Red), you will find some instructions there for getting started.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:57 PM](https://www.red-lang.org/2011/07/redsystem-goes-beta.html "permanent link") [8 comments:](https://www.red-lang.org/2011/07/redsystem-goes-beta.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4048583890737961405&from=pencil "Edit Post")

Labels: [announce](https://www.red-lang.org/search/label/announce), [beta](https://www.red-lang.org/search/label/beta), [red/system](https://www.red-lang.org/search/label/red%2Fsystem)

## May 31, 2011

[]()

### [Short look on last three months](https://www.red-lang.org/2011/05/three-months-have-passed-since-red-has.html)

Three months have passed since Red has gone public. It seems short, but a lot happened since then and I wanted to sum up the work accomplished for the people interested in Red that don't have the time to follow the progress daily on every channel.

**Development**

- Red/System is implemented at 98%
- ~2600 unit tests were created (thanks to Peter WA Wood)
- Red/System language [specification draft](http://static.red-lang.org/red-system-specs.html) added, now close to 95% of completion
- Code base almost doubled: 60KB to 110KB (~3200 [LOC](http://en.wikipedia.org/wiki/Source_lines_of_code))
- 164 commits on Github, 44 by contributors
- 4600+ page views on [Github's Red repository](https://github.com/red/Red)

**Main new features**

- New datatypes: byte!, logic!, pointer!
- Linux port (thanks to Andreas Bolka)
- [Syllable](http://development.syllable.org/news/2011-05-28-00-37-First-Red-program-on-SyllableDesktop.html) port (thanks to Andreas and Kaj)
- MacOS X port in progress

**Community**

- 0MQ library support (Kaj de Vos)
- Quick-Test framework (Peter WA Wood)
- 3 contributors on Github, 22 followers
- 65 issues opened on Github, 53 closed (thanks to Rudolf Meijer)
- 8 blog posts, 10'000+ page views
- [#red\_lang](http://twitter.com/#red_lang): 130 tweets, 39 followers
- Mailing-list: 32 members, 45 topics, 150 posts
- IRC: 5 people permanently logged

Last but not least, we got an article on [OSNews](http://www.osnews.com/story/24798/New_Red_Programming_Language_Gets_Syllable_Backend) two days ago that boosted the page views on red-lang.org (+3'000) and Github's repo (+1'000).

Thanks for all people supporting Red, one way or another. This is a very good start and a big incentive for me to work even harder on the next steps.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [1:06 PM](https://www.red-lang.org/2011/05/three-months-have-passed-since-red-has.html "permanent link") [5 comments:](https://www.red-lang.org/2011/05/three-months-have-passed-since-red-has.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4204867250575088451&from=pencil "Edit Post")

Labels: [stats](https://www.red-lang.org/search/label/stats), [sum up](https://www.red-lang.org/search/label/sum%20up)

## May 25, 2011

[]()

### [Red meeting on 28/05 at Lille](https://www.red-lang.org/2011/05/red-meeting-on-2805-at-lille.html)

I will present Red language and the [Cheyenne](http://cheyenne-server.org/) Web Server at Lille (France) on May, 28 to a group of REBOL and Red users. The presentations will be done in french, but if some none-french speakers want to come, I will try to do it both in french and english.

![](https://lh6.googleusercontent.com/_6six7KAARqg/TdFxOA2sFrI/AAAAAAAAAC0/AKiT701XMko/logo_chtirug2011_ibs.PNG)

Detailed information to get there are available in [this thread](http://www.digicamsoft.com/cgi-bin/rebelBB.cgi?thread=%3C13Apr2011223518126724200%3E) from RebelBB forum. See you there on Saturday!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [7:25 PM](https://www.red-lang.org/2011/05/red-meeting-on-2805-at-lille.html "permanent link") [3 comments:](https://www.red-lang.org/2011/05/red-meeting-on-2805-at-lille.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=8188497610578869339&from=pencil "Edit Post")

Labels: [meeting](https://www.red-lang.org/search/label/meeting), [presentation](https://www.red-lang.org/search/label/presentation), [user group](https://www.red-lang.org/search/label/user%20group)

## May 14, 2011

[]()

### [Red/System compiler overview](https://www.red-lang.org/2011/05/redsystem-compiler-overview.html)

**Source Navigation**

As requested by several users, I am giving a little more insights on the Red/System compiler inner workings and a map for navigating in the source code.

Current Red/System source tree:

```
 red-system/
     %compiler.r        ; Main compiler code, loads everything else
     %emitter.r         ; Target code emitter abstract layer
     %linker.r          ; Format files loader
     %rsc.r             ; Compiler's front-end for standalone usage

 formats/               ; Contains all supported executable formats
     %PE.r              ; Windows PE/COFF file format emitter
     %ELF.r             ; UNIX ELF file format emitter

 library/               ; Third-party libraries

 runtime/               ; Contains all runtime definitions
     %common.reds       ; Cross-platform definitions
     %win32.r           ; Windows-specific bindings
     %linux.r           ; Linux-specific bindings

 targets/               ; Contains target execution unit code emitters
     %target-class.r    ; Base utility class for emitters
     %IA32.r            ; Intel IA32 code emitter

 tests/                 ; Unit tests
```

Once the compiler code is loaded in memory, the objects hierarchy looks like:

```
 system/words/          ; global REBOL context

 system-dialect/        ; main object
     loader/            ; preprocessor object
         process        ; preprocessor entry point function
     compiler/          ; compiler object
         compile        ; compiler entry point function

 emitter/               ; code emitter object
      compiler/         ; short-cut reference to compiler object
      target/           ; reference the target code emitter object
          compiler/     ; short-cut reference to compiler object

 linker/                ; executable file emitter
     PE/                ; Windows PE/COFF format emitter object
     ELF/               ; UNIX ELF format emitter object
```

Note: the linker file formats are currently statically loaded, this will be probably changed to a dynamic loading model.

**Compilation Phases**

The compilation is a process that goes through several phases to transform a textual source code to an executable file. Here is an overview of the process:

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_sBHBDZU55VA4ATz3nvJy5MCgUIUxgJI9lNEjkYN7pLOzDAub7vgju4S-wuQ6SFVI-qgzJtb1i_sBntRuP5uWzn2jcWZV9H4qvLNcl5xkdEmLzfcCU=s0-d)](http://static.red-lang.org/compilation-process.png)  
**1) Source loading**

This is a preparatory phase that would convert the text source code to its memory representation (close to an [AST](http://en.wikipedia.org/wiki/Abstract_syntax_tree)). This is achieved in 3 steps:

1. source is preprocessed in its text form to make the syntax REBOL-compatible
2. source is converted to a tree of nested blocks using the REBOL's LOAD function
3. source is postprocessed to interpret some compiler directives (like #include and #define)

**2) Compilation**

The compiler walks through the source tree using a [recursive descent](http://en.wikipedia.org/wiki/Recursive_descent_parser) parser. It attempts to match keywords and values with its internal rules and emits:

- the corresponding machine code in the code buffer
- the global variables and complex data (c-string! and struct! literals) in the data buffer

The internal entry point function for the compilation is compiler/comp-dialect. All the compiler/comp-* functions are used to recursively analyze the source code and each one matches a specific semantic rule (or set of rules) from the Red/System language [specification](http://static.red-lang.org/red-system-specs.html).

The production of [native code](http://en.wikipedia.org/wiki/Native_code) is direct, there is no intermediary representation, machine code is generated as soon as a language statement or expression is matched. This is the simplest way to do it, but code cannot be efficiently optimised without a proper [Intermediate Representation](http://en.wikipedia.org/wiki/Intermediate_representation) (IR). When Red/System will be rewritten in Red, a simple IR will be introduced to enable the full range of possible code optimisations.

As you know, a Red/System program entry point is at the beginning of the source code. During the compilation, the source code in the global context is compiled first and all functions are collected and compiled after all global code. So the generated code is always organised the same way:

- global code (including proper program [finalization](http://en.wikipedia.org/wiki/Exit_code))
- function 1
- function 2
- ...

The results of the compilation process are:

- a global [symbol table](http://en.wikipedia.org/wiki/Symbol_table)
- a machine code buffer
- a global data buffer
- a list of functions from external libraries (usually these are OS API mappings)

The compiler is able to process one or several source files this way before entering the linking phase.

**3) Linking**

The linking process goal is to create an executable file that could be loaded by the target platform. So the executable file needs to conform to the target [ABI](http://en.wikipedia.org/wiki/Application_binary_interface) for that, like [PE](http://en.wikipedia.org/wiki/Portable_Executable) for Windows or [ELF](http://en.wikipedia.org/wiki/Executable_and_Linkable_Format) for Linux.

During the linking, the global symbol table is used to "patch" the code and data buffer (see linker/resolve-symbol-refs), inserting the final memory address for the pointed resources (variable, function, global data). The different parts to assemble are grouped into so-called "sections", that can be themselves be grouped into "segments" (as, e.g., in ELF).

Finally, some headers describing the file and its sections/segments are inserted to complete the file. The file is then written down on disk, marking the end of the whole process.

Static linking of external libraries (\*.lib, \*.a,...) will be added at some point in the future (when the need for such feature will appear).

I hope this short description gives you a better picture on how Red/System compiler works, even if it is probably obvious for the most experienced readers. Feel free to ask for more in the comments, or better, on the Google Groups [mailing-list](http://groups.google.com/group/red-lang?hl=en).

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [5:20 PM](https://www.red-lang.org/2011/05/redsystem-compiler-overview.html "permanent link") [5 comments:](https://www.red-lang.org/2011/05/redsystem-compiler-overview.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=5234543376407311649&from=pencil "Edit Post")

Labels: [compilation](https://www.red-lang.org/search/label/compilation), [compiler](https://www.red-lang.org/search/label/compiler), [linker](https://www.red-lang.org/search/label/linker), [loader](https://www.red-lang.org/search/label/loader), [sources](https://www.red-lang.org/search/label/sources)

## April 17, 2011

[]()

### [Update on Red/System progress](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html)

Here is a quick update on Red/System progress.

**Specifications Draft**

Draft has gone through several revisions. Several decisions mainly regarding pointers handling have been taken with simplification and disambiguation as main goals:

- Struct! values are now passed by reference (a syntax for passing by value will be added in future), simple arithmetic (+, -) can be used on struct references.

<!--THE END-->

- String! was renamed to c-string! to avoid possible future collision with a Unicode-aware string! type. However, this case is not totally solved, there are still some possible issues, like the [literal syntax](http://groups.google.com/group/red-lang/browse_thread/thread/e1f1b06d4ae58004?hl=en). As c-string! values are passed by reference, simple arithmetic was added too.

<!--THE END-->

- Pointer! datatype was restricted to point to integer! values only. It is more consistent with new c-string! and struct! which are both (implicit) pointers already, and that removes the need for verbose pointer syntax.

<!--THE END-->

- Array! datatype: no decision taken for now, we will see if (both explicit and implicit) pointer arithmetic support will be sufficient during Red's runtime implementation.

<!--THE END-->

- Logic! datatype was added as a first class type. This makes boolean literal values (true, false) and conditional expressions assignable to variables and can be passed as argument or returned by user functions. Logical NOT operator was also added as well.

<!--THE END-->

- Byte! datatype (unsigned byte value) was added to ease string byte accesses.

<!--THE END-->

- Limited type inference was added for function's local variable and return value types.

A couple of things to keep in mind about Red/System design:

- during the implementation of these specifications, some better design options might appear in light of the implementation decisions.

<!--THE END-->

- at some point, when the bootstrapping phase will be over, Red/System will be rewritten entirely in Red, giving an opportunity to fix and improve the design (also helped by several months of feedback from Red/System usage).

**Implementation Progress**

Several items from the [todo-list](https://github.com/red/Red/wiki) have been implemented in the last week, the most notable ones being:

- [Logic!](http://static.red-lang.org/red-system-specs.html#section-4.3) datatype support
- [NOT](http://static.red-lang.org/red-system-specs.html#section-13.2) function addition
- [EXIT and RETURN](http://static.red-lang.org/red-system-specs.html#section-6.6) support (for early exit from functions)

Among other changes:

- ELF emitter has been extended a bit to support sections table (thanks to Andreas).

<!--THE END-->

- An experimental Mach-O (OS X) support is under work by Rebolek.

<!--THE END-->

- Several unit test files have been added to the repository recently, using a temporary minimalistic approach, that will be soon superseded by a real dedicated framework.

<!--THE END-->

- We are close to have a nice, small and lean unit test framework (Quick Test), created by Peter W A Wood for Red/System, covering all our needs (internal and external testing).

An interesting side note on how implementation can influence back the design:

During the implementation of Quick Test framework, Peter, while writing an integer to string conversion function, came up with a code pattern that is common in REBOL, but wasn't planned for Red/System: declaring private functions inside a function to hide them from global context. The pattern looked like this:

```
    prin-int: func [...][
        ...
        prin-digit: func [...][...]
        ...
        prin-digit ...
        ...
    ]
```

I was surprised when I tested the code he sent me, as I never did anything in the implementation to support such case explicitly. It was working because of a side-effect caused by the way functions are compiled in Red/System: the functions bodies are all gathered and compiled at the end of the global context code, regardless of where they are defined. The side-effect making the inner "prin-digit" function private is caused by a global function variable being declared inside a local scope, but without being part of the function [specification block](http://static.red-lang.org/red-system-specs.html#section-6). So, once the outer function compiled, the "prin-digit" symbol is lost, making the function unreachable from global context and forever hidden.

I was thinking about adding a way for users to create private contexts much later in the future (relying on Red/System source header), but we have the opportunity to have an equivalent feature, right now and without adding anything to the code! So, I am giving it some time to see if the side-effect can be safely made permanent to keep that feature, and in the meantime, added it to the [Possible Evolutions](http://static.red-lang.org/red-system-specs.html#section-14) part of the specifications.

In the next days, I will work on:

- finishing implementing the features from the todo-list
- merging the unit tests framework once ready
- adding new unit tests

In my next blog article, I will give an overview of Red/System compiler internals as requested by some followers.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [12:01 PM](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html "permanent link") [9 comments:](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4909079168928103211&from=pencil "Edit Post")

Labels: [context](https://www.red-lang.org/search/label/context), [specs](https://www.red-lang.org/search/label/specs), [tests](https://www.red-lang.org/search/label/tests), [update](https://www.red-lang.org/search/label/update)

## March 29, 2011

[]()

### [Red/System draft specifications released](https://www.red-lang.org/2011/03/i-have-published-yesterday-first-draft.html)

I have published yesterday the first draft of Red/System's [specifications](http://static.red-lang.org/red-system-specs.html). It is amazing how much time and energy writing such formal description can take. It is a working draft, so expect it to be updated often during next weeks. The document source is in [MakeDoc](http://www.rebol.net/docs/makedoc.html) format and stored on [github](https://github.com/red/Red/tree/master/docs), so feel free to fix typos and errors directly there.

As all features in the specifications are not yet implemented (I would say 85% is already done), I have added a todo-list on [github's wiki](https://github.com/red/Red/wiki) to track the missing parts.

Also, all features are not yet set in stone, there are still a few important design decisions to take in the next weeks:

- **Pointer!** datatype: should we keep it or consider that struct! datatype can do the same job, so it's not worth the trouble of supporting an additional type for the syntactic sugar? Let's take an example with a pointer on integer and struct having a single integer member:
  
  ```
  p: &[integer! 0]
  p/value: 123
  
  p: struct [value [integer!]]
  p/value: 123
  ```
  
  Looks pretty much the same. Pointers have a shorter literal form, but once declared, structs could be used the same way and replace pointers in all use-cases.

<!--THE END-->

- **Array!**: will it be necessary to add a standalone array! datatype or could its semantics be simply added to struct! or pointer! (if finally kept)?

<!--THE END-->

- **Boolean**s: there's currently no true/false support in Red/System, so that boolean values are not first class (can't be assigned nor passed as argument). This is quite limiting the expressibility of the language. Is using simple integer values (0,1 or 0,-1) enough or will it be better to support it as a separate datatype (logic!)?

The answers to these questions will come while working on unit tests and coding Red's runtime (written in Red/System). Feel free to share your thoughts about these features here, in comments, or on Google groups.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:38 PM](https://www.red-lang.org/2011/03/i-have-published-yesterday-first-draft.html "permanent link") [11 comments:](https://www.red-lang.org/2011/03/i-have-published-yesterday-first-draft.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=5198697600760440811&from=pencil "Edit Post")

Labels: [arrays](https://www.red-lang.org/search/label/arrays), [booleans](https://www.red-lang.org/search/label/booleans), [pointers](https://www.red-lang.org/search/label/pointers), [specs](https://www.red-lang.org/search/label/specs)

[]()

### [Comments relaxed](https://www.red-lang.org/2011/03/comments-relaxed.html)

I wasn't aware that the comments on this blog required to have an account on Google/OpenID/... to be able to post comments. It was the default setting, but not my intention to make it hard or painful to post here, so I've relaxed this setting, anonymous posts are now allowed (you just need to pass a captcha).

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:30 PM](https://www.red-lang.org/2011/03/comments-relaxed.html "permanent link") [No comments:](https://www.red-lang.org/2011/03/comments-relaxed.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6927280585888988548&from=pencil "Edit Post")

Labels: [blog](https://www.red-lang.org/search/label/blog)

## March 16, 2011

[]()

### [Having fun with Red/System](https://www.red-lang.org/2011/03/having-fun-with-redsystem.html)

A week after the first alpha release of Red/System compiler for Windows, we now have a working Linux/ELF support, thanks to Andreas help in deciphering the ELF format. Currently only [syscalls](http://en.wikipedia.org/wiki/System_call) are available, the dynamic library linking part is pending, it should be added before the end of March. The following Red/System "hello world" script:

```
Red/System [
   Purpose: "hello world script"
]

print "Hello World!"
```

compiles to a 162 bytes ELF binary, while a similar C code would produce a 5-6KB binary using Gcc...pretty good, no?

I must admit that supporting ELF wasn't in my short-term roadmap, but I changed my mind after seeing that a large part of people following Red project are Linux users. I think it was a good move as Linux users are also often hackers, so more inclined to contribute to an open source project like Red.

I was also impressed, yesterday, when I saw Kaj de Vos publishing a [0MQ](http://www.zeromq.org/) mapping for Red/System (running only on Windows or Wine currently, as it needs dynamic linking). Even at this early stage, he managed to wrap 0MQ's main features. You can get his script [from here](http://rebol.esperconsultancy.nl/extensions/0MQ/ZeroMQ-binding.reds) (requires a libzmq.dll file that can be obtained [from here](http://mark.ossdl.de/2011/01/zmq-and-pyzmq-for-windows/), just put it in the same folder as the compiled binary). Here's the result after compiling and running the server and client versions:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhJ2zHxmDZ7jmAmF0jqjqKb6zFKhmVtf1Fikcz5IJbyeFc9vqHMr8UydMe3UG8BCfBPsGCwNSqqeu4PyTBA3OWKMQPpzozkrjZT_GyTdEGEFmZVSuh-GeE_2wrppQ-3TfAHFdSp96QfwlCq/s400/zeromq.png)

The client sends 10 "Hello" messages to the server that replies to each of them with "World". Oh, did I mention that client.exe and server.exe files size is 3KB? :-)

I hope that people already playing with Red/System enjoy it as much as I did writing it.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:43 AM](https://www.red-lang.org/2011/03/having-fun-with-redsystem.html "permanent link") [3 comments:](https://www.red-lang.org/2011/03/having-fun-with-redsystem.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3668826251704976230&from=pencil "Edit Post")

Labels: [contribution](https://www.red-lang.org/search/label/contribution), [ELF](https://www.red-lang.org/search/label/ELF), [linux](https://www.red-lang.org/search/label/linux)

## March 9, 2011

[]()

### [Taking the Red/System pill](https://www.red-lang.org/2011/03/taking-redsystem-pill.html)

Here we go, this is the first release of **Red/System** dialect. Of course, it's an **early alpha**, don't expect too much from it for now (not crashing would be a success). I know that most of you are eager to see what this looks like, so, you can download right now an archive from github, or better clone the repository from:

[https://github.com/red/red](https://github.com/red/red/tree/v0.1.0)

See the README file for instructions on running the little demo script (tests/hello.reds).

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjczyZdD6cZjwNbs3QTiYSGms09kHZPzflMQ4wGycaE3Aud9FL-sS_wql0a2QMbJkKn_2Io1WevFAxspLdGXjdoAxWt616O_-yJUX1USm7Db1TYWgLL0Hn6hR9HlwkRBJMvcEpL5yrnHGHz/s320/red-pill.png)

**Design &amp; Implementation notes**

Red/System is a low-level dialect (or DSL) of Red. Its main purpose is to allow implementing a small runtime for Red, basically covering three domains:

- Memory management (MAKE primitive)
- Lexical analyzer (LOAD primitive)
- Executable container

So, the feature set of Red/System has been chosen with regards to the goals to reach. Extending them beyond the main purpose is not in the current plan, but could become an interesting side-project for anyone interested in implementation of programming languages.

Red/System relies on a static compiler and a linker in order to produce working code. Here's a short list of currently supported features:

- types: integer!, string! (partial), struct!, pointer! (partial).
- literal strings only for now (can't build or change one at runtime)
- math ops, boolean ops, comparison ops (all as infix operators)
- control flow: if, either, until, while, any, all
- size? function (== sizeof( ) in C)
- length? function (get the size of a string at runtime)
- user functions (with local variables and return value support)
- OS functions importing

Main features not yet implemented:

- function calls and return value type-checking
- no duplicate variables name checking
- no reserved words protection
- int8! and int16! datatypes (maybe int64! too if required)
- pointer values arithmetic
- string's bytes read/write access
- arrays support
- proper minimal runtime for Red/System scripts

The compiler is a naïve one (non-optimizing) using a straightforward approach. It works in 2 passes:

- first pass: lexical analysis producing nested s-expressions (== LOAD)
- second pass: direct compilation from high-level to machine code

There's no intermediary representation, nor assembly mnemonics generation, just direct machine code output. I've used this compiler as an opportunity to prototype several ideas, mostly seeking the simpliest ways to reach to goals, with the best possible performance. Also, I expect to re-use as much code as possible from this compiler for Red's compiler itself. That's the main reason for not choosing C to build the runtime.

So far, the result is quite good, there are a few limited parts that I'm not very happy with, but will probably wait for the re-implementation of Red/System in Red before fixing them:

- Code generation for control flow function: that's the most complicated part in the compiler, mainly caused by the need to generate code in chunks with mutual dependencies to resolve (mixed forward branching). I managed to reduce/hide the complexity somehow, but I'm still not satisfied with the result (in terms of code readability).

<!--THE END-->

- Machine code emitter is too verbose: the emitter (IA32 currently only) is too coarse-grained, this makes it easier to work with, but the CPU-dependent code is much larger than it could be, making the porting effort to other targets, bigger.

In the next days, I'll work on :

- adding missing features
- start writing unit tests and fixing bugs
- documenting Red/System specifications (on github's wiki?)

The goal is to be ready as soon as possible for implementing Red's runtime.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:21 PM](https://www.red-lang.org/2011/03/taking-redsystem-pill.html "permanent link") [No comments:](https://www.red-lang.org/2011/03/taking-redsystem-pill.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4122732075382972404&from=pencil "Edit Post")

Labels: [release](https://www.red-lang.org/search/label/release)

## February 27, 2011

[]()

### [The Journey Begins!](https://www.red-lang.org/2011/02/journey-begins.html)

I've announced yesterday at [ReBorCon 2011](http://reborcon.esperconsultancy.nl/) conference my intention to build a new programming language, strongly inspired by [REBOL](http://rebol.com/). See the slides presented during the conference below.

If you're experiencing issues seeing the slides in flash format, here's a [PDF version](http://static.red-lang.org/red-rebor2011.pdf).

More to come soon, stay tuned!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [4:08 PM](https://www.red-lang.org/2011/02/journey-begins.html "permanent link") [3 comments:](https://www.red-lang.org/2011/02/journey-begins.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=379988351614608156&from=pencil "Edit Post")

Labels: [announce](https://www.red-lang.org/search/label/announce), [conference](https://www.red-lang.org/search/label/conference)

[Newer Posts](https://www.red-lang.org/search?updated-max=2012-12-15T19%3A34%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Home](https://www.red-lang.org/)

Subscribe to: [Posts (Atom)](https://www.red-lang.org/feeds/posts/default)

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

- [►](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
  
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

- [▼](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2011/12/) (1)
    
    - [ARM support released](https://www.red-lang.org/2011/12/arm-support-released.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2011/09/) (2)
    
    - [Red/System v0.2.2 released](https://www.red-lang.org/2011/09/redsystem-v022-released.html)
    - [Red at Software Freedom Day 2011](https://www.red-lang.org/2011/09/red-at-software-freedom-day-2011.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2011/08/) (1)
    
    - [Red/System v0.2.1 released](https://www.red-lang.org/2011/08/redsystem-v021-released.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2011/07/) (2)
    
    - [Mac OS X port released!](https://www.red-lang.org/2011/07/mac-os-x-port-released.html)
    - [Red/System goes beta!](https://www.red-lang.org/2011/07/redsystem-goes-beta.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2011/05/) (3)
    
    - [Short look on last three months](https://www.red-lang.org/2011/05/three-months-have-passed-since-red-has.html)
    - [Red meeting on 28/05 at Lille](https://www.red-lang.org/2011/05/red-meeting-on-2805-at-lille.html)
    - [Red/System compiler overview](https://www.red-lang.org/2011/05/redsystem-compiler-overview.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
    
    - [Update on Red/System progress](https://www.red-lang.org/2011/04/update-on-redsystem-progress.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
    
    - [Red/System draft specifications released](https://www.red-lang.org/2011/03/i-have-published-yesterday-first-draft.html)
    - [Comments relaxed](https://www.red-lang.org/2011/03/comments-relaxed.html)
    - [Having fun with Red/System](https://www.red-lang.org/2011/03/having-fun-with-redsystem.html)
    - [Taking the Red/System pill](https://www.red-lang.org/2011/03/taking-redsystem-pill.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)
    
    - [The Journey Begins!](https://www.red-lang.org/2011/02/journey-begins.html)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)
