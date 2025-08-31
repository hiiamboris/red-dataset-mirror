# What is the difference between \`context\` and \`object\`?

**Link:**
<https://stackoverflow.com/questions/41416193/what-is-the-difference-between-context-and-object>

**Asked:** 2017-01-01 14:28:31 UTC

------------------------------------------------------------------------

In Rebol 3, there are the functions `object` and `context`.

**What\'s the purpose of the difference?**

*Note* : for reference, in red, both are the same, and `object` doesn\'t
exist in rebol 2

### Context: *no pun intended*

Initially, I was wondering why we had `context` instead of
`make object!`

Now, after learning of the `object` word used to make objects, I\'m
curious to know why they are all different and the *rationale* for
having different things to `make` the same thing.

Note that in rebol3:

    object: make function! [[
        "Defines a unique object."
        blk [block!] "Object words and values (modified)"
    ][
        make object! append blk none
    ]]

*It `append`s `none` to the block*. Why? Is this just a minor
difference? Does it deserve a separate question?

In all 3:

    context: make function! [[
        "Defines a unique object."
        blk [block!] "Object words and values (modified)"
    ][
        make object! blk
    ]]

P.S. slight differences in construction between the versions

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by DocKimbel

`context` was historically introduced in Rebol2 as a shortcut to
`make object!`, and to better signify the intent of using the object to
provide a [definitionally
scoped](https://stackoverflow.com/a/21964858/2081311) namespace for
organizing user code.

`object` was added in Rebol3 in order to provide a more natural name for
the shortcut and be more useful when constructing the object dynamically
using `collect-words` for example.

Red should be using the Rebol3 `object` definition, as it provides that
handy extra feature.

------------------------------------------------------------------------

### Answer (score: 3) --- by endo64

`context` and `object` serves same functionality. `context` is from
Rebol2 and I think it is exists in Rebol3 and Red for backward
compatibility.

`object` exists in Rebol3 and Red and almost same (in R3 version it
supports `object [a: b: c:]` style, no big difference)

So you can use any of them. I personally like `context`.

*Comment by Geeky I:* There is the difference in `make`ing in rebol3:
`append blk none` vs `blk`

*Comment by endo64:* I think the only difference is that it support
`object [a: b: c:]` otherwise we should write `object [a: b: c: none]`.
I see no other difference.

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* Note that terminology-wise,
there is opposition to the \"nounishness\" of OBJECT. Object is a good
name for an object itself as opposed to the operation creating them. If
you are naming parameters to functions you then are unlikely to want to
say **function \[object \[object!\]\] \[\...\]** and override the
\"verb\". *(There\'s precedent with FUNCTION, but that\'s based on a
long history of the word, and for that reason some thought to call the
datatype ACTION! so at least a noun doesn\'t overlap a type name.)*
Ren-C is trying CONSTRUCT (arity 2) and HAS (arity 1).
