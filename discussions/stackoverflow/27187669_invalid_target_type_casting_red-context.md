# invalid target type casting: red-context

**Link:**
<https://stackoverflow.com/questions/27187669/invalid-target-type-casting-red-context>

**Asked:** 2014-11-28 11:25:55 UTC

------------------------------------------------------------------------

I am using the `--red-only` switch with the verbosity set to 2 to
compile a very simple Red program to its Red/System equivalent. The
program is:

    Red []

    red-load: func [source  [file! url! string! binary!]] [
        load source
    ]

It produces a certain amount of output, which I redirected to a file. My
goal was to add a Red/System header to this and build it.

After getting rid of some commentary lines, the next barrier is that
this code had not expanded at least some macros, so I had to add a
`#include` for
[runtime/macros.reds](https://github.com/red/red/blob/1fc8c7875c5d777c5097ce1322ff21f60136a505/runtime/macros.reds){rel="nofollow"}.
But then I got this error in the expansion of one of those (macros
TO_CTX):

    *** Compilation Error: invalid target type casting: red-context! 
    *** in file: %/home/hostilefork/Projects/red/embedme.reds 
    *** in function: f_modulo
    *** at line: 11 
    *** near: (as red-context! ((as series! ctx15/value) + 1))

I\'ve seen `red-context!` and some other `red-*!` datatypes used in the
Red runtime code\...when Red/System needs to talk about values it gets
from Red. But they are not mentioned [in the Red/System
spec](http://static.red-lang.org/red-system-specs-light.html){rel="nofollow"}.
Can they be used in ordinary Red/System code, or is there something
\"special\" allowing them only internally?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

Verbosity 2 is not the right setting if you want to have a complete
Red/System output, the verbosity should be set to 3 (`-v 3`). I never
tried to actually compile such output, so I am not sure that it will
work anyway. The `--red-only?` option purpose is for debugging the
Red/System output from the high-level Red compiler.

The `red-*!` definitions are macros over Red internal structures, they
are not part of Red/System. They are defined in the Red [runtime
library](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds){rel="nofollow"}.

*Comment by HostileFork says dont trust SE:* Thanks, it worked with
minor tweaks. In this case, just the content of **output:** with search
and replace `~%` =\> `~percent`, `~//` =\> `~slashslash`, `~/` =\>
`~slash`\...then and add an `#include` up top for `red.reds`.

------------------------------------------------------------------------

## Comments on question
