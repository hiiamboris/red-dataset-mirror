# REBOL methods in Red

**Link:**
<https://stackoverflow.com/questions/37618320/rebol-methods-in-red>

**Asked:** 2016-06-03 15:32:09 UTC

------------------------------------------------------------------------

Disclaimer: What I\'m trying to achieve is something like what was
discussed here - [Evaluating a \"variable
variable\"](https://stackoverflow.com/questions/18394057/evaluating-a-variable-variable).

I want to create variables in red dynamically with identifiers based on
some parsed data. Examples from post above mention Rebol (R2?) `rejoin`
and `to-word` methods, but I didn\'t succeed calling them in Red
however, getting `Script error: rejoin has no value` all the time.

Are such methods present in Red or what are the alternatives? Should I
add some module into my script?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by rgchris

In Rebol, both `rejoin` and `to-word` are both shortcuts for more
elemental functions. In Red (as of version 0.6.0) both of these
functions are available:

    >> to word! "foo"
    == foo
    >> to word! append "foo" "bar"
    == foobar

It\'s likely better to copy the first string before appending, but this
should be enough to create dynamic words.

*Comment by Bohdan Ivanov:* Thanks for a help!

*Comment by rgchris:* Note that REJOIN and TO-WORD are both now
available in Red (at least since v0.6.3)

------------------------------------------------------------------------

## Comments on question
