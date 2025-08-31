# use keyword in Rebol vs use keyword in Red

**Link:**
<https://stackoverflow.com/questions/47236736/use-keyword-in-rebol-vs-use-keyword-in-red>

**Asked:** 2017-11-11 10:10:23 UTC

------------------------------------------------------------------------

I wanted to use \"Use\" in Red but it seems it is quite different from
use in Rebol, looking into help:

In Red:

      >> help use
           cause-error     function!     Causes an immediate error throw, w...

In Rebol

        >> help use
        USAGE:
            USE words body

        DESCRIPTION:
             Defines words local to a block.
             USE is a native value.

        ARGUMENTS:
             words -- Local word(s) to the block (Type: block word)
             body -- Block to evaluate (Type: block)
        >>

Is there an equivalent of Use in Red (/local or function not enough) so
as to have block scope and not just function scope ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

    >> source use
    USE is an unset! value, so source is not available.

**use** is not yet implemented. What you see is just a function where
help is finding the string \'use\' in \'cause-error\'. That\'s a
byproduct of the enhanced searching of help also in names, description
and interface etc.

As long as there is no **use** you can always use an anonymous context /
object e.g

    >> context [
    [        a: 1
    [        set 'f does  [print a]
    [    ]
    == make object! [
        a: 1
    ]
    >> f
    1
    >> a
    *** Script Error: a has no value
    *** Where: catch
    *** Stack:  

------------------------------------------------------------------------

## Comments on question
