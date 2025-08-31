# Recursive parse in Red

**Link:**
<https://stackoverflow.com/questions/42177099/recursive-parse-in-red>

**Asked:** 2017-02-11 14:36:23 UTC

------------------------------------------------------------------------

I want to parse-skip Forth-style if\'s from input, Forth-style means
each if starts with `if` and ends with `then`, assuming all input is
correct handling of mismatches is not required.

The problem is each part of `if` can recursively contain any number of
other `if`\'s.

Here is my best solution with test cases:

    Red []

    skip-nested-ifs: [skip to ['if | 'then] skip-nested-ifs-helper]
    skip-nested-ifs-helper: ['then | skip-nested-ifs skip-nested-ifs-helper ]


    rules: skip-nested-ifs

    test-cases: [
       [if a then]
       [if a else b then]
       [if a if b then then]
       [if a if b then 5 then]
       [if a if b then 5 if c then then]
       [if a else if b then then]
       [if a else if b then 5 then]
       [if a else if b then if c then then]
       [if a if b if c then if d then then then]
    ]

    forall test-cases [
       prin [mold test-cases/1 ""]
       print either parse test-cases/1 rules [ "OK" ] [ "FAIL" ]
    ]

The output is:

    [if a then] OK
    [if a else b then] OK
    [if a if b then then] OK
    [if a if b then 5 then] FAIL
    [if a if b then 5 if c then then] FAIL
    [if a else if b then then] OK
    [if a else if b then 5 then] FAIL
    [if a else if b then if c then then] OK
    [if a if b if c then if d then then then] OK

So three of them fail because they contain something (`5` in this case)
between one `then` and another.

Probably the fix is very simple and obvious, but I don\'t see it right
now. Could you help me to fix rule above if possible or show a different
one which passes all tests?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by DocKimbel

I am not sure if your rule is fixable or not, as it heavily relies on
recursion, but fails to provide iteration support which is needed for
test #5. I was not able to fix it, as `skip` is used to consume both
terminal and non-terminal tokens (including `if`), so it makes it hard
for me to follow.

I came up with a different solution. It is longer, but passes all your
tests (using Red):

    rules: [
        'if skip 
        opt ['else [some rules | skip]]
        opt some rules
        'then
        opt [some rules | ahead 'then | skip]
    ]

Notes:

-   I tried to make the grammar rules as explicit as possible.
-   Notice the usage of `some` to iteratively consume the
    sub-expressions.
-   The `ahead 'then` guarding rule, is there to prevent `skip` from
    consuming an extra `then` which would be part of a parent expression
    (in case of a recursive invocation).
-   It uses `skip` to pass over the terminal value following `then` or
    `else`, though it is not clear from your description if there can be
    more than one value there. Anyway, it is easy to extend for matching
    more complex patterns if needed.

If you want to use such rule for skipping input, you can then invoke it
like this:

    skip-ifs: [to 'if rules]

Hope this helps.

*Comment by user3033648:* Thanks for your solution, but the last item in
rules: `opt [some rules | ahead 'then | skip]` also skips next `if` if
there is one right after current, like here: `[if a then if c then]`. I
want to skip only one current if, the next one will be handled
separately. Do you think this is possible?

*Comment by DocKimbel:* Just replace `ahead 'then` with
`ahead ['if | 'then]` and it will parse correctly also such different
pattern.

*Comment by user3033648:* I tried
`opt [some rules | ahead ['if 'then] | skip]` as last part of rule and
it fails half of the tests

------------------------------------------------------------------------

## Comments on question

*Comment by DocKimbel:* Is your use of `to` in the first rule intended,
or did you really want `thru` rather?

*Comment by Geeky I:* `parse-trace` is useful to debug parse

*Comment by user3033648:* \@DocKimbel I\'m using `to` intentionally to
match `then` after, because if `then` found first - this means current
`if` is finished, otherwise we hit nested one.

*Comment by DocKimbel:* \@user3033648 I just wanted to check that you
were aware that `to` is not consuming the argument rule, just stopping
*before* it (`['if | 'then]` in this case).
