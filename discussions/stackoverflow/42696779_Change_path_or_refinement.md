# Change path or refinement

**Link:**
<https://stackoverflow.com/questions/42696779/change-path-or-refinement>

**Asked:** 2017-03-09 13:33:37 UTC

------------------------------------------------------------------------

I want to change the `a/b` inside a block to `a/c` (or possibly even
`a`)

The normal way I\'d do this is with `change`:

    test: [a/b]
    change test/1 'c

but it only changes the first part, i.e. `a` to `c`:

    >> test
    == [c/b]

Can\'t access the path with `test/2` either:

    >> reduce [test/1 test/2]
    == [a/b none]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by Geeky I

There are 2 things to note here:

First, `path!` is a series, so in this case, a nested series. Have to
actually access the *second* element **inside** the *first* element:

    >> test: [a/b] test/1/2
    == b

Secondly, use the property of series that make them behave like pointers
and access the `next` element, *instead of accessing it directly*:

    >> next test/1
    == b

So the code becomes:

    >> change next test/1 'c test
    == [a/c]

*Comment by DocKimbel:* An alternative shorter way using path access
only would be: `test/1/2: 'c`

------------------------------------------------------------------------

## Comments on question
