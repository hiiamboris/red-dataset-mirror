# Compiling Red: Get Red/System Code

**Link:**
<https://stackoverflow.com/questions/33777626/compiling-red-get-red-system-code>

**Asked:** 2015-11-18 10:31:30 UTC

------------------------------------------------------------------------

The video about Red and Red/System shows the compilation process in
which Red is compiled to Red/System.

Youtube:
[https://youtu.be/-KqNO_sDqm4?t=27m12s](https://youtu.be/-KqNO_sDqm4?t=27m12s){rel="nofollow"}

I know how to compile Red code with the -c option. Is there a way to
output the Red/System code that is created during the compilation
process?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by HostileFork says dont trust SE

[The README mentions
`--red-only`](https://github.com/red/red){rel="nofollow"}, and says:

> *\"Stop just after Red-level compilation. Use higher verbose level to
> see compiler output. (internal debugging purpose)\"*

According to \@jck this also requires -c for compiling and verbosity
level 1:

    ./red -c --red-only -v 1

------------------------------------------------------------------------

## Comments on question

*Comment by mnzl:* Yes. That works. To get the code -c for compiling and
verbositiy level 1 is needed: `./red -c --red-only -v 1` Please answer
the question, then I can vote for it.
