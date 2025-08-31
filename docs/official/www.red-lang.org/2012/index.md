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

## December 15, 2012

[]()

### [Red v0.3.1: functions support added](https://www.red-lang.org/2012/12/red-v031-functions-support-added.html)

This new milestone brings (finally) functions to **R**ed along with other new features and fixes. Let's first have a quick overview of [0.3.1 release](https://github.com/red/Red/tags) content:

- function support
- path get/set notation support
- refinement support for native functions
- expressions in parentheses compilation
- new datatypes: **function!, paren!, path!, lit-path!, get-path!, set-path!**
- new actions and natives: **find**, **select**, **copy**, **reflect,** **type?, halt,...**
- extended **mold, form** and comparison operators to all new and existing datatypes
- many new mezzanines functions
- modulo and remainder operators on floats implemented for ARM backend
- Quick-Test testing framework ported to **R**ed
- a truckload of new unit tests
- many bugfixes
- about 200 new commits to the Github repository
- updated **R**ed/System formal description document

## Functions

They are declared using a similar syntax to REBOL, with some extensions. The specification block looks like this:

    \[arg1 \[type1] arg2 \[type2]...return: \[type] /local var1 \[type-v1]...]

- Arguments and local variables are declared in the same way as in REBOL
- A return value type can be optionally specified
- Local words can have a type specifier

All type specifiers are optional, adding them will not only allow the compiler to make additional type checkings but also generate faster code in some cases (once the optimizations added to the **R**ed compiler).

Note: argument and return value type checking have not been implemented yet, they need typeset! and error! datatypes to be implemented first.

Functions can be built using several constructors:

