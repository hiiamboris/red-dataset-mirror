# Understanding the relationship between print and symbols held in blocks

**Link:**
<https://stackoverflow.com/questions/29733053/understanding-the-relationship-between-print-and-symbols-held-in-blocks>

**Asked:** 2015-04-19 17:07:14 UTC

------------------------------------------------------------------------

**Scenario 1:**

    red>> sizes: [small medium large]
    == [small medium large]
    red>> print sizes
    *** Script error: small has no value
    *** Where: print

**Scenario 2:**

    red>> print first sizes
    small

I expected scenarios 1 and 2 to have the same behaviour(either error out
on evaluation or be treated as a symbol).

I am trying to understand if the following scenario is specific to
`print` or a Red/Rebol concept that I should understand.

I understand that all words in a block are treated as symbols and a
function is required to evaluate them(if necessary). So scenario 1 makes
sense. But if we extract a word from a block(using `first`), it remains
a symbol?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by rgchris

Your understanding is correct and the behaviour in the two scenarios is
particular to `print`, or more particularly to `reduce` ([`reduce` is an
alternate method of evaluation to
`do`](http://www.rebol.com/r3/docs/functions/reduce.html){rel="nofollow"}).
`print` essentially is a three step process: `reduce`, `form`, then send
the resultant string to `system/ports/output`.

    >> message: "Hello"
    == "Hello"

Reduces `message`:

    >> reduce message
    == "Hello"

Reduces the block:

    >> reduce [message]
    == ["Hello"]

Reduces `'message` (evaluates to the word `message`):

    >> reduce 'message
    == message

Reduces `first [message]` (evaluates to the word `message`):

    >> reduce first [message]
    == message

In your scenario, you can avoid evaluation by preempting the reduction
of the block:

    >> reduce form [small medium large]
    == "small medium large"

    >> print form [small medium large]
    small medium large

*Comment by RAbraham:* thank you so much, I wish I could mark this
answer as helpful too

------------------------------------------------------------------------

### Answer (score: 1) --- by HostileFork says dont trust SE

Good question!

> I am trying to understand if the following scenario is specific to
> print or a Red/Rebol concept that I should understand.

The answer is \"both\". The core Red/Rebol concept to understand is that
you can define the behavior of functions to dispatch with a kind of
polymorphism based on the type it was passed. And PRINT as currently
written interprets a block! parameter as a sort of \"print
dialect\"\...which it evaluates before printing. If you manage to slip
it a WORD! value, it will print that word\'s spelling.

You managed to slip a WORD! as value without evaluating it by picking it
out of a block, so it was the result of a function. The evaluator only
takes *one* step on each pass, so after running FIRST it doesn\'t
consider it to be its job to look it up\...the returned WORD! is data,
not code:

    red>> sizes: [small medium large]
    red>> print first sizes
    small

You could have done that via a literal word as well, which has the
evaluator behavior in that single step of reducing into a WORD! and
(again) going no further:

    red>> print 'small
    small

It could also be the result of the QUOTE function, which is \"special\"
because it quotes its argument *(see `help quote` for the spec, and
[this very interesting
tidbit](https://stackoverflow.com/a/14532885/211160) on the two
different \"kinds of parameter quoting\"\...a subtle but nifty
distinction)*

    red>> print quote small
    small

But parameter quoting is the *exception* and not the norm. So usually if
you see something like SMALL unquoted and un-blocked in a sequence like
that\...you expect that the evaluator will see it, look it up, and choke
if it can\'t find it:

    red>> print small
    *** Script error: small has no value

Because the decision PRINT makes when it is passed a BLOCK! is to
evaluate that block and merge the evaluation results, when you write:

    red>> sizes: [small medium large]
    red>> print sizes
    *** Script error: small has no value

\...since PRINT does not quote its parameter, evaluation makes that
effectively equivalent to if you had written:

    red>> print [small medium large]
    *** Script error: small has no value

PRINT sees the block and for that block\'s top-level assumes you want
evaluation of that-which-can-be-evaluated further. *(String literals,
for instance are at the end of the evaluation road and evaluation of
them is a no-op)*. Spacing and newlines aside, it\'s a bit like you\'d
typed:

    red>> print small
    *** Script error: small has no value

    red>> print medium
    *** Script error: medium has no value

    red>> print large
    *** Script error: large has no value

*(Except it stops on the first error, of course.)*

Which brings us back to the question about if *\"the following scenario
is specific to print\"*. It is, in as much as that\'s how PRINT chooses
to interpret a block parameter. You might envision something PRINT-like
that didn\'t evaluate unless something was in a PAREN! block, or had any
other behavior you wanted\...which is key to \"dialecting\". (Current
PRINT is somewhat simplistic compared to alternative proposals, and the
simple thing it does is effectively REDUCE a block it is given.)

But accepting PRINT as-is the same steps that work outside of a block
for tricking the evaluator could work here. Here\'s three different
ways:

    red>> print ['small quote medium third [small medium large]]
    small medium large

*(Quick plug: Many other variations on this theme are possible and in
practice today in [Ren
Garden](https://youtu.be/0exDvv5WEv4?t=243){rel="nofollow noreferrer"}.
It\'s not a new evaluator, but it has a new PRINT\...and that\'s the tip
of the iceberg\...)*

------------------------------------------------------------------------

### Answer (score: 0) --- by Sotosftw Topi

If you want to print a block of Strings that haven\'t been defined is
better to use these \"{}\" brackets. The prin/print functions print it
without evaluation.

E.g prin {small big large}

------------------------------------------------------------------------

## Comments on question
