
#3092: red console interprets -h and -V arguments as filenames
================================================================================
Issue is closed, was reported by wasamasa and has 32 comment(s).
<https://github.com/red/red/issues/3092>

### Expected behavior

I expect `red -V` to output the version number and quit.  Similarly, `red -h` should output the usage and quit.

### Actual behavior

```
$ red -V
*** Error: cannot access argument file:
-V
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>>
```

```
$ *** Error: cannot access argument file:
-h
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> 
```

### Steps to reproduce the problem

Run either `red -V` or `red -h`.

### Red version and build date, operating system with version.

Built today from Git with https://github.com/wasamasa/pkgbuilds/blob/master/red-git/PKGBUILD on Arch Linux.

edit: The issue is not present with the pre-built release downloaded from http://static.red-lang.org/dl/linux/red-063 and http://static.red-lang.org/dl/auto/linux/red-latest which suggests that the official build instructions the PKGBUILD is based on are incorrect.


Comments:
--------------------------------------------------------------------------------

On 2017-11-01T09:01:39Z, dockimbel, commented:
<https://github.com/red/red/issues/3092#issuecomment-341040924>

    @qtxie Can you reproduce this issue with latest Red version?

--------------------------------------------------------------------------------

On 2017-11-02T02:29:18Z, qtxie, commented:
<https://github.com/red/red/issues/3092#issuecomment-341299801>

    It's caused by the PKGBUILD version is just the red console, not the red toolchain.

--------------------------------------------------------------------------------

On 2017-11-02T06:47:16Z, wasamasa, commented:
<https://github.com/red/red/issues/3092#issuecomment-341332202>

    Please provide proper build instructions then. It's rather screwed up that there's no clear description of how to reproduce what you can download on the releases page. How are people supposed to contribute to this project if their locally built version of the toolchain is a crippled version of the official one?

--------------------------------------------------------------------------------

On 2017-11-02T08:28:59Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3092#issuecomment-341350210>

    On 2 Nov 2017, at 14:47, Vasilij Schneidermann <notifications@github.com> wrote:
    > 
    > Please provide proper build instructions then. It's rather screwed up that there's no clear description of how to reproduce what you can download on the releases page. How are people supposed to contribute to this project if their locally built version of the toolchain is a crippled version of the official one?
    > 
    There are full instructions on how to build a Red binary that encapsulates a Rebol interpreter at https://github.com/red/red/tree/master/build <https://github.com/red/red/tree/master/build>. It requires a copy of the Rebol/SDK.
    
    It is not at all necessary to build a Red binary to be able to contribute to the project. The toolchain works exactly the same when run from source as it does from the “encapped” binary.
    
    Did you read the section titled “Running Red from the sources (for contributors)” on the main page of the Red Github repository? Was there something you didn’t understand in them? (We’ll try to explain further if that is the case and update the information on Github if necessary).

--------------------------------------------------------------------------------

