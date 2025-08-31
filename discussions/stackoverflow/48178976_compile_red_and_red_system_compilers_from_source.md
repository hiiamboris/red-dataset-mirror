# compile red and red/system compilers from source

**Link:**
<https://stackoverflow.com/questions/48178976/compile-red-and-red-system-compilers-from-source>

**Asked:** 2018-01-10 01:16:03 UTC

------------------------------------------------------------------------

I\'ve been looking to evaluate the red programming language -
red-lang.org

While it is nice that you can obtain a working executable easily I
prefer to compile things from source. It is less obvious how to do that
for red.

The instructions ask you to download a rebol compiler/intepreter which
is itself just an executable. If you do that it works but it screams
\"don\'t do that\" very loudly.

    rebol> do/args %red.r "-v 2 %tests/hello.red"

will compile hello world but how do you bootstrap the red compiler
itself?

**1. Assuming you have rebol how do build the \'red\' executable?**

aside: Are the authors aware that there is a program called \'red\'
installed on many Linux boxes already (a version of the ancient ed
program)?

I thought this might be done by:

    rebol> do/args %red.r "-r %environment/console/console.red"

but \"console\" is not the executable also known as \'red\' it doesn\'t
support the same commmand line options such as -c to compile.

**2. Assuming the proper way to do this involves bootstrapping from
rebol (rather than C or something else) how do you build (a suitable)
rebol from source?**

I would like to build both red and red/system or any other interesting
variants.

This
[question](https://stackoverflow.com/questions/33777626/compiling-red-get-red-system-code)
mentions a youtube video but is there something written down somewhere?

This seems like the sort of thing than ought to be near the front of the
documentation to me.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Brian Otto

I asked a similar question in their Google Group about a year back.

[https://groups.google.com/forum/#!topic/red-lang/zZ3jEeNJ5aI](https://groups.google.com/forum/#!topic/red-lang/zZ3jEeNJ5aI){rel="nofollow noreferrer"}

The short answer is this \...

> The current "bootstrap" Red compiler is written in Rebol. Rebol is not
> compilable. The downloadable Red binaries are not compiled but
> encapsulated (containing both the compiler and a Rebol executable)
> using the Rebol Software Development Kit (SDK). The Rebol is SDK is a
> commercially licensed product that is probably not available any
> longer. (The REBOL SDK used by the Red team is properly licensed).
>
> There are scripts and instructions on how to build a Red binary at
> [https://github.com/red/red/tree/master/build](https://github.com/red/red/tree/master/build){rel="nofollow noreferrer"}
>
> That said anything you can compile with the Red binary, you can
> compile with the source compiler. The source compiler is just as fast
> as the "binary" one. (As you know, the source compiler happily runs
> under free Rebol versions that are still easily available.) In fact,
> the red team uses the source compiler not the "binary" one.
>
> So until the self-hosted Red compiler is available, there are two
> basic options:
>
> -   if you want to use the Red binary, get it from the automated
>     builds
> -   if you want the absolute, up to the minute compiler, use it in
>     source form.
>
> Hope this helps.
>
> Peter

*Comment by Bruce Adams:* Not being self-hosted is one thing but not
being hosted by a language that is self-hosted is another. I\'m
comfortable with elm being built using haskell but I would not be if I
could not build haskell from source. There doesn\'t seem to be a rebol
you can build from source. Its turtles all the way down. Now even with C
you have to have a compiler to start with but the difference is there
are open source compilers for C. Where is the open source compiler for
Rebol? I\'m not sure the Red counts as red requires Rebol\...

*Comment by Adrian:* Actually there are OS options for Rebol. There is
the \"official\" (but neglected) Rebol 3 repository,
[github.com/rebol/rebol](https://github.com/rebol/rebol){rel="nofollow noreferrer"}
and the very actively developed Ren-C fork of that at
[github.com/metaeducation/ren-c](https://github.com/metaeducation/ren-c){rel="nofollow noreferrer"}.
The problem is that Red decided to use Rebol 2 as it\'s base for tooling
(Nenad is particular to that version, for some reason). Brian Dickens
(@metaeducation, the main dev on Ren-C), had attempted at some earlier
point to port the parts of Red dependent on Rebol 2 to Rebol 3, but the
PR was ignored.

*Comment by Bruce Adams:* I looked at rebol on github and noted that it
needed rebol to build it. I looked into ren-c and I see it is a fork of
rebol and also needs rebol to build it. I includes binaries for several
platforms for r3-make.

*Comment by Bruce Adams:* I recognise I have a bias that permits
building a C compiler using C but I find it odd that though the rebol
source is in C the build system requires rebol rather than something
more conventional such as make (or cmake - which though monstrous does
work).

------------------------------------------------------------------------

## Comments on question
