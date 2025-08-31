# How to test for unset parameter in rebol / red within a function?

**Link:**
<https://stackoverflow.com/questions/46976213/how-to-test-for-unset-parameter-in-rebol-red-within-a-function>

**Asked:** 2017-10-27 13:28:48 UTC

------------------------------------------------------------------------

When I call f without parameter, I got the error Script Error: if does
not allow unset! for its then-blk argument why ?

    f: func['p [string! unset!]][
         if unset? 'p print "unset"
    ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

`'p` evaluates to the word `p`. In order to test the type of the value
referred by `p`, you need to use `:p` and provide a proper body block
for `if`:

    f: func ['p [string! unset!]][
        if unset? :p [print "unset"]
    ]

    >> f "123"
    == none
    >> f
    unset

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* Note that UNSET! as a
\"value\" (which can be appended to blocks) is problematic. This may be
of interest: [\"Why (or why not) have UNSET! in Rebol-like
Languages\"](https://forum.rebol.info/t/why-or-why-not-have-unset-in-rebol-like-languages/113){rel="nofollow noreferrer"}
