# How can I change a global variable that have the same name as a local variable in Rebol or Red?

**Link:**
<https://stackoverflow.com/questions/47111121/how-can-i-change-a-global-variable-that-have-the-same-name-as-a-local-variable-i>

**Asked:** 2017-11-04 13:12:21 UTC

------------------------------------------------------------------------

I cannot change the value of global variable a within f because it has
the same name as a local variable: when function returns, a is still 1
instead of 12.

    a: 1
    f: func[a][set 'a a]
    >> f 12
    == 12
    >> a
    == 1

How can I refer to global variable a ? Isn\'t set supposed to only refer
to global variable ? Am I obliged to change my local variable name to do
so or is there a way to keep both name ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

Use `system/words/` path prefix to force read or write access to a word
in global context:

    >> a: 1
    >> f: func[a][system/words/a: a]
    == func [a][system/words/a: a]
    >> f 12
    == 12
    >> a
    == 12

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* *\"Isn\'t set supposed to
only refer to global variable\"* What you might be thinking of is the
difference between using a SET-WORD! in a FUNCTION body\--which is
gathered to suggest you want a local automatically\--vs. avoiding the
use of any SET-WORD!s in a FUNCTION body at all and doing an assignment
via SET of a LIT-WORD!, in which case the binding that the LIT-WORD! you
are assigning had in the body code prior to FUNCTION will be used for
the assignment. *(Yes, this is kind of Rube-Goldberg-inspired. :-P)*
