# How to append data to block from R/S?

**Link:**
<https://stackoverflow.com/questions/62412265/how-to-append-data-to-block-from-r-s>

**Asked:** 2020-06-16 15:36:14 UTC

------------------------------------------------------------------------

I am trying to append data to `block` from Red/System.

    Red []

    my-red-block: ["some text"] ; some already existen data in block

    foo: routine [
        blk
    ]
    [
        block/rs-append as red-block! blk as red-value! unicode/load-utf8 "new text" size? "new text"
    ]

    foo my-red-block

    print my-red-block

I decided to pass `block` to `routine` end modify it there.

I am getting error:

    *** Runtime Error 1: access violation
    *** at: 630EB4DFh

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by 9214

The reason for that is because
[`load-utf8`](https://github.com/red/red/blob/7509ffd29769d1254dc8a9787d3972b5e4b34e85/runtime/unicode.reds#L640){rel="nofollow noreferrer"}
returns a `node!` that references an external string buffer, not the
`string!` value itself.

`node!` is essentially a pointer, and it doesn\'t match the structure of
high-level Red values; however, since it\'s a pointer, it can be casted
to a pointer of another type, like e.g. `red-value!` or any other
struct. The crash happens when you try to access that malformed value
slot.

As for the original question,
[this](https://stackoverflow.com/a/62412324/5889272) should answer it.

------------------------------------------------------------------------

## Comments on question
