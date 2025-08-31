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

## March 26, 2017

[]()

### 0.6.2: LibRed and Macros

It is with great pleasure that we announce the 0.6.2 release of the Red programming language and toolchain. This release is the *second heaviest* one we have ever made (after the [0.6.0](http://www.red-lang.org/2016/03/060-red-gui-system.html)), weighing about **1200** commits! It was intended initially to be a minor one, but the needs for preprocessing support for Red runtime code arose, so it was the right time to make a first iteration into the land of macros. Moreover, the work on *libRedRT* (described below) gave us the opportunity to fulfill one of the goals we had for Red: become embeddable. This is now a reality, thanks to libRed. So the main features of this release are:

- Macros and preprocessor support
- Fast compilation using libRedRT
- LibRed for embedding Red anywhere

Macros

The Red macros and preprocessing abilities have been the topic of a [previous article](http://www.red-lang.org/2016/12/entering-world-of-macros.html), so I invite you to discover them (and hopefully enjoy!) if you have not yet done so.

In addition to this article, it is worth mentioning that a feature called pre-load has been implemented since then (you can read about it down below), which can be used as an entry point for user-provided [reader macros](https://en.wikipedia.org/wiki/Lisp_reader#Read_macros), and allow easier support for non-standard syntax. This is a minor feature, as Rebol-like languages already come strongly equipped for string parsing and processing, thanks to the [Parse](http://www.red-lang.org/2013/11/041-introducing-parse.html) dialect.

Development and release modes for compilation

The biggest change introduced by this new version is the splitting of the compilation process in two modes, which are controlled by different command-line options:

- **development**: (-c) only user code is compiled (new mode).
- **release**: (-r) both user code and Red runtime library are compiled together.

When using -c, the Red runtime library is pre-compiled to a dynamic library called libRedRT ("RT" for RunTime), stored in the hidden red/ folder. When libRedRT is already present, only user code is compiled resulting in drastically shorter compilation times.

When -r option is used, the toolchain compiles user code in *release* mode, compiling with it all dependencies (including Red runtime library).

Here are a couple of simple benchmarks to show the (huge) difference in performance, using [hello.red](https://github.com/red/red/blob/master/tests/hello.red) and [view-test.red](https://github.com/red/red/blob/master/tests/view-test.red) scripts compiled in both modes:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVbh4mxiRxHrttTv6owfreOyioTz82Y4HvVOBadzs1cOaEiBzAeEgUw71XC3G_3dv3I8QO1jJMgnoIo-f2pjqFd9PUgXbFFXyfWlwR8oe0qctZV3R4cBvpdbdq620jC2Y8-zkI_kLdqzFT/s1600/comp-bench1.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVbh4mxiRxHrttTv6owfreOyioTz82Y4HvVOBadzs1cOaEiBzAeEgUw71XC3G_3dv3I8QO1jJMgnoIo-f2pjqFd9PUgXbFFXyfWlwR8oe0qctZV3R4cBvpdbdq620jC2Y8-zkI_kLdqzFT/s1600/comp-bench1.png)

Another benchmark is compiling the Red tests suite (~18000 tests), *unified* way combines the tests into the minimum number of compilation units, while *split* way compiles each test file separately:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhzNl816TJAfracWkOY1JAVzxh-S2XSM3zOtPY7iDxg2U89DohyphenhyphenukPD_MxpprGBkzEzj3MeU5D8v0B0FqPBS5tc-BPnIW7LQvZK8s6uHS9FrA3XiTjJX5mv_Gq8iH0U7-HcjV07p-YfNy8k/s1600/comp-bench2.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhzNl816TJAfracWkOY1JAVzxh-S2XSM3zOtPY7iDxg2U89DohyphenhyphenukPD_MxpprGBkzEzj3MeU5D8v0B0FqPBS5tc-BPnIW7LQvZK8s6uHS9FrA3XiTjJX5mv_Gq8iH0U7-HcjV07p-YfNy8k/s1600/comp-bench2.png)

*Measured on a Corei7 4Ghz Win7/64-bit machine.*

Such performance results in significant daily productivity gains, both for the Red team, and Red users. It was worth the time and effort it took to properly convert the runtime library into a shared library. Though, the full support for modular compilation will come in 0.8.0, which will result in drastic cuts for the compilation time in release mode too.

Such *fast compilation* mode also works for Red scripts that embed Red/System code. Two cases are possible:

1. Red/System code does not contain any call to Red runtime library.
2. Red/System code contains one or several calls to Red runtime library.

In the first case, nothing needs to be done, the usage rules described above apply.

In the second case, a custom version of libRedRT is required, but the toolchain will take care of the process, it just requires the user to compile *once* using -u option, then simply use -c for next compilations. If new functions from the runtime library are called, then a new custom library needs to be rebuilt.

When compiling a custom run-time library, cleaning libRedRT files is needed to get rid of any outdated versions. The toolchain provides a red clear command which will remove all current libRedRT related files. Note that when upgrading the red binary to a newer version, it will automatically upgrade libRedRT on first invocation.

Any Red user code can be compiled in development mode, with the exception of objects with multiple inheritance, which is not supported by libRedRT (so can only be compiled in release mode).

Embedding Red using libRed

LibRed is the embeddable version of the Red interpreter + runtime library. It includes [Parse](http://www.red-lang.org/2013/11/041-introducing-parse.html) dialect, [reactive](http://www.red-lang.org/2016/06/061-reactive-programming.html) programming and our [GUI system](http://www.red-lang.org/2016/03/060-red-gui-system.html) (View engine, VID dialect, Draw dialect). It exposes an interface to the host language through an API, which is C-compatible, so that any language that can embed C shared libraries, can also embed libRed.

The libRed API has been designed to be as simple and as straightforward as possible. See for yourself in the [API documentation](https://doc.red-lang.org/en/libred.html). The role of that API is to provide the required hooks for interfacing the Red runtime and interpreter with the host language. A high-level binding can eventually be built on top of the libRed C-level API, that will best map Red features, to the host language features.

A libRed HelloWorld in C:

```
    #include "red.h"

    int main() {
        redOpen();
        redPrint(redString("Hello World!"));
        redClose();
        return 0;
    }
```

A libRed graphic HelloWorld in C:

```
    #include "red.h"

    int main() {
        redOpen();
        redDo("view [text {Hello World!}]");
        redClose();
        return 0;
    }
```

In addition to the C-level API, we provide also a [binding](https://github.com/red/red/blob/master/libRed/libRed.bas) for VisualBasic for Applications, which can be used to embed Red into Microsoft Office applications!

Here is a demo showing side-by-side an Excel/VB window and a Red window playing Pong game:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiJPojpJpFyuvikXXGvOxKpmdq3rOOcKWMLmXwm13M4am1xz_4KtoGK5ctemb739a2p6Y_m86l5tavKjX0iNqTPOPOjs3NtTrWrT0aNVZoqsIuvs89HKG_wKfk1HWjgBv7x1h2VMGXduHE_/s1600/pong.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiJPojpJpFyuvikXXGvOxKpmdq3rOOcKWMLmXwm13M4am1xz_4KtoGK5ctemb739a2p6Y_m86l5tavKjX0iNqTPOPOjs3NtTrWrT0aNVZoqsIuvs89HKG_wKfk1HWjgBv7x1h2VMGXduHE_/s1600/pong.gif)

All the code for this demo fits in a [single page](http://static.red-lang.org/images/pong-src.png) of VB code! You can get the required files from [here](https://github.com/red/red/tree/master/tests/libRed). In that same Excel file, you will find two other simple examples of integration of Red with Excel sheets, which look like this:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi5zq-3lYXRPy4uUJ4JmfscOzTr6WDYjyKdJy3NX0_XFbWUwq_7zbJakT0TLH21rKR4KUkVstY23xxfXxbfwf6j2vRfDf82ovJ6WKwXRfkAwTV21vdfpm8picVX0hfGoP9GeB9ktI9CTBS9/s640/excel.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi5zq-3lYXRPy4uUJ4JmfscOzTr6WDYjyKdJy3NX0_XFbWUwq_7zbJakT0TLH21rKR4KUkVstY23xxfXxbfwf6j2vRfDf82ovJ6WKwXRfkAwTV21vdfpm8picVX0hfGoP9GeB9ktI9CTBS9/s1600/excel.gif)

Building libRed is straightforward:

```
    red build libred
```

That will build libRed with the *cdecl* ABI, suitable for integration with any C-compatible host. For VBA and MS Office, the *stdcall* ABI is required, which is achieved using:

```
    red build libred stdcall
```

The building process will also result in creating a libRed/ directory locally, expanding [some extra files](https://github.com/red/red/tree/master/libRed) required for linking libRed properly.

Currently, full bindings are provided for C and VisualBasic. Experimental bindings are also available for [Rust](https://github.com/nc-x/libred-rs), [Adobe AIR](https://github.com/Oldes/ANERed) and [C#](https://github.com/koba-yu/LibRedSharp).

This is a first iteration for libRed, we have plans for improving it, and for providing proper multi-instances support (currently limited at one instance per process).

Changes in 0.6.2

Core language

- New datatypes: tag!, email!
- New action: to
- New natives: as, call
- New functions: tag?, email?, hex-to-rgb, sqrt, class-of, face?, distance?, expand-directives, to-\*, rejoin
- Adds integers auto-promotion to floats on loading and on some integer operations.

If you need to preprocess the input to LOAD, you can now do it easily by plugging a function into system/lexer/pre-load. This feature is mostly meant for pre-processing the console's input, though it could also be used for changing some Red syntactic rules. For example:

```
    system/lexer/pre-load: func [src part][replace/all src comma space]

    >> [1,2,3,abd,"hello"]
    == [1 2 3 abd "hello"]
```

Another usage could be to translate words on-the-fly in the console:

```
    system/lexer/pre-load: function [src part][
        parse src [
            any [
                s: [
                    "affiche"       (new: "print")
                    | "si"          (new: "if")
                    | "tant que"    (new: "while")
                    | "pair?"       (new: "even?")
                    | "impair?"     (new: "odd?")
                ] e: (s: change/part s new e) :s
                | skip
            ]
        ]
    ]

    >> i: 10 tant que [i > 0][si impair? i [affiche i] i: i - 1]
    9
    7
    5
    3
    1
```

In addition to several small fixes, load now offers a /trap refinement, which enables manual error management when loading a string series. Instead of raising an error, load/trap will just stop and return a block made of:

- a block of successfully loaded values.
- the input string at the position where the lexer failed.
- an error! value (or none! value if the tail of the string has been reached).

Command-line argument processing has been mostly rewritten to provide a consistent experience across platforms and type of binaries (red executables, console executables, compiled user scripts and, to a lesser extent, Red/System executables). The new features are:

- system/options/script refers to the script name (string! or none!).
- system/options/args refers to a list of tokenized arguments (block! or none!).
- system/script/args refers to the original command-line (string! or none!).
- full Unicode support for red executable's arguments on Windows.
- single-quoted arguments are accepted on all platforms (same as double quotes)
- multiple nested quotes are treated as just one level of quoting when splitting the command-line.

Datatypes conversions are now fully supported in Red! The to action is now officially supported, and make action has been completed. The usual to-&lt;type&gt; helper functions you can find in Rebol, are also now defined. All the conversion rules are documented in an Excel [matrix](https://github.com/red/red/blob/master/docs/conversion-matrix.xlsx) for now.

Call

Calling external applications is also now possible thanks to the contributed code for call function by Bruno Anselme, which has now been integrated into the runtime library. Use help call to explore all the options offered. Note that the /console option, which redirects I/O from child process, is not supported currently by the Red GUI console (it works fine from within the Red CLI console).

View and VID dialect

A number of small changes and fixes have been provided both in View and VID, among them:

- box, h1 to h5 styles added to VID.
- Colors in VID can now be specified as hex values, using #rgb or #rrggbb formats.
- Adds support for no-border flag to area and field face types.
- Adds now option to rate keyword in VID, to fire on-time actor at once.
- The wheel event  and on-wheel actor are now available for handling mouse wheel events.
- Default tab size for area changed to 4 spaces.
- View now uses DirectWrite to draw text in base face (except WindowsXP).
- Better handling of default fonts.
- Enhanced GUI console, with new settings window with pre-selected colors picker.
- A hint text can now be specified in a field options block and a hint keyword has been added to VID. For example:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhaDGgjlSCSx0RCfNPM3PVxnDNZw8LD1Hf70pXpjPHxmuhseYZuZRIOcvz3Db9sYzr8Fop9QHWhKtZpwM5qBSJjTchcyAjyDiA88fJGx4MYJT6fTuNeyh446RSdPZkZ7jLKxHkuOV7yP4MF/s1600/hint-text.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhaDGgjlSCSx0RCfNPM3PVxnDNZw8LD1Hf70pXpjPHxmuhseYZuZRIOcvz3Db9sYzr8Fop9QHWhKtZpwM5qBSJjTchcyAjyDiA88fJGx4MYJT6fTuNeyh446RSdPZkZ7jLKxHkuOV7yP4MF/s1600/hint-text.gif)

Draw dialect

Big additions were made to Draw, most thanks to massive contributions from [Zamlox](https://github.com/Zamlox/):

- Matrix operations support: matrix, invert-matrix, reset-matrix, matrix-order, push, rotate, scale, translate, skew, transform.
- A new clip command is available for defining a clipped drawing/filling region.
- A [Shape](https://doc.red-lang.org/en/draw.html#_shape_commands) sub-dialect has been added for more complex shapes drawing and filling.
- A crop option is now available for image command.
- pen and fill-pen have been vastly extended to allow drawing and filling with gradients, patterns, arbitrary shapes and images. Have a look at some of the new capabilities ([source](https://github.com/red/red/blob/master/tests/complexpen-test.red)):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhPlKT4xOQtpTGLsGygb6xnojJ3WNa2Hz6n-GP1u1alTOqqskJ1r1AjKSyqsQcKyMy51xhtiB4AE8uhgQ-WTFhtlTp0wtQoQFGPiOdZw9_b8MfnHiyFY61sCHrXxg1-6IoRJVqTkJhqoDpQ/s640/complex-pen.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhPlKT4xOQtpTGLsGygb6xnojJ3WNa2Hz6n-GP1u1alTOqqskJ1r1AjKSyqsQcKyMy51xhtiB4AE8uhgQ-WTFhtlTp0wtQoQFGPiOdZw9_b8MfnHiyFY61sCHrXxg1-6IoRJVqTkJhqoDpQ/s1600/complex-pen.gif)

Parse dialect

In addition to some fixes, a few new features were added:

- insert command now also support position argument (like change).
- added pick option to keep, so user can control how keep captures the matched input:
  
  - keep collects matched values as a series if many, or as a value if only one.
  - keep pick collects all the matched values separately in a block.
  - keep copy &lt;word&gt; collects all the matched values as a single series (of same type as input).

Red/System dialect

- Support for float! / float32! conversions from/to integer!.
- Adds system/cpu/overflow? field for reading CPU's [integer overflow state](http://static.red-lang.org/red-system-specs-light.html#section-13.9).
- Adds support for importing variables from shared libraries.
- Allows loading of libraries from current folder and PATH environment variable on macOS.
- Now #call directive supports function calls with refinements.
- Default ABI for exported functions is now settable through export-ABI entry in config object.
- Renamed log and log10 imports from libC, respectively to log-2 and log-10.
- Now size? accepts a context path argument.
- Improved error reporting for "missing argument" errors.

Other changes

- A prototype Red/.Net [bridge](https://github.com/red/red/tree/master/bridges/dotnet) has been introduced.
- New --config \[...] command-line option, for passing a block of compiler settings.
- Added -s and --show-expanded command-line options to output expanded version of compiled source code.
- Added /target option to react?.
- Added /seek and /lines option to write.
- Added /expand refinement to do for preprocessor invocation.
- Added math function for evaluating code using math precedence rules.
- CTRL-L key combination can now clear the GUI console's screen.
- Checksum function can now trigger object on-deep-change event.
- Now keep returns its argument (collect function).
- Added temporary rejoin function.
- Added 'class reflective property to objects.
- Added class-of accessor (only objects).
- Nicer handling of line breaks in molded image! binary buffer.
- Now #include is converted to do in interpreted code (using macros).
- Zero? function is now a native and supports time! values.

Also, more than [150 issues](https://github.com/red/red/issues?q=is%3Aclosed%20milestone%3A0.6.2) have been fixed (and wishes granted) during the last months, [22 issues](https://github.com/red/red/issues?q=is%3Aopen%20is%3Aissue%20label%3Atype.bug) marked as bugs are left open.

Last but not least, our [documentation](http://doc.red-lang.org/) on Gitbook (which is an ongoing work) has been moved to [Asciidoc](http://www.methods.co.nz/asciidoc/) format now, thanks to the efforts of [Tovim](https://github.com/Tovim). That new format will provide us better options for a more accurate control of the styles and layout.

A big thank goes to all contributors who pushed code or who opened tickets clearly identifying issues.

What's Next?

Since 0.6.1, we have adjusted the Red [roadmap](https://trello.com/b/FlQ6pzdB/red-tasks-overview) to work on two releases in parallel. This means that while 0.6.2 was progressing, 0.6.3 was advancing at the same time, is now almost ready, and will be merged into master in a couple of days (if you happen to have a Mac, it contains the macOS GUI backend for Red!). As soon as 0.6.3 is out, 0.7.0 will start (full async I/O), while 0.6.4 (Android) is being worked on. That should provide us a higher number of new releases this year, while still implementing large new features. So far, such approach has worked pretty well.

In the meantime, and as usual, enjoy playing with Red!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [8:22 PM](https://www.red-lang.org/2017/03/062-libred-and-macros.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4427234244398950538&from=pencil "Edit Post")

Labels: [compilation](https://www.red-lang.org/search/label/compilation), [development](https://www.red-lang.org/search/label/development), [libRed](https://www.red-lang.org/search/label/libRed), [libRedRT](https://www.red-lang.org/search/label/libRedRT), [macros](https://www.red-lang.org/search/label/macros), [major](https://www.red-lang.org/search/label/major), [preprocessor](https://www.red-lang.org/search/label/preprocessor), [release](https://www.red-lang.org/search/label/release)

[]()

#### 8 comments:

1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [iArnold](https://www.blogger.com/profile/07150237639041884286)[March 26, 2017 at 8:53 PM](https://www.red-lang.org/2017/03/062-libred-and-macros.html?showComment=1490554403290#c130299988924253630)
   
   Congratulations on this release guys!!  
   Really awesome.  
   (The Mac branch being merged into the master does not yet mean the release of 0.6.3 is done within those few days, just that it will be available for the daily builds and the source from master.)  
   Really hope the GTK3 support for Linux will be picked up soon too, would be awesome to see more contributors from the Linux and BSD communities around.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/130299988924253630)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Eric Guedes Pinto](https://www.blogger.com/profile/01207983487156516739)[March 27, 2017 at 2:32 AM](https://www.red-lang.org/2017/03/062-libred-and-macros.html?showComment=1490574765413#c9152104188294068203)
   
   Impressive!  
   Great job Red !
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/9152104188294068203)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//resources.blogblog.com/img/blank.gif)
   
   @planetsizecpu[March 27, 2017 at 1:54 PM](https://www.red-lang.org/2017/03/062-libred-and-macros.html?showComment=1490615673646#c7605361558669688442)
   
   Good job! stay on the line, we love red-lang.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7605361558669688442)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Josh1](https://www.blogger.com/profile/04686704397228432928)[March 27, 2017 at 7:38 PM](https://www.red-lang.org/2017/03/062-libred-and-macros.html?showComment=1490636295452#c6381594073790868692)
   
   Great. Amazing.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6381594073790868692)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[April 3, 2017 at 4:11 PM](https://www.red-lang.org/2017/03/062-libred-and-macros.html?showComment=1491228695361#c87463245252396073)
   
   Stunning, most major software houses would give their right arms to be able to deliver like this. Really looking forward to R6.3 when the mac gui comes in properly
   
   Cheers  
   David Murphy
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/87463245252396073)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//resources.blogblog.com/img/blank.gif)
   
   David Murphy[April 7, 2017 at 4:41 PM](https://www.red-lang.org/2017/03/062-libred-and-macros.html?showComment=1491576085031#c5040186373387109573)
   
   Looks pretty amazing, waiting especially now for 6.3 to get the official mac gui.
   
   One question, will the bindings for VBA also work in mac versions of Office?
   
   cheers  
   David Murphy
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5040186373387109573)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 8, 2017 at 4:59 AM](https://www.red-lang.org/2017/03/062-libred-and-macros.html?showComment=1491620341531#c8353697480584591418)
      
      In theory it should work, though we haven't tested on Mac Office version (we don't have MSOffice for Mac). It is also unclear which calling convention is Microsoft using for Office on Mac, so both \`cdecl\` and \`stdcall\` builds of libRed should be tried.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/8353697480584591418)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
7. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[April 13, 2017 at 11:28 AM](https://www.red-lang.org/2017/03/062-libred-and-macros.html?showComment=1492075736066#c8458090556909976160)
   
   Thanks Nenad I will try and find some time to give it a go and report back any issues.
   
   David Murphy
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8458090556909976160)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=4427234244398950538&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2017/07/063-macos-gui-backend.html "Newer Post") [Older Post](https://www.red-lang.org/2016/12/incursion-into-explorable-explanations.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/4427234244398950538/comments/default)

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

- [▼](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)
    
    - [0.6.2: LibRed and Macros](https://www.red-lang.org/2017/03/062-libred-and-macros.html)

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
