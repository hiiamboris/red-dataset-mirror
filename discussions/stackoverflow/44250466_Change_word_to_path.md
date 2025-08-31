# Change word to path

**Link:**
<https://stackoverflow.com/questions/44250466/change-word-to-path>

**Asked:** 2017-05-29 21:25:25 UTC

------------------------------------------------------------------------

Yet another question related to [Change path or
refinement](https://stackoverflow.com/questions/42696779/change-path-or-refinement)

This time, I want to change the **`a`** inside a block to **`a/b`**

Using `change`:

    test: [a]
    change test 'a/b

Splits the values into *two*:

    >> test
    == [a b]

Which isn\'t what I want, but rather, as a *single path* `[a/b]`

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Geeky I

The solution is to use `change/only`:

    test: [a]
    change/only test 'a/b

Gives:

    >> test
    == [a/b]

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

`change/only` works, though there is a simpler way in that case:

    >> test: [a]
    == [a]

    >> test/1: 'a/b
    == a/b

    >> test
    == [a/b]

------------------------------------------------------------------------

## Comments on question
