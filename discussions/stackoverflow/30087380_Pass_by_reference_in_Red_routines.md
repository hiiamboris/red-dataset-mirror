# Pass by reference in Red routines

**Link:**
<https://stackoverflow.com/questions/30087380/pass-by-reference-in-red-routines>

**Asked:** 2015-05-06 20:57:31 UTC

------------------------------------------------------------------------

So I\'m currently in the process of migrating a descent sized program
from Rebol 3 to Red. Said program relies on a large binding to a C
library (clang). I have rewritten the binding portion in Red/System, and
am interfacing that code with Red through wrapper routines. The current
convention I have been using is to cast the pointers and void pointers
needed as parameters and returned by the C code to red/system integers
and box them up as Red integers. This is fairly easy and convenient.

Since I can only access the raw integer! data instead of the actual
struct, I would suspect then that I can\'t pass a pointer back out
through a parameter (as the boxed data is being copied before being
passed) using the above methodology, anymore.

So, is there a recommended methodology to passing pointers back out
through parameters, aka how do we pass by reference with routines?

    twiddle: routine [
        arg [integer!]
        return: [integer!]
    ] [
        arg: 321
        test: declare struct! [
            dummy [integer!]
        ]
        test/dummy: 456
        as integer! test
    ]

    a: 123
    b: twiddle a

    print a ;If I could pass by reference this would be 321
    print b

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 7) --- by DocKimbel

When you do `twiddle a`, your are not passing the word `a` to the
function, but its value. Words in Rebol-like languages are not exactly
*variables* like in many other languages. They are first class values
that can reference other values inside a context, aka *namespace*. So a
word does not hold any value, it points to a context table that holds
the value. You can picture a context as a table with two columns, the
left column contain words, the right column holds their respective
value.

So, strickly speaking, there is no \"passing by reference\", you can
only manipulate *values* at Red level, and those values are always
copied from the context table to the Red internal stack. If you want to
change the value referred by `a`, you need to set `a` to that new value.
That could be also achieved at Red/System level using the Red runtime
API, but that API is currently informal and not fully stabilized (but
anyway heavily used internally).

One good way to handle your needs is to build a block of values instead
of assigning individual values to words, but I do not know enough of
what you want to achieve to be sure it would be a good fit.

So after this preamble, to answer your question more directly: you
cannot pass by reference to a routine, you can only pass by value
(either getting a marshalled value, or getting a pointer to the boxed
value **on stack**, and not in the context table). If that value happens
to be a series like a block! for example, then you can modify its
content from the routine (like changing, adding, removing elements).

Anyway, if you really want to change the value referenced by a word from
within a routine, here is how to achieve it:

    twiddle: routine [
        w [word!]
        return: [integer!]
        /local test
    ] [
        test: declare struct! [
            dummy [integer!]
        ]
        test/dummy: 456
        _context/set w as red-value! integer/box as-integer test
        as integer! test
    ]

    a: 123
    b: twiddle 'a

As you can see, you need to pass an unevaluated word (a lit-word!), and
then set its value from the routine in order to achieve the side-effect
you were expecting. That is not the recommended way though, better use a
block! or an object! to push values from the Red/System level to Red
level, or just assign the returned value to a word, as you do for `b`.

Hope this helps.

*Comment by iceflow19:* Thanks Doc! I figured as much, I just didn\'t
know how to set the value in the context. At this point I\'m just trying
to keep the Red code as close as possible to the Rebol, and then once
its functional start refactoring things to be more \"proper\".

*Comment by DocKimbel:* \@johnk Thanks for the typos fixing. :-)

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* Could you edit to provide
your code that worked before but does not work now, and mention specific
version numbers that changed behavior?

*Comment by iceflow19:* I think actually what might have happened is
that the old version I was using may have been an automated build with
broken marshaling, as I\'ve gone back through and checked previous
release versions.