- **function**: automatically collects local variables, like \`funct\` in REBOL.

    twice: function \[a \[integer!] /one return: \[integer!]][  
    c: 2  
      a: a * c  
    either one \[a + 1]\[a]  
    ]

- **func**: low-level function constructor, everything needs to be manually specified.

     twice: func \[a \[integer!] /one return: \[integer!] /local c][  
      c: 2  
      a: a * c  
      either one \[a + 1]\[a]  
    ]

- **has**: no argument, just lists local words.

    globals: \[1 2 3 \_]  
      
    foobar: has \[list][  
      if list: find globals '_ \[clear list]  
    ]

- **does**: no argument, no local words.

    quit: does [  
      print "Goodbye cruel world!"  
      halt  
    ]

Early exit points are also there in form of **exit** and **return** functions.

    foobar: func \[a \[integer!] b \[integer! none!]][  
      if none? b \[return none]  
      if b = 0 [  
         print "Error: division by zero"  
         exit  
      ]  
  a / b  
    ]  
   
Refinements are also fully supported, when not used, their value is set to **false** (while in REBOL it is set to **none**).

Still some features are not yet implemented:

- building a function at runtime (requires the ability to JIT-compile source code)
- passing a function as argument (pending)
- tail recursion optimization

Currently functions are using a local context on stack, so their life-time is very short. For indefinite extent support, a closure! type will be added in the next months.

## Path support

Path datatypes were added (**path!, lit-path!, get-path!, set-path!**) to the runtime library and compiler, allowing the use of path notation as syntactic sugar for series access. Getting and setting values using path notation are supported.

Some usage examples:

    list: \[a 5 b \[c 8] d #"e" name: "John"]  
      
    probe list/2 ;-- outputs 5  
    probe list/7 ;-- outputs name:  
    probe list/a ;-- outputs 5  
    probe list/4/2 ;-- outputs 8  
    probe list/b/c ;-- outputs 8  
    probe list/name ;-- outputs "John"  
      
    list/b/c: 0  
    probe list/b/c ;-- outputs 0  
      
    index: 3  
    probe list/:index ;-- outputs b  
    list/:index: 'z  
    probe list/:index ;-- outputs z  
      
Note: notice how words lookups in blocks can work with any word datatypes.

## Paren expressions

**Paren!** datatype and expressions in parentheses compilation support has been added too. They are mainly useful with infix operators in order to force a given execution priority. Example:

    print (1 + 2) * (3 + 4) ;-- outputs 21

## New built-in functions

- actions: **find**, **select**, **copy**, **reflect**

<!--THE END-->

- natives: **type?, halt, function, func, does, has, exit, return**

<!--THE END-->

- mezzanines: **probe, first, second, third, fourth, fifth, last, spec-of, body-of** and all &lt;datatype&gt;? type testing functions.

Existing native or action functions were extended with refinements (like **mold** and **form**). See the [boot.red script](https://github.com/red/Red/blob/master/red/boot.red) for more details.

## Testing

The Quick-Test framework from Peter WA Wood was ported to **R**ed and now powers all the current 1800+ unit tests written in **R**ed itself, mostly added by Peter.

About [32 issues/bugs](https://github.com/red/Red/issues?milestone=8&state=closed) in both **R**ed and **R**ed/System were fixed in this new release.

## Red/System formal description

Last but not least, Rudolf updated his **R**ed/System [formal description document](http://static.red-lang.org/A_BNF_grammar_of_Red_System.pdf) \[PDF, 162KB] to include the additional features like namespaces. Many thanks to him for his remarkable work and support to **R**ed project!

## What's next?

Objects support is next priority along with new natives like **switch** and **case**. Typesets and error handling will probably be added very soon too. Once that part done, the next focus will be to add I/O support!

Many thanks to all the people that have made significant donations in last months to **R**ed project, allowing me to continue to work full time on it! It is really making a big difference, as shown by **R**ed increased progress speed since this summer. Thanks again!

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [7:34 PM](https://www.red-lang.org/2012/12/red-v031-functions-support-added.html "permanent link") [6 comments:](https://www.red-lang.org/2012/12/red-v031-functions-support-added.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1855182468881194522&from=pencil "Edit Post")

Labels: [functions](https://www.red-lang.org/search/label/functions), [path notation](https://www.red-lang.org/search/label/path%20notation), [paths](https://www.red-lang.org/search/label/paths), [release](https://www.red-lang.org/search/label/release), [tests](https://www.red-lang.org/search/label/tests)

## October 28, 2012

[]()

### [Red alpha release](https://www.red-lang.org/2012/10/red-alpha-release.html)

We have all waited long for this to happen, but it is finally there: first Red alpha release!

This is the biggest milestone since the initial release of Red System, as it marks the entrance of the higher layer of the Red software stack. There's still another layer pending, the JIT compiler, but that's for 2013, when Red will be self-hosted.

### What Red can do so far?

So what happened since the first Red compiler release a little more than [a month ago](http://www.red-lang.org/2012/09/red-is-born.html)? We have added quite a lot of features actually:

- **15 datatypes**: block!, string!, char!, integer!, logic!, none!, word!, lit-word!, get-word!, set-word!, refinement!, action!, native!, op!, unset!.

<!--THE END-->

- **19 actions**: make, form, mold, add, divide, multiply, subtract, append, at, back, clear, head, index?, length?, next, pick, poke, skip, tail.

<!--THE END-->

- **21 natives**: if, unless, either, any, all, while, until, loop, repeat, foreach, forall, print, prin, equal?, not-equal?, strict-equal?, lesser?, greater?, lesser-or-equal?, greater-or-equal?, not.

<!--THE END-->

- **10 infix operators**: +, - , \*, /, =, ==, &lt;, &gt;, &lt;=, &gt;=.

String! datatype fully supports Unicode from end to end and in a cross-platform way, according to [our plan](http://www.red-lang.org/2012/09/plan-for-unicode-support.html) (see the [hello.red](https://github.com/red/Red/blob/master/red/tests/hello.red) demo script).

We also have some unit tests (223 [tests](https://github.com/red/Red/tree/master/red/tests/source) right now), but that number should rapidly increase once we will be able to fully port QuickTest framework to Red (in a couple of weeks, once Red will gain functions).

All those features were mostly coded in the last month, some parts are still lacking (e.g. refinements support for actions/natives) but that gives you an idea of the pace at which Red will be further developed.

However, we haven't started yet writting the documentation for Red language, we should decide soon on the kind of documentation we want (hint: you can make propositions about that on the Red [mailing-list](http://groups.google.com/group/red-lang?hl=en) or FB [page](https://www.facebook.com/groups/redlanguage/)). Red API documentation will most probably be generated automatically from source code by extracting doc-strings.

### What's not yet there?

A lot of things, but they will be added progressively until the end of the year, where we should have a pretty complete Red (bootstrap) implementation. So, the main pieces to implement are:

- Red runtime lexer (LOAD native)
- Functions and objects support
- I/O support (including networking)
- More complete memory allocator and a garbage collector.
- Concurrency support
- Additional datatypes

### Can I try it already?

Red codebase is available at [github](https://github.com/red/Red), just clone it locally or download a [packaged](https://github.com/red/Red/tags) version. Some simple instructions to setup and run it can be found [here](https://github.com/red/Red/blob/master/README.md). As we are still at the bootstrap stage, the installation process and usage is more complex than it should be, once self-hosted. Anyway, we should be able to deliver some test binaries soon and simplify the usage for those who want to play with the alpha releases.

### How does Red work?

Currently Red scripts are statically compiled using the %red.r front-end wrapper. The Red lexer loads the UTF-8 encoded Red scripts in memory in form of blocks of values. Those blocks are then compiled to a Red/System script, that gets itself compiled to native code and outputs an executable binary. The Red/System compiler has been enhanced to be able to compile source code directly from memory.

Some compilation options are already available, the famous -t option from Red System is also present, allowing Red to cross-compile any script as easily as with Red/System.

This is just the beginning, so for now, whole Red runtime library is compiled with user scripts each time. We will add modular compilation support at some point to get the full compilation speed back.

You can test the few example Red scripts from the [repository](https://github.com/red/Red/tree/master/red/tests). Here is what the [demo.red](https://github.com/red/Red/blob/master/red/tests/demo.red) script outputs on some of the platforms Red can already run on:

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_uQOa1pBqV6MnFzQDtWE5IvvvO3WEohxdCr3amhIdbKT25J_cfm3I1He205SOxB_vNH9TUUPE7wONEovXJqtN2rxsq3c8J6KD4PNfWpmjMCCSt3=s0-d "Red on MacOS X")](http://static.red-lang.org/mac-rel030.png)[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_s0x8WFs-AVCmlEqgD5AzK0DX0MfMpBoBmcjkCIIO1dEftq3Q7bj8e0lYUQWfKDGyCJ0VuEeMOpDp3TF7TjzGGPP2XPzbKjKK5QUEmXsEGDM7M=s0-d "Red on RaspberryPi")](http://static.red-lang.org/rpi-rel030.png) [![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_t1cmgynlv--bsccTMMUHBB9VnhD0tekl7dMK1nofYaeRWWamBwjUG-QBD0Tfrv7FJD7fo8UvGD8XY_8E-UCubhimyohB-g5gTv-mP0E10NCtrX=s0-d "Red on Linux")](http://static.red-lang.org/lin-rel030.png)[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_t6D29lJraexk4zhyEy-vomT084_U4FxkFvPPY9xZ-XGUZ_sAaFuwuORTHcshtD8nSXCDkGr6kiWuxeJlrFL-bVVUPiukoddNJ3EJaEJyz5zlA=s0-d "Red on Windows")](http://static.red-lang.org/win-rel030.png)

*The missing characters in some of the screenshots are Chinese ones as I only have font support for them on Ubuntu.*

Red was originally conceived to be statically typed. However, during the early stages of Red implementation, it appeared that an hybrid typing system will be more adequate for a language that will support high-level scripting, without the burden of a sophisticated, but slow, type inference engine. The overhead of such inference engine can be very high (cf Scala [slow](https://scala-ide-portfolio.assembla.com/spaces/scala-ide/tickets/1001054#/activity/ticket:) compilation speed ). The hybrid type system works very simply, typing is optional, but if local variables and function returned values are typed by user, the compiler will be able to generate faster code (more than an order of magnitude faster for, e.g., pure math expressions) and catch more programming errors at compile time.

Red compiler does not do any optimization so far, it basically outputs the equivalent of an unrolled interpreter loop. Some optimizations will be added along the development of the bootstrap version of Red,  but the full extent of possible optimizations will be left for the self-hosted Red.  Firstly because the current compiler code is disposable, so we don't want to invest too much time in it, secondly because the final JIT compiler will allow even deeper optimizations thanks to reflection and profiling information collected at runtime.

### Red/System changes

Red/System has been improved significantly during the Red early development:

- function pointer support has been extended and improved, dereferencing is now possible.
- 20 [issues](https://github.com/red/Red/issues?milestone=7&state=closed) have been fixed.
- some long-standing bugs with GTK+ and other bindings on ARM platforms have been fixed.

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_sbN_6SW8gDBHzoFjESg5AC0MBf6xgMzI-Ac3T7X1cRjAa3YXDpBT8PapkPZDbJMJ-E2rzbsZc4gnxv42KhE0YBKckLDoKygmv0RzJgYrSp9CtvMB7wKQ=s0-d "GTK+ Red binding on RaspberryPi")](http://static.red-lang.org/rpi-gtk-widgets.png)

### So, what's coming next?

Red will now mature very quickly, as functions and objects will make their entrance in the next days/weeks. A new Red alpha release is planned very soon, probably for mid-november with a lot of new features.

The work on shared library generation for MacOS and Linux platforms is on-going. Once available, we'll be able to literally "plug" Red in a lot of third-party apps, including other programming languages. Also, this will enable (or make easier) the bridging with some external systems like Java, .Net and objective-c, in order to fully support the main mobile platforms.

As you can see, next months will see some important parts of Red come to life, be sure not to miss them, follow us on our [mailing-list](http://groups.google.com/group/red-lang?hl=en), on [Twitter](http://twitter.com/red_lang), [IRC](http://webchat.freenode.net/?channels=red-lang&uio=d4) and [Facebook](https://www.facebook.com/groups/redlanguage/).

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:53 PM](https://www.red-lang.org/2012/10/red-alpha-release.html "permanent link") [16 comments:](https://www.red-lang.org/2012/10/red-alpha-release.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2945858017054355896&from=pencil "Edit Post")

Labels: [alpha](https://www.red-lang.org/search/label/alpha), [announce](https://www.red-lang.org/search/label/announce), [GTK+](https://www.red-lang.org/search/label/GTK%2B), [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi), [Red](https://www.red-lang.org/search/label/Red), [release](https://www.red-lang.org/search/label/release)

## September 22, 2012

[]()

### [Plan for Unicode support](https://www.red-lang.org/2012/09/plan-for-unicode-support.html)

Red is growing up fast, even if just born two weeks ago! It is time we implement basic string support so we can do our first, real, hello-word. ;-)

Red strings will natively support Unicode. In order to achieve that in an efficient and cross-platform way, we need a good plan. Here is the list of Unicode native formats used by our main target platforms API:

        Windows       : UTF-16  
        Linux         : UTF-8  
        MacOSX/Cocoa  : UTF-16  
        MacOSX/Darwin : UTF-8  
        Java          : UTF-16  
        .Net          : UTF-16  
        Javascript    : UTF-8  
        Syllable      : UTF-8  
     
All these formats are variable-width encodings, requiring any indexed access to pay the cost of walking through the string.

Fortunately, there are also fixed-width Unicode encodings that can be used to give us back constant time for indexed accesses. So, in order to make it the most space-efficient, Red strings will internally support only these encoding formats:

        Latin-1 (1 byte/codepoint)  
        UCS-2   (2 bytes/codepoint)  
        UCS-4   (4 bytes/codepoint)

This is not something new, at least Python 3.3 does it in the [same way](http://www.python.org/dev/peps/pep-0393/).

Additionally, UTF-8 and UTF-16 codecs will be supported, in order to deal with I/O accesses on host platforms.

Red will use UTF-8 for exchanging strings with outer world by default, except when accessing a UTF-16 API is necessary. Conversion for input and output strings will be done on-the-fly between one of the internal representation and UTF-8/UTF-16. When reading an input string, Red will select the most space-efficient internal format depending on highest codepoint in the input string. Also users should be able to force the encoding of a string to a given internal format, when possible.

So far, this is the plan for additing Unicode to Red, a prototype implementation will be done quickly, so we can fine-tune it if required.

Comments and suggestions are welcome.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:57 PM](https://www.red-lang.org/2012/09/plan-for-unicode-support.html "permanent link") [10 comments:](https://www.red-lang.org/2012/09/plan-for-unicode-support.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7121557240206884492&from=pencil "Edit Post")

Labels: [strings](https://www.red-lang.org/search/label/strings), [Unicode](https://www.red-lang.org/search/label/Unicode)

## September 6, 2012

[]()

### [Red is born](https://www.red-lang.org/2012/09/red-is-born.html)

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_ss-OWtbWonNt1V5FwpV-j6kWblkQu1XPBXZyyvl2i2Q-80-mG7Bja2A6ulQeH1YIdGzqwBf7ngjFjpa4NdU-PeD8ZuBzIXMw=s0-d)](http://static.red-lang.org/birth.png)

Yesterday, I finally got my first real Red program compiling and running:

> ```
>     Red []
    print 1
