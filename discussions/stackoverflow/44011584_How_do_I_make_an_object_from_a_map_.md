# How do I make an \`object!\` from a \`map!\`

**Link:**
<https://stackoverflow.com/questions/44011584/how-do-i-make-an-object-from-a-map>

**Asked:** 2017-05-16 21:07:03 UTC

------------------------------------------------------------------------

I have a `map!`: `#(a: 1)` and want to convert it to an equivalent
`object!` like: `[a: 1]`.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Dave Andersen

Generate the object spec by converting the map to a block first. The map
keys must all be `word!`s.

    >> object to-block #(a: 5)
    == make object! [
        a: 5
    ]

*Comment by Geeky I:* May or may not be what you\'d expect when you have
stuff nested: `#(a: 5 b: #(c: 3))`

*Comment by Eran W:* you can also use `body-of`

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* Not every map! can be converted to an object:
`object body-of m: #("1" "test")` will generate an empty object, while
`object body-of m: #(a: test)` will fail with
`Script Error: test has no value`
