# What&#39;s the difference between \`a: \[b 1\]\` and \`a: \[b: 1\]\`, in red?

**Link:**
<https://stackoverflow.com/questions/40095593/whats-the-difference-between-a-b-1-and-a-b-1-in-red>

**Asked:** 2016-10-17 21:02:18 UTC

------------------------------------------------------------------------

What is the difference between

    a: [b 1]
    ; and
    a: [b: 1]

both give the same results for

    > a/b
    1

they differ for `a/1` though. When do you use what? And the 2nd is a
set, what is the 1st?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 9) --- by HostileFork says dont trust SE

> the 2nd is a set, what is the 1st?

You can get answers by looking at the type:

    >> type? first [b 1]
    == word!

    >> type? first [b: 1]
    == set-word!

> What is the difference

When you use the expression `a/b` you are writing something that acts
like a SELECT statement, looking up \"any word type\" matching `b` in
the block indicated by `a`, then returning the item after it in the
block.

Red follows heritage from Rebol\--defaulting path selections to be the
\"non-strict\" form of SELECT, which uses a \"non-strict\" form of
equality

    >> (first [a:]) = (first [a]) ;-- default comparison
    true

    >> select [b 1] (quote b)
    == 1

    >> select [b: 1] (quote b)
    == 1

To get the strict behavior of telling the difference, you need to use
the /CASE refinement (in the sense of \"case-sensitive\"):

    >> (first [a:]) == (first [a]) ;-- strict comparison
    true

    >> select/case [b: 1] (quote b)
    == none

    >> select/case [b: 1] (quote b:)
    == 1

Red seems to be at least a little more consistent about this than
R3-Alpha, for instance honoring the equality of 1% and 0.01:

    >> 1% = 0.01
    == true ;-- both R3-Alpha and Red

    >> select [0.01 "test"] 1%
    == "test" ;-- in Red

    >> select [0.01 "test"] 1%
    == none ;-- in R3-Alpha

But it shows that there\'s a somewhat dodgy history behind equality
semantics.

> When do you use what?

Good question. :-/ Notation-wise in your source, you should use that
which you feel most naturally fits what you want to express. If you
think a SET-WORD! is appropriate then use it, otherwise use a WORD!.
Implementation-wise, there are some nuances that are beyond the scope of
a simple answer (locals gathering in FUNCTION, for instance). If you
know something will ultimately need to be transformed into an
assignment, it may be helpful to use SET-WORDs.

Path evaluation is sketchy, in my opinion. It arose as a syntactic
convenience, but then produced a cross product of behaviors for every
type being selected from every other type. And that\'s to say nothing of
the variance in how functions work *(what would
`x: :append/dup/only/10/a` mean?)*

Small example: PATH! behavior in Rebol used a heuristic where if you are
evaluating a path it will act as a PICK if the path component is an
integer:

    >> numbers: [3 2 1]

    >> pick numbers 3
    == 1 ;-- because the 3rd element is a 1

    >> select numbers 3
    == 2 ;-- because 2 comes after finding a 3

    >> numbers/3
    == 1 ;-- acts like PICK because (...)/3 uses an INTEGER!

\...but as above, it will act like a SELECT (non-strict) if the thing
being chosen is a WORD!:

    >> words: [a b c]

    >> select words 'a
    == b ;-- because b is the thing after a in the block

    >> pick words 'a
    ;-- In Rebol this is an error, Red gives NONE at the moment

    >> words/a
    == b ;-- acts like SELECT because (...)/a uses a WORD!

So the difference between SELECT and PICK accounts for that difference
you\'re seeing.

It gets weirder for other types. Paths are definitely quirky, and could
use a grand unifying theory of some sort.

*Comment by Wolfram Kriesing:* thanks a lot, a very in depth answer! I
learned a lot (am still learning :))

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

> And the 2nd is a set, what is the 1st?

It seems you are looking at both `[b 1]` and `[b: 1]` as code, but they
are actually just data. More precisely, they are lists of two elements:
a `word!` or `set-word!` value followed by an `integer!` value.

`a/b` is a syntactic sugar for `select a 'b`, which retrieves the value
following `'b` word (using a `find` call internally). For convenience,
the searching for `'b` also matches other word types:

    red>> find [:b] 'b
    == [:b]
    red>> find [/b] 'b
    == [/b]
    red>> find ['b] 'b
    == ['b]
    red>> find [b] 'b
    == [b]

As a side note, remember that a lit-word will evaluate to a word, which
is sometimes referred by the \"word-decaying\" rule:

    red>> 'b
    == b

`/case` refinement for `find` and `select` will apply a stricter
matching, ensuring that the types are also the same. Though, you
obviously cannot use it with path notation, you would need to replace
the path with a `select/case` call instead.

So, both are giving the same result for `a/b`, because both will return
the value following `b` word (regardless of his \"word sub-type\"):

    red>> [b 1] = [b: 1]        ;-- loose comparison, used by `find` and `select`.
    == true
    red>> [b 1] == [b: 1]       ;-- strict comparison, used by `find/case` and `select/case`.
    == false

> they differ for a/1 though.

Integer values have specific semantics in paths. They act as sugar for
`pick`, so `a/1` is equivalent to `pick a 1`. You can also force that
behavior other words referring to integers in paths, by making them
`get-word!` values:

    red>> c: 1
    == 1
    red>> a: [b 123]
    == [b 1]
    red>> a/:c
    == b
    red>> a: [b: 123]
    == [b: 123]
    red>> a/:c
    == b:
    red>> c: 2
    == 2
    red>> a/:c
    == 123

Read more about paths from Rebol Core Manual:
[http://www.rebol.com/docs/core23/rebolcore-16.html#section-2.10](http://www.rebol.com/docs/core23/rebolcore-16.html#section-2.10){rel="nofollow"}

> When do you use what?

For `a/b` vs `a/1` usage, it depends if you want to achieve a `select`
or a `pick` operation.

For `[b 1]` vs `[b: 1]`, it depends on the later use of the block. For
example, if you are constructing a block for serving as an object or map
specification, then the set-word form is a better fit:

    red>> a: [b:]
    == [b:]
    red>> append a 123
    == [b: 123]
    red>> c: object a
    == make object! [
        b: 123
    ]

Also, you should use the set-word form each time you imply a
\"key/value\" relationship, it makes your intent clearer for yourself
and other readers as well.

*Comment by Wolfram Kriesing:*
`you should use the set-word form each time you imply a "key/value" relationship`
this was the aha-moment for me, thanks for the details

*Comment by DocKimbel:* \@WolframKriesing Thanks for the feedback, I
will put more emphasis on that aspect in the Red documentation.

------------------------------------------------------------------------

## Comments on question