> ```

This doesn't look like much but it proves that the whole current Red stack is working properly. Red compiler generates Red/System code in memory, that is then compiled to native code and linked in a 14KB executable file (contains the full Red runtime with currently 9 datatypes partially implemented).

The baby needs a few more days in the nursery before I commit the new code to the v0.3.0 branch on Github. Once the existing datatypes will be more complete and once we choose how to deal internally with Unicode strings, we should be able to release the first Red alpha.

The current Red compiler is pretty simple and should remain light in the future. I have finally chosen an hybrid dynamic/static type system, to avoid diving into a complex type inference engine now, as I realized that once we get out of the bootstrap and have the final Red JIT-compiler, it will be much more easier to achieve. Also, I want to pass that bootstrap stage as soon as possible, because it is really limiting the full Red potential.

Stay tuned, the next months will be fun! ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:31 PM](https://www.red-lang.org/2012/09/red-is-born.html "permanent link") [15 comments:](https://www.red-lang.org/2012/09/red-is-born.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=897074746811606326&from=pencil "Edit Post")

Labels: [announce](https://www.red-lang.org/search/label/announce), [Red](https://www.red-lang.org/search/label/Red)

## August 20, 2012

[]()

### [Red/System v0.2.6 released](https://www.red-lang.org/2012/08/redsystem-v026-released.html)

The need for more structured code support has arisen with the addition of bigger and more sophisticated bindings like [**GTK**](http://red.esperconsultancy.nl/Red-GTK/timeline) one or the (soon to be released) work on alpha version of Red compiler (which emits Red/System code). So, [v0.2.6](https://github.com/red/Red/tags) introduces **namespaces** support using a very simple, but efficient model.

For example, to encapsulate some variables and functions in a local context:

```
    b: 1
    a: context [
       b: 2
       inc: func [i [integer!] return: [integer!]][
           i + b
       ]
    ]
    a/inc 5                            ;-- will return 7
