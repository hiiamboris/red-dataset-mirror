# type of literal words

**Link:**
<https://stackoverflow.com/questions/29859803/type-of-literal-words>

**Asked:** 2015-04-25 00:59:12 UTC

------------------------------------------------------------------------

I was reading [Bindology](http://www.rebol.net/wiki/Bindology) and tried
this:

    >> type? first ['x]
    == lit-word!
    >> type? 'x
    == word!

I expected `type? 'x` to return `lit-word!` too. Appreciate any
insights.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by HostileFork says dont trust SE

A LIT-WORD! if seen in a \"live\" context by the evaluator resolves to
the word itself. It can be used to suppress evaluation simply with a
single token when you want to pass a WORD! value to a function. *(Of
course, in your own dialects when you are playing the role of
\"evaluator\", it\'s a Tinker-Toy and you can make it mean whatever you
want.)*

Had you wanted to get an actual LIT-WORD! you would have to somehow
suppress the evaluator from turning it into a WORD!. You noticed that
can be achieved by picking it out of an unevaluated block, such as with
`first ['x]`. But the more \"correct\" way is to use `quote 'x`:

    >> type? quote 'x
    == lit-word!

Beware an odd bug known as \"lit-word decay\":

    >> x-lit: quote 'x
    >> type? x-lit
    == word!

That has been [corrected in
Red](https://github.com/red/red/issues/734){rel="nofollow"} and is
pending correction in Rebol. Until then you have to use a GET-WORD! to
extract a lit-word value from the variable holding it:

    >> x-lit: quote 'x
    >> type? :x-lit
    == lit-word!

*(You may have already encountered this practice as the way of fetching
the value of a word vs. \"running\" it through the evaluator\...as when
you want to deal with a function\'s value vs. invoking it. It should not
be necessary on values holding lit-word!. Accident of history, it would
seem.)*

------------------------------------------------------------------------

## Comments on question