On 2017-11-02T08:45:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3092#issuecomment-341353927>

    The Red toolchain is written in Rebol, and runs interpreted on a Rebol binary. For convenience, we provide an encapsulated version of Rebol + toolchain source code + Red runtime library, in a single binary, which runs identically as the non-encapsulated version (explained on the repo's home page, as pointed out by Peter). So the PKGBUILD script just builds the Red console, not the Red toolchain binary, which requires the Rebol/SDK and a valid license key. The above command-line options are specific to the Red toolchain, there are not recognized by the console binary.

--------------------------------------------------------------------------------

On 2017-11-02T10:40:04Z, Earnestly, commented:
<https://github.com/red/red/issues/3092#issuecomment-341381817>

    Oh that's interesting.  I was also looking to see how I could build red myself but did not fully appreciate that I would need to purchase copy of the Rebol SDK in order to build my own red toolchain.
    
    Although this is mentioned very briefly in the build directory README, I think it should be made clearer in the main README that red cannot be built without purchasing the Rebol SDK (ideally as a warning at the top).
    
    Edit: Specifically I think the message from the `build/README` should be at the top of the main README document:
    
    > You need a Rebol SDK copy with a valid license file in order to rebuild the Red binary, this is a constraint from using Rebol2 for the bootstrapping. Once selfhosted, Red will not have such constraint.

--------------------------------------------------------------------------------

On 2017-11-02T12:36:42Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3092#issuecomment-341407867>

    > On 2 Nov 2017, at 18:40, Earnestly <notifications@github.com> wrote:
    > 
    > Oh that's interesting. I was also looking to see how I could build red but did not appreciate that one has to actually buy a Rebol SDK in order to build our own red toolchain.
    > 
    You don’t need to buy Rebol to “build” your own Red toolchain. The Red toolchain is interpreted, not compiled. It can easily be run from source. You only need to download one of the free Rebol 2 interpreters from http://www.rebol.com/downloads.html <http://www.rebol.com/downloads.html>.
    
    Then you can compile the Red repll by:
    
    $cd <path-to-red-directory> 
    $ <path-to-Rebol>/rebol -qs red.r -o my-red-repl -r environment/console/console.red
    
    The resulting my-red-repl is an executable program. The Red toolchain (red.r) is not. The Red binary simply makes it a little easier for people, who don’t want to access the source of the Red toolchain, to run Red.
    
    
    
    
    
    
    
    
    
    

--------------------------------------------------------------------------------

On 2017-11-02T17:37:25Z, wasamasa, commented:
<https://github.com/red/red/issues/3092#issuecomment-341500890>

    I agree that the README is rather confusing currently.  First of all, the [main README](https://github.com/red/red/blob/master/README.md) mentions how to run Red from sources and build the console. The PKGBUILD from above follows these instructions and packages that console. At no point it's mentioned how to build the self-contained binary. It seems that I'll have to make another PKGBUILD that downloads the latest official snapshot instead.
    
    If I visit https://github.com/red/red/blob/master/build/README.md I get conflicting information: "This is not required to build or run red from sources. It is for a feature used by the red team. Check the main readme if you want to build red from sources". The sequence of steps presented there *are* required for building the self-contained Red binary. The main README does *not* explain how to build Red from sources, it explains how to run it from sources (and how to build the console which apparently isn't the full thing). Note that it isn't linked anywhere either, I just found it by looking for what [.travis.yml](https://github.com/red/red/blob/master/.travis.yml) ends up running.  The real kicker is that you still need the REBOL SDK to build the self-contained library, something I feel very conflicted about for an open-source project (imagine if you'd need to wire up Apple a hundred dollars if you ever wanted to build something with Clang).
    
    My suggestions are similar to what @Earnestly proposed above:
    
    - Add a section to the main README about building the self-contained binary and have it point to the build README
    - Add a prominent warning to the main README that building the self-contained binary requires the REBOL SDK (so that people stop trying to build it from sources for PKGBUILDs or whatever else they use)
    - Fix the conflicting information in the build README

--------------------------------------------------------------------------------

On 2017-11-02T22:24:57Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3092#issuecomment-341576238>

    You still seem to not understand that there is no Red Toolchain binary. The Red downloadable binary is simply a copy of Rebol and the Red Toolchain source packed into a single executable. You do not need to buy a Rebol SDK to "build the Red Toolchain".
    
      

--------------------------------------------------------------------------------

On 2017-11-02T22:42:59Z, wasamasa, commented:
<https://github.com/red/red/issues/3092#issuecomment-341579686>

    At this point it's just splitting hairs.  The "Red downloadable binary" contains the whole toolchain, so why is it wrong to refer to it as the "Red Toolchain binary"? Why does it matter how it's created? Even if the build process were something as simple as concatenating source files into a build product (as it's commonly done with a certain popular programming language used in browsers), the process of creating it can be described as building. If the tool necessary for creating that build product is the commercially available Rebol SDK, then I don't see how it's wrong that I need to buy the Rebol SDK to create that binary. Sure, if it satisfies you that one can contribute to Red by running the toolchain from sources, that's totally OK, but twisting words to not have to admit that there is a fundamental problem with reproducing the official build products, well, that's a completely different story.

--------------------------------------------------------------------------------

On 2017-11-02T22:57:06Z, Earnestly, commented:
<https://github.com/red/red/issues/3092#issuecomment-341582316>

    I think the major source of confusion here is the role Rebol plays.  Speaking for myself, I genuinely thought Red was a new language and alternative to Rebol as the website makes no real mention of Rebol anywhere in its marketing material. (Other than claiming it to be a new language of course: "Red is a next-gen programming language, strongly inspired by REBOL.", hence the relationship in my mind)
    
    Due to this misconception and my experience with other bootstrapped languages I was not expecting to need the host language runtime to be required after the fact.  For example (if I remember correctly) Rust used to be bootstrapped from OCaml, but OCaml was not necessary after we had a Rust compiler as it could be used to self-host.
    
    I really hope one day Red will no longer need Rebol and can be either bootstrapped or fully self-hosting eventually, as hinted in the `build/README`

--------------------------------------------------------------------------------

On 2017-11-03T02:36:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3092#issuecomment-341610541>

    Red is a descendant of Rebol, and bootstrapped in it. Red will be self-hosted in the future. BUT, you don't need Rebol at all today. Just use the pre-built Red binary. You only need a licensed copy of Rebol if you want to build your own version of that.
    
    @wasamasa, I don't think anybody is twisting words here. And, as the old saying goes, "you can catch more flies with honey than with vinegar."

--------------------------------------------------------------------------------

On 2017-11-03T02:58:22Z, dockimbel, commented:
<https://github.com/red/red/issues/3092#issuecomment-341612715>

    @wasamasa You keep missing the point that we are trying to make.  I'll try to explain it again in detail.
    
    The encapsulated binary form for the Red toolchain is just a convenient distribution mechanism. Operationnaly, it launches a Rebol interpreter and uncompresses the toolchain source files in memory, before running them. That is the same process as running it manually from a Rebol interpreter. For all the work on Red's toolchain or runtime, it's way more convenient to work with the sources directly, instead of building a Red toolchain binary each time. That's how we work on Red, we don't use the Red toolchain binary at all, the Red toolchain binaries are only built for distribution, and not used for the developement itself. Therefore, there is no need for any contributor to "rebuild" the binary, as it is strictly equivalent to the source version. If you really want to "rebuild" the binary, you can purchase a license key from Rebol Technologies. If you are annoyed by that, simply ignore the Red toolchain binary, do not download it, do not use it, just download Rebol interpreter and run the toolchain manually (`rebol -s red.r "<command-line options>"`), it will work exactly the same.
    
    
    @Earnestly 
    > I think the major source of confusion here is the role Rebol plays. Speaking for myself, I genuinely thought Red was a new language and alternative to Rebol as the website makes no real mention of Rebol anywhere in its marketing material. (Other than claiming it to be a new language of course: "Red is a next-gen programming language, strongly inspired by REBOL.", hence the relationship in my mind)
    
    You seem to be confusing a programming language and its toolchain and implementation. Red is a new language and alternative to Rebol. The current Red toolchain code is written in Rebol, so that a Rebol interpreter is required for compiling Red sources. Once compiled, the generated executable has no relation to Rebol whatsoever, it has its own runtime, written in Red and Red/System. Alternatively, you can also interpret your Red sources using the Red console (which is the main way Red code is run by users). In such case, no Rebol is involved at all. Once the compiler and toolchain will be self-hosted, Rebol binary requirement will be gone. Hope this clarifies it.

--------------------------------------------------------------------------------

On 2017-11-03T12:28:53Z, Earnestly, commented:
<https://github.com/red/red/issues/3092#issuecomment-341690176>

    Yeah, that helps to explain things a bit clearer.  It's still unfortunate that others cannot reproduce the Red without purchasing a Rebol license, and more to the point, running closed source software to do it.
    
    I hope your final point comes sooner rather than later as it seems a greater priority to me, but I'm only an interested outsider more than anything else.

--------------------------------------------------------------------------------

On 2017-11-03T19:17:47Z, greggirwin, commented:
<https://github.com/red/red/issues/3092#issuecomment-341801203>

    > more to the point, running closed source software to do it.
    
    This raises a great question. Should FOSS developers stand on the principle that *all* software should be (F)OSS, and *not* support commercial, closed source software? Even if the closed source alternative is better?

--------------------------------------------------------------------------------

On 2017-11-03T21:16:18Z, Earnestly, commented:
<https://github.com/red/red/issues/3092#issuecomment-341829333>

    I think that's something each developer should judge for themselves.  Personally I'd like to see more open source (commercial or otherwise), even if it is worse.  So while I can, I try to avoid using closed source software on principle but falling back on pragmatism as a last resort.
    
    I don't believe anyone here wants the Rebol situation, however it does exist as a means to an end.