```

```

```

Local variables take precedence other global ones with same name. This simple rule also applies to nested contexts, the nearest one has priority, e.g.:

```
    a: context [
       b: 123

       c: context [
           #enum colors! [red green blue]
           b: "hello"
           foo: func [][print-line b]
       ]

       print-line b                    ;-- will output 123
       c/foo                           ;-- will output hello
    ]

    print-line a/b                     ;-- will output 123
    a/c/foo                            ;-- will output hello
    print-line a/c/b/2                 ;-- will output e
    print-line a/c/blue                ;-- will output 2
```

As you can see from this example, enumerations can also be defined locally to a context, but not only. Aliases and imported functions can also be defined locally too! With that powerful new feature, you can now modularize your Red/System programs simply and efficiently.

See the [namespaces documentation](http://static.red-lang.org/red-system-specs-light.html#section-7.3) for more features and info.

In this release you will also find several [bugfixes](https://github.com/red/Red/issues?milestone=6&state=closed), mainly for floats support. Thanks to Rebolek for his aggressive floats testing. ;-)

Enjoy!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [11:30 PM](https://www.red-lang.org/2012/08/redsystem-v026-released.html "permanent link") [No comments:](https://www.red-lang.org/2012/08/redsystem-v026-released.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7664256605579329465&from=pencil "Edit Post")

Labels: [context](https://www.red-lang.org/search/label/context), [namespaces](https://www.red-lang.org/search/label/namespaces), [release](https://www.red-lang.org/search/label/release)

## March 29, 2012

[]()

### [Setting up an ARM virtual machine](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html)

***EDIT** (March 8, 2014): Updated for the 1.6.0 QEMU version.*

The recent release of the [Raspberry Pi](http://www.raspberrypi.org/) board raised a new wave of interest for the ARM platforms. As Red/System is already running on ARMv5+ platforms, a number of Red followers might want to test it on these platforms, so this article aims at giving you a quick way to setup a QEMU emulator for ARM and install a Debian GNU/Linux on top of it.

### QEMU

First thing first, let's setup the platform. [QEMU](http://wiki.qemu.org/Main_Page) is the tool we want for that job. As explained on the QEMU web site: "QEMU is a generic and open source machine emulator and virtualizer." The nice thing about QEMU is that it is able to emulate a good range of [ARM platforms](http://wiki.qemu.org/TexiDemo#ARM_System_emulator) with different CPU versions.

QEMU is distributed as a source package, like most of open source tools, however this is not always convenient for Windows users, so you will also find a link to Windows pre-compiled binaries.

- UNIX users: download and compile QEMU from [sources](http://wiki.qemu.org/Download).
- Windows users: download the binaries from this [page](http://lassauge.free.fr/qemu/), or from this [direct link](http://lassauge.free.fr/qemu/release/Qemu-1.6.0-windows.zip) to 1.6.0 zip package (52MB)

### Installing GNU/Linux

The simplest and quickest way to get a Linux/ARM distribution running on top of QEMU is to used pre-installed Debian images. These Virtual Machine images can be found [there](http://people.debian.org/~aurel32/qemu/armel/) along with additional useful information (be sure to read them all). As you can see, there are two kind of images: **standard** and **desktop**. The **desktop** one gives you the full Debian GUI environment pre-installed, but be warned, it is extremely slow, even on my Core i7 box with a medium-level graphic card, so I recommend using the **standard** version pre-installed with Debian Squeeze (latest Debian release).

The files you need from the [debian.org](http://people.debian.org/~aurel32/qemu/armel/) site are (direct links provided for convenience):

- [debian\_squeeze\_armel\_standard.qcow2](http://people.debian.org/~aurel32/qemu/armel/debian_squeeze_armel_standard.qcow2) (169MB)
- [initrd.img-2.6.32-5-versatile](http://people.debian.org/~aurel32/qemu/armel/initrd.img-2.6.32-5-versatile) (2.4MB)
- [vmlinuz-2.6.32-5-versatile](http://people.debian.org/~aurel32/qemu/armel/vmlinuz-2.6.32-5-versatile) (1.2MB)

Put them all somewhere in the same folder.

The command line for starting QEMU with the pre-installed VM is provided on the debian.org page, here is a copy of the right command line for the **standard** VM with 2.6.32 kernel:

```
qemu-system-armw -L Bios -M versatilepb -kernel vmlinuz-2.6.32-5-versatile -initrd initrd.img-2.6.32-5-versatile -hda debian_squeeze_armel_standard.qcow2 -append "root=/dev/sda1"
```

```

