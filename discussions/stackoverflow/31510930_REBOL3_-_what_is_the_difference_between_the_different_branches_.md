# REBOL3 - what is the difference between the different branches?

**Link:**
<https://stackoverflow.com/questions/31510930/rebol3-what-is-the-difference-between-the-different-branches>

**Asked:** 2015-07-20 07:30:05 UTC

------------------------------------------------------------------------

What are the differences between the different Rebol 3 branches,
especially with the new REN branch?

Is it the platforms they\'ll run on, the feature set, code organization,
the C standard compliance?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 13) --- by HostileFork says dont trust SE

This is an answer destined to become outdated, hence set to [Community
Wiki](https://meta.stackexchange.com/questions/11740/what-are-community-wiki-posts).
This information is as of **Sep-2015**. So if updating this answer after
some time has passed, please modify the date as well.

### [Binary download of Rebol3 from rebol.com](http://www.rebol.com/r3/downloads.html){rel="nofollow noreferrer"}

-   Last build was 5-Mar-2011 and pre-dates the open source release.

-   No GUI support, no HTTPS support, no serial port support, no UDP
    support, no smart console\...

-   No 64-bit builds. Binaries are for Windows x86, OS/X (PPC or x86),
    Linux (x86 or PPC), FreeBSD x86.

-   While Rebol2 binaries are archived [for many \"esoteric\"
    systems](http://www.rebol.com/release-archive.html){rel="nofollow noreferrer"}
    *(BeOS, AIX, Windows DEC Alpha, QNX, Solaris\...)* similar binaries
    were not provided for Rebol3. The only \"weird\" build is for Amiga,
    and only an OS4 PowerPC Amiga. No successful builds of Rebol3 for
    Amiga emulators have been reported.

### [Open source release of Rebol3 on Github rebol/rebol](https://github.com/rebol/rebol){rel="nofollow noreferrer"}

-   Open-sourcing [was on
    12-Dec-2012](http://www.rebol.com/cgi-bin/blog.r?view=0519){rel="nofollow noreferrer"}.

-   The rebol.com binary downloads were not rebuilt as part of this
    release. However, a community member (@earl here on SO) [created a
    build farm at
    rebolsource.net](http://rebolsource.net/){rel="nofollow noreferrer"}
    that follows this GitHub master whenever it updates. Given that
    GitHub\'s rebol/rebol master hasn\'t been updated since March 2014,
    this dynamism is currently underused.

-   Building the source at time of release got an executable not
    distinguishable (?) in functionality from the builds on 5-Mar-2011.
    This suggests few changes to the source were made besides some
    cleanup and Apache-licensing edits to prepare for publication.

-   Minor patches and bugfixes were integrated sporadically, with most
    PRs sitting idle. Last PR accepted at time of writing was [Mar 3,
    2014](https://github.com/rebol/rebol/commit/25033f897b2bd466068d7663563cd3ff64740b94){rel="nofollow noreferrer"},
    which is over a year ago.

-   The most noticeable \"breaking\" PR that did get approved was to
    [repurpose the FUNCTION
    name](https://github.com/rebol/rebol/pull/141){rel="nofollow noreferrer"}.
    It was considered to be worth breaking the [old arity 3
    form](http://www.rebol.com/docs/words/wfunction.html){rel="nofollow noreferrer"}
    to let the word be taken for the much more useful implementation as
    locals-gathering FUNCT. *(This also brought Rebol [in alignment with
    Red](http://www.red-lang.org/2012/12/red-v031-functions-support-added.html){rel="nofollow noreferrer"},
    whose FUNCTION is arity 2 and acts similarly.)* FUNCT was kept
    around as-is for legacy code.

-   The most major *non-breaking* PR that was taken is probably [not
    requiring blocks around IF, UNLESS, or EITHER
    bodies](https://github.com/rebol/rebol/pull/170){rel="nofollow noreferrer"}.
    This has been received well among those who know it\'s there, as
    fitting the freeform and non-boilerplate philosophy of the language.
    It allows some code constructs to get \"prettier\" and gives
    programmers more choice, while it doesn\'t seem to cause any more
    problems than anything else. It\'s certainly less of a speedbump
    than `if [condition] [...]`, in fact it seems almost no one knows
    this feature got added, so it must not be biting anyone. *(If anyone
    can bend ears over at Red to make sure it gets IF and IF/ONLY then
    that would be ideal.)*

-   [RETURN/REDO was
    removed](https://github.com/rebol/rebol/pull/198){rel="nofollow noreferrer"}.
    Rationale was that it permitted functions [to effectively behave
    with variable arity](https://stackoverflow.com/a/14890302/211160),
    and that this was unnecessary and took terra firma away by no longer
    being able to predict a function\'s arity from its spec. Perhaps
    this stance warrants a second look\...as Lisp users who are
    pressuring for the addition of Lisp-style macros seeming aren\'t
    worried about that very much. *(Here in the StackExchange universe,
    this provoked a Programmers.SE question [Would Rebol (or Red)
    benefit from Lisp-style
    Macros?](https://softwareengineering.stackexchange.com/questions/289140/would-rebol-or-red-benefit-from-lisp-style-macros/),
    which hasn\'t gotten much in the way of answers yet.)*

### [The fork by Saphirion: \"Saphir\"](http://development.saphirion.com/rebol/saphir/){rel="nofollow noreferrer"}

-   Prior to the open-sourcing of Rebol, [Saphirion
    AG](http://www.saphirion.com/){rel="nofollow noreferrer"} had a
    special relationship with Rebol technologies. They had access to the
    source and were taking responsibility for most of the development
    work for Rebol3 GUI features. They also added several other things
    like HTTPS.

-   Saphir is available as [a binary
    download](http://development.saphirion.com/downloads/){rel="nofollow noreferrer"}
    from their website, but only provided for 32-bit Windows. There was
    at one time [an experimental .APK for
    Android](http://rebol2.blogspot.com/2013/01/rebol-on-adroid-works.html){rel="nofollow noreferrer"}
    from Saphirion.

-   Some (but not all) of [Saphir\'s source was
    released](https://github.com/saphirion/saphir){rel="nofollow noreferrer"}
    after the open-sourcing. Notable omissions were the android build
    and some Rebol3 code for
    [encapping](http://www.rebol.com/docs/sdk/encap.html){rel="nofollow noreferrer"}\...a
    way of injecting compressed scripts and resources into binaries of
    the interpreter without needing to recompile it.

*(Note: Under Apache2 license there is no requirement to release source
code for one\'s derived work.)*

### [\"Community\" Integration at Rebolsource on GitHub](https://github.com/rebolsource/r3){rel="nofollow noreferrer"}

-   With the GitHub rebol/rebol being held up on integrations, a fork at
    rebolsource/r3 was established to be a \"community build\" where
    work could be staged.

-   Rebolsource changes were conservative, seemingly aimed toward
    showing process for how GitHub\'s rebol/rebol might adopt changes
    \"in the spirit in which Rebol was conceived\" should that
    repository be delegated to the community. *(For that spirit, [see
    this](http://www.rebol.com/cgi-bin/blog.r?view=0497){rel="nofollow noreferrer"}.)*
    Hence it integrated non-controversial bugfixes and tweaks, instead
    of large third-party cryptography libraries for implementing HTTPS.
    Also: no allowance for adding build dependencies besides a C
    compiler (no GNU autotools, for instance).

-   Binaries for the community build were produced on an as-needed basis
    for those requesting them who could not build it themselves.

### [Atronix Engineering\'s Rebol \"3.0\" at Github zsx/r3](https://github.com/zsx/r3){rel="nofollow noreferrer"}

-   [Atronix](http://atronixengineering.com){rel="nofollow noreferrer"}
    is an industrial automation solutions provider that uses Rebol. How
    they do so is described in a video here by [David den Haring,
    director of
    Engineering](https://www.youtube.com/watch?v=jIw7aRP6JPU){rel="nofollow noreferrer"},
    and their [ZOE
    software](http://www.atronixengineering.com/zoe){rel="nofollow noreferrer"}
    is built on their version of Rebol.

-   After the open sourcing, Atronix partnered with Saphirion to port
    the GUI to Linux. Atronix publishes their source publicly as it is
    developed, and David den Haring notes in the video above that they
    have only one proprietary component they developed (an industrial
    control driver). Other than that they are happy to share the source
    for all Rebol development they do.

-   Atronix integrated the 64-bit patches from Rebolsource, created a
    Windows 64-bit target, and offer [up-to-date binaries of their
    development
    branch](http://www.atronixengineering.com/downloads){rel="nofollow noreferrer"}
    for Windows and Linux x86/x64, as well as Linux ARMv7.

-   Besides having the features of Saphir, the Atronix build added
    support for
    [CALL](http://www.rebol.com/docs/shell.html){rel="nofollow noreferrer"}
    with /INPUT, /OUTPUT, /ERROR. It also added a [Foreign Function
    Interface](https://en.wikipedia.org/wiki/Foreign_function_interface){rel="nofollow noreferrer"},
    implementing LIBRARY!, ROUTINE! and STRUCT! for communicating with
    non-Rebol dynamic libraries. It brings in encapping support as well
    on Windows and Linux.

-   Rebol\'s \"religion\" was at times at odds with expedience, so the
    Rebol-based build process was replaced when needed by hand-edited
    makefiles and Visual Studio projects. The FFI library introduced a
    dependency on GNU autotools to build.

-   All Atronix builds include the GUI, so there is no \"Core\" build.
    And again, only Linux and Windows.

### [Ren-C](https://github.com/metaeducation/ren-c){rel="nofollow noreferrer"}

*(Bias Note: This fork is the initiative
[\@HostileFork](https://stackoverflow.com/users/211160/hostilefork)
started, knows the most about, and will speak most enthusiastically
about.)*

-   Ren-C started as an an extraction of a Core build out of Atronix\'s
    codebase. That gave it features like HTTPS, the enhanced CALL, and
    Foreign Function Interface to essentially all the platforms that
    Rebolsource was able to build for. **Updates Jul/Sep-2015** Ren/C
    supports line continuations in the console, user infix functions,
    several bugfixes\...

-   Ren-C makes large-scale changes and fixes fundamental issues in
    R3-Alpha, which are [tracked on a
    Trello](https://trello.com/b/l385BE7a/rebol3-porting-guide-ren-c-branch){rel="nofollow noreferrer"}
    that provides more information. There is a new
    [FAQ](https://github.com/metaeducation/ren-c/wiki/FAQ){rel="nofollow noreferrer"}
    as a GitHub wiki. Critical issues like [definitionally-scoped
    returns](https://codereview.stackexchange.com/questions/109443/definitional-returns-solved-mostly)
    have been solved, with continuous work on other outstanding
    problems.

-   Though Atronix\'s R3/View required some additional dependencies,
    Ren/C pushed back to being able to be built with nothing besides a C
    compiler, and eliminated all handmade makefiles/projects.

-   Beyond Windows, Linux and Mac in both 32-bit and 64-bit variants,
    Ren/C has also been [built for smaller players like
    HaikuOS](https://i.sstatic.net/Dj3iy.png){rel="nofollow noreferrer"}
    and [yes, even
    Syllable](https://i.sstatic.net/j0tw2.png){rel="nofollow noreferrer"}.
    This is interesting more for the demonstration of how broadly
    turnkey builds of the C89 code work (simply as
    `make -f makefile.boot`) as opposed to there being a particularly
    large userbase of those particular OSes!

-   *From the point of view of language rigor*, Ren/C is pushing on
    modern techniques. Although it can still build as C89, it can be
    built as C99 and C11 as well. It has also been verified to build as
    C++98 through C++14, and with some strategic modifications under
    `#ifdef __cplusplus` it can take advantage of modern C++ as a kind
    of static analysis tool over the C code. Warnings are raised, type
    errors all fixed up, and it\'s \"const correct\". The necessary
    changes were carefully considered to make Rebol\'s baseline C code
    not just more correct but [cleaner and clearer source across the
    board](https://github.com/metaeducation/ren-c/commit/dabab4938461c34128722079d0cb4ac83f460ee8){rel="nofollow noreferrer"}.

-   *From a point of view of C developers*, Ren/C should be stable,
    organized, and commented enough for anyone who knows C to \"modify
    with confidence\" and try new features. That means being able to
    implement [definitionally scoped
    returns](http://curecode.org/rebol3/ticket.rsp?id=539){rel="nofollow noreferrer"}
    *(actually written, but not pushed)*, or try developing features
    like
    [NewPath](http://blog.hostilefork.com/new-path-debate-rebol-red/){rel="nofollow noreferrer"}.

-   *From a point of view of architecture*, Ren/C is intended to not
    have an executable at all\...but to be a library for embedding a
    Rebol interpreter into other programs. It is now the basis for
    Ren/C++, which was designed to anticipate working with Red as well.

-   *From a point of view of testing*, Ren/C intends to whip everything
    into shape for engineering rigor and zero bug tolerance. This means
    avoiding practices like zero-filling memory to obscure uninitialized
    memory accesses, using [Address
    Sanitizer](https://en.wikipedia.org/wiki/AddressSanitizer){rel="nofollow noreferrer"},
    [Valgrind](http://valgrind.org/){rel="nofollow noreferrer"}, and a
    test suite that can pass the highest settings on both.

-   While enabling all the extra functionality has made Ren/C\'s
    executable nearly twice the size of Rebolsource\'s, there\'s not yet
    been any audit to see how this can be brought down. It has been
    confirmed that there are duplicate copies of Zlib and PNG
    encoding/decoding\--for instance *(Saphirion included
    [LodePNG](http://lodev.org/lodepng/){rel="nofollow noreferrer"},
    likely to work around a bug in the existing PNG because it was
    easier than fixing it\...yet did not mothball the previous code)*.
    Also, being able to do a build which selectively integrates only the
    codecs you want to use is on the agenda.

-   Ren/C currently has the stakeholders from Atronix and Rebolsource
    participating in its development and direction, which strengthens
    the likelihood that it may evolve into \"the\" Rebol Core. It is now
    being linked in as the code backing [Ren
    Garden](https://www.youtube.com/watch?v=0exDvv5WEv4){rel="nofollow noreferrer"},
    and using a similar approach it may be set up as the library used by
    Atronix\'s R3/View\...then Rebolsource\...and perhaps ultimately
    rebol/rebol itself.

### [The fork by Oldes](https://github.com/oldes/rebol3){rel="nofollow noreferrer"}

*(Bias Note: this edit is added 28-Feb-2019 by Oldes himself)*

-   Forked from the *community* branch. Main focus on keeping the code
    close to the original Carl\'s release without blindly taking
    everything from Atronix/Saphirion but still trying to pick-up the
    good things from these branches slowly.

-   Not like *Ren-C*, this version is not trying to introduce new
    syntax, but rather be closer to the original Rebol2 and new [Red
    language](https://github.com/red/red){rel="nofollow noreferrer"}

*Comment by user310291:* This is an impressive post by someone who is
obviously passionate thumbs up :)

*Comment by Didier A.:* Man, that\'s a lot to take in. As a newcomer to
Rebol, which should I start with?

*Comment by HostileFork says dont trust SE:* \@DidierA. This post is
quite out of date. The two public codebases being developed in the Rebol
universe circa 2019 are Ren-C [(which now has a webassembly
build)](http://hostilefork.com/media/shared/replpad-js/){rel="nofollow noreferrer"}
and Red. There is a sharp contrast in methods, goals, and personalities
between the two. The \"nice\" way of saying it is that Ren-C is focused
on tackling the core of what would make the language itself appeal to a
sophisticate, while Red is more focused on applications (GUI dialect,
cryptocurrency). Visit the chat rooms and forums and pick wherever you
find resonance.

*Comment by Didier A.:* Thanks, I\'ll check out Ren-C and Red then.
Also, is it fair for me to assume the non open source R2 code base and
build are no longer maintained? Or is there still an active company
behind them?

------------------------------------------------------------------------

## Comments on question

*Comment by Graham Chiu:* have you read this ?
[github.com/metaeducation/ren-c](https://github.com/metaeducation/ren-c){rel="nofollow noreferrer"}

*Comment by HostileFork says dont trust SE:* More reading, actually
already a little outdated\...hence community wiki is probably a good
thing: [Rebol State of the Union, June
2015](http://blog.hostilefork.com/rebol-state-union-june-2015/){rel="nofollow noreferrer"}
