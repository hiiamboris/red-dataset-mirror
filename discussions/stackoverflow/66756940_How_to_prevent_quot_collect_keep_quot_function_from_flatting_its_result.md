# How to prevent &quot;collect/keep&quot; function from flatting its result

**Link:**
<https://stackoverflow.com/questions/66756940/how-to-prevent-collect-keep-function-from-flatting-its-result>

**Asked:** 2021-03-23 03:36:52 UTC

------------------------------------------------------------------------

    >> a: [[1 2] "a" a [3 3]]
    == [[1 2] "a" a [3 3]]
    >> collect [foreach x a [if block? x [keep x]]]
    == [1 2 3 3]

But what I want is \[\[1 2\] \[3 3\]\]. It seems that collect/keep would
flat the result(in term of block). How to prevent it?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by 9214

Use `keep/only`. FYI, `keep` has almost the same semantics as `append`
(barring a few refinements) with an implicit block that `collect`
provides internally: see `?? collect` for the details.

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* You can also use `parse`:
`parse a [collect some [keep block! | skip]]`