```

For Windows users, the easiest way to start it is to make a shortcut on qemu-system-arm , add the command-line arguments and insert the path to the VM files in the "working folder" field.

You can now just run the emulator and boot on Debian to test your environment.

For purists, it is also possible to install the Debian distro from scratch following this step-by-step [tutorial](http://www.aurel32.net/info/debian_arm_qemu.php).

### Making the Virtual Machine communicate

As you will quickly discover, the network connection is not working out of the box, so you need to add more parameters to the command-line to make it work. From my own experience, it is a black art to make it work properly (the documentation is really poor and obscure on that topic), but I ended up making the network work (and the Internet connection through the host platform) by using these additional arguments:

    -net nic -net user

Once the VM is rebooted, you can test it using a ping and then issue an \`apt-get update\` command. In case the ping test passes but not the apt-get, you might have wrong apt source URL, so you can change them by editing the [/etc/apt/sources.list](http://wiki.debian.org/SourcesList) config file.

You have now a working ARM virtual platform, but in order to make it useful for Red/System testing, you need a simple way to pass compiled files to the guest OS (Red/System can only cross-compile to ARM due to the lack of a suitable REBOL interpreter).

In order to achieve that, you need to add new parameters to the command-line in order to map a guest OS TCP port to a host OS port. For example, to map guest OS port 22 (SSH) to port 1222 on host OS, just add:

    -redir tcp:2222::22

So, the VM internal port 22 is now reachable from localhost:1222 on your host OS. You can now use your favorite SSH/SFTP/SCP client to get a remote shell and transfer files to the VM. You might need to setup a SSH server in the VM (I seem to recall that it is not installed by default in the above images), you can achieve that using the following command:

    # sudo apt-get install openssh-client openssh-server

I use SSH for moving files in and out the VM using the still excellent [SSH Secure Shell](http://sils.unc.edu/it-services/servers/using-ssh) tool for Windows, but you could as well use FTP or any other TCP-based suitable protocol.

### Additional settings

You can improve your experience with QEMU by adding more memory to the default emulated ARM platform which only has 128MB. Pushing it to 256MB (same as Raspberry PI Model A board now has) is highly recommended, just add to the command-line:

    -m 256

If you are using a non-english keyboard like myself, you can also emulate your preferred keyboard layout using for example, the following command:

    -k fr

will setup the keyboard with a french layout, other country codes are available [here](http://wiki.qemu.org/TexiDemo#sec_005finvocation). In case you get an error message about the keymap not being found, just copy the Bios/keymaps folder one level up, so that it is just above your qemu-* binaries.

That's all folks, I hope this would have help you get started! *Let me know if there is any error or missing info in this article, and let me know if it worked well for you.*

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:59 PM](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html "permanent link") [6 comments:](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4479797641492781893&from=pencil "Edit Post")

Labels: [ARM](https://www.red-lang.org/search/label/ARM), [Debian](https://www.red-lang.org/search/label/Debian), [linux](https://www.red-lang.org/search/label/linux), [QEMU](https://www.red-lang.org/search/label/QEMU), [tutorial](https://www.red-lang.org/search/label/tutorial)

## March 12, 2012

[]()

### [Red/System v0.2.5 released](https://www.red-lang.org/2012/03/redsystem-v025-released.html)

This is a mainly a bug fixing release with several [issues and bugs](https://github.com/red/Red/issues?sort=created&direction=desc&state=closed&page=1&milestone=5) in float numbers handling solved.

In addition to that:

- Libc is now much better integrated with Red/System, the \_\_libc\_start\_main C internal initialization function is now correctly handled by Red/System on all supported platforms. This ensures that all libraries relying heavily on C will now work as well as if called from a C program. Thanks to Andreas for the nights spent on digging and debugging that.

<!--THE END-->

- The IA-32 floats backend has been improved to keep last float value in FPU rather than passing it to CPU. This change not only simplifies the backend code emitter but also reduces significantly the generated code size for floats. As a side effect, float-intensive programs are now twice as fast as with v0.2.4. The same change could be applied to ARM backend, but with less gains as ARM can easily transfer data between CPU and FPU, as opposed to IA-32 architecture, which requires an intermediary step through memory when using x87 FPU.

By the way, that's our first birthday (technically ten days ago) since Red project was announced for the first time at the ReBorCon 2011 conference in Amsterdam. The initial schedule has been changed several times since then, to better adapt to the very rapid changes that are occurring in the computing world (massive move to mobile devices to name the main one).

After 900+ commits and thanks to all the contributors, we now have solid foundations to build upon, much better than what I expected to have, one year ago. The focus from now is getting the Red language layer up and running as soon as possible. A large window of opportunities is opening in 2012, so let's not miss it!

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [10:58 PM](https://www.red-lang.org/2012/03/redsystem-v025-released.html "permanent link") [14 comments:](https://www.red-lang.org/2012/03/redsystem-v025-released.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6608285167538780954&from=pencil "Edit Post")

Labels: [bugfixes](https://www.red-lang.org/search/label/bugfixes), [floats](https://www.red-lang.org/search/label/floats), [FPU](https://www.red-lang.org/search/label/FPU), [libc](https://www.red-lang.org/search/label/libc), [x87](https://www.red-lang.org/search/label/x87)

## February 17, 2012

[]()

### [Floating point support released](https://www.red-lang.org/2012/02/floating-point-support-released.html)

New Red/System version [0.2.4](https://github.com/red/Red/tags) is out. The main new feature is floating point numbers support. This feature was not planned, but as users were strongly pushing for having it now, we have added partial support for floats. Users can now wrap and use libraries like OpenGL.

New floating point datatypes

Two new IEEE-754 datatypes were added:

- [**float64!**](http://static.red-lang.org/red-system-specs.html#section-4.3) datatype implements [double precision](http://en.wikipedia.org/wiki/Double_precision) (64-bit) floating point numbers. It has an alias named **float!** which is the preferred name (both will be accepted by the compiler anyway).

<!--THE END-->

- [**float32!**](http://static.red-lang.org/red-system-specs.html#section-4.4) datatype implements [single precision](http://en.wikipedia.org/wiki/Single_precision_floating-point_format) (32-bit) floating point numbers.

They are first-class datatypes, so they can be used anywhere, as variables, arguments or returned values.

Float operations

Basic math and comparison operations are supported. Transcendental functions are not predefined yet in the runtime, they need to be imported first from an external library. For equality test, no rounding is applied, so only exact float numbers match will return \`true\`. Adding an "almost-equal" operator is planned, but not available yet.

Also, type casting is allowed between:

- **float!** &lt;=&gt; **float32!**
- **float32!** &lt;=&gt; integer!

Remember to type cast all **float32!** values to **float!** when passing them as argument to C variadic functions. For non-variadic C functions, Red/System's compiler will promote **float32!** to float! automatically.

Limitations

Not all of IEEE-754 standard was implemented yet. See the remaining features to add in this [todo-list](https://github.com/red/Red/wiki/Floating-point-support-todo-list).

Implementation

At low-level, floating point support is architecture-specific:

- **IA-32**: currently uses [x87](http://en.wikipedia.org/wiki/X87) FPU instructions for backward compatibility with older Intel CPU. The default implementation requires a PentiumPro or better. SSE unit support will be added when a proper optimizing compiler will be available. For older CPU support, a new compilation option has been added (\`cpu-version\`), which triggers the use of older opcodes. For example, in order to use floats on older than PentiumPro CPU, you need to add this line in the target definition:   cpu-version: 5.0

<!--THE END-->

- **ARM**: uses the [VFP unit](http://en.wikipedia.org/wiki/ARM_architecture#VFP) when available and was reported to run fine on emulated VFP. When calling some C functions passing or returning float numbers, some ABI mismatching were also reported during the tests, as ARM uses different ABI for passing float numbers as arguments. Our current implementation only use the passing-on-stack convention, adding support for other conventions is not planned, but will be done when really required.

Tests coverage extended

Several thousands new tests were added to the test suite, pushing the total number of unit tests to **11755**. Thanks to Peter for taking care of that.

Decimal support

As [IEEE-754 2008](http://en.wikipedia.org/wiki/IEEE_754-2008) revision introduced several new decimal floating point formats, we plan to support them later in Red/System.

Other feature released: enumeration support

A contributed feature is also part of this new version of Red/System: C-like [enumeration support](http://static.red-lang.org/red-system-specs.html#section-15.2). This contribution was brought by the lead developer of [Amanita Design](http://amanita-design.net/), small independent game developing studio based in Czech Republic, which released the award-winning game [Machinarium](http://amanita-design.net/games/machinarium.html). A new compilation directive was added to declare enumerations: [**#enum**](http://static.red-lang.org/red-system-specs.html#section-15.2).

Last but not least...

We got noticed by Ruby's author, Matz, he [tweeted](https://twitter.com/#!/yukihiro_matz/status/155115178323750913) about Red! :-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [3:48 PM](https://www.red-lang.org/2012/02/floating-point-support-released.html "permanent link") [1 comment:](https://www.red-lang.org/2012/02/floating-point-support-released.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=5454845446599681009&from=pencil "Edit Post")

Labels: [ARM](https://www.red-lang.org/search/label/ARM), [enum](https://www.red-lang.org/search/label/enum), [floating point](https://www.red-lang.org/search/label/floating%20point), [floats](https://www.red-lang.org/search/label/floats), [FPU](https://www.red-lang.org/search/label/FPU), [IA-32](https://www.red-lang.org/search/label/IA-32), [IEEE-754](https://www.red-lang.org/search/label/IEEE-754), [VFP](https://www.red-lang.org/search/label/VFP)

[Newer Posts](https://www.red-lang.org/search?updated-max=2014-04-29T21%3A04%3A00%2B02%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2012-02-17T15%3A48%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
    
    - [Red v0.3.1: functions support added](https://www.red-lang.org/2012/12/red-v031-functions-support-added.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
    
    - [Red alpha release](https://www.red-lang.org/2012/10/red-alpha-release.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
    
    - [Plan for Unicode support](https://www.red-lang.org/2012/09/plan-for-unicode-support.html)
    - [Red is born](https://www.red-lang.org/2012/09/red-is-born.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
    
    - [Red/System v0.2.6 released](https://www.red-lang.org/2012/08/redsystem-v026-released.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
    
    - [Setting up an ARM virtual machine](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html)
    - [Red/System v0.2.5 released](https://www.red-lang.org/2012/03/redsystem-v025-released.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2012/02/) (1)
    
    - [Floating point support released](https://www.red-lang.org/2012/02/floating-point-support-released.html)

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
